Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270213;
	b=rSQD2E8maotmOM3PDhyJypAZhZ6t7gUB2ia1ME8p9dtigyzKbPRMcgFJg0pnoEzQ5yY3
	 TUm8mZeS0RW7AYr3kq4uWwFDCe7HV7NnWJBPuI6WsDXpGPjBS7J60sFUjX0Z8q1ETzrjs
	 KGLy/8KZgivB9tcj+8NCpszTxZt1je1mJ8VIDPifpbCFIn+0VJpXn5rJE94pvAde48TKR
	 erfx1xbR/WJxwRbrSjVbvCenLSiRUS5k6FzqK0/dAxw5UZTSVL98lslatBNI0mBRoUhwn
	 bXWJvTw17oyZ2yBhcxO9ICoEq741f/8+3tL0aozPRZoZITPgYIKTjssqri/nirhbeGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270213;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gg/PeMknP4dw6ta08iXN88+V05Fye6MfUbOJnkjNtys=;
	b=ojy2x9QiuTLIcHIQuXudV2XVeX/Jtl9fQ2PlJ7TwAZR4fO1blpnH2kfTFq8Ipu2NjDDS
	 3356JA8J8o/2bax+MleRYiAxPdUXWMdK75wm1ncC5nzmejf21mSPvdCs2Hc4lnQO/A6kO
	 4ape6Zvs9k2KbwyrnmENXXeXmo1CFAljRT19SWUbcICLuDuXYBggndDZ55drkJDCBZX/6
	 9e7OyW2Et/6m2LZfaWYVzvGHX+4fGuxmtbx3ExPCvzNJwI4wJWNZz7qAEEtIMJPTQtTmt
	 7GpD8095USMB5TAyFiaugqJE1zL1jIdkHMnWdBEQPy0uBLtEgZJl7v1IXr+vnv7Ia9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MvJZGbKu;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B78606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 10:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B78606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MvJZGbKu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793270210; x=1824806210;
  h=date:from:to:cc:subject:message-id;
  bh=pLGgYu8hRiL+fYOb4k7no/WYitljCs2oFYUqaoVGDGI=;
  b=MvJZGbKuQwZuzKhbfPniZFwZfiNUIE6yO7ScstPp+4JW7cg1WBshVB23
   ozxryBwkZ5ts6xNlIDsIY0vu8nqvsVkBAQAJBNiokQ+7H4XajkwwZ7sBH
   RC8/2vHXPjlLQDVMxjQIG70USfNUMUKHyhtnrYhuSjrkOM7nVyCCABsmI
   0OPohtGy4YJKIj/IYHBko8RGjN1dzHBNM7ZUX6IiLXHbY6L3WTVGK/Zoj
   Nu8HXy+ZioJkogEwfDNRvqZRY7VkoNsopgCwJlFISgF0WR/HZnma2iV5J
   hpyFaIUOufEs1HZFfhc+NJOdbk4T+cWE870e2DK6k6zDeKV96b/Vg6ujn
   g==;
X-CSE-ConnectionGUID: bvcwGkNVQ0W18h4hrfLYww==
X-CSE-MsgGUID: SF+jclBARz+11PlWp/lrVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2112931"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2112931"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 03:36:49 -0700
X-CSE-ConnectionGUID: iJuH8U8gTsuhaDAWObwPVQ==
X-CSE-MsgGUID: BPjWlS47RkaIRztBe6yCVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5503669"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2026 03:36:48 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMNUz-00000000ZzM-2Qq7;
	Thu, 29 Oct 2026 10:36:45 +0000
Date: Thu, 29 Oct 2026 18:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 2/2]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for
 function '__pkvm_unmask_serror'
Message-ID: <202610291832.3nNqrObh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   606d03f6372c0cd085fc0d154cbfc17c298058f2
commit: a08dde8a50c098a8002175044a68f63a9de16a53 [2/2] ANDROID: KVM: arm64: Add pKVM module register_unmask_serror
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261029/202610291832.3nNqrObh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291832.3nNqrObh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291832.3nNqrObh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for function '__pkvm_unmask_serror' [-Wmissing-prototypes]
      56 | void __pkvm_unmask_serror(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | void __pkvm_unmask_serror(void)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     455 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     456 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:457:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     457 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:458:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     458 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:459:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     459 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     464 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     465 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     466 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     467 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:468:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     468 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     477 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:28: note: previous initialization is here

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/__pkvm_unmask_serror +56 arch/arm64/kvm/hyp/nvhe/hyp-main.c

    55	
  > 56	void __pkvm_unmask_serror(void)
    57	{
    58		u64 hcr = read_sysreg(HCR_EL2);
    59	
    60		if (!unmask_serror || !unmask_serror())
    61			return;
    62	
    63		write_sysreg(hcr | HCR_AMO, HCR_EL2);
    64		asm volatile("msr daifclr, #4");
    65		isb();
    66	}
    67	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
