Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EF853A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 05:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PW40Q4/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701064708; x=1732600708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oSSMDNkELQ/ZGSB5E2KHI8hjeE9c32lgEgZ1X/vLCfw=;
  b=PW40Q4/gTnmgyGhfUZOR7wzlDM+Ol9xaHjw9mAcndqP3TXyJJifqOFCl
   rEjeD7gz3lNA8I8kKf3P1zspI6et0i4J6blDhkugcaN+0MZiydkv4tLDs
   cBPW4GLvHGQaex33oqSW86XfB0gc20GREsyv5wc4FUJPPTeskSSscZS68
   UJwfCPA+oHcL+HJTcng3BZ33ZrlMP3QYnyW2exz5VtRxbiO7XbLlHQO/z
   tUQX1wEfaqEIrlPK5d7S7Of8IQ0RZy6pI3C8Ht2sRiqyORU9BHyiq5qXK
   2rd2z/okkssPQZt40OVIvz3hr6kf7zCXhEsMc2rKkfYNfECBl3IwwKBEa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5824458"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="5824458"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 21:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="834224090"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="834224090"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2023 21:58:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7UdP-0005rt-2X;
	Mon, 27 Nov 2023 05:58:19 +0000
Date: Mon, 27 Nov 2023 13:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 32/65] fs/iomap/direct-io.c:678:31: warning: use
 of logical '&&' with constant operand
Message-ID: <202311271341.Nq57jrnY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   f5b3c0ffa575a5035e6d607b616c05638ed48937
commit: de17a8bd1922066a368646773b27a4ea6cecc7b6 [32/65] iomap: synchronously complete writes that are entirely out of space
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231127/202311271341.Nq57jrnY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271341.Nq57jrnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271341.Nq57jrnY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/iomap/direct-io.c:678:31: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
           if (iomi.pos == iocb->ki_pos && -ENOSPC)
                                        ^  ~~~~~~~
   fs/iomap/direct-io.c:678:31: note: use '&' for a bitwise operation
           if (iomi.pos == iocb->ki_pos && -ENOSPC)
                                        ^~
                                        &
   fs/iomap/direct-io.c:678:31: note: remove constant to silence this warning
           if (iomi.pos == iocb->ki_pos && -ENOSPC)
                                       ~^~~~~~~~~~
   1 warning generated.


vim +678 fs/iomap/direct-io.c

   524	
   525	/*
   526	 * iomap_dio_rw() always completes O_[D]SYNC writes regardless of whether the IO
   527	 * is being issued as AIO or not.  This allows us to optimise pure data writes
   528	 * to use REQ_FUA rather than requiring generic_write_sync() to issue a
   529	 * REQ_FLUSH post write. This is slightly tricky because a single request here
   530	 * can be mapped into multiple disjoint IOs and only a subset of the IOs issued
   531	 * may be pure data writes. In that case, we still need to do a full data sync
   532	 * completion.
   533	 *
   534	 * When page faults are disabled and @dio_flags includes IOMAP_DIO_PARTIAL,
   535	 * __iomap_dio_rw can return a partial result if it encounters a non-resident
   536	 * page in @iter after preparing a transfer.  In that case, the non-resident
   537	 * pages can be faulted in and the request resumed with @done_before set to the
   538	 * number of bytes previously transferred.  The request will then complete with
   539	 * the correct total number of bytes transferred; this is essential for
   540	 * completing partial requests asynchronously.
   541	 *
   542	 * Returns -ENOTBLK In case of a page invalidation invalidation failure for
   543	 * writes.  The callers needs to fall back to buffered I/O in this case.
   544	 */
   545	struct iomap_dio *
   546	__iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
   547			const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
   548			unsigned int dio_flags, void *private, size_t done_before)
   549	{
   550		struct inode *inode = file_inode(iocb->ki_filp);
   551		struct iomap_iter iomi = {
   552			.inode		= inode,
   553			.pos		= iocb->ki_pos,
   554			.len		= iov_iter_count(iter),
   555			.flags		= IOMAP_DIRECT,
   556			.private	= private,
   557		};
   558		bool wait_for_completion =
   559			is_sync_kiocb(iocb) || (dio_flags & IOMAP_DIO_FORCE_WAIT);
   560		struct blk_plug plug;
   561		struct iomap_dio *dio;
   562		loff_t ret = 0;
   563	
   564		trace_iomap_dio_rw_begin(iocb, iter, dio_flags, done_before);
   565	
   566		if (!iomi.len)
   567			return NULL;
   568	
   569		dio = kmalloc(sizeof(*dio), GFP_KERNEL);
   570		if (!dio)
   571			return ERR_PTR(-ENOMEM);
   572	
   573		dio->iocb = iocb;
   574		atomic_set(&dio->ref, 1);
   575		dio->size = 0;
   576		dio->i_size = i_size_read(inode);
   577		dio->dops = dops;
   578		dio->error = 0;
   579		dio->flags = 0;
   580		dio->done_before = done_before;
   581	
   582		dio->submit.iter = iter;
   583		dio->submit.waiter = current;
   584	
   585		if (iocb->ki_flags & IOCB_NOWAIT)
   586			iomi.flags |= IOMAP_NOWAIT;
   587	
   588		if (iov_iter_rw(iter) == READ) {
   589			/* reads can always complete inline */
   590			dio->flags |= IOMAP_DIO_INLINE_COMP;
   591	
   592			if (iomi.pos >= dio->i_size)
   593				goto out_free_dio;
   594	
   595			if (user_backed_iter(iter))
   596				dio->flags |= IOMAP_DIO_DIRTY;
   597	
   598			ret = kiocb_write_and_wait(iocb, iomi.len);
   599			if (ret)
   600				goto out_free_dio;
   601		} else {
   602			iomi.flags |= IOMAP_WRITE;
   603			dio->flags |= IOMAP_DIO_WRITE;
   604	
   605			/*
   606			 * Flag as supporting deferred completions, if the issuer
   607			 * groks it. This can avoid a workqueue punt for writes.
   608			 * We may later clear this flag if we need to do other IO
   609			 * as part of this IO completion.
   610			 */
   611			if (iocb->ki_flags & IOCB_DIO_CALLER_COMP)
   612				dio->flags |= IOMAP_DIO_CALLER_COMP;
   613	
   614			if (dio_flags & IOMAP_DIO_OVERWRITE_ONLY) {
   615				ret = -EAGAIN;
   616				if (iomi.pos >= dio->i_size ||
   617				    iomi.pos + iomi.len > dio->i_size)
   618					goto out_free_dio;
   619				iomi.flags |= IOMAP_OVERWRITE_ONLY;
   620			}
   621	
   622			/* for data sync or sync, we need sync completion processing */
   623			if (iocb_is_dsync(iocb)) {
   624				dio->flags |= IOMAP_DIO_NEED_SYNC;
   625	
   626			       /*
   627				* For datasync only writes, we optimistically try using
   628				* WRITE_THROUGH for this IO. This flag requires either
   629				* FUA writes through the device's write cache, or a
   630				* normal write to a device without a volatile write
   631				* cache. For the former, Any non-FUA write that occurs
   632				* will clear this flag, hence we know before completion
   633				* whether a cache flush is necessary.
   634				*/
   635				if (!(iocb->ki_flags & IOCB_SYNC))
   636					dio->flags |= IOMAP_DIO_WRITE_THROUGH;
   637			}
   638	
   639			/*
   640			 * Try to invalidate cache pages for the range we are writing.
   641			 * If this invalidation fails, let the caller fall back to
   642			 * buffered I/O.
   643			 */
   644			ret = kiocb_invalidate_pages(iocb, iomi.len);
   645			if (ret) {
   646				if (ret != -EAGAIN) {
   647					trace_iomap_dio_invalidate_fail(inode, iomi.pos,
   648									iomi.len);
   649					ret = -ENOTBLK;
   650				}
   651				goto out_free_dio;
   652			}
   653	
   654			if (!wait_for_completion && !inode->i_sb->s_dio_done_wq) {
   655				ret = sb_init_dio_done_wq(inode->i_sb);
   656				if (ret < 0)
   657					goto out_free_dio;
   658			}
   659		}
   660	
   661		inode_dio_begin(inode);
   662	
   663		blk_start_plug(&plug);
   664		while ((ret = iomap_iter(&iomi, ops)) > 0) {
   665			iomi.processed = iomap_dio_iter(&iomi, dio);
   666	
   667			/*
   668			 * We can only poll for single bio I/Os.
   669			 */
   670			iocb->ki_flags &= ~IOCB_HIPRI;
   671		}
   672		blk_finish_plug(&plug);
   673	
   674		/*
   675		 * If we got -ENOSPC on the first attempt to allocate blocks, relay that
   676		 * to the caller so that it can handle the error.
   677		 */
 > 678		if (iomi.pos == iocb->ki_pos && -ENOSPC)
   679			wait_for_completion = true;
   680	
   681		/*
   682		 * We only report that we've read data up to i_size.
   683		 * Revert iter to a state corresponding to that as some callers (such
   684		 * as the splice code) rely on it.
   685		 */
   686		if (iov_iter_rw(iter) == READ && iomi.pos >= dio->i_size)
   687			iov_iter_revert(iter, iomi.pos - dio->i_size);
   688	
   689		if (ret == -EFAULT && dio->size && (dio_flags & IOMAP_DIO_PARTIAL)) {
   690			if (!(iocb->ki_flags & IOCB_NOWAIT))
   691				wait_for_completion = true;
   692			ret = 0;
   693		}
   694	
   695		/* magic error code to fall back to buffered I/O */
   696		if (ret == -ENOTBLK) {
   697			wait_for_completion = true;
   698			ret = 0;
   699		}
   700		if (ret < 0)
   701			iomap_dio_set_error(dio, ret);
   702	
   703		/*
   704		 * If all the writes we issued were already written through to the
   705		 * media, we don't need to flush the cache on IO completion. Clear the
   706		 * sync flag for this case.
   707		 */
   708		if (dio->flags & IOMAP_DIO_WRITE_THROUGH)
   709			dio->flags &= ~IOMAP_DIO_NEED_SYNC;
   710	
   711		/*
   712		 * We are about to drop our additional submission reference, which
   713		 * might be the last reference to the dio.  There are three different
   714		 * ways we can progress here:
   715		 *
   716		 *  (a) If this is the last reference we will always complete and free
   717		 *	the dio ourselves.
   718		 *  (b) If this is not the last reference, and we serve an asynchronous
   719		 *	iocb, we must never touch the dio after the decrement, the
   720		 *	I/O completion handler will complete and free it.
   721		 *  (c) If this is not the last reference, but we serve a synchronous
   722		 *	iocb, the I/O completion handler will wake us up on the drop
   723		 *	of the final reference, and we will complete and free it here
   724		 *	after we got woken by the I/O completion handler.
   725		 */
   726		dio->wait_for_completion = wait_for_completion;
   727		if (!atomic_dec_and_test(&dio->ref)) {
   728			if (!wait_for_completion) {
   729				trace_iomap_dio_rw_queued(inode, iomi.pos, iomi.len);
   730				return ERR_PTR(-EIOCBQUEUED);
   731			}
   732	
   733			for (;;) {
   734				set_current_state(TASK_UNINTERRUPTIBLE);
   735				if (!READ_ONCE(dio->submit.waiter))
   736					break;
   737	
   738				blk_io_schedule();
   739			}
   740			__set_current_state(TASK_RUNNING);
   741		}
   742	
   743		return dio;
   744	
   745	out_free_dio:
   746		kfree(dio);
   747		if (ret)
   748			return ERR_PTR(ret);
   749		return NULL;
   750	}
   751	EXPORT_SYMBOL_GPL(__iomap_dio_rw);
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
