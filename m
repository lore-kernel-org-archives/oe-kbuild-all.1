Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A9B14B956
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737722323; cv=none; b=HYERrY5kSovsSbqAZNTFhQo6lDL56uYu8dO0Q7/aEgTS3nUaMpxmsuMBMeapnEtBHEAJAjudoqJRthsQV7BdOMF1BBG2LfMYhdEVYsGaE/mWzVda4LMVsC5ePczRNhsSK3YK+seO9guKyl1yGSK82hWSEvUCvgtFvVUvaKa/jhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737722323; c=relaxed/simple;
	bh=7lcQU4L24Wm1dqm0ELajXai8mqOfISrPXxfJ0x8rZu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=COwWnWEMY9yuLvHrF6GBLmOR0g7LtZGdcFl9bV6x9purnT8DkQVgvgTZJrnb82UIZfjvcHVuBskvbqaHnR6fQsmb4D0RZH8Yrd/gDBqqW9W3kdLu7N8apSB8ek1hSUDGCcKjHnLKcWI1q1yGmLvl1HJoFeGILR3JL7+X9N9l66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfj5LEcb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfj5LEcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737722321; x=1769258321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7lcQU4L24Wm1dqm0ELajXai8mqOfISrPXxfJ0x8rZu0=;
  b=mfj5LEcbHGpYhyfYg4U9GYf62KtvtpLY9betILF69ztdQt+2dAlVNloO
   AdQih+DWNqdDmlyP17Iysw11v8PddOrREjOBEkuy5cZvkbUMAIw38UGNv
   tdOfB0M/Re+iB49cLO+yXuJncstxsS78YkDMOkmsoGB3c/KVLVZOXPMTI
   aAYa8YKbwyOKZhr3tytQkDoWTuHi8rhMkgpgNx1amsHu+TmBpD0Rhi3HT
   4e/NCjR1C+4aJYrZSVY8LyokxJhuTHspd9pqF4mNObXYkEbem1HBnfSsz
   mCfP2oXDQKFkLqbh1RiUdhoFyDUrvTSVKsb1G+lBRcrdS0m4xgjmsHMNn
   w==;
X-CSE-ConnectionGUID: TZbFsnVUTOCakJwu3+WYQg==
X-CSE-MsgGUID: OusCXWyjQ3ioseJXrC9ZKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49675368"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49675368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:38:40 -0800
X-CSE-ConnectionGUID: Rik0tDNBSa6vXJKWpfqKpg==
X-CSE-MsgGUID: ezzoWDxIRWCiqhKD62v9fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="138629515"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2025 04:38:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbIxI-000cfp-2Z;
	Fri, 24 Jan 2025 12:38:36 +0000
Date: Fri, 24 Jan 2025 20:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: io_uring/register.c:554:9: sparse: sparse: cast to non-scalar
Message-ID: <202501242000.A2sKqaCL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc8198dc7ebc492ec3e9fa1617dcdfbe98e73b17
commit: 2c5aae129f427f83eeba5efbfb4e60a777cd073c io_uring/register: document io_register_resize_rings() shared mem usage
date:   9 days ago
config: alpha-randconfig-r112-20250124 (https://download.01.org/0day-ci/archive/20250124/202501242000.A2sKqaCL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501242000.A2sKqaCL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501242000.A2sKqaCL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/register.c: note: in included file:
   include/linux/io_uring_types.h:190:37: sparse: sparse: array of flexible structures
>> io_uring/register.c:554:9: sparse: sparse: cast to non-scalar
>> io_uring/register.c:554:9: sparse: sparse: cast from non-scalar

vim +554 io_uring/register.c

   393	
   394	#define swap_old(ctx, o, n, field)		\
   395		do {					\
   396			(o).field = (ctx)->field;	\
   397			(ctx)->field = (n).field;	\
   398		} while (0)
   399	
   400	#define RESIZE_FLAGS	(IORING_SETUP_CQSIZE | IORING_SETUP_CLAMP)
   401	#define COPY_FLAGS	(IORING_SETUP_NO_SQARRAY | IORING_SETUP_SQE128 | \
   402				 IORING_SETUP_CQE32 | IORING_SETUP_NO_MMAP)
   403	
   404	static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
   405	{
   406		struct io_ring_ctx_rings o = { }, n = { }, *to_free = NULL;
   407		size_t size, sq_array_offset;
   408		struct io_uring_params p;
   409		unsigned i, tail;
   410		void *ptr;
   411		int ret;
   412	
   413		/* for single issuer, must be owner resizing */
   414		if (ctx->flags & IORING_SETUP_SINGLE_ISSUER &&
   415		    current != ctx->submitter_task)
   416			return -EEXIST;
   417		/* limited to DEFER_TASKRUN for now */
   418		if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
   419			return -EINVAL;
   420		if (copy_from_user(&p, arg, sizeof(p)))
   421			return -EFAULT;
   422		if (p.flags & ~RESIZE_FLAGS)
   423			return -EINVAL;
   424	
   425		/* properties that are always inherited */
   426		p.flags |= (ctx->flags & COPY_FLAGS);
   427	
   428		ret = io_uring_fill_params(p.sq_entries, &p);
   429		if (unlikely(ret))
   430			return ret;
   431	
   432		/* nothing to do, but copy params back */
   433		if (p.sq_entries == ctx->sq_entries && p.cq_entries == ctx->cq_entries) {
   434			if (copy_to_user(arg, &p, sizeof(p)))
   435				return -EFAULT;
   436			return 0;
   437		}
   438	
   439		size = rings_size(p.flags, p.sq_entries, p.cq_entries,
   440					&sq_array_offset);
   441		if (size == SIZE_MAX)
   442			return -EOVERFLOW;
   443	
   444		if (!(p.flags & IORING_SETUP_NO_MMAP))
   445			n.rings = io_pages_map(&n.ring_pages, &n.n_ring_pages, size);
   446		else
   447			n.rings = __io_uaddr_map(&n.ring_pages, &n.n_ring_pages,
   448							p.cq_off.user_addr, size);
   449		if (IS_ERR(n.rings))
   450			return PTR_ERR(n.rings);
   451	
   452		/*
   453		 * At this point n.rings is shared with userspace, just like o.rings
   454		 * is as well. While we don't expect userspace to modify it while
   455		 * a resize is in progress, and it's most likely that userspace will
   456		 * shoot itself in the foot if it does, we can't always assume good
   457		 * intent... Use read/write once helpers from here on to indicate the
   458		 * shared nature of it.
   459		 */
   460		WRITE_ONCE(n.rings->sq_ring_mask, p.sq_entries - 1);
   461		WRITE_ONCE(n.rings->cq_ring_mask, p.cq_entries - 1);
   462		WRITE_ONCE(n.rings->sq_ring_entries, p.sq_entries);
   463		WRITE_ONCE(n.rings->cq_ring_entries, p.cq_entries);
   464	
   465		if (copy_to_user(arg, &p, sizeof(p))) {
   466			io_register_free_rings(&p, &n);
   467			return -EFAULT;
   468		}
   469	
   470		if (p.flags & IORING_SETUP_SQE128)
   471			size = array_size(2 * sizeof(struct io_uring_sqe), p.sq_entries);
   472		else
   473			size = array_size(sizeof(struct io_uring_sqe), p.sq_entries);
   474		if (size == SIZE_MAX) {
   475			io_register_free_rings(&p, &n);
   476			return -EOVERFLOW;
   477		}
   478	
   479		if (!(p.flags & IORING_SETUP_NO_MMAP))
   480			ptr = io_pages_map(&n.sqe_pages, &n.n_sqe_pages, size);
   481		else
   482			ptr = __io_uaddr_map(&n.sqe_pages, &n.n_sqe_pages,
   483						p.sq_off.user_addr,
   484						size);
   485		if (IS_ERR(ptr)) {
   486			io_register_free_rings(&p, &n);
   487			return PTR_ERR(ptr);
   488		}
   489	
   490		/*
   491		 * If using SQPOLL, park the thread
   492		 */
   493		if (ctx->sq_data) {
   494			mutex_unlock(&ctx->uring_lock);
   495			io_sq_thread_park(ctx->sq_data);
   496			mutex_lock(&ctx->uring_lock);
   497		}
   498	
   499		/*
   500		 * We'll do the swap. Grab the ctx->resize_lock, which will exclude
   501		 * any new mmap's on the ring fd. Clear out existing mappings to prevent
   502		 * mmap from seeing them, as we'll unmap them. Any attempt to mmap
   503		 * existing rings beyond this point will fail. Not that it could proceed
   504		 * at this point anyway, as the io_uring mmap side needs go grab the
   505		 * ctx->resize_lock as well. Likewise, hold the completion lock over the
   506		 * duration of the actual swap.
   507		 */
   508		mutex_lock(&ctx->resize_lock);
   509		spin_lock(&ctx->completion_lock);
   510		o.rings = ctx->rings;
   511		ctx->rings = NULL;
   512		o.sq_sqes = ctx->sq_sqes;
   513		ctx->sq_sqes = NULL;
   514	
   515		/*
   516		 * Now copy SQ and CQ entries, if any. If either of the destination
   517		 * rings can't hold what is already there, then fail the operation.
   518		 */
   519		n.sq_sqes = ptr;
   520		tail = READ_ONCE(o.rings->sq.tail);
   521		if (tail - READ_ONCE(o.rings->sq.head) > p.sq_entries)
   522			goto overflow;
   523		for (i = READ_ONCE(o.rings->sq.head); i < tail; i++) {
   524			unsigned src_head = i & (ctx->sq_entries - 1);
   525			unsigned dst_head = i & (p.sq_entries - 1);
   526	
   527			n.sq_sqes[dst_head] = o.sq_sqes[src_head];
   528		}
   529		WRITE_ONCE(n.rings->sq.head, READ_ONCE(o.rings->sq.head));
   530		WRITE_ONCE(n.rings->sq.tail, READ_ONCE(o.rings->sq.tail));
   531	
   532		tail = READ_ONCE(o.rings->cq.tail);
   533		if (tail - READ_ONCE(o.rings->cq.head) > p.cq_entries) {
   534	overflow:
   535			/* restore old rings, and return -EOVERFLOW via cleanup path */
   536			ctx->rings = o.rings;
   537			ctx->sq_sqes = o.sq_sqes;
   538			to_free = &n;
   539			ret = -EOVERFLOW;
   540			goto out;
   541		}
   542		for (i = READ_ONCE(o.rings->cq.head); i < tail; i++) {
   543			unsigned src_head = i & (ctx->cq_entries - 1);
   544			unsigned dst_head = i & (p.cq_entries - 1);
   545	
   546			n.rings->cqes[dst_head] = o.rings->cqes[src_head];
   547		}
   548		WRITE_ONCE(n.rings->cq.head, READ_ONCE(o.rings->cq.head));
   549		WRITE_ONCE(n.rings->cq.tail, READ_ONCE(o.rings->cq.tail));
   550		/* invalidate cached cqe refill */
   551		ctx->cqe_cached = ctx->cqe_sentinel = NULL;
   552	
   553		WRITE_ONCE(n.rings->sq_dropped, READ_ONCE(o.rings->sq_dropped));
 > 554		WRITE_ONCE(n.rings->sq_flags, READ_ONCE(o.rings->sq_flags));
   555		WRITE_ONCE(n.rings->cq_flags, READ_ONCE(o.rings->cq_flags));
   556		WRITE_ONCE(n.rings->cq_overflow, READ_ONCE(o.rings->cq_overflow));
   557	
   558		/* all done, store old pointers and assign new ones */
   559		if (!(ctx->flags & IORING_SETUP_NO_SQARRAY))
   560			ctx->sq_array = (u32 *)((char *)n.rings + sq_array_offset);
   561	
   562		ctx->sq_entries = p.sq_entries;
   563		ctx->cq_entries = p.cq_entries;
   564	
   565		ctx->rings = n.rings;
   566		ctx->sq_sqes = n.sq_sqes;
   567		swap_old(ctx, o, n, n_ring_pages);
   568		swap_old(ctx, o, n, n_sqe_pages);
   569		swap_old(ctx, o, n, ring_pages);
   570		swap_old(ctx, o, n, sqe_pages);
   571		to_free = &o;
   572		ret = 0;
   573	out:
   574		spin_unlock(&ctx->completion_lock);
   575		mutex_unlock(&ctx->resize_lock);
   576		io_register_free_rings(&p, to_free);
   577	
   578		if (ctx->sq_data)
   579			io_sq_thread_unpark(ctx->sq_data);
   580	
   581		return ret;
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
