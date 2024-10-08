Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A92141DA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418272; cv=none; b=nHo6w6S1tPjJFJnu4rFJgjM2NqPqG7jX4PGTuotcFJuUYJ0Tw8fyCJ58Xud7w2PHJ2ByGhccEE0RZmvRe49m2mZQHztZSsXy1drVAaN3OuRs4W7b1x3E17s7G+kztXS2yaq08d6OXpaDWNmKvW4p2Ut5lgxdfeVwPCa7V/9Hcpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418272; c=relaxed/simple;
	bh=Oyrco5hd0rKqXYioclBTn+7N9ZQNNoyWSP08btqiBH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSY2CUWN6zkefutCBHCQyafWlh/YmlWV2fln7kOhNbHnMX4gx6QLdcRvNaWuUnaQ8cyAuNoAanhShN4itOx0siRgI7kNdAJcSWuWTxn2vOIzjGHMWR1mG4/qqY0wEq3MP+V+4AyyPbnidHlBMlUF+UnM1g521X/lVfNqjgKxrbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiR93To6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiR93To6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728418270; x=1759954270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oyrco5hd0rKqXYioclBTn+7N9ZQNNoyWSP08btqiBH8=;
  b=fiR93To604S06rroVBoWNZKTDyLu+TClA+ocX+cF6h919H43GTvyydBR
   dFpRPQSmMjfXaBtP5ndXQ5N81JVIGM7FbTo9ICn7j8JLvQZhuqH+6pK4z
   dR3jJoKGsDOPdf5c3PKNwN+2Ynfk7FLyYBHeakvR8OWzeo1vN7UlK9HgF
   VbagCmW6nPiNbRPcTuZLeImjur3mBnJw8qJ5jApD88qGV8Ib8uRzigLXV
   qLgnjypoO8DGegprkLJmRMyg4FqwlYBmmMNVpELLh821N5rxXow/2rv/I
   Sb/tqNfbCGD5LwQ2PoEaMyPnq+tF4HWvhZPKoRUvF7+cKKor1kLrC8q0c
   g==;
X-CSE-ConnectionGUID: sRHhYgoGR5SVrprTNoQ/Lw==
X-CSE-MsgGUID: HQVsrxSFTDaO4pb7f4Npuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31438724"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="31438724"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 13:11:09 -0700
X-CSE-ConnectionGUID: /xtq9AuzTWehzDs5EoN6KQ==
X-CSE-MsgGUID: gpi/rJtlRuyQLH/c+xxSdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="80433869"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2024 13:11:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syGXy-0008L6-0T;
	Tue, 08 Oct 2024 20:11:06 +0000
Date: Wed, 9 Oct 2024 04:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.file 2/3]
 arch/arm64/include/asm/cmpxchg.h:170:1: sparse: sparse: cast truncates bits
 from constant value (e000000000000000 becomes 0)
Message-ID: <202410090407.hFEftOPC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.file
head:   a9fcbdac8eaed571c4d8a88a4114f575106da295
commit: 1e4c5328b2876b3ec4cd951226c9886ea10b3fb4 [2/3] fs: add file_ref
config: arm64-randconfig-r121-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090407.hFEftOPC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410090407.hFEftOPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090407.hFEftOPC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/file.c:486:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:486:17: sparse:     expected struct file **old_fds
   fs/file.c:486:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:487:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:487:17: sparse:     expected struct file **new_fds
   fs/file.c:487:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:502:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:502:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:502:17: sparse:    struct file *
   fs/file.c:537:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   fs/file.c:537:54: sparse:     expected struct file *file
   fs/file.c:537:54: sparse:     got struct file [noderef] __rcu *[assigned] __ret
   fs/file.c:577:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:577:28: sparse:     expected struct fdtable [noderef] __rcu *fdt
   fs/file.c:577:28: sparse:     got struct fdtable *
   fs/file.c:760:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:760:14: sparse:     expected struct file *file
   fs/file.c:760:14: sparse:     got struct file [noderef] __rcu *
   fs/file.c:950:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:950:30: sparse:     expected struct file *file
   fs/file.c:950:30: sparse:     got struct file [noderef] __rcu *
   fs/file.c:971:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:971:14: sparse:     expected struct file [noderef] __rcu *file
   fs/file.c:971:14: sparse:     got struct file *
   fs/file.c:975:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic64_t [usertype] *v @@     got struct atomic64_t [noderef] __rcu * @@
   fs/file.c:975:13: sparse:     expected struct atomic64_t [usertype] *v
   fs/file.c:975:13: sparse:     got struct atomic64_t [noderef] __rcu *
   fs/file.c:978:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:978:23: sparse:     expected struct file [noderef] __rcu *file_reloaded
   fs/file.c:978:23: sparse:     got struct file *
   fs/file.c:1001:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:1001:24: sparse:     expected struct file *
   fs/file.c:1001:24: sparse:     got struct file [noderef] __rcu *file_reloaded
   fs/file.c:1003:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1003:14: sparse:     expected struct file *
   fs/file.c:1003:14: sparse:     got struct file [noderef] __rcu *file
   fs/file.c:1024:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1024:22: sparse:     expected struct file [noderef] __rcu *file
   fs/file.c:1024:22: sparse:     got struct file *
   fs/file.c:1026:32: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1026:32: sparse:     expected struct file *
   fs/file.c:1026:32: sparse:     got struct file [noderef] __rcu *file
   fs/file.c:1048:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file **f @@
   fs/file.c:1048:31: sparse:     expected struct file [noderef] __rcu **f
   fs/file.c:1048:31: sparse:     got struct file **f
   fs/file.c:1048:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1048:14: sparse:     expected struct file [noderef] __rcu *file
   fs/file.c:1048:14: sparse:     got struct file *
   fs/file.c:1052:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *[assigned] file @@
   fs/file.c:1052:16: sparse:     expected struct file *
   fs/file.c:1052:16: sparse:     got struct file [noderef] __rcu *[assigned] file
   fs/file.c:1354:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@
   fs/file.c:1354:16: sparse:     expected struct file *tofree
   fs/file.c:1354:16: sparse:     got struct file [noderef] __rcu *
   fs/file.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/linux/jump_label.h, ...):
>> arch/arm64/include/asm/cmpxchg.h:170:1: sparse: sparse: cast truncates bits from constant value (e000000000000000 becomes 0)
>> arch/arm64/include/asm/cmpxchg.h:170:1: sparse: sparse: cast truncates bits from constant value (e000000000000000 becomes 0)
>> arch/arm64/include/asm/cmpxchg.h:170:1: sparse: sparse: cast truncates bits from constant value (e000000000000000 becomes 0)

vim +170 arch/arm64/include/asm/cmpxchg.h

10b663aef1c247 Catalin Marinas 2012-03-05  167  
305d454aaa292b Will Deacon     2015-10-08  168  __CMPXCHG_GEN()
305d454aaa292b Will Deacon     2015-10-08  169  __CMPXCHG_GEN(_acq)
305d454aaa292b Will Deacon     2015-10-08 @170  __CMPXCHG_GEN(_rel)
305d454aaa292b Will Deacon     2015-10-08  171  __CMPXCHG_GEN(_mb)
10b663aef1c247 Catalin Marinas 2012-03-05  172  

:::::: The code at line 170 was first introduced by commit
:::::: 305d454aaa292be3a09a9d674e6c35f5b4249a13 arm64: atomics: implement native {relaxed, acquire, release} atomics

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
