Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0BF136657
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517497; cv=none; b=iwhLlGWlBA2maB/g73oLxqcYRwr5zEunRLusSp2MMfe+7UHIBIe1OrCU+LsEf3hE7UHSTTNIRKqrR1N1mVschK00PCb+WRihnE9GJrgH4PNPn2YzAg+KSyUFk0sZAR5yVxJPLUJjxOXZGXKWJJNfs0Z7DSK0BkpaMxfl2RLX2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517497; c=relaxed/simple;
	bh=m/BqefdgEQbHAhE1smATGFxGZYPaDSPKhK5e2S/MDy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhXeO++A2jFX6R1QeWUcjfvByXGRuTYhnB1qHsuaMdeQR+u1qkLpGU1BKJXzXVeSpUNpY5BSFgYxpQQSe604bHKoD5F9h8Pj5f9p06o3Z+BoaapxIG50SJa88MSDmvtg7mb3FKRYB9SDjMnpO+YzeLBmNQd8P7AVMnA1YnDnb60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1Tn1UoW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1Tn1UoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720517495; x=1752053495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/BqefdgEQbHAhE1smATGFxGZYPaDSPKhK5e2S/MDy8=;
  b=J1Tn1UoW5HkhCiukHRWFwPVB17rBPQStD6M2ioUZG5nKgFGQsLz3932T
   ux1IJvpg7kgQG1+kLdgLg2Jhq5rYOFvXpQMTuXM3IaZdukZ5Q48nEs2ux
   s1qjN9EI3Ps9Xx8bRztuX/NpQYVmtDjlNgbQYBDj20Nelxb5O7CF0Ok+f
   EUSLMi5wnvJZBNhQToIjrXVonlcu0kkaKilvqlyQc1X4Utrkl8pmjkCmF
   MJmJEbEjShh43f6B1fDXuq0MmEibj57GeD2w/t1BCyvY8fq82l1lDxwth
   hlhg73LZQ24f1tlzfM4ijtoI35808ir7Lbw1Rc4rut/IrRLATuHY32ZqG
   g==;
X-CSE-ConnectionGUID: kzMoDn62SXiZcaAdV+KEcA==
X-CSE-MsgGUID: rlVX73+MToCKOeYfrKJnTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21627141"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="21627141"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 02:31:23 -0700
X-CSE-ConnectionGUID: TV4L7YxrQBmbh8HG13gDWw==
X-CSE-MsgGUID: YQqmaqeaTZePpll06Q4YMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47896902"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jul 2024 02:31:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR7Bv-000WW4-0P;
	Tue, 09 Jul 2024 09:31:19 +0000
Date: Tue, 9 Jul 2024 17:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 28/28] fs/attr.c:381: warning: Function parameter
 or struct member 'di' not described in 'notify_change'
Message-ID: <202407091717.fnKlCviH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   6f4f5017a9ee4feb212a5aa21decbeebc763340e
commit: 6f4f5017a9ee4feb212a5aa21decbeebc763340e [28/28] fs: add delegated_inode structure for handling delegation breaks
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240709/202407091717.fnKlCviH-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091717.fnKlCviH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091717.fnKlCviH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/attr.c:381: warning: Function parameter or struct member 'di' not described in 'notify_change'
>> fs/attr.c:381: warning: Excess function parameter 'delegated_inode' description in 'notify_change'
--
>> fs/xattr.c:278: warning: Function parameter or struct member 'di' not described in '__vfs_setxattr_locked'
>> fs/xattr.c:278: warning: Excess function parameter 'delegated_inode' description in '__vfs_setxattr_locked'
>> fs/xattr.c:537: warning: Function parameter or struct member 'di' not described in '__vfs_removexattr_locked'
>> fs/xattr.c:537: warning: Excess function parameter 'delegated_inode' description in '__vfs_removexattr_locked'
--
>> fs/namei.c:4395: warning: Function parameter or struct member 'di' not described in 'vfs_unlink'
>> fs/namei.c:4395: warning: Excess function parameter 'delegated_inode' description in 'vfs_unlink'
>> fs/namei.c:4644: warning: Function parameter or struct member 'di' not described in 'vfs_link'
>> fs/namei.c:4644: warning: Excess function parameter 'delegated_inode' description in 'vfs_link'


vim +381 fs/attr.c

7bb698f09bdd01 Andreas Gruenbacher 2021-07-28  351  
27ac0ffeac80ba J. Bruce Fields     2011-09-20  352  /**
fe12cfc17429a4 Jay                 2024-01-09  353   * notify_change - modify attributes of a filesystem object
abf08576afe315 Christian Brauner   2023-01-13  354   * @idmap:	idmap of the mount the inode was found from
27ac0ffeac80ba J. Bruce Fields     2011-09-20  355   * @dentry:	object affected
3fae17468a96f3 Matthew Wilcox      2018-07-03  356   * @attr:	new attributes
27ac0ffeac80ba J. Bruce Fields     2011-09-20  357   * @delegated_inode: returns inode, if the inode is delegated
27ac0ffeac80ba J. Bruce Fields     2011-09-20  358   *
27ac0ffeac80ba J. Bruce Fields     2011-09-20  359   * The caller must hold the i_mutex on the affected object.
27ac0ffeac80ba J. Bruce Fields     2011-09-20  360   *
27ac0ffeac80ba J. Bruce Fields     2011-09-20  361   * If notify_change discovers a delegation in need of breaking,
27ac0ffeac80ba J. Bruce Fields     2011-09-20  362   * it will return -EWOULDBLOCK and return a reference to the inode in
27ac0ffeac80ba J. Bruce Fields     2011-09-20  363   * delegated_inode.  The caller should then break the delegation and
27ac0ffeac80ba J. Bruce Fields     2011-09-20  364   * retry.  Because breaking a delegation may take a long time, the
27ac0ffeac80ba J. Bruce Fields     2011-09-20  365   * caller should drop the i_mutex before doing so.
27ac0ffeac80ba J. Bruce Fields     2011-09-20  366   *
27ac0ffeac80ba J. Bruce Fields     2011-09-20  367   * Alternatively, a caller may pass NULL for delegated_inode.  This may
27ac0ffeac80ba J. Bruce Fields     2011-09-20  368   * be appropriate for callers that expect the underlying filesystem not
27ac0ffeac80ba J. Bruce Fields     2011-09-20  369   * to be NFS exported.  Also, passing NULL is fine for callers holding
27ac0ffeac80ba J. Bruce Fields     2011-09-20  370   * the file open for write, as there can be no conflicting delegation in
27ac0ffeac80ba J. Bruce Fields     2011-09-20  371   * that case.
2f221d6f7b881d Christian Brauner   2021-01-21  372   *
abf08576afe315 Christian Brauner   2023-01-13  373   * If the inode has been found through an idmapped mount the idmap of
abf08576afe315 Christian Brauner   2023-01-13  374   * the vfsmount must be passed through @idmap. This function will then
abf08576afe315 Christian Brauner   2023-01-13  375   * take care to map the inode according to @idmap before checking
2f221d6f7b881d Christian Brauner   2021-01-21  376   * permissions. On non-idmapped mounts or if permission checking is to be
abf08576afe315 Christian Brauner   2023-01-13  377   * performed on the raw inode simply pass @nop_mnt_idmap.
27ac0ffeac80ba J. Bruce Fields     2011-09-20  378   */
abf08576afe315 Christian Brauner   2023-01-13  379  int notify_change(struct mnt_idmap *idmap, struct dentry *dentry,
6f4f5017a9ee4f Jeff Layton         2024-07-08  380  		  struct iattr *attr, struct delegated_inode *di)
^1da177e4c3f41 Linus Torvalds      2005-04-16 @381  {

:::::: The code at line 381 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
