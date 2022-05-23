<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Jugador".
 *
 * @property int $id
 * @property string|null $jugador
 *
 * @property JugadorPalabras[] $jugadorPalabras
 */
class Jugador extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Jugador';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['jugador'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'jugador' => 'Jugador',
        ];
    }

    /**
     * Gets query for [[JugadorPalabras]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getJugadorPalabras()
    {
        return $this->hasMany(JugadorPalabras::className(), ['id_jugador' => 'id']);
    }
}
