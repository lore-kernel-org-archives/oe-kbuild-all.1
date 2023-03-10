Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0972103
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 08:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA57BC433D2;
	Fri, 10 Mar 2023 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678437772;
	bh=vyK0l8/7QBS4rIiFD7Hkw5agnLbdavaBpCLzBjba6RE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dsGWnk+n7nYa9XNJasSdXRAjbYKTJ/LTJ6rF+XpxCGZDPrauvNWjsJ00JJBvjKO1n
	 cYGN9vgkNtvM0jeOF2fIi0WujUrMEjLcPKicNidz56kxwqFgGBCxSnQ+3kmncH3vgC
	 T9XpXDTnAPx1y4tzri+avqVuHdESZ6IIEFv3BntEjvDF4EgtGCDD/ftTAiTWLpHW4X
	 t9T5FjeeQ0+ToBev+0s02jP9Lt6/qUhG3airgdq8V7SNHAZseD0jbLu2volXe2sS6O
	 JXWiGYkQYSfYycc4lKcajjsdqlVC0KFGsZva3wvLXCh8patiRTFE2F/FEQd4EQL5iq
	 GhNMeeP3egOoA==
Message-ID: <c03e47f7-bb26-0114-b300-357634b0e581@kernel.org>
Date: Fri, 10 Mar 2023 09:42:47 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 2/2] clk: clk-loongson2: add clock controller driver
 support
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhuyinbo <zhuyinbo@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
 Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
 loongson-kernel@lists.loongnix.cn
References: <20230307115022.12846-2-zhuyinbo@loongson.cn>
 <202303082037.QPfBP64A-lkp@intel.com>
 <b94ee1d2-b224-f9d5-3f3c-0096634f4c93@loongson.cn>
 <ec1fb4d134181a1b1859bcb884dcd494.sboyd@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ec1fb4d134181a1b1859bcb884dcd494.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/03/2023 00:47, Stephen Boyd wrote:
> Quoting zhuyinbo (2023-03-08 18:58:02)
>>
>> 在 2023/3/8 下午8:16, kernel test robot 写道:
>>> Hi Yinbo,
>>>
> [...]
>>>
>>>     drivers/clk/clk-loongson2.c: In function 'loongson2_calc_pll_rate':
>>>>> drivers/clk/clk-loongson2.c:79:15: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
>>>        79 |         val = readq(loongson2_pll_base + offset);
>>>           |               ^~~~~
>>>           |               readl
>>>     cc1: some warnings being treated as errors
>>
>> The CONFIG_64BIT not enabled in your config file, I will add a depend on 
>> "CONFIG_64BIT" in my clock driver to fix this compile error.
> 
> Do you need to use readq() here? Can you read two 32-bit registers with
> readl() and put them together for a 64-bit number?

If the platform supports 64-bit reads and these are actually one
register, then readq makes sense - code is more readable, smaller, more
efficient.

Best regards,
Krzysztof

