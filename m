Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCCF186E40
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 04:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736225029; cv=none; b=ULb6bKwiH59L1uDdpx/j2Cq7+ajCqdDd3HheP9L00TYwUGwxmb96eXVBT13m+oQgHiZvPkbER+CUkwMDSX3jTlJD/9lLeO9GGHanLVBLxhlPoxmiLEwcjv513mC0Jr9hU5gBEdG7Jusy7XuAxxPb88wESPsRE0sdhAJ8+NWk+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736225029; c=relaxed/simple;
	bh=D03ILILykj+h7eJtYCGuNPXx2nMAaO1BS0gOBL+aIFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jTIRPf5xTrxMfTZSXyximAmlYzOh97f16GIyMqau+IXQbRBehVUIp2ROyhkkKUzOeiJ+s51p09+fWEptQTSOo11UXCHdml9SYFmlDveTvX+WQBFJvamsfyFsqtvAFfgzAAPXK7F0EktpRZUrusEp0d/h3P4uV3yAEQwEhpCW8ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1dErRgb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1dErRgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736225026; x=1767761026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D03ILILykj+h7eJtYCGuNPXx2nMAaO1BS0gOBL+aIFo=;
  b=B1dErRgb5f8HuROHl8iDJZdzBEx1VpWPGpIxQTxVMoNxAY+y9pDCUb2g
   us5sQzxakMpK44ebwClWuWF+R0fgHOQb5hDCMojDGHodyKysZG5ItDjZt
   d8rGPHv97xAfaHqTDIUYKQZ2QxvRNjfQt4LrCnOeGtMxqdiWiNSxDULze
   VF8bZtPe5dDFnuQkyzouQRrK+XYVOkoPKgzFwmtmBfWvQcHuKPHiJnn2M
   VeAq2DcHKmpUY8x5KnEnl/ouXJx4udXJs7ZS69y679cgiNSjHyRqU51cY
   biPE940HQIh3fvGfI2z8SdXzEPk9cvjlBSOEj+dGePhV65D9GXjs5H2if
   g==;
X-CSE-ConnectionGUID: qthckv9yTTajtCuv+xr+hQ==
X-CSE-MsgGUID: fMLeIF9KS1+zroYFrZ1cIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35689224"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="35689224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 20:43:42 -0800
X-CSE-ConnectionGUID: +H6WXs1TQ0uxZKb6wlR3Tw==
X-CSE-MsgGUID: GDTmpg3JTeypMlgvOdyMzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="133507277"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jan 2025 20:43:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV1RK-000EFt-2b;
	Tue, 07 Jan 2025 04:43:38 +0000
Date: Tue, 7 Jan 2025 12:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-01 1/1] fs/smb/server/vfs.c:74:
 warning: Function parameter or member 'user_ns' not described in
 'ksmbd_vfs_lock_parent'
Message-ID: <202501071243.8NGdTXTX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-01
head:   bd15ae767bd293b77e31786ef49abaee8cc016d8
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [1/1] smb: move client and server files to common directory fs/smb
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250107/202501071243.8NGdTXTX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071243.8NGdTXTX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071243.8NGdTXTX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/vfs.c:74: warning: Function parameter or member 'user_ns' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:74: warning: Function parameter or member 'parent' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:74: warning: Function parameter or member 'child' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:366: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_read'
   fs/smb/server/vfs.c:366: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_read'
   fs/smb/server/vfs.c:482: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_write'
   fs/smb/server/vfs.c:482: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_write'
   fs/smb/server/vfs.c:545: warning: Function parameter or member 'path' not described in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Function parameter or member 'stat' not described in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Excess function parameter 'work' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Excess function parameter 'attrs' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:562: warning: Function parameter or member 'p_id' not described in 'ksmbd_vfs_fsync'
   fs/smb/server/vfs.c:585: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_remove_file'
   fs/smb/server/vfs.c:645: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_link'
   fs/smb/server/vfs.c:846: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_truncate'
   fs/smb/server/vfs.c:846: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_truncate'
   fs/smb/server/vfs.c:887: warning: Excess function parameter 'size' description in 'ksmbd_vfs_listxattr'
>> fs/smb/server/vfs.c:964: warning: Function parameter or member 'attr_name' not described in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Function parameter or member 'attr_value' not described in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Function parameter or member 'attr_size' not described in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Excess function parameter 'name' description in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Excess function parameter 'value' description in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Excess function parameter 'size' description in 'ksmbd_vfs_setxattr'
   fs/smb/server/vfs.c:984: warning: Function parameter or member 'option' not described in 'ksmbd_vfs_set_fadvise'
   fs/smb/server/vfs.c:984: warning: Excess function parameter 'options' description in 'ksmbd_vfs_set_fadvise'
   fs/smb/server/vfs.c:1180: warning: Function parameter or member 'um' not described in 'ksmbd_vfs_lookup_in_dir'
>> fs/smb/server/vfs.c:1214: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_kern_path'


vim +74 fs/smb/server/vfs.c

f44158485826c07 fs/cifsd/vfs.c Namjae Jeon       2021-03-16  62  
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  63  /**
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  64   * ksmbd_vfs_lock_parent() - lock parent dentry if it is stable
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  65   *
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  66   * the parent dentry got by dget_parent or @parent could be
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  67   * unstable, we try to lock a parent inode and lookup the
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  68   * child dentry again.
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  69   *
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  70   * the reference count of @parent isn't incremented.
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  71   */
da1e7ada5b62859 fs/ksmbd/vfs.c Christian Brauner 2021-08-23  72  int ksmbd_vfs_lock_parent(struct user_namespace *user_ns, struct dentry *parent,
da1e7ada5b62859 fs/ksmbd/vfs.c Christian Brauner 2021-08-23  73  			  struct dentry *child)
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23 @74  {
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  75  	struct dentry *dentry;
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  76  	int ret = 0;
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  77  
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  78  	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
da1e7ada5b62859 fs/ksmbd/vfs.c Christian Brauner 2021-08-23  79  	dentry = lookup_one(user_ns, child->d_name.name, parent,
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  80  			    child->d_name.len);
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  81  	if (IS_ERR(dentry)) {
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  82  		ret = PTR_ERR(dentry);
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  83  		goto out_err;
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  84  	}
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  85  
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  86  	if (dentry != child) {
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  87  		ret = -ESTALE;
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  88  		dput(dentry);
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  89  		goto out_err;
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  90  	}
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  91  
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  92  	dput(dentry);
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  93  	return 0;
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  94  out_err:
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  95  	inode_unlock(d_inode(parent));
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  96  	return ret;
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  97  }
333111a6dc32a27 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  98  

:::::: The code at line 74 was first introduced by commit
:::::: 333111a6dc32a2768f581876bdb5ef4231f5084e ksmbd: factor out a ksmbd_vfs_lock_parent helper

:::::: TO: Hyunchul Lee <hyc.lee@gmail.com>
:::::: CC: Namjae Jeon <namjae.jeon@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
