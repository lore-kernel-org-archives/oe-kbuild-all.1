Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5618A15AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 01:07:23 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8AxrtrJyA9k0wkMAA--.5230S3;
	Tue, 14 Mar 2023 09:07:21 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxY+XEyA9kgNZWAA--.49244S3;
	Tue, 14 Mar 2023 09:07:21 +0800 (CST)
Subject: Re: [PATCH v13 2/2] clk: clk-loongson2: add clock controller driver
 support
To: Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
 Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
 loongson-kernel@lists.loongnix.cn, zhuyinbo@loongson.cn
References: <20230307115022.12846-2-zhuyinbo@loongson.cn>
 <202303082037.QPfBP64A-lkp@intel.com>
 <b94ee1d2-b224-f9d5-3f3c-0096634f4c93@loongson.cn>
 <ec1fb4d134181a1b1859bcb884dcd494.sboyd@kernel.org>
 <c03e47f7-bb26-0114-b300-357634b0e581@kernel.org>
 <61eee19400e9a45ce9543bfd92a27eaa.sboyd@kernel.org>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <958bfe5b-c7c5-3373-a904-d9a32b428e02@loongson.cn>
Date: Tue, 14 Mar 2023 09:07:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <61eee19400e9a45ce9543bfd92a27eaa.sboyd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8AxY+XEyA9kgNZWAA--.49244S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFWrGr13tFyrGr15Jry8Grg_yoW8GFyDpa
	y7Aa4qkw4vqr1Uury0vr1fuFWay3yxJ3W3Xr1DG3s7ur9Y93s5Kas5K3WxW3y5Jr45Cr43
	X3W8K3y3WF4Yyw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAq
	jxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz4
	8v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
	0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U1tl1PUUUUU==


在 2023/3/14 上午2:20, Stephen Boyd 写道:
> Quoting Krzysztof Kozlowski (2023-03-10 00:42:47)
>> On 10/03/2023 00:47, Stephen Boyd wrote:
>>> Quoting zhuyinbo (2023-03-08 18:58:02)
>>>> 在 2023/3/8 下午8:16, kernel test robot 写道:
>>>>> Hi Yinbo,
>>>>>
>>> [...]
>>>>>      drivers/clk/clk-loongson2.c: In function 'loongson2_calc_pll_rate':
>>>>>>> drivers/clk/clk-loongson2.c:79:15: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
>>>>>         79 |         val = readq(loongson2_pll_base + offset);
>>>>>            |               ^~~~~
>>>>>            |               readl
>>>>>      cc1: some warnings being treated as errors
>>>> The CONFIG_64BIT not enabled in your config file, I will add a depend on
>>>> "CONFIG_64BIT" in my clock driver to fix this compile error.
>>> Do you need to use readq() here? Can you read two 32-bit registers with
>>> readl() and put them together for a 64-bit number?
>> If the platform supports 64-bit reads and these are actually one
>> register, then readq makes sense - code is more readable, smaller, more
>> efficient.
>>
> Please read the section in Documentation/driver-api/device-io.rst about
> hi_lo_readq() and <linux/io-64-nonatomic-lo-hi.h>. We shouldn't need to
> restrict the driver to CONFIG_64BIT. Instead, include one of these
> header files to get the IO access primitives.

okay, I got it.

Thanks your advice!

