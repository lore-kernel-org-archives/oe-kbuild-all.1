Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E1270551
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753356517; cv=none; b=Rzby3yMAoOM4yjD5bE3F7G0M/ZGgM6dc7aoh+kShpSKLk3OM1qsUIK1HAKVoFaOHe94nmZzzddiP714qrMxbZMzf7vdxfVCr8NAsFdxjg1QXrD3Wg/pPcxBTsiSZ915A94tiFKkBCXurNF27KR9ySuhAhx+4gJdfp6Y4dD7YecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753356517; c=relaxed/simple;
	bh=ge4z6unJr0iXwv6pcrwo+8knnp9lwa5yOFZWEW53ne8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqOI3TGyGKTThgnufKWleIdPpPx5BKJafSCg9lZHtjOaT4FSaSjMde/gFAHIfeE7ubE9g4UdGc+enCEyCZMgPY56e2PmdQ+3z0Rp5XQ+vjDPDmjttVLfI5A7UkAFK76LNBYBtGPYwgooQJcyrS1s0AN9ibKLyLscnsPfcr3LFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5awcSRu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5awcSRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F348C4CEED;
	Thu, 24 Jul 2025 11:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753356516;
	bh=ge4z6unJr0iXwv6pcrwo+8knnp9lwa5yOFZWEW53ne8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5awcSRug2AFylzJvEBi8tEYkSP3NbfAoDMQseo5MD/Ym59KL/YAas5F11KtY+NJB
	 ZI/emSotCdUrkxD2+hQV15l5ZlD44oye6n56LyUu3vTzfTGaZEPa27zpN18gcmK4cH
	 6D9O0tNfDsjtTkOe5SA8+E0gfonlLdtOOy6mNDLLjcJExFBTAG8RZGC2oGQlIe5jnt
	 FhEcRVkJlqgcq0QVSVhValO4nKJ5BnGqP/ds+41xxuX+7UArY1nQZpAG8U6NjXSLSy
	 PSkSp2avN5PWGyWH3yva1TMTnbGjsC7SMhSAPDeilY9o3me01pjvsb0xdbid9FUuEJ
	 2Vw8Baqc5kp2A==
Date: Thu, 24 Jul 2025 13:28:32 +0200
From: Carlos Maiolino <cem@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, oe-kbuild-all@lists.linux.dev, 
	Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [linux-next:master 11803/12139] fs/xfs/xfs_qm.c:506:17: error:
 implicit declaration of function 'trace_xfs_dqreclaim_dirty'; did you mean
 'trace_xfs_dqreclaim_done'?
Message-ID: <bwmvu3t3uw7qo5kcv7uwrrcvkhyhyb7ys57qcgsgpal7r3hixy@qjxiqn2ef4ni>
References: <Nk-H2GdoynYmAv3_b2PyJSULw3sGMOU6eBOzBYWOfHMmIJXl_FrPPUp6oLSDTOBeJA6xZDe8i5EISmnsCwgohA==@protonmail.internalid>
 <202507241747.dwTWz8Ig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507241747.dwTWz8Ig-lkp@intel.com>

On Thu, Jul 24, 2025 at 05:54:22PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
> commit: 1edc170bb24082785e5825c46a36af8ae12ac762 [11803/12139] xfs: remove unused trace event xfs_dqreclaim_dirty
> config: x86_64-buildonly-randconfig-003-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241747.dwTWz8Ig-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241747.dwTWz8Ig-lkp@intel.com/reproduce)

I'm aware of this, I thought I had pushed the correct dependencies to
for-next, perhaps I left it pass, I'll fix it.


> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507241747.dwTWz8Ig-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 9ee814bd78e315e4551223ca7548dd3f6bdcf1ae builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    fs/xfs/xfs_qm.c: In function 'xfs_qm_dquot_isolate':
> >> fs/xfs/xfs_qm.c:506:17: error: implicit declaration of function 'trace_xfs_dqreclaim_dirty'; did you mean 'trace_xfs_dqreclaim_done'? [-Werror=implicit-function-declaration]
>      506 |                 trace_xfs_dqreclaim_dirty(dqp);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>          |                 trace_xfs_dqreclaim_done
>    cc1: some warnings being treated as errors
> 
> 
> vim +506 fs/xfs/xfs_qm.c
> 
> cd56a39a598689 Dave Chinner     2013-08-28  457
> cd56a39a598689 Dave Chinner     2013-08-28  458  static enum lru_status
> cd56a39a598689 Dave Chinner     2013-08-28  459  xfs_qm_dquot_isolate(
> cd56a39a598689 Dave Chinner     2013-08-28  460  	struct list_head	*item,
> 3f97b163207c67 Vladimir Davydov 2015-02-12  461  	struct list_lru_one	*lru,
> cd56a39a598689 Dave Chinner     2013-08-28  462  	void			*arg)
> da0c02516c501b Kairui Song      2024-11-05  463  		__releases(&lru->lock) __acquires(&lru->lock)
> cd56a39a598689 Dave Chinner     2013-08-28  464  {
> cd56a39a598689 Dave Chinner     2013-08-28  465  	struct xfs_dquot	*dqp = container_of(item,
> cd56a39a598689 Dave Chinner     2013-08-28  466  						struct xfs_dquot, q_lru);
> cd56a39a598689 Dave Chinner     2013-08-28  467  	struct xfs_qm_isolate	*isol = arg;
> cd56a39a598689 Dave Chinner     2013-08-28  468
> cd56a39a598689 Dave Chinner     2013-08-28  469  	if (!xfs_dqlock_nowait(dqp))
> cd56a39a598689 Dave Chinner     2013-08-28  470  		goto out_miss_busy;
> cd56a39a598689 Dave Chinner     2013-08-28  471
> 52f31ed228212b Dave Chinner     2022-12-08  472  	/*
> 52f31ed228212b Dave Chinner     2022-12-08  473  	 * If something else is freeing this dquot and hasn't yet removed it
> 52f31ed228212b Dave Chinner     2022-12-08  474  	 * from the LRU, leave it for the freeing task to complete the freeing
> 52f31ed228212b Dave Chinner     2022-12-08  475  	 * process rather than risk it being free from under us here.
> 52f31ed228212b Dave Chinner     2022-12-08  476  	 */
> 52f31ed228212b Dave Chinner     2022-12-08  477  	if (dqp->q_flags & XFS_DQFLAG_FREEING)
> 52f31ed228212b Dave Chinner     2022-12-08  478  		goto out_miss_unlock;
> 52f31ed228212b Dave Chinner     2022-12-08  479
> cd56a39a598689 Dave Chinner     2013-08-28  480  	/*
> cd56a39a598689 Dave Chinner     2013-08-28  481  	 * This dquot has acquired a reference in the meantime remove it from
> cd56a39a598689 Dave Chinner     2013-08-28  482  	 * the freelist and try again.
> cd56a39a598689 Dave Chinner     2013-08-28  483  	 */
> cd56a39a598689 Dave Chinner     2013-08-28  484  	if (dqp->q_nrefs) {
> cd56a39a598689 Dave Chinner     2013-08-28  485  		xfs_dqunlock(dqp);
> ff6d6af2351cae Bill O'Donnell   2015-10-12  486  		XFS_STATS_INC(dqp->q_mount, xs_qm_dqwants);
> cd56a39a598689 Dave Chinner     2013-08-28  487
> cd56a39a598689 Dave Chinner     2013-08-28  488  		trace_xfs_dqreclaim_want(dqp);
> 3f97b163207c67 Vladimir Davydov 2015-02-12  489  		list_lru_isolate(lru, &dqp->q_lru);
> ff6d6af2351cae Bill O'Donnell   2015-10-12  490  		XFS_STATS_DEC(dqp->q_mount, xs_qm_dquot_unused);
> 35163417fb7a55 Dave Chinner     2013-08-28  491  		return LRU_REMOVED;
> cd56a39a598689 Dave Chinner     2013-08-28  492  	}
> cd56a39a598689 Dave Chinner     2013-08-28  493
> cd56a39a598689 Dave Chinner     2013-08-28  494  	/*
> cd56a39a598689 Dave Chinner     2013-08-28  495  	 * If the dquot is dirty, flush it. If it's already being flushed, just
> cd56a39a598689 Dave Chinner     2013-08-28  496  	 * skip it so there is time for the IO to complete before we try to
> cd56a39a598689 Dave Chinner     2013-08-28  497  	 * reclaim it again on the next LRU pass.
> cd56a39a598689 Dave Chinner     2013-08-28  498  	 */
> 52f31ed228212b Dave Chinner     2022-12-08  499  	if (!xfs_dqflock_nowait(dqp))
> 52f31ed228212b Dave Chinner     2022-12-08  500  		goto out_miss_unlock;
> cd56a39a598689 Dave Chinner     2013-08-28  501
> cd56a39a598689 Dave Chinner     2013-08-28  502  	if (XFS_DQ_IS_DIRTY(dqp)) {
> cd56a39a598689 Dave Chinner     2013-08-28  503  		struct xfs_buf	*bp = NULL;
> cd56a39a598689 Dave Chinner     2013-08-28  504  		int		error;
> cd56a39a598689 Dave Chinner     2013-08-28  505
> cd56a39a598689 Dave Chinner     2013-08-28 @506  		trace_xfs_dqreclaim_dirty(dqp);
> cd56a39a598689 Dave Chinner     2013-08-28  507
> cd56a39a598689 Dave Chinner     2013-08-28  508  		/* we have to drop the LRU lock to flush the dquot */
> da0c02516c501b Kairui Song      2024-11-05  509  		spin_unlock(&lru->lock);
> cd56a39a598689 Dave Chinner     2013-08-28  510
> ca378189fdfa89 Darrick J. Wong  2024-12-02  511  		error = xfs_dquot_use_attached_buf(dqp, &bp);
> ca378189fdfa89 Darrick J. Wong  2024-12-02  512  		if (!bp || error == -EAGAIN) {
> a40fe30868ba43 Darrick J. Wong  2024-12-02  513  			xfs_dqfunlock(dqp);
> a40fe30868ba43 Darrick J. Wong  2024-12-02  514  			goto out_unlock_dirty;
> a40fe30868ba43 Darrick J. Wong  2024-12-02  515  		}
> a40fe30868ba43 Darrick J. Wong  2024-12-02  516
> a40fe30868ba43 Darrick J. Wong  2024-12-02  517  		/*
> a40fe30868ba43 Darrick J. Wong  2024-12-02  518  		 * dqflush completes dqflock on error, and the delwri ioend
> a40fe30868ba43 Darrick J. Wong  2024-12-02  519  		 * does it on success.
> a40fe30868ba43 Darrick J. Wong  2024-12-02  520  		 */
> a40fe30868ba43 Darrick J. Wong  2024-12-02  521  		error = xfs_qm_dqflush(dqp, bp);
> 609001bca49917 Darrick J. Wong  2018-05-04  522  		if (error)
> cd56a39a598689 Dave Chinner     2013-08-28  523  			goto out_unlock_dirty;
> cd56a39a598689 Dave Chinner     2013-08-28  524
> cd56a39a598689 Dave Chinner     2013-08-28  525  		xfs_buf_delwri_queue(bp, &isol->buffers);
> cd56a39a598689 Dave Chinner     2013-08-28  526  		xfs_buf_relse(bp);
> cd56a39a598689 Dave Chinner     2013-08-28  527  		goto out_unlock_dirty;
> cd56a39a598689 Dave Chinner     2013-08-28  528  	}
> acc8f8628c3737 Darrick J. Wong  2024-12-02  529
> acc8f8628c3737 Darrick J. Wong  2024-12-02  530  	xfs_dquot_detach_buf(dqp);
> cd56a39a598689 Dave Chinner     2013-08-28  531  	xfs_dqfunlock(dqp);
> cd56a39a598689 Dave Chinner     2013-08-28  532
> cd56a39a598689 Dave Chinner     2013-08-28  533  	/*
> cd56a39a598689 Dave Chinner     2013-08-28  534  	 * Prevent lookups now that we are past the point of no return.
> cd56a39a598689 Dave Chinner     2013-08-28  535  	 */
> 985a78fdde15e1 Darrick J. Wong  2020-07-14  536  	dqp->q_flags |= XFS_DQFLAG_FREEING;
> cd56a39a598689 Dave Chinner     2013-08-28  537  	xfs_dqunlock(dqp);
> cd56a39a598689 Dave Chinner     2013-08-28  538
> cd56a39a598689 Dave Chinner     2013-08-28  539  	ASSERT(dqp->q_nrefs == 0);
> 3f97b163207c67 Vladimir Davydov 2015-02-12  540  	list_lru_isolate_move(lru, &dqp->q_lru, &isol->dispose);
> ff6d6af2351cae Bill O'Donnell   2015-10-12  541  	XFS_STATS_DEC(dqp->q_mount, xs_qm_dquot_unused);
> cd56a39a598689 Dave Chinner     2013-08-28  542  	trace_xfs_dqreclaim_done(dqp);
> ff6d6af2351cae Bill O'Donnell   2015-10-12  543  	XFS_STATS_INC(dqp->q_mount, xs_qm_dqreclaims);
> 35163417fb7a55 Dave Chinner     2013-08-28  544  	return LRU_REMOVED;
> cd56a39a598689 Dave Chinner     2013-08-28  545
> 52f31ed228212b Dave Chinner     2022-12-08  546  out_miss_unlock:
> 52f31ed228212b Dave Chinner     2022-12-08  547  	xfs_dqunlock(dqp);
> cd56a39a598689 Dave Chinner     2013-08-28  548  out_miss_busy:
> cd56a39a598689 Dave Chinner     2013-08-28  549  	trace_xfs_dqreclaim_busy(dqp);
> ff6d6af2351cae Bill O'Donnell   2015-10-12  550  	XFS_STATS_INC(dqp->q_mount, xs_qm_dqreclaim_misses);
> 35163417fb7a55 Dave Chinner     2013-08-28  551  	return LRU_SKIP;
> cd56a39a598689 Dave Chinner     2013-08-28  552
> cd56a39a598689 Dave Chinner     2013-08-28  553  out_unlock_dirty:
> cd56a39a598689 Dave Chinner     2013-08-28  554  	trace_xfs_dqreclaim_busy(dqp);
> ff6d6af2351cae Bill O'Donnell   2015-10-12  555  	XFS_STATS_INC(dqp->q_mount, xs_qm_dqreclaim_misses);
> 35163417fb7a55 Dave Chinner     2013-08-28  556  	xfs_dqunlock(dqp);
> 35163417fb7a55 Dave Chinner     2013-08-28  557  	return LRU_RETRY;
> cd56a39a598689 Dave Chinner     2013-08-28  558  }
> cd56a39a598689 Dave Chinner     2013-08-28  559
> 
> :::::: The code at line 506 was first introduced by commit
> :::::: cd56a39a59868911bbf8832725630c1cf43a7b09 xfs: convert dquot cache lru to list_lru
> 
> :::::: TO: Dave Chinner <dchinner@redhat.com>
> :::::: CC: Al Viro <viro@zeniv.linux.org.uk>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
