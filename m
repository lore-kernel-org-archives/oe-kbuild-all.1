Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0128F4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763187089; cv=none; b=L2cMZ548jV55BNrVvonNZFl33omRtXcxu/Hbcu+xtQbGnoD12DHh+gCvLH/bUemm9ZWM7xn+rYT+wnF1It2V2Stye8grF5puJdu9kNsuXQFZYV0ZC2rAaxkUNxRxEdbmA5bdLGz3T1Z7tZoiPwoolmxgKgLfzV14zwEk361zwZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763187089; c=relaxed/simple;
	bh=RlUmWpWJyiCxIfdtan1Wb2DJZ/px7iRLl1BDoSPYjG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QsF+m6//XNNcnx/h75OusIpBJ85IXhfjwYp9VZeOZLZQrX8Vh59AfV8rZGkwWtRo2uBbk1q+40ENCOBGv27KH8bxL42RgAAK6XsshF+ld30vC8BsW4ZqZOxCrNdKdVcMUjHYAfAFtGcVnUMMyIz6XShFv+7rQR7t5OCC7VvvTnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikH4x9v9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikH4x9v9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763187088; x=1794723088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RlUmWpWJyiCxIfdtan1Wb2DJZ/px7iRLl1BDoSPYjG0=;
  b=ikH4x9v9e2KUbIPXZTJRYeEWd8WFq8MOVQuLFWNtbMa/UFsqzXiYVonu
   USr+/BBgNoRuD4x1bGsHEPlb505yhHvI+zGWGq+aW6UtIH/xTfXHTPTE6
   LFUaIvYGLKFCJDN0TOUQQV9fcUJ8A1X5GSY4cGbdLvY3EwQ5QrouhOqWW
   O6S5N44mzyPrfJDozM0kGmgFA+YSTf+vMhwBCaaSTQkoU/q+CRLfGIGE+
   KMezgGAXbDgQTxfyyzszDRyPesKiHJxIU2jQppXh48AGhX39p+HshbSsi
   0lTk+UajX4oIIzXz/odoKNTbAVZGJefBUUGXqJ2Wb0uup7+FjMOEjTcwK
   g==;
X-CSE-ConnectionGUID: dodiVh2ATLqAw8cK2bcQsw==
X-CSE-MsgGUID: PGQRRsT+ROOAwxzEx2/s9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82664589"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="82664589"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 22:11:27 -0800
X-CSE-ConnectionGUID: gyqQTaSPQLi2vOBFpjWP8A==
X-CSE-MsgGUID: BO6C0tOeSpC3NX85jt1AJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189642589"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Nov 2025 22:11:26 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK9VL-0007kd-2N;
	Sat, 15 Nov 2025 06:11:23 +0000
Date: Sat, 15 Nov 2025 14:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3195/3195] drivers/base/arch_numa.c:194:12:
 warning: no previous prototype for 'node_reclaim_distance_setup'
Message-ID: <202511151421.e3kZPnSA-lkp@intel.com>
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
config: arm64-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151421.e3kZPnSA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151421.e3kZPnSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151421.e3kZPnSA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/arch_numa.c:194:12: warning: no previous prototype for 'node_reclaim_distance_setup' [-Wmissing-prototypes]
    int __init node_reclaim_distance_setup(char *str)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]
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
