Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33A492E58
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454074; cv=none; b=dxvmCSRDdj/0ssQvinSJgtdesWnKNFdWEihxyLZrpwgYb6ATjCp3cMmbxmeHs/OG9W09Rj7dkkWf8rdGsaR1JFn54uO5eWnFV7/ryJQJ2SQNdUoPaRpmVBHfuv+W7v+bf8RWqyK+rLvwrp9W33yGhlZYs4N6dL1kT86s67iUIu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454074; c=relaxed/simple;
	bh=qW6dndnsQcq7duluCd+FGIZgQbEEO6Pue6Pv+Y7Ckso=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfdR33oUXjCspmRK8zhMYH+2HLYPUglhQ04UAuh4re9ZI5amaxs8QF4nBxmm1YY9NsD7OUPEk3c7KEFQ3ffvnK3k9CVqSJivg7Pzp5pmxM0kLb7JOATJzRRzagddiUGXwPigSS7msAxWOUD0ix+HAWVlTgStldc6VaBFubNJjUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBVIREzj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBVIREzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791454069; x=1822990069;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=qW6dndnsQcq7duluCd+FGIZgQbEEO6Pue6Pv+Y7Ckso=;
  b=BBVIREzjOf4M0OIeZFIqPCJEiFV82Sa3oC1m3n/DWiZWc4spL1jsHjeT
   RMIWvKYu6d7V3ujbZXZpF7wI56YXDEEMARlK/7Q81w7b2fdWFZ+5GAgf9
   MoUy6aHQ2+7gckDM6xrpXwjQFnSTSmauE+35TAG2vsYyTe7EZixeiVPeu
   rbo3uHkrYxYMFjxI2z3Zz58CkJTnJlrbyoQdFlnNcYuRs8wNiRNHW6nRU
   ERbGaxVaOwICQAJBlONLcAmDrZ22ZBV2m0F2Jl3Qw731YbRCa7IDA5t2X
   zRxlXsw+25VKy1RT4lK9VBkOO2kEBosFBE/eii7F9guzK/pmjsImOppdx
   Q==;
X-CSE-ConnectionGUID: BplBYb7hQtuYqTS6gKdGiQ==
X-CSE-MsgGUID: 4Gf0d86KS/ubjqSjETCXXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="131111"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="131111"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 03:07:48 -0700
X-CSE-ConnectionGUID: DOfZXdDRSHCXCHLxTGwmwQ==
X-CSE-MsgGUID: nCVTFzUsQx+Uy2NxdOOasQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1745982"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 08 Oct 2026 03:07:47 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEl2P-000000005G3-07Ey
	for oe-kbuild-all@lists.linux.dev;
	Thu, 08 Oct 2026 10:07:45 +0000
Date: Thu, 8 Oct 2026 12:06:52 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Message-ID: <202610081201.nt1PgAFz-lkp@intel.com>
References: <202610081201.nt1PgAFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610081201.nt1PgAFz-lkp@intel.com>

Hi Karl,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Karl-Mehltretter/ARM-cmpxchg-support-2-byte-xchg-on-pre-ARMv6-CPUs/20261003-113826
base:   
patch link:    https://lore.kernel.org/r/202610081201.nt1PgAFz-lkp%40intel.com
config: arm-randconfig-r2309-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081201.nt1PgAFz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081201.nt1PgAFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081201.nt1PgAFz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/atomic64_test.c: note: in included file (through arch/arm/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/arm/include/asm/bitops.h, ...):
>> arch/arm/include/asm/cmpxchg.h:114:51: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> arch/arm/include/asm/cmpxchg.h:114:51: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> arch/arm/include/asm/cmpxchg.h:114:51: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> arch/arm/include/asm/cmpxchg.h:114:51: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)

vim +114 arch/arm/include/asm/cmpxchg.h

    39	
    40		prefetchw((const void *)ptr);
    41	
    42		switch (size) {
    43	#if __LINUX_ARM_ARCH__ >= 6
    44	#ifndef CONFIG_CPU_V6 /* MIN ARCH >= V6K */
    45		case 1:
    46			asm volatile("@	__xchg1\n"
    47			"1:	ldrexb	%0, [%3]\n"
    48			"	strexb	%1, %2, [%3]\n"
    49			"	teq	%1, #0\n"
    50			"	bne	1b"
    51				: "=&r" (ret), "=&r" (tmp)
    52				: "r" (x), "r" (ptr)
    53				: "memory", "cc");
    54			break;
    55		case 2:
    56			asm volatile("@	__xchg2\n"
    57			"1:	ldrexh	%0, [%3]\n"
    58			"	strexh	%1, %2, [%3]\n"
    59			"	teq	%1, #0\n"
    60			"	bne	1b"
    61				: "=&r" (ret), "=&r" (tmp)
    62				: "r" (x), "r" (ptr)
    63				: "memory", "cc");
    64			break;
    65	#endif
    66		case 4:
    67			asm volatile("@	__xchg4\n"
    68			"1:	ldrex	%0, [%3]\n"
    69			"	strex	%1, %2, [%3]\n"
    70			"	teq	%1, #0\n"
    71			"	bne	1b"
    72				: "=&r" (ret), "=&r" (tmp)
    73				: "r" (x), "r" (ptr)
    74				: "memory", "cc");
    75			break;
    76	#elif defined(swp_is_buggy)
    77	#ifdef CONFIG_SMP
    78	#error SMP is not supported on this platform
    79	#endif
    80		case 1:
    81			raw_local_irq_save(flags);
    82			ret = *(volatile unsigned char *)ptr;
    83			*(volatile unsigned char *)ptr = x;
    84			raw_local_irq_restore(flags);
    85			break;
    86	
    87		case 4:
    88			raw_local_irq_save(flags);
    89			ret = *(volatile unsigned long *)ptr;
    90			*(volatile unsigned long *)ptr = x;
    91			raw_local_irq_restore(flags);
    92			break;
    93	#else
    94		case 1:
    95			asm volatile("@	__xchg1\n"
    96			"	swpb	%0, %1, [%2]"
    97				: "=&r" (ret)
    98				: "r" (x), "r" (ptr)
    99				: "memory", "cc");
   100			break;
   101		case 4:
   102			asm volatile("@	__xchg4\n"
   103			"	swp	%0, %1, [%2]"
   104				: "=&r" (ret)
   105				: "r" (x), "r" (ptr)
   106				: "memory", "cc");
   107			break;
   108	#endif
   109	#if __LINUX_ARM_ARCH__ < 6
   110		case 2:
   111			/* swp has no halfword form. Pre-ARMv6 is never SMP. */
   112			raw_local_irq_save(flags);
   113			ret = *(volatile unsigned short *)ptr;
 > 114			*(volatile unsigned short *)ptr = x;
   115			raw_local_irq_restore(flags);
   116			break;
   117	#endif
   118		default:
   119			/* Cause a link-time error, the xchg() size is not supported */
   120			__bad_xchg(ptr, size), ret = 0;
   121			break;
   122		}
   123	
   124		return ret;
   125	}
   126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
