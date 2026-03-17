Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B280E3A7F78
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760578; cv=none; b=KlvCpje6vO6ndH+ElvEAuAUYWNGfxFaf/nCPGDRXBiZ9hM0FmThqN32y50wbmvZyfnV8chJnKokO2MxAJadt72yZQD4hZzioBs/B7UxBjM3CzO1BUd2gJyt4AnS45TS1z7uOxpmSp44Se76suzEBueXK2wIOcR2CCXPZ0+AmT4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760578; c=relaxed/simple;
	bh=nIJK7ev3lz2PXUHuuDSO5r8CaU5t3E49EctTQZQcfmg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TEuKOa8HZHcRS6JCp+ofzuqd8JDe7beKctvEZrJpQAJAA1l79tCIZJLGpGG6JFI907JBv1WKIOGGs9kZziyI7+xU6iuynKA3vMhWGKFrqBrHQMOgpSKmBmcesSFYWW1AF0EYZuFwf3CZ3B7iLq6MtHg/V2S1r11R1rrAJNNSuHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Io9ZEOpg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Io9ZEOpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773760577; x=1805296577;
  h=date:from:to:cc:subject:message-id;
  bh=nIJK7ev3lz2PXUHuuDSO5r8CaU5t3E49EctTQZQcfmg=;
  b=Io9ZEOpg+TV5SN7p74FwNbe+SAXTrYigSuDfERGxEUMCAvNgHuFaTUBc
   CbUQFeHK+Me923/4ZMCuSTT8xSkof1qP+WWn/CwVQf05+7dJ93IFglFYV
   SGwRk9Qhzy1rRimXuZe5rw9sbrEpIxZWT+15l0O2JfIyvkGCSTeaGmxeX
   CE3cjEeDScU4NzaDr9Fa8oPzEAIUxEsYgMJTbwMoWRN03SKtX6rSTLWcg
   +G/IuocfPnHpFHkLUo3jAC21R5kSleOktG6IgV/b5KonFl1Jrx/5Q8fLP
   +Wdl0HRszi34F4xhlw7EcLCRHTefCOVNlcCj37wBbPpRyQ2Hdql95TewU
   Q==;
X-CSE-ConnectionGUID: 3CHYOprRQeuq7d2S9yjbPQ==
X-CSE-MsgGUID: Un6qC2xyQiu1Jud6t1Mzag==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74683423"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74683423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:16:16 -0700
X-CSE-ConnectionGUID: zO+YLlfhSOGU1NSnMzq8lA==
X-CSE-MsgGUID: +9InnhDkSci1s91zIqFnIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226985457"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 08:16:14 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2W9T-000000000br-3Ko6;
	Tue, 17 Mar 2026 15:16:11 +0000
Date: Tue, 17 Mar 2026 23:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 24/24] fs/ceph/addr.c:312:9: error:
 too many arguments to function 'netfs_mark_read_submission'
Message-ID: <202603172306.3UK8F7RI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   d8339d806de3ae4a4f33f8d94db13cc6ca26e463
commit: d8339d806de3ae4a4f33f8d94db13cc6ca26e463 [24/24] netfs: Combine prepare and issue ops and grab the buffers on request
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603172306.3UK8F7RI-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172306.3UK8F7RI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172306.3UK8F7RI-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/addr.c:273:46: warning: 'struct netfs_read_context' declared inside parameter list will not be visible outside of this definition or declaration
     273 |                                       struct netfs_read_context *rctx)
         |                                              ^~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c: In function 'ceph_netfs_issue_op_inline':
   fs/ceph/addr.c:297:15: error: implicit declaration of function 'netfs_subreq_get_buffer'; did you mean 'netfs_shorten_bvecq_buffer'? [-Werror=implicit-function-declaration]
     297 |         err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
         |               netfs_shorten_bvecq_buffer
>> fs/ceph/addr.c:312:9: error: too many arguments to function 'netfs_mark_read_submission'
     312 |         netfs_mark_read_submission(subreq, rctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ceph/addr.c:15:
   include/linux/netfs.h:456:6: note: declared here
     456 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:327:76: error: 'struct netfs_io_subrequest' has no member named 'io_iter'
     327 |         err = copy_to_iter(iinfo->inline_data + subreq->start, len, &subreq->io_iter);
         |                                                                            ^~
   fs/ceph/addr.c: At top level:
   fs/ceph/addr.c:344:41: warning: 'struct netfs_read_context' declared inside parameter list will not be visible outside of this definition or declaration
     344 |                                  struct netfs_read_context *rctx)
         |                                         ^~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c: In function 'ceph_netfs_issue_read':
   fs/ceph/addr.c:363:58: error: passing argument 2 of 'ceph_netfs_issue_op_inline' from incompatible pointer type [-Werror=incompatible-pointer-types]
     363 |                 err = ceph_netfs_issue_op_inline(subreq, rctx);
         |                                                          ^~~~
         |                                                          |
         |                                                          struct netfs_read_context *
   fs/ceph/addr.c:273:66: note: expected 'struct netfs_read_context *' but argument is of type 'struct netfs_read_context *'
     273 |                                       struct netfs_read_context *rctx)
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   fs/ceph/addr.c:425:23: error: 'struct netfs_io_subrequest' has no member named 'io_iter'
     425 |                 subreq->io_iter.count = len;
         |                       ^~
   fs/ceph/addr.c:427:56: error: 'struct netfs_io_subrequest' has no member named 'io_iter'
     427 |                 err = iov_iter_get_pages_alloc2(&subreq->io_iter, &pages, len, &page_off);
         |                                                        ^~
   fs/ceph/addr.c:443:59: error: 'struct netfs_io_subrequest' has no member named 'io_iter'
     443 |                 osd_req_op_extent_osd_iter(req, 0, &subreq->io_iter);
         |                                                           ^~
   fs/ceph/addr.c:455:9: error: too many arguments to function 'netfs_mark_read_submission'
     455 |         netfs_mark_read_submission(subreq, rctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ceph/addr.c:15:
   include/linux/netfs.h:456:6: note: declared here
     456 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:23,
                    from include/linux/backing-dev.h:12,
                    from fs/ceph/addr.c:4:
   fs/ceph/addr.c: In function 'ceph_init_request':
   fs/ceph/addr.c:472:19: error: 'NETFS_RREQ_USE_PGPRIV2' undeclared (first use in this function); did you mean 'NETFS_RREQ_USE_IO_ITER'?
     472 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   fs/ceph/addr.c:472:9: note: in expansion of macro '__set_bit'
     472 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |         ^~~~~~~~~
   fs/ceph/addr.c:472:19: note: each undeclared identifier is reported only once for each function it appears in
     472 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   fs/ceph/addr.c:472:9: note: in expansion of macro '__set_bit'
     472 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |         ^~~~~~~~~
   fs/ceph/addr.c:517:28: error: 'struct netfs_io_stream' has no member named 'sreq_max_len'
     517 |         rreq->io_streams[0].sreq_max_len = fsc->mount_options->rsize;
         |                            ^
   fs/ceph/addr.c: At top level:
   fs/ceph/addr.c:545:35: error: initialization of 'int (*)(struct netfs_io_subrequest *)' from incompatible pointer type 'int (*)(struct netfs_io_subrequest *, struct netfs_read_context *)' [-Werror=incompatible-pointer-types]
     545 |         .issue_read             = ceph_netfs_issue_read,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:545:35: note: (near initialization for 'ceph_netfs_ops.issue_read')
   cc1: some warnings being treated as errors
--
   In file included from include/linux/kernel.h:23,
                    from fs/nfs/fscache.c:9:
   fs/nfs/fscache.c: In function 'nfs_netfs_init_request':
   fs/nfs/fscache.c:275:19: error: 'NETFS_RREQ_USE_PGPRIV2' undeclared (first use in this function); did you mean 'NETFS_RREQ_USE_IO_ITER'?
     275 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   fs/nfs/fscache.c:275:9: note: in expansion of macro '__set_bit'
     275 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |         ^~~~~~~~~
   fs/nfs/fscache.c:275:19: note: each undeclared identifier is reported only once for each function it appears in
     275 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   fs/nfs/fscache.c:275:9: note: in expansion of macro '__set_bit'
     275 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |         ^~~~~~~~~
   fs/nfs/fscache.c:276:28: error: 'struct netfs_io_stream' has no member named 'sreq_max_len'
     276 |         rreq->io_streams[0].sreq_max_len = NFS_SB(rreq->inode->i_sb)->rsize;
         |                            ^
   fs/nfs/fscache.c: At top level:
   fs/nfs/fscache.c:300:40: warning: 'struct netfs_read_context' declared inside parameter list will not be visible outside of this definition or declaration
     300 |                                 struct netfs_read_context *rctx)
         |                                        ^~~~~~~~~~~~~~~~~~
   fs/nfs/fscache.c: In function 'nfs_netfs_issue_read':
>> fs/nfs/fscache.c:322:9: error: too many arguments to function 'netfs_mark_read_submission'
     322 |         netfs_mark_read_submission(sreq, rctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/nfs_fs.h:35,
                    from fs/nfs/fscache.c:12:
   include/linux/netfs.h:456:6: note: declared here
     456 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/fscache.c: At top level:
   fs/nfs/fscache.c:389:35: error: initialization of 'int (*)(struct netfs_io_subrequest *)' from incompatible pointer type 'int (*)(struct netfs_io_subrequest *, struct netfs_read_context *)' [-Werror=incompatible-pointer-types]
     389 |         .issue_read             = nfs_netfs_issue_read,
         |                                   ^~~~~~~~~~~~~~~~~~~~
   fs/nfs/fscache.c:389:35: note: (near initialization for 'nfs_netfs_ops.issue_read')
   cc1: some warnings being treated as errors


vim +/netfs_mark_read_submission +312 fs/ceph/addr.c

   271	
   272	static int ceph_netfs_issue_op_inline(struct netfs_io_subrequest *subreq,
   273					      struct netfs_read_context *rctx)
   274	{
   275		struct netfs_io_request *rreq = subreq->rreq;
   276		struct inode *inode = rreq->inode;
   277		struct ceph_mds_reply_info_parsed *rinfo;
   278		struct ceph_mds_reply_info_in *iinfo;
   279		struct ceph_mds_request *req;
   280		struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(inode->i_sb);
   281		struct ceph_inode_info *ci = ceph_inode(inode);
   282		ssize_t err;
   283		size_t len;
   284		int mode;
   285	
   286		if (rreq->origin != NETFS_UNBUFFERED_READ &&
   287		    rreq->origin != NETFS_DIO_READ)
   288			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
   289		__clear_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
   290	
   291		if (subreq->start >= inode->i_size) {
   292			__set_bit(NETFS_SREQ_HIT_EOF, &subreq->flags);
   293			err = 0;
   294			goto out;
   295		}
   296	
   297		err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
   298		if (err < 0)
   299			return err;
   300	
   301		/* We need to fetch the inline data. */
   302		mode = ceph_try_to_choose_auth_mds(inode, CEPH_STAT_CAP_INLINE_DATA);
   303		req = ceph_mdsc_create_request(mdsc, CEPH_MDS_OP_GETATTR, mode);
   304		if (IS_ERR(req))
   305			return PTR_ERR(req);
   306	
   307		req->r_ino1 = ci->i_vino;
   308		req->r_args.getattr.mask = cpu_to_le32(CEPH_STAT_CAP_INLINE_DATA);
   309		req->r_num_caps = 2;
   310	
   311		/* After this point, we're not allowed to return an error. */
 > 312		netfs_mark_read_submission(subreq, rctx);
   313	
   314		err = ceph_mdsc_do_request(mdsc, NULL, req);
   315		if (err < 0)
   316			goto out;
   317	
   318		rinfo = &req->r_reply_info;
   319		iinfo = &rinfo->targeti;
   320		if (iinfo->inline_version == CEPH_INLINE_NONE) {
   321			/* The data got uninlined */
   322			ceph_mdsc_put_request(req);
   323			return 1;
   324		}
   325	
   326		len = min_t(size_t, iinfo->inline_len - subreq->start, subreq->len);
   327		err = copy_to_iter(iinfo->inline_data + subreq->start, len, &subreq->io_iter);
   328		if (err == 0) {
   329			err = -EFAULT;
   330		} else {
   331			subreq->transferred += err;
   332			err = 0;
   333		}
   334	
   335		ceph_mdsc_put_request(req);
   336	out:
   337		subreq->error = err;
   338		trace_netfs_sreq(subreq, netfs_sreq_trace_io_progress);
   339		netfs_read_subreq_terminated(subreq);
   340		return -EIOCBQUEUED;
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
