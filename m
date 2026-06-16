Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAC2370AC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615308; cv=none; b=lYFEfSxFGRhSOts7XhOyocRVAFmHtHk/gAXKDf0wVsOp7DPFo4g95FYctLk06UU2/Ah8TD4C/gh4z8MMpnvc3zk24DmnDxRKnU9BNDK0Gixa87omuHRN4kqrDbBwXYQ4ePeGXozuGW2QuRByWlfBIIwjnszrMwIHpRqbYEga12Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615308; c=relaxed/simple;
	bh=vMyOayqMr6i9GPzTlHy689XVOaxDNGXelOLZ5NAitu0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WgYTH4E4Wl4ZGA3ISYZD2Z0bJBf7uS/H+Mrq2LUKhEP/mibsSjNJaHYt2p0WnC2vQGXAY6tKGa/KbsT9z3J3nWgjVI5BwjeXXElSnZrYtIxnCR43zD2XUbYH4oDdzkY+A0RCBSHbKitFtv86l0Hpc6zCc6bDLglK5fjgTNS1+O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjHVE4oR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjHVE4oR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781615302; x=1813151302;
  h=date:from:to:cc:subject:message-id;
  bh=vMyOayqMr6i9GPzTlHy689XVOaxDNGXelOLZ5NAitu0=;
  b=IjHVE4oRaDAAex9ZQ9KkENuGBQAbOqCPyV4ulTGCnEyrKlT3WtZvlZH4
   kO8csBaUjRGRk1gCv6HmMC8MqeG+WC4DQHUqOSt6PgO9HsND5oWAcQRSz
   49R5T7zK5Cr3gZXZJZ/W6DCx3hMKhL+zAUC/H8IxPolypo3lKG/qXvyK6
   4RMpYGcXWh/d6HSkWdZ7wyaw65hBbobQIJmzSXnS8Ywu0JwTCLVSqfXZL
   ZaYT95kC2Dpal5r5cSO/VxNPYQ0xjwHwK49N4XcGl3Sll3jSu8IjP6BH1
   /WCbtoRJApI7ORCapeEqpl58xyTy5Wco4cFNTzje3h7vLyteae8ArRLea
   A==;
X-CSE-ConnectionGUID: m+knFXPsS+ifq4zjcMiimg==
X-CSE-MsgGUID: 7qCOObIRSrSKFL2VMc9PHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82122654"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82122654"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 06:08:22 -0700
X-CSE-ConnectionGUID: tryr34iGSDeoRgfa4jpkLQ==
X-CSE-MsgGUID: VkSpzDv/T/C2aq+A2QCWdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252740379"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 06:08:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZTWc-00000000TBe-0JZ7;
	Tue, 16 Jun 2026 13:08:18 +0000
Date: Tue, 16 Jun 2026 21:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:blk-plug 1/1] io_uring/kbuf.c:166:5: error:
 subscript of pointer to incomplete type 'struct iovec'
Message-ID: <202606162114.Bvg9Dq7g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git blk-plug
head:   b020c7db0f52c4971abcdc70ce206111adab9229
commit: b020c7db0f52c4971abcdc70ce206111adab9229 [1/1] block: split out a new blk_plug.h helper
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260616/202606162114.Bvg9Dq7g-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162114.Bvg9Dq7g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606162114.Bvg9Dq7g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/kbuf.c:166:5: error: subscript of pointer to incomplete type 'struct iovec'
     166 |         iov[0].iov_base = buf;
         |         ~~~^
   include/linux/io_uring_types.h:138:10: note: forward declaration of 'struct iovec'
     138 |                 struct iovec    *iovec;
         |                        ^
   io_uring/kbuf.c:167:5: error: subscript of pointer to incomplete type 'struct iovec'
     167 |         iov[0].iov_len = *len;
         |         ~~~^
   include/linux/io_uring_types.h:138:10: note: forward declaration of 'struct iovec'
     138 |                 struct iovec    *iovec;
         |                        ^
>> io_uring/kbuf.c:260:39: error: use of undeclared identifier 'UIO_MAXIOV'
     260 |         nr_avail = min_t(__u16, tail - head, UIO_MAXIOV);
         |                                              ^~~~~~~~~~
>> io_uring/kbuf.c:282:9: error: invalid application of 'sizeof' to an incomplete type 'typeof(struct iovec)' (aka 'struct iovec')
     282 |                 iov = kmalloc_objs(struct iovec, nr_avail);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1021:2: note: expanded from macro 'kmalloc_objs'
    1021 |         __alloc_objs(kmalloc, default_gfp(__VA_ARGS__), typeof(VAR_OR_TYPE), COUNT)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:973:37: note: expanded from macro '__alloc_objs'
     973 |         const size_t __obj_size = size_mul(sizeof(TYPE), COUNT);        \
         |                                            ^     ~~~~~~
   include/linux/io_uring_types.h:138:10: note: forward declaration of 'struct iovec'
     138 |                 struct iovec    *iovec;
         |                        ^
>> io_uring/kbuf.c:312:6: error: incomplete definition of type 'struct iovec'
     312 |                 iov->iov_base = u64_to_user_ptr(READ_ONCE(buf->addr));
         |                 ~~~^
   include/linux/io_uring_types.h:138:10: note: forward declaration of 'struct iovec'
     138 |                 struct iovec    *iovec;
         |                        ^
   io_uring/kbuf.c:313:6: error: incomplete definition of type 'struct iovec'
     313 |                 iov->iov_len = len;
         |                 ~~~^
   include/linux/io_uring_types.h:138:10: note: forward declaration of 'struct iovec'
     138 |                 struct iovec    *iovec;
         |                        ^
>> io_uring/kbuf.c:314:6: error: arithmetic on a pointer to an incomplete type 'struct iovec'
     314 |                 iov++;
         |                 ~~~^
   include/linux/io_uring_types.h:138:10: note: forward declaration of 'struct iovec'
     138 |                 struct iovec    *iovec;
         |                        ^
   io_uring/kbuf.c:328:13: error: arithmetic on a pointer to an incomplete type 'struct iovec'
     328 |         return iov - arg->iovs;
         |                ~~~ ^
   include/linux/io_uring_types.h:138:10: note: forward declaration of 'struct iovec'
     138 |                 struct iovec    *iovec;
         |                        ^
   8 errors generated.
--
   In file included from io_uring/tw.c:14:
>> io_uring/rw.h:8:24: error: field has incomplete type 'struct iov_iter_state'
       8 |         struct iov_iter_state   iter_meta;
         |                                 ^
   io_uring/rw.h:8:9: note: forward declaration of 'struct iov_iter_state'
       8 |         struct iov_iter_state   iter_meta;
         |                ^
>> io_uring/rw.h:16:21: error: field has incomplete type 'struct iov_iter'
      16 |                 struct iov_iter                 iter;
         |                                                 ^
   include/linux/fs.h:68:8: note: forward declaration of 'struct iov_iter'
      68 | struct iov_iter;
         |        ^
   In file included from io_uring/tw.c:14:
   io_uring/rw.h:17:26: error: field has incomplete type 'struct iov_iter_state'
      17 |                 struct iov_iter_state           iter_state;
         |                                                 ^
   io_uring/rw.h:8:9: note: forward declaration of 'struct iov_iter_state'
       8 |         struct iov_iter_state   iter_meta;
         |                ^
>> io_uring/rw.h:18:18: error: field has incomplete type 'struct iovec'
      18 |                 struct iovec                    fast_iov;
         |                                                 ^
   include/linux/io_uring_types.h:138:10: note: forward declaration of 'struct iovec'
     138 |                 struct iovec    *iovec;
         |                        ^
   In file included from io_uring/tw.c:14:
>> io_uring/rw.h:28:23: error: field has incomplete type 'struct uio_meta'
      28 |                                 struct uio_meta                 meta;
         |                                                                 ^
   io_uring/rw.h:28:12: note: forward declaration of 'struct uio_meta'
      28 |                                 struct uio_meta                 meta;
         |                                        ^
>> io_uring/rw.h:16:21: error: field has incomplete type 'struct iov_iter'
      16 |                 struct iov_iter                 iter;
         |                                                 ^
   include/linux/fs.h:68:8: note: forward declaration of 'struct iov_iter'
      68 | struct iov_iter;
         |        ^
   In file included from io_uring/tw.c:14:
   io_uring/rw.h:17:26: error: field has incomplete type 'struct iov_iter_state'
      17 |                 struct iov_iter_state           iter_state;
         |                                                 ^
   io_uring/rw.h:8:9: note: forward declaration of 'struct iov_iter_state'
       8 |         struct iov_iter_state   iter_meta;
         |                ^
>> io_uring/rw.h:18:18: error: field has incomplete type 'struct iovec'
      18 |                 struct iovec                    fast_iov;
         |                                                 ^
   include/linux/io_uring_types.h:138:10: note: forward declaration of 'struct iovec'
     138 |                 struct iovec    *iovec;
         |                        ^
   In file included from io_uring/tw.c:14:
>> io_uring/rw.h:28:23: error: field has incomplete type 'struct uio_meta'
      28 |                                 struct uio_meta                 meta;
         |                                                                 ^
   io_uring/rw.h:28:12: note: forward declaration of 'struct uio_meta'
      28 |                                 struct uio_meta                 meta;
         |                                        ^
   9 errors generated.


vim +166 io_uring/kbuf.c

3b77495a97239fa Jens Axboe          2022-06-13  155  
35c8711c8fc4c16 Jens Axboe          2024-03-05  156  static int io_provided_buffers_select(struct io_kiocb *req, size_t *len,
35c8711c8fc4c16 Jens Axboe          2024-03-05  157  				      struct io_buffer_list *bl,
35c8711c8fc4c16 Jens Axboe          2024-03-05  158  				      struct iovec *iov)
35c8711c8fc4c16 Jens Axboe          2024-03-05  159  {
35c8711c8fc4c16 Jens Axboe          2024-03-05  160  	void __user *buf;
35c8711c8fc4c16 Jens Axboe          2024-03-05  161  
35c8711c8fc4c16 Jens Axboe          2024-03-05  162  	buf = io_provided_buffer_select(req, len, bl);
35c8711c8fc4c16 Jens Axboe          2024-03-05  163  	if (unlikely(!buf))
35c8711c8fc4c16 Jens Axboe          2024-03-05  164  		return -ENOBUFS;
35c8711c8fc4c16 Jens Axboe          2024-03-05  165  
35c8711c8fc4c16 Jens Axboe          2024-03-05 @166  	iov[0].iov_base = buf;
35c8711c8fc4c16 Jens Axboe          2024-03-05  167  	iov[0].iov_len = *len;
f274495aea7b152 Jens Axboe          2024-08-30  168  	return 1;
35c8711c8fc4c16 Jens Axboe          2024-03-05  169  }
35c8711c8fc4c16 Jens Axboe          2024-03-05  170  
6f1cbf6d6fd13fc Ming Lei            2025-10-24  171  static bool io_should_commit(struct io_kiocb *req, unsigned int issue_flags)
6f1cbf6d6fd13fc Ming Lei            2025-10-24  172  {
6f1cbf6d6fd13fc Ming Lei            2025-10-24  173  	/*
6f1cbf6d6fd13fc Ming Lei            2025-10-24  174  	* If we came in unlocked, we have no choice but to consume the
6f1cbf6d6fd13fc Ming Lei            2025-10-24  175  	* buffer here, otherwise nothing ensures that the buffer won't
6f1cbf6d6fd13fc Ming Lei            2025-10-24  176  	* get used by others. This does mean it'll be pinned until the
6f1cbf6d6fd13fc Ming Lei            2025-10-24  177  	* IO completes, coming in unlocked means we're being called from
6f1cbf6d6fd13fc Ming Lei            2025-10-24  178  	* io-wq context and there may be further retries in async hybrid
6f1cbf6d6fd13fc Ming Lei            2025-10-24  179  	* mode. For the locked case, the caller must call commit when
6f1cbf6d6fd13fc Ming Lei            2025-10-24  180  	* the transfer completes (or if we get -EAGAIN and must poll of
6f1cbf6d6fd13fc Ming Lei            2025-10-24  181  	* retry).
6f1cbf6d6fd13fc Ming Lei            2025-10-24  182  	*/
6f1cbf6d6fd13fc Ming Lei            2025-10-24  183  	if (issue_flags & IO_URING_F_UNLOCKED)
6f1cbf6d6fd13fc Ming Lei            2025-10-24  184  		return true;
6f1cbf6d6fd13fc Ming Lei            2025-10-24  185  
6f1cbf6d6fd13fc Ming Lei            2025-10-24  186  	/* uring_cmd commits kbuf upfront, no need to auto-commit */
42a6bd57ee9f930 Caleb Sander Mateos 2026-02-18  187  	if (!io_file_can_poll(req) && !io_is_uring_cmd(req))
6f1cbf6d6fd13fc Ming Lei            2025-10-24  188  		return true;
6f1cbf6d6fd13fc Ming Lei            2025-10-24  189  	return false;
6f1cbf6d6fd13fc Ming Lei            2025-10-24  190  }
6f1cbf6d6fd13fc Ming Lei            2025-10-24  191  
ab6559bdbb08f6b Jens Axboe          2025-08-20  192  static struct io_br_sel io_ring_buffer_select(struct io_kiocb *req, size_t *len,
3b77495a97239fa Jens Axboe          2022-06-13  193  					      struct io_buffer_list *bl,
3b77495a97239fa Jens Axboe          2022-06-13  194  					      unsigned int issue_flags)
3b77495a97239fa Jens Axboe          2022-06-13  195  {
3b77495a97239fa Jens Axboe          2022-06-13  196  	struct io_uring_buf_ring *br = bl->buf_ring;
c3f9109dbc9e2cd Jens Axboe          2024-02-19  197  	__u16 tail, head = bl->head;
ab6559bdbb08f6b Jens Axboe          2025-08-20  198  	struct io_br_sel sel = { };
3b77495a97239fa Jens Axboe          2022-06-13  199  	struct io_uring_buf *buf;
98b6fa62c84f2e1 Jens Axboe          2025-08-27  200  	u32 buf_len;
3b77495a97239fa Jens Axboe          2022-06-13  201  
c3f9109dbc9e2cd Jens Axboe          2024-02-19  202  	tail = smp_load_acquire(&br->tail);
c3f9109dbc9e2cd Jens Axboe          2024-02-19  203  	if (unlikely(tail == head))
ab6559bdbb08f6b Jens Axboe          2025-08-20  204  		return sel;
3b77495a97239fa Jens Axboe          2022-06-13  205  
c3f9109dbc9e2cd Jens Axboe          2024-02-19  206  	if (head + 1 == tail)
c3f9109dbc9e2cd Jens Axboe          2024-02-19  207  		req->flags |= REQ_F_BL_EMPTY;
c3f9109dbc9e2cd Jens Axboe          2024-02-19  208  
35c8711c8fc4c16 Jens Axboe          2024-03-05  209  	buf = io_ring_head_to_buf(br, head, bl->mask);
98b6fa62c84f2e1 Jens Axboe          2025-08-27  210  	buf_len = READ_ONCE(buf->len);
98b6fa62c84f2e1 Jens Axboe          2025-08-27  211  	if (*len == 0 || *len > buf_len)
98b6fa62c84f2e1 Jens Axboe          2025-08-27  212  		*len = buf_len;
35c8711c8fc4c16 Jens Axboe          2024-03-05  213  	req->flags |= REQ_F_BUFFER_RING | REQ_F_BUFFERS_COMMIT;
78385c7299f7514 Caleb Sander Mateos 2025-12-04  214  	req->buf_index = READ_ONCE(buf->bid);
5fda51255439add Jens Axboe          2025-08-20  215  	sel.buf_list = bl;
78385c7299f7514 Caleb Sander Mateos 2025-12-04  216  	sel.addr = u64_to_user_ptr(READ_ONCE(buf->addr));
3b77495a97239fa Jens Axboe          2022-06-13  217  
6f1cbf6d6fd13fc Ming Lei            2025-10-24  218  	if (io_should_commit(req, issue_flags)) {
418eab7a6f3c002 Jens Axboe          2026-03-19  219  		if (!io_kbuf_commit(req, sel.buf_list, *len, 1))
418eab7a6f3c002 Jens Axboe          2026-03-19  220  			req->flags |= REQ_F_BUF_MORE;
5fda51255439add Jens Axboe          2025-08-20  221  		sel.buf_list = NULL;
3b77495a97239fa Jens Axboe          2022-06-13  222  	}
ab6559bdbb08f6b Jens Axboe          2025-08-20  223  	return sel;
3b77495a97239fa Jens Axboe          2022-06-13  224  }
3b77495a97239fa Jens Axboe          2022-06-13  225  
ab6559bdbb08f6b Jens Axboe          2025-08-20  226  struct io_br_sel io_buffer_select(struct io_kiocb *req, size_t *len,
c0e965052149c88 Pavel Begunkov      2025-03-31  227  				  unsigned buf_group, unsigned int issue_flags)
3b77495a97239fa Jens Axboe          2022-06-13  228  {
3b77495a97239fa Jens Axboe          2022-06-13  229  	struct io_ring_ctx *ctx = req->ctx;
ab6559bdbb08f6b Jens Axboe          2025-08-20  230  	struct io_br_sel sel = { };
3b77495a97239fa Jens Axboe          2022-06-13  231  	struct io_buffer_list *bl;
3b77495a97239fa Jens Axboe          2022-06-13  232  
49c21d9a5fcd83b Jens Axboe          2026-03-17  233  	io_ring_submit_lock(ctx, issue_flags);
3b77495a97239fa Jens Axboe          2022-06-13  234  
c0e965052149c88 Pavel Begunkov      2025-03-31  235  	bl = io_buffer_get_list(ctx, buf_group);
3b77495a97239fa Jens Axboe          2022-06-13  236  	if (likely(bl)) {
a69307a55454060 Jens Axboe          2024-08-09  237  		if (bl->flags & IOBL_BUF_RING)
ab6559bdbb08f6b Jens Axboe          2025-08-20  238  			sel = io_ring_buffer_select(req, len, bl, issue_flags);
3b77495a97239fa Jens Axboe          2022-06-13  239  		else
ab6559bdbb08f6b Jens Axboe          2025-08-20  240  			sel.addr = io_provided_buffer_select(req, len, bl);
3b77495a97239fa Jens Axboe          2022-06-13  241  	}
49c21d9a5fcd83b Jens Axboe          2026-03-17  242  	io_ring_submit_unlock(ctx, issue_flags);
ab6559bdbb08f6b Jens Axboe          2025-08-20  243  	return sel;
3b77495a97239fa Jens Axboe          2022-06-13  244  }
3b77495a97239fa Jens Axboe          2022-06-13  245  
35c8711c8fc4c16 Jens Axboe          2024-03-05  246  /* cap it at a reasonable 256, will be one page even for 4K */
35c8711c8fc4c16 Jens Axboe          2024-03-05  247  #define PEEK_MAX_IMPORT		256
35c8711c8fc4c16 Jens Axboe          2024-03-05  248  
35c8711c8fc4c16 Jens Axboe          2024-03-05  249  static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
35c8711c8fc4c16 Jens Axboe          2024-03-05  250  				struct io_buffer_list *bl)
35c8711c8fc4c16 Jens Axboe          2024-03-05  251  {
35c8711c8fc4c16 Jens Axboe          2024-03-05  252  	struct io_uring_buf_ring *br = bl->buf_ring;
35c8711c8fc4c16 Jens Axboe          2024-03-05  253  	struct iovec *iov = arg->iovs;
35c8711c8fc4c16 Jens Axboe          2024-03-05  254  	int nr_iovs = arg->nr_iovs;
35c8711c8fc4c16 Jens Axboe          2024-03-05  255  	__u16 nr_avail, tail, head;
35c8711c8fc4c16 Jens Axboe          2024-03-05  256  	struct io_uring_buf *buf;
35c8711c8fc4c16 Jens Axboe          2024-03-05  257  
35c8711c8fc4c16 Jens Axboe          2024-03-05  258  	tail = smp_load_acquire(&br->tail);
35c8711c8fc4c16 Jens Axboe          2024-03-05  259  	head = bl->head;
35c8711c8fc4c16 Jens Axboe          2024-03-05 @260  	nr_avail = min_t(__u16, tail - head, UIO_MAXIOV);
35c8711c8fc4c16 Jens Axboe          2024-03-05  261  	if (unlikely(!nr_avail))
35c8711c8fc4c16 Jens Axboe          2024-03-05  262  		return -ENOBUFS;
35c8711c8fc4c16 Jens Axboe          2024-03-05  263  
35c8711c8fc4c16 Jens Axboe          2024-03-05  264  	buf = io_ring_head_to_buf(br, head, bl->mask);
35c8711c8fc4c16 Jens Axboe          2024-03-05  265  	if (arg->max_len) {
e0ee967630c8ee6 Jens Axboe          2024-08-20  266  		u32 len = READ_ONCE(buf->len);
cf9536e550dd243 Jens Axboe          2025-03-10  267  		size_t needed;
35c8711c8fc4c16 Jens Axboe          2024-03-05  268  
e0ee967630c8ee6 Jens Axboe          2024-08-20  269  		if (unlikely(!len))
e0ee967630c8ee6 Jens Axboe          2024-08-20  270  			return -ENOBUFS;
e0ee967630c8ee6 Jens Axboe          2024-08-20  271  		needed = (arg->max_len + len - 1) / len;
e0ee967630c8ee6 Jens Axboe          2024-08-20  272  		needed = min_not_zero(needed, (size_t) PEEK_MAX_IMPORT);
35c8711c8fc4c16 Jens Axboe          2024-03-05  273  		if (nr_avail > needed)
35c8711c8fc4c16 Jens Axboe          2024-03-05  274  			nr_avail = needed;
35c8711c8fc4c16 Jens Axboe          2024-03-05  275  	}
35c8711c8fc4c16 Jens Axboe          2024-03-05  276  
35c8711c8fc4c16 Jens Axboe          2024-03-05  277  	/*
35c8711c8fc4c16 Jens Axboe          2024-03-05  278  	 * only alloc a bigger array if we know we have data to map, eg not
35c8711c8fc4c16 Jens Axboe          2024-03-05  279  	 * a speculative peek operation.
35c8711c8fc4c16 Jens Axboe          2024-03-05  280  	 */
35c8711c8fc4c16 Jens Axboe          2024-03-05  281  	if (arg->mode & KBUF_MODE_EXPAND && nr_avail > nr_iovs && arg->max_len) {
bf4afc53b77aeaa Linus Torvalds      2026-02-21 @282  		iov = kmalloc_objs(struct iovec, nr_avail);
35c8711c8fc4c16 Jens Axboe          2024-03-05  283  		if (unlikely(!iov))
35c8711c8fc4c16 Jens Axboe          2024-03-05  284  			return -ENOMEM;
35c8711c8fc4c16 Jens Axboe          2024-03-05  285  		if (arg->mode & KBUF_MODE_FREE)
35c8711c8fc4c16 Jens Axboe          2024-03-05  286  			kfree(arg->iovs);
35c8711c8fc4c16 Jens Axboe          2024-03-05  287  		arg->iovs = iov;
35c8711c8fc4c16 Jens Axboe          2024-03-05  288  		nr_iovs = nr_avail;
35c8711c8fc4c16 Jens Axboe          2024-03-05  289  	} else if (nr_avail < nr_iovs) {
35c8711c8fc4c16 Jens Axboe          2024-03-05  290  		nr_iovs = nr_avail;
35c8711c8fc4c16 Jens Axboe          2024-03-05  291  	}
35c8711c8fc4c16 Jens Axboe          2024-03-05  292  
35c8711c8fc4c16 Jens Axboe          2024-03-05  293  	/* set it to max, if not set, so we can use it unconditionally */
35c8711c8fc4c16 Jens Axboe          2024-03-05  294  	if (!arg->max_len)
35c8711c8fc4c16 Jens Axboe          2024-03-05  295  		arg->max_len = INT_MAX;
35c8711c8fc4c16 Jens Axboe          2024-03-05  296  
78385c7299f7514 Caleb Sander Mateos 2025-12-04  297  	req->buf_index = READ_ONCE(buf->bid);
35c8711c8fc4c16 Jens Axboe          2024-03-05  298  	do {
98b6fa62c84f2e1 Jens Axboe          2025-08-27  299  		u32 len = READ_ONCE(buf->len);
ae98dbf43d755b4 Jens Axboe          2024-08-09  300  
ae98dbf43d755b4 Jens Axboe          2024-08-09  301  		/* truncate end piece, if needed, for non partial buffers */
ae98dbf43d755b4 Jens Axboe          2024-08-09  302  		if (len > arg->max_len) {
ae98dbf43d755b4 Jens Axboe          2024-08-09  303  			len = arg->max_len;
26ec15e4b0c1d7b Jens Axboe          2025-06-13  304  			if (!(bl->flags & IOBL_INC)) {
178b8ff66ff827c Jens Axboe          2025-06-26  305  				arg->partial_map = 1;
26ec15e4b0c1d7b Jens Axboe          2025-06-13  306  				if (iov != arg->iovs)
26ec15e4b0c1d7b Jens Axboe          2025-06-13  307  					break;
a4c694bfc2455e8 Joanne Koong        2025-12-04  308  				WRITE_ONCE(buf->len, len);
ae98dbf43d755b4 Jens Axboe          2024-08-09  309  			}
26ec15e4b0c1d7b Jens Axboe          2025-06-13  310  		}
35c8711c8fc4c16 Jens Axboe          2024-03-05  311  
78385c7299f7514 Caleb Sander Mateos 2025-12-04 @312  		iov->iov_base = u64_to_user_ptr(READ_ONCE(buf->addr));
ae98dbf43d755b4 Jens Axboe          2024-08-09  313  		iov->iov_len = len;
35c8711c8fc4c16 Jens Axboe          2024-03-05 @314  		iov++;
35c8711c8fc4c16 Jens Axboe          2024-03-05  315  
ae98dbf43d755b4 Jens Axboe          2024-08-09  316  		arg->out_len += len;
ae98dbf43d755b4 Jens Axboe          2024-08-09  317  		arg->max_len -= len;
35c8711c8fc4c16 Jens Axboe          2024-03-05  318  		if (!arg->max_len)
35c8711c8fc4c16 Jens Axboe          2024-03-05  319  			break;
35c8711c8fc4c16 Jens Axboe          2024-03-05  320  
35c8711c8fc4c16 Jens Axboe          2024-03-05  321  		buf = io_ring_head_to_buf(br, ++head, bl->mask);
35c8711c8fc4c16 Jens Axboe          2024-03-05  322  	} while (--nr_iovs);
35c8711c8fc4c16 Jens Axboe          2024-03-05  323  
35c8711c8fc4c16 Jens Axboe          2024-03-05  324  	if (head == tail)
35c8711c8fc4c16 Jens Axboe          2024-03-05  325  		req->flags |= REQ_F_BL_EMPTY;
35c8711c8fc4c16 Jens Axboe          2024-03-05  326  
35c8711c8fc4c16 Jens Axboe          2024-03-05  327  	req->flags |= REQ_F_BUFFER_RING;
35c8711c8fc4c16 Jens Axboe          2024-03-05  328  	return iov - arg->iovs;
35c8711c8fc4c16 Jens Axboe          2024-03-05  329  }
35c8711c8fc4c16 Jens Axboe          2024-03-05  330  

:::::: The code at line 166 was first introduced by commit
:::::: 35c8711c8fc4c16ad2749b8314da5829a493e28e io_uring/kbuf: add helpers for getting/peeking multiple buffers

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
