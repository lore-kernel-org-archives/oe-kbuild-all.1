Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6711878
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 01:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716427654; cv=none; b=s6Sl8GQ1nZBeY/rl7pQT/ETjNZtRattxPtsUNKATLJEaIMZLSM8WfQfVM/AXrw/EbKif9hUYzfaAKA4LQL6VU+Yd3bN22N56f4a5o5cTgzYTjuN2JDNcZY9BaB03m6Ed3jEVQH14BLv0IooJLZqI3JhSBG5sVwEongdJkV1WTsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716427654; c=relaxed/simple;
	bh=9mChbEGRCGXdHjBBTVfRrJk/w9wYP+YI5HNJxfvG214=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kgv9YYdF1YyA0d3J6nFaCGkzq+n+moCwXfScxWrSmJrEc2mZFzDny812MNrVsLgcmfijnmcuQ5dW++KakLMCpMLo6ZLe5rEY+HhPq6RYS3MsiK5pVFfwSKrBaBDUbXqp26/jAnJOnvH7oIZIlV9DBanIQX0iAR72ZGVP9SG82Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+ngSQIC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+ngSQIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716427652; x=1747963652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9mChbEGRCGXdHjBBTVfRrJk/w9wYP+YI5HNJxfvG214=;
  b=L+ngSQICtumFZTzBBdGuDq9PmP3u+OScqZZXYwqkjMYvbsBLCh6WmtsW
   Da5smvxmeTQQUz1kvESG6FyFD05k63qNJQJlu3qbb1/lBdJsSEsFkNPQj
   fWqY3S7Z6RureiqrQz1ExPMcITf8bCGZhNEBjpV5LdU4DTUW/QjBeQsMT
   VqFVPTTijZTc7xzd/+8ljbksdRP2oxYCi32G2w5fIudhBaAG89p0Fm/+N
   c9TCvDF/ZKa5cefl77rVFQQjOFxG9aRHR85kFHygrzczly2gme0mxbV4b
   5SNICwloBvPtJBHeQJeqq+lsSQLdcRrabJH9xaJF/hMHW0R+LaLv0pMRA
   A==;
X-CSE-ConnectionGUID: Q9Nqis7bSJOljMZYt7UYQw==
X-CSE-MsgGUID: N7foHtF+QdqsGYuNzfzUQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12566082"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="12566082"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:27:32 -0700
X-CSE-ConnectionGUID: bieC52YKTJa9EeQbz4FZvg==
X-CSE-MsgGUID: BWZaop1SSf6sDfKtM5oxEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="70892702"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 May 2024 18:27:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9xEu-0002JZ-20;
	Thu, 23 May 2024 01:27:28 +0000
Date: Thu, 23 May 2024 09:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <970353908@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9677/9706]
 arch/arm64/kernel/cpufeature.c:2129:13: warning: unused variable
 'enable_pseudo_nmi'
Message-ID: <202405230925.19JMExYE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b51533d469099a915373a13041776b93b232ff65
commit: c6ce2becb89528f83c1ad3c0607ad05baecebc0a [9677/9706] arm64/cpufeature: Fix pseudo nmi identifier undeclaration complilation error
config: arm64-randconfig-001-20240523 (https://download.01.org/0day-ci/archive/20240523/202405230925.19JMExYE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405230925.19JMExYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405230925.19JMExYE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/cpufeature.c:67:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/crash_core.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2234:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:2129:13: warning: unused variable 'enable_pseudo_nmi' [-Wunused-variable]
    2129 | static bool enable_pseudo_nmi;
         |             ^~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/enable_pseudo_nmi +2129 arch/arm64/kernel/cpufeature.c

3e6c69a058deaa Mark Brown     2019-12-09  2127  
f72387e1f8bc99 Mark Brown     2022-11-03  2128  #if IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) || IS_ENABLED(CONFIG_ARM64_NMI)
bc3c03ccb4641f Julien Thierry 2019-01-31 @2129  static bool enable_pseudo_nmi;
f72387e1f8bc99 Mark Brown     2022-11-03  2130  #endif
bc3c03ccb4641f Julien Thierry 2019-01-31  2131  

:::::: The code at line 2129 was first introduced by commit
:::::: bc3c03ccb4641fb940b27a0d369431876923a8fe arm64: Enable the support of pseudo-NMIs

:::::: TO: Julien Thierry <julien.thierry@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
