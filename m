Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B931F3D58
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067473; cv=none; b=eVBgzE/xGVf1c2mqWAVFxPzJypB9wzw2OgAUEBf9oVYSX7oAPu3S5YVR2N0OHCL9hYNpT1sb6unA8gVs7ah3WstwAdu/Ktme8o6CNj/gXhu20tQ0RPV3BUne5mq43GWHe+zqzRl9+6nGzCAK0fipLe4vwJa4wN/SFQ8eFmo1B6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067473; c=relaxed/simple;
	bh=G/IJR0UhYvbH9RRfyOPnBS876f5k+rzNJM3rwHTiMaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEI9UHP+RwSnmHtWEITkXYmM2KL8dferngE7jqRaoQ57fV88DqkzFv48ChkH0kX4mcR8PrD4w6aB9OmtX3j/IQ5eNDOV5/EBTvYX2YRLeUppxVFzUKTAjmEYo071UKBP6FzSQz5YV0wmYfQtiEoUuNu4/8y/xXHz7Cf4aBXUDcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvCEXjuK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvCEXjuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749067470; x=1780603470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G/IJR0UhYvbH9RRfyOPnBS876f5k+rzNJM3rwHTiMaQ=;
  b=RvCEXjuKO2Axc7HFOrFiMY/l/Nit9VfReuLZCxycG8crOZe+4lNCFXE5
   b3E/Cas/6ik44ySZ5wKRHky+R3xfLkuTk0me0EDP5aqdv4vmHyjXtE9KG
   UzWmL3iHLDk7+L8Hx90YRqJecZJBA+on28xF5p2UObSXc1GDkMX8bNy0Z
   YNojX3dLOO9TIKOC5V3L84WWmzLruzUlh4YCU5eyNhSBdpOzuWxL1Lg0D
   ZcWHaAcpmNRp1BJ+NUhF5OOmeWEHzMKdjqg09W5Qeb+2UJHc1snj7zDMr
   n3pTc5VvI8Ue8/j1CnQltBflxCVB5ePnymN7mmsnbkMmZvOipFV1n7rpV
   w==;
X-CSE-ConnectionGUID: TY7NJrdTTNuCz6Mp8KMdBA==
X-CSE-MsgGUID: p/UkivhEQFuPEn28tfRgRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68608712"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="68608712"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 13:04:30 -0700
X-CSE-ConnectionGUID: kioMM1pIQoyH64RCE1BIsQ==
X-CSE-MsgGUID: 3iR9tvxsTJSEWKSkV21dTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145885263"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jun 2025 13:04:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMuLa-0003Qr-2V;
	Wed, 04 Jun 2025 20:04:26 +0000
Date: Thu, 5 Jun 2025 04:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/391]
 mm/pgsize_migration.c:22:1: sparse: sparse: symbol
 'pgsize_migration_enabled' was not declared. Should it be static?
Message-ID: <202506050430.vXqnQI66-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   3d3b9316ca19514479cedc15f8173485ad213f80
commit: e79c1d45908063d1d7bc247e0e9bde6d9283a09e [0/391] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_miration/enabled
config: x86_64-randconfig-123-20250604 (https://download.01.org/0day-ci/archive/20250605/202506050430.vXqnQI66-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050430.vXqnQI66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050430.vXqnQI66-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/pgsize_migration.c:22:1: sparse: sparse: symbol 'pgsize_migration_enabled' was not declared. Should it be static?

vim +/pgsize_migration_enabled +22 mm/pgsize_migration.c

    19	
    20	#ifdef CONFIG_64BIT
    21	#if PAGE_SIZE == SZ_4K
  > 22	DEFINE_STATIC_KEY_TRUE(pgsize_migration_enabled);
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
