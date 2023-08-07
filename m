Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138438D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 02:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691375908; x=1722911908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15iXcyUEwwMKUljd4HgyFz/Rf1ro1HA3jmtv8jSng+4=;
  b=nRf1BKEdCZSaJ3kgwZJq+j4xqknf6wWbicY/pbQkNbm2vIDcjrV6mwJu
   1XqwpbtTclTZBbRHYevz2iNfpuYbEJM3GM1K1iA8BkcnnLuaLVSJyg/Dx
   tQdMRhXMPQBPV564H8C69Vpbl3dnT2OSo3gpn1pGsEnCtqretSXL3Ce6X
   JfFIC4FI39SiK39RCnLavTuY7byHtTMo9Ly8A572kP6z2i4SpVoO8B/Ey
   +Zz5sjsNw/y0M2/KNh3BP1fARJ4NxtasneBaGDdYUF1AXeFLtnqLWX9Uy
   igyAmPPgrp3D2HL62+CS4+EYoT3HPcAG5pg5hJNj58Nog0MwcF+FTCHur
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="374110198"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="374110198"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 19:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="874099288"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2023 19:38:29 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSq8Y-0004Uj-0u;
	Mon, 07 Aug 2023 02:38:26 +0000
Date: Mon, 7 Aug 2023 10:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 59/60]
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:176:20: error:
 'drm_plane_helper_destroy' undeclared here (not in a function); did you mean
 'drm_primary_helper_destroy'?
Message-ID: <202308071050.r9rY0y1i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   eec50650bd392904c7b2acbea142ac47dba8e4fd
commit: 7c213395d3c878e6d8b1b1dc452d5884c216396c [59/60] drm/fsl-dcu: Use drm_plane_helper_destroy()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230807/202308071050.r9rY0y1i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308071050.r9rY0y1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308071050.r9rY0y1i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:176:20: error: 'drm_plane_helper_destroy' undeclared here (not in a function); did you mean 'drm_primary_helper_destroy'?
     176 |         .destroy = drm_plane_helper_destroy,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
         |                    drm_primary_helper_destroy


vim +176 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c

   172	
   173	static const struct drm_plane_funcs fsl_dcu_drm_plane_funcs = {
   174		.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
   175		.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 > 176		.destroy = drm_plane_helper_destroy,
   177		.disable_plane = drm_atomic_helper_disable_plane,
   178		.reset = drm_atomic_helper_plane_reset,
   179		.update_plane = drm_atomic_helper_update_plane,
   180	};
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
