Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90671FBC90
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747244038; cv=none; b=qYULn0Nne9BdLBSv/zg4KLZRKXMPDQRt0/ObL4Jcv1ClTpVUjV+3aKVBa7uymLECzzphwPKu38FnC0awRvZpbQLjtr0CkOHJ5nbuTwSJdr0psBT5dCuZlCRvhEhk7I1qaul7PyY2vgWMmtUzS9hE0nXxY2jWcVjcy9v5LE8kg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747244038; c=relaxed/simple;
	bh=7qgJ4pgc5w4Cyt+oU1+nvWi2OND7T8XREgQS/ehRH7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m9dyzo/+MqUbpYh/40V9IwwFkQaYQZB3Ta24jhhS8lIp3W3Hu2Bdnktr9wzv81x7sI/tysQlVCLi5X/UI5I24RN0v+GYlTyk93+ibGlE8CY6vqBk/ZpNBLuT7loalAumD0uvH8hduqU7vkpE9bt7X2riqIvR+D1QStRjTGEYykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aipdbC3g; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aipdbC3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747244036; x=1778780036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7qgJ4pgc5w4Cyt+oU1+nvWi2OND7T8XREgQS/ehRH7o=;
  b=aipdbC3g7paeuN/kJwtNVrje3w0/jqm7GB073BryPrXZstjOIk9MMWvW
   TCrxCOCwEmpimjDhhb3YWCtLzAEsk5i94AtubEONPVR/YD3AqvYMw9/LJ
   yW91CAKHEgu1PweMNxUVXnP2xWqeehZmPmsibv4Xzb6pFw4/NITRQQOIU
   XxlsS9t+GRT8kx5USNwwHgo+/GY6uLxJ4NxT2MqQfLwPHbriGkZt9a5cu
   SXOLZNY/sIgUimudl0LlQVofnCrSBZW5h32J8BhBoGMitLAwjzE//1Afp
   W99KMH8JPqrdpJ1uqhioBQpWvSPmSOGgwrecZz/TwAQKockfdFYYxRh37
   w==;
X-CSE-ConnectionGUID: bv2ZG5zdQeesn3FXqPQH8g==
X-CSE-MsgGUID: LB9CuO09TUS46iY0uzVluQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="74555566"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="74555566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 10:33:55 -0700
X-CSE-ConnectionGUID: JTN5g28mQQ6SKXVrpDm6Hw==
X-CSE-MsgGUID: sxe0QutDSlORISpHC35/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="143305416"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 May 2025 10:33:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFFzM-000HOn-1O;
	Wed, 14 May 2025 17:33:52 +0000
Date: Thu, 15 May 2025 01:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 5/5] depmod: ERROR: Cycle detected:
 libcomposite -> usb_f_accessory -> libcomposite
Message-ID: <202505150140.5spf6ncH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   76dcfb464b68243c0ecbc302be955e5114b4943b
commit: f63204236560b6f38b6e015c53eb6304d9889791 [5/5] ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: i386-randconfig-r132-20250514 (https://download.01.org/0day-ci/archive/20250515/202505150140.5spf6ncH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150140.5spf6ncH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150140.5spf6ncH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: libcomposite -> usb_f_accessory -> libcomposite
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[1]: *** [Makefile:1871: modules_install] Error 1
   make: *** [Makefile:237: __sub-make] Error 2
   make: Target 'modules_install' not remade because of errors.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
