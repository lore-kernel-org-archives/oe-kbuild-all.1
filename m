Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D118F6B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 20:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748205445; cv=none; b=EihX3owni3AHI8GoQkybIFgx4asVFr6LwqvSM/qLtUtZkVCQL+/y6ZhxgBhu16d82Y6KZrJTE05NVdHuTs9W08HAnBqP5dp/SDwKxWJg9Dd/+lFyqMHYckC7PvlzIZdEZIvX2L2Bf6VQGRoZIe88ifYPm+T2rFvCEZ50xd/BsDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748205445; c=relaxed/simple;
	bh=qtXCOv7Br6eODO9bhcMhUMDodV3Fz69KJJL8DdkoXDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WTYFBdbP9foEIAo1JC4fLPBDpLcpgQK2FUI1dPbl/bqurLuL0NQfCV0lgzh34jA+KEAS03QlQ9/zmWrqX3r/w4eHj7yHtd7ACgZIt6eqm+CCtayTikpXoBtkoCaK8bG84LQd9SqzhY+BVsTwKg0G3B8fk79GeIOBoYV8tybgEho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTEIQYiq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTEIQYiq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748205444; x=1779741444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qtXCOv7Br6eODO9bhcMhUMDodV3Fz69KJJL8DdkoXDc=;
  b=gTEIQYiqTokrJef/Uv7Afqid0yp6Jzn6mc2j5e91nnCTpfqKhUPEl3K6
   G7c+WCy7mmblPLvepvA++TGxcJqqmkzQnPkAvNGheCozGlJXZPbHjp+f6
   NfizxbL56YtaUOhFHiWi/LswqzqB9aTDRsHZcoSTFN92neOrLvATOioZD
   qlboHTS9YyhPas6J0S/+FYG+j7ZO3+B/qHZuWXvbZ1KvlFhxI9x3gQ+qK
   SvBopGiKYCRdCxUV9CMsuouuwCWWp7Aezc3Vvi7ZP0E1gqOdt4KblF2ON
   M+eNduVgRwtRBRdUjv5i5WP0UHNtXc/cRkmsDfF0HEDFd+1ReWLsXpczv
   A==;
X-CSE-ConnectionGUID: jYQG6bAMQRGhbhZ9WAphzQ==
X-CSE-MsgGUID: oASH9nxQSGy6mbnFFzxjKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50340928"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="50340928"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 13:37:23 -0700
X-CSE-ConnectionGUID: 1lRj5lWjSQ+NWtKqzBzi7A==
X-CSE-MsgGUID: CAwly7nOT3CWupoZNR6Lnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="141914080"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 May 2025 13:37:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJI5v-000Rzc-2p;
	Sun, 25 May 2025 20:37:19 +0000
Date: Mon, 26 May 2025 04:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 2/2] fs/attr.c:101:47: sparse: sparse:
 incorrect type in argument 2 (different modifiers)
Message-ID: <202505260402.Z5inzgGg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-fixes
head:   3d7c34e70ff9f9f109feb055469b6a056e07b88b
commit: 3d7c34e70ff9f9f109feb055469b6a056e07b88b [2/2] vfs: Fix inode ownership checks with regard to foreign ownership
config: x86_64-randconfig-121-20250525 (https://download.01.org/0day-ci/archive/20250526/202505260402.Z5inzgGg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260402.Z5inzgGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505260402.Z5inzgGg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/attr.c:101:47: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct inode *inode @@     got struct inode const *inode @@
   fs/attr.c:101:47: sparse:     expected struct inode *inode
   fs/attr.c:101:47: sparse:     got struct inode const *inode
   fs/attr.c:130:47: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct inode *inode @@     got struct inode const *inode @@
   fs/attr.c:130:47: sparse:     expected struct inode *inode
   fs/attr.c:130:47: sparse:     got struct inode const *inode
--
>> fs/inode.c:2591:47: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct inode *inode @@     got struct inode const *inode @@
   fs/inode.c:2591:47: sparse:     expected struct inode *inode
   fs/inode.c:2591:47: sparse:     got struct inode const *inode
   fs/inode.c:962:17: sparse: sparse: context imbalance in 'inode_lru_isolate' - unexpected unlock
   fs/inode.c:1022:9: sparse: sparse: context imbalance in 'find_inode' - different lock contexts for basic block
   fs/inode.c:1063:9: sparse: sparse: context imbalance in 'find_inode_fast' - different lock contexts for basic block
   fs/inode.c:1778:5: sparse: sparse: context imbalance in 'insert_inode_locked' - wrong count at exit
   fs/inode.c:1896:20: sparse: sparse: context imbalance in 'iput_final' - unexpected unlock
   fs/inode.c:1910:6: sparse: sparse: context imbalance in 'iput' - wrong count at exit
   fs/inode.c:2443:17: sparse: sparse: context imbalance in '__wait_on_freeing_inode' - unexpected unlock

vim +101 fs/attr.c

    82	
    83	/**
    84	 * chown_ok - verify permissions to chown inode
    85	 * @idmap:	idmap of the mount @inode was found from
    86	 * @inode:	inode to check permissions on
    87	 * @ia_vfsuid:	uid to chown @inode to
    88	 *
    89	 * If the inode has been found through an idmapped mount the idmap of
    90	 * the vfsmount must be passed through @idmap. This function will then
    91	 * take care to map the inode according to @idmap before checking
    92	 * permissions. On non-idmapped mounts or if permission checking is to be
    93	 * performed on the raw inode simply pass @nop_mnt_idmap.
    94	 */
    95	static int chown_ok(struct mnt_idmap *idmap,
    96			    const struct inode *inode, vfsuid_t ia_vfsuid)
    97	{
    98		vfsuid_t vfsuid = i_uid_into_vfsuid(idmap, inode);
    99		int ret;
   100	
 > 101		ret = vfs_inode_is_owned_by_me(idmap, inode);
   102		if (ret <= 0)
   103			return ret;
   104		if (capable_wrt_inode_uidgid(idmap, inode, CAP_CHOWN))
   105			return 0;
   106		if (!vfsuid_valid(vfsuid) &&
   107		    ns_capable(inode->i_sb->s_user_ns, CAP_CHOWN))
   108			return 0;
   109		return -EPERM;
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
