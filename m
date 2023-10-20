Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2B639A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 04:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5HBnv0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697777690; x=1729313690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jqGShMCw20AU2a1gTPNUF5Zl7xSSVHnwmOcCB9266cE=;
  b=h5HBnv0IOc5D2RNepFsRrif9L8lcjYzzQ0Dje9CIB9L5YRE8IUm9mC2I
   IYwn4WDDAJED3vvwbLhfTLGP/jrsgdUuyfQPwD/suFyyU3m1Nm2xe/brY
   hGXvXNqG5Ih5JzdT/lYG8Ui4XqNenknYCVo2yxG+g9HHcjiXLRq68GVZd
   Qq/JBh720SkFmz+KNhwY5jsLOboFEeMTySWUGJ/cKdm/fNVA/SIdPh5fC
   qBGdwb+T4TcF4vDkLrl8SLSUPPknQ2zx9p0hzedwKMz2v7VNGpd/pobJr
   9+5wnqA4sB1Ax7vroQoddlhGoYBjVjACAm6ghRAd0oaIJF1tmrOT9Ek5B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386245335"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="386245335"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 21:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="901027398"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="901027398"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2023 21:52:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qthX4-00032F-1Q;
	Fri, 20 Oct 2023 04:54:46 +0000
Date: Fri, 20 Oct 2023 12:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Arun R Murthy <arun.r.mruthy@intel.com>
Subject: [drm-xe:drm-xe-next 1349/1353]
 drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous
 prototype for 'intel_gmch_vga_set_decode'
Message-ID: <202310201234.ZZLwdoiy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   a0a80950176b39dbc76f8faa92fddf6caaa06191
commit: e2f3d6c51c72c6ae6046ede17f03ca962a093bc1 [1349/1353] drm/xe/display: Create a dummy version for vga decode
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310201234.ZZLwdoiy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201234.ZZLwdoiy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous prototype for 'intel_gmch_vga_set_decode' [-Wmissing-prototypes]
      10 | unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/intel_gmch_vga_set_decode +10 drivers/gpu/drm/xe/display/xe_display_misc.c

     9	
  > 10	unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
