Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4EFA4E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 00:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687913258; x=1719449258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bnJmLp2MPitm0qN3zXUysKfu74Y4ueH028QH6wWvnN8=;
  b=Ye2LVeiImM1O716hBw3nPKdH6D/N9ZB9398Jl48JsYPO0WBCCP4AoTzo
   z2cIOKzC68IoASO7ugsabDk7b/i3ygeLKuRIzov/Or4R5TX4T/QH+87In
   ATFg5Ic99BtmwmiGt7fAX8pP47a42s3hvpbtgpzF+Ns2H8TGMjjtaWL1W
   fX7nQ8rxgi+uM/ud0F95LFUFbncGb2qMEH9QHyz4XnYqL81ONIba3w56I
   +aEqwGXFTJEgnaXDADCCVDBoc3gLtooU7EQ8MdLryaJXBQvOBhENNKacp
   fPyVfEezQv5e23oboKmkeRILdrw3dbCpLU1WRpuVAJSw91FIK+eVpGqPJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425388948"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="425388948"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 17:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="861303716"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="861303716"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2023 17:47:28 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEJLD-000CPI-3D;
	Wed, 28 Jun 2023 00:47:27 +0000
Date: Wed, 28 Jun 2023 08:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 30/30] drivers/gpu/drm/drm_print.c:80:24:
 warning: unused variable 'debug_trace'
Message-ID: <202306280808.aPankoQI-lkp@intel.com>
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
commit: e7afba1683e5b4e8c906a446dffacf4b972b93e7 [30/30] add debug_trace knob to drm
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230628/202306280808.aPankoQI-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280808.aPankoQI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306280808.aPankoQI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_print.c:75:24: warning: unused variable 'debug' [-Wunused-variable]
   DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
                          ^
>> drivers/gpu/drm/drm_print.c:80:24: warning: unused variable 'debug_trace' [-Wunused-variable]
   DRM_CLASSMAP_PARAM_REF(debug_trace, __drm_debug_trace, drm_debug_classes, T);
                          ^
   2 warnings generated.


vim +/debug_trace +80 drivers/gpu/drm/drm_print.c

    57	
    58	#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
    59	module_param_named(debug, __drm_debug, ulong, 0600);
    60	#else
    61	/* classnames must match value-symbols of enum drm_debug_category */
    62	DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
    63			    DRM_UT_CORE,
    64			    "DRM_UT_CORE",
    65			    "DRM_UT_DRIVER",
    66			    "DRM_UT_KMS",
    67			    "DRM_UT_PRIME",
    68			    "DRM_UT_ATOMIC",
    69			    "DRM_UT_VBL",
    70			    "DRM_UT_STATE",
    71			    "DRM_UT_LEASE",
    72			    "DRM_UT_DP",
    73			    "DRM_UT_DRMRES");
    74	
  > 75	DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
    76	
    77	unsigned long __drm_debug_trace;
    78	EXPORT_SYMBOL(__drm_debug_trace);
    79	
  > 80	DRM_CLASSMAP_PARAM_REF(debug_trace, __drm_debug_trace, drm_debug_classes, T);
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
