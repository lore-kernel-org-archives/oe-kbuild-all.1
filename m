Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794635028;
	b=rE4BDCwhNAu54ySvz2T7px+5T41TtGo/NAV80z5CpAQOOw31NxoU9aq5/J9YWZGjUXvd
	 H3dlyVwZ+TQBgSYKtbwp9MNO5ygmtSg8RUNidXMv8dL5WqBiZ3enxknYoaLfkxa4ZtmK0
	 qIt/rJZwWml6rrtDWGW5MLE3uTSmYw3aYxrsVcdp0CycEUz2K491Bz32uQ8I8qzsfwQH/
	 Ow3tFVA8a3DCXnbqaJ+rxR6+bWQQZH7KRjNfOyuwF/1Emrb2wgfH4GP68jk06VIeSmuhk
	 9pBJntagbgWReJLNhlZucbQVa69RmEXVsQYFGorcXprwXAXMxrXvangeEO91gjXAU0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794635028;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iEk0s7zmk1MaEaqjFZTaI0zzn/KIGV3kPTgLpNVYEt8=;
	b=SMfjhpagNuLRbUeu4GAaRrTSnnuSWn18FsCe//eqRaSbZ589EsrqeZ8oKlfC58cZv4Hr
	 s7y6zm46+Ihra6agM8BqgWUHmXCawbC23jMstQdcF7xligsKt2MqHAXVCj5FFTRBzrwLP
	 D+N6jHE2TRaHGjRS+eTU1MAy4zgpvjah/m5cD1lO47pxV041PLw1a6pcKrvnTNbdvOJwT
	 ZX85KXF0sTRa0Z81sZooAX+1+HNSGRbCLiTY5T9LQb1tiju2yb6WeeVgVTMhsWUqKxncg
	 uXHSqsdXw7fyb+4KVIUlVS2TZm1x7RpS8G4eTMXI695xrw/BqoAAEyE97r/s00pK7Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rc4M918E;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE42606A327
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 05:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE42606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rc4M918E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794635028; x=1826171028;
  h=date:from:to:cc:subject:message-id;
  bh=z3oBxPuPUUMrH51C9JtQGWyT8uKMmcI01vGUaT4F9Kk=;
  b=Rc4M918ErqOM+FmZ7EvTkaRcHxnTNry8kuTDxHunZLQRZcvopB76FlWD
   FCgKqUvEkkjRp04qSD2ZybfFFmRZEIW4mfxmO/Ye3SBWQXRXup69y7ybb
   z9s1wHCM/ef1TgwArQ3dDiCydNYC01f17OTakKjHDKx8aq9uGSsT+UCJl
   Q7FLYbbaJj8PUGJip1fxOInohJWPCedL8rTKi7YIrzwvIrKEvxsltVL0T
   dx9zpi/9QfxbjWlrZgAy2MXNgoWBtbrJ65gTrBAPE05p/ggXNjD+YW4ob
   ocQoMX7XLC/IniRyQETF5NFPPvgyGfbZ+WtzaZNm63cu6sXKYQDSCB1kt
   Q==;
X-CSE-ConnectionGUID: +v192/h6T4Oc0WI9VghqZg==
X-CSE-MsgGUID: CT1fFoVZRZqTBJ97BrXPmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3485920"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3485920"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 21:43:47 -0800
X-CSE-ConnectionGUID: 2yDowpf3T3+9MmPe6ydp6w==
X-CSE-MsgGUID: 7ZlXR/IsSJaf02JAGNpr5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9349677"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2026 21:43:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS6YB-000000014xF-0sKl;
	Sat, 14 Nov 2026 05:43:43 +0000
Date: Sat, 14 Nov 2026 13:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 416/438]
 arch/x86/include/asm/tlbflush.h:497:46: warning: right shift count >= width
 of type
Message-ID: <202611141319.1yu2bpvN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   8ea0e62cf4d68a895e3152c92a5f6ead6d5c9554
commit: 0efee98d1b3338e5fb967e0805d802cdb7953d42 [416/438] fs: Annotate kill_sb() callbacks with __releases(&sb->s_umount)
config: x86_64-randconfig-1008-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141319.1yu2bpvN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141319.1yu2bpvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141319.1yu2bpvN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/current.h:11,
                    from arch/x86/include/asm/processor.h:17,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from arch/x86/entry/vdso/vdso32/../common/vclock_gettime.c:11,
                    from arch/x86/entry/vdso/vdso32/vclock_gettime.c:1:
   arch/x86/include/asm/tlbflush.h: In function 'cpu_tlbstate_update_lam':
>> arch/x86/include/asm/tlbflush.h:497:46: warning: right shift count >= width of type [-Wshift-count-overflow]
     497 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |                                              ^~
   arch/x86/include/asm/percpu.h:140:69: note: in definition of macro '__raw_cpu_write'
     140 |         *(qual __my_cpu_type(pcp) * __force)__my_cpu_ptr(&(pcp)) = (val);       \
         |                                                                     ^~~
   include/linux/percpu-defs.h:364:25: note: in expansion of macro 'this_cpu_write_1'
     364 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:495:41: note: in expansion of macro '__pcpu_size_call'
     495 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/tlbflush.h:497:9: note: in expansion of macro 'this_cpu_write'
     497 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/tlbflush.h:497:46: warning: right shift count >= width of type [-Wshift-count-overflow]
     497 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |                                              ^~
   arch/x86/include/asm/percpu.h:140:69: note: in definition of macro '__raw_cpu_write'
     140 |         *(qual __my_cpu_type(pcp) * __force)__my_cpu_ptr(&(pcp)) = (val);       \
         |                                                                     ^~~
   include/linux/percpu-defs.h:365:25: note: in expansion of macro 'this_cpu_write_2'
     365 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:495:41: note: in expansion of macro '__pcpu_size_call'
     495 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/tlbflush.h:497:9: note: in expansion of macro 'this_cpu_write'
     497 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/tlbflush.h:497:46: warning: right shift count >= width of type [-Wshift-count-overflow]
     497 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |                                              ^~
   arch/x86/include/asm/percpu.h:140:69: note: in definition of macro '__raw_cpu_write'
     140 |         *(qual __my_cpu_type(pcp) * __force)__my_cpu_ptr(&(pcp)) = (val);       \
         |                                                                     ^~~
   include/linux/percpu-defs.h:366:25: note: in expansion of macro 'this_cpu_write_4'
     366 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:495:41: note: in expansion of macro '__pcpu_size_call'
     495 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/tlbflush.h:497:9: note: in expansion of macro 'this_cpu_write'
     497 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |         ^~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/percpu.h:593:
>> arch/x86/include/asm/tlbflush.h:497:46: warning: right shift count >= width of type [-Wshift-count-overflow]
     497 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |                                              ^~
   include/asm-generic/percpu.h:87:33: note: in definition of macro 'raw_cpu_generic_to_op'
      87 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:412:41: note: in expansion of macro 'this_cpu_generic_to_op'
     412 | #define this_cpu_write_8(pcp, val)      this_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:25: note: in expansion of macro 'this_cpu_write_8'
     367 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:495:41: note: in expansion of macro '__pcpu_size_call'
     495 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/tlbflush.h:497:9: note: in expansion of macro 'this_cpu_write'
     497 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |         ^~~~~~~~~~~~~~


vim +497 arch/x86/include/asm/tlbflush.h

82721d8b25d76c5 Kiryl Shutsemau 2023-03-12  494  
ec225f8c255fd0f Yosry Ahmed     2024-07-02  495  static inline void cpu_tlbstate_update_lam(unsigned long lam, u64 untag_mask)
82721d8b25d76c5 Kiryl Shutsemau 2023-03-12  496  {
ec225f8c255fd0f Yosry Ahmed     2024-07-02 @497  	this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
ec225f8c255fd0f Yosry Ahmed     2024-07-02  498  	this_cpu_write(tlbstate_untag_mask, untag_mask);
82721d8b25d76c5 Kiryl Shutsemau 2023-03-12  499  }
82721d8b25d76c5 Kiryl Shutsemau 2023-03-12  500  

:::::: The code at line 497 was first introduced by commit
:::::: ec225f8c255fd0f256c282cc73d211550cb08b34 x86/mm: Fix LAM inconsistency during context switch

:::::: TO: Yosry Ahmed <yosryahmed@google.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
