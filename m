Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA318EAD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710318525; cv=none; b=UCCab6cRz+WYhW18f3RA2xb1q6/ilDtrE2TFVhUkj8JTRx5rfuMKHVgLpWVSsJmrQlp9SFko0cDDyJzLBYGN4Tlq6Fp+LXvNODQicuuyGpt3FlhrILKlsQQZcrcgivsO1DJCLa202Vfvrf5h1bV3zQOpOWGhWuTmEXquKEfhVvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710318525; c=relaxed/simple;
	bh=IG/xFCUwaY3oY2+uupUmBdzuWSuBfoen2ZSpWKDvZH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6PxW5tNPCEHseG/HhvHWhnGlBGA8QkkwwoE7n5zGY8iA8u/qTG/sDIfd5QrxqdItYKq/ZRp0u5yjn32gt3q9PpotAMkwbbsjO2itVJ1F041POEMzLDgmyoDxDygZDtfTpKxZOqFTzmiIFgUJPL4lQb+cFnOFUjAkmcp8QOkjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuKgLaPv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuKgLaPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710318523; x=1741854523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IG/xFCUwaY3oY2+uupUmBdzuWSuBfoen2ZSpWKDvZH8=;
  b=UuKgLaPvdov1ea/WEe3vdLrK4upiyDJHQGAr2PXUFb94fJGVpVK0vBgP
   FNWUpbUD9LSpruwH+KRS3R7VqmmObmwcC86FvJanj2FHLfyLIovTwePUH
   Aq23x8Cte7VyEzqtl0fnA7YdkLwOlOMq7KXNSx4pZ03uspOD+5i0evUpM
   E0vi3u0jliw7QYx3ML8lAi7x5CaxvLVPEpmo8XViYwJhI1ZZOHiLdCV5Q
   0OrZjs8/S2botY+8ze5OE9pt8EzD0ZTcG/ai4OAIOjs/C+KFpSa72YpBB
   wMUGu77c2Mn2Uc+l36Rwz855ZC6GzSsBboHAbDavFs0X84TaWJNBCtp55
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5193920"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5193920"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 01:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="12299351"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Mar 2024 01:28:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkJyZ-000CBz-1V;
	Wed, 13 Mar 2024 08:28:39 +0000
Date: Wed, 13 Mar 2024 16:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 26/44] fs/verity/verify.c:419:
 warning: Function parameter or struct member 'level' not described in
 'fsverity_read_merkle_tree_block'
Message-ID: <202403131626.aADdoCAL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   f0f02c9c8136c2900f1a5e3fd479cb42a5453ab0
commit: 9f776a322d851cf08ce43dfb0129d1d49bc628af [26/44] fsverity: reorganize read_merkle_tree_block signature
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240313/202403131626.aADdoCAL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131626.aADdoCAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131626.aADdoCAL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/verity/verify.c:419: warning: Function parameter or struct member 'level' not described in 'fsverity_read_merkle_tree_block'


vim +419 fs/verity/verify.c

057a4e47b75182 Andrey Albershteyn 2024-02-28  404  
7e233393e1188a Darrick J. Wong    2024-03-12  405  /**
7e233393e1188a Darrick J. Wong    2024-03-12  406   * fsverity_read_merkle_tree_block() - read Merkle tree block
7e233393e1188a Darrick J. Wong    2024-03-12  407   * @inode: inode to which this Merkle tree blocks belong
7e233393e1188a Darrick J. Wong    2024-03-12  408   * @params: merkle tree parameters
7e233393e1188a Darrick J. Wong    2024-03-12  409   * @pos: byte position within merkle tree
7e233393e1188a Darrick J. Wong    2024-03-12  410   * @ra_bytes: try to read ahead this many btes
7e233393e1188a Darrick J. Wong    2024-03-12  411   * @block: block to be loaded
7e233393e1188a Darrick J. Wong    2024-03-12  412   *
7e233393e1188a Darrick J. Wong    2024-03-12  413   * This function loads data from a merkle tree.
7e233393e1188a Darrick J. Wong    2024-03-12  414   */
7e233393e1188a Darrick J. Wong    2024-03-12  415  int fsverity_read_merkle_tree_block(struct inode *inode,
7e233393e1188a Darrick J. Wong    2024-03-12  416  				    const struct merkle_tree_params *params,
9f776a322d851c Darrick J. Wong    2024-03-08  417  				    int level, u64 pos, unsigned long ra_bytes,
057a4e47b75182 Andrey Albershteyn 2024-02-28  418  				    struct fsverity_blockbuf *block)
057a4e47b75182 Andrey Albershteyn 2024-02-28 @419  {
7e233393e1188a Darrick J. Wong    2024-03-12  420  	const struct fsverity_operations *vops = inode->i_sb->s_vop;
7e233393e1188a Darrick J. Wong    2024-03-12  421  	unsigned long page_idx;
7e233393e1188a Darrick J. Wong    2024-03-12  422  	struct page *page;
7e233393e1188a Darrick J. Wong    2024-03-12  423  	unsigned long index;
7e233393e1188a Darrick J. Wong    2024-03-12  424  	unsigned int offset_in_page;
057a4e47b75182 Andrey Albershteyn 2024-02-28  425  
9f776a322d851c Darrick J. Wong    2024-03-08  426  	block->offset = pos;
9f776a322d851c Darrick J. Wong    2024-03-08  427  	block->size = params->block_size;
9f776a322d851c Darrick J. Wong    2024-03-08  428  
9f776a322d851c Darrick J. Wong    2024-03-08  429  	if (fsverity_caches_blocks(inode)) {
9f776a322d851c Darrick J. Wong    2024-03-08  430  		struct fsverity_readmerkle req = {
9f776a322d851c Darrick J. Wong    2024-03-08  431  			.inode = inode,
9f776a322d851c Darrick J. Wong    2024-03-08  432  			.level = level,
9f776a322d851c Darrick J. Wong    2024-03-08  433  			.num_levels = params->num_levels,
9f776a322d851c Darrick J. Wong    2024-03-08  434  			.log_blocksize = params->log_blocksize,
9f776a322d851c Darrick J. Wong    2024-03-08  435  			.ra_bytes = ra_bytes,
9f776a322d851c Darrick J. Wong    2024-03-08  436  		};
9f776a322d851c Darrick J. Wong    2024-03-08  437  
9f776a322d851c Darrick J. Wong    2024-03-08  438  		return vops->read_merkle_tree_block(&req, block);
9f776a322d851c Darrick J. Wong    2024-03-08  439  	}
7e233393e1188a Darrick J. Wong    2024-03-12  440  
7e233393e1188a Darrick J. Wong    2024-03-12  441  	index = pos >> params->log_blocksize;
7e233393e1188a Darrick J. Wong    2024-03-12  442  	page_idx = round_down(index, params->blocks_per_page);
7e233393e1188a Darrick J. Wong    2024-03-12  443  	offset_in_page = pos & ~PAGE_MASK;
7e233393e1188a Darrick J. Wong    2024-03-12  444  
7e233393e1188a Darrick J. Wong    2024-03-12  445  	page = vops->read_merkle_tree_page(inode, page_idx,
7e233393e1188a Darrick J. Wong    2024-03-12  446  			ra_bytes >> PAGE_SHIFT);
7e233393e1188a Darrick J. Wong    2024-03-12  447  	if (IS_ERR(page))
7e233393e1188a Darrick J. Wong    2024-03-12  448  		return PTR_ERR(page);
7e233393e1188a Darrick J. Wong    2024-03-12  449  
7e233393e1188a Darrick J. Wong    2024-03-12  450  	block->kaddr = kmap_local_page(page) + offset_in_page;
7e233393e1188a Darrick J. Wong    2024-03-12  451  	block->context = page;
7e233393e1188a Darrick J. Wong    2024-03-12  452  	return 0;
7e233393e1188a Darrick J. Wong    2024-03-12  453  }
7e233393e1188a Darrick J. Wong    2024-03-12  454  

:::::: The code at line 419 was first introduced by commit
:::::: 057a4e47b751820ed58aca21323c229c7b9322ec fsverity: support block-based Merkle tree caching

:::::: TO: Andrey Albershteyn <aalbersh@redhat.com>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
