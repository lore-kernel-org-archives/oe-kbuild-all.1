Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE23B26B0BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763067671; cv=none; b=dGjKLBJT/ZdSkRHP96/Zi7FHGL/QZTu9bd+hkuaMRo+a07pooouqH64df9WEsTlpyzbWWVjeztgUTDfGpeh9ZElVG3c/GGqDLNFLDCVu1jlJGFwg91HEC8M8E0aLcqcKf+u0Cp0cuEixOF3QEf6k82P23JLaOf+Xz0+T1gQBHWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763067671; c=relaxed/simple;
	bh=wtIPq8QXdo46ka7reUz4HC0ic9mlXfMZefWKmTKgSZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgMvBWBu/dKgSD2r3LLhhItyCZXPFVua6Fm1QoXJIv3QzPB2RR3YR3R6FBpAIAfo265D0drrutl9QNsAhAtVeVxnfP0BZE4GH7arTFwMxrj74kc7jqxYIujQR8V6jrTfSGLvS0MGIEcXgz5lwxDcGOIaxQjwwthDjTybwggaPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwMGHzjn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwMGHzjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763067670; x=1794603670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtIPq8QXdo46ka7reUz4HC0ic9mlXfMZefWKmTKgSZ4=;
  b=lwMGHzjnqKVC2UCNw9KqeuFIExIsr+49Ej/gzoi8v+/1tWBExLAQYqPi
   Ohy8/P1Ada3A+wZIEYUBXSM1lSjLqfAbEDa5ozci+oWRnk6tyJ7EDKa6C
   tAzw0yUOgPkXCcSlBIqo2ojEd9lZEyLBfWSf5chvpANA0iOjxBLSAEomM
   AFfD9+/F7dT4/lnnSSUq0GCvtRPUI8sck1WmS/JP//tVgx5XqV16KFHGE
   Q2Xs7Z46Wqbk2Dwi28iMNxrsZFSVSHfUljmSJzdmZLDiKWoP8GbFyliDJ
   vbQWrEJPEjafmBTHAu8/zQrgtdjXpyYxAxc+xvbL17envpZkHX9FJZsu1
   w==;
X-CSE-ConnectionGUID: sORGG/4DTfyZeX9tSoHFxQ==
X-CSE-MsgGUID: 4Pd/7lbQQW+yQD0OTypHxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75768086"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="75768086"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:01:07 -0800
X-CSE-ConnectionGUID: ZcOesz+iSsC5zz3xoJWX+g==
X-CSE-MsgGUID: +aDHTEYVRXuY8xClFMFYGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="194583584"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2025 13:01:06 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJeRE-0005rY-14;
	Thu, 13 Nov 2025 21:01:04 +0000
Date: Fri, 14 Nov 2025 05:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:gr1 8/10] include/linux/find.h:541:47: error: too many
 arguments provided to function-like macro invocation
Message-ID: <202511140450.71Wolvd2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux gr1
head:   e007560f02c959741536cbd5f8cd927bf0bf6b58
commit: ca959c4d4cb8c7703e76042b9e281067e6a2c4ad [8/10] cpumask: add for_each_cpumask_and_wrap()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251114/202511140450.71Wolvd2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140450.71Wolvd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140450.71Wolvd2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:13:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:11:
>> include/linux/find.h:541:47: error: too many arguments provided to function-like macro invocation
     541 |         bit = find_next_bit(bitmap1, bitmap2, start, n);
         |                                                      ^
   arch/arm/include/asm/bitops.h:205:9: note: macro 'find_next_bit' defined here
     205 | #define find_next_bit(p,sz,off)         _find_next_bit_le(p,sz,off)
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:13:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:11:
>> include/linux/find.h:541:8: error: use of undeclared identifier 'find_next_bit'; did you mean '_find_next_bit'?
     541 |         bit = find_next_bit(bitmap1, bitmap2, start, n);
         |               ^~~~~~~~~~~~~
         |               _find_next_bit
   include/linux/find.h:11:15: note: '_find_next_bit' declared here
      11 | unsigned long _find_next_bit(const unsigned long *addr1, unsigned long nbits,
         |               ^
>> include/linux/find.h:541:6: error: incompatible pointer to integer conversion assigning to 'unsigned long' from 'unsigned long (const unsigned long *, unsigned long, unsigned long)' [-Wint-conversion]
     541 |         bit = find_next_bit(bitmap1, bitmap2, start, n);
         |             ^ ~~~~~~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];


vim +541 include/linux/find.h

   522	
   523	static __always_inline
   524	unsigned long __for_each_and_wrap(const unsigned long *bitmap1, const unsigned long *bitmap2,
   525					  unsigned long size, unsigned long start, unsigned long n)
   526	{
   527		unsigned long bit;
   528	
   529		/* If not wrapped around */
   530		if (n > start) {
   531			/* and have a bit, just return it. */
   532			bit = find_next_and_bit(bitmap1, bitmap2, size, n);
   533			if (bit < size)
   534				return bit;
   535	
   536			/* Otherwise, wrap around and ... */
   537			n = 0;
   538		}
   539	
   540		/* Search the other part. */
 > 541		bit = find_next_bit(bitmap1, bitmap2, start, n);
   542		return bit < start ? bit : size;
   543	}
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
