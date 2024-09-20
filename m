Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14774189B9B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 22:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726871241; cv=none; b=UfHHUCKxIsK9YDi9ChKkqzvEaPqSZuxWy4NBG1BwV7adG/i6HGA+gnLjTG5wT/s2R3BHzaYHA0o1aOhKNVJoGaJiKs1RD60DmQQ4uZlH2eVM+clpO6JzQOCWAzgD/tHU7onXY8TNkGBbCifdzkzBTMmRL5D46wlO6mGT297T2XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726871241; c=relaxed/simple;
	bh=mnse6JRW33NUZeWz9UPCc0FVTPqLPMRROSHmjlpbwBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rav4vdYX9OQTHzA/YzjtALPkduWV2EuUe1iuWKf6w+FqQ8iSsAbTGZuizCoBZ3QceDmeV+B2PrjaR6eHYIdHrG12dtrzvwmJHum+DQ6QAC38nR63q5KKLKwGMEiSbpsFs8vVSmwufK47AaFQGRC0MfQxOiKgKqiZbzLWnOGGjNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6NaszE0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6NaszE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726871238; x=1758407238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnse6JRW33NUZeWz9UPCc0FVTPqLPMRROSHmjlpbwBQ=;
  b=i6NaszE0sQwhrZYTg7yNuJoYE692wvsd6f59E6bjihLicV+AlDZyzqYH
   KbonMPscZjADBxZseNHzICjZw7zgTFks5ToN5e3f38o0c7c+EmxdzBuJ6
   20eXgs03lWY5Ubvc3rXcvf5dz+7KSE2SAs0nqteLYn0hZvIlfIbujrP05
   /5CFb1uYKgPi3JrTfVZx7lcT+UO7BnOojXgRbhXyjibVdmV6NWXgvfjQT
   74OHid9l4uI3C8KVMuo2HTKe4hwC9Ou3PfExcWu+QubTo7gyZff3dAyOj
   bAuzUBZmst7RAlluGYhTtGBB20Cgi1uiaJytpVfaAk98TbnSEJMLLFcLX
   w==;
X-CSE-ConnectionGUID: VIf/pIfsT9KInk+HyBXEhw==
X-CSE-MsgGUID: /a60Y/WFSN2kHSwNQtwkEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="13615975"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="13615975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 15:27:17 -0700
X-CSE-ConnectionGUID: sJUZl9mqQ0OaHefyV9va4A==
X-CSE-MsgGUID: H2i8J1E7STO99RLm7jyqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="101175360"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Sep 2024 15:27:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srm5p-000Etz-2m;
	Fri, 20 Sep 2024 22:27:13 +0000
Date: Sat, 21 Sep 2024 06:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-generic-group-baseline 29/39] fs/xfs/xfs_iwalk.c:658:6:
 warning: variable 'pag' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202409210633.0ACii8dN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-generic-group-baseline
head:   1100a98f36e1f548982992baf62d53dff0eb3fc4
commit: dc6fdc94e49dd59fad494aecf6e0c32e55b20b1c [29/39] xfs: switch perag iteration from the for_each macros to a while based iterator
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240921/202409210633.0ACii8dN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409210633.0ACii8dN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210633.0ACii8dN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_iwalk.c:658:6: warning: variable 'pag' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     658 |         if (error)
         |             ^~~~~
   fs/xfs/xfs_iwalk.c:661:40: note: uninitialized use occurs here
     661 |         while ((pag = xfs_perag_next_from(mp, pag, start_agno))) {
         |                                               ^~~
   fs/xfs/xfs_iwalk.c:658:2: note: remove the 'if' if its condition is always true
     658 |         if (error)
         |         ^~~~~~~~~~
     659 |                 return error;
   fs/xfs/xfs_iwalk.c:651:23: note: initialize the variable 'pag' to silence this warning
     651 |         struct xfs_perag        *pag;
         |                                     ^
         |                                      = NULL
   1 warning generated.


vim +658 fs/xfs/xfs_iwalk.c

40786717c88c2d Darrick J. Wong   2019-07-03  634  
40786717c88c2d Darrick J. Wong   2019-07-03  635  /*
40786717c88c2d Darrick J. Wong   2019-07-03  636   * Walk all the inodes in the filesystem using multiple threads to process each
40786717c88c2d Darrick J. Wong   2019-07-03  637   * AG.
40786717c88c2d Darrick J. Wong   2019-07-03  638   */
40786717c88c2d Darrick J. Wong   2019-07-03  639  int
40786717c88c2d Darrick J. Wong   2019-07-03  640  xfs_iwalk_threaded(
40786717c88c2d Darrick J. Wong   2019-07-03  641  	struct xfs_mount	*mp,
40786717c88c2d Darrick J. Wong   2019-07-03  642  	xfs_ino_t		startino,
13d59a2a61cbbb Darrick J. Wong   2019-07-03  643  	unsigned int		flags,
40786717c88c2d Darrick J. Wong   2019-07-03  644  	xfs_iwalk_fn		iwalk_fn,
40786717c88c2d Darrick J. Wong   2019-07-03  645  	unsigned int		inode_records,
3e5a428b264eca Darrick J. Wong   2019-07-03  646  	bool			polled,
40786717c88c2d Darrick J. Wong   2019-07-03  647  	void			*data)
40786717c88c2d Darrick J. Wong   2019-07-03  648  {
dc6fdc94e49dd5 Christoph Hellwig 2024-09-20  649  	xfs_agnumber_t		start_agno = XFS_INO_TO_AGNO(mp, startino);
40786717c88c2d Darrick J. Wong   2019-07-03  650  	struct xfs_pwork_ctl	pctl;
6f4118fc6482b1 Dave Chinner      2021-06-02  651  	struct xfs_perag	*pag;
40786717c88c2d Darrick J. Wong   2019-07-03  652  	int			error;
40786717c88c2d Darrick J. Wong   2019-07-03  653  
dc6fdc94e49dd5 Christoph Hellwig 2024-09-20  654  	ASSERT(start_agno < mp->m_sb.sb_agcount);
13d59a2a61cbbb Darrick J. Wong   2019-07-03  655  	ASSERT(!(flags & ~XFS_IWALK_FLAGS_ALL));
40786717c88c2d Darrick J. Wong   2019-07-03  656  
f83d436aef5def Darrick J. Wong   2021-01-22  657  	error = xfs_pwork_init(mp, &pctl, xfs_iwalk_ag_work, "xfs_iwalk");
40786717c88c2d Darrick J. Wong   2019-07-03 @658  	if (error)
40786717c88c2d Darrick J. Wong   2019-07-03  659  		return error;
40786717c88c2d Darrick J. Wong   2019-07-03  660  
dc6fdc94e49dd5 Christoph Hellwig 2024-09-20  661  	while ((pag = xfs_perag_next_from(mp, pag, start_agno))) {
40786717c88c2d Darrick J. Wong   2019-07-03  662  		struct xfs_iwalk_ag	*iwag;
40786717c88c2d Darrick J. Wong   2019-07-03  663  
40786717c88c2d Darrick J. Wong   2019-07-03  664  		if (xfs_pwork_ctl_want_abort(&pctl))
40786717c88c2d Darrick J. Wong   2019-07-03  665  			break;
40786717c88c2d Darrick J. Wong   2019-07-03  666  
10634530f7ba94 Dave Chinner      2024-01-16  667  		iwag = kzalloc(sizeof(struct xfs_iwalk_ag),
10634530f7ba94 Dave Chinner      2024-01-16  668  				GFP_KERNEL | __GFP_NOFAIL);
40786717c88c2d Darrick J. Wong   2019-07-03  669  		iwag->mp = mp;
6f4118fc6482b1 Dave Chinner      2021-06-02  670  
6f4118fc6482b1 Dave Chinner      2021-06-02  671  		/*
9b2e5a234c89f0 Darrick J. Wong   2023-04-11  672  		 * perag is being handed off to async work, so take a passive
6f4118fc6482b1 Dave Chinner      2021-06-02  673  		 * reference for the async work to release.
6f4118fc6482b1 Dave Chinner      2021-06-02  674  		 */
9b2e5a234c89f0 Darrick J. Wong   2023-04-11  675  		iwag->pag = xfs_perag_hold(pag);
40786717c88c2d Darrick J. Wong   2019-07-03  676  		iwag->iwalk_fn = iwalk_fn;
40786717c88c2d Darrick J. Wong   2019-07-03  677  		iwag->data = data;
40786717c88c2d Darrick J. Wong   2019-07-03  678  		iwag->startino = startino;
40786717c88c2d Darrick J. Wong   2019-07-03  679  		iwag->sz_recs = xfs_iwalk_prefetch(inode_records);
27c14b5daa8286 Darrick J. Wong   2020-11-14  680  		iwag->lastino = NULLFSINO;
40786717c88c2d Darrick J. Wong   2019-07-03  681  		xfs_pwork_queue(&pctl, &iwag->pwork);
0c11d62f4b2952 Christoph Hellwig 2024-09-20  682  		startino = XFS_AGINO_TO_INO(mp, pag_agno(pag) + 1, 0);
e6b1a5306e2df8 Christoph Hellwig 2024-09-10  683  		if (flags & XFS_IWALK_SAME_AG)
13d59a2a61cbbb Darrick J. Wong   2019-07-03  684  			break;
40786717c88c2d Darrick J. Wong   2019-07-03  685  	}
6f4118fc6482b1 Dave Chinner      2021-06-02  686  	if (pag)
c4d5660afbdcd3 Dave Chinner      2023-02-13  687  		xfs_perag_rele(pag);
3e5a428b264eca Darrick J. Wong   2019-07-03  688  	if (polled)
3e5a428b264eca Darrick J. Wong   2019-07-03  689  		xfs_pwork_poll(&pctl);
40786717c88c2d Darrick J. Wong   2019-07-03  690  	return xfs_pwork_destroy(&pctl);
40786717c88c2d Darrick J. Wong   2019-07-03  691  }
40786717c88c2d Darrick J. Wong   2019-07-03  692  

:::::: The code at line 658 was first introduced by commit
:::::: 40786717c88c2d4cb426cc2eb99ac50000e5a910 xfs: multithreaded iwalk implementation

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
