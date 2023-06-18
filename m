Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5ED10F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 05:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687065731; x=1718601731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=28rq4E3AhaXepQLcf7MBS35fydX4n9rsoCjzEyCBKyY=;
  b=cUaQKqK4AQj5BrQlovPJdZCbaP77Izt5WozHkhQy/UyeiZ9Tl1+izHm/
   PJ1Tzha9gxYQXhy9W96Tccqe52JJxR8tPoQaY7z4p4vF/LMCXvLn8gtDH
   KhhuVotEqo/DHb5XrcBB0eGrJqgtDC4OnS/4wUmumBYcFrKCRKuvPksIz
   eZC7992nUtTaJTS2HcqB/wfwY/S9zXaO5algb76sIrqJFvhDZcGci3fGc
   eZsiiigAw6Ao2WhVmAMbCDQnxfewa81A8aGjBPSEWt8sES45oxpIL3QWf
   VLAItg2D+o9y2IkvjnvHulKxwODMF/AXe+/5R9jbJ38y7pWEkKdl87JhQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="356938670"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="356938670"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 22:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="783363624"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="783363624"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2023 22:22:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAkrV-0003Sk-04;
	Sun, 18 Jun 2023 05:22:05 +0000
Date: Sun, 18 Jun 2023 13:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 16/27] drivers/gpu/drm/drm_print.c:72:31:
 warning: 'extern' variable has an initializer
Message-ID: <202306181352.vx1dGnN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dyn-drm-trc-10
head:   ab328091f31050e41041ca26d09809f803ccc2ff
commit: 74d88b7d2172de86e3407b8e9cd6e8c718abd5f3 [16/27] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: arm-randconfig-r016-20230618 (https://download.01.org/0day-ci/archive/20230618/202306181352.vx1dGnN9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181352.vx1dGnN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181352.vx1dGnN9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_print.c:72:31: warning: 'extern' variable has an initializer [-Wextern-initializer]
      72 | DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
         |                               ^
   1 warning generated.


vim +/extern +72 drivers/gpu/drm/drm_print.c

f158936b60a787 Jim Cromie 2022-09-11  54  
f158936b60a787 Jim Cromie 2022-09-11  55  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
f158936b60a787 Jim Cromie 2022-09-11  56  module_param_named(debug, __drm_debug, ulong, 0600);
f158936b60a787 Jim Cromie 2022-09-11  57  #else
a2981f1d7dc433 Jim Cromie 2022-11-02  58  /* classnames must match value-symbols of enum drm_debug_category */
a2981f1d7dc433 Jim Cromie 2022-11-02  59  DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
a2981f1d7dc433 Jim Cromie 2022-11-02  60  		    DRM_UT_CORE,
f158936b60a787 Jim Cromie 2022-09-11  61  		    "DRM_UT_CORE",
f158936b60a787 Jim Cromie 2022-09-11  62  		    "DRM_UT_DRIVER",
f158936b60a787 Jim Cromie 2022-09-11  63  		    "DRM_UT_KMS",
f158936b60a787 Jim Cromie 2022-09-11  64  		    "DRM_UT_PRIME",
f158936b60a787 Jim Cromie 2022-09-11  65  		    "DRM_UT_ATOMIC",
f158936b60a787 Jim Cromie 2022-09-11  66  		    "DRM_UT_VBL",
f158936b60a787 Jim Cromie 2022-09-11  67  		    "DRM_UT_STATE",
f158936b60a787 Jim Cromie 2022-09-11  68  		    "DRM_UT_LEASE",
f158936b60a787 Jim Cromie 2022-09-11  69  		    "DRM_UT_DP",
f158936b60a787 Jim Cromie 2022-09-11  70  		    "DRM_UT_DRMRES");
f158936b60a787 Jim Cromie 2022-09-11  71  
43ed982e66f0db Jim Cromie 2023-06-09 @72  DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
43ed982e66f0db Jim Cromie 2023-06-09  73  

:::::: The code at line 72 was first introduced by commit
:::::: 43ed982e66f0db6ae717f06de75f3dab345d136b dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
