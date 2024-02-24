Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80B138A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 00:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708735215; cv=none; b=cSW4/CKFglB388k7ozlY6IcKISvZjbvZlt+VTedTrS0GbEQc4wVf/S7ZMbClLr7HooxdnLDpp9pJqoXZwbwP7dr5K/Y1qfHRiqg/J9XDNUZ3Zsj4f6QG9sgYQVem4I+GaaM7mBHRneD+/9aAN/1NNuVOa6bQUjRDU4FNqVe8D3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708735215; c=relaxed/simple;
	bh=ueg4t119Ok3eN0Ip+8VGpy3LnOhYXviLGy0nexGnZrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XO0uG11nAXp4XiANp1q47o3II/ffE/frwxuPnYvhzl0LMGBSHQa7neC+3w0flWvLG4Xk6GC4h44L2A8cAOFBMdokbb/3K2FsLWHQEfrDzZWj+2sc2XQv3NzfhAj0aS83Q4mt7Zqyv1VitjFkeYABXw/e+JyMH0LJc6ByW5LqOEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rpq4/Z8Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rpq4/Z8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708735213; x=1740271213;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ueg4t119Ok3eN0Ip+8VGpy3LnOhYXviLGy0nexGnZrA=;
  b=Rpq4/Z8ZVLjtv7JRUonJknTHUoCtKUpa47S7Ey6T3hmdPrYfLkqeCH7h
   JnxWjOeC2kj8bobSIJghF3dIqAN0tKQHsEmukBuLYJIgKkUj67cP/74un
   dOZmqn08zvhHvfqoIxCSx5ERBfzWjNQZ7/ms3XZmA8TqWV+ZpzESqOgrg
   +/wDGDeuEOqe+097yRRPtUJBUX/ez+NYbWmZLuCrxV0k7lbn6kMRRqcKq
   VWpj+3VeJ7E2nzlkJix6DlBe2fn1q1VwRa7ILxpQr3GElJ4SBWwoHloXv
   mjyvsf9Cssq3NwMokokQmlNcqkSclgeoSc0Zym08+Lp+XLisJ+hqbyo6C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20523439"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="20523439"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 16:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="10631495"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2024 16:40:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdg5J-00082j-0s;
	Sat, 24 Feb 2024 00:40:09 +0000
Date: Sat, 24 Feb 2024 08:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-5.15.y 43/204]
 drivers/gpu/drm/drm_mipi_dbi.c:76:17: warning: 'mipi_dbi_dcs_read_commands'
 defined but not used
Message-ID: <202402240813.kvhe0W58-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   200d2466033be9a082bfb81368de8a994e399a02
commit: f159783fdfea289ae7f9b6b62b71bb24e89631c9 [43/204] ODROID-COMMON: gpu/drm: Add new Tiny DRM driver with Ili9488
config: nios2-randconfig-001-20240224 (https://download.01.org/0day-ci/archive/20240224/202402240813.kvhe0W58-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240813.kvhe0W58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240813.kvhe0W58-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mipi_dbi.c:76:17: warning: 'mipi_dbi_dcs_read_commands' defined but not used [-Wunused-const-variable=]
      76 | static const u8 mipi_dbi_dcs_read_commands[] = {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mipi_dbi_dcs_read_commands +76 drivers/gpu/drm/drm_mipi_dbi.c

02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  75  
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22 @76  static const u8 mipi_dbi_dcs_read_commands[] = {
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  77  	MIPI_DCS_GET_DISPLAY_ID,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  78  	MIPI_DCS_GET_RED_CHANNEL,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  79  	MIPI_DCS_GET_GREEN_CHANNEL,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  80  	MIPI_DCS_GET_BLUE_CHANNEL,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  81  	MIPI_DCS_GET_DISPLAY_STATUS,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  82  	MIPI_DCS_GET_POWER_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  83  	MIPI_DCS_GET_ADDRESS_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  84  	MIPI_DCS_GET_PIXEL_FORMAT,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  85  	MIPI_DCS_GET_DISPLAY_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  86  	MIPI_DCS_GET_SIGNAL_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  87  	MIPI_DCS_GET_DIAGNOSTIC_RESULT,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  88  	MIPI_DCS_READ_MEMORY_START,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  89  	MIPI_DCS_READ_MEMORY_CONTINUE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  90  	MIPI_DCS_GET_SCANLINE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  91  	MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  92  	MIPI_DCS_GET_CONTROL_DISPLAY,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  93  	MIPI_DCS_GET_POWER_SAVE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  94  	MIPI_DCS_GET_CABC_MIN_BRIGHTNESS,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  95  	MIPI_DCS_READ_DDB_START,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  96  	MIPI_DCS_READ_DDB_CONTINUE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  97  	0, /* sentinel */
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  98  };
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  99  

:::::: The code at line 76 was first introduced by commit
:::::: 02dd95fe316936269a52d6ccb971bb956412b40a drm/tinydrm: Add MIPI DBI support

:::::: TO: Noralf Trønnes <noralf@tronnes.org>
:::::: CC: Noralf Trønnes <noralf@tronnes.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
