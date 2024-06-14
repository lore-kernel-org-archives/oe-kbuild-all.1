Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15712146D51
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 05:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718341599; cv=none; b=drulj65GGgDocJ7nOMDSPRCbaBJxDPYCIGSjo4Ec47IVHQcABnlUYMM23uTlTT3E677DWQXz8/8SYPbA/pPEGvVdqREqsMmCyN778Oewqc0kJ9AVa4Cux74cs/T2nXNKH0IN+6keP3Ab73wchnc2j/ErC4i67FLS017gj6WVoQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718341599; c=relaxed/simple;
	bh=kZBqs7M5ec5oocyKq95H+8kb7DZSNtb2MOhmAJ9L+V4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XvfRf9pFBWMVdTcS/MRmA+h/XK1p/U2fe3SBSDPrK5Yp6EUS3O+BNi3wB9nG022/fj2IW6BUoU8X1hUHhOT+sqevNTsZjujul3a0XUQg2axpCZMwm6uUT+xCEmZG8h137+CnQwG+elHf4k4/QiFSJdAHOLmU6zEUFKo/NEUJKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVbGXtMJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVbGXtMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718341598; x=1749877598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kZBqs7M5ec5oocyKq95H+8kb7DZSNtb2MOhmAJ9L+V4=;
  b=CVbGXtMJVekfqnXbqNBkYyzTt577h8s5OmUX7dCe7e1D0xgNqqUs4EXF
   Rfi7qGOzZjHEZcvW81F3Yrvy9+/cwBDaApep3ZxhvimU906uDz7wuLpBi
   D00pqNXTGYVKd+JVhR+UVIGlgKXk7eOVLQ5nge4yA3Zwrx/lVv9XGzxPZ
   KO5xPK8/Oqy7PwvlpSa/7MX8GFGIH7PgWtZFPWBReOKsknPQpI5P+CosC
   2jHQ7AZQN5LtAkXxWvlKtMj+4QC3weeuEeTFYABXWesnmw/SrwJYmbw3z
   RzUIh9yvplecbQ0bqNXLW3tCcgUTG0hDCld14GDORYPPk1oOmsSvTl5WY
   Q==;
X-CSE-ConnectionGUID: mWFcFhY5TZCZ1HSYgE6wNQ==
X-CSE-MsgGUID: 58dLHXlmQ5yn29ZF+evgZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="12069404"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="12069404"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 22:06:38 -0700
X-CSE-ConnectionGUID: Q24dIGuZR8e7raK7jHc6yw==
X-CSE-MsgGUID: FWnGl2sVQKKKKSRKOFdz7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="71595192"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2024 22:06:36 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHz90-0000qK-1r;
	Fri, 14 Jun 2024 05:06:34 +0000
Date: Fri, 14 Jun 2024 13:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 3/10] include/linux/fs.h:1612:1: error: expected
 identifier or '(' before '{' token
Message-ID: <202406141312.4dcVaunY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   0418364991ef20583c19f070a31c0bfd69e6ff2d
commit: 93cf54e6a44ed9fd04da6413752517c6a9e2c919 [3/10] fs: uninline inode_get_ctime and inode_set_ctime_to_ts
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240614/202406141312.4dcVaunY-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141312.4dcVaunY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141312.4dcVaunY-lkp@intel.com/

Note: the jlayton/mgtime HEAD 0418364991ef20583c19f070a31c0bfd69e6ff2d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/compat.h:17,
                    from arch/x86/include/asm/ia32.h:7,
                    from arch/x86/include/asm/elf.h:10,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
>> include/linux/fs.h:1612:1: error: expected identifier or '(' before '{' token
    1612 | {
         | ^
   make[3]: *** [scripts/Makefile.build:117: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1612 include/linux/fs.h

077c212f0344ae Jeff Layton 2023-10-04  1610  
93cf54e6a44ed9 Jeff Layton 2024-05-16  1611  struct timespec64 inode_get_ctime(const struct inode *inode);
077c212f0344ae Jeff Layton 2023-10-04 @1612  {
012c4fd80d5f14 Jeff Layton 2024-05-16  1613  	return ktime_to_timespec64(inode->__i_ctime);
077c212f0344ae Jeff Layton 2023-10-04  1614  }
077c212f0344ae Jeff Layton 2023-10-04  1615  

:::::: The code at line 1612 was first introduced by commit
:::::: 077c212f0344ae4198b2b51af128a94b614ccdf4 fs: new accessor methods for atime and mtime

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
