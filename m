Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3B44418E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 14:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755241; cv=none; b=RGQNivczYsctj807TzlHZa70ys3flLyfvHrsLyDbogCS79ks/T5fliHJV9B23x4h5BL2e+UwL40cDuR7HPofjzDdAaVBPVfeUO+CVF4+XZj4OztM0qq0sDmba9zjCPGoAgryjjbvMHFWIm+45Fx3+zROBS9nijH/CaCuUiNPrxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755241; c=relaxed/simple;
	bh=NGDVEPQ/MELktKcsCl+9IeaVaS4Fxe/UwpPPK7/T/L4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uFRz4cimETNt5D+A/9gMXQeEuCjdfl3F+NQuWrQDM3FiR/WVkOXA6Q/leZiobTY/TXIf/3hcruoeUEprJ1UzSpIvH/pA/e0AlqqWTL9bSSMDE9ojvso3RHu3wzIoIaCaccK6yujuRfvgyR1VjF20cP5nVLJlxCSuhwpfgRjt02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsD98AcI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsD98AcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787755240; x=1819291240;
  h=date:from:to:cc:subject:message-id;
  bh=NGDVEPQ/MELktKcsCl+9IeaVaS4Fxe/UwpPPK7/T/L4=;
  b=KsD98AcIWLWtP6j/O9VNiWciqqrS8M7XdvdCImWk/rAFeDE0sZftbVvx
   aKKn9ENWwSlW8bF8g2GAlX3I9AH8Ru1oLB5vPJcDff0gvTd2yjbHMsZAV
   jrYZ9QiQz8ELuU9i3LgKFI5WB1zSAQl4cVjqoLqBff75aBdbN1nJE2yqA
   VcGiU7GDXj333qTusUeBa2wo27cO3n77XvoDT6pYPsCK30wCAfPQxdhNL
   6QmcHdE/AVohWiXRDdrqwFxnTSlhsRiRDBZ2u5w3/mFCH//7WPgii4xih
   zKa4GBP4xFFpN7w8ggbHXEggTqvK4LhIhOFQBIZHiE5iN8cHlwOC8Suld
   w==;
X-CSE-ConnectionGUID: d8dux1iIQZ+yTqBnbv/F+Q==
X-CSE-MsgGUID: AhqDQniLTUK70l5D6qV6rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88255408"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88255408"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:40:39 -0700
X-CSE-ConnectionGUID: hahJcc1wRbqHRe680Ur7Cw==
X-CSE-MsgGUID: ox4jBHjkTOCsTQOh53dx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="264323483"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Aug 2026 07:40:37 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzEnr-000000007aT-1Ph7;
	Wed, 26 Aug 2026 14:40:35 +0000
Date: Wed, 26 Aug 2026 22:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 33/36] fs/netfs/write_issue.c:795:9:
 warning: assignment to 'struct netfs_writeback *' from 'int' makes pointer
 from integer without a cast
Message-ID: <202608262207.4OM63DfD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8f0e78ba82ccca8613b01c5f0215f8ce7c7c5cf3
commit: e09967cf018fd9ee7f1324d6ccea2d0a5f6b0f46 [33/36] netfs: Rework writeback to use a separate list of regions to be unlocked
config: riscv-randconfig-001-20260826 (https://download.01.org/0day-ci/archive/20260826/202608262207.4OM63DfD-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608262207.4OM63DfD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262207.4OM63DfD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/write_issue.c: In function 'netfs_writeback_folio':
   fs/netfs/write_issue.c:795:11: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
     795 |   wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
         |           ^~~~~~~~~~~~~
         |           mm_alloc
>> fs/netfs/write_issue.c:795:9: warning: assignment to 'struct netfs_writeback *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     795 |   wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
         |         ^
   cc1: some warnings being treated as errors


vim +795 fs/netfs/write_issue.c

   681	
   682	/*
   683	 * Queue a folio for writeback.
   684	 */
   685	static void netfs_writeback_folio(struct netfs_io_request *wreq,
   686					  struct writeback_control *wbc,
   687					  struct folio *folio,
   688					  struct netfs_wb_params *params)
   689	{
   690		struct netfs_writeback *wback;
   691		struct netfs_group *fgroup; /* TODO: Use this with ceph */
   692		struct netfs_folio *finfo;
   693		size_t fsize = folio_size(folio), fend = fsize, foff = 0;
   694		uoff_t fpos = folio_pos(folio), i_size;
   695	
   696		_enter("%x", params->notes);
   697	
   698		/* netfs_perform_write() may shift i_size around the folio or from out
   699		 * of the folio to beyond it, but cannot move i_size into or through
   700		 * the folio since we have it locked.
   701		 *
   702		 * Truncate could in theory move i_size into or before the folio, but
   703		 * it should take steps to prevent writeback from happening
   704		 * concurrently and should wait for any in-progress writebacks before
   705		 * proceeding.
   706		 */
   707		i_size = i_size_read(wreq->inode);
   708	
   709		params->fpos = fpos;
   710		if (fpos >= i_size) {
   711			/* mmap beyond eof. */
   712			_debug("beyond eof");
   713			folio_start_writeback(folio);
   714			folio_unlock(folio);
   715			netfs_folio_written_back(folio, wreq);
   716			netfs_put_group_many(wreq->group, wreq->nr_group_rel);
   717			wreq->nr_group_rel = 0;
   718			return;
   719		}
   720	
   721		if (fpos + fsize > wreq->i_size)
   722			wreq->i_size = i_size;
   723	
   724		fgroup = netfs_folio_group(folio);
   725		finfo = netfs_folio_info(folio);
   726		if (finfo) {
   727			foff = finfo->dirty_offset;
   728			fend = foff + finfo->dirty_len;
   729			params->notes |= NOTE_STREAMW;
   730		}
   731	
   732		if (fend > i_size - fpos) {
   733			fend = i_size - fpos;
   734			if (!(params->notes & NOTE_STREAMW))
   735				folio_zero_segment(folio, fend, fsize);
   736		}
   737	
   738		/* Account for cache and crypto alignments. */
   739		params->inner_off = round_down(foff, params->inner_align);
   740		params->inner_end = round_up  (fend, params->inner_align);
   741		params->outer_off = round_down(foff, params->outer_align);
   742		params->outer_end = round_up  (fend, params->outer_align);
   743	
   744		_debug("folio %zx %zx %zx", foff, fend - foff, fsize);
   745	
   746		/* Deal with discontinuities in the stream of dirty pages.  These can
   747		 * arise from a number of sources:
   748		 *
   749		 * (1) Intervening non-dirty pages from random-access writes, multiple
   750		 *     flushers writing back different parts simultaneously and manual
   751		 *     syncing.
   752		 *
   753		 * (2) Partially-written pages from write-streaming.
   754		 *
   755		 * (3) Pages that belong to a different write-back group (eg.  Ceph
   756		 *     snapshots).
   757		 *
   758		 * (4) Actually-clean pages that were marked for write to the cache
   759		 *     when they were read.  Note that these appear as a special
   760		 *     write-back group.
   761		 */
   762		if (fgroup == NETFS_FOLIO_COPY_TO_CACHE) {
   763			if (!(params->notes & NOTE_CACHE_AVAIL)) {
   764				trace_netfs_folio(folio, netfs_folio_trace_cancel_copy);
   765				goto cancel_folio;
   766			}
   767			params->notes |= NOTE_CACHE_COPY;
   768			trace_netfs_folio(folio, netfs_folio_trace_store_copy);
   769		} else if (fgroup != wreq->group) {
   770			/* We can't write this page to the server yet. */
   771			kdebug("wrong group");
   772			goto skip_folio;
   773		} else if (!(params->notes & (NOTE_UPLOAD_AVAIL | NOTE_CACHE_AVAIL))) {
   774			trace_netfs_folio(folio, netfs_folio_trace_cancel_store);
   775			goto cancel_folio_discard;
   776		} else {
   777			if (params->notes & NOTE_UPLOAD_STARTED) {
   778				params->notes |= NOTE_UPLOAD;
   779				trace_netfs_folio(folio, netfs_folio_trace_store_plus);
   780			} else {
   781				params->notes |= NOTE_UPLOAD | NOTE_UPLOAD_STARTED;
   782				trace_netfs_folio(folio, netfs_folio_trace_store);
   783			}
   784			if ((params->notes & NOTE_CACHE_AVAIL) &&
   785			    !(params->notes & NOTE_STREAMW))
   786				params->notes |= NOTE_CACHE_COPY;
   787		}
   788	
   789		folio_start_writeback(folio);
   790		folio_unlock(folio);
   791	
   792		/* Keep track of what we will need to unlock. */
   793		wback = wreq->writebacks_tail;
   794		if (!wback || fpos != wback->start + wback->len || wback->len > LONG_MAX) {
 > 795			wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
   796			wback->next = NULL;
   797			wback->start = fpos;
   798			wback->len = fsize;
   799	
   800			if (wreq->writebacks)
   801				/* Order write of next after last write of len in old tail. */
   802				smp_store_release(&wreq->writebacks_tail->next, wback);
   803			else
   804				wreq->writebacks = wback;
   805			wreq->writebacks_tail = wback;
   806		} else {
   807			/* Order update of len after setting pointer. */
   808			smp_store_release(&wback->len, wback->len + fsize);
   809		}
   810	
   811		/* Flush any streams not being used for this folio. */
   812		for (int s = 0; s < NR_IO_STREAMS; s++) {
   813			struct netfs_io_stream *stream = &wreq->io_streams[s];
   814	
   815			if (!stream->active || !(params->notes & stream->applicable)) {
   816				if (stream->buffering) {
   817					params->notes |= NOTE_FLUSH_ANYWAY;
   818					netfs_writeback_flush(wreq, stream, params);
   819				}
   820				atomic64_set_release(&stream->issued_to, fpos + params->outer_end);
   821			}
   822		}
   823	
   824		/* Initiate or extend the dispatch of each selected stream.  At this
   825		 * point we may need to copy the data to a bounce buffer and push the
   826		 * bounce bits instead.
   827		 */
   828		// TODO: Do bouncing if selected.
   829		netfs_writeback_add_folio_to_stream(wreq, params, folio);
   830	
   831	out:
   832		_leave(" = %x", params->notes);
   833		return;
   834	
   835	skip_folio:
   836		folio_redirty_for_writepage(wbc, folio);
   837		folio_unlock(folio);
   838		goto out;
   839	cancel_folio_discard:
   840		netfs_put_group(fgroup);
   841	cancel_folio:
   842		folio_detach_private(folio);
   843		kfree(finfo);
   844		folio_unlock(folio);
   845		folio_cancel_dirty(folio);
   846		goto out;
   847	}
   848	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
