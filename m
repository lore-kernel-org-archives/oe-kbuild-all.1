Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB7D78276
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727542648; cv=none; b=adXQEB1yrcVe3v+QqSeG9riOnzHvs0asu80vaopmZoQkug2YIr/FnFcO1by7u0VDR6Z6SQHDW/qQvgwcgCa2kptAvWx7geYioYvuAc+V5S2Tv6g7nBHKlbqBCbEZUsqvfc1Rnic75lw+G2S3HABd8xNs4ty6izcyylphi/Rm/qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727542648; c=relaxed/simple;
	bh=ArtdVxxugMzjIA3Cvf+UZDzWu9q4XyzfckU4lh0X+7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JjpJylVveOscH3iRyNAjzB2KQKX4Jytggr5358e7ErXYOw8bI6WdSN5Y207I8v1PjyWsS7tyKSOIQ5EexyJ9wUx9rJ4/F1/XijUbZMWmCpizZ7sw6JmUlzRGftEoV01jHvqBf3OS8VBdP3TjZiCP1xj2fPD0Vz0ZYUZLWavX6vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYIsmEro; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYIsmEro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727542646; x=1759078646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ArtdVxxugMzjIA3Cvf+UZDzWu9q4XyzfckU4lh0X+7M=;
  b=IYIsmErou0LYS1sbYlg8kaCA+Z2N2gr9zzONOboA+ErYu5nUcxqUKwo8
   w/RoKj3sujwKhBUueAkBdXxwrvyoMOHK/YGJ8WAMtaS7ct3NSlzMG2bHC
   fQHQW4t74dcaLhSTLI3aeQ3vXplFC1Wh0KoF2D4x0yDgZJKTCrI5pPEPs
   0nqM3dwv0WvqLaJF2yk+w3fbyxLySQhotDN2w5a83C2ak/kUdZo+ckZDF
   padmjJv2UxuevAEaGg9WuZ6mashTHSgi1dW/fhbbRSxNdSiz2RpjhRP8R
   uJepFcZWY5W/OnHNUniiphm1w5vYZe2C+q3HWy/ufx5baTdYkDUfdwso3
   A==;
X-CSE-ConnectionGUID: tBzyby1xR/Cx98SWH25y+A==
X-CSE-MsgGUID: ktBG5qLNQimzKqWGRqg5Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30375011"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30375011"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 09:57:25 -0700
X-CSE-ConnectionGUID: NSqRRwMVStS7Z7LKjfAHJA==
X-CSE-MsgGUID: dj54X84HSyGwj+vu2TJ5Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73137435"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 09:57:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sual0-000NTD-19;
	Sat, 28 Sep 2024 16:57:22 +0000
Date: Sun, 29 Sep 2024 00:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Ehab <bottaawesome633@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>
Subject: [boqun:lockdep-for-tip 3/3] lib/locking-selftest.c:2713:5: warning:
 "CONFIG_DEBUG_LOCK_ALLOC" is not defined, evaluates to 0
Message-ID: <202409290009.LfmDHCpC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git lockdep-for-tip
head:   1c4aa09f488868163ce3e23df93a68610303f6af
commit: 1c4aa09f488868163ce3e23df93a68610303f6af [3/3] locking/lockdep: Add a test for lockdep_set_subclass()
config: arm-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290009.LfmDHCpC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290009.LfmDHCpC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290009.LfmDHCpC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/locking-selftest.c:2713:5: warning: "CONFIG_DEBUG_LOCK_ALLOC" is not defined, evaluates to 0 [-Wundef]
    2713 | #if CONFIG_DEBUG_LOCK_ALLOC
         |     ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/CONFIG_DEBUG_LOCK_ALLOC +2713 lib/locking-selftest.c

  2712	
> 2713	#if CONFIG_DEBUG_LOCK_ALLOC
  2714	static inline const char *rw_semaphore_lockdep_name(struct rw_semaphore *rwsem)
  2715	{
  2716		return rwsem->dep_map.name;
  2717	}
  2718	#else
  2719	static inline const char *rw_semaphore_lockdep_name(struct rw_semaphore *rwsem)
  2720	{
  2721		return NULL;
  2722	}
  2723	#endif
  2724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
