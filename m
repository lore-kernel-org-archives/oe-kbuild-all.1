Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E55A18A921
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770505502; cv=none; b=e/NS3ii2rY29j673gsy/prTNbgeyVecbQiNwSAKBuwIPonE5T2/UQgaUNMFmpXDP8/onIhew/IdGWr9EWDlicaLo2DiEI3bpYiAVy5+qNgLy1eIbOFsbiRACPmKkfiMLjzFwglelXaGGL19zQynBjb2QyWsAzV0DFDcqKJF9W+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770505502; c=relaxed/simple;
	bh=ivBD2NJCpkoV6EmWzoeMB8tlXB0LjGtJuyu6Bje7CP8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MRtmGGl7x/otzt9y+T2bJFwm68DoW5kWLL8nCHUVotVhjlxIzxGX++80UghUULFslmlT2tbf15Ec7DdqXYh5ubm06xc+/8P6Wzqwni6u4jan3QePyD8zxeMnjWOv3f/+OKJbnuYHWOqQZl4oQFC7H91oRxBKXNWKyaOBhRkABZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpaDrlmN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpaDrlmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770505501; x=1802041501;
  h=date:from:to:cc:subject:message-id;
  bh=ivBD2NJCpkoV6EmWzoeMB8tlXB0LjGtJuyu6Bje7CP8=;
  b=SpaDrlmNrH0FslR63jmFlKskLcr7MtgvGet4JonjLKA08A3Q6FUQdyt/
   UkZprkoIUZSZfcRz6EN5PpPbckcppEBPmGDd3KSmn+YnanxvPYxm/3ge4
   e0XlMKQ/FczUUz3nOcUExc13g7tg3d2gs7bEuhdJY28eUEXI0g9IHtOoB
   cUD8DfDUKEUTedVN6fUkQo2OquEhKh7TLPzRMGkHF7XzH1AlGD2MIcepg
   B5/V+GCbj52QMk6/BTrcOjhRXHP8O/BsYftU6VQLvMgWy/+uiarnr/F5G
   vSvm8uGQA6TIg/sbO0sVHclftKSz6CAJQHXBgt8MP+u/IGhAoxFfgNyfO
   A==;
X-CSE-ConnectionGUID: dBE9jr3qTMSPfgViICQiBA==
X-CSE-MsgGUID: P78ij50JRkSjvAOMWxO4vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="59239310"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="59239310"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 15:05:00 -0800
X-CSE-ConnectionGUID: 6VRF8nx1QkmjILZA+dM+Tg==
X-CSE-MsgGUID: FSwQNCExRVuBSwIzCCVjng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="210468579"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Feb 2026 15:04:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vorMG-00000000lvy-2Sf5;
	Sat, 07 Feb 2026 23:04:56 +0000
Date: Sun, 08 Feb 2026 07:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:work.security.namespace 88/110]
 fs/pidfs.c:99:1: sparse: sparse: symbol 'pidfs_ino_lock' was not declared.
 Should it be static?
Message-ID: <202602080651.hSHrFHKw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.security.namespace
head:   739f23b2fac79f4f3ba14476fc39547c04838e48
commit: c7993583f3274c9018de0d5d6347c315f40106de [88/110] pidfs: implement ino allocation without the pidmap lock
config: sh-randconfig-r131-20260208 (https://download.01.org/0day-ci/archive/20260208/202602080651.hSHrFHKw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080651.hSHrFHKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080651.hSHrFHKw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/pidfs.c:99:1: sparse: sparse: symbol 'pidfs_ino_lock' was not declared. Should it be static?
   fs/pidfs.c:336:13: sparse: sparse: context imbalance in 'pidfd_info' - different lock contexts for basic block
   fs/pidfs.c:931:5: sparse: sparse: context imbalance in 'pidfs_register_pid' - different lock contexts for basic block

vim +/pidfs_ino_lock +99 fs/pidfs.c

    98	
  > 99	DEFINE_SPINLOCK(pidfs_ino_lock);
   100	static u64 pidfs_ino_nr = 1;
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
