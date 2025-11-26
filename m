Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CA3307AD3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 01:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764121293; cv=none; b=krwGDU3LgKkXt/WthTF2XI9Om5UWjwTj1iulbWO/1bLrwX11E11wnBZRBZrqVGqPEXi9bT+4ImfxnEZUxMMZlOizzEC2eguymIsfp9zLHFYmWsLwxX2hGAjkC/gOAaqjdlBeTjefXec+l0+RlXjRN5gC4kZdsxdko4DbhAoPSaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764121293; c=relaxed/simple;
	bh=7BnMsBl3cyZ79ENOSXT6y3LmBW6bOYExn0VwCk5q5BA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OWNIga2oOK+Fc7vu/ci8rL6LftZVILr9P6HXIVawlGXb6tOJUg/nuii2flL/FZo16lzL1UxdwXIeG5tuFg7/c6fFlnuXL6DevXJzsjK4bdfRgxrAdOZp2AAf+j/IfJckB7b9zpXqomgqwSKzdCRVQCMM8aANYDDVhqnbBcukMV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aW0JXYbT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aW0JXYbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764121290; x=1795657290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7BnMsBl3cyZ79ENOSXT6y3LmBW6bOYExn0VwCk5q5BA=;
  b=aW0JXYbTZ11HI9602S0YHenmm1xQAzl7iDVuo7EPnp1+YtTdtQGBegrJ
   ttWn+8/O4cnmmRJmg30bmnAQ3fZ42pjwla8PWBfjWZdc7uIfqnn9DIuFD
   wQWeoLJbgIXqUM0UrRpc/X7ipfGpqIKB9CJkBQC49T4gXEbotdrqHlHSP
   OQdMpxm6XG0th23AFIEJjhRuhyvvpXjsGMXQs+I+5ttzL9sHMdwvPP+3K
   5h4OoLxHqSnFDaMIeHHevcs9QvttCvXuB9uhYP2A0nu0yXHBBPEmG/xzW
   T5HYJUMbHmjbgVBRGZlqdLHZVLR5ITESc4BUgxYLQ818c9GYqtz+a0fRv
   w==;
X-CSE-ConnectionGUID: HMz91prGS+2Q2yj5Y9UPQA==
X-CSE-MsgGUID: 2+2pnWcNS+GVExnRFkeXfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66310908"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="66310908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 17:41:27 -0800
X-CSE-ConnectionGUID: A07CksiKTxekNIuj8xWwEg==
X-CSE-MsgGUID: zgIFldKmScivTerFu1M+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="223777799"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2025 17:41:25 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO4X5-000000002PJ-1xVX;
	Wed, 26 Nov 2025 01:41:23 +0000
Date: Wed, 26 Nov 2025 09:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:stack_magic 29/29] include/linux/kernel.h:30:10: fatal error:
 'linux/tracing.h' file not found
Message-ID: <202511260926.ZmjJu72k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux stack_magic
head:   ba1a9217cab83b2001b2907b4357243251c3dfbc
commit: ba1a9217cab83b2001b2907b4357243251c3dfbc [29/29] move tracing
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251126/202511260926.ZmjJu72k-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260926.ZmjJu72k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260926.ZmjJu72k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:13:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:15:
   In file included from include/linux/numa.h:6:
   In file included from include/linux/nodemask.h:94:
   In file included from include/linux/random.h:7:
>> include/linux/kernel.h:30:10: fatal error: 'linux/tracing.h' file not found
      30 | #include <linux/tracing.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +30 include/linux/kernel.h

    13	
    14	#include <linux/stdarg.h>
    15	#include <linux/align.h>
    16	#include <linux/array_size.h>
    17	#include <linux/limits.h>
    18	#include <linux/linkage.h>
    19	#include <linux/stddef.h>
    20	#include <linux/types.h>
    21	#include <linux/compiler.h>
    22	#include <linux/container_of.h>
    23	#include <linux/bitops.h>
    24	#include <linux/hex.h>
    25	#include <linux/kstrtox.h>
    26	#include <linux/log2.h>
    27	#include <linux/math.h>
    28	#include <linux/minmax.h>
    29	#include <linux/typecheck.h>
  > 30	#include <linux/tracing.h>
    31	#include <linux/panic.h>
    32	#include <linux/printk.h>
    33	#include <linux/build_bug.h>
    34	#include <linux/sprintf.h>
    35	#include <linux/static_call_types.h>
    36	#include <linux/instruction_pointer.h>
    37	#include <linux/util_macros.h>
    38	#include <linux/wordpart.h>
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
