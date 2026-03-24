Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FCE35028C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338645; cv=none; b=beeqJmbZMebYGDE+6Puu9Bcum3cjKuoPS6fNFb3pADYL8heyTkvHc9CDXzaCcJjb1A6aLxL72hc2XIKSg1YOeYE70XLbELUV1JgOl885psLmN6ZhV+U4aQ5QCNSW2MR/O2f/gXQ6hyhUamkfLOjToBQ2nvCtJs87F/sZCRNmTO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338645; c=relaxed/simple;
	bh=+nrnpViiRBOvTWQ/wN9d9eDD9a3mEcX797VTIOWd8ag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IIwDgnhJcEu7mBwXUAG5Wrj/l93e3ncoCgWJ5OIu9m57tD9wH3Obwv/1z6cFROJX407q2NJU1PoONwspu+at1SEtQIk/trcRJFTW2yb7XUbrjwy7pp8/zYpiTSM94pr+K68OnNQCWQaAHpaKir5n3WsDQdJmDTZ0Y4WkH3lxHvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4lYtzwB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4lYtzwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774338636; x=1805874636;
  h=date:from:to:cc:subject:message-id;
  bh=+nrnpViiRBOvTWQ/wN9d9eDD9a3mEcX797VTIOWd8ag=;
  b=K4lYtzwBl+b64HGxLODkG0XGGlh2z50A7x5XS2eUdn0HL7+hJZzAwDUA
   VKIdwoLKwjLHu38pGt7vcOq6EXrqmZfhk4+lSXdMLrzsyLRJKWpMEKVnR
   4VxPLIRkqDfu4MaoLjRrMTzrj55XL1lslHSVyzgsxhviLdqPJKMHRBAoL
   w/SL+4MB1Em73Z6AwT4CVK9pa8uSHfVF3tMN9LoJla7Dk4ul+1/OgpvCG
   f3Wwpg0iQL3+pf3Reme9JlpM1XeS5NE0UUOGBVel7s45K1G8SnpTpf5xw
   TAQHnyQMt4yWtwtilIbnxgCiyJS6jl+KfRmTXN1E54qIB5vj+P8FZsb+i
   w==;
X-CSE-ConnectionGUID: eRp0ijZbTlijJphwUgTVjw==
X-CSE-MsgGUID: UtU+br3rSjGoTcZIpWbTOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75319676"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75319676"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 00:50:35 -0700
X-CSE-ConnectionGUID: yvJ0XbCEQ3KHnyywdBM7dA==
X-CSE-MsgGUID: puVWg/oQT/22h4elONcIeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224281107"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 00:50:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4wX0-000000004Bl-3Qa8;
	Tue, 24 Mar 2026 07:50:30 +0000
Date: Tue, 24 Mar 2026 15:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 37/42]
 fs/netfs/direct_read.c:283:67: sparse: sparse: incorrect type in argument 2
 (different base types)
Message-ID: <202603241542.Q4Wohd1C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   ae7ccdf83025020c44837849de26fb4546fbf825
commit: e7c8280c95acfbbef1fc569cbb950835ab68c7f2 [37/42] netfs: Implement bounce-buffering for unbuffered/DIO read
config: s390-randconfig-r131-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241542.Q4Wohd1C-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241542.Q4Wohd1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241542.Q4Wohd1C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/netfs/direct_read.c:283:67: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int debug_id @@
   fs/netfs/direct_read.c:283:67: sparse:     expected restricted gfp_t [usertype] gfp
   fs/netfs/direct_read.c:283:67: sparse:     got unsigned int debug_id

vim +283 fs/netfs/direct_read.c

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
   263		ret = netfs_extract_iter(iter, rreq->len, INT_MAX, iocb->ki_pos,
   264					 &rreq->collect_cursor.bvecq, 0);
   265		if (ret < 0)
   266			goto error_put;
   267	
   268		rreq->len = ret;
   269	
   270		/* If we're going to use a bounce buffer, we need to set it up.  We
   271		 * will then need to pad the request out to the minimum block size.
   272		 */
   273		if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags)) {
   274			size_t bsize = rreq->crypto_bsize;
   275			size_t gap;
   276	
   277			rreq->bounce_alloc_to = round_down(rreq->start, bsize);
   278			gap = rreq->start - rreq->bounce_alloc_to;
   279	
   280			stream->issue_from = rreq->bounce_alloc_to;
   281			stream->buffered = round_up(rreq->len + gap, bsize);
   282	
 > 283			ret = bvecq_buffer_init(&rreq->bounce_cursor, rreq->debug_id);
   284			if (ret < 0)
   285				goto out;
   286	
   287			/*   0--->
   288			 *  ~--+-------+-------+-------+-------+---~
   289			 *     |       |       |       |       |
   290			 *     |copied |decrypt|reading|alloced|
   291			 *     |       |-ed    |       |       |
   292			 *  ~--+-------+-------+-------+-------+---~
   293			 *                                    ^bounce_cursor
   294			 *                             ^dispatch_cursor
   295			 *                     ^encrypt_cursor
   296			 *              ^bounce_copy
   297			 *      ^bounce_collect
   298			 */
   299			bvecq_pos_set(&rreq->encrypt_cursor, &rreq->bounce_cursor);
   300			bvecq_pos_set(&rreq->bounce_copy, &rreq->bounce_cursor);
   301			bvecq_pos_set(&rreq->bounce_collect, &rreq->bounce_cursor);
   302			bvecq_pos_set(&stream->dispatch_cursor, &rreq->bounce_cursor);
   303	
   304		} else {
   305			stream->buffered = ret;
   306			stream->issue_from = rreq->start;
   307			bvecq_pos_transfer(&stream->dispatch_cursor, &rreq->collect_cursor);
   308		}
   309	
   310		if (!sync) {
   311			rreq->iocb = iocb;
   312			__set_bit(NETFS_RREQ_OFFLOAD_COLLECTION, &rreq->flags);
   313		}
   314	
   315		ret = netfs_unbuffered_read(rreq, sync);
   316		if (ret < 0)
   317			goto out; /* May be -EIOCBQUEUED */
   318		if (sync) {
   319			ret = netfs_dio_copy_bounce_to_dest(rreq, iocb);
   320			if (ret == 0) {
   321				iocb->ki_pos += rreq->transferred;
   322				ret = rreq->transferred;
   323			}
   324		}
   325	
   326	out:
   327		netfs_put_request(rreq, netfs_rreq_trace_put_return);
   328		if (ret > 0)
   329			orig_count -= ret;
   330		return ret;
   331	
   332	error_put:
   333		netfs_put_failed_request(rreq);
   334		return ret;
   335	}
   336	EXPORT_SYMBOL(netfs_unbuffered_read_iter_locked);
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
