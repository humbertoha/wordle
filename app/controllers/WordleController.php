<?php

namespace app\controllers;
use app\models\Palabras;
use app\models\Jugador;
use app\models\JugadorPalabras;
use yii\db\Expression as Expression;

class WordleController extends \yii\web\Controller
{
    public $enableCsrfValidation = false;

    public function actionIndex()
    {   
        $model="Envia un usuario";

        if (\Yii::$app->request->isPost) {
            $post = \Yii::$app->request->post('id_jugador');
            $max = Palabras::find()->count();
            $offset = rand(1,$max);
            $model = Palabras::findOne($offset);
            $juego = New JugadorPalabras();
            $juego->id_jugador = $post;
            $juego->id_palabra = $model->id;
            $juego->intento = 0 ;
            $juego->save();
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        }
        return $model;
    }

    public function actionTurno()
    {   
        $respuesta = "";
        if (\Yii::$app->request->isPost) {
            $id_jugador = \Yii::$app->request->post('id_jugador');
            $id_palabra = \Yii::$app->request->post('id_palabra');
            $user_word = \Yii::$app->request->post('user_word');
            $juego_inicio =JugadorPalabras::find()->where(["id_palabra"=>$id_palabra,"id_jugador"=>$id_jugador,"resuelta"=>0])->andWhere([">=","Datetime_insert",new Expression('NOW() - interval 5 MINUTE')])->andWhere(["<","intento",5])->orderBy(['Datetime_insert'=> SORT_DESC])->all();
            if(count($juego_inicio) > 0){
                $last=end($juego_inicio);
                $conteo = $last->intento;
                $model = Palabras::findOne($juego_intento->id_palabra);
                $diferencias = WordleController::compareIntentos($model->palabra,$user_word);
                $respuesta = $diferencias;
                $juego_intento = New JugadorPalabras();
                $juego_intento->id_jugador = $last->id_jugador;
                $juego_intento->id_palabra = $last->id_palabra;
                $juego_intento->intento = $conteo+1 ;
                $juego_intento->palabra_enviada = $user_word;
                if(count($respuesta)==0){
                    $juego_intento->resuelta = 1;
                }
                $juego_intento->save();
            }else{
                $respuesta = "No tiene palabra en juego se termino el tiempo o termino la palabra";
            }
            
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        }
        return $respuesta;

    }



    public function compareIntentos($palabra_uno,$palabra_dos){
        $arr1 = str_split($palabra_uno);
        $arr1cp = $arr1;
        $arr2 = str_split($palabra_dos);
        $diff = array_intersect_assoc($arr1, $arr2);
        $regre = [];
        foreach($diff as $key => $valor){
            $regre[] = ["letter"=>$valor,"value"=>1];
            unset($arr2[$key]);
        }
        foreach($arr2 as $key => $valor){
            if(in_array($valor,$arr1cp) ){
                $regre[] = ["letter"=>$valor,"value"=>2];
            }else{
                $regre[] = ["letter"=>$valor,"value"=>3]; 
            }
        }
        return $regre;   
    }

    public function actionJugadorpartidas()
    {   
        $respuesta = "";
        if (\Yii::$app->request->isPost) {
            $id_jugador = \Yii::$app->request->post('id_jugador');
            $juego_inicio =JugadorPalabras::find()->where(["id_jugador"=>$id_jugador,"intento"=>0])->all();
            if(count($juego_inicio) > 0){
                $respuesta["juegos"] = count($juego_inicio);
                $juego_inicio =JugadorPalabras::find()->where(["id_jugador"=>$id_jugador,"resuelta"=>1])->all();
                $respuesta["juegos_ganados"] = count($juego_inicio);

            }else{
                $respuesta = "No envio jugador";
            }
            
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        }
        return $respuesta;

    }
}
