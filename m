Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9E9342C92
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 21:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768254232; cv=none; b=GhoJ7jbi0CiIZG0cIK+mEfFeCVbdXdYmYlPbiG724U8sT44NW6dE3Vw4ByU91PN2htwqA/n7Uigyu29z/uDmIhXcLj+VM2kWuWxlykomq87q/xnCaCWKq09MKpGDIIQ2UMYNhqxGkcQvOL6h+Y88Xosj6VFekTqj6c2xd8gdKa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768254232; c=relaxed/simple;
	bh=Ny3iEeqVMn7sAULi0QOdLv6pthGPx7XoMRDxppSsFF0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sF06cZSOUaZGjgW0E6u4PbA7UwRhFjV8dvx9y3p6YUqxXNqsMhBCQtEzkaLIBkUzOedzbeOPZPKqkGwQdsE0lRzA2QmYQAD22IVUWw5viGMQuTeO6S4zdqbZe4u2bpe3a7aNBHPxmGIjcR9OEPhRM37S8Tzk/5yNY8eS3X8IDWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3RAObiY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3RAObiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768254231; x=1799790231;
  h=date:from:to:cc:subject:message-id;
  bh=Ny3iEeqVMn7sAULi0QOdLv6pthGPx7XoMRDxppSsFF0=;
  b=K3RAObiYbKp/AWV26vUbnByk7FB6pBJ1SylbHwXxPyUxhZE1go08kmyd
   YvTHfBNaXEaF+0Ap85vCPdBp7sa4klCAigy0hp5aBEHhA9Md8gAEJJ8lr
   j1Y9ONixgRKlFim47xOR8nX1gXRjgapTiOxux2qmbTPuRy75+vgx8qQP5
   uoyfDHNWl0Yu9R/b9Me3sF70Fj35UkIqy90RyrDesOyoHJK0MwWEqW5hi
   qNfgUeRioRws0u6yWAVdpWomYbcqv5ahZv/iMNaPzbss8RZhrpWxxC9DL
   0uVaVjYXqAI9Bb8ocu2cm4qEVVSM085TnXR8/RaTpU8jn56pY4IkvO206
   w==;
X-CSE-ConnectionGUID: T+o+gXrQTMq6eQX77y0kJw==
X-CSE-MsgGUID: TcGvZ6P7QpWUns6K3zfrRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68744208"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68744208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:43:46 -0800
X-CSE-ConnectionGUID: vOq2dApXSOCEWvQcmW/jsQ==
X-CSE-MsgGUID: RJHujjGjR+OkOpHwwLwHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203407747"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 13:43:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfPhO-00000000Dts-1iFd;
	Mon, 12 Jan 2026 21:43:42 +0000
Date: Tue, 13 Jan 2026 05:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: oe-kbuild-all@lists.linux.dev, David Howells <dhowells@redhat.com>
Subject: [dhowells-fs:netfs-next 1/17]
 fs/netfs/buffered_read.c:314:undefined reference to
 `__cmpxchg_called_with_bad_pointer'
Message-ID: <202601130529.vx5AsMfq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 7b227cc6d4579599dd402543d1bd39e779164ce2 [1/17] fs/netfs: convert `netfs_io_request.error` to a `short
config: sh-randconfig-002-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130529.vx5AsMfq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130529.vx5AsMfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130529.vx5AsMfq-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/netfs/buffered_read.o: in function `netfs_read_to_pagecache':
>> fs/netfs/buffered_read.c:314:(.text+0x16e4): undefined reference to `__cmpxchg_called_with_bad_pointer'


vim +314 fs/netfs/buffered_read.c

e2d46f2ec332533 David Howells  2024-12-16  209  
ee4cdf7ba857a89 David Howells  2024-07-02  210  /*
ee4cdf7ba857a89 David Howells  2024-07-02  211   * Perform a read to the pagecache from a series of sources of different types,
ee4cdf7ba857a89 David Howells  2024-07-02  212   * slicing up the region to be read according to available cache blocks and
ee4cdf7ba857a89 David Howells  2024-07-02  213   * network rsize.
ee4cdf7ba857a89 David Howells  2024-07-02  214   */
3dc00bca8dc8226 Max Kellermann 2025-05-19  215  static void netfs_read_to_pagecache(struct netfs_io_request *rreq,
3dc00bca8dc8226 Max Kellermann 2025-05-19  216  				    struct readahead_control *ractl)
ee4cdf7ba857a89 David Howells  2024-07-02  217  {
ee4cdf7ba857a89 David Howells  2024-07-02  218  	struct netfs_inode *ictx = netfs_inode(rreq->inode);
ee4cdf7ba857a89 David Howells  2024-07-02  219  	unsigned long long start = rreq->start;
ee4cdf7ba857a89 David Howells  2024-07-02  220  	ssize_t size = rreq->len;
ee4cdf7ba857a89 David Howells  2024-07-02  221  	int ret = 0;
7e043a80b5dae5c David Howells  2022-11-03  222  
ee4cdf7ba857a89 David Howells  2024-07-02  223  	do {
ee4cdf7ba857a89 David Howells  2024-07-02  224  		struct netfs_io_subrequest *subreq;
6698c02d64b2408 David Howells  2024-12-16  225  		enum netfs_io_source source = NETFS_SOURCE_UNKNOWN;
ee4cdf7ba857a89 David Howells  2024-07-02  226  		ssize_t slice;
5e51c627c5acbcf David Howells  2022-11-04  227  
ee4cdf7ba857a89 David Howells  2024-07-02  228  		subreq = netfs_alloc_subrequest(rreq);
16211268fcb3667 David Howells  2022-03-01  229  		if (!subreq) {
ee4cdf7ba857a89 David Howells  2024-07-02  230  			ret = -ENOMEM;
16211268fcb3667 David Howells  2022-03-01  231  			break;
16211268fcb3667 David Howells  2022-03-01  232  		}
7b589a9b45ae32a David Howells  2024-08-07  233  
ee4cdf7ba857a89 David Howells  2024-07-02  234  		subreq->start	= start;
ee4cdf7ba857a89 David Howells  2024-07-02  235  		subreq->len	= size;
ee4cdf7ba857a89 David Howells  2024-07-02  236  
ee4cdf7ba857a89 David Howells  2024-07-02  237  		source = netfs_cache_prepare_read(rreq, subreq, rreq->i_size);
ee4cdf7ba857a89 David Howells  2024-07-02  238  		subreq->source = source;
ee4cdf7ba857a89 David Howells  2024-07-02  239  		if (source == NETFS_DOWNLOAD_FROM_SERVER) {
ee4cdf7ba857a89 David Howells  2024-07-02  240  			unsigned long long zp = umin(ictx->zero_point, rreq->i_size);
ee4cdf7ba857a89 David Howells  2024-07-02  241  			size_t len = subreq->len;
ee4cdf7ba857a89 David Howells  2024-07-02  242  
49866ce7ea8d41a David Howells  2024-12-16  243  			if (unlikely(rreq->origin == NETFS_READ_SINGLE))
49866ce7ea8d41a David Howells  2024-12-16  244  				zp = rreq->i_size;
ee4cdf7ba857a89 David Howells  2024-07-02  245  			if (subreq->start >= zp) {
ee4cdf7ba857a89 David Howells  2024-07-02  246  				subreq->source = source = NETFS_FILL_WITH_ZEROES;
ee4cdf7ba857a89 David Howells  2024-07-02  247  				goto fill_with_zeroes;
16211268fcb3667 David Howells  2022-03-01  248  			}
5e51c627c5acbcf David Howells  2022-11-04  249  
ee4cdf7ba857a89 David Howells  2024-07-02  250  			if (len > zp - subreq->start)
ee4cdf7ba857a89 David Howells  2024-07-02  251  				len = zp - subreq->start;
ee4cdf7ba857a89 David Howells  2024-07-02  252  			if (len == 0) {
ee4cdf7ba857a89 David Howells  2024-07-02  253  				pr_err("ZERO-LEN READ: R=%08x[%x] l=%zx/%zx s=%llx z=%llx i=%llx",
ee4cdf7ba857a89 David Howells  2024-07-02  254  				       rreq->debug_id, subreq->debug_index,
ee4cdf7ba857a89 David Howells  2024-07-02  255  				       subreq->len, size,
ee4cdf7ba857a89 David Howells  2024-07-02  256  				       subreq->start, ictx->zero_point, rreq->i_size);
16211268fcb3667 David Howells  2022-03-01  257  				break;
16211268fcb3667 David Howells  2022-03-01  258  			}
ee4cdf7ba857a89 David Howells  2024-07-02  259  			subreq->len = len;
16211268fcb3667 David Howells  2022-03-01  260  
ee4cdf7ba857a89 David Howells  2024-07-02  261  			netfs_stat(&netfs_n_rh_download);
ee4cdf7ba857a89 David Howells  2024-07-02  262  			if (rreq->netfs_ops->prepare_read) {
ee4cdf7ba857a89 David Howells  2024-07-02  263  				ret = rreq->netfs_ops->prepare_read(subreq);
e2d46f2ec332533 David Howells  2024-12-16  264  				if (ret < 0) {
e2d46f2ec332533 David Howells  2024-12-16  265  					subreq->error = ret;
e2d46f2ec332533 David Howells  2024-12-16  266  					/* Not queued - release both refs. */
20d72b00ca814d7 David Howells  2025-05-19  267  					netfs_put_subrequest(subreq,
e2d46f2ec332533 David Howells  2024-12-16  268  							     netfs_sreq_trace_put_cancel);
20d72b00ca814d7 David Howells  2025-05-19  269  					netfs_put_subrequest(subreq,
e2d46f2ec332533 David Howells  2024-12-16  270  							     netfs_sreq_trace_put_cancel);
e2d46f2ec332533 David Howells  2024-12-16  271  					break;
e2d46f2ec332533 David Howells  2024-12-16  272  				}
ee4cdf7ba857a89 David Howells  2024-07-02  273  				trace_netfs_sreq(subreq, netfs_sreq_trace_prepare);
2ff1e97587f4d39 David Howells  2024-03-19  274  			}
e2d46f2ec332533 David Howells  2024-12-16  275  			goto issue;
16211268fcb3667 David Howells  2022-03-01  276  		}
ee4cdf7ba857a89 David Howells  2024-07-02  277  
ee4cdf7ba857a89 David Howells  2024-07-02  278  	fill_with_zeroes:
ee4cdf7ba857a89 David Howells  2024-07-02  279  		if (source == NETFS_FILL_WITH_ZEROES) {
ee4cdf7ba857a89 David Howells  2024-07-02  280  			subreq->source = NETFS_FILL_WITH_ZEROES;
ee4cdf7ba857a89 David Howells  2024-07-02  281  			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
ee4cdf7ba857a89 David Howells  2024-07-02  282  			netfs_stat(&netfs_n_rh_zero);
e2d46f2ec332533 David Howells  2024-12-16  283  			goto issue;
16211268fcb3667 David Howells  2022-03-01  284  		}
16211268fcb3667 David Howells  2022-03-01  285  
ee4cdf7ba857a89 David Howells  2024-07-02  286  		if (source == NETFS_READ_FROM_CACHE) {
ee4cdf7ba857a89 David Howells  2024-07-02  287  			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
e2d46f2ec332533 David Howells  2024-12-16  288  			goto issue;
16211268fcb3667 David Howells  2022-03-01  289  		}
16211268fcb3667 David Howells  2022-03-01  290  
ee4cdf7ba857a89 David Howells  2024-07-02  291  		pr_err("Unexpected read source %u\n", source);
ee4cdf7ba857a89 David Howells  2024-07-02  292  		WARN_ON_ONCE(1);
ee4cdf7ba857a89 David Howells  2024-07-02  293  		break;
16211268fcb3667 David Howells  2022-03-01  294  
e2d46f2ec332533 David Howells  2024-12-16  295  	issue:
3dc00bca8dc8226 Max Kellermann 2025-05-19  296  		slice = netfs_prepare_read_iterator(subreq, ractl);
e2d46f2ec332533 David Howells  2024-12-16  297  		if (slice < 0) {
105549d09a539a8 David Howells  2024-12-13  298  			ret = slice;
105549d09a539a8 David Howells  2024-12-13  299  			subreq->error = ret;
e2d46f2ec332533 David Howells  2024-12-16  300  			trace_netfs_sreq(subreq, netfs_sreq_trace_cancel);
e2d46f2ec332533 David Howells  2024-12-16  301  			/* Not queued - release both refs. */
20d72b00ca814d7 David Howells  2025-05-19  302  			netfs_put_subrequest(subreq, netfs_sreq_trace_put_cancel);
20d72b00ca814d7 David Howells  2025-05-19  303  			netfs_put_subrequest(subreq, netfs_sreq_trace_put_cancel);
105549d09a539a8 David Howells  2024-12-13  304  			break;
e2d46f2ec332533 David Howells  2024-12-16  305  		}
ee4cdf7ba857a89 David Howells  2024-07-02  306  		size -= slice;
ee4cdf7ba857a89 David Howells  2024-07-02  307  		start += slice;
e2d46f2ec332533 David Howells  2024-12-16  308  
5de0219a9bb9dac David Howells  2025-02-12  309  		netfs_queue_read(rreq, subreq, size <= 0);
e2d46f2ec332533 David Howells  2024-12-16  310  		netfs_issue_read(rreq, subreq);
ee4cdf7ba857a89 David Howells  2024-07-02  311  		cond_resched();
ee4cdf7ba857a89 David Howells  2024-07-02  312  	} while (size > 0);
ee4cdf7ba857a89 David Howells  2024-07-02  313  
e2d46f2ec332533 David Howells  2024-12-16 @314  	if (unlikely(size > 0)) {
e2d46f2ec332533 David Howells  2024-12-16  315  		smp_wmb(); /* Write lists before ALL_QUEUED. */
e2d46f2ec332533 David Howells  2024-12-16  316  		set_bit(NETFS_RREQ_ALL_QUEUED, &rreq->flags);
2b1424cd131cfab David Howells  2025-05-19  317  		netfs_wake_collector(rreq);
e2d46f2ec332533 David Howells  2024-12-16  318  	}
ee4cdf7ba857a89 David Howells  2024-07-02  319  
ee4cdf7ba857a89 David Howells  2024-07-02  320  	/* Defer error return as we may need to wait for outstanding I/O. */
ee4cdf7ba857a89 David Howells  2024-07-02  321  	cmpxchg(&rreq->error, 0, ret);
16211268fcb3667 David Howells  2022-03-01  322  }
16211268fcb3667 David Howells  2022-03-01  323  

:::::: The code at line 314 was first introduced by commit
:::::: e2d46f2ec332533816417b60933954173f602121 netfs: Change the read result collector to only use one work item

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
