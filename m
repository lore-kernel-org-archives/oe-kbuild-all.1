Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD81185D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 06:24:29 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxqOqZyNlkQ_sXAA--.39849S3;
	Mon, 14 Aug 2023 14:24:25 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxbSOVyNlklH9ZAA--.40559S3;
	Mon, 14 Aug 2023 14:24:22 +0800 (CST)
Subject: Re: [PATCH v2 1/3] MIPS: Remove noreturn attribute for die()
To: kernel test robot <lkp@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1691985181-28363-2-git-send-email-yangtiezhu@loongson.cn>
 <202308141322.sZl3fv7u-lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <77eb2d4e-29ce-e98a-a6b7-952eb71b6ffe@loongson.cn>
Date: Mon, 14 Aug 2023 14:24:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202308141322.sZl3fv7u-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8CxbSOVyNlklH9ZAA--.40559S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF45Aw4UCryDAF13KF48AFc_yoW8Cr4Dpa
	yrWan8Kr4rWr1xGayxK3y7ZF42gan5Ary3Wr1DXr18Za90vFWkGw4Igr4UXry3Kr1DKa4r
	Xr9Fvrs8K34qy3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jn
	UUUUUUUU=



On 08/14/2023 01:24 PM, kernel test robot wrote:
> Hi Tiezhu,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.5-rc6 next-20230809]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Tiezhu-Yang/MIPS-Remove-noreturn-attribute-for-die/20230814-115513
> base:   linus/master
> patch link:    https://lore.kernel.org/r/1691985181-28363-2-git-send-email-yangtiezhu%40loongson.cn
> patch subject: [PATCH v2 1/3] MIPS: Remove noreturn attribute for die()
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230814/202308141322.sZl3fv7u-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230814/202308141322.sZl3fv7u-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308141322.sZl3fv7u-lkp@intel.com/
>

...

>    arch/mips/kernel/traps.c: In function 'die':
>>> arch/mips/kernel/traps.c:426:1: warning: 'noreturn' function does return
>      426 | }
>          | ^

Thanks for your report, the follow up patch #2 of this patch series
can silence the above warning.

[PATCH v2 2/3] MIPS: Modify the declaration for die()
https://lore.kernel.org/all/1691985181-28363-3-git-send-email-yangtiezhu@loongson.cn/

Thanks,
Tiezhu

