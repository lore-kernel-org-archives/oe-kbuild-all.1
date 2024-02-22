Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62115B66E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708605669; cv=none; b=PPaK2dMprxBJf2oZlyfUrwj6zpbo1JL2DwaaW4/7HwBe56Xxx6kbrzEfg7nbsJB08B7rqxfEJB9BotYxjF1hrLwyKguiXHOObhI2ulUTDebXDL01HhcVMzHxOAYsmPJjdmyYlY1SHanHVEFK8nSLBe/rdnzOfX5iAiaVTxsxQ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708605669; c=relaxed/simple;
	bh=oX9P5yn/dorX3F08qHtVjISngyJGjrOEy6znmBY0wA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7C+is3OcTSnKetw1v/E9txdPeKpoZgCg3KcvfQJx8z33etfDDXa1POlUmWFIqIkHfbtVqUw+q6t0RNSgdhWnXNaQekiTJtOQAeHyorUwSVGHNr0hf8S9KwfMJn1pPDVAW09z35EhCvriudVpmgPSMcMwxYz4EbDf+jza6WSTy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOoVKnqY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOoVKnqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708605666; x=1740141666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oX9P5yn/dorX3F08qHtVjISngyJGjrOEy6znmBY0wA4=;
  b=HOoVKnqYjYPacdalPInT8++vfD/cIlXYiZ4RZbbWB0L6pQE6UqWowg/o
   Wn/H1jsIzJILOFENtIbn8zJdoVnwDjgyQEfKau559kl0eeEa4zfOTLhlk
   fQwnTS/QvzoOPfjSQ/cXIHVjiwF2mJx+0vttBclazDDaYhMOOhjnjZqoX
   gLq84e0ysy1ml5Uk8yhlTJgh/SkrlrRWiLcnEINJAdAaFTqEhB/NEtcbr
   mpGt57xeJhc2OJk83NIuEyhNGa7NqZolBSZTQPTBt54fF061jxAcZVhyL
   eV2lRLhk0t6AGmBd4kL2ujoVquvbddnn7PQywFyJ14wQvafpoX3SJxlCR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6646076"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6646076"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 04:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936845487"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="936845487"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2024 04:41:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd8NU-0006JP-0J;
	Thu, 22 Feb 2024 12:40:48 +0000
Date: Thu, 22 Feb 2024 20:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sforshee:fscaps-vfsid 14/26] security/smack/smack_lsm.c:1545:
 warning: Function parameter or struct member 'idmap' not described in
 'smack_inode_set_fscaps'
Message-ID: <202402222012.SCZWOago-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/linux.git fscaps-vfsid
head:   5ce094a334396397b1fc55565f035ffd4c68e612
commit: c7be21ad30b98381b1354b23fbdef08bc7b0b47f [14/26] smack: add hooks for fscaps operations
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240222/202402222012.SCZWOago-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222012.SCZWOago-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222012.SCZWOago-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/smack/smack_lsm.c:1545: warning: Function parameter or struct member 'idmap' not described in 'smack_inode_set_fscaps'
>> security/smack/smack_lsm.c:1545: warning: Function parameter or struct member 'dentry' not described in 'smack_inode_set_fscaps'
>> security/smack/smack_lsm.c:1545: warning: Excess function parameter 'mnt_userns' description in 'smack_inode_set_fscaps'
>> security/smack/smack_lsm.c:1545: warning: Excess function parameter 'detry' description in 'smack_inode_set_fscaps'
>> security/smack/smack_lsm.c:1564: warning: Function parameter or struct member 'idmap' not described in 'smack_inode_get_fscaps'
>> security/smack/smack_lsm.c:1585: warning: expecting prototype for smack_inode_remove_acl(). Prototype was for smack_inode_remove_fscaps() instead


vim +1545 security/smack/smack_lsm.c

  1532	
  1533	/**
  1534	 * smack_inode_set_fscaps - Smack check for setting file capabilities
  1535	 * @mnt_userns: the userns attached to the source mnt for this request
  1536	 * @detry: the object
  1537	 * @caps: the file capabilities
  1538	 * @flags: unused
  1539	 *
  1540	 * Returns 0 if the access is permitted, or an error code otherwise.
  1541	 */
  1542	static int smack_inode_set_fscaps(struct mnt_idmap *idmap,
  1543					  struct dentry *dentry,
  1544					  const struct vfs_caps *caps, int flags)
> 1545	{
  1546		struct smk_audit_info ad;
  1547		int rc;
  1548	
  1549		smk_ad_init(&ad, __func__, LSM_AUDIT_DATA_DENTRY);
  1550		smk_ad_setfield_u_fs_path_dentry(&ad, dentry);
  1551		rc = smk_curacc(smk_of_inode(d_backing_inode(dentry)), MAY_WRITE, &ad);
  1552		rc = smk_bu_inode(d_backing_inode(dentry), MAY_WRITE, rc);
  1553		return rc;
  1554	}
  1555	
  1556	/**
  1557	 * smack_inode_get_fscaps - Smack check for getting file capabilities
  1558	 * @dentry: the object
  1559	 *
  1560	 * Returns 0 if access is permitted, an error code otherwise
  1561	 */
  1562	static int smack_inode_get_fscaps(struct mnt_idmap *idmap,
  1563					  struct dentry *dentry)
> 1564	{
  1565		struct smk_audit_info ad;
  1566		int rc;
  1567	
  1568		smk_ad_init(&ad, __func__, LSM_AUDIT_DATA_DENTRY);
  1569		smk_ad_setfield_u_fs_path_dentry(&ad, dentry);
  1570	
  1571		rc = smk_curacc(smk_of_inode(d_backing_inode(dentry)), MAY_READ, &ad);
  1572		rc = smk_bu_inode(d_backing_inode(dentry), MAY_READ, rc);
  1573		return rc;
  1574	}
  1575	
  1576	/**
  1577	 * smack_inode_remove_acl - Smack check for removing file capabilities
  1578	 * @idmap: idmap of the mnt this request came from
  1579	 * @dentry: the object
  1580	 *
  1581	 * Returns 0 if access is permitted, an error code otherwise
  1582	 */
  1583	static int smack_inode_remove_fscaps(struct mnt_idmap *idmap,
  1584					     struct dentry *dentry)
> 1585	{
  1586		struct smk_audit_info ad;
  1587		int rc;
  1588	
  1589		rc = cap_inode_removexattr(idmap, dentry, XATTR_NAME_CAPS);
  1590		if (rc != 0)
  1591			return rc;
  1592	
  1593		smk_ad_init(&ad, __func__, LSM_AUDIT_DATA_DENTRY);
  1594		smk_ad_setfield_u_fs_path_dentry(&ad, dentry);
  1595	
  1596		rc = smk_curacc(smk_of_inode(d_backing_inode(dentry)), MAY_WRITE, &ad);
  1597		rc = smk_bu_inode(d_backing_inode(dentry), MAY_WRITE, rc);
  1598		return rc;
  1599	}
  1600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
