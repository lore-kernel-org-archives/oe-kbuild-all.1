Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E1C34676D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911391; cv=none; b=W/KY1I5W7En5KZJEeGQPQhXDtpqt4lgz4CG1Kg0wnq/w3J5FtZB2rPvKGh0gxvC/7FRODliNyho7eMs9qTKzG7Uv/tcOGHQBK10z89x/CiGYv3gQinJSRK2Vm+PKZAOIkett023Ou9EDDN/58/vPC8fjx8o8ob1c/NAkX7PjMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911391; c=relaxed/simple;
	bh=CaBRByJyeB/hVr06+/CEKhgjTy1iahZTAyeWo9dn8hE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fFQ1rA5Io+2prn6698f7uwQ96bb36l+G8XL+6UO+5RyTGtjwAGC/6kk7nWh+hn+Rmz4LdGCrNFfVbwryQBIgy+tDpH8C9pgJaRTTYCxrodm0ReDD6KkJr6uvjWx+F4nNEESq2PEacUAsnvuTvheDlltWaBodbjJs1J/vQg2+2pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQt2kTQr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQt2kTQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784911389; x=1816447389;
  h=date:from:to:cc:subject:message-id;
  bh=CaBRByJyeB/hVr06+/CEKhgjTy1iahZTAyeWo9dn8hE=;
  b=JQt2kTQr/5uyy5mOM9Qvz1mvBc9taP8+/9Qv56NN5M55nH2j4XesEtbG
   TJJncpMfG2ws3OsNuMoa7WE6MXaboXp7M+Y6clcVHFesEIHLzsbfubSvm
   99N6TyCmOQRuXjVMrFcuHmG9RbiQdDDm8U8/Dicvd4GCGrYtXDe2BH+73
   MUm2H9Jhacv+ck5t8Iy+q4qQ6zKQwISHFSKPs86A0ddTRJZK+J4ZlwrVD
   lHdx7e9vkRnMaseruYvgLd/g6F3JUQ2M8uYYaq4OlQDEi6bagn5vFPaaE
   aC+Sl4KkJcEe609m92+5vTDfzX/ag/MDk51pnK5MUujBlnO3BDT5gJ8qJ
   A==;
X-CSE-ConnectionGUID: 67XPLrOJTSuhqETnzrUXJg==
X-CSE-MsgGUID: Wb4JKJz+TZ6jzTnpdqrfMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="108371787"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="108371787"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 09:43:09 -0700
X-CSE-ConnectionGUID: 1o7QZjIvTwqEWxF2OUZ8Hg==
X-CSE-MsgGUID: BNpi6d2aTXGuoCfmMuxkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="282061492"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jul 2026 09:43:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnIzI-00000000b03-2PcR;
	Fri, 24 Jul 2026 16:43:04 +0000
Date: Sat, 25 Jul 2026 00:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 29/29] fs/netfs/write_issue.c:785:1:
 error: label at end of compound statement
Message-ID: <202607250039.FCYLgIol-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   ddfc7002233eb9ca7143c363820b7480d5f705de
commit: ddfc7002233eb9ca7143c363820b7480d5f705de [29/29] netfs: Combine prepare and issue ops and grab the buffers on request
config: parisc-randconfig-r073-20260724 (https://download.01.org/0day-ci/archive/20260725/202607250039.FCYLgIol-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607250039.FCYLgIol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607250039.FCYLgIol-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/write_issue.c: In function 'netfs_writepages':
>> fs/netfs/write_issue.c:785:1: error: label at end of compound statement
     785 | end_loop:
         | ^~~~~~~~


vim +785 fs/netfs/write_issue.c

   717	
   718	/*
   719	 * Write some of the pending data back to the server
   720	 */
   721	int netfs_writepages(struct address_space *mapping,
   722			     struct writeback_control *wbc)
   723	{
   724		struct netfs_inode *ictx = netfs_inode(mapping->host);
   725		struct netfs_io_request *wreq = NULL;
   726		struct netfs_wb_params params = {};
   727		struct folio *folio;
   728		int error = 0;
   729	
   730		if (!netfs_wb_begin(ictx, wbc->sync_mode == WB_SYNC_NONE))
   731			return 0;
   732	
   733		/* Need the first folio to be able to set up the op. */
   734		folio = writeback_iter(mapping, wbc, NULL, &error);
   735		if (!folio)
   736			goto out;
   737	
   738		wreq = netfs_create_write_req(mapping, NULL, folio_pos(folio), NETFS_WRITEBACK);
   739		if (IS_ERR(wreq)) {
   740			error = PTR_ERR(wreq);
   741			goto couldnt_start;
   742		}
   743	
   744		if (bvecq_buffer_init(&wreq->load_cursor, GFP_NOFS) < 0)
   745			goto nomem;
   746		bvecq_pos_set(&params.dispatch_cursor, &wreq->load_cursor);
   747		bvecq_pos_set(&wreq->collect_cursor, &wreq->load_cursor);
   748	
   749		__set_bit(NETFS_RREQ_OFFLOAD_COLLECTION, &wreq->flags);
   750		trace_netfs_write(wreq, netfs_write_trace_writeback);
   751		netfs_stat(&netfs_n_wh_writepages);
   752	
   753		if (wreq->io_streams[1].avail)
   754			params.notes |= NOTE_CACHE_AVAIL;
   755	
   756		do {
   757			_debug("wbiter %lx", folio->index);
   758	
   759			if (!wreq->spare) {
   760				wreq->spare = bvecq_alloc_one(BVECQ_STD_SLOTS, GFP_NOFS);
   761				if (!wreq->spare) {
   762					folio_redirty_for_writepage(wbc, folio);
   763					folio_unlock(folio);
   764					error = -ENOMEM;
   765					goto end_loop;
   766				}
   767			}
   768	
   769			if (netfs_folio_group(folio) != NETFS_FOLIO_COPY_TO_CACHE &&
   770			    unlikely(!test_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))) {
   771				set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
   772				wreq->netfs_ops->begin_writeback(wreq);
   773				if (wreq->io_streams[0].avail) {
   774					params.notes |= NOTE_UPLOAD_AVAIL;
   775					/* Order setting the active flag after other fields. */
   776					smp_store_release(&wreq->io_streams[0].active, true);
   777				}
   778			}
   779	
   780			params.notes &= NOTES__KEEP_MASK;
   781			netfs_queue_wb_folio(wreq, wbc, folio, &params);
   782			error = netfs_issue_streams(wreq, &params);
   783			if (!error)
   784				bvecq_pos_step(&params.dispatch_cursor);
 > 785	end_loop:
   786		} while ((folio = writeback_iter(mapping, wbc, folio, &error)));
   787	
   788		netfs_end_issue_write(wreq, &params);
   789	
   790		bvecq_pos_unset(&wreq->load_cursor);
   791		bvecq_pos_unset(&params.dispatch_cursor);
   792		for (int i = 0; i < NR_IO_STREAMS; i++)
   793			bvecq_pos_unset(&wreq->io_streams[i].dispatch_cursor);
   794		netfs_wake_collector(wreq);
   795	
   796		netfs_put_request(wreq, netfs_rreq_trace_put_return);
   797		_leave(" = %d", error);
   798		return error;
   799	
   800	nomem:
   801		error = -ENOMEM;
   802		netfs_put_failed_request(wreq);
   803	couldnt_start:
   804		if (error == -ENOMEM) {
   805			folio_redirty_for_writepage(wbc, folio);
   806			folio_unlock(folio);
   807			folio = writeback_iter(mapping, wbc, folio, &error);
   808			WARN_ON_ONCE(folio != NULL);
   809		} else {
   810			netfs_kill_dirty_pages(mapping, wbc, folio);
   811		}
   812	out:
   813		netfs_wb_end(ictx);
   814		_leave(" = %d", error);
   815		return error;
   816	}
   817	EXPORT_SYMBOL(netfs_writepages);
   818	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
