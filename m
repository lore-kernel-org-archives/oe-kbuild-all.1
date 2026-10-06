Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC36A318BB8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323982; cv=none; b=TpX9FYSFblawkyndmigBGq2U78P8XkK9pMcgCtNaAmQ1WLuYU7GNSQeGygJVEWjQ0W4oWQz7NK9O/50Oq5G3cKlxk6fGx3OQnBuytZsUjU86gJWIBYNq6i6j9pxSmNiTFnHofw9NtFDCX0hf8PcSJb/IDvVx2k/ruIqrwGAsLsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323982; c=relaxed/simple;
	bh=0VYSoYxqLYQ1W2TnfsFgqV/xwTl4JwpEMdwPj0Zn9g4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E1UMLz1K+K9+pD+4fNtZFK7e4dlHQZ7ACnTxgAEgsWDVmsk+HGaLGaj6GL2wtZlF5hFHNCQXINtV0Tu3HtE/dSKa/f7Vx0tLQIAH0ziHooc5H6xWE52qsrPTstjnrCbqCUuOVc6zU/yUg4XgVY4mgcwADQUF7xsEmz0+Bgp2nDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDRL0yqE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDRL0yqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791323981; x=1822859981;
  h=date:from:to:cc:subject:message-id;
  bh=0VYSoYxqLYQ1W2TnfsFgqV/xwTl4JwpEMdwPj0Zn9g4=;
  b=JDRL0yqETLpfh2+gHr/b5XTuXbjuHM3u++9zOsA6mYCiu5G5rsiBEHK6
   9UOrABUNTUFu/ybsYirYNka5KnrxgOBtVG4HgDGGGDpDLSW9IRojn32I9
   cEtnxCPyQpvjF8xSinZNsFNzknFfP0ak0r8hUWQiZFXk8vVkopvk+Hi9F
   azFqN2M3Xm3jzMUrMSNEkTtwKmKOoTvVgcrSZ2N2DB7+cUY1gdF7V82or
   fjjbLoyCpZqSzFI1EDeXxqoq+tDMQ0SRA3zh5Kx+4DrqskajLGQwz37wh
   Odj9jDwe/dhIPbwoxGC3opB20DQKGXzbNNkl42aF9HJ6ARUbQNDl3m0my
   A==;
X-CSE-ConnectionGUID: qwrYCJpORmCZCPrVltjxCw==
X-CSE-MsgGUID: VlF+ngQLTzGHAEckhLVlDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="70616"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="70616"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 14:59:41 -0700
X-CSE-ConnectionGUID: PWyQA4yFTemb5ELjlTrf1Q==
X-CSE-MsgGUID: tItPvfgRTPODgm159qPsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280504084"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 14:59:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEDCD-000000001sB-06aV;
	Tue, 06 Oct 2026 21:59:37 +0000
Date: Tue, 06 Oct 2026 23:59:30 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.all 15/19] fs/nullfs.c:85:27: error:
 initialization of 'int (*)(const struct mnt_idmap *, struct dentry *, struct
 iattr *)' from incompatible pointer type 'int (*)(struct mnt_idmap *, struct
 dentry *, struct iattr *)'
Message-ID: <202610062313.8eCcAYfd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs.all
head:   fc127f59f888a5a041b8c335b439f363a68083a3
commit: 7044f4dc0f8819c37a1d788228539ea027636625 [15/19] Merge branch 'vfs-7.4.mount' into vfs.all
config: i386-randconfig-2200-20261006 (https://download.01.org/0day-ci/archive/20261006/202610062313.8eCcAYfd-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610062313.8eCcAYfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610062313.8eCcAYfd-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nullfs.c: In function 'nullfs_file_write_iter':
   fs/nullfs.c:57:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
      57 |         size_t count = iov_iter_count(from);
         |                        ^~~~~~~~~~~~~~
   fs/nullfs.c:59:9: error: implicit declaration of function 'iov_iter_advance'; did you mean 'bvec_iter_advance'? [-Werror=implicit-function-declaration]
      59 |         iov_iter_advance(from, count);
         |         ^~~~~~~~~~~~~~~~
         |         bvec_iter_advance
   fs/nullfs.c: At top level:
>> fs/nullfs.c:85:27: error: initialization of 'int (*)(const struct mnt_idmap *, struct dentry *, struct iattr *)' from incompatible pointer type 'int (*)(struct mnt_idmap *, struct dentry *, struct iattr *)' [-Werror=incompatible-pointer-types]
      85 |         .setattr        = nullfs_file_setattr,
         |                           ^~~~~~~~~~~~~~~~~~~
   fs/nullfs.c:85:27: note: (near initialization for 'nullfs_file_inode_operations.setattr')
   cc1: some warnings being treated as errors


vim +85 fs/nullfs.c

1a5353e584154c Christian Brauner 2026-10-05  83  
1a5353e584154c Christian Brauner 2026-10-05  84  static const struct inode_operations nullfs_file_inode_operations = {
1a5353e584154c Christian Brauner 2026-10-05 @85  	.setattr	= nullfs_file_setattr,
1a5353e584154c Christian Brauner 2026-10-05  86  };
1a5353e584154c Christian Brauner 2026-10-05  87  

:::::: The code at line 85 was first introduced by commit
:::::: 1a5353e584154c66d8d8c520f0ae4cea9fd18195 fixup! nullfs: add an empty immutable regular file

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
