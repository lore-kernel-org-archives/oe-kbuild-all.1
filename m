Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C874020E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693298029; x=1724834029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zw29LyT6++CiEdTFEvye880WPhF7+qyYHkSEzRYevnA=;
  b=Hm6nsXrMrCICwqS5vyYYtZn9jaB3KfohrFNPrOBGVbSXTxYfPK2XQW08
   5Qy+rJfpPXy3FDgSczqpo7AZmY6oFhD6FF4wm41+JtIDo259khZ84/vNk
   48SeMONtYKX1OgpjrdsNT5190L2ZleOGdbr3wbqefO7aAqKt6eyQV+2P7
   z2Je5JvmWwTcOdj2H9xElAIvEH7QTJbPNWttUeLAZO642u6e4VJFgIIPE
   lBzdSFbW9fnFDMaSMprlqFHvgrAsmcAhzNtnb4VsCz+KuoBJV3PynRxMg
   Zciw44fNw+6Ap6nKHU32UH8uEpogrZF9+yvEHsJ7qPKkWNLrt6k5qaEC8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="375274464"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="375274464"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 01:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="828700660"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="828700660"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2023 01:33:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qauAU-0008ZI-1u;
	Tue, 29 Aug 2023 08:33:46 +0000
Date: Tue, 29 Aug 2023 16:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/i915/display/intel_sprite.o: warning: objtool:
 intel_plane_check_src_coordinates() falls through to next function
 vlv_plane_min_cdclk()
Message-ID: <202308291638.YlXYWliU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: 94b9802186b71fcce16e2ce4cf3dd4c05fe506d6 UPSTREAM: drm/i915: refactor skylake scaler code into new file.
date:   2 years, 4 months ago
config: x86_64-randconfig-001-20230828 (https://download.01.org/0day-ci/archive/20230829/202308291638.YlXYWliU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291638.YlXYWliU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291638.YlXYWliU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_sprite.o: warning: objtool: intel_plane_check_src_coordinates() falls through to next function vlv_plane_min_cdclk()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
