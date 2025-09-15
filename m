Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A802D47E7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757920842; cv=none; b=aUfE4K3kp/klMawMmjLR/DM4zKb646lxZI8uJMhVEQ1Yi+8hxeN+2ZdgSq4V/hgDImnOGhBJ2KNz3Fsakc+lT+P7/JHsl1YHMqmgOST0J4Lx+NBwIZ3l3Bb/xWrNAetByT/80hQN/2IH0G8aMnEsXr95bPNoAE8hYwubE9n2cHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757920842; c=relaxed/simple;
	bh=AsqmQOU9B9tOID9g4a6aHknbU+KD0Aeki7EHGOdxN6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tfdkyIFoAPe19S1b2y0rp8ziUrQJL2cK3qMNzAhwge1A0oWIpAE85rjuCNyyf6cQWDWI1Cy/HdukEomT0uc67oTTlo/VAoemJAlrFUdZoYqCC/oO46UIgUGt8QE4+HYuDsxh9lTNQeEf7xc452JBK8Mh9rqZBpffKWMP7bv8YF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRPYiL7L; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRPYiL7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757920841; x=1789456841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsqmQOU9B9tOID9g4a6aHknbU+KD0Aeki7EHGOdxN6g=;
  b=IRPYiL7L5BscKZGTrRCJfGrTg0GGlTz1o+6JIr/fvXxx+oP32rfAqLhs
   XKlEsDBTbKcXV6wkWjoApQfmdmwaH35eJjPOpdWW5j4/vBbmOen3PDzYk
   SbZxwfGgrxqAop1KOF+0WGKc7Let8ikdAM604RA9ocDCggZNBmMWQzhyH
   JHmPimhIo71J9CTwaS7/j4kuG1Xqwz4pVOpTX3uHAnCAR+aUxvq/4fcI9
   sVxAftPCIF09ddTq+J01WuAUk2QBzD4PrOHtL/P6KEOOsG1SfCWEToBOL
   ELmhnuRyQ4MRqZBZ8am8PtCfAKd+CAVpg4cawByoMopRm+ZiUU6vkzvHl
   Q==;
X-CSE-ConnectionGUID: 3Hfu04IJTz67/WH/Uq+yLg==
X-CSE-MsgGUID: 9juEMGmsRRqYxm1+frl+Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60086280"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60086280"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 00:20:40 -0700
X-CSE-ConnectionGUID: D3dBs7S9Q0ejrDUk1h80cg==
X-CSE-MsgGUID: j5ZGsanaTyGLAxhMFP+p1A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 0f80bf6f8d53) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2025 00:20:39 -0700
Received: from kbuild by 0f80bf6f8d53 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uy3Vt-000071-15;
	Mon, 15 Sep 2025 07:20:37 +0000
Date: Mon, 15 Sep 2025 15:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] mm/pgsize_migration.c:22:1:
 sparse: sparse: symbol 'pgsize_migration_enabled' was not declared. Should
 it be static?
Message-ID: <202509151556.Qv0ERYTQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7f6c0c3b85a08f10bd2f765c12d0afebcb101edb
commit: 096a5b61301dde0bb343d30ebd4cf1f8631820b1 [0/1] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_miration/enabled
config: x86_64-randconfig-122-20250915 (https://download.01.org/0day-ci/archive/20250915/202509151556.Qv0ERYTQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509151556.Qv0ERYTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509151556.Qv0ERYTQ-lkp@intel.com/

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
