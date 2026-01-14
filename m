Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24237F8A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379979; cv=none; b=hW/IcPNwSzidlGGj2Lvi1JNCVDvNTS0WBdAuV8mRw9Zf+hGupKjDfdKCYAAiuLwPtQBz8ezQPA5LJjbbk/98djniMDtT/TO4DRsGD7l2RPyGv+k3hOCcOh8y9yDaoypFpaEtfcqM7zF8nVXe6poetfzLEFkPn361lRgpP5VOQZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379979; c=relaxed/simple;
	bh=etZo0R6nFDXhyMLlVdc82tstIlm+AHsVMrhjdc2LicQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A5chpikxTV5mzMbtjuzmamJJHkL0OHU8teCqh7miCeYzpqhOPlfunqPpSg/ou/Sby2s9HEBDUMecmQ+sYwMkLObuYzNXKhK4pANq9T6uzTcTLpeuwzzI8/dGS2STDo9s3URvKn4FdvK9IpnZF7IaVQ5tbt93yQ0aOSmE8Wzj9ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XC2NgjfC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XC2NgjfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768379972; x=1799915972;
  h=date:from:to:cc:subject:message-id;
  bh=etZo0R6nFDXhyMLlVdc82tstIlm+AHsVMrhjdc2LicQ=;
  b=XC2NgjfCk70W1MeiKXTamjI3XzulyZYGqQR98p39lmVxr5ZsOGl3vkR0
   ipzQvQcFLcT0GdcuaTlCrypI2bEbp/Ddg1PoEluLhinIPCqaHRlOcceGf
   2rg41h+GYTel1xhbHrflN4zrINWojk5vzb3hOyuhnrWJf9MRRZTDf6W+w
   Epo6Yn/MWzCreACN0ju3fjCObQ6K0XNqOtH93FpDKhP9aPKIOip962U8z
   LIRAjbgFsZrcXvtyRceYgnIVBUhs6fEpUMcts30pY9lMgh6ljxmNEmEJz
   cVnIepMn5lTS9DlsE9lGVeGTbzilThqo8VlFG5vnnLBAJsj3PeypdZTSW
   A==;
X-CSE-ConnectionGUID: RLebzS92TR6uR6fjVmxRmA==
X-CSE-MsgGUID: +S2JAAfvT6i0iIVI5SlizQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80394578"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="80394578"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:39:28 -0800
X-CSE-ConnectionGUID: rEpPoWTaSze481V5XDA4+Q==
X-CSE-MsgGUID: OraR+DClSWOr3p+cOMkwHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209079264"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2026 00:39:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfwPU-00000000G5N-288F;
	Wed, 14 Jan 2026 08:39:24 +0000
Date: Wed, 14 Jan 2026 16:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 196/202]
 fs/bcachefs/fs/inode.h:146:68: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202601141649.CWI0c6jX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   66eb216a5a200c4da642e3407fd9ea58388ae35f
commit: d523781cfc5e70cdb73bdc883a3271ca65e7206e [196/202] bcachefs: Improve bch2_inode_peek() error message
config: hexagon-randconfig-r133-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141649.CWI0c6jX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141649.CWI0c6jX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141649.CWI0c6jX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/fs/quota.c: note: in included file:
>> fs/bcachefs/fs/inode.h:146:68: sparse: sparse: Using plain integer as NULL pointer
--
   fs/bcachefs/snapshots/subvolume.c: note: in included file (through fs/bcachefs/fs/str_hash.h, fs/bcachefs/fs/dirent.h, fs/bcachefs/fs/namei.h):
>> fs/bcachefs/fs/inode.h:146:68: sparse: sparse: Using plain integer as NULL pointer
--
   fs/bcachefs/vfs/fs.c: note: in included file:
   fs/bcachefs/data/reconcile.h:38:17: sparse: sparse: invalid access past the end of '<noident>' (4 8)
   fs/bcachefs/data/reconcile.h:38:17: sparse: sparse: invalid access past the end of '<noident>' (4 8)
   fs/bcachefs/vfs/fs.c:308:13: sparse: sparse: context imbalance in '__wait_on_freeing_inode' - unexpected unlock
   fs/bcachefs/vfs/fs.c:324:30: sparse: sparse: context imbalance in 'bch2_inode_hash_find' - wrong count at exit
   fs/bcachefs/vfs/fs.c: note: in included file (through fs/bcachefs/fs/str_hash.h, fs/bcachefs/fs/check.h):
>> fs/bcachefs/fs/inode.h:146:68: sparse: sparse: Using plain integer as NULL pointer

vim +146 fs/bcachefs/fs/inode.h

1f73cb4d34e787 fs/bcachefs/inode.h    Kent Overstreet 2024-09-24  129  
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  130  #define bch2_inode_peek(_trans, _iter, _inode, _inum, _flags)			\
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  131  	__bch2_inode_peek(_trans, _iter, _inode, _inum, _flags, __func__)
4bd156c4b44ef3 fs/bcachefs/inode.h    Kent Overstreet 2023-11-02  132  
77eac89c7943a4 fs/bcachefs/inode.h    Kent Overstreet 2025-05-19  133  int bch2_inode_find_by_inum_snapshot(struct btree_trans *, u64, u32,
77eac89c7943a4 fs/bcachefs/inode.h    Kent Overstreet 2025-05-19  134  				     struct bch_inode_unpacked *, unsigned);
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  135  
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  136  int __bch2_inode_find_by_inum_trans(struct btree_trans *, subvol_inum,
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  137  				    struct bch_inode_unpacked *, const char *);
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  138  
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  139  #define bch2_inode_find_by_inum_trans(_trans, _inum, _inode)			\
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  140  	__bch2_inode_find_by_inum_trans(_trans, _inum, _inode, __func__)
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  141  
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  142  static inline int bch2_inode_find_by_inum_nowarn_trans(struct btree_trans *trans,
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  143  				  subvol_inum inum,
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  144  				  struct bch_inode_unpacked *inode)
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  145  {
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23 @146  	return __bch2_inode_find_by_inum_trans(trans, inum, inode, false);
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  147  }
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  148  

:::::: The code at line 146 was first introduced by commit
:::::: b79004442bee4220b66da61d8610383092925392 bcachefs: Don't warn when inode not found in bch2_fh_to_dentry()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
