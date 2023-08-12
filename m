Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDAB7472
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 19:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691870304; x=1723406304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pFYW0Iv/e/WXwvsZKXqXFOJ0Dpyj9XaAuhQ/AEdy4TY=;
  b=HqhD/58t0lnY31wPw3n5KhvmEvFT0jJSq3vxOpbcxh+dGybLFYDWAsgx
   uQu+Xv+unlMf34Z86m5qjR5HdT/Ci3v5q/2CQpFsgNvtt1FACHeB4btdJ
   b0nw8GOjEVpgYLT12GJ7xpqFYnVbQfymYugO7jRtt4ubXV/5fTl+FKMhi
   00Pff6t9SrNqW3O1/pZzjExkPJ2DmxQTX431PBF86llgC+5D4Jy5rGpFS
   myQTPEIq51ujbmsmjE8LuqYcxNyHyD0L5xmeoDDn2Nzo4iIheXTlAN3N7
   HtM95bNBzYaPkawnSEtnT1BLb5xbzfEhJBW2kbETKLConmQKuzGZPS8IW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="351453567"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="351453567"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 12:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876510574"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2023 12:58:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUukf-0008ky-1M;
	Sat, 12 Aug 2023 19:58:21 +0000
Date: Sun, 13 Aug 2023 03:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2196/23513]
 drivers/staging/android/debug_kinfo.c:164:34: warning:
 'debug_kinfo_of_match' defined but not used
Message-ID: <202308130350.YGDix5oX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jone,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   ee1147625d28317061f5dd303de56f1fadf4eec0
commit: 1a9c7b3e3bdd87a10205891806a0d880fe27230c [2196/23513] ANDROID: staging: add debug-kinfo driver
config: x86_64-randconfig-x052-20230813 (https://download.01.org/0day-ci/archive/20230813/202308130350.YGDix5oX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130350.YGDix5oX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130350.YGDix5oX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/android/debug_kinfo.c:164:34: warning: 'debug_kinfo_of_match' defined but not used [-Wunused-const-variable=]
     164 | static const struct of_device_id debug_kinfo_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +/debug_kinfo_of_match +164 drivers/staging/android/debug_kinfo.c

   163	
 > 164	static const struct of_device_id debug_kinfo_of_match[] = {
   165		{ .compatible	= "google,debug-kinfo" },
   166		{},
   167	};
   168	MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
