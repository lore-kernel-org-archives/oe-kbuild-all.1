Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0E1CD34
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706280986; cv=none; b=ZINMXOblYN8mO79tRP0ynCKGKe0CAEbkmJ/T4cwUdmVzsFl5McFqr7dNSstq907ewclsxJW5KmK4BbmkQQc9grJWXzbDWK0nZj6oVxeCEdeMpl/DytaoUzWiuhwweQweYYtb0Z0ASvcyb2Z7xsDNEL+JXUKedY+WNAUz3ysC+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706280986; c=relaxed/simple;
	bh=uwqqroYZiZQXVEYGT6buZWyE/Yd+nJ76EvzDiDce3rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ee7VhUrdibVO9mhyCprKZ7vsqhoDvtxblaM7imOit6tpDOivoQKns/62fnmhJnF8cWhFG41/Uajr2bAt4JhaRU5qRa74kNcgTpdpOEYdYhGLqgS2NyHCxBgpZyf3ujO80lg5TUnpQ0EsHW+GeqrC4QxsFatz8f4a7Mn2vUjdOgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkrV/LYv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkrV/LYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706280985; x=1737816985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uwqqroYZiZQXVEYGT6buZWyE/Yd+nJ76EvzDiDce3rw=;
  b=gkrV/LYvsrkrDCPgxTR5p0LpE/+iC9kRfIjFHmOnuS6IV3tLemu9jmmA
   xBxC3QZZwWJBw0DxOt+HuxSdbS7/CcYFqBbupe82ZqliWsWjDEcBwneIW
   JaEjMsjOBsi3Wk12Dyjc5i1lExLC4iyiphGtnMi+59sXV3HoedW8xLc8t
   3rUPwae2MIXlR7P4rNySalkbp0vJcH+hstrtQR1W+5AY9tibJfWQOdP6B
   XibuNdHzgIVF/0S5nK41YBvvHorPNRgL05pwwJligtwf1LLu74qYurXlX
   qIp1ampn4v/NJL0Am/bPr7/Zrhee2OYT6jTgLhtImjXxKNqMnykegCF2U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2357014"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2357014"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 06:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877415843"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="877415843"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2024 06:56:22 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTNcy-00016l-2p;
	Fri, 26 Jan 2024 14:56:20 +0000
Date: Fri, 26 Jan 2024 22:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 118/275] fs/xfs/libxfs/xfs_rmap.c:290:
 undefined reference to `xfs_rmapbt_mem_ops'
Message-ID: <202401262232.rZgnwHcD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   370f4f5a373f371e76fdc9634867b15775947255
commit: ca944775594eb15745e8280bf3ae16761cbee82f [118/275] xfs: create a shadow rmap btree during rmap repair
config: i386-randconfig-011-20240126 (https://download.01.org/0day-ci/archive/20240126/202401262232.rZgnwHcD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401262232.rZgnwHcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401262232.rZgnwHcD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_complain_bad_rec':
>> fs/xfs/libxfs/xfs_rmap.c:290: undefined reference to `xfs_rmapbt_mem_ops'
   ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_check_btrec':
   fs/xfs/libxfs/xfs_rmap.c:277: undefined reference to `xfs_rmapbt_mem_ops'
   ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_complain_bad_rec':
>> fs/xfs/libxfs/xfs_rmap.c:290: undefined reference to `xfs_rmapbt_mem_ops'
   ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_check_btrec':
   fs/xfs/libxfs/xfs_rmap.c:277: undefined reference to `xfs_rmapbt_mem_ops'


vim +290 fs/xfs/libxfs/xfs_rmap.c

   281	
   282	static inline int
   283	xfs_rmap_complain_bad_rec(
   284		struct xfs_btree_cur		*cur,
   285		xfs_failaddr_t			fa,
   286		const struct xfs_rmap_irec	*irec)
   287	{
   288		struct xfs_mount		*mp = cur->bc_mp;
   289	
 > 290		if (xfs_btree_is_mem_rmap(cur->bc_ops))
   291			xfs_warn(mp,
   292	 "In-Memory Reverse Mapping BTree record corruption detected at %pS!", fa);
   293		else
   294			xfs_warn(mp,
   295	 "Reverse Mapping BTree record corruption in AG %d detected at %pS!",
   296				cur->bc_ag.pag->pag_agno, fa);
   297		xfs_warn(mp,
   298			"Owner 0x%llx, flags 0x%x, start block 0x%x block count 0x%x",
   299			irec->rm_owner, irec->rm_flags, irec->rm_startblock,
   300			irec->rm_blockcount);
   301		xfs_btree_mark_sick(cur);
   302		return -EFSCORRUPTED;
   303	}
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
