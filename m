Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D137CA2D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 02:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687056721; x=1718592721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5/yWKpq7rgqNtNoT7rVVBaL58OD9rfCMJGUBGI+HRs=;
  b=bZ2nuZYU0a3GA7AV00onjAICkstjMOmChtNz/nvIRwul2VCPv56qbBce
   hsVtB5bc1Ho/stowxIFaKZ4IXWrCnpPiAYuJyFGMyPLJ4nhFnKBlCC0no
   tpeAPZLF6OJdSIislJ8bYWNjtJda9hCbesMsvGuI4lKJ91TTmZ8A3a8Qd
   Yf4hRkGAyhNr8SwL1kHbgku4mL6CucqeygWCt1sRjo6sClRYjZcsej08U
   2YYXv/QKRAH5rq/s2R5pwqOxGXrIJotvMea/QPqD2/+eE/liUdCwJrwby
   hjRxAwJbg/p8kgFFZP8Ze+KWhVcJB11IyAZ/SYAZr2ygCKfhsMP2+cX2T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="388352922"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="388352922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 19:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="1043502749"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="1043502749"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jun 2023 19:51:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAiWF-0003K0-1J;
	Sun, 18 Jun 2023 02:51:59 +0000
Date: Sun, 18 Jun 2023 10:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 19/27] drivers/gpu/drm/drm_print.c:72:31:
 warning: 'extern' variable has an initializer
Message-ID: <202306181011.ZpRI5vmT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyn-drm-trc-10
head:   ab328091f31050e41041ca26d09809f803ccc2ff
commit: d892a7cd0527fff6a2516100e77dd0e17034c75a [19/27] try-ref-init
config: x86_64-buildonly-randconfig-r002-20230618 (https://download.01.org/0day-ci/archive/20230618/202306181011.ZpRI5vmT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181011.ZpRI5vmT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181011.ZpRI5vmT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_print.c:72:31: warning: 'extern' variable has an initializer [-Wextern-initializer]
   DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
                                 ^
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
