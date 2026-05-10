Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111C3563F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778397402; cv=none; b=CGQ3SOVSBD+UncdBirSa3eOOqgx37fnERlN8HRIFzgHXeLfxAFvDJxbjsmlBrj4jf+hGULz8uD2Szo803zvmgL/4guJh5Kkz8Zmhc5f51Jw4SV2qjdAU+koEv7H4a4+iTWyugLWEJbgJjSTvXfOoZwho9yRtq6E5h5XPGIR1joM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778397402; c=relaxed/simple;
	bh=gBxOjbdqUrbLGf1pyO8onX7sLnIfla9ELfUGO7VRw1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=alL/qI3TMPTf4qYxGNX6m/Vaok4AnkNQ+OrvxVWF5V9AFCVQSwZRkBSooaKQ7bXLIXm2t+Sjk0hkRbszgFO9rm468O1oF97JWJSsnnOfSIGkK7vNLhzq8GSEpv411gmujixhJRVMabzyhHjx29WuXTkr5e91WHiJFejoxMhleAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaRo6Cc8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaRo6Cc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778397400; x=1809933400;
  h=date:from:to:cc:subject:message-id;
  bh=gBxOjbdqUrbLGf1pyO8onX7sLnIfla9ELfUGO7VRw1M=;
  b=eaRo6Cc86VS86KdwLlf5GHgrm2gK89Y3stV12aIUgiiEsNmbq1qt3/t8
   K0+RzQNTgQnSGWAZsdHnSSjpWwxuq/CCUjIN1Q0tcWx3rLve3CWW1AfpF
   RyBwiMISMNsGAlVaBFyFLS8DVB22R81UgjV15YbnY/V/c12upTyjoZRZ8
   lWwH4TSfhWJQPSVrfaDgQc9Yes2R+Ue8xxNACdxYKot/qvoy4e0C/IzwJ
   afeftvQZaPH4NwZeEkcoH5cBsw65bguodZdYz+oLTIyZtq1QfS9mKEbt6
   nnK1tCDBYM53363gsDSvEr0bwd6KAn5JT/RBaHnb8GaoGR9u8/rLvAW7L
   g==;
X-CSE-ConnectionGUID: cTNdMhT9Qx25PXkWWTDMxA==
X-CSE-MsgGUID: 2xbhV97wRqSWIuT8FdjhZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="78346892"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="78346892"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 00:16:40 -0700
X-CSE-ConnectionGUID: 4RoxZdWxQne1XkNDYOfWIQ==
X-CSE-MsgGUID: wrktijxmTiGMRsEcp3I82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="238977966"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 May 2026 00:16:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLyOy-000000007fJ-37Vb;
	Sun, 10 May 2026 07:16:36 +0000
Date: Sun, 10 May 2026 09:16:36 +0200
From: kernel test robot <lkp@intel.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/asm-generic/bug.h:110:30: error: wrong type argument
 to unary exclamation mark
Message-ID: <202605100951.mUxBB2IW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Niklas-Cassel/ata-libata-scsi-do-not-use-the-deferred-QC-feature-on-PMPs-with-CBS/20260510-083938
head:   f7b32ede283da1d05e06942112793f0b352b16b3
commit: f7b32ede283da1d05e06942112793f0b352b16b3 ata: libata-scsi: do not needlessly defer commands when using PMP with FBS
date:   6 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260510/202605100951.mUxBB2IW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100951.mUxBB2IW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100951.mUxBB2IW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from drivers/ata/libata-pmp.c:9:
   drivers/ata/libata-pmp.c: In function 'sata_pmp_detach':
>> include/asm-generic/bug.h:110:30: error: wrong type argument to unary exclamation mark
     110 |         int __ret_warn_on = !!(condition);                              \
         |                              ^
   drivers/ata/libata-pmp.c:595:17: note: in expansion of macro 'WARN_ON'
     595 |                 WARN_ON(tlink->deferred_qc_work);
         |                 ^~~~~~~
--
   In file included from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from libata-pmp.c:9:
   libata-pmp.c: In function 'sata_pmp_detach':
>> include/asm-generic/bug.h:110:30: error: wrong type argument to unary exclamation mark
     110 |         int __ret_warn_on = !!(condition);                              \
         |                              ^
   libata-pmp.c:595:17: note: in expansion of macro 'WARN_ON'
     595 |                 WARN_ON(tlink->deferred_qc_work);
         |                 ^~~~~~~


vim +110 include/asm-generic/bug.h

3fd45b871fde00 Peter Zijlstra 2025-11-10  107  
3fd45b871fde00 Peter Zijlstra 2025-11-10  108  #ifndef WARN_ON
3fd45b871fde00 Peter Zijlstra 2025-11-10  109  #define WARN_ON(condition) ({						\
3fd45b871fde00 Peter Zijlstra 2025-11-10 @110  	int __ret_warn_on = !!(condition);				\
3fd45b871fde00 Peter Zijlstra 2025-11-10  111  	if (unlikely(__ret_warn_on))					\
4f1b701f24bea0 Peter Zijlstra 2025-11-10  112  		__WARN_FLAGS(#condition,				\
3fd45b871fde00 Peter Zijlstra 2025-11-10  113  			     BUGFLAG_TAINT(TAINT_WARN));		\
3fd45b871fde00 Peter Zijlstra 2025-11-10  114  	unlikely(__ret_warn_on);					\
3fd45b871fde00 Peter Zijlstra 2025-11-10  115  })
3fd45b871fde00 Peter Zijlstra 2025-11-10  116  #endif
3fd45b871fde00 Peter Zijlstra 2025-11-10  117  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
