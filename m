Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD6D22F19
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727981929; cv=none; b=uVbW3tBEvrPyepY15z4fFvZhah5GqfxlO3aRFDfFZaDv4B4PjE3r8FxEvV0mmpfDGHgxT0y4wqRAyE+v2y/GUbMhan7aTAh9Hr8HxszXcDsXiwinuAM7Y4P1jvVmqE2hgPAdHNWqmkcx7B/mufEr4cikHZxypkCMGYcsiEc/SS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727981929; c=relaxed/simple;
	bh=arTfcsnL6WhJ67wLPjIss9sMC5pPXtJeUtJegqpicOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WMdKkTWAx6AzAagwNBFhfgvA7r7yIUuWfM5M0lKsKoBKB7O5myZpp4/g+ywy4d/mEZDa3MG6kxdDnta9t2kBq08YkVjh2+yGo5xzCFNcUvrBWaXuDJbwUuTaVeTTVRCCohrsn7Bvrt9MjZaTbscnAjY31Qr3tjHRDxhv/5C2O8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KT4fnSkV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KT4fnSkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727981928; x=1759517928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=arTfcsnL6WhJ67wLPjIss9sMC5pPXtJeUtJegqpicOA=;
  b=KT4fnSkVcVq2ebklQbI3rVTm528jts+LIptUNGI7iPtGof2BNm+ohify
   kqmvKT1gEyt/XdFCYEjm+6E5YdSSkuSZqhvE/D19wd4nlSVdjvLCYR5o+
   gG2GB/d8aJogedoD5qV+Ddxadw1ocoQc91btZTX52+feOLSig6zcd6xoh
   pGbqBqp3/8BSBSWFSbTyRu7GJTdsyWnRLfwClEpSN+ONQFnMN73CkOCUt
   Uy+oLCNOqPWDmtYGIpuC0cDQ0egnitpQSv0+J2eeeNT3WiRk9+wx4UAWU
   vqb2J685SNP+mcgTZhat7hcUsC/bqMWbkZvqg6qjyyXUhpiYj2dSxlxtr
   w==;
X-CSE-ConnectionGUID: 2pqsqFUTQs2iKpWt4GYMpg==
X-CSE-MsgGUID: OW1V7spuT6SkmzPJJww4Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27140198"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="27140198"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 11:58:48 -0700
X-CSE-ConnectionGUID: OJzQUmNLRXenEz18X873fg==
X-CSE-MsgGUID: AvAljSFlT6qUh+HGptCsvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="74684956"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Oct 2024 11:58:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swR2C-0000ng-1t;
	Thu, 03 Oct 2024 18:58:44 +0000
Date: Fri, 4 Oct 2024 02:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rc 2293/2707]
 arch/parisc/kernel/parisc_ksyms.c:37:15: error: '__cmpxchg_u8' undeclared
 here (not in a function); did you mean '__cmpxchg_u64'?
Message-ID: <202410040204.XJkVO0gE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Al,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   aea4aaf86b7212944b7bf66d6becb8c7bb51093e
commit: 6ee05c1f18ffe0fb9409cfbb122cc7b2f419b19d [2293/2707] parisc: add missing export of __cmpxchg_u8()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20241004/202410040204.XJkVO0gE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040204.XJkVO0gE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040204.XJkVO0gE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from arch/parisc/kernel/parisc_ksyms.c:27:
   arch/parisc/include/asm/uaccess.h: In function 'copy_from_user':
   arch/parisc/include/asm/uaccess.h:251:63: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
            if (likely(sz == -1 || !__builtin_constant_p(n) || sz >= n))
                                                                  ^
   include/linux/compiler.h:181:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   In file included from include/linux/linkage.h:6:0,
                    from include/linux/kernel.h:6,
                    from include/linux/list.h:8,
                    from include/linux/module.h:9,
                    from arch/parisc/kernel/parisc_ksyms.c:27:
   arch/parisc/kernel/parisc_ksyms.c: At top level:
>> arch/parisc/kernel/parisc_ksyms.c:37:15: error: '__cmpxchg_u8' undeclared here (not in a function); did you mean '__cmpxchg_u64'?
    EXPORT_SYMBOL(__cmpxchg_u8);
                  ^
   include/linux/export.h:57:16: note: in definition of macro '__EXPORT_SYMBOL'
     extern typeof(sym) sym;     \
                   ^~~
   arch/parisc/kernel/parisc_ksyms.c:37:1: note: in expansion of macro 'EXPORT_SYMBOL'
    EXPORT_SYMBOL(__cmpxchg_u8);
    ^~~~~~~~~~~~~


vim +37 arch/parisc/kernel/parisc_ksyms.c

    33	
    34	#include <linux/atomic.h>
    35	EXPORT_SYMBOL(__xchg8);
    36	EXPORT_SYMBOL(__xchg32);
  > 37	EXPORT_SYMBOL(__cmpxchg_u8);
    38	EXPORT_SYMBOL(__cmpxchg_u32);
    39	#ifdef CONFIG_SMP
    40	EXPORT_SYMBOL(__atomic_hash);
    41	#endif
    42	#ifdef CONFIG_64BIT
    43	EXPORT_SYMBOL(__xchg64);
    44	EXPORT_SYMBOL(__cmpxchg_u64);
    45	#endif
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
