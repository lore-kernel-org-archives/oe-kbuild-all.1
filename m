Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BB21428E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 05:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719291614; cv=none; b=VRh9QymM7cXMwu2MDlylkxi2y2mg/rpNm0ii3B5f1nyb2rTccRNMilXdSFFiS3JKkTkFPv3cCG8LMhp5vRG3zRw8y2PN6HPm2Fjj5q7Dh7XJ1IkjnJUlrvq/0ipXU+CNjV3Fr5XkJ+vblsAb45wmifgvCcEpPYBNZPNkP8q2rQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719291614; c=relaxed/simple;
	bh=cqskFif9wifooZyCCXSZIdmTNWOCNUjY/g4WRpmUwu8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bqdw30U65siSo733czoUvXJJdd0Q+RfwUjBbvAD73ClPRXN6iMUGot4FuCQKqosJwzy5Oj/XbAnWVtTwhrhYZgGOGZHydtxjZFTxkL/NAYzkW9NWJ6Ok9BDhstDzn+a+g1q+n4sMXxzrccJ/RgW+byXqhrqeoXJ6oW4Z0MLTKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8DxSurYTnpmKcEJAA--.39773S3;
	Tue, 25 Jun 2024 13:00:08 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxDMfTTnpmtxcwAA--.49065S3;
	Tue, 25 Jun 2024 13:00:05 +0800 (CST)
Subject: Re: [tip:irq/core 39/46] drivers/irqchip/irq-loongarch-avec.c:82:17:
 error: implicit declaration of function 'loongson_send_ipi_single'
To: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Jianmin Lv <lvjianmin@loongson.cn>,
 Liupu Wang <wangliupu@loongson.cn>
References: <202406240451.ygBFNyJ3-lkp@intel.com> <87sex28nef.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <d1c1bac7-7421-8e17-a364-dc44e77f4315@loongson.cn>
Date: Tue, 25 Jun 2024 13:00:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87sex28nef.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8AxDMfTTnpmtxcwAA--.49065S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJF4ftw4xZr1fKr1rCw47Jrc_yoW5Gr1Dpa
	yUZas0krWrJr18t3srK345ZFyjyayfK342ka97Jw1xurWUAr97WF4SyFZ0gF1xZws7Kw42
	9r12qFyYvF1UAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
	Z7UUUUU==

Hi, Thomas

在 2024/6/24 下午9:45, Thomas Gleixner 写道:
> On Mon, Jun 24 2024 at 05:06, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
>> head:   c9d269469d2b9a06559cdc84d12dd3fb4d552581
>> commit: 760d7e719499d64beea62bfcf53938fb233bb6e7 [39/46] Loongarch: Support loongarch avec
>> config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240624/202406240451.ygBFNyJ3-lkp@intel.com/config)
>> compiler: loongarch64-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406240451.ygBFNyJ3-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202406240451.ygBFNyJ3-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/irqchip/irq-loongarch-avec.c: In function 'loongarch_avec_sync':
>>>> drivers/irqchip/irq-loongarch-avec.c:82:17: error: implicit declaration of function 'loongson_send_ipi_single' [-Werror=implicit-function-declaration]
>>        82 |                 loongson_send_ipi_single(adata->prev_cpu, SMP_CLEAR_VECT);
>>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>>>> drivers/irqchip/irq-loongarch-avec.c:82:59: error: 'SMP_CLEAR_VECT' undeclared (first use in this function)
>>        82 |                 loongson_send_ipi_single(adata->prev_cpu, SMP_CLEAR_VECT);
>>           |                                                           ^~~~~~~~~~~~~~
>>     drivers/irqchip/irq-loongarch-avec.c:82:59: note: each undeclared identifier is reported only once for each function it appears in
>>     drivers/irqchip/irq-loongarch-avec.c: In function 'complete_irq_moving':
>>     drivers/irqchip/irq-loongarch-avec.c:173:55: error: 'SMP_CLEAR_VECT' undeclared (first use in this function)
>>       173 |                         loongson_send_ipi_single(cpu, SMP_CLEAR_VECT);
>>           |                                                       ^~~~~~~~~~~~~~
> So this code was never built with CONFIG_SMP=n.
>
> Can the loongson folks please send me a delta patch ASAP, otherwise I'm
> going to revert it.
>
> Thanks,
>
>          tglx

We have also noticed this issue and found that the patch has other 
issues that may cause it to fail to start on a certain model of machine.
If possible, please reverse this patch and we will resend a V2 version 
patch as soon as possible based on this patch

Thanks you

             Tianyang

