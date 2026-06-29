Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387133FF1D6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732104; cv=none; b=TLktxE+13uhd3LkDwrjffD32Mwju8Oo89Qi01c+tCdSNahbBUeZb80zpFlDwe73pRis9slAHAPe2LN5y0uOc7hBBmi9cY1VK++OzYOMke27B44mr5JVY4HJvgbzQLOy8pXf0G0Vcy6SZCmHhKWUkA0xWzV5o5P3x0BSQKIe8t08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732104; c=relaxed/simple;
	bh=5LWEXxUWHTCSVKsPU06YRisBpoOzrLgoMx8poq2lJhs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JnwUeAnOx5C6ksH2sUmWmg4571fXU3AZao8IUdAHG890Ad1bM8yNLUsVgXsGAR9oNzECm8FALFxAN/hKLg3eE95yoOVOf7Q2q48nl8AonW/Kcnq5P6C7lnZN6Ya/VzxLHOC7ZXrI6g9QfaFthKVagy0gdW08qjbncKdRpHBysoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+DNtBYg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+DNtBYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782732103; x=1814268103;
  h=date:from:to:cc:subject:message-id;
  bh=5LWEXxUWHTCSVKsPU06YRisBpoOzrLgoMx8poq2lJhs=;
  b=H+DNtBYgOP5m6kAjuEE+CASviI9evbdEbr4Szw5UisODO4cB2VYzsetw
   5yJprjTWESHTrrLAUYPLD9mKm6wiYX2FYt902BO2duobh5H6IJW+a6G2l
   yxVbLRsEFr9rz0az0ZBThnQq9cArZldPYuRwplPRA4tEXMuHFERCV8vY0
   GC+8/hrnq/xZ8CVjDw9y1UcPuxX2tdgrNc/FmuEaxx06DyuxdrYbKCWDS
   jiQop94uDq6op3GfjkbWY5jQwV/rMO0z4iW/DeAsbWmqsIY/tHu9ugQhb
   W7f+jVZSyV452jAa4ukRFoI5A3AsUAjmnpJ4d4YcQuhtZIv0b0K792HoV
   Q==;
X-CSE-ConnectionGUID: 2Kr+MEsFTwawf20daCSUOw==
X-CSE-MsgGUID: 6me/hNxrSoW9epOzo6eWew==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="87323609"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="87323609"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:19:03 -0700
X-CSE-ConnectionGUID: oup/CHX1TU+U6w3blX9YZg==
X-CSE-MsgGUID: M6uJRUDKT0evHSKxIi8TIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="250865264"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Jun 2026 04:19:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weA0v-000000007Kv-3gAR;
	Mon, 29 Jun 2026 11:18:57 +0000
Date: Mon, 29 Jun 2026 19:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Wenchao Hao <haowenchao@xiaomi.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 mm-commits@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>
Subject: [akpm-mm:mm-new 107/142] mm/zsmalloc.c:800:21: warning:
 'obj_to_class_idx' defined but not used
Message-ID: <202606291933.Cw5TBs54-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   88cefc306c43b58d9bb65c9e96e284306710d961
commit: b3a8a00229ce2b0367afff075a00d53b92e1234a [107/142] mm/zsmalloc: encode class index in obj value for lockless class lookup
config: csky-randconfig-001-20260629 (https://download.01.org/0day-ci/archive/20260629/202606291933.Cw5TBs54-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291933.Cw5TBs54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291933.Cw5TBs54-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zsmalloc.c:800:21: warning: 'obj_to_class_idx' defined but not used [-Wunused-function]
     800 | static unsigned int obj_to_class_idx(unsigned long obj)
         |                     ^~~~~~~~~~~~~~~~


vim +/obj_to_class_idx +800 mm/zsmalloc.c

   798	
   799	/* Folds to 0 when ZS_OBJ_CLASS_BITS == 0; no ifdef needed at callers. */
 > 800	static unsigned int obj_to_class_idx(unsigned long obj)
   801	{
   802		return (obj >> ZS_OBJ_IDX_BITS) & ZS_OBJ_CLASS_MASK;
   803	}
   804	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
