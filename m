Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA81D555
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 04:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772510628; cv=none; b=kcbefzdxLPUbASwL91V/ANaUpZ6zYHck7VXuHyDdMVFN6/1y7vkKOb4Snwr2148aGe/S7m9eb6u+PQC9vWcdU4LJ/rTHaHtj/xVbYgo/h0sMlxodj6ZI917eEpzVg2YI8hQFCJXSIhMa8soV7gGsNml3FOlz6GMHC32lgyHfAnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772510628; c=relaxed/simple;
	bh=pyCmj2xMfRrrec+RSHF5gq6hoDHMeqwjDpYXCSF63eI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qbfIt9XAhEhO2vjvaobLx+NwtoQYSiDeb7lnlXBachS0QUN+vJPQn8AHGxlMxq76MOie94RPanXZTtORSdAbgFBdhGDfSlY6oSp0dRQKRSJI+8auy8D6sUKxk43+vZgrzA3jGZPqid2CUu53q4RNYl1PH2X4EDc4lJMxJfo3TbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0dsZxZZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0dsZxZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772510625; x=1804046625;
  h=date:from:to:cc:subject:message-id;
  bh=pyCmj2xMfRrrec+RSHF5gq6hoDHMeqwjDpYXCSF63eI=;
  b=h0dsZxZZ9M9Kl+LBYQyz857V2FmvI7qL3MlGwJElF7T/09Djh8t20okM
   4JuRXAlHumardCMj1/62bxhKL/6/r4uYCNOXJT8cLsBuo7Orwr6M6gm1C
   B43Lh9cQhN66eiBOxmbVhizoEgZMm2CuVg+IzmdhXZPfiKl+LQmLRsCw0
   WdUv4j1NGP08do9oUN97BlUa/fz6xs7G0aJNbJGWGTavkosl2F1TKU9UE
   kcJhJzc9YV5Eo9VeAaWBjlXz/tq3gg0dpJw3ODfy1eQGH8wMcIoQwuvOu
   HdOIIVf3b8klumFknWAOi4d5ZVkSjplN9zIvZ1GhX4nHFSiibZXDrEi7C
   w==;
X-CSE-ConnectionGUID: Dhocoey3QKyhGG4//rTErw==
X-CSE-MsgGUID: fyx2sfaLS4Gtp5vqaYj9sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77144450"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="77144450"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 20:03:44 -0800
X-CSE-ConnectionGUID: 16ODldirSU2/P2G/TRLB6w==
X-CSE-MsgGUID: JvlBO5rtSb2Tu6wGwzjmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="216278685"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Mar 2026 20:03:42 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxGyx-000000001ir-2U0N;
	Tue, 03 Mar 2026 04:03:39 +0000
Date: Tue, 03 Mar 2026 12:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 17/17]
 fs/netfs/write_issue.c:555:37: error: 'struct netfs_io_request' has no member
 named 'dispatch_cursor'
Message-ID: <202603031248.52Aina9j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   955516269df2e8601e8736e89e91820dc3d053c2
commit: 955516269df2e8601e8736e89e91820dc3d053c2 [17/17] netfs: Combine prepare and issue ops and grab the buffers on request
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260303/202603031248.52Aina9j-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031248.52Aina9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031248.52Aina9j-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/write_issue.c: In function 'netfs_queue_wb_folio':
>> fs/netfs/write_issue.c:555:37: error: 'struct netfs_io_request' has no member named 'dispatch_cursor'
     555 |                 bvecq_pos_move(&wreq->dispatch_cursor, queue);
         |                                     ^~
   fs/netfs/write_issue.c:556:21: error: 'struct netfs_io_request' has no member named 'dispatch_cursor'
     556 |                 wreq->dispatch_cursor.slot = 0;
         |                     ^~
   In file included from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/netfs/write_issue.c:34:
   fs/netfs/write_issue.c: In function 'netfs_writeback_single':
   fs/netfs/internal.h:583:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     583 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   fs/netfs/internal.h:583:9: note: in expansion of macro 'printk'
     583 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |         ^~~~~~
   fs/netfs/internal.h:585:26: note: in expansion of macro 'dbgprintk'
     585 | #define kenter(FMT, ...) dbgprintk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/internal.h:598:17: note: in expansion of macro 'kenter'
     598 |                 kenter(FMT, ##__VA_ARGS__);     \
         |                 ^~~~~~
   fs/netfs/write_issue.c:920:9: note: in expansion of macro '_enter'
     920 |         _enter("%lx,%lx", iov_iter_count(iter), len);
         |         ^~~~~~
   fs/netfs/internal.h:583:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     583 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   fs/netfs/internal.h:583:9: note: in expansion of macro 'printk'
     583 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |         ^~~~~~
   fs/netfs/internal.h:585:26: note: in expansion of macro 'dbgprintk'
     585 | #define kenter(FMT, ...) dbgprintk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/internal.h:598:17: note: in expansion of macro 'kenter'
     598 |                 kenter(FMT, ##__VA_ARGS__);     \
         |                 ^~~~~~
   fs/netfs/write_issue.c:920:9: note: in expansion of macro '_enter'
     920 |         _enter("%lx,%lx", iov_iter_count(iter), len);
         |         ^~~~~~


vim +555 fs/netfs/write_issue.c

955516269df2e86 David Howells 2026-02-27  520  
955516269df2e86 David Howells 2026-02-27  521  /*
955516269df2e86 David Howells 2026-02-27  522   * Queue a folio for writeback.
955516269df2e86 David Howells 2026-02-27  523   */
955516269df2e86 David Howells 2026-02-27  524  static int netfs_queue_wb_folio(struct netfs_io_request *wreq,
288ace2f57c9d06 David Howells 2024-03-18  525  				struct writeback_control *wbc,
955516269df2e86 David Howells 2026-02-27  526  				struct folio *folio,
955516269df2e86 David Howells 2026-02-27  527  				struct netfs_wb_params *params)
288ace2f57c9d06 David Howells 2024-03-18  528  {
288ace2f57c9d06 David Howells 2024-03-18  529  	struct netfs_group *fgroup; /* TODO: Use this with ceph */
288ace2f57c9d06 David Howells 2024-03-18  530  	struct netfs_folio *finfo;
5556b8319586786 David Howells 2026-02-28  531  	struct bvecq *queue = wreq->load_cursor.bvecq;
5556b8319586786 David Howells 2026-02-28  532  	unsigned int slot;
288ace2f57c9d06 David Howells 2024-03-18  533  	size_t fsize = folio_size(folio), flen = fsize, foff = 0;
288ace2f57c9d06 David Howells 2024-03-18  534  	loff_t fpos = folio_pos(folio), i_size;
5556b8319586786 David Howells 2026-02-28  535  	int ret;
288ace2f57c9d06 David Howells 2024-03-18  536  
955516269df2e86 David Howells 2026-02-27  537  	_enter("%x", params->notes);
288ace2f57c9d06 David Howells 2024-03-18  538  
5556b8319586786 David Howells 2026-02-28  539  	/* Institute a new bvec queue segment if the current one is full or if
5556b8319586786 David Howells 2026-02-28  540  	 * we encounter a discontiguity.  The discontiguity break is important
5556b8319586786 David Howells 2026-02-28  541  	 * when it comes to bulk unlocking folios by file range.
5556b8319586786 David Howells 2026-02-28  542  	 */
5556b8319586786 David Howells 2026-02-28  543  	if (bvecq_is_full(queue) ||
955516269df2e86 David Howells 2026-02-27  544  	    (fpos != params->last_end && params->last_end > 0)) {
5556b8319586786 David Howells 2026-02-28  545  		ret = bvecq_buffer_make_space(&wreq->load_cursor);
5556b8319586786 David Howells 2026-02-28  546  		if (ret < 0) {
5556b8319586786 David Howells 2026-02-28  547  			folio_unlock(folio);
5556b8319586786 David Howells 2026-02-28  548  			return ret;
5556b8319586786 David Howells 2026-02-28  549  		}
5556b8319586786 David Howells 2026-02-28  550  
5556b8319586786 David Howells 2026-02-28  551  		queue = wreq->load_cursor.bvecq;
5556b8319586786 David Howells 2026-02-28  552  		queue->fpos = fpos;
955516269df2e86 David Howells 2026-02-27  553  		if (fpos != params->last_end)
5556b8319586786 David Howells 2026-02-28  554  			queue->discontig = true;
5556b8319586786 David Howells 2026-02-28 @555  		bvecq_pos_move(&wreq->dispatch_cursor, queue);
5556b8319586786 David Howells 2026-02-28  556  		wreq->dispatch_cursor.slot = 0;
5556b8319586786 David Howells 2026-02-28  557  	}
06fa229ceb36898 David Howells 2024-12-16  558  
288ace2f57c9d06 David Howells 2024-03-18  559  	/* netfs_perform_write() may shift i_size around the page or from out
288ace2f57c9d06 David Howells 2024-03-18  560  	 * of the page to beyond it, but cannot move i_size into or through the
288ace2f57c9d06 David Howells 2024-03-18  561  	 * page since we have it locked.
288ace2f57c9d06 David Howells 2024-03-18  562  	 */
288ace2f57c9d06 David Howells 2024-03-18  563  	i_size = i_size_read(wreq->inode);
288ace2f57c9d06 David Howells 2024-03-18  564  
288ace2f57c9d06 David Howells 2024-03-18  565  	if (fpos >= i_size) {
288ace2f57c9d06 David Howells 2024-03-18  566  		/* mmap beyond eof. */
a9d47a50cf257ff David Howells 2024-07-18  567  		_debug("beyond eof");
288ace2f57c9d06 David Howells 2024-03-18  568  		folio_start_writeback(folio);
288ace2f57c9d06 David Howells 2024-03-18  569  		folio_unlock(folio);
288ace2f57c9d06 David Howells 2024-03-18  570  		wreq->nr_group_rel += netfs_folio_written_back(folio);
288ace2f57c9d06 David Howells 2024-03-18  571  		netfs_put_group_many(wreq->group, wreq->nr_group_rel);
288ace2f57c9d06 David Howells 2024-03-18  572  		wreq->nr_group_rel = 0;
288ace2f57c9d06 David Howells 2024-03-18  573  		return 0;
288ace2f57c9d06 David Howells 2024-03-18  574  	}
288ace2f57c9d06 David Howells 2024-03-18  575  
288ace2f57c9d06 David Howells 2024-03-18  576  	if (fpos + fsize > wreq->i_size)
288ace2f57c9d06 David Howells 2024-03-18  577  		wreq->i_size = i_size;
288ace2f57c9d06 David Howells 2024-03-18  578  
288ace2f57c9d06 David Howells 2024-03-18  579  	fgroup = netfs_folio_group(folio);
288ace2f57c9d06 David Howells 2024-03-18  580  	finfo = netfs_folio_info(folio);
288ace2f57c9d06 David Howells 2024-03-18  581  	if (finfo) {
288ace2f57c9d06 David Howells 2024-03-18  582  		foff = finfo->dirty_offset;
288ace2f57c9d06 David Howells 2024-03-18  583  		flen = foff + finfo->dirty_len;
955516269df2e86 David Howells 2026-02-27  584  		params->notes |= NOTE_STREAMW;
955516269df2e86 David Howells 2026-02-27  585  		if (foff > 0)
955516269df2e86 David Howells 2026-02-27  586  			params->notes |= NOTE_DISCONTIG_BEFORE;
955516269df2e86 David Howells 2026-02-27  587  		if (flen < fsize)
955516269df2e86 David Howells 2026-02-27  588  			params->notes |= NOTE_DISCONTIG_AFTER;
288ace2f57c9d06 David Howells 2024-03-18  589  	}
288ace2f57c9d06 David Howells 2024-03-18  590  
955516269df2e86 David Howells 2026-02-27  591  	if (params->last_end && fpos != params->last_end)
955516269df2e86 David Howells 2026-02-27  592  		params->notes |= NOTE_DISCONTIG_BEFORE;
955516269df2e86 David Howells 2026-02-27  593  	params->last_end = fpos + fsize;
955516269df2e86 David Howells 2026-02-27  594  
288ace2f57c9d06 David Howells 2024-03-18  595  	if (wreq->origin == NETFS_WRITETHROUGH) {
288ace2f57c9d06 David Howells 2024-03-18  596  		if (flen > i_size - fpos)
288ace2f57c9d06 David Howells 2024-03-18  597  			flen = i_size - fpos;
955516269df2e86 David Howells 2026-02-27  598  		/* EOF may be changing. */
288ace2f57c9d06 David Howells 2024-03-18  599  	} else if (flen > i_size - fpos) {
288ace2f57c9d06 David Howells 2024-03-18  600  		flen = i_size - fpos;
955516269df2e86 David Howells 2026-02-27  601  		if (!(params->notes & NOTE_STREAMW))
288ace2f57c9d06 David Howells 2024-03-18  602  			folio_zero_segment(folio, flen, fsize);
955516269df2e86 David Howells 2026-02-27  603  		params->notes |= NOTE_TO_EOF;
288ace2f57c9d06 David Howells 2024-03-18  604  	} else if (flen == i_size - fpos) {
955516269df2e86 David Howells 2026-02-27  605  		params->notes |= NOTE_TO_EOF;
288ace2f57c9d06 David Howells 2024-03-18  606  	}
288ace2f57c9d06 David Howells 2024-03-18  607  	flen -= foff;
288ace2f57c9d06 David Howells 2024-03-18  608  
955516269df2e86 David Howells 2026-02-27  609  	params->folio_start	= fpos;
955516269df2e86 David Howells 2026-02-27  610  	params->folio_len	= fsize;
955516269df2e86 David Howells 2026-02-27  611  	params->dirty_offset	= foff;
955516269df2e86 David Howells 2026-02-27  612  	params->dirty_len	= flen;
955516269df2e86 David Howells 2026-02-27  613  
a9d47a50cf257ff David Howells 2024-07-18  614  	_debug("folio %zx %zx %zx", foff, flen, fsize);
288ace2f57c9d06 David Howells 2024-03-18  615  
288ace2f57c9d06 David Howells 2024-03-18  616  	/* Deal with discontinuities in the stream of dirty pages.  These can
288ace2f57c9d06 David Howells 2024-03-18  617  	 * arise from a number of sources:
288ace2f57c9d06 David Howells 2024-03-18  618  	 *
288ace2f57c9d06 David Howells 2024-03-18  619  	 * (1) Intervening non-dirty pages from random-access writes, multiple
288ace2f57c9d06 David Howells 2024-03-18  620  	 *     flushers writing back different parts simultaneously and manual
288ace2f57c9d06 David Howells 2024-03-18  621  	 *     syncing.
288ace2f57c9d06 David Howells 2024-03-18  622  	 *
288ace2f57c9d06 David Howells 2024-03-18  623  	 * (2) Partially-written pages from write-streaming.
288ace2f57c9d06 David Howells 2024-03-18  624  	 *
288ace2f57c9d06 David Howells 2024-03-18  625  	 * (3) Pages that belong to a different write-back group (eg.  Ceph
288ace2f57c9d06 David Howells 2024-03-18  626  	 *     snapshots).
288ace2f57c9d06 David Howells 2024-03-18  627  	 *
288ace2f57c9d06 David Howells 2024-03-18  628  	 * (4) Actually-clean pages that were marked for write to the cache
288ace2f57c9d06 David Howells 2024-03-18  629  	 *     when they were read.  Note that these appear as a special
288ace2f57c9d06 David Howells 2024-03-18  630  	 *     write-back group.
288ace2f57c9d06 David Howells 2024-03-18  631  	 */
288ace2f57c9d06 David Howells 2024-03-18  632  	if (fgroup == NETFS_FOLIO_COPY_TO_CACHE) {
955516269df2e86 David Howells 2026-02-27  633  		if (!(params->notes & NOTE_CACHE_AVAIL)) {
955516269df2e86 David Howells 2026-02-27  634  			trace_netfs_folio(folio, netfs_folio_trace_cancel_copy);
955516269df2e86 David Howells 2026-02-27  635  			goto cancel_folio;
955516269df2e86 David Howells 2026-02-27  636  		}
955516269df2e86 David Howells 2026-02-27  637  		params->notes |= NOTE_CACHE_COPY;
955516269df2e86 David Howells 2026-02-27  638  		trace_netfs_folio(folio, netfs_folio_trace_store_copy);
288ace2f57c9d06 David Howells 2024-03-18  639  	} else if (fgroup != wreq->group) {
288ace2f57c9d06 David Howells 2024-03-18  640  		/* We can't write this page to the server yet. */
288ace2f57c9d06 David Howells 2024-03-18  641  		kdebug("wrong group");
955516269df2e86 David Howells 2026-02-27  642  		goto skip_folio;
955516269df2e86 David Howells 2026-02-27  643  	} else if (!(params->notes & (NOTE_UPLOAD_AVAIL | NOTE_CACHE_AVAIL))) {
955516269df2e86 David Howells 2026-02-27  644  		trace_netfs_folio(folio, netfs_folio_trace_cancel_store);
955516269df2e86 David Howells 2026-02-27  645  		goto cancel_folio_discard;
955516269df2e86 David Howells 2026-02-27  646  	} else {
955516269df2e86 David Howells 2026-02-27  647  		if (params->notes & NOTE_UPLOAD_STARTED) {
955516269df2e86 David Howells 2026-02-27  648  			params->notes |= NOTE_UPLOAD;
955516269df2e86 David Howells 2026-02-27  649  			trace_netfs_folio(folio, netfs_folio_trace_store_plus);
955516269df2e86 David Howells 2026-02-27  650  		} else {
955516269df2e86 David Howells 2026-02-27  651  			params->notes |= NOTE_UPLOAD | NOTE_UPLOAD_STARTED;
955516269df2e86 David Howells 2026-02-27  652  			trace_netfs_folio(folio, netfs_folio_trace_store);
955516269df2e86 David Howells 2026-02-27  653  		}
955516269df2e86 David Howells 2026-02-27  654  		if (params->notes & NOTE_CACHE_AVAIL)
955516269df2e86 David Howells 2026-02-27  655  			params->notes |= NOTE_CACHE_COPY;
288ace2f57c9d06 David Howells 2024-03-18  656  	}
288ace2f57c9d06 David Howells 2024-03-18  657  
288ace2f57c9d06 David Howells 2024-03-18  658  	/* Flip the page to the writeback state and unlock.  If we're called
288ace2f57c9d06 David Howells 2024-03-18  659  	 * from write-through, then the page has already been put into the wb
288ace2f57c9d06 David Howells 2024-03-18  660  	 * state.
288ace2f57c9d06 David Howells 2024-03-18  661  	 */
288ace2f57c9d06 David Howells 2024-03-18  662  	if (wreq->origin == NETFS_WRITEBACK)
288ace2f57c9d06 David Howells 2024-03-18  663  		folio_start_writeback(folio);
288ace2f57c9d06 David Howells 2024-03-18  664  	folio_unlock(folio);
288ace2f57c9d06 David Howells 2024-03-18  665  
cd0277ed0c188dd David Howells 2024-05-29  666  	/* Attach the folio to the rolling buffer. */
5556b8319586786 David Howells 2026-02-28  667  	slot = queue->nr_segs;
5556b8319586786 David Howells 2026-02-28  668  	bvec_set_folio(&queue->bv[slot], folio, flen, foff);
5556b8319586786 David Howells 2026-02-28  669  	smp_store_release(&queue->nr_segs, slot + 1);
5556b8319586786 David Howells 2026-02-28  670  	wreq->load_cursor.slot = slot + 1;
5556b8319586786 David Howells 2026-02-28  671  	wreq->load_cursor.offset = 0;
5556b8319586786 David Howells 2026-02-28  672  	trace_netfs_bv_slot(queue, slot);
955516269df2e86 David Howells 2026-02-27  673  	trace_netfs_wback(wreq, folio, params->notes);
cd0277ed0c188dd David Howells 2024-05-29  674  
955516269df2e86 David Howells 2026-02-27  675  out:
955516269df2e86 David Howells 2026-02-27  676  	_leave(" = %x", params->notes);
288ace2f57c9d06 David Howells 2024-03-18  677  	return 0;
1ca4169c391c370 David Howells 2024-10-02  678  
955516269df2e86 David Howells 2026-02-27  679  skip_folio:
955516269df2e86 David Howells 2026-02-27  680  	ret = folio_redirty_for_writepage(wbc, folio);
955516269df2e86 David Howells 2026-02-27  681  	folio_unlock(folio);
955516269df2e86 David Howells 2026-02-27  682  	if (ret < 0)
955516269df2e86 David Howells 2026-02-27  683  		return ret;
955516269df2e86 David Howells 2026-02-27  684  	params->notes |= NOTE_DISCONTIG_BEFORE;
955516269df2e86 David Howells 2026-02-27  685  	goto out;
955516269df2e86 David Howells 2026-02-27  686  cancel_folio_discard:
955516269df2e86 David Howells 2026-02-27  687  	netfs_put_group(fgroup);
955516269df2e86 David Howells 2026-02-27  688  cancel_folio:
955516269df2e86 David Howells 2026-02-27  689  	folio_detach_private(folio);
955516269df2e86 David Howells 2026-02-27  690  	kfree(finfo);
955516269df2e86 David Howells 2026-02-27  691  	folio_unlock(folio);
955516269df2e86 David Howells 2026-02-27  692  	folio_cancel_dirty(folio);
955516269df2e86 David Howells 2026-02-27  693  	params->notes |= NOTE_DISCONTIG_BEFORE;
955516269df2e86 David Howells 2026-02-27  694  	goto out;
1ca4169c391c370 David Howells 2024-10-02  695  }
1ca4169c391c370 David Howells 2024-10-02  696  

:::::: The code at line 555 was first introduced by commit
:::::: 5556b83195867867f5a2fb98cdab0775efd2cddb netfs: Switch to using bvecq rather than folio_queue and rolling_buffer

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
