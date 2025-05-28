Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A681B19AD90
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437209; cv=none; b=daS2rrg1Y9LahZmF5k4qVrr8YaOPQcH6w4L2NULO6R1T7Jo/ACPbdgThPk9hSPypF1CAa3S4HjVyUlLzyO8G9TpGyRlLFtWran5GA2JV3h3m94OsRzI8PY/osMFQ8r2FpVVdySfri40F6CZ1MzHaQsxDeX5sO3q8BtQqOR8Awow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437209; c=relaxed/simple;
	bh=8Hm2Y8BS6J/s49z7x7qXqrP65e8Zw1shoLunpK7xbSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XKTwQsNTw+CPl2TJ4pQ/qMID+IUMqbi8oTIhkr4FOXWB0UHOIZHCLNksW9gfoEOPGrHR4TmmUTBaaWJo5WCzFeftnpIReYy9FrkhwVWodQOXXOaZAW13F0HmbxWzGTFK0zVLea3UTAudEp+Dmk18mMMa26L5y6FVaPiPaMeSIoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwTTJMWT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwTTJMWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748437208; x=1779973208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Hm2Y8BS6J/s49z7x7qXqrP65e8Zw1shoLunpK7xbSI=;
  b=dwTTJMWT5lKLhvGwBhALVeizRawsBWYNSbYW7gaJos8mLWV9Ncaa7d3X
   IWujojZlCKqm6IoZT0z5euGs8uwWeYnM5JOxjTVver6/9QZCBDHP1aq9N
   5msGHsgsuYvhc9lEmq53uYFW0gG4e8Fyi3XJVSr8WyhbpS/Ev1C9dMFpB
   sC+zKtyFgkVyGB2vvo57Z4yIgYyeHlzvwkXo5/krl0+BUdmQVoUxIHDjh
   +EIZs8bLOOEOPL8CeNK/7H/2ZzZZbJjHF15uXR9GTUbf4J63vMgEHES9c
   mn0INv+IYG4dqOa83J5xlDDbsRvXUjTt+as8pOJNw/j+c5frDENOWGR0o
   g==;
X-CSE-ConnectionGUID: rp8Ss4pQQDmtvi07pGqIig==
X-CSE-MsgGUID: BO1Rz/eSQmmBKfuFTP50ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50516807"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50516807"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:00:07 -0700
X-CSE-ConnectionGUID: qHySYaA/T/qPrCT+xAy+hQ==
X-CSE-MsgGUID: ngssoTJnTjud4hJ1CTnWkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143218764"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 May 2025 06:00:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKGO3-000Vfo-1V;
	Wed, 28 May 2025 13:00:03 +0000
Date: Wed, 28 May 2025 20:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 13/13] ld.lld: error: no input files
Message-ID: <202505282016.Yqax6Xcr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e95cc0ad46897957309e1dc44abe311daab7d881
commit: d8c8d96e4a922ac40a4dc2c16c3a5e554cac1d99 [13/13] anolis: virtio-blk: add ext_feature negotiation method and ring-pair feature bit
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250528/202505282016.Yqax6Xcr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282016.Yqax6Xcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282016.Yqax6Xcr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: no input files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
