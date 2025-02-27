Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F8192D8A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672447; cv=none; b=i8DB4PvfZgvmuqfUdjUvgI7fVCwCbPliY5nYgfYq1mgHDD9kb8SOZVdn009uJ4yRmjBxUpNQS/0Cf77T12i0wV6n3DIohzJ/B8EOEDIOpnyp7BCOGulgmuWCLzU4zzDNQrUMlRbIZOQbHS6UnzTtQPex52p9odnBFcuqKVCjDpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672447; c=relaxed/simple;
	bh=obCAZ8Ik2eCfCRbq5FxwDNDB2cZnyyy0q91eQA4XPtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQaxObAyhdoGVVsetaRVTmEr2/XSzPiik/zujkj5z9QLPL/s+Phrce7WEimBwAawTZfd88kd/qi9WwrnhbAk42OYuw/lSX5itfHlFyqfs9SzDKydR9NvW6ydSz+9AdzKjGXL6xHCpIp4WjhA8mVtOg0ED+Dgan0xP1J8DTBH/Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlzep9A2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlzep9A2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740672446; x=1772208446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=obCAZ8Ik2eCfCRbq5FxwDNDB2cZnyyy0q91eQA4XPtE=;
  b=hlzep9A2vegSygvT4ACS8hn9pYiwBTfblGhm72kXKfTNqla3iL6AfEJ4
   oYDEVfDEmamtTWi12isp3h6EZywV3M3FXV1gsqWUvo/D0wvTxCyowpPcv
   0vzNp7wHGxGoT26ekOQf7Idz0pF/jM2vbOY/BAn6fMjYAikrASQohcbTW
   dIUkFkxQP9TPJEcd6HqBy4wVuQNur4GJcUrb2USwVzIfDQ76aO4rJciI/
   5vcWu/kP+otLuVYorIUYSoHDGk/l6C4FQoGJKv7AFLsstFvTUtPGGMjVW
   qvhnSEo3Q1E4IEuqOu7BRxRw3SIOAjhOn3VND5U14mITsqexSIumiDbH9
   A==;
X-CSE-ConnectionGUID: qjt2aYdnSUmA2kCROViexw==
X-CSE-MsgGUID: hlxzYInzSaqErz2XV4IwRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45485513"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="45485513"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 08:07:25 -0800
X-CSE-ConnectionGUID: qnjm/sNpSsW2x48CLUQe3w==
X-CSE-MsgGUID: br/JYEqoQlaZZTPaygTKBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="116835821"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Feb 2025 08:07:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tngOs-000De4-1X;
	Thu, 27 Feb 2025 16:06:27 +0000
Date: Fri, 28 Feb 2025 00:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-github:vfs-6.15.async.dir 4/10] fs/sysv/namei.c:275:27:
 error: initialization of 'struct dentry * (*)(struct mnt_idmap *, struct
 inode *, struct dentry *, umode_t)' {aka 'struct dentry * (*)(struct
 mnt_idmap *, struct inode *, struct dentry *, short unsigned int)'} from
 incompatible poi...
Message-ID: <202502272351.BseXPtX2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.15.async.dir
head:   d49e14c16a69c5a3989c32142b986cb863c1debe
commit: 10a5b48c3eeb26bc4fa095dca9a6e7c4a89efdf9 [4/10] Change inode_operations.mkdir to return struct dentry *
config: i386-buildonly-randconfig-004-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272351.BseXPtX2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272351.BseXPtX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272351.BseXPtX2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/sysv/namei.c:275:27: error: initialization of 'struct dentry * (*)(struct mnt_idmap *, struct inode *, struct dentry *, umode_t)' {aka 'struct dentry * (*)(struct mnt_idmap *, struct inode *, struct dentry *, short unsigned int)'} from incompatible pointer type 'int (*)(struct mnt_idmap *, struct inode *, struct dentry *, umode_t)' {aka 'int (*)(struct mnt_idmap *, struct inode *, struct dentry *, short unsigned int)'} [-Werror=incompatible-pointer-types]
     275 |         .mkdir          = sysv_mkdir,
         |                           ^~~~~~~~~~
   fs/sysv/namei.c:275:27: note: (near initialization for 'sysv_dir_inode_operations.mkdir')
   cc1: some warnings being treated as errors


vim +275 fs/sysv/namei.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  265  
^1da177e4c3f41 Linus Torvalds   2005-04-16  266  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  267   * directories can handle most operations...
^1da177e4c3f41 Linus Torvalds   2005-04-16  268   */
c5ef1c42c51b1b Arjan van de Ven 2007-02-12  269  const struct inode_operations sysv_dir_inode_operations = {
^1da177e4c3f41 Linus Torvalds   2005-04-16  270  	.create		= sysv_create,
^1da177e4c3f41 Linus Torvalds   2005-04-16  271  	.lookup		= sysv_lookup,
^1da177e4c3f41 Linus Torvalds   2005-04-16  272  	.link		= sysv_link,
^1da177e4c3f41 Linus Torvalds   2005-04-16  273  	.unlink		= sysv_unlink,
^1da177e4c3f41 Linus Torvalds   2005-04-16  274  	.symlink	= sysv_symlink,
^1da177e4c3f41 Linus Torvalds   2005-04-16 @275  	.mkdir		= sysv_mkdir,

:::::: The code at line 275 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
