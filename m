Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F4270545
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 18:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779302184; cv=none; b=IjfS7Ph9ispN1BubJxOxGdKUU1HL6qtrfvYSJwqNDoWMRvGqHosHm2+XFQqEM0jYge0IitVmp7nOMil+zKuQ0mI4l8u8Xt1NAwjp/uoiAXDK8gVWBEjb8KewASX1b5TdScQfnPdJ8AVi8Mgn8NfJU/XoxWLOSTgz+T682KdVLeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779302184; c=relaxed/simple;
	bh=Y2yemewefY9Ts8sP5GtxImt3U+5LrdhxV4pJc2nTvhw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lV3wULzv5pHcZTyJfLIAcwO2kWCrlqL73FZLJH5UsMvW/EUEk7FqfeAXc0M0/X4Jsq+tudI3kG1yZZ2/CYi98kpBFy353FBapjwx/NTupSycvcJz55eTzcltb9m8AQgHgXUfU0L7Ja4Ay+WwKVQ0ZIOMSOI1ChfNfQJ39bqftkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkMbIPXl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkMbIPXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779302183; x=1810838183;
  h=date:from:to:cc:subject:message-id;
  bh=Y2yemewefY9Ts8sP5GtxImt3U+5LrdhxV4pJc2nTvhw=;
  b=IkMbIPXl2jLHXKuOM2PSdx5gi7JiUJrCbNWomm5IvRkivvaH1wimH4F2
   UToG0iiNt/lckD246dzuypxctwIwlhHd6FHlRRubbaUGh4kTHSM4mXz4D
   XGqE4J+xc2L3V+Viha5uBD8FpJCctncvqqTBhOOgRF+kKqipNPyWGmDVM
   Lk7em5QgzFL6dxqhgGOrLzZ7ez/qsxXrij0BXY5syArPvxUP8NSOY5Bnv
   1dkLPiPVu+bOO/H4/ZltNqYRcvuhUtSfAF4JYKFpbOWoskBEF325xW10a
   TYY3b3/GhXN96Ttsi/xvVu6nenBhrJgYAne048QzvBXNykGJnuQEiKI99
   g==;
X-CSE-ConnectionGUID: t/IrkXI8QUypIt8N4xNE9w==
X-CSE-MsgGUID: CSi8OaWETQmxwaWMo3CE3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91320476"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="91320476"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 11:36:22 -0700
X-CSE-ConnectionGUID: Zgfb71HASlmG5bXTNlhLFw==
X-CSE-MsgGUID: 62GgMcuKS7+qszM4loQuZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="245260076"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 May 2026 11:36:21 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPll8-000000003ht-2n1L;
	Wed, 20 May 2026 18:35:39 +0000
Date: Thu, 21 May 2026 02:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 33/34]
 fs/netfs/direct_read.c:290:66: sparse: sparse: incorrect type in argument 2
 (different base types)
Message-ID: <202605210224.bV8hnr41-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   13cee75c8b683f7c4382573f8c27adfbd49ffc47
commit: a9abd8d8d56c2f57d5faf8ddb8d82c762f9e401d [33/34] netfs: Support decryption on ubuffered/DIO read
config: sparc-randconfig-r122-20260520 (https://download.01.org/0day-ci/archive/20260521/202605210224.bV8hnr41-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210224.bV8hnr41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210224.bV8hnr41-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/netfs/direct_read.c:290:66: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int debug_id @@
   fs/netfs/direct_read.c:290:66: sparse:     expected restricted gfp_t [usertype] gfp
   fs/netfs/direct_read.c:290:66: sparse:     got unsigned int debug_id

vim +290 fs/netfs/direct_read.c

   207	
   208	/**
   209	 * netfs_unbuffered_read_iter_locked - Perform an unbuffered or direct I/O read
   210	 * @iocb: The I/O control descriptor describing the read
   211	 * @iter: The output buffer (also specifies read length)
   212	 *
   213	 * Perform an unbuffered I/O or direct I/O from the file in @iocb to the
   214	 * output buffer.  No use is made of the pagecache.
   215	 *
   216	 * The caller must hold any appropriate locks.
   217	 */
   218	ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_iter *iter)
   219	{
   220		struct netfs_io_request *rreq;
   221		struct netfs_io_stream *stream;
   222		ssize_t ret;
   223		size_t orig_count = iov_iter_count(iter);
   224		bool sync = is_sync_kiocb(iocb);
   225	
   226		_enter("");
   227	
   228		if (!orig_count)
   229			return 0; /* Don't update atime */
   230	
   231		ret = kiocb_write_and_wait(iocb, orig_count);
   232		if (ret < 0)
   233			return ret;
   234		file_accessed(iocb->ki_filp);
   235	
   236		rreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
   237					   iocb->ki_pos, orig_count,
   238					   iocb->ki_flags & IOCB_DIRECT ?
   239					   NETFS_DIO_READ : NETFS_UNBUFFERED_READ);
   240		if (IS_ERR(rreq))
   241			return PTR_ERR(rreq);
   242	
   243		netfs_stat(&netfs_n_rh_dio_read);
   244		trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_dio_read);
   245	
   246		stream = &rreq->io_streams[0];
   247	
   248		/* If this is an async op, we have to keep track of the destination
   249		 * buffer for ourselves as the caller's iterator will be trashed when
   250		 * we return.
   251		 *
   252		 * Extract a buffer queue to represent as much of the output buffer as
   253		 * we can manage.  The fragments are extracted into a bvecq which will
   254		 * have sufficient nodes allocated to hold all the data, though this
   255		 * may end up truncated if ENOMEM is encountered.
   256		 */
   257		ret = netfs_extract_iter(iter, rreq->len, INT_MAX, iocb->ki_pos,
   258					 &rreq->collect_cursor.bvecq, 0);
   259		if (ret < 0)
   260			goto error_put;
   261	
   262		rreq->len = ret;
   263	
   264		/* If we're going to do decryption or decompression, we're going to
   265		 * need a bounce buffer.  If the output buffer is correctly aligned and
   266		 * correctly sized for the crypto algorithm, we get a free copy between
   267		 * buffers from the crypto; if misaligned, we decrypt in place in the
   268		 * bounce buffer and then copy.
   269		 */
   270		if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags)) {
   271			if (!netfs_is_crypto_aligned(rreq, iter))
   272				__set_bit(NETFS_RREQ_CRYPT_IN_PLACE, &rreq->flags);
   273			__set_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags);
   274		}
   275	
   276		/* Set up the bounce buffer if we need it.  Allow for padding the
   277		 * request out to the crypo block size and allocate at least one bvecq
   278		 * into it.
   279		 */
   280		if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags)) {
   281			size_t bsize = rreq->crypto_bsize;
   282			size_t gap;
   283	
   284			rreq->bounce_alloc_to = round_down(rreq->start, bsize);
   285			gap = rreq->start - rreq->bounce_alloc_to;
   286	
   287			stream->issue_from = rreq->bounce_alloc_to;
   288			stream->buffered = round_up(rreq->len + gap, bsize);
   289	
 > 290			ret = bvecq_buffer_init(&rreq->bounce_alloc, rreq->debug_id);
   291			if (ret < 0)
   292				goto out;
   293	
   294			/*   0--->
   295			 *  ~--+-------+-------+-------+-------+---~
   296			 *     |       |       |       |       |
   297			 *     |copied |decrypt|reading|alloced|
   298			 *     |       |-ed    |       |       |
   299			 *  ~--+-------+-------+-------+-------+---~
   300			 *                                     ^bounce_alloc
   301			 *                             ^dispatch_cursor
   302			 *                     ^encrypt_cursor
   303			 *             ^bounce_copy
   304			 *     ^bounce_collect
   305			 */
   306			bvecq_pos_set(&stream->dispatch_cursor, &rreq->bounce_alloc);
   307			bvecq_pos_set(&rreq->encrypt_cursor, &rreq->bounce_alloc);
   308			bvecq_pos_set(&rreq->bounce_copy, &rreq->bounce_alloc);
   309			bvecq_pos_set(&rreq->bounce_collect, &rreq->bounce_alloc);
   310	
   311		} else {
   312			stream->buffered = ret;
   313			stream->issue_from = rreq->start;
   314			bvecq_pos_transfer(&stream->dispatch_cursor, &rreq->collect_cursor);
   315		}
   316	
   317		if (!sync) {
   318			rreq->iocb = iocb;
   319			__set_bit(NETFS_RREQ_OFFLOAD_COLLECTION, &rreq->flags);
   320		}
   321	
   322		ret = netfs_unbuffered_read(rreq, sync);
   323		if (ret < 0)
   324			goto out; /* May be -EIOCBQUEUED */
   325		if (sync) {
   326			ret = netfs_dio_copy_bounce_to_dest(rreq, iocb);
   327			if (ret == 0) {
   328				iocb->ki_pos += rreq->transferred;
   329				ret = rreq->transferred;
   330			}
   331		}
   332	
   333	out:
   334		netfs_put_request(rreq, netfs_rreq_trace_put_return);
   335		if (ret > 0)
   336			orig_count -= ret;
   337		return ret;
   338	
   339	error_put:
   340		netfs_put_failed_request(rreq);
   341		return ret;
   342	}
   343	EXPORT_SYMBOL(netfs_unbuffered_read_iter_locked);
   344	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
