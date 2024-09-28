Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69856136358
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 21:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727557622; cv=none; b=OcZgN+hjPwzT4LJ0M6yUYzfXydMUhYPnI7DRYlbpWyXKujnarPSoxbEofITyZ175rXHh5TKx/uWFNTFD9Ih379ohHXkpButWuHALKfPaofED6q5hqk12eZ16kHEcHTtqjpSdaztzVDxvgfX7yYXtBjcIsQ6o8UuCRmMRKDMVqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727557622; c=relaxed/simple;
	bh=hi1lQ1Y4p50XjbL32Eh347YupAf+l802cxIO95GtANg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnI2VZNcnfXLz22fnmCssiXqDEksDQu29n2qKdTE0ho5ASZvyPj86C6HhdG2FglApkwNwq5UxgDoXbcYe0+i+o7XEe5cQ04+3viIgISal10aejYJA+bRmBoe4dTCvdM59B6s4pSr8231YA6dqprd3gJmyDdn1HUANxp/0aeRX1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFSVsqQs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFSVsqQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727557621; x=1759093621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hi1lQ1Y4p50XjbL32Eh347YupAf+l802cxIO95GtANg=;
  b=RFSVsqQsgK9U9AUtjgOrVrjRG5rhKh5zJ9QpyHAKaRAMTSJBe+7+lRYZ
   9iHA8PYFc5y67Iy8zMy8CJxm7FEj3/BgMaRLtb4gw5KJYPcj3D+tS8j1B
   BSkk8V1+nSGhYJ4zy4k+U550o0pWdaFDlpAiiaXTcPRT0D3H1ZLsvv0zg
   V3phuVtejJiUORad0VbGErxwx2g3sKv31qaZHTwDuXwaLErgqcUR46RBV
   RiHyxq3scDYyBr9Qm2qO21uzxc0+z/aR8O9qu/gcu9VDkAUB49bxlJ082
   IApbnnW076kCBbB/k+yY1AV7k2EjAn9gMIfY/RKQ84xd+I3nXnYtFY80D
   Q==;
X-CSE-ConnectionGUID: bgHC+bPGT6+uY2AYqWCQ3g==
X-CSE-MsgGUID: 4NDHhmh3Tvq935Pp565YWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37246397"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="37246397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 14:07:00 -0700
X-CSE-ConnectionGUID: giJn74FeRDKgGJI/t0gSdg==
X-CSE-MsgGUID: qgITf8bETY2ddP/V/GADvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72942370"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2024 14:06:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sueeW-000Ner-2m;
	Sat, 28 Sep 2024 21:06:56 +0000
Date: Sun, 29 Sep 2024 05:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 41/47]
 drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: error: 'st7701s_ids'
 defined but not used
Message-ID: <202409290419.837CMXzf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.11.y
head:   d99b769766ff1b1ced32d8d279d28e581e02fa9d
commit: 51bda0979ee92a0aac9def03dd9716f7b032d4bb [41/47] drm/panel: Add driver for ST7701s DPI LCD panel
config: arm64-randconfig-r054-20240929 (https://download.01.org/0day-ci/archive/20240929/202409290419.837CMXzf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290419.837CMXzf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290419.837CMXzf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: error: 'st7701s_ids' defined but not used [-Werror=unused-const-variable=]
     426 | static const struct spi_device_id st7701s_ids[] = {
         |                                   ^~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/st7701s_ids +426 drivers/gpu/drm/panel/panel-sitronix-st7701s.c

   425	
 > 426	static const struct spi_device_id st7701s_ids[] = {
   427		{ "st7701s" },
   428		{ }
   429	};
   430	MODULE_DEVICE_TABLE(spi, st7701s_ids);
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
