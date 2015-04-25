    /**
     * @test
     * @dataProvider dp_テスト
     */
    public function テスト($hoge, $expected)
    {
        $this->assertSame($expected, $hoge);
    }

