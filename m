Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34E22FE56E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778053972; cv=none; b=Ge0uk7bTnbEeTmdITNGvLJ54CP8f33l3eTibiq8gWRb4OOc2U8ilSIs1WUgNVOj8Zv29C207nmUUxRVFNQJn2RkJSQwHjlU5PPiHbfXhuYoYntNHqZVHMqgmYEuHpr9/mEXftBqW3u78An57Y45qDTDeBFe4AUPVtu77XgEkH18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778053972; c=relaxed/simple;
	bh=FI2DdPWhFbecoyxp/7JFlOlfBBviPgoJND/IIgfobB4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=appgMwfcY54K23c1mFXAyO3Ss6a4E/UgnBosrX3iso+NCFaTLm+K5ANNMYdatlQMc9woKcOBlPzSreI7p6a0cUJGA61pgZvsy9b/kwGXIoj+rXgJTkBXUTZ4Y+C3qh194LexX2dXrIfWaLoXC4hqXjHHuRR4EM52KLC05/fhHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Cx4epO8_pp_QgHAA--.22997S3;
	Wed, 06 May 2026 15:52:46 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxjcJE8_pproh7AA--.36137S3;
	Wed, 06 May 2026 15:52:37 +0800 (CST)
Subject: Re: arch/loongarch/kernel/paravirt.c:15:1: sparse: sparse: symbol
 '__pcpu_scope_steal_time' was not declared. Should it be static?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
References: <202605061313.O8Hswm2b-lkp@intel.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <fdf57e20-2469-e639-509d-897f37a4746b@loongson.cn>
Date: Wed, 6 May 2026 15:49:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202605061313.O8Hswm2b-lkp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxjcJE8_pproh7AA--.36137S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw1fJr4fZry3Jr4rZr4xGrX_yoW5Xry5pF
	y7Arn5Ka1xG3yrAws29rWDuryjy3y7Ww17WFy8Cr15CF4jvr17Kr4vkrsFqFyjqw4vkw1I
	9F4fZryqgF1UZabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UE
	-erUUUUU=



On 2026/5/6 下午1:44, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   74fe02ce122a6103f207d29fafc8b3a53de6abaf
> commit: c43dce6f13fb12144571c168c7a593e5e546f3b5 LoongArch: KVM: Make vcpu_is_preempted() as a macro rather than function
> date:   4 weeks ago
> config: loongarch-randconfig-r134-20260505 (https://download.01.org/0day-ci/archive/20260506/202605061313.O8Hswm2b-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061313.O8Hswm2b-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: c43dce6f13fb ("LoongArch: KVM: Make vcpu_is_preempted() as a macro rather than function")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605061313.O8Hswm2b-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> arch/loongarch/kernel/paravirt.c:15:1: sparse: sparse: symbol '__pcpu_scope_steal_time' was not declared. Should it be static?
with the config file, CONFIG_SMP is not set, Header file 
include/asm/qspinlock.h is not included. In theory varible steal_time 
should be defined with prefix static if CONFIG_SMP is not set, only that 
the code will be a little strange.

Is there any method to avoid warning about static variable declaration?

Regards
Bibo Mao

>     arch/loongarch/kernel/paravirt.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/cpu-features.h, ...):
>     /opt/cross/clang-5bac06718f/lib/clang/23/include/larchintrin.h:202:24: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
>     /opt/cross/clang-5bac06718f/lib/clang/23/include/larchintrin.h:202:11: sparse: sparse: cast from unknown type
>     /opt/cross/clang-5bac06718f/lib/clang/23/include/larchintrin.h:202:11: sparse: sparse: cast from unknown type
> 
> vim +/__pcpu_scope_steal_time +15 arch/loongarch/kernel/paravirt.c
> 
>      11	
>      12	static int has_steal_clock;
>      13	DEFINE_STATIC_KEY_FALSE(virt_preempt_key);
>      14	DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
>    > 15	DEFINE_PER_CPU(struct kvm_steal_time, steal_time) __aligned(64);
>      16	
> 

