<?php

class Test extends PHPUnit_Framework_TestCase
{
    public function setUp()
    {

    }

    public function tearDown()
    {

    }

    public function dp_テスト()
    {
        return [
            [true, true]
        ];
    }

    /**
     * @test
     * @dataProvider dp_テスト
     */
    public function テスト($hoge, $expected)
    {
        $this->assertSame($expected, $hoge);
    }
}
