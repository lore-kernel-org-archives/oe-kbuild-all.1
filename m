Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA807BE4D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 02:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705630063; cv=none; b=PiJtSGWDPof8+rau+Sux6CwH+4BHAQEyDYD9WYcN/+g5z8UQYgDGP4BMZEqb9YWsrYSuexf2UeaGlyUcmH1ygWtdi+gFHSI2QD6mjXmAGji9XiRJL4nvQMNEfeqdyOnebEP8AmmPFdAzj8g+flbCK3FsEzLyn/7oIk+Ds6R0UX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705630063; c=relaxed/simple;
	bh=YoMLw/a2/uqVjn8pyjo4AUhty8dnuuRipNijGTdljno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X4zmQov6gUNU/oQlNDmU+lcopHjccVo37ZdNLpMk3i85GeFzeqRYcty1z+OMpDzinaaSaWjs5sLNu+IY9kVPqScT7NIpDF8ucvqmSOxDx3UkIvXPYIANyQRKhRjU3GK6CDlVdNMTUL1VYcFPYG6LeHeJ5MwQc3gS7URLunWRdpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOyRpDaQ; arc=none smtp.client-ip=192.55.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOyRpDaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705630061; x=1737166061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YoMLw/a2/uqVjn8pyjo4AUhty8dnuuRipNijGTdljno=;
  b=iOyRpDaQibhTCdFL2PppdumPNgFjsoVooveAujtd43T6w1pH0bnArNXf
   jKnZ6v4RZwBgYgaYVoMW0lNnBp0lv9NokgJqxQXa5jMeBzB13Emo2+IXh
   HGBXqa4adKpkDn14XhTPjefEMKrMABWfVSyELcxedw/P0oZoQa4OPInns
   y4HMvdeT9zOYTz2saG7azhpgHkI9kgCDs9jYYBtnnq3Vsb5gwjE9LRVqj
   gts5sBvfrSB4KayqkCyJIRf4i2DKmJgrJzdU2rXxEkPHkE/lwUNhR3qM/
   RpOV2MgM8XewsX9o55+6HgcaMiKNxFq17YueSVrpPuS6l1zh6bLcE21ED
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="486786715"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="486786715"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 18:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="855194720"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="855194720"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2024 18:07:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQeIE-0003WU-0D;
	Fri, 19 Jan 2024 02:07:38 +0000
Date: Fri, 19 Jan 2024 10:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-btree-check-cleanups 36/37]
 fs/xfs/libxfs/xfs_btree.c:102:1: warning: no previous prototype for function
 '__xfs_btree_check_fsblock'
Message-ID: <202401191022.olDCTYyU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.infradead.org/users/hch/xfs xfs-btree-check-cleanups
head:   b6892a137b424db9d9e928e41c21a5f45f991052
commit: 1ecac9eecc63f962e39a682cca57c6914b82cb30 [36/37] xfs: rename btree helpers that depends on the block number representation
config: i386-randconfig-012-20240119 (https://download.01.org/0day-ci/archive/20240119/202401191022.olDCTYyU-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401191022.olDCTYyU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401191022.olDCTYyU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_btree.c:102:1: warning: no previous prototype for function '__xfs_btree_check_fsblock' [-Wmissing-prototypes]
     102 | __xfs_btree_check_fsblock(
         | ^
   fs/xfs/libxfs/xfs_btree.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | xfs_failaddr_t
         | ^
         | static 
>> fs/xfs/libxfs/xfs_btree.c:156:1: warning: no previous prototype for function '__xfs_btree_check_agblock' [-Wmissing-prototypes]
     156 | __xfs_btree_check_agblock(
         | ^
   fs/xfs/libxfs/xfs_btree.c:155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     155 | xfs_failaddr_t
         | ^
         | static 
   2 warnings generated.


vim +/__xfs_btree_check_fsblock +102 fs/xfs/libxfs/xfs_btree.c

    96	
    97	/*
    98	 * Check a long btree block header.  Return the address of the failing check,
    99	 * or NULL if everything is ok.
   100	 */
   101	xfs_failaddr_t
 > 102	__xfs_btree_check_fsblock(
   103		struct xfs_btree_cur	*cur,
   104		struct xfs_btree_block	*block,
   105		int			level,
   106		struct xfs_buf		*bp)
   107	{
   108		struct xfs_mount	*mp = cur->bc_mp;
   109		xfs_failaddr_t		fa;
   110		xfs_fsblock_t		fsb;
   111	
   112		if (xfs_has_crc(mp)) {
   113			if (!uuid_equal(&block->bb_u.l.bb_uuid, &mp->m_sb.sb_meta_uuid))
   114				return __this_address;
   115			if (block->bb_u.l.bb_blkno !=
   116			    cpu_to_be64(bp ? xfs_buf_daddr(bp) : XFS_BUF_DADDR_NULL))
   117				return __this_address;
   118			if (block->bb_u.l.bb_pad != cpu_to_be32(0))
   119				return __this_address;
   120		}
   121	
   122		if (be32_to_cpu(block->bb_magic) != xfs_btree_magic(mp, cur->bc_ops))
   123			return __this_address;
   124		if (be16_to_cpu(block->bb_level) != level)
   125			return __this_address;
   126		if (be16_to_cpu(block->bb_numrecs) >
   127		    cur->bc_ops->get_maxrecs(cur, level))
   128			return __this_address;
   129	
   130		/*
   131		 * For inode-rooted btrees, the root block sits in the inode fork.  In
   132		 * that case bp is NULL, and the block must not have any siblings.
   133		 */
   134		if (!bp) {
   135			if (block->bb_u.l.bb_leftsib != cpu_to_be64(NULLFSBLOCK))
   136				return __this_address;
   137			if (block->bb_u.l.bb_rightsib != cpu_to_be64(NULLFSBLOCK))
   138				return __this_address;
   139			return NULL;
   140		}
   141	
   142		fsb = XFS_DADDR_TO_FSB(mp, xfs_buf_daddr(bp));
   143		fa = xfs_btree_check_fsblock_siblings(mp, fsb,
   144				block->bb_u.l.bb_leftsib);
   145		if (!fa)
   146			fa = xfs_btree_check_fsblock_siblings(mp, fsb,
   147					block->bb_u.l.bb_rightsib);
   148		return fa;
   149	}
   150	
   151	/*
   152	 * Check a short btree block header.  Return the address of the failing check,
   153	 * or NULL if everything is ok.
   154	 */
   155	xfs_failaddr_t
 > 156	__xfs_btree_check_agblock(
   157		struct xfs_btree_cur	*cur,
   158		struct xfs_btree_block	*block,
   159		int			level,
   160		struct xfs_buf		*bp)
   161	{
   162		struct xfs_mount	*mp = cur->bc_mp;
   163		struct xfs_perag	*pag = cur->bc_ag.pag;
   164		xfs_failaddr_t		fa;
   165		xfs_agblock_t		agbno;
   166	
   167		if (xfs_has_crc(mp)) {
   168			if (!uuid_equal(&block->bb_u.s.bb_uuid, &mp->m_sb.sb_meta_uuid))
   169				return __this_address;
   170			if (block->bb_u.s.bb_blkno != cpu_to_be64(xfs_buf_daddr(bp)))
   171				return __this_address;
   172		}
   173	
   174		if (be32_to_cpu(block->bb_magic) != xfs_btree_magic(mp, cur->bc_ops))
   175			return __this_address;
   176		if (be16_to_cpu(block->bb_level) != level)
   177			return __this_address;
   178		if (be16_to_cpu(block->bb_numrecs) >
   179		    cur->bc_ops->get_maxrecs(cur, level))
   180			return __this_address;
   181	
   182		agbno = xfs_daddr_to_agbno(mp, xfs_buf_daddr(bp));
   183		fa = xfs_btree_check_agblock_siblings(pag, agbno,
   184				block->bb_u.s.bb_leftsib);
   185		if (!fa)
   186			fa = xfs_btree_check_agblock_siblings(pag, agbno,
   187					block->bb_u.s.bb_rightsib);
   188		return fa;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
