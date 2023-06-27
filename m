Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C22586
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687905687; x=1719441687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5MZp6zc4TiYDk4ojaiLJBsukmrGQ3uZkCnL22XsYRwc=;
  b=V0223smmcpYH6sTmgtIaNxsmyETftOKJjRwPB7pk5+BMvvnV3oqNGdTd
   tO72lnbP0V3o/XNTlvWvShrDP/zyIQNnNg2B7iQcZSTkRYo1g1DgYJeKL
   LIhJivrVID46dmeIMD91CjY6xBI1L7iMGFlaodA7TmFo7IGkzhx+fRphX
   jVe4CDK4VKIloBdGr/03oGpVB29D+cJLJdX4UFukLZiYmIZP4oTMI+S9r
   lfX4AOlgqu3x/LKCNx6F9jCQWoVhpkwde6VVS/fXdwkNCZB89iX3TeMz+
   HSV9Ljs5qNBAWORRz7foflsRg+xj0W0VhzYkRBPzT05Bi1cbYGxW7AYvG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="448082460"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="448082460"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 15:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="840847508"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="840847508"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jun 2023 15:41:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEHNE-000CKf-12;
	Tue, 27 Jun 2023 22:41:24 +0000
Date: Wed, 28 Jun 2023 06:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 21/30] drivers/gpu/drm/drm_print.c:72:24:
 warning: unused variable 'debug'
Message-ID: <202306280642.oonB96F1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyn-drm-trc-10
head:   e7afba1683e5b4e8c906a446dffacf4b972b93e7
commit: dcf72b82bb982ce856036f33169304fe79ff8118 [21/30] hack
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230628/202306280642.oonB96F1-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280642.oonB96F1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306280642.oonB96F1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_print.c:72:24: warning: unused variable 'debug' [-Wunused-variable]
   DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
                          ^
   1 warning generated.


vim +/debug +72 drivers/gpu/drm/drm_print.c

f158936b60a787 Jim Cromie 2022-09-11  54  
f158936b60a787 Jim Cromie 2022-09-11  55  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
f158936b60a787 Jim Cromie 2022-09-11  56  module_param_named(debug, __drm_debug, ulong, 0600);
f158936b60a787 Jim Cromie 2022-09-11  57  #else
1a5e3ce6839aba Jim Cromie 2022-12-21  58  /* classnames must match value-symbols of enum drm_debug_category */
1a5e3ce6839aba Jim Cromie 2022-12-21  59  DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
1a5e3ce6839aba Jim Cromie 2022-12-21  60  		    DRM_UT_CORE,
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
97cc7fe2e0bfbd Jim Cromie 2023-06-09 @72  DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
97cc7fe2e0bfbd Jim Cromie 2023-06-09  73  

:::::: The code at line 72 was first introduced by commit
:::::: 97cc7fe2e0bfbd79019847692f9f089cc7699597 dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
