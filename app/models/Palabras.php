<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "palabras".
 *
 * @property int $id
 * @property string|null $palabra
 *
 * @property JugadorPalabras[] $jugadorPalabras
 */
class Palabras extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'palabras';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['palabra'], 'string', 'max' => 10],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'palabra' => 'Palabra',
        ];
    }

    /**
     * Gets query for [[JugadorPalabras]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getJugadorPalabras()
    {
        return $this->hasMany(JugadorPalabras::className(), ['id_palabra' => 'id']);
    }
}
