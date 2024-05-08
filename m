Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28AA129E94
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715182699; cv=none; b=Kx0DORGz0bLzN35gXhFUBeHI70UO2K8NlEUHF1rpV7tsawRutA7rXO/53i/RFignqqPVMdG4SqLGK8TSNL9i66KFt8dIgyZNF1NNbsGOYxlKT6RnKl9KUu/hn5855NJ58uzIC2MpIaGEqyFGmgPMz9ToEQ7EhcjoFImHcSMxLIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715182699; c=relaxed/simple;
	bh=1IZAKEtvxTeuJKb2/Fdb7fHC0eNIPDpVXOwhejl8isQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kogku2faotffzQ6CGOqqC5XoidSGhQl0h7RvVjKpEgE3Mc0TKpbv4/fjHJFmIKvB6BwWzmCzH8RCVq0KeuF1hh+MzbWulr2BEJo6uz2ad5h9DyTJQxEpHCbo4NCY7zPnJZCsbDMPVmgK3OYPHuxkMB3w4OOJqOl6IwwEv7zCqJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E42E1007;
	Wed,  8 May 2024 08:38:29 -0700 (PDT)
Received: from [10.57.67.194] (unknown [10.57.67.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C02F53F641;
	Wed,  8 May 2024 08:38:02 -0700 (PDT)
Message-ID: <10cd4b97-d780-4524-a0ee-89f26a7897fc@arm.com>
Date: Wed, 8 May 2024 16:38:01 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 10159/12060]
 arch/arm64/include/asm/pgtable.h:1102:16: error: implicit declaration of
 function 'pud_valid'; did you mean 'pmd_valid'?
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>, Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <202405082221.43rfWxz5-lkp@intel.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <202405082221.43rfWxz5-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2024 15:24, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e7b4ef8fffaca247809337bb78daceb406659f2d
> commit: f0f5863a0fb0fb48a5881c3f6acca1958899dd76 [10159/12060] arm64/mm: Remove PTE_PROT_NONE bit
> config: arm64-randconfig-r013-20230528 (https://download.01.org/0day-ci/archive/20240508/202405082221.43rfWxz5-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082221.43rfWxz5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405082221.43rfWxz5-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/pgtable.h:6,
>                     from arch/arm64/include/asm/io.h:12,
>                     from include/linux/io.h:13,
>                     from include/linux/irq.h:20,
>                     from include/asm-generic/hardirq.h:17,
>                     from arch/arm64/include/asm/hardirq.h:17,
>                     from include/linux/hardirq.h:11,
>                     from include/linux/interrupt.h:11,
>                     from include/linux/trace_recursion.h:5,
>                     from include/linux/ftrace.h:10,
>                     from arch/arm64/kernel/asm-offsets.c:12:
>    arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
>>> arch/arm64/include/asm/pgtable.h:1102:16: error: implicit declaration of function 'pud_valid'; did you mean 'pmd_valid'? [-Werror=implicit-function-declaration]
>     1102 |         return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
>          |                ^~~~~~~~~
>          |                pmd_valid

Hi Will,

Looks like this is due to pud_valid() not being defined for
CONFIG_PGTABLE_LEVELS <= 2. Seems to me that this is the cleanest solution. But
pgtable folding breaks my brain so perhaps there is a better way?

What's the process here? Can you just merge this into the broken patch, or do I
need to re-post the series, or post a fix patch formally?

--8<----

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c60dcb455ebd..f8efbc128446 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -810,6 +810,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)

 #else

+#define pud_valid(pud)         false
 #define pud_page_paddr(pud)    ({ BUILD_BUG(); 0; })
 #define pud_user_exec(pud)     pud_user(pud) /* Always 0 with folding */

--8<----

Thanks,
Ryan


>    cc1: some warnings being treated as errors
>    make[3]: *** [scripts/Makefile.build:117: arch/arm64/kernel/asm-offsets.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1197: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:240: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:240: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +1102 arch/arm64/include/asm/pgtable.h
> 
>   1099	
>   1100	static inline bool pud_user_accessible_page(pud_t pud)
>   1101	{
>> 1102		return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
>   1103	}
>   1104	#endif
>   1105	
> 

