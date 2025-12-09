Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C36F22129F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765281128; cv=none; b=MTENnhDWcKE2O7Ih7dsX3Ah/phsS3duig28oSUzZliYni1m1wC1wxvYSnRmVI03wf8A6qW1waC86uebDvCB3QCFyglu3T3yeYQwNxUDe3IbaDpA13vt4MFn64SWWaVP3IRpW8V/93pcLJxMOh/js/4XBxNLbzE92RPB2cOqFGOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765281128; c=relaxed/simple;
	bh=+dt8e+wCHWosJJOXDJ4tRqh2B6XiDkGao9p74d00niQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8HXeKouOGAh2zQgBWuUCtqHjg789DvVUV/5Ld6uT2oi0jto6SilH1CXSgAmRyQ7HC7FyXX2VQYFeAkFrH4W1pOlURuzsac2YUXe1bug/QxM7KVzQfM+zYp/pA9aN3NqxjhlNDoHGqhmy58/z3QDIivHgpWMp3Ju1NEDLVPTGbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azxaIiv3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azxaIiv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765281126; x=1796817126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+dt8e+wCHWosJJOXDJ4tRqh2B6XiDkGao9p74d00niQ=;
  b=azxaIiv33wfy+HAg8araGk4A1ImBNPGPO3Rx8a8JlATopHZeFnZeFTWY
   NC2aBlJ20wCyHxInhnWGeKe4ziuhsBgf6dUSNjILm2nJyt6IXI786VOO5
   mYDfzqeAFF6fWSPni2/IkcWZIzo0yf93ecjrWBnfFniIEwz+Kv5juhB+g
   HHbm4ApJUpDPCJlADxLWYl73Fhhgr+ilYq8AhbWrqn6eu4tGbKTqLti75
   WY6hNxOEX/dvrBngVqHK5IWSgqRJeR+TaSKa2ANmKvKysDOmRgvnD6OR6
   iiA6atFBNMlNxanbZrz0HwC7etvjEiL/zVbR3v2itoSi+96g8J0fQQ5PL
   A==;
X-CSE-ConnectionGUID: qOmI9j6PS06rrELLydhfsQ==
X-CSE-MsgGUID: 4Kkh82gARkqmvajdCoD9TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67402596"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67402596"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:52:05 -0800
X-CSE-ConnectionGUID: dFJbYyK4Q16xJZAAELpWFQ==
X-CSE-MsgGUID: YsnRmsIuQr6GuuogXGfhiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="195272860"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Dec 2025 03:52:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSwG8-000000000BV-3aGj;
	Tue, 09 Dec 2025 11:52:00 +0000
Date: Tue, 9 Dec 2025 12:51:26 +0100
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for I2C_GPIO
 when selected by VIDEO_MMP_CAMERA
Message-ID: <202512091256.Xbos7Eme-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: 1eb07e99ef39808612e12edaac6ef10f27485a27 arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
date:   5 months ago
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091256.Xbos7Eme-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091256.Xbos7Eme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091256.Xbos7Eme-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
