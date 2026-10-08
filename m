Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C83D5253
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 20:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490706; cv=none; b=ZdLJcazNyTtQ1w0lYjM5sFFBJvsuX4HqIYqlXSw+Kr2ZVRRdg85fUvHmwAUZsbBWsTF9hAgtjN9XBQXqxv7ZW7ErA7IDuB+H1elzI7c0KK/K0vMQtceYdmbXIV8/f02fECBr0nmglFF9nHQlMRWj4jIfdocX3E0IYPEC1nHkWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490706; c=relaxed/simple;
	bh=gvlMF5eYFyGdVc+c3EM5TbU9sjO9oGj6vjlK39Dv66c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cxw6X+lGp+dLG5HhxIXKYVsWoiOiJd38eJiImpLC/JwgFqlqsYaA+mtdicQs3Og/irL7TAuPhgg0KvnxTJj6TnCdUadsh/l6pnXZtJj89DaX9ad2t9JG9GSo+vVnsQUS9htczWS3ibE/WPvqpbJ0jDSXc9eDMDuxlkOhbNkXVSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrN3SroV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrN3SroV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791490705; x=1823026705;
  h=date:from:to:cc:subject:message-id;
  bh=gvlMF5eYFyGdVc+c3EM5TbU9sjO9oGj6vjlK39Dv66c=;
  b=QrN3SroVNur6eWcUuBi2x40zDxS0zPhwbGwxdIt0TjUHj+ZsBYy8crXb
   15ZGkXs/tPTTMT2i9RHt6JG/yNzZFGS3SHsK0jzZP7UaYk9YLRQysWCeX
   44qpjkbs/ZxHBH7V7eOgxZVIjVdrG1d/OwYMi88JGL1lIkn26JTfXk10x
   giZLHiDkv46hTszJI3FRIsmNshX2B9hpB7kUtIjmSKT63YzH2aFa9coR+
   UAQcD5DfVdlaIK/oYY9xnxsWzCDSgmwwrzpqtZMpL2y6GYVUbMpMv+syX
   zxXLw3VySaXp3zFVfGPiJ+Djg85bhSQCR1fo5EkMdkf+V8nYxZX5WYDOj
   A==;
X-CSE-ConnectionGUID: qHyYHotcQ2iLlO9pD1AJUg==
X-CSE-MsgGUID: jx/EPOURSIKdsDB4wWdKAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="312022"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="312022"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 13:18:20 -0700
X-CSE-ConnectionGUID: InC/tiHEQJuu8Or3YbdFQg==
X-CSE-MsgGUID: Q1euBb5LSyilur5/HFauYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="131591"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 Oct 2026 13:18:18 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEuZD-00000000617-2sPX;
	Thu, 08 Oct 2026 20:18:15 +0000
Date: Thu, 08 Oct 2026 22:18:03 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 29/32]
 fs/netfs/direct_read.c:296:66: sparse: sparse: incorrect type in argument 2
 (different base types)
Message-ID: <202610082238.CvrOKzdK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   870d31c7b4cbee9e73019466181a2e0c2c1094f8
commit: 01b1f1b8e98ffec822bca1243a80bcaf059bb5a3 [29/32] netfs: Support decryption on unbuffered/DIO read
config: s390-randconfig-r2305-20261008 (https://download.01.org/0day-ci/archive/20261008/202610082238.CvrOKzdK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610082238.CvrOKzdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610082238.CvrOKzdK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/netfs/direct_read.c:296:66: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int debug_id @@
   fs/netfs/direct_read.c:296:66: sparse:     expected restricted gfp_t [usertype] gfp
   fs/netfs/direct_read.c:296:66: sparse:     got unsigned int debug_id

vim +296 fs/netfs/direct_read.c

   213	
   214	/**
   215	 * netfs_unbuffered_read_iter_locked - Perform an unbuffered or direct I/O read
   216	 * @iocb: The I/O control descriptor describing the read
   217	 * @iter: The output buffer (also specifies read length)
   218	 *
   219	 * Perform an unbuffered I/O or direct I/O from the file in @iocb to the
   220	 * output buffer.  No use is made of the pagecache.
   221	 *
   222	 * The caller must hold any appropriate locks.
   223	 */
   224	ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_iter *iter)
   225	{
   226		struct netfs_io_request *rreq;
   227		struct netfs_io_stream *stream;
   228		ssize_t ret;
   229		size_t orig_count = iov_iter_count(iter);
   230		bool sync = is_sync_kiocb(iocb);
   231	
   232		_enter("");
   233	
   234		if (!orig_count)
   235			return 0; /* Don't update atime */
   236	
   237		ret = kiocb_write_and_wait(iocb, orig_count);
   238		if (ret < 0)
   239			return ret;
   240		file_accessed(iocb->ki_filp);
   241	
   242		rreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
   243					   iocb->ki_pos, orig_count,
   244					   iocb->ki_flags & IOCB_DIRECT ?
   245					   NETFS_DIO_READ : NETFS_UNBUFFERED_READ);
   246		if (IS_ERR(rreq))
   247			return PTR_ERR(rreq);
   248	
   249		netfs_stat(&netfs_n_rh_dio_read);
   250		trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_dio_read);
   251	
   252		stream = &rreq->io_streams[0];
   253	
   254		/* If this is an async op, we have to keep track of the destination
   255		 * buffer for ourselves as the caller's iterator will be trashed when
   256		 * we return.
   257		 *
   258		 * Extract a buffer queue to represent as much of the output buffer as
   259		 * we can manage.  The fragments are extracted into a bvecq which will
   260		 * have sufficient nodes allocated to hold all the data, though this
   261		 * may end up truncated if ENOMEM is encountered.
   262		 */
   263		ret = netfs_extract_iter(iter, rreq->len, INT_MAX,
   264					 &stream->dispatch_cursor.bvecq, 0, rreq->gfp);
   265		if (ret < 0)
   266			goto error_put;
   267	
   268		rreq->len = ret;
   269	
   270		/* If we're going to do decryption or decompression, we're going to
   271		 * need a bounce buffer.  If the output buffer is correctly aligned and
   272		 * correctly sized for the crypto algorithm, we get a free copy between
   273		 * buffers from the crypto; if misaligned, we decrypt in place in the
   274		 * bounce buffer and then copy.
   275		 */
   276		if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags)) {
   277			if (!netfs_is_crypto_aligned(rreq, iter))
   278				__set_bit(NETFS_RREQ_CRYPT_IN_PLACE, &rreq->flags);
   279			__set_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags);
   280		}
   281	
   282		/* Set up the bounce buffer if we need it.  Allow for padding the
   283		 * request out to the crypo block size and allocate at least one bvecq
   284		 * into it.
   285		 */
   286		if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags)) {
   287			size_t bsize = rreq->crypto_bsize;
   288			size_t gap;
   289	
   290			rreq->bounce_alloc_to = round_down(rreq->start, bsize);
   291			gap = rreq->start - rreq->bounce_alloc_to;
   292	
   293			stream->issue_from = rreq->bounce_alloc_to;
   294			stream->buffered = round_up(rreq->len + gap, bsize);
   295	
 > 296			ret = bvecq_buffer_init(&rreq->bounce_alloc, rreq->debug_id, rreq->gfp);
   297			if (ret < 0)
   298				goto out;
   299	
   300			/*   0--->
   301			 *  ~--+-------+-------+-------+-------+---~
   302			 *     |       |       |       |       |
   303			 *     |copied |decrypt|reading|alloced|
   304			 *     |       |-ed    |       |       |
   305			 *  ~--+-------+-------+-------+-------+---~
   306			 *                                     ^bounce_alloc
   307			 *                             ^dispatch_cursor
   308			 *                     ^encrypt_cursor
   309			 *             ^bounce_copy
   310			 *     ^bounce_collect
   311			 */
   312			bvecq_pos_set(&stream->dispatch_cursor, &rreq->bounce_alloc);
   313			bvecq_pos_set(&rreq->encrypt_cursor, &rreq->bounce_alloc);
   314			bvecq_pos_set(&rreq->bounce_copy, &rreq->bounce_alloc);
   315			bvecq_pos_set(&rreq->bounce_collect, &rreq->bounce_alloc);
   316	
   317		} else {
   318			stream->buffered = ret;
   319			stream->issue_from = rreq->start;
   320			bvecq_pos_transfer(&stream->dispatch_cursor, &rreq->collect_cursor);
   321		}
   322	
   323		if (!sync) {
   324			rreq->iocb = iocb;
   325			__set_bit(NETFS_RREQ_OFFLOAD_COLLECTION, &rreq->flags);
   326		}
   327	
   328		ret = netfs_unbuffered_read(rreq, sync);
   329		if (ret < 0)
   330			goto out; /* May be -EIOCBQUEUED */
   331		if (sync) {
   332			ret = netfs_dio_copy_bounce_to_dest(rreq, iocb);
   333			if (ret == 0) {
   334				iocb->ki_pos += rreq->transferred;
   335				ret = rreq->transferred;
   336			}
   337		}
   338	
   339	out:
   340		netfs_put_request(rreq, netfs_rreq_trace_put_return);
   341		if (ret > 0)
   342			orig_count -= ret;
   343		return ret;
   344	
   345	error_put:
   346		netfs_put_failed_request(rreq);
   347		return ret;
   348	}
   349	EXPORT_SYMBOL(netfs_unbuffered_read_iter_locked);
   350	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
