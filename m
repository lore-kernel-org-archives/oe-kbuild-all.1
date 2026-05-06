Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A01E7C18
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 05:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046332; cv=none; b=crhnS9CO/cwlRdjHT68CxDmmm9H2T7xpe/XY+tt6kkfNzqWwqfW+HXoTGz011syfQMPyu6D2eeLnGbJmcgzUUKZFXjCu/s4FcoGQiA45VIFP4oAa76ykfc9M8ZrqIlU1lVZoIS5XkvXrFIk6eabFjZcAieQqaQniHsvtQlNpiKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046332; c=relaxed/simple;
	bh=xTNPtPijGnuKfFJ4lTuFZo30cKIkkcsEr6gVtnednlo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WMF3ptoQvs/SiPxl4qZVV6BRo6MWqnra6s3/kXCSl5TLx5lNF8VdMT2ibUNVtZpLY4LxZDAKco0gYNRrt0Md53gQ14BfANzSOlLpWtKfk6pAHKY0XQ4GkvNK42Cs4Xldl+gPOi1Pn600CEGNueJKuFHA2QEg+Udbi5Z6+4eyjRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWoY6hLT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWoY6hLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778046331; x=1809582331;
  h=date:from:to:cc:subject:message-id;
  bh=xTNPtPijGnuKfFJ4lTuFZo30cKIkkcsEr6gVtnednlo=;
  b=HWoY6hLTmXje8v9hxAqv9FIAN1ZQaRLRmmNr8I0uQOV3X5HJYBYjeZmM
   +bklH5CWuooLqqrkyAMEztb+EhSC8radHPw59mr+9yITJFC5SotJ+hQ8a
   iVQWq1qJtaP36snel7ovpTqG7xt1jV+lJ/1kwFRmjm3i1uqLCYCJHXr5O
   c9v4C+tO25b8SPReJXkYBqGl0fRA/B4g9oNnwW/LkUCZnuyY3rm0TWLW+
   /ybjR3UpBJdHuaHC1x31MLp9Wjeqq7p1MpKCXt3bOAVmVJS0ebiEvuUnm
   gFRyWswQUcn+YFKyhzkQBSZI8OsoE9hvznMlwPE84KLp/Flw3B+zAkgRe
   A==;
X-CSE-ConnectionGUID: mibY6TGrRuOi8Ft5+NqerA==
X-CSE-MsgGUID: cClT2dyMQfqmNcGmMXd8zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90389782"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90389782"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 22:45:30 -0700
X-CSE-ConnectionGUID: kZ7ztX1kRyCp8Fy0wVN6RQ==
X-CSE-MsgGUID: j0Xmjy4hQZ2aS8EiQ0P4Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="240998161"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 May 2026 22:45:29 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKV4Y-000000000jt-2fK8;
	Wed, 06 May 2026 05:45:26 +0000
Date: Wed, 06 May 2026 13:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:b4/acpm-tmu-helpers 11/15] Warning:
 drivers/firmware/samsung/exynos-acpm.c:117 struct member
 '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'
Message-ID: <202605061329.IwjYwtud-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/ambarus/linux-0day b4/acpm-tmu-helpers
head:   b9c2a42c8f39aa877facff91e118777806b7ed5d
commit: 29d3806a17d7e50971398427356559b9027df14f [11/15] firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
config: nios2-randconfig-002-20260506 (https://download.01.org/0day-ci/archive/20260506/202605061329.IwjYwtud-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061329.IwjYwtud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061329.IwjYwtud-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/firmware/samsung/exynos-acpm.c:117 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'
>> Warning: drivers/firmware/samsung/exynos-acpm.c:117 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
