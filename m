Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D9333BBC6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 06:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730019; cv=none; b=PDCZ8IOQs778hWJZj0jka97D3qD+A1TjLJE55X8aEf3yj64o3R6/JUJLRGF+RocWFnE8cX6QHVGUL00FI8RMvT+4aYiBOg4/fxVm9fwOCdqaZJIdMMFHmVMCCvjzc0cqito0HMfRv2BFtvHpWNm2E2SZfWgZWo2nkeTmwViESMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730019; c=relaxed/simple;
	bh=WqgNmeqGPK2aWEbXzChqND9cm0Bh8rFq1vJGfCv/qDc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=blJIi5/Xp3PEzypV0uzvtjrvNSyJ14+HF3HLy285EoDOVrz0LipSvCz0X6+3OtQ+2whVG2Xtl6ZPbRN1374wFvCCgsDJ2OfPSINjen0JruXY5VNWc5e4BhvaqI8J+zuW+48i0Kbi0xBavhec2SCy9nnbb1Rh8m8TseeXEx88Kk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fIOJZmiY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fIOJZmiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773730016; x=1805266016;
  h=date:from:to:cc:subject:message-id;
  bh=WqgNmeqGPK2aWEbXzChqND9cm0Bh8rFq1vJGfCv/qDc=;
  b=fIOJZmiYkBpXvSrVPq15aNbn52JAxKdIfkBXYunlymDdoVGkayHYUbyc
   PHjmoKpWYzwDvITbx4b6GBCax1YX6RrxDM8L/g3KKT7N/q7DktD/P83X9
   1S6PNEhR8zi/UHjx4m72Q5Ywmg+NZ7lyLeSJrzgGY3ocb4SPOS1A4S7Fa
   w2fu6n/9XXEROTmeb1SontqW7wazJZsca9E7nM39LnDTpiBPC/NCsq5nU
   v2wTqcYRG94+YHhe5PVJVjQlJ2B+8cRN/n2kdX9gEtsuzy1eWx/UsHHx2
   CfbO6y3O74zAc/tr+pfKkLf+m9+O1ziuI7vMUyfWw4XiNVZqrWZBVMqd+
   A==;
X-CSE-ConnectionGUID: yzwUQXzaQw63YcO7elpR6A==
X-CSE-MsgGUID: 9OEszMfASbuy77vU0c3nYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78356476"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78356476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 23:46:56 -0700
X-CSE-ConnectionGUID: kIi1l6nNQQeyjepQ9TF+sw==
X-CSE-MsgGUID: culWEg1mRSOa4hpTODzkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222226115"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Mar 2026 23:46:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2OCZ-000000004O1-3Y6Z;
	Tue, 17 Mar 2026 06:46:51 +0000
Date: Tue, 17 Mar 2026 07:46:26 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 24/24] fs/ceph/addr.c:312:9: error:
 too many arguments to function 'netfs_mark_read_submission'
Message-ID: <202603170712.QjX3GYLj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   d8339d806de3ae4a4f33f8d94db13cc6ca26e463
commit: d8339d806de3ae4a4f33f8d94db13cc6ca26e463 [24/24] netfs: Combine prepare and issue ops and grab the buffers on request
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260317/202603170712.QjX3GYLj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603170712.QjX3GYLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603170712.QjX3GYLj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/ceph/addr.c:273:46: warning: 'struct netfs_read_context' declared inside parameter list will not be visible outside of this definition or declaration
     273 |                                       struct netfs_read_context *rctx)
         |                                              ^~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c: In function 'ceph_netfs_issue_op_inline':
   fs/ceph/addr.c:297:15: error: implicit declaration of function 'netfs_subreq_get_buffer'; did you mean 'netfs_shorten_bvecq_buffer'? [-Wimplicit-function-declaration]
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
>> fs/ceph/addr.c:363:58: error: passing argument 2 of 'ceph_netfs_issue_op_inline' from incompatible pointer type [-Wincompatible-pointer-types]
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
>> fs/ceph/addr.c:545:35: error: initialization of 'int (*)(struct netfs_io_subrequest *)' from incompatible pointer type 'int (*)(struct netfs_io_subrequest *, struct netfs_read_context *)' [-Wincompatible-pointer-types]
     545 |         .issue_read             = ceph_netfs_issue_read,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:545:35: note: (near initialization for 'ceph_netfs_ops.issue_read')
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
>> fs/nfs/fscache.c:300:40: warning: 'struct netfs_read_context' declared inside parameter list will not be visible outside of this definition or declaration
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
>> fs/nfs/fscache.c:389:35: error: initialization of 'int (*)(struct netfs_io_subrequest *)' from incompatible pointer type 'int (*)(struct netfs_io_subrequest *, struct netfs_read_context *)' [-Wincompatible-pointer-types]
     389 |         .issue_read             = nfs_netfs_issue_read,
         |                                   ^~~~~~~~~~~~~~~~~~~~
   fs/nfs/fscache.c:389:35: note: (near initialization for 'nfs_netfs_ops.issue_read')


vim +/netfs_mark_read_submission +312 fs/ceph/addr.c

   271	
   272	static int ceph_netfs_issue_op_inline(struct netfs_io_subrequest *subreq,
 > 273					      struct netfs_read_context *rctx)
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
   343	static int ceph_netfs_issue_read(struct netfs_io_subrequest *subreq,
   344					 struct netfs_read_context *rctx)
   345	{
   346		struct netfs_io_request *rreq = subreq->rreq;
   347		struct inode *inode = rreq->inode;
   348		struct ceph_inode_info *ci = ceph_inode(inode);
   349		struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
   350		struct ceph_client *cl = fsc->client;
   351		struct ceph_osd_request *req = NULL;
   352		struct ceph_vino vino = ceph_vino(inode);
   353		u64 objno, objoff, len, off = subreq->start;
   354		u32 maxlen;
   355		int err;
   356		bool sparse = IS_ENCRYPTED(inode) || ceph_test_mount_opt(fsc, SPARSEREAD);
   357		int extent_cnt;
   358	
   359		if (ceph_inode_is_shutdown(inode))
   360			return -EIO;
   361	
   362		if (ceph_has_inline_data(ci)) {
 > 363			err = ceph_netfs_issue_op_inline(subreq, rctx);
   364			if (err != 1)
   365				return err;
   366		}
   367	
   368		/* Truncate the extent at the end of the current block */
   369		ceph_calc_file_object_mapping(&ci->i_layout, subreq->start, subreq->len,
   370					      &objno, &objoff, &maxlen);
   371		maxlen = umin(maxlen, fsc->mount_options->rsize);
   372		len = umin(subreq->len, maxlen);
   373		subreq->len = len;
   374	
   375		// TODO: This rounding here is slightly dodgy.  It *should* work, for
   376		// now, as the cache only deals in blocks that are a multiple of
   377		// PAGE_SIZE and fscrypt blocks are at most PAGE_SIZE.  What needs to
   378		// happen is for the fscrypt driving to be moved into netfslib and the
   379		// data in the cache also to be stored encrypted.
   380		ceph_fscrypt_adjust_off_and_len(inode, &off, &len);
   381	
   382		req = ceph_osdc_new_request(&fsc->client->osdc, &ci->i_layout, vino,
   383				off, &len, 0, 1, sparse ? CEPH_OSD_OP_SPARSE_READ : CEPH_OSD_OP_READ,
   384				CEPH_OSD_FLAG_READ, NULL, ci->i_truncate_seq,
   385				ci->i_truncate_size, false);
   386		if (IS_ERR(req))
   387			return PTR_ERR(req);
   388	
   389		if (sparse) {
   390			extent_cnt = __ceph_sparse_read_ext_count(inode, len);
   391			err = ceph_alloc_sparse_ext_map(&req->r_ops[0], extent_cnt);
   392			if (err) {
   393				ceph_osdc_put_request(req);
   394				return err;
   395			}
   396		}
   397	
   398		doutc(cl, "%llx.%llx pos=%llu orig_len=%zu len=%llu\n",
   399		      ceph_vinop(inode), subreq->start, subreq->len, len);
   400	
   401		err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
   402		if (err < 0) {
   403			ceph_osdc_put_request(req);
   404			return err;
   405		}
   406	
   407		/*
   408		 * FIXME: For now, use CEPH_OSD_DATA_TYPE_PAGES instead of _ITER for
   409		 * encrypted inodes. We'd need infrastructure that handles an iov_iter
   410		 * instead of page arrays, and we don't have that as of yet. Once the
   411		 * dust settles on the write helpers and encrypt/decrypt routines for
   412		 * netfs, we should be able to rework this.
   413		 */
   414		if (IS_ENCRYPTED(inode)) {
   415			struct page **pages;
   416			size_t page_off;
   417	
   418			/*
   419			 * FIXME: io_iter.count needs to be corrected to aligned
   420			 * length. Otherwise, iov_iter_get_pages_alloc2() operates
   421			 * with the initial unaligned length value. As a result,
   422			 * ceph_msg_data_cursor_init() triggers BUG_ON() in the case
   423			 * if msg->sparse_read_total > msg->data_length.
   424			 */
   425			subreq->io_iter.count = len;
   426	
   427			err = iov_iter_get_pages_alloc2(&subreq->io_iter, &pages, len, &page_off);
   428			if (err < 0) {
   429				doutc(cl, "%llx.%llx failed to allocate pages, %d\n",
   430				      ceph_vinop(inode), err);
   431				ceph_osdc_put_request(req);
   432				return -EIO;
   433			}
   434	
   435			/* should always give us a page-aligned read */
   436			WARN_ON_ONCE(page_off);
   437			len = err;
   438			err = 0;
   439	
   440			osd_req_op_extent_osd_data_pages(req, 0, pages, len, 0, false,
   441							 false);
   442		} else {
   443			osd_req_op_extent_osd_iter(req, 0, &subreq->io_iter);
   444		}
   445		if (!ceph_inc_osd_stopping_blocker(fsc->mdsc)) {
   446			ceph_osdc_put_request(req);
   447			return -EIO;
   448		}
   449		req->r_callback = finish_netfs_read;
   450		req->r_priv = subreq;
   451		req->r_inode = inode;
   452		ihold(inode);
   453	
   454		/* After this point, we're not allowed to return an error. */
   455		netfs_mark_read_submission(subreq, rctx);
   456		ceph_osdc_start_request(req->r_osdc, req);
   457		ceph_osdc_put_request(req);
   458		doutc(cl, "%llx.%llx result -EIOCBQUEUED\n", ceph_vinop(inode));
   459		return -EIOCBQUEUED;
   460	}
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
