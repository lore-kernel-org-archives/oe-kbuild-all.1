Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF02D63D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 03:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmzcJOxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698896539; x=1730432539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ami+ORVaoHWKLNSH8KsHNAzGSenMU93l8AbUEvR9WrY=;
  b=kmzcJOxgDCp6ZMqeRSkKWEfugxY+ach1E2rqdGDD85hqh+fJ23mVE3GV
   l5hy9mA/qg/x1NbX6utrD099Jg6+Ah3fTC9nrQa6SmGj7fns5ECTo3pT1
   w0wGFNUnNw1rYifmzRNpMmAt2cgm6n2tNOaxCO37H/+f3ehzwpsO5HyVn
   e+yWYn8aiG6SlhxTiD/DZmVWGQL5nFJfOiNNhXmMyc6qyzTgJoy7pgqZr
   9LZkXAxjjNwGsklIeve8KYdGw6+pmAYXn+ZN68FjJbFDeTdrEUCI84EPr
   mMRBcy4Jk60MJlnQIS+KGLslZuOk/GaGb4fvNWxMDhrORIHvMWQMECW5j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="474870177"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="474870177"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 20:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884753790"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="884753790"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Nov 2023 20:42:16 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyOb0-00015o-1a;
	Thu, 02 Nov 2023 03:42:14 +0000
Date: Thu, 2 Nov 2023 11:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/1] mm/vmscan.c:7061: warning:
 Function parameter or member 'mm_vmscan_direct_reclaim_begin' not described
 in 'EXPORT_TRACEPOINT_SYMBOL_GPL'
Message-ID: <202311021138.05wVNwOQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   e219fb017902cc7eed3cc12e6e6c55a38acaea5e
commit: e219fb017902cc7eed3cc12e6e6c55a38acaea5e [1/1] ANDROID: mm: Adding direct reclaim tracking in memhealth
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231102/202311021138.05wVNwOQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021138.05wVNwOQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021138.05wVNwOQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:7061: warning: Function parameter or member 'mm_vmscan_direct_reclaim_begin' not described in 'EXPORT_TRACEPOINT_SYMBOL_GPL'
>> mm/vmscan.c:7061: warning: expecting prototype for ANDROID(). Prototype was for EXPORT_TRACEPOINT_SYMBOL_GPL() instead


vim +7061 mm/vmscan.c

  7056	
  7057	/**
  7058	 * ANDROID: Exporting tracepoints to assist in tracking direct reclaim
  7059	 * state in `drivers/android/memhealth.c`.
  7060	 */
> 7061	EXPORT_TRACEPOINT_SYMBOL_GPL(mm_vmscan_direct_reclaim_begin);
  7062	EXPORT_TRACEPOINT_SYMBOL_GPL(mm_vmscan_direct_reclaim_end);
  7063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
