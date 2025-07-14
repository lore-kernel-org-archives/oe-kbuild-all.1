Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3C139579
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752497348; cv=none; b=ldxrHPFAzMALs4h6yOR1ZSk+JVQ0eE2dOEqxpJ31kMORWbhNlZiCZZEXdIxQNN+ZSf6H2EehukbrusSyfXfBEpS1yF0XKv8wDvObVbY5TbR8NkWD7gJt1ZEJ9qllr40AtdmLhpcnKMavzjelNC/hm6NA8UMJiTYoD0JVFJbKDEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752497348; c=relaxed/simple;
	bh=ru5dzUGuVWBWM2BV8fhw+sNou7TNB7Qth2//o/MFsX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InspviRgy2qaUC5mY0IgzwSgXqcEUFJmoocjx9F72qAOe/bkOK7uDHf8MuwKYXJDwTMzLenm3felFujYWF2d6Ef+E8JHehoiQ0SEmb/79o/eTHNqm70jrTUPxYl1uBicjJ43xmbDbxDKAVNZDv/c3IduV2SznoNrA+cyYn6Z6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0cLs8V1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0cLs8V1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752497346; x=1784033346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ru5dzUGuVWBWM2BV8fhw+sNou7TNB7Qth2//o/MFsX0=;
  b=O0cLs8V1ap2aXdUbC7LEYaZzQhErz9IiGvvaTR3EcEOV1dcS8CF82fTL
   zyL/ornYimygIJ/WOaWbS+Sk22qxLOP44YrwMJJ9sMnQcAaCCD3qWLgkA
   oZ0glT7maNDDddsHxePJAi0T4onp69HcAuNfdAID776N4j0LLnr5dckGV
   bBJgOrL8pQ6vnIDiz4cM5fPc1vpBIst5XK8b9Vh0OrFec/YSSEw4Gz4E8
   rroOmXC3s7wlbVmbBb7wLjGkgQ05f105IyMub8vfUbUQFU79u9cdtcpoV
   /kpqJmTL7Sc3EDTJ4zRXoblcQRoAVcHwyWWqFfwbHtvgpNUa4Ff/Xt7K2
   g==;
X-CSE-ConnectionGUID: DbiWeej0RLi7VakvwQu9rw==
X-CSE-MsgGUID: UZSFYBADSeWOrtnk7veEsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54659130"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="54659130"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 05:49:05 -0700
X-CSE-ConnectionGUID: yM+wAHaCRKSLOogV/yAMLg==
X-CSE-MsgGUID: NC3SY2PNSPu626mW+wFJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="160938071"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jul 2025 05:49:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubIcA-0008sN-0T;
	Mon, 14 Jul 2025 12:49:02 +0000
Date: Mon, 14 Jul 2025 20:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: Taotao Chen <chentaotao@didiglobal.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs-6.17.misc 19/22] fs/ubifs/file.c:1628:27: error:
 initialization of 'int (*)(const struct kiocb *, struct address_space *,
 loff_t,  unsigned int,  unsigned int,  struct folio *, void *)' {aka 'int
 (*)(const struct kiocb *, struct address_space *, long long int,  unsigned
 i...
Message-ID: <202507142040.wppyoX1s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.17.misc
head:   0f235ca12321e6d38c99fa74251729c5b78e6d91
commit: 254a06118b314c34ab903cf8b2aef0d683428ff7 [19/22] fs: change write_begin/write_end interface to take struct kiocb *
config: i386-buildonly-randconfig-005-20250714 (https://download.01.org/0day-ci/archive/20250714/202507142040.wppyoX1s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507142040.wppyoX1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142040.wppyoX1s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ubifs/file.c:1628:27: error: initialization of 'int (*)(const struct kiocb *, struct address_space *, loff_t,  unsigned int,  unsigned int,  struct folio *, void *)' {aka 'int (*)(const struct kiocb *, struct address_space *, long long int,  unsigned int,  unsigned int,  struct folio *, void *)'} from incompatible pointer type 'int (*)(struct kiocb *, struct address_space *, loff_t,  unsigned int,  unsigned int,  struct folio *, void *)' {aka 'int (*)(struct kiocb *, struct address_space *, long long int,  unsigned int,  unsigned int,  struct folio *, void *)'} [-Werror=incompatible-pointer-types]
    1628 |         .write_end      = ubifs_write_end,
         |                           ^~~~~~~~~~~~~~~
   fs/ubifs/file.c:1628:27: note: (near initialization for 'ubifs_file_address_operations.write_end')
   cc1: some warnings being treated as errors


vim +1628 fs/ubifs/file.c

064c73498601139 Eric Biggers            2021-07-01  1623  
e8b815663b1bfd9 Artem Bityutskiy        2009-01-15  1624  const struct address_space_operations ubifs_file_address_operations = {
0b7bf4830a3031d Matthew Wilcox (Oracle  2022-04-29  1625) 	.read_folio     = ubifs_read_folio,
0df030d082d5b22 Matthew Wilcox (Oracle  2024-01-24  1626) 	.writepages     = ubifs_writepages,
1e51764a3c2ac05 Artem Bityutskiy        2008-07-14  1627  	.write_begin    = ubifs_write_begin,
1e51764a3c2ac05 Artem Bityutskiy        2008-07-14 @1628  	.write_end      = ubifs_write_end,
58a2fdb61bbb2e7 Matthew Wilcox (Oracle  2022-02-09  1629) 	.invalidate_folio = ubifs_invalidate_folio,
1f1d14dbc39a3e9 Matthew Wilcox (Oracle  2022-02-09  1630) 	.dirty_folio	= ubifs_dirty_folio,
e7b15bae558cc11 Matthew Wilcox (Oracle  2022-06-06  1631) 	.migrate_folio	= filemap_migrate_folio,
bcaabc55491203f Matthew Wilcox (Oracle  2022-05-01  1632) 	.release_folio	= ubifs_release_folio,
1e51764a3c2ac05 Artem Bityutskiy        2008-07-14  1633  };
1e51764a3c2ac05 Artem Bityutskiy        2008-07-14  1634  

:::::: The code at line 1628 was first introduced by commit
:::::: 1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d UBIFS: add new flash file system

:::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
:::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
