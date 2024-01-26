Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C71CFBC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706283635; cv=none; b=D8N1vuchEUXuK9MkWDKZxs6VpT1mSdFKcL7w4OphP7M663RLxacQQ+N7xUlRalN9AFk8K9p8jexu8ZhitCV33NRKrzD/rRCoXi7vIHuddJ1rXZIR998c8C6cumX9E6QtXa44uwrZm0VnYDnUQIvgtfEUQz7J1k95C2658agDHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706283635; c=relaxed/simple;
	bh=7ovciQo6Zg1Xu6ZiDwAghvCYEaLCIut1dgV225UYiR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpWNrq3giHlUxylL7vViApS6MgO5dfmfix3zZztUF62i9z4RBym6p8N/gI4Ane8yotPSzVAXotAJNRLIG9WBAXoegnwCMhzTPx9jCe9ctyonvz4y+CTccyP5bm0BdEIKJSprd/N4pSGxlMbci1zetfm0wjxfTqGRYaDQHHYQiYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JP6Zg7Od; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JP6Zg7Od"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706283634; x=1737819634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ovciQo6Zg1Xu6ZiDwAghvCYEaLCIut1dgV225UYiR0=;
  b=JP6Zg7OdnuHpaVsatKf3rMjq3zt9qXaXbQw4La3NvhYG0Xu3jAa+Eij1
   JxdlxnVbhEkT72Gw6rV6o7fUJisxEWL+rI5+iexKrkElb4u/hK+YAPHXo
   dXo3FggyMcSM5CgUHTbASPvX56QHTpaNOWJvFzVgRUXm7Vm/qGzEfeNLL
   VK1C7fjfbKGMF02peRyRmyNyRaeP2/Z6qVkdnFFyMLtCQRnnxO04dqymm
   PRlh1IbfE3C9C0NvjQOaxy/bSP7RjCRq0IqQKEzU80jndpDSY/5AqiXya
   JsBTxDQd+JTohLWt76OrWpP8Q9kvS65Ar03V9pfKWIv6W5VcIXBbDqmc5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="16026112"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="16026112"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 07:40:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="960232908"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="960232908"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2024 07:40:26 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTOJc-00019C-0k;
	Fri, 26 Jan 2024 15:40:24 +0000
Date: Fri, 26 Jan 2024 23:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:report-refcounts 432/512] fs/xfs/libxfs/xfs_rmap.c:332:
 undefined reference to `xfs_rtrmapbt_mem_ops'
Message-ID: <202401262306.fs4Q4ULW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   e9a152561dfd80561830f5da06d5a6d281883956
commit: 5af8f3c38651eaf87992cca4eb2ddc2b19e6acf6 [432/512] xfs: create a shadow rmap btree during realtime rmap repair
config: i386-randconfig-011-20240126 (https://download.01.org/0day-ci/archive/20240126/202401262306.fs4Q4ULW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401262306.fs4Q4ULW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401262306.fs4Q4ULW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_complain_bad_rec':
   fs/xfs/libxfs/xfs_rmap.c:349: undefined reference to `xfs_rmapbt_mem_ops'
   ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_check_btrec':
>> fs/xfs/libxfs/xfs_rmap.c:332: undefined reference to `xfs_rtrmapbt_mem_ops'
>> ld: fs/xfs/libxfs/xfs_rmap.c:336: undefined reference to `xfs_rmapbt_mem_ops'
   ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_complain_bad_rec':
   fs/xfs/libxfs/xfs_rmap.c:349: undefined reference to `xfs_rmapbt_mem_ops'
   ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_check_btrec':
>> fs/xfs/libxfs/xfs_rmap.c:332: undefined reference to `xfs_rtrmapbt_mem_ops'
>> ld: fs/xfs/libxfs/xfs_rmap.c:336: undefined reference to `xfs_rmapbt_mem_ops'


vim +332 fs/xfs/libxfs/xfs_rmap.c

   326	
   327	static inline xfs_failaddr_t
   328	xfs_rmap_check_btrec(
   329		struct xfs_btree_cur		*cur,
   330		const struct xfs_rmap_irec	*irec)
   331	{
 > 332		if (xfs_btree_is_mem_rtrmap(cur->bc_ops))
   333			return xfs_rtrmap_check_irec(cur->bc_mem.rtg, irec);
   334		if (xfs_btree_is_rtrmap(cur->bc_ops))
   335			return xfs_rtrmap_check_irec(cur->bc_ino.rtg, irec);
 > 336		if (xfs_btree_is_mem_rmap(cur->bc_ops))
   337			return xfs_rmap_check_irec(cur->bc_mem.pag, irec);
   338		return xfs_rmap_check_irec(cur->bc_ag.pag, irec);
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
