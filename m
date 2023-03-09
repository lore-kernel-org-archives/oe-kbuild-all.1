Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB0F7E6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 06:27:42 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8CxidlcfAlkaEMKAA--.1962S3;
	Thu, 09 Mar 2023 14:27:40 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxPuRSfAlkbT1QAA--.39752S3;
	Thu, 09 Mar 2023 14:27:35 +0800 (CST)
Subject: Re: [PATCH v13 2/2] clk: clk-loongson2: add clock controller driver
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot <lkp@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, zhuyinbo@loongson.cn,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
 Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
 loongson-kernel@lists.loongnix.cn
References: <20230307115022.12846-2-zhuyinbo@loongson.cn>
 <202303082037.QPfBP64A-lkp@intel.com>
 <b94ee1d2-b224-f9d5-3f3c-0096634f4c93@loongson.cn>
 <a16ac33d-e313-2eeb-007d-20f61d670308@loongson.cn>
 <6180156d-109c-2f41-69ee-0a854dc3772e@kernel.org>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <e51a23e5-ad69-d415-860f-3a9ab38bfbe9@loongson.cn>
Date: Thu, 9 Mar 2023 14:27:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6180156d-109c-2f41-69ee-0a854dc3772e@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8CxPuRSfAlkbT1QAA--.39752S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCFWftF4DKF1kuw4rGFWxJFb_yoWrAry7pF
	48JFZFyryrXr10qrW8Kr1DWryYqr4DJ3WUXr1DGF1xZFZFvw1Ygr409r1jgr1DWrs3GrWU
	Jrn5XryxuF1UJrUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8c_-PUUUUU==


在 2023/3/9 下午2:09, Krzysztof Kozlowski 写道:
> On 09/03/2023 04:18, zhuyinbo wrote:
>> 在 2023/3/9 上午10:58, zhuyinbo 写道:
>>> 在 2023/3/8 下午8:16, kernel test robot 写道:
>>>> Hi Yinbo,
>>>>
>>>> I love your patch! Yet something to improve:
>>>>
>>>> [auto build test ERROR on clk/clk-next]
>>>> [also build test ERROR on robh/for-next linus/master v6.3-rc1
>>>> next-20230308]
>>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>
>>>> url:
>>>> https://github.com/intel-lab-lkp/linux/commits/Yinbo-Zhu/clk-clk-loongson2-add-clock-controller-driver-support/20230307-195252
>>>> base: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
>>>> clk-next
>>>> patch link:
>>>> https://lore.kernel.org/r/20230307115022.12846-2-zhuyinbo%40loongson.cn
>>>> patch subject: [PATCH v13 2/2] clk: clk-loongson2: add clock
>>>> controller driver support
>>>> config: mips-allyesconfig
>>>> (https://download.01.org/0day-ci/archive/20230308/202303082037.QPfBP64A-lkp@intel.com/config)
>>>> compiler: mips-linux-gcc (GCC) 12.1.0
>>>> reproduce (this is a W=1 build):
>>>>           wget
>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>>>> -O ~/bin/make.cross
>>>>           chmod +x ~/bin/make.cross
>>>>           #
>>>> https://github.com/intel-lab-lkp/linux/commit/391d6fc63ac65f5456e4755c9dd85232a6296285
>>>>           git remote add linux-review
>>>> https://github.com/intel-lab-lkp/linux
>>>>           git fetch --no-tags linux-review
>>>> Yinbo-Zhu/clk-clk-loongson2-add-clock-controller-driver-support/20230307-195252
>>>>           git checkout 391d6fc63ac65f5456e4755c9dd85232a6296285
>>>>           # save the config file
>>>>           mkdir build_dir && cp config build_dir/.config
>>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0
>>>> make.cross W=1 O=build_dir ARCH=mips olddefconfig
>>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0
>>>> make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/
>>>>
>>>> If you fix the issue, kindly add following tag where applicable
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Link:
>>>> https://lore.kernel.org/oe-kbuild-all/202303082037.QPfBP64A-lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>      drivers/clk/clk-loongson2.c: In function 'loongson2_calc_pll_rate':
>>>>>> drivers/clk/clk-loongson2.c:79:15: error: implicit declaration of
>>>>>> function 'readq'; did you mean 'readl'?
>>>>>> [-Werror=implicit-function-declaration]
>>>>         79 |         val = readq(loongson2_pll_base + offset);
>>>>            |               ^~~~~
>>>>            |               readl
>>>>      cc1: some warnings being treated as errors
>>> The CONFIG_64BIT not enabled in your config file, I will add a depend
>>> on "CONFIG_64BIT" in my clock driver to fix this compile error.
>> My clock is for LoongArch platform, The LOONGARCH had select
>> "CONFIG_64BIT", I will add a depend on "LOONGARCH" in my clock driver to
>> fix this compile error.
> No. Fix your code instead.

but the readq that ask CONFIG_64BIT is enabled,  definition in 
include/asm-generic/io.h

so need enable CONFIG_64BIT for my clk driver.


#ifdef CONFIG_64BIT
#ifndef readq
#define readq readq
static inline u64 readq(const volatile void __iomem *addr)
{
         u64 val;

         __io_br();
         val = __le64_to_cpu(__raw_readq(addr));
         __io_ar();
         return val;
}
#endif
#endif /* CONFIG_64BIT */

>
> Best regards,
> Krzysztof

