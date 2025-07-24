Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79F2571C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 09:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350911; cv=none; b=cqYHGzvIAK/j1SL/xrP5IR1Y64UewCK0cfXeQu+TAIyAm1aA+6mNtZ+7Qp7rmvFR6adSI9LQjlLjCJNK8hoWEq+LrygsWz/YZZ54ZBkYDzJeuRLhK78F1koCNRL8HLMqonJUyevbxf3y+1JgaWyyxs4Av1ZxMpy9Pc6rPYqg5S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350911; c=relaxed/simple;
	bh=dnz3X0jfzIxU/VxF8WcGaokk0+5PsoE5NcMCTglLn2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FYJPd8cieYeyLjKh0P12khFGo1q6ax+0r+KUnT9z5HWye3Ie48qrVzoFmKhDP3uZCvdvttbuSy/1r4LvCiRvQXDAhy8eaPUhuUTaGKL3vNDJwsCHLc9QWJtqRFF+RCzYwrHWcBSK8oWyYKYnT7xZL8YjyEIw9ELI1J8pVqiPS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+G4RBeZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+G4RBeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753350909; x=1784886909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dnz3X0jfzIxU/VxF8WcGaokk0+5PsoE5NcMCTglLn2o=;
  b=m+G4RBeZokhvs7+5eSQlTtK4Ta7rT1K8XSwaNm5ku9pJIjVWO6ef2JJ4
   0T8baRNqPBv1aMboUM9KlM46bq+B45EB+AVeaFTjCncCi+ojAfkFiLBhL
   Xtfh6MLttk9b4awd8EPeipDqUSZTNCTAB2VgmqyMTDNeeF+7bxP/Jks2v
   TDGoYbZjoEOXT1y9f7zewTbK+c5dg1MjDRkEKYoF6zTR4BkYTc+IcC3LA
   CwgseW2gUHBUvRX2xfMk57hOhWE9NVwuaumEWLtFh8TUUxn2mu6uVG19e
   RLiOFQm4uOIm4tfu31KuYrVmFft/L1ZybOwzsPBUhAVPF1dMbgUhRtngR
   w==;
X-CSE-ConnectionGUID: QZSJwBGDTxW4K3iKiBUbWw==
X-CSE-MsgGUID: eqYFvV77THSKQ/+7074b0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66219760"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="66219760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 02:55:08 -0700
X-CSE-ConnectionGUID: xjsikBSJQl+nZS/9pTbz6w==
X-CSE-MsgGUID: SkcnmrprR1iJuTiQvZYMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="159722717"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2025 02:55:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uesfI-000KIX-2s;
	Thu, 24 Jul 2025 09:55:04 +0000
Date: Thu, 24 Jul 2025 17:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, Carlos Maiolino <cem@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [linux-next:master 11803/12139] fs/xfs/xfs_qm.c:506:17: error:
 implicit declaration of function 'trace_xfs_dqreclaim_dirty'; did you mean
 'trace_xfs_dqreclaim_done'?
Message-ID: <202507241747.dwTWz8Ig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
commit: 1edc170bb24082785e5825c46a36af8ae12ac762 [11803/12139] xfs: remove unused trace event xfs_dqreclaim_dirty
config: x86_64-buildonly-randconfig-003-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241747.dwTWz8Ig-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241747.dwTWz8Ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241747.dwTWz8Ig-lkp@intel.com/

Note: the linux-next/master HEAD 9ee814bd78e315e4551223ca7548dd3f6bdcf1ae builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   fs/xfs/xfs_qm.c: In function 'xfs_qm_dquot_isolate':
>> fs/xfs/xfs_qm.c:506:17: error: implicit declaration of function 'trace_xfs_dqreclaim_dirty'; did you mean 'trace_xfs_dqreclaim_done'? [-Werror=implicit-function-declaration]
     506 |                 trace_xfs_dqreclaim_dirty(dqp);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 trace_xfs_dqreclaim_done
   cc1: some warnings being treated as errors


vim +506 fs/xfs/xfs_qm.c

cd56a39a598689 Dave Chinner     2013-08-28  457  
cd56a39a598689 Dave Chinner     2013-08-28  458  static enum lru_status
cd56a39a598689 Dave Chinner     2013-08-28  459  xfs_qm_dquot_isolate(
cd56a39a598689 Dave Chinner     2013-08-28  460  	struct list_head	*item,
3f97b163207c67 Vladimir Davydov 2015-02-12  461  	struct list_lru_one	*lru,
cd56a39a598689 Dave Chinner     2013-08-28  462  	void			*arg)
da0c02516c501b Kairui Song      2024-11-05  463  		__releases(&lru->lock) __acquires(&lru->lock)
cd56a39a598689 Dave Chinner     2013-08-28  464  {
cd56a39a598689 Dave Chinner     2013-08-28  465  	struct xfs_dquot	*dqp = container_of(item,
cd56a39a598689 Dave Chinner     2013-08-28  466  						struct xfs_dquot, q_lru);
cd56a39a598689 Dave Chinner     2013-08-28  467  	struct xfs_qm_isolate	*isol = arg;
cd56a39a598689 Dave Chinner     2013-08-28  468  
cd56a39a598689 Dave Chinner     2013-08-28  469  	if (!xfs_dqlock_nowait(dqp))
cd56a39a598689 Dave Chinner     2013-08-28  470  		goto out_miss_busy;
cd56a39a598689 Dave Chinner     2013-08-28  471  
52f31ed228212b Dave Chinner     2022-12-08  472  	/*
52f31ed228212b Dave Chinner     2022-12-08  473  	 * If something else is freeing this dquot and hasn't yet removed it
52f31ed228212b Dave Chinner     2022-12-08  474  	 * from the LRU, leave it for the freeing task to complete the freeing
52f31ed228212b Dave Chinner     2022-12-08  475  	 * process rather than risk it being free from under us here.
52f31ed228212b Dave Chinner     2022-12-08  476  	 */
52f31ed228212b Dave Chinner     2022-12-08  477  	if (dqp->q_flags & XFS_DQFLAG_FREEING)
52f31ed228212b Dave Chinner     2022-12-08  478  		goto out_miss_unlock;
52f31ed228212b Dave Chinner     2022-12-08  479  
cd56a39a598689 Dave Chinner     2013-08-28  480  	/*
cd56a39a598689 Dave Chinner     2013-08-28  481  	 * This dquot has acquired a reference in the meantime remove it from
cd56a39a598689 Dave Chinner     2013-08-28  482  	 * the freelist and try again.
cd56a39a598689 Dave Chinner     2013-08-28  483  	 */
cd56a39a598689 Dave Chinner     2013-08-28  484  	if (dqp->q_nrefs) {
cd56a39a598689 Dave Chinner     2013-08-28  485  		xfs_dqunlock(dqp);
ff6d6af2351cae Bill O'Donnell   2015-10-12  486  		XFS_STATS_INC(dqp->q_mount, xs_qm_dqwants);
cd56a39a598689 Dave Chinner     2013-08-28  487  
cd56a39a598689 Dave Chinner     2013-08-28  488  		trace_xfs_dqreclaim_want(dqp);
3f97b163207c67 Vladimir Davydov 2015-02-12  489  		list_lru_isolate(lru, &dqp->q_lru);
ff6d6af2351cae Bill O'Donnell   2015-10-12  490  		XFS_STATS_DEC(dqp->q_mount, xs_qm_dquot_unused);
35163417fb7a55 Dave Chinner     2013-08-28  491  		return LRU_REMOVED;
cd56a39a598689 Dave Chinner     2013-08-28  492  	}
cd56a39a598689 Dave Chinner     2013-08-28  493  
cd56a39a598689 Dave Chinner     2013-08-28  494  	/*
cd56a39a598689 Dave Chinner     2013-08-28  495  	 * If the dquot is dirty, flush it. If it's already being flushed, just
cd56a39a598689 Dave Chinner     2013-08-28  496  	 * skip it so there is time for the IO to complete before we try to
cd56a39a598689 Dave Chinner     2013-08-28  497  	 * reclaim it again on the next LRU pass.
cd56a39a598689 Dave Chinner     2013-08-28  498  	 */
52f31ed228212b Dave Chinner     2022-12-08  499  	if (!xfs_dqflock_nowait(dqp))
52f31ed228212b Dave Chinner     2022-12-08  500  		goto out_miss_unlock;
cd56a39a598689 Dave Chinner     2013-08-28  501  
cd56a39a598689 Dave Chinner     2013-08-28  502  	if (XFS_DQ_IS_DIRTY(dqp)) {
cd56a39a598689 Dave Chinner     2013-08-28  503  		struct xfs_buf	*bp = NULL;
cd56a39a598689 Dave Chinner     2013-08-28  504  		int		error;
cd56a39a598689 Dave Chinner     2013-08-28  505  
cd56a39a598689 Dave Chinner     2013-08-28 @506  		trace_xfs_dqreclaim_dirty(dqp);
cd56a39a598689 Dave Chinner     2013-08-28  507  
cd56a39a598689 Dave Chinner     2013-08-28  508  		/* we have to drop the LRU lock to flush the dquot */
da0c02516c501b Kairui Song      2024-11-05  509  		spin_unlock(&lru->lock);
cd56a39a598689 Dave Chinner     2013-08-28  510  
ca378189fdfa89 Darrick J. Wong  2024-12-02  511  		error = xfs_dquot_use_attached_buf(dqp, &bp);
ca378189fdfa89 Darrick J. Wong  2024-12-02  512  		if (!bp || error == -EAGAIN) {
a40fe30868ba43 Darrick J. Wong  2024-12-02  513  			xfs_dqfunlock(dqp);
a40fe30868ba43 Darrick J. Wong  2024-12-02  514  			goto out_unlock_dirty;
a40fe30868ba43 Darrick J. Wong  2024-12-02  515  		}
a40fe30868ba43 Darrick J. Wong  2024-12-02  516  
a40fe30868ba43 Darrick J. Wong  2024-12-02  517  		/*
a40fe30868ba43 Darrick J. Wong  2024-12-02  518  		 * dqflush completes dqflock on error, and the delwri ioend
a40fe30868ba43 Darrick J. Wong  2024-12-02  519  		 * does it on success.
a40fe30868ba43 Darrick J. Wong  2024-12-02  520  		 */
a40fe30868ba43 Darrick J. Wong  2024-12-02  521  		error = xfs_qm_dqflush(dqp, bp);
609001bca49917 Darrick J. Wong  2018-05-04  522  		if (error)
cd56a39a598689 Dave Chinner     2013-08-28  523  			goto out_unlock_dirty;
cd56a39a598689 Dave Chinner     2013-08-28  524  
cd56a39a598689 Dave Chinner     2013-08-28  525  		xfs_buf_delwri_queue(bp, &isol->buffers);
cd56a39a598689 Dave Chinner     2013-08-28  526  		xfs_buf_relse(bp);
cd56a39a598689 Dave Chinner     2013-08-28  527  		goto out_unlock_dirty;
cd56a39a598689 Dave Chinner     2013-08-28  528  	}
acc8f8628c3737 Darrick J. Wong  2024-12-02  529  
acc8f8628c3737 Darrick J. Wong  2024-12-02  530  	xfs_dquot_detach_buf(dqp);
cd56a39a598689 Dave Chinner     2013-08-28  531  	xfs_dqfunlock(dqp);
cd56a39a598689 Dave Chinner     2013-08-28  532  
cd56a39a598689 Dave Chinner     2013-08-28  533  	/*
cd56a39a598689 Dave Chinner     2013-08-28  534  	 * Prevent lookups now that we are past the point of no return.
cd56a39a598689 Dave Chinner     2013-08-28  535  	 */
985a78fdde15e1 Darrick J. Wong  2020-07-14  536  	dqp->q_flags |= XFS_DQFLAG_FREEING;
cd56a39a598689 Dave Chinner     2013-08-28  537  	xfs_dqunlock(dqp);
cd56a39a598689 Dave Chinner     2013-08-28  538  
cd56a39a598689 Dave Chinner     2013-08-28  539  	ASSERT(dqp->q_nrefs == 0);
3f97b163207c67 Vladimir Davydov 2015-02-12  540  	list_lru_isolate_move(lru, &dqp->q_lru, &isol->dispose);
ff6d6af2351cae Bill O'Donnell   2015-10-12  541  	XFS_STATS_DEC(dqp->q_mount, xs_qm_dquot_unused);
cd56a39a598689 Dave Chinner     2013-08-28  542  	trace_xfs_dqreclaim_done(dqp);
ff6d6af2351cae Bill O'Donnell   2015-10-12  543  	XFS_STATS_INC(dqp->q_mount, xs_qm_dqreclaims);
35163417fb7a55 Dave Chinner     2013-08-28  544  	return LRU_REMOVED;
cd56a39a598689 Dave Chinner     2013-08-28  545  
52f31ed228212b Dave Chinner     2022-12-08  546  out_miss_unlock:
52f31ed228212b Dave Chinner     2022-12-08  547  	xfs_dqunlock(dqp);
cd56a39a598689 Dave Chinner     2013-08-28  548  out_miss_busy:
cd56a39a598689 Dave Chinner     2013-08-28  549  	trace_xfs_dqreclaim_busy(dqp);
ff6d6af2351cae Bill O'Donnell   2015-10-12  550  	XFS_STATS_INC(dqp->q_mount, xs_qm_dqreclaim_misses);
35163417fb7a55 Dave Chinner     2013-08-28  551  	return LRU_SKIP;
cd56a39a598689 Dave Chinner     2013-08-28  552  
cd56a39a598689 Dave Chinner     2013-08-28  553  out_unlock_dirty:
cd56a39a598689 Dave Chinner     2013-08-28  554  	trace_xfs_dqreclaim_busy(dqp);
ff6d6af2351cae Bill O'Donnell   2015-10-12  555  	XFS_STATS_INC(dqp->q_mount, xs_qm_dqreclaim_misses);
35163417fb7a55 Dave Chinner     2013-08-28  556  	xfs_dqunlock(dqp);
35163417fb7a55 Dave Chinner     2013-08-28  557  	return LRU_RETRY;
cd56a39a598689 Dave Chinner     2013-08-28  558  }
cd56a39a598689 Dave Chinner     2013-08-28  559  

:::::: The code at line 506 was first introduced by commit
:::::: cd56a39a59868911bbf8832725630c1cf43a7b09 xfs: convert dquot cache lru to list_lru

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
