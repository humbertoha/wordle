<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Jugador_Palabras".
 *
 * @property int|null $id_jugador
 * @property int|null $id_palabra
 * @property string|null $Datetime_insert
 * @property int|null $intento
 * @property string|null $palabra_enviada
 *
 * @property Jugador $jugador
 * @property Palabras $palabra
 */
class JugadorPalabras extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Jugador_Palabras';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_jugador', 'id_palabra', 'intento','resuelta'], 'integer'],
            [['Datetime_insert'], 'safe'],
            [['palabra_enviada'], 'string', 'max' => 5],
            [['id_jugador'], 'exist', 'skipOnError' => true, 'targetClass' => Jugador::className(), 'targetAttribute' => ['id_jugador' => 'id']],
            [['id_palabra'], 'exist', 'skipOnError' => true, 'targetClass' => Palabras::className(), 'targetAttribute' => ['id_palabra' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_jugador' => 'Id Jugador',
            'id_palabra' => 'Id Palabra',
            'Datetime_insert' => 'Datetime Insert',
            'intento' => 'Intento',
            'palabra_enviada' => 'Palabra Enviada',
            'resuelta'=>'Palabra resuelta'
        ];
    }

    /**
     * Gets query for [[Jugador]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getJugador()
    {
        return $this->hasOne(Jugador::className(), ['id' => 'id_jugador']);
    }

    /**
     * Gets query for [[Palabra]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPalabra()
    {
        return $this->hasOne(Palabras::className(), ['id' => 'id_palabra']);
    }
}
