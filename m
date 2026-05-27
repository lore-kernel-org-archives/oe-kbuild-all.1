Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6238C3F9278
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882058; cv=none; b=bwn2vi4DQaL8LX7BtrVraQyT6or+0lXUbDwNmNSRKPSO8lp+frzw6CjpkekJsmI5Gjd/s6iF4Ra124xftGhc1SWqHOoH8/uxmDvdj2rxSstk/LuYCnb9IW9dcKw/nu4gQlzFbSN4WEdopDUVdTEUZbqs2c37Wa+snl9Kqk311aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882058; c=relaxed/simple;
	bh=1dqlKwfZpahPpgA93+2md/KYVypzLNevqv09qSa+ois=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZKJncsxaxWRVox5ueRSMjUVZe1YUwLJZYP4f4yqkjg/7gTJeKF2tXbMACnstG0+kR9Ojs6mo8jblkyj0RX/FY8ZPm/+vqwBFHwRrY7MuFRUzt9G4BZj5DVuoUgF7bAuvrKxpOZHBbze4bnlFd1rSYV2IH8VyLdT5ATINxImwEUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBRyAuE8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBRyAuE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779882056; x=1811418056;
  h=date:from:to:cc:subject:message-id;
  bh=1dqlKwfZpahPpgA93+2md/KYVypzLNevqv09qSa+ois=;
  b=kBRyAuE8rpZqqntbMVk0IVQ/ShLJb6kmLf4Rz21Qt2vcCnyXveBnzga2
   5la2HGuc7DCyh5rivXBCPQdUZQrbKynM2PsAUGKn272FCfPy/YhwPO6yx
   5pGFNWIfyekp+OlUxDXPhoQq2zSTyXt+2/DCXS0XDwNgCgiiYQOX4zYzT
   +B9lQBP8YwMFcROBMNwHldeeH+u9IC6Uj6vO1uGPhXRTyVw+mhgut1+HS
   KfYW40XloyiwRjk00Fbc/Zbd/0k7HD4OJNP14k9PoPj3by2hCQ/WwUoPl
   pndja9/SKwvXpBaWujGdEifr/x63ZtRF15Ps34IEvy7vB0eb6lk2z5Lb9
   g==;
X-CSE-ConnectionGUID: iDkj4ve0SAaGMNE5aJZrmg==
X-CSE-MsgGUID: 0AwFx0BtTtOTWAoGmTM2PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103382536"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="103382536"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:40:55 -0700
X-CSE-ConnectionGUID: 5Dk6z6LaSxaBV888A3bQVg==
X-CSE-MsgGUID: Rg/k7H+dRaGW+0Yiv1FaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246241294"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 May 2026 04:40:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSCd0-000000003se-1NZs;
	Wed, 27 May 2026 11:40:50 +0000
Date: Wed, 27 May 2026 19:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: lantiq_gswip.c:undefined reference to
 `__devm_regmap_init_mmio_clk'
Message-ID: <202605271911.pMfoCqhd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
commit: 70535979738937d8397e76f850bd00e97115d02d net: dsa: lantiq_gswip: convert accessors to use regmap
date:   7 months ago
config: sparc64-randconfig-r073-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271911.pMfoCqhd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271911.pMfoCqhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 705359797389 ("net: dsa: lantiq_gswip: convert accessors to use regmap")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271911.pMfoCqhd-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/net/dsa/lantiq/lantiq_gswip.o: in function `gswip_probe':
>> lantiq_gswip.c:(.text+0x58c): undefined reference to `__devm_regmap_init_mmio_clk'
>> sparc64-linux-ld: lantiq_gswip.c:(.text+0x5c0): undefined reference to `__devm_regmap_init_mmio_clk'
   sparc64-linux-ld: lantiq_gswip.c:(.text+0x5f4): undefined reference to `__devm_regmap_init_mmio_clk'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
