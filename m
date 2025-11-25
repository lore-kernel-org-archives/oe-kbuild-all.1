Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486703009ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 21:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764106221; cv=none; b=fFZbKoWJc8uAWwMOCHxRd0+fCQsc771PqReoTemHdtbpDPIkBMubW56SiL8/6i0Cl7PTXuH3HMsUlbovncUQ2Xu2KU2EuinXLTvjF0iJeD0wIqeyMx/VfZrMOlychVaMUz9li/LxWpxx2vW6LHwm+P1PpHOBH+mgXBs49x+/tRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764106221; c=relaxed/simple;
	bh=osNQeslmy9yvSmaTVZBanrGvQpv6vm9gyif1bbdoDQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I50C5FtiDHryeZsEd3rxyesY3ESM++R57tGu110v4l8iWzgukLr/3aIrg3oTHqFIsyxfBk5qMv4zICo2xX2dYmfTJrziAsOTcCdcCPWXn53M7I75SiqRHU0s4Zc3MQdWYiTPMcbdKkZwHsOUiRsqVv15zvlhCxx3+dR/E3oX06o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmXXDfE8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmXXDfE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764106220; x=1795642220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=osNQeslmy9yvSmaTVZBanrGvQpv6vm9gyif1bbdoDQo=;
  b=fmXXDfE8s9cqnDAL8S3hv+8qgsKKVkLbktYey50k/VdUWWlMeAhnruPq
   FA1Pb13g6fyEV566QQ/uTcXAGI39rAo29mMRPgHnbAoovaxASBG3MH3Wd
   5OipX6VO3KaGE5bYAn+IbG1TkqyCs9oyaJDSdf5uOucKUJbtQ4ix5H0ZE
   xRGhH3lTkMsL268sQ+gUWaO6DLZ9W/oFZ0ci5yFZjyOKr22coq1agVCok
   0Vu0mKuR4RJNycBVKKVVvS301dGegJZ4UpPH5IXBDDut6GnCo4Tdp1OWi
   6oMA9HhRqIifQro1Hm/30Ys2aZ3JCpjEoCMess/4SD44S07jjcmKKR7PM
   w==;
X-CSE-ConnectionGUID: FVD2tmb6T/+ppHhJ/LBzUg==
X-CSE-MsgGUID: qpft0/bmQZm9TH2Tdgci7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65138116"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="65138116"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 13:30:18 -0800
X-CSE-ConnectionGUID: UMdOcix3Qz+3cZB17W9a0Q==
X-CSE-MsgGUID: JfhDUIf7STeiCu6ekx6ODw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192655084"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 13:30:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO0c2-000000002Hs-3Qlr;
	Tue, 25 Nov 2025 21:30:14 +0000
Date: Wed, 26 Nov 2025 05:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:stack_magic 29/29] include/linux/kernel.h:30:10: fatal error:
 linux/tracing.h: No such file or directory
Message-ID: <202511260542.1Qe21bi2-lkp@intel.com>
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
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251126/202511260542.1Qe21bi2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260542.1Qe21bi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260542.1Qe21bi2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/kernel.h:30:10: fatal error: linux/tracing.h: No such file or directory
      30 | #include <linux/tracing.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1
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
