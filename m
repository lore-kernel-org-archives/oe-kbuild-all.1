Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD54E573
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 06:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763186490; cv=none; b=oiqhsfdBANKBGSmhdtUKUXr8uTKtEPM2NJ8hNjjU8EoAeG7tzCYOtK333f6O8Gu2SfgAyNVwKySITaBKXQ4b4ZTcFecYe1i4XKnVBppg/WHCBbBJHR36JHmOEkwb7dsKs4iu2G1nsM8URwLKnkMcvODqJXIucHITaUWsfZBsDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763186490; c=relaxed/simple;
	bh=9WO5sL1jl4yC4N427nY53Zjnn5TZ3e5FwYce/B3coGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k75TT3nxs54dOMeKqvMy/GIoBzUjwWHMPDV9pH2xXs3rm/3KdUcZXcKdbgF0kXHxKwWnE92/je0PGiRzZqRm/sCUpm4oNlmvTyp2D6SU/fiqUseINwROhI58W58bmFbJVhLsuLI27OX/8vgIcBL7Okl0S6Q3zD1/TI+U9pxH+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eizhjRGB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eizhjRGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763186487; x=1794722487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9WO5sL1jl4yC4N427nY53Zjnn5TZ3e5FwYce/B3coGc=;
  b=eizhjRGBQ9LDtKaVmO1oVP8ejRlLNMVAxUKps90qnkXqotuD0HjBIs+u
   aj9atzg0PcBpEOLIG6y3w/x1vGwAmCE4XI4TMuwJDdlmsQyTeq7h7aGzt
   rH5MjCKAzvrLPIEhhgontxhJzL0D09Zz62qk3ARDyFhoYNdlV/R01fDx2
   kYmUDQASq7nQV9+NUZIHDA+Se/2GFrzyNgEa4kon1V+v0NmIkLNtc6Q8H
   +GwxwM+tlub+7lhQ1xZYis94d0RCwyPRKnzzi513eoFLanMZGeL8X2Inf
   f/lUCJNl/67xFhLEmDitE+v6OLtv7/P75tbIxrmbca5XE4oh6yXaLd0Hp
   g==;
X-CSE-ConnectionGUID: E0fwioauT8SBcLrHKpGEpg==
X-CSE-MsgGUID: 5YE5SLqBS6+diuSBBfB37Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="69123028"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="69123028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 22:01:26 -0800
X-CSE-ConnectionGUID: MhGaIQIKTnuVYGzCG2uaBw==
X-CSE-MsgGUID: pm3lcUZfRsK5i/X5ye4g/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="227328102"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2025 22:01:25 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK9Le-0007kJ-3B;
	Sat, 15 Nov 2025 06:01:22 +0000
Date: Sat, 15 Nov 2025 14:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3195/3195] drivers/base/arch_numa.c:194:12:
 warning: no previous prototype for function 'node_reclaim_distance_setup'
Message-ID: <202511151309.KnZraqS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5f56814d65eaa85e3277534a309f4e7b4f095412
commit: 5e5d40e65cb55e4699c9879674a004f246606a8d [3195/3195] arch_numa: Make node reclaim distance adjustment always available
config: arm64-randconfig-002-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151309.KnZraqS3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151309.KnZraqS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151309.KnZraqS3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/arch_numa.c:194:12: warning: no previous prototype for function 'node_reclaim_distance_setup' [-Wmissing-prototypes]
     194 | int __init node_reclaim_distance_setup(char *str)
         |            ^
   drivers/base/arch_numa.c:194:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     194 | int __init node_reclaim_distance_setup(char *str)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/node_reclaim_distance_setup +194 drivers/base/arch_numa.c

   192	
   193	#define DISTANCE_MAX		(1 << DISTANCE_BITS)
 > 194	int __init node_reclaim_distance_setup(char *str)
   195	{
   196		int val;
   197	
   198		if (kstrtoint(str, 0, &val))
   199			return -EINVAL;
   200	
   201		if (val < LOCAL_DISTANCE || val >= DISTANCE_MAX)
   202			return -EINVAL;
   203	
   204		if (val != RECLAIM_DISTANCE) {
   205			node_reclaim_distance = val;
   206			pr_info("Force set node_reclaim_distance to %d\n", val);
   207		}
   208	
   209		return 0;
   210	}
   211	early_param("node_reclaim_distance", node_reclaim_distance_setup);
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
