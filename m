Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9E2DCF67
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780091276; cv=none; b=XEcQx0awoYn/3GAiUl2B1FSlr+eWkUD9SmPfeBqH9em0p0PdG2IIVXsFZxIphPOb0SVvMDaEz32yGfTX5PI/nDO1aTVM0lztkmFgxoKi9az2E1ZBFMcUl9s7OU8LYfqkyUgbwOTvLOAB/aIPeyBuAFWPK1WLJ+3Rcd0Enfh29rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780091276; c=relaxed/simple;
	bh=NyjaA13Ma30FwWlmNukWQRpREw1aKxDnAr4ZsUHBhwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lgq15SCSHBgsHEt6wmVKrMmMB38JVRLHmzsw5aSxbMz6zzOPUS7rnN3kA2E9NTZTFlxfyKXqbpHSykKwVi+4UrtKZEqPeYBGiN4pxs23DDU8c6HKrJyTfyhaoMgsVN7euIps+dR9uUhchZqWOLzyDYDOvanziiNq/+sgV93MKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNh5EHlF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNh5EHlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780091275; x=1811627275;
  h=date:from:to:cc:subject:message-id;
  bh=NyjaA13Ma30FwWlmNukWQRpREw1aKxDnAr4ZsUHBhwg=;
  b=cNh5EHlFMBU0zJubHDRZVOvnW+VmQ8N+2s5RLy55WTi4Bng62D349f8C
   7tSf80XxyNH6aJp0Vd0TV+9k5KO+Ob5tOc9w+eXcssTCDQqK+wla3kAwd
   Pw2GpC284qoUntxjAcb0xuHqVdhJtuSKzOlOC1Xks1COVupgwmCdOx8Lg
   +d4Qszv4+iZwYDZQgaurDvXUDGVDN4set2Oa0NbiMkCyJHFuAO1DL7eyV
   2ziJ9flkbXXG2hptXjT5I4mw0ZS8ujzyYI4K46wsAGnc/Xa/w/3RmxTKd
   9DhAxybBBQIjQv9UWGOHtl53W4iiZbkhXpkLzz3EttXa/V1tq3KFWr2La
   Q==;
X-CSE-ConnectionGUID: p49CqJ/+RZOJC3pRimm4uw==
X-CSE-MsgGUID: fYnczRB7TbaNNAVRwKWYdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="103619303"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="103619303"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 14:47:55 -0700
X-CSE-ConnectionGUID: hNOFo6rJR6WXsVssws8fIg==
X-CSE-MsgGUID: c+WqSjFUTU2qMYzeoWIxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="248060486"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2026 14:47:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT53W-000000007j8-2ub7;
	Fri, 29 May 2026 21:47:50 +0000
Date: Sat, 30 May 2026 05:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Subject: [jic23-iio:testing 240/253] ERROR: modpost: "__umoddi3"
 [drivers/iio/light/apds9999.ko] undefined!
Message-ID: <202605300553.scZHSbc3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   7b84b1e9dd850a5c9b55e27daa4ecdc2dd5b3431
commit: a67c818e7a5ce49e141f0d73f8330026e82bcc31 [240/253] iio: light: add support for APDS9999 sensor
config: m68k-randconfig-r064-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300553.scZHSbc3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300553.scZHSbc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300553.scZHSbc3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/iio/light/apds9999.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=m] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=m] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
