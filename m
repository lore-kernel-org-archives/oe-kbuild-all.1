Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A7E367287
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 23:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898237; cv=none; b=D7wApxj5Y15592YEbgio7HGZ3ND8HX0qO2xMKpTIZRkEVbL8RhtTjS849i88WOM1KQ/hfSWbkyRhnFV38UGjbGuETuWynK/U1OxYbaQzZp+/aNpcm6SmC35mpOLcbpEV0CSPYJUG4gR01+4dDXWGcPZ+3+Slxep1aJSamPJHUx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898237; c=relaxed/simple;
	bh=lDR7EC9RSrYqTICITrhsN6sMllcuZI2QRR4slgbkoVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gQ8dewOOBn/5tCMHJB1Iv4ku+K8ij68Fi4gYCTZ7px+fkyVTblSEUEJY6seBes5q6h99/ZNZqwz5EImx7VWsqmSldOO/jONKydZPq6mb1l6rZxc8if1q/W/seMXaJPSMGVlM5zGlXx0ZTGHCVbd7LMWbwNGhwAaZ9Bs9NkiMS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dej/1FfF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dej/1FfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790898234; x=1822434234;
  h=date:from:to:cc:subject:message-id;
  bh=lDR7EC9RSrYqTICITrhsN6sMllcuZI2QRR4slgbkoVk=;
  b=dej/1FfFdEeEXgevfHsFgImpXqKwCfvYJg82cviwBs8CFBanY+7dtDu8
   ZPfGanjCvTsCcTfNCXBHsq8EDMnTnlghpFkJqSp0/1pZAo/TUlJSGMBP2
   LAQjhn8HixtEB3yGtXasnDiaX53S3oK0oiH4dTGqnFpAxmiZsdn8fR4yJ
   k1BsvSErH82qIjhoK6N+h/Pw+NaY0GWUAKdWSPmCosbBhgDXh4d1sApyG
   pj99P0gvgkqlzMLRQ0wVhIEp4AXDigqk91OASoCu9K8q4avNwoC7pQHP/
   OL9lsRVk0oanGWrykd51n85DdlXu8e5og6z+vZ9nLZwzY2nqlGF3itXMW
   A==;
X-CSE-ConnectionGUID: vsXpIx6WTbWqlf8eTtXu+g==
X-CSE-MsgGUID: g3Zupe6wQp2WQGLxRj2i3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90805988"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90805988"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 16:43:48 -0700
X-CSE-ConnectionGUID: /x1Tc3cRSFWquU6PzBGJ7A==
X-CSE-MsgGUID: RHOquV3US2qq7+A4G0pniw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="141711"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 01 Oct 2026 16:43:47 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCQRE-00000000SV6-0Dxr;
	Thu, 01 Oct 2026 23:43:44 +0000
Date: Fri, 02 Oct 2026 07:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next-5 22/29]
 fs/netfs/write_issue.c:437:9: warning: assignment to 'struct netfs_writeback
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202610020715.JF1RBdvD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-5
head:   5c15345b43019adfd7a82be7f4f190a37dd19310
commit: f7fd91dc74af6deec31273b2157ba5d0334c031d [22/29] netfs: Build a list of regions undergoing writeback
config: parisc-randconfig-1001-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020715.JF1RBdvD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020715.JF1RBdvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020715.JF1RBdvD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/write_issue.c: In function 'netfs_write_folio':
   fs/netfs/write_issue.c:437:11: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
              ^~~~~~~~~~~~~
              mm_alloc
>> fs/netfs/write_issue.c:437:9: warning: assignment to 'struct netfs_writeback *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
            ^
   cc1: some warnings being treated as errors


vim +437 fs/netfs/write_issue.c

   324	
   325	/*
   326	 * Write some of a pending folio data back to the server.
   327	 */
   328	static int netfs_write_folio(struct netfs_io_request *wreq,
   329				     struct writeback_control *wbc,
   330				     struct folio *folio)
   331	{
   332		struct netfs_io_stream *upload = &wreq->io_streams[0];
   333		struct netfs_io_stream *cache  = &wreq->io_streams[1];
   334		struct netfs_io_stream *stream;
   335		struct netfs_writeback *wback;
   336		struct netfs_group *fgroup; /* TODO: Use this with ceph */
   337		struct netfs_folio *finfo;
   338		struct bvecq *queue = wreq->load_cursor.bvecq;
   339		unsigned int slot;
   340		size_t fsize = folio_size(folio), flen = fsize, foff = 0;
   341		uoff_t fpos = folio_pos(folio), i_size;
   342		bool to_eof = false, streamw = false;
   343		bool debug = false;
   344	
   345		_enter("");
   346	
   347		if (!wreq->spare) {
   348			wreq->spare = bvecq_alloc_one(BVECQ_POOL_SLOTS, wreq->gfp, true);
   349			if (!wreq->spare)
   350				return -ENOMEM;
   351		}
   352	
   353		/* netfs_perform_write() may shift i_size around the folio or from out
   354		 * of the folio to beyond it, but cannot move i_size into or through
   355		 * the folio since we have it locked.
   356		 *
   357		 * Truncate could in theory move i_size into or before the folio, but
   358		 * it should take steps to prevent writeback from happening
   359		 * concurrently and should wait for any in-progress writebacks before
   360		 * proceeding.
   361		 */
   362		i_size = i_size_read(wreq->inode);
   363	
   364		if (fpos >= i_size) {
   365			/* mmap beyond eof. */
   366			_debug("beyond eof");
   367			folio_start_writeback(folio);
   368			folio_unlock(folio);
   369			wreq->nr_group_rel += netfs_folio_written_back(folio);
   370			netfs_put_group_many(wreq->group, wreq->nr_group_rel);
   371			wreq->nr_group_rel = 0;
   372			return 0;
   373		}
   374	
   375		if (fpos + fsize > wreq->i_size)
   376			wreq->i_size = i_size;
   377	
   378		fgroup = netfs_folio_group(folio);
   379		finfo = netfs_folio_info(folio);
   380		if (finfo) {
   381			foff = finfo->dirty_offset;
   382			flen = foff + finfo->dirty_len;
   383			streamw = true;
   384		}
   385	
   386		if (flen > i_size - fpos) {
   387			flen = i_size - fpos;
   388			if (!streamw)
   389				folio_zero_segment(folio, flen, fsize);
   390			to_eof = true;
   391		} else if (flen == i_size - fpos) {
   392			to_eof = true;
   393		}
   394		flen -= foff;
   395	
   396		_debug("folio %zx %zx %zx", foff, flen, fsize);
   397	
   398		/* Deal with discontinuities in the stream of dirty pages.  These can
   399		 * arise from a number of sources:
   400		 *
   401		 * (1) Intervening non-dirty pages from random-access writes, multiple
   402		 *     flushers writing back different parts simultaneously and manual
   403		 *     syncing.
   404		 *
   405		 * (2) Partially-written pages from write-streaming.
   406		 *
   407		 * (3) Pages that belong to a different write-back group (eg.  Ceph
   408		 *     snapshots).
   409		 *
   410		 * (4) Actually-clean pages that were marked for write to the cache
   411		 *     when they were read.  Note that these appear as a special
   412		 *     write-back group.
   413		 */
   414		if (fgroup == NETFS_FOLIO_COPY_TO_CACHE) {
   415			netfs_issue_write(wreq, upload);
   416		} else if (fgroup != wreq->group) {
   417			/* We can't write this page to the server yet. */
   418			kdebug("wrong group");
   419			folio_redirty_for_writepage(wbc, folio);
   420			folio_unlock(folio);
   421			netfs_issue_write(wreq, upload);
   422			netfs_issue_write(wreq, cache);
   423			return 0;
   424		}
   425	
   426		if (foff > 0)
   427			netfs_issue_write(wreq, upload);
   428		if (streamw)
   429			netfs_issue_write(wreq, cache);
   430	
   431		folio_start_writeback(folio);
   432		folio_unlock(folio);
   433	
   434		/* Keep track of what we will need to unlock. */
   435		wback = wreq->writebacks_tail;
   436		if (!wback || fpos != wback->start + wback->len || wback->len > LONG_MAX) {
 > 437			wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
   438			wback->next = NULL;
   439			wback->start = fpos;
   440			wback->len = fsize;
   441	
   442			if (wreq->writebacks)
   443				/* Order write of next after last write of len in old tail. */
   444				smp_store_release(&wreq->writebacks_tail->next, wback);
   445			else
   446				wreq->writebacks = wback;
   447			wreq->writebacks_tail = wback;
   448		} else {
   449			/* Order update of len after setting pointer. */
   450			smp_store_release(&wback->len, wback->len + fsize);
   451		}
   452	 
   453		if (fgroup == NETFS_FOLIO_COPY_TO_CACHE) {
   454			if (!cache->avail) {
   455				trace_netfs_folio(folio, netfs_folio_trace_cancel_copy);
   456				netfs_issue_write(wreq, upload);
   457				netfs_folio_written_back(folio);
   458				return 0;
   459			}
   460			trace_netfs_folio(folio, netfs_folio_trace_store_copy);
   461		} else if (!upload->avail && !cache->avail) {
   462			trace_netfs_folio(folio, netfs_folio_trace_cancel_store);
   463			netfs_folio_written_back(folio);
   464			return 0;
   465		} else if (!upload->construct) {
   466			trace_netfs_folio(folio, netfs_folio_trace_store);
   467		} else {
   468			trace_netfs_folio(folio, netfs_folio_trace_store_plus);
   469		}
   470	
   471		/* Institute a new bvec queue segment if the current one is full or if
   472		 * we encounter a discontiguity.  The discontiguity break is important
   473		 * when it comes to bulk unlocking folios by file range.
   474		 */
   475		if (bvecq_is_full(queue) ||
   476		    (fpos != wreq->last_end && wreq->last_end > 0)) {
   477			bvecq_buffer_append(&wreq->load_cursor, wreq->spare);
   478			wreq->spare = NULL;
   479	
   480			queue = wreq->load_cursor.bvecq;
   481			bvecq_pos_move(&wreq->dispatch_cursor, queue);
   482			wreq->dispatch_cursor.slot = 0;
   483		}
   484	
   485		/* Attach the folio to the rolling buffer. */
   486		slot = queue->nr_slots;
   487		bvec_set_folio(&queue->bv[slot], folio, fsize, 0);
   488		trace_netfs_bv_slot(queue, slot);
   489		slot++;
   490		bvecq_filled_to(queue, slot);
   491		wreq->load_cursor.slot = slot;
   492		wreq->load_cursor.offset = 0;
   493		wreq->last_end = fpos + fsize;
   494	
   495		/* Move the submission point forward to allow for write-streaming data
   496		 * not starting at the front of the page.  We don't do write-streaming
   497		 * with the cache as the cache requires DIO alignment.
   498		 *
   499		 * Also skip uploading for data that's been read and just needs copying
   500		 * to the cache.
   501		 */
   502		bvecq_pos_nudge(&wreq->dispatch_cursor);
   503	
   504		for (int s = 0; s < NR_IO_STREAMS; s++) {
   505			size_t soff = foff, slen = flen, alignment = 1;
   506	
   507			stream = &wreq->io_streams[s];
   508			if (stream->source == NETFS_WRITE_TO_CACHE)
   509				alignment = wreq->cache_resources.dio_size;
   510			stream = &wreq->io_streams[s];
   511			stream->submit_off = round_down(soff, alignment);
   512			slen += foff - stream->submit_off;
   513			stream->submit_len = round_up(slen, alignment);
   514	
   515			if (!stream->avail ||
   516			    (stream->source == NETFS_WRITE_TO_CACHE && streamw) ||
   517			    (stream->source == NETFS_UPLOAD_TO_SERVER &&
   518			     fgroup == NETFS_FOLIO_COPY_TO_CACHE)) {
   519				stream->submit_off = UINT_MAX;
   520				stream->submit_len = 0;
   521			}
   522		}
   523	
   524		/* Attach the folio to one or more subrequests.  For a big folio, we
   525		 * could end up with thousands of subrequests if the wsize is small -
   526		 * but we might need to wait during the creation of subrequests for
   527		 * network resources (eg. SMB credits).
   528		 */
   529		for (;;) {
   530			ssize_t part;
   531			size_t lowest_off = ULONG_MAX;
   532			int choose_s = -1;
   533	
   534			/* Always add to the lowest-submitted stream first. */
   535			for (int s = 0; s < NR_IO_STREAMS; s++) {
   536				stream = &wreq->io_streams[s];
   537				if (stream->submit_len > 0 &&
   538				    stream->submit_off < lowest_off) {
   539					lowest_off = stream->submit_off;
   540					choose_s = s;
   541				}
   542			}
   543	
   544			if (choose_s < 0)
   545				break;
   546			stream = &wreq->io_streams[choose_s];
   547	
   548			/* Advance the cursor. */
   549			wreq->dispatch_cursor.offset = stream->submit_off;
   550	
   551			atomic64_set(&wreq->issued_to, fpos + stream->submit_off);
   552			part = netfs_advance_write(wreq, stream, fpos + stream->submit_off,
   553						   stream->submit_len, to_eof);
   554			stream->submit_off += part;
   555			if (part > stream->submit_len)
   556				stream->submit_len = 0;
   557			else
   558				stream->submit_len -= part;
   559			if (part > 0)
   560				debug = true;
   561		}
   562	
   563		bvecq_pos_step(&wreq->dispatch_cursor);
   564		/* Order loading the queue before updating the issue_to point */
   565		atomic64_set_release(&wreq->issued_to, fpos + fsize);
   566	
   567		if (!debug)
   568			kdebug("R=%x: No submit", wreq->debug_id);
   569	
   570		if (foff + flen < fsize)
   571			for (int s = 0; s < NR_IO_STREAMS; s++)
   572				netfs_issue_write(wreq, &wreq->io_streams[s]);
   573	
   574		_leave(" = 0");
   575		return 0;
   576	}
   577	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
