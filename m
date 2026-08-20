Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07103B42E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 20:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787259038; cv=none; b=cGyqAO2QUue2MsAkX7MXhd/TtPID45Ref+CwQ2LIXbd61YT5ggb7SPUbc8Fppr5HGrE2gTEzPL/9MgO+g5dpKe8a1p2zfxhjSOwPX2vaLnZOP+/YA6cQ8rOngW1iqhaSWeaGGBQa2ieThLm8rObYoEdawC4W7s6HnaNl4+Yh5ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787259038; c=relaxed/simple;
	bh=X6Q5WOEBPA5iWSXFvNNYD4anJm9q3WrM1rC7vBnoLRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A5I1DDSxSjit5rqz8U0XljdX8A4WYhmQqAJsVwDh3u7TzHnaHiZMK6eZ3QOp0dR5n3M0cbXP8NDeKkzEVKfsLSKDq9+eh3Q3LMsTYo8M+PdpUW3Zddg6Vi6+LZkZNp5vfceVkYINpAFJQVaTuMFUqvCCxK+i75w7kXIT1kebeDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ja9z8ooZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ja9z8ooZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787259036; x=1818795036;
  h=date:from:to:cc:subject:message-id;
  bh=X6Q5WOEBPA5iWSXFvNNYD4anJm9q3WrM1rC7vBnoLRw=;
  b=ja9z8ooZsek9xJwZcLN/g8XPS+RV2VhPpB7FhRRXh2zl6uQI1ipfQnlT
   P2OsZNZ7TNhCFpe6BJh+3vivpGd9o6SLSo+xqCRRHVOrwANfCH6YX2Fdx
   5vhxLMmyD/rfdtvXyyv4myEb3JSyNC8Z6kvp4j5J7LVweapfPbJZp0f3M
   p+yCDU/zCdfTTsUBoAevbUxnuHgZvzvk2mB2xFTtuRn1Gy8bjFZ7wR1AN
   84cQunRInYTmqYY106mg3cfd+z+MfOiag/j2uyvom/3Ase9dJOsvPMl/Y
   dHSQtRnDXMU0DrNCrTS6howbL1xuwBNnYX7s5iLedDiipQSHqR6cwNfI0
   w==;
X-CSE-ConnectionGUID: +xsHAa9OST6CHgHCApPrZg==
X-CSE-MsgGUID: 2qiJLc/ERZimyC3RpJgcmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87662117"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87662117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 13:50:36 -0700
X-CSE-ConnectionGUID: x5nbodcwR2umMSyUvS5AOg==
X-CSE-MsgGUID: AWD0PFOtSvSd1ANUTiuPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="268071590"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Aug 2026 13:50:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx9iY-00000000ncr-2vZY;
	Thu, 20 Aug 2026 20:50:30 +0000
Date: Fri, 21 Aug 2026 04:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: arch/x86/include/asm/timex.h:10:7: error: call to undeclared
 function 'DISABLED_MASK_BIT_SET'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202608210426.fkFfnASG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: 3ed403bbc967a3138b8e37566510e9b062751372 treewide: Remove CLOCK_TICK_RATE
date:   5 weeks ago
config: um-randconfig-r053-20260820 (https://download.01.org/0day-ci/archive/20260821/202608210426.fkFfnASG-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210426.fkFfnASG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3ed403bbc967 ("treewide: Remove CLOCK_TICK_RATE")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608210426.fkFfnASG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/kernel/asm-offsets.c:6:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   arch/x86/include/asm/tsc.h:79:7: error: call to undeclared function 'DISABLED_MASK_BIT_SET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |         if (!cpu_feature_enabled(X86_FEATURE_TSC))
         |              ^
   arch/um/include/asm/cpufeature.h:52:32: note: expanded from macro 'cpu_feature_enabled'
      52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |                                       ^
   In file included from arch/um/kernel/asm-offsets.c:6:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
>> arch/x86/include/asm/timex.h:10:7: error: call to undeclared function 'DISABLED_MASK_BIT_SET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      10 |         if (!cpu_feature_enabled(X86_FEATURE_TSC))
         |              ^
   arch/um/include/asm/cpufeature.h:52:32: note: expanded from macro 'cpu_feature_enabled'
      52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |                                       ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]


vim +/DISABLED_MASK_BIT_SET +10 arch/x86/include/asm/timex.h

2f0798a3b1c215 include/asm-x86/timex.h      Thomas Gleixner    2007-10-12   7  
3bd4abc07a267e arch/x86/include/asm/timex.h Jason A. Donenfeld 2022-04-08   8  static inline unsigned long random_get_entropy(void)
3bd4abc07a267e arch/x86/include/asm/timex.h Jason A. Donenfeld 2022-04-08   9  {
5c75b98aa9cd5b arch/x86/include/asm/timex.h Ingo Molnar        2026-04-27 @10  	if (!cpu_feature_enabled(X86_FEATURE_TSC))
3bd4abc07a267e arch/x86/include/asm/timex.h Jason A. Donenfeld 2022-04-08  11  		return random_get_entropy_fallback();
3bd4abc07a267e arch/x86/include/asm/timex.h Jason A. Donenfeld 2022-04-08  12  	return rdtsc();
3bd4abc07a267e arch/x86/include/asm/timex.h Jason A. Donenfeld 2022-04-08  13  }
3bd4abc07a267e arch/x86/include/asm/timex.h Jason A. Donenfeld 2022-04-08  14  #define random_get_entropy random_get_entropy
3bd4abc07a267e arch/x86/include/asm/timex.h Jason A. Donenfeld 2022-04-08  15  

:::::: The code at line 10 was first introduced by commit
:::::: 5c75b98aa9cd5b1725b76999d794dc72ebd7a54a x86/cpu: Remove unused !CONFIG_X86_TSC code

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
