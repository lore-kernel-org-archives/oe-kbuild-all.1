Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603BC2AD11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 04:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727238601; cv=none; b=s+uvV6Do3lDyqBvUdsWKaAb5I429EogtTyf7Sz4wCmmc4ZZhapitGfafpR5/XjtywO665ua/ZN8ogXLQjmITGL0jE9RRtxlNnuh1p39HpSIfWHOgB5ZN6tvrWx+XUiHGQRtRzu4zWnf0BzO0OWlF+OJoEZBmZ4C9g7iUjZo2pXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727238601; c=relaxed/simple;
	bh=OcI455Loq3bDqND5gx7ftN7n9RILjntQ2hzlB+yBegM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cM5bKltAvAETBvyECoot/+ebal6O8gjUEuDifF3426dVi++C2P3ixtZUtKKm6Ka+N/kd3Znx7WxgLvfRdADi1ODxK5Ioq8pgHGuaKlYvwgh9nF/SJ9BdlUWqsRQb43yeSed1np1owmtFEOJzlIW1pZthIArOZxrlh6Zj4bVN8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeFPqX3M; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeFPqX3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727238599; x=1758774599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OcI455Loq3bDqND5gx7ftN7n9RILjntQ2hzlB+yBegM=;
  b=DeFPqX3M9Gb9Pqs6rM9kc+9GN+Ox6ME17jUO5f8dhenx7bl/AJN6awdt
   JcKosMDO4yAsBEvEGgEpXUjtgEqEEe7wjV7f7OZSHN/q+XJ0r+fOxbuyX
   mX1rqCRfcW5Qj4nIc17JALsaEpAP6hEc5x/GYlULNl0ov6a+e0hweFcup
   ubxkY5G+xCfLC/XPl3P3QrBEtheo4brE/qZedYwTnTz/kYUQIV/XYq3Ft
   e0Vg01Pow/uuknGmqITPPYuFjiSdY7jeMUyvSHqRVGxc5C/dO1jcsCdXf
   Ur/Y+nPo7GF5GBLrUE4SME2lhSmE/UmHZmwGwwpgRnvoqkWV5rQgxV1n0
   Q==;
X-CSE-ConnectionGUID: DS81/IxPRiax1JdQbumBZQ==
X-CSE-MsgGUID: jZnF4BavREeq3qRWp3sftQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26085150"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26085150"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 21:29:59 -0700
X-CSE-ConnectionGUID: h9iiwiDJQ9uNgT3Qvo5NOg==
X-CSE-MsgGUID: KbE9O20xSaGePHZ1mVdwOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="76034720"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2024 21:29:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stJf1-000J8H-1E;
	Wed, 25 Sep 2024 04:29:55 +0000
Date: Wed, 25 Sep 2024 12:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12681/12687] rust/helpers/spinlock.c:10:23:
 error: implicit declaration of function 'spinlock_check' is invalid in C99
Message-ID: <202409251238.vetlgXE9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d0326b60bb753627437fff0f76bf1525bcda422
commit: 000e589e413dd734f191ba4e73340559e65f104d [12681/12687] Merge branch 'rust-next' of https://github.com/Rust-for-Linux/linux.git
config: arm64-randconfig-r122-20240924 (https://download.01.org/0day-ci/archive/20240925/202409251238.vetlgXE9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240925/202409251238.vetlgXE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251238.vetlgXE9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:22:
>> rust/helpers/spinlock.c:10:23: error: implicit declaration of function 'spinlock_check' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
                                ^
>> rust/helpers/spinlock.c:10:23: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'raw_spinlock_t *' (aka 'struct raw_spinlock *') [-Wint-conversion]
           __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:101:52: note: passing argument to parameter 'lock' here
     extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char *name,
                                                      ^
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:229: rust/helpers/helpers.o] Error 1
>> rust/helpers/spinlock.c:10:23: error: implicit declaration of function 'spinlock_check' is invalid in C99 [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.c:10:23: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'raw_spinlock_t *' (aka 'struct raw_spinlock *') [-Wint-conversion]
   include/linux/spinlock.h:101:52: note: passing argument to parameter 'lock' here
>> clang diag: rust/helpers/spinlock.c:10:23: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'raw_spinlock_t *' (aka 'struct raw_spinlock *') [-Wint-conversion]
   make[3]: *** [rust/Makefile:304: rust/bindings/bindings_helpers_generated.rs] Error 101
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1209: prepare] Error 2
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3 [=n])
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 [=n] || COMPILE_TEST [=y])


vim +/spinlock_check +10 rust/helpers/spinlock.c

876346536c1b59 Andreas Hindborg 2024-08-15   5  
876346536c1b59 Andreas Hindborg 2024-08-15   6  void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
876346536c1b59 Andreas Hindborg 2024-08-15   7  				  struct lock_class_key *key)
876346536c1b59 Andreas Hindborg 2024-08-15   8  {
876346536c1b59 Andreas Hindborg 2024-08-15   9  #ifdef CONFIG_DEBUG_SPINLOCK
876346536c1b59 Andreas Hindborg 2024-08-15 @10  	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
876346536c1b59 Andreas Hindborg 2024-08-15  11  #else
876346536c1b59 Andreas Hindborg 2024-08-15  12  	spin_lock_init(lock);
876346536c1b59 Andreas Hindborg 2024-08-15  13  #endif
876346536c1b59 Andreas Hindborg 2024-08-15  14  }
876346536c1b59 Andreas Hindborg 2024-08-15  15  

:::::: The code at line 10 was first introduced by commit
:::::: 876346536c1b59a5b1b5e44477b1b3ece77647fd rust: kbuild: split up helpers.c

:::::: TO: Andreas Hindborg <a.hindborg@samsung.com>
:::::: CC: Miguel Ojeda <ojeda@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
