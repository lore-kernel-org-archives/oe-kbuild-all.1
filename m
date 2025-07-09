Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CA220FA9C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752085988; cv=none; b=FfJO3FGLrOW/0dsDzWWofq3QUZGK+mMGi2p666uLCG+Gh1rryEeONPDMCgB94h4f37vojjRJHbyVS21njW/070kVFaU+TwGZOtWmnx4gg9ZBMJpF4SRo6rItaITTFD2WNsNHEdE9P4xeDxdgJYQgajQQtergeS0VE9HBqPDetck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752085988; c=relaxed/simple;
	bh=KcuyJcdFTtZfG9aeZp74rTJ9e9AeYL0soH5xvuDETZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8rdlm2EffYpTOn1fEmqNEAhorKZP/xllCwMIi3FROrb6OBxqONnN+NKtxcvTEW29pVqvsCSuEL8ceootO4jiFIff56S8Ubht9mvyf6AbTeTifBGd3vzxQr/NQlgtFwEciJiff6bh1lOWSpPrQeVbEfOi2vXgaMRbI5LMtWTmRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOnZgfxl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOnZgfxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752085987; x=1783621987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KcuyJcdFTtZfG9aeZp74rTJ9e9AeYL0soH5xvuDETZA=;
  b=XOnZgfxlsx8laSilDIEVC2sbnmhObygV3EZr+kk+U3tln3RBVgUN0ETl
   b/CXQ6MPBjdqwl+k6knt8ONJf/WwoMiwWZrGfCba/BHfVV2Gz7RogLcVH
   /7/FW8Hy3ir250CiDa/K1wkHeuyCoOTNtDJ4zVLCaYApSxctJFwR76LPY
   gnGJqAAerO/JlQciBjFneLxXMUmz7/qF+dx50A3QTwDrv9lwg1vTfZMHe
   BKo6F8kxnzL7nNxV2TbBtCFW+miNx94XCLjA2BFifubAv4b68Zpw2LBep
   T53rJjPn0HJZZk/TTn5zu64e+aAmRYrLhWamTNBpRxo20ZHBx/9PX7xQj
   w==;
X-CSE-ConnectionGUID: 0vE68MslT3iF+NndWehEyQ==
X-CSE-MsgGUID: WEKNyI5qTbqz/hbB+yHrcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54284739"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54284739"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:33:05 -0700
X-CSE-ConnectionGUID: 3jpcaFyuTkKFH60HPnuWGg==
X-CSE-MsgGUID: /wyIA+6vTH2qV6ksoQ+NDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155950986"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2025 11:33:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZZbJ-0003tH-2Z;
	Wed, 09 Jul 2025 18:33:01 +0000
Date: Thu, 10 Jul 2025 02:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:fnb 25/37] include/linux/bitmap.h:455:9: error: call to
 undeclared function '__bitmap_weight_from'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202507100212.9edSxHJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fnb
head:   dd544f88c00fd4e924df5a54c9db247f7197fcbd
commit: 5ac88b82050e412fd083c429bfc818288e116448 [25/37] bitmap: add bitmap_weight_from()
config: s390-randconfig-002-20250710 (https://download.01.org/0day-ci/archive/20250710/202507100212.9edSxHJ2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100212.9edSxHJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100212.9edSxHJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:9:
   In file included from include/linux/sched.h:13:
   In file included from arch/s390/include/asm/processor.h:31:
   In file included from include/linux/cpumask.h:12:
>> include/linux/bitmap.h:455:9: error: call to undeclared function '__bitmap_weight_from'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     455 |         return __bitmap_weight_from(src, start, nbits);
         |                ^
   include/linux/bitmap.h:455:9: note: did you mean 'bitmap_weight_from'?
   include/linux/bitmap.h:451:14: note: 'bitmap_weight_from' declared here
     451 | unsigned int bitmap_weight_from(const unsigned long *src, unsigned int start, unsigned int nbits)
         |              ^
     452 | {
     453 |         if (small_const_nbits(start + nbits - 1))
     454 |                 return hweight_long(*src & GENMASK(start + nbits - 1, start));
     455 |         return __bitmap_weight_from(src, start, nbits);
         |                ~~~~~~~~~~~~~~~~~~~~
         |                bitmap_weight_from
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here


vim +/__bitmap_weight_from +455 include/linux/bitmap.h

   449	
   450	static __always_inline
   451	unsigned int bitmap_weight_from(const unsigned long *src, unsigned int start, unsigned int nbits)
   452	{
   453		if (small_const_nbits(start + nbits - 1))
   454			return hweight_long(*src & GENMASK(start + nbits - 1, start));
 > 455		return __bitmap_weight_from(src, start, nbits);
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
