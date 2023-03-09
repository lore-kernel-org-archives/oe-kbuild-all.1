Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597AA7B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 03:18:09 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8Dx3trwTwlkVjQKAA--.1976S3;
	Thu, 09 Mar 2023 11:18:08 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxHuTpTwlkWhxQAA--.37414S3;
	Thu, 09 Mar 2023 11:18:03 +0800 (CST)
Subject: Re: [PATCH v13 2/2] clk: clk-loongson2: add clock controller driver
 support
From: zhuyinbo <zhuyinbo@loongson.cn>
To: kernel test robot <lkp@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
 Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
 loongson-kernel@lists.loongnix.cn
References: <20230307115022.12846-2-zhuyinbo@loongson.cn>
 <202303082037.QPfBP64A-lkp@intel.com>
 <b94ee1d2-b224-f9d5-3f3c-0096634f4c93@loongson.cn>
Message-ID: <a16ac33d-e313-2eeb-007d-20f61d670308@loongson.cn>
Date: Thu, 9 Mar 2023 11:18:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b94ee1d2-b224-f9d5-3f3c-0096634f4c93@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8AxHuTpTwlkWhxQAA--.37414S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWF18ur13tF17Gr15Wr1ftFb_yoWrAw4xpw
	4ktryUJryFqr18Xr4UKryUXry5tr4DJ3WDJr1UJFyUZrWDZw1jqr4I9F1jgr1DJr4kGryU
	Jr1DXrWxuF17JwUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	ba8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8c_-PUUUUU==


在 2023/3/9 上午10:58, zhuyinbo 写道:
>
> 在 2023/3/8 下午8:16, kernel test robot 写道:
>> Hi Yinbo,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on clk/clk-next]
>> [also build test ERROR on robh/for-next linus/master v6.3-rc1 
>> next-20230308]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url: 
>> https://github.com/intel-lab-lkp/linux/commits/Yinbo-Zhu/clk-clk-loongson2-add-clock-controller-driver-support/20230307-195252
>> base: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git 
>> clk-next
>> patch link: 
>> https://lore.kernel.org/r/20230307115022.12846-2-zhuyinbo%40loongson.cn
>> patch subject: [PATCH v13 2/2] clk: clk-loongson2: add clock 
>> controller driver support
>> config: mips-allyesconfig 
>> (https://download.01.org/0day-ci/archive/20230308/202303082037.QPfBP64A-lkp@intel.com/config)
>> compiler: mips-linux-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>          wget 
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # 
>> https://github.com/intel-lab-lkp/linux/commit/391d6fc63ac65f5456e4755c9dd85232a6296285
>>          git remote add linux-review 
>> https://github.com/intel-lab-lkp/linux
>>          git fetch --no-tags linux-review 
>> Yinbo-Zhu/clk-clk-loongson2-add-clock-controller-driver-support/20230307-195252
>>          git checkout 391d6fc63ac65f5456e4755c9dd85232a6296285
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 
>> make.cross W=1 O=build_dir ARCH=mips olddefconfig
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 
>> make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Link: 
>> https://lore.kernel.org/oe-kbuild-all/202303082037.QPfBP64A-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/clk/clk-loongson2.c: In function 'loongson2_calc_pll_rate':
>>>> drivers/clk/clk-loongson2.c:79:15: error: implicit declaration of 
>>>> function 'readq'; did you mean 'readl'? 
>>>> [-Werror=implicit-function-declaration]
>>        79 |         val = readq(loongson2_pll_base + offset);
>>           |               ^~~~~
>>           |               readl
>>     cc1: some warnings being treated as errors
>
> The CONFIG_64BIT not enabled in your config file, I will add a depend 
> on "CONFIG_64BIT" in my clock driver to fix this compile error.
My clock is for LoongArch platform, The LOONGARCH had select 
"CONFIG_64BIT", I will add a depend on "LOONGARCH" in my clock driver to 
fix this compile error.
>
>>
>>
>> vim +79 drivers/clk/clk-loongson2.c
>>
>>      73
>>      74    static unsigned long loongson2_calc_pll_rate(int offset, 
>> unsigned long rate)
>>      75    {
>>      76        u64 val;
>>      77        u32 mult = 1, div = 1;
>>      78
>>    > 79        val = readq(loongson2_pll_base + offset);
>>      80
>>      81        mult = (val >> LOONGSON2_PLL_MULT_SHIFT) &
>>      82                clk_div_mask(LOONGSON2_PLL_MULT_WIDTH);
>>      83        div = (val >> LOONGSON2_PLL_DIV_SHIFT) &
>>      84                clk_div_mask(LOONGSON2_PLL_DIV_WIDTH);
>>      85
>>      86        return div_u64((u64)rate * mult, div);
>>      87    }
>>      88
>>

