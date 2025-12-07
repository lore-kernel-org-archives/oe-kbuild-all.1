Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE3F15CD74
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 01:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765071493; cv=none; b=Be8AyP1OiiNQcyEKD0z9jEEqBgPudei6dG2gmJ2nx1kNN4cxCwl7KHp92xodAli9SC9eSpCyxYuWKj7dtRruDH+Ktz0sNSYU5lH7lpVxCfQ1RxaztM2aMDr1pQfH1KNW/mQe8DtNQMIb8qGK71CRCL9u4X4/tVg92CN9q+4Zh8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765071493; c=relaxed/simple;
	bh=m/drK10Mpw8LCFLg+/UJ6fS38CXqUXHQaJ2p720JDKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=id9Cz6ZYfz3tCpcHzpvluAtdwiyKiDne7JqqALYM6yT/GPKUvHtqHV05N8fhOQjwDV8TDVkevN9DRgSvKICMqkwRZ4KKLZH6T4ZukVMEJkxY1mqR/ss69y1uzeXRBNH9OTN9FLnJcPsZPxD/9lDXo9bAXP+UUE0B3g4OvaZIQSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKLQQsCi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKLQQsCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765071492; x=1796607492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/drK10Mpw8LCFLg+/UJ6fS38CXqUXHQaJ2p720JDKg=;
  b=BKLQQsCiAGA4OkbK/vYvSNnBNBGCy9XcD85WWP18UePAfRfnqHGsVyI1
   35CngEcQJndCFWoUTEfoktfsdG5ZqC7zxPSJ6TVbjpbCv9hVltS8+QBz1
   9FbpXHcy6hsKFgSvxbEgxo7YYLqlcRkbSSeP7MQ0vY0RDVlZzeFt1amSx
   6qvrx19S0ABXRsNZ0oVeqbSaPJ73Tdb6Zd97LWedc7LjJHkfFCxcB5mkI
   0djjal8i0jcRBQ8ns44MnKK0Wmyii6TTamJbY7gL1+J9YtrfzkBn08itU
   a7KXlYYpiu5q7T3IL9+NKyKPdLm5lB9EMfgwbZsljjJCaRvv4mL4FAL+a
   w==;
X-CSE-ConnectionGUID: ZDFv8iW8Stu/QRwm74Eaew==
X-CSE-MsgGUID: ZioINkegQ7+l32U26yIKQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="70914038"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="70914038"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 17:38:11 -0800
X-CSE-ConnectionGUID: NCRR8nQiQJ2P1OQ4zd/maQ==
X-CSE-MsgGUID: 0lgUwRmNS0G/pW55iCjhtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="226625325"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Dec 2025 17:38:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS3iy-00000000Isd-2ZbA;
	Sun, 07 Dec 2025 01:38:08 +0000
Date: Sun, 7 Dec 2025 09:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 75/84] error: register `R6'
 modified more than once
Message-ID: <202512070930.Wf4COMws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   c7c260b520be1625f0276edbff4c5b61cba0bec3
commit: 6fde95d7fc0a2b56a26cb3d816fc475ebe97505d [75/84] fuse: use the iomap cache for iomap_begin
config: hexagon-randconfig-002-20251207 (https://download.01.org/0day-ci/archive/20251207/202512070930.Wf4COMws-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070930.Wf4COMws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070930.Wf4COMws-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: register `R6' modified more than once
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
