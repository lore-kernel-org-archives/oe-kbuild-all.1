Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6EC15AE5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqrworXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698272325; x=1729808325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FYQKoHTPJBeboOghVzS56i4XNLggRgbJgBGSGI8bJuE=;
  b=CqrworXQO7jo6/3KS27LcnMia+o/Gv/LfVuW0Jmpj1xFZPQlI/3q7rhv
   XSpvFiFRoPH6Mrrz9aeVvcnYNzSaL7Gz/U3oYJgHOEjzcWBMyly0vqXZX
   klj97MfG3Fs2WLbXIL0iDXUMIZg78a/xzwGQfV0kRANBBghKHM2NU/Ha8
   oyPLxZ7XEp10P7vBSCf3taDKEZYmCOHHP0bMdxLTjRECIciYUTAU9SFwh
   KxURiRsuI2MN4wePAhAV0+ApmkPzjH/rkiRdBjgzGcEPDPpe23FWhRyCp
   0mvRKzgL8xY01de81wVC+enIokE5nRaN1JfHN16Pb0qMdq6NjKbpJvu9G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="212617"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="212617"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 15:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="6993336"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2023 15:18:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvmD2-0009Eg-1w;
	Wed, 25 Oct 2023 22:18:40 +0000
Date: Thu, 26 Oct 2023 06:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-04 2196/20110]
 drivers/staging/android/debug_kinfo.c:164:34: warning:
 'debug_kinfo_of_match' defined but not used
Message-ID: <202310260637.QEsFylmR-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-04
head:   171753a15b59ff7c3f72f761532ef29441b42fb3
commit: 1a9c7b3e3bdd87a10205891806a0d880fe27230c [2196/20110] ANDROID: staging: add debug-kinfo driver
config: x86_64-buildonly-randconfig-005-20231026 (https://download.01.org/0day-ci/archive/20231026/202310260637.QEsFylmR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260637.QEsFylmR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260637.QEsFylmR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/android/debug_kinfo.c:164:34: warning: 'debug_kinfo_of_match' defined but not used [-Wunused-const-variable=]
     164 | static const struct of_device_id debug_kinfo_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
