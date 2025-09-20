Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36A34BA57
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Sep 2025 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758356255; cv=none; b=rnUhcd8BJIXzyfUqIcE6Ei1Qe69h7tO3vp/RUoFZDvBlXZAF6AShywiaWJ2nkXLeSRxpPMnt87b/3xEJHZqRX2k+/2qafvZECCzWfkr9pI462qw8IOWKMvHnrdOYjUCZBWVZAZr6K9x374mTR1ZUxkrlgkLzd4/nt4yk7VMvKO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758356255; c=relaxed/simple;
	bh=E5k93974LBmNZTET3bQsikHEqgvXfuNW+PnHMv2pU/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zpl8ifQ0SgiwQ2iA3/u0AuvK9i3z9oRGZiDXAWUzgbfkKRZOebxfwLHcJgN5wK5uZnNwIqsTdCTYvsUHhHij1pBETqXbXUguuFJpN013xLQiWCDPY9zAMNpoptwBsalrgYXD9NzN0NaQjSFbiL198Cimo1AN/kpPR18u9BmnLlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1fZerQT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1fZerQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758356253; x=1789892253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5k93974LBmNZTET3bQsikHEqgvXfuNW+PnHMv2pU/g=;
  b=e1fZerQT0g9Y9jBIma0Mw0w5lJVYJcDjDr8ljbDdKWkJ2fURmx5r0Zex
   i1EGpWta0sM1rYwXMgSyo533zNeSwRTJ9EcrytOGL2kPKpBvPbDds0m+0
   +aTBwY4hcc8xc4Mee55OzlD6uDZNme2q2E/+sYo+dQ1H+PR+ZRf4JfCyB
   /17o3wrUxlpEwxT66l49Ne9RmKwXrGPqZrXdjz+AmwpotdizXk7EMSJNX
   swlOqHx0wYrfZtY848VMg4MhDCV6KK0UC16dKrIzZMYNLELmzwzuuUV5x
   I7tNWaeZ4DG6iL21G5ZEi8ssbcLXuXMLySRRzjEA85Tmz4LoTJGY9gYLi
   Q==;
X-CSE-ConnectionGUID: Ev5h0LtPQUSmtD7uz1cm3Q==
X-CSE-MsgGUID: JxCwXangTk6tO/JcbtE9SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71372882"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="71372882"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 01:17:32 -0700
X-CSE-ConnectionGUID: QBB2/zMOQLiS/Uo7cz5NEw==
X-CSE-MsgGUID: gmIbtzZ7SyenaZN0CNWs/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="180278820"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Sep 2025 01:17:31 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzsme-0005A2-32;
	Sat, 20 Sep 2025 08:17:28 +0000
Date: Sat, 20 Sep 2025 16:16:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:cap-analysis 6/13] fs/xfs/xfs_icache.c:573
 xfs_iget_cache_hit() warn: inconsistent indenting
Message-ID: <202509201602.vbE0x8ZL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git cap-analysis
head:   f0fefaa266b6cdc474b78bb5842ee7959505e166
commit: aca1df6ebcad2b6bf881309f22b69dbb0eb72012 [6/13] xfs: move some code out of xfs_iget_recycle
config: i386-randconfig-141-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201602.vbE0x8ZL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201602.vbE0x8ZL-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_icache.c:573 xfs_iget_cache_hit() warn: inconsistent indenting

Old smatch warnings:
fs/xfs/xfs_icache.c:579 xfs_iget_cache_hit() warn: missing unwind goto?

vim +573 fs/xfs/xfs_icache.c

   493	
   494	/*
   495	 * Check the validity of the inode we just found it the cache
   496	 */
   497	static int
   498	xfs_iget_cache_hit(
   499		struct xfs_perag	*pag,
   500		struct xfs_inode	*ip,
   501		xfs_ino_t		ino,
   502		int			flags,
   503		int			lock_flags) __releases(RCU)
   504	{
   505		struct inode		*inode = VFS_I(ip);
   506		struct xfs_mount	*mp = ip->i_mount;
   507		int			error;
   508	
   509		/*
   510		 * check for re-use of an inode within an RCU grace period due to the
   511		 * radix tree nodes not being updated yet. We monitor for this by
   512		 * setting the inode number to zero before freeing the inode structure.
   513		 * If the inode has been reallocated and set up, then the inode number
   514		 * will not match, so check for that, too.
   515		 */
   516		spin_lock(&ip->i_flags_lock);
   517		if (ip->i_ino != ino)
   518			goto out_skip;
   519	
   520		/*
   521		 * If we are racing with another cache hit that is currently
   522		 * instantiating this inode or currently recycling it out of
   523		 * reclaimable state, wait for the initialisation to complete
   524		 * before continuing.
   525		 *
   526		 * If we're racing with the inactivation worker we also want to wait.
   527		 * If we're creating a new file, it's possible that the worker
   528		 * previously marked the inode as free on disk but hasn't finished
   529		 * updating the incore state yet.  The AGI buffer will be dirty and
   530		 * locked to the icreate transaction, so a synchronous push of the
   531		 * inodegc workers would result in deadlock.  For a regular iget, the
   532		 * worker is running already, so we might as well wait.
   533		 *
   534		 * XXX(hch): eventually we should do something equivalent to
   535		 *	     wait_on_inode to wait for these flags to be cleared
   536		 *	     instead of polling for it.
   537		 */
   538		if (ip->i_flags & (XFS_INEW | XFS_IRECLAIM | XFS_INACTIVATING))
   539			goto out_skip;
   540	
   541		if (ip->i_flags & XFS_NEED_INACTIVE) {
   542			/* Unlinked inodes cannot be re-grabbed. */
   543			if (VFS_I(ip)->i_nlink == 0) {
   544				error = -ENOENT;
   545				goto out_error;
   546			}
   547			goto out_inodegc_flush;
   548		}
   549	
   550		/*
   551		 * Check the inode free state is valid. This also detects lookup
   552		 * racing with unlinks.
   553		 */
   554		error = xfs_iget_check_free_state(ip, flags);
   555		if (error)
   556			goto out_error;
   557	
   558		/* Skip inodes that have no vfs state. */
   559		if ((flags & XFS_IGET_INCORE) &&
   560		    (ip->i_flags & XFS_IRECLAIMABLE))
   561			goto out_skip;
   562	
   563		/* The inode fits the selection criteria; process it. */
   564		if (ip->i_flags & XFS_IRECLAIMABLE) {
   565			/*
   566			 * We need to make it look like the inode is being reclaimed to
   567			 * prevent the actual reclaim workers from stomping over us
   568			 * while we recycle the inode.  We can't clear the radix tree
   569			 * tag yet as it requires pag_ici_lock to be held exclusive.
   570			 */
   571			 if (!xfs_ilock_nowait(ip, XFS_ILOCK_EXCL))
   572				 goto out_skip;
 > 573			ip->i_flags |= XFS_IRECLAIM;
   574			spin_unlock(&ip->i_flags_lock);
   575			rcu_read_unlock();
   576	
   577			error = xfs_iget_recycle(pag, ip);
   578			if (error)
   579				return error;
   580		} else {
   581			/* If the VFS inode is being torn down, pause and try again. */
   582			if (!igrab(inode))
   583				goto out_skip;
   584	
   585			/* We've got a live one. */
   586			spin_unlock(&ip->i_flags_lock);
   587			rcu_read_unlock();
   588			trace_xfs_iget_hit(ip);
   589		}
   590	
   591		if (lock_flags != 0)
   592			xfs_ilock(ip, lock_flags);
   593	
   594		if (!(flags & XFS_IGET_INCORE))
   595			xfs_iflags_clear(ip, XFS_ISTALE);
   596		XFS_STATS_INC(mp, xs_ig_found);
   597	
   598		return 0;
   599	
   600	out_skip:
   601		trace_xfs_iget_skip(ip);
   602		XFS_STATS_INC(mp, xs_ig_frecycle);
   603		error = -EAGAIN;
   604	out_error:
   605		spin_unlock(&ip->i_flags_lock);
   606		rcu_read_unlock();
   607		return error;
   608	
   609	out_inodegc_flush:
   610		spin_unlock(&ip->i_flags_lock);
   611		rcu_read_unlock();
   612		/*
   613		 * Do not wait for the workers, because the caller could hold an AGI
   614		 * buffer lock.  We're just going to sleep in a loop anyway.
   615		 */
   616		if (xfs_is_inodegc_enabled(mp))
   617			xfs_inodegc_queue_all(mp);
   618		return -EAGAIN;
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
