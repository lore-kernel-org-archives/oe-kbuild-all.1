Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C6228368
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 20:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733863114; cv=none; b=SHFACZWBdQIZp7JFWy5I1cFEo3OS1nYRz6utf6xvFIrgQ7JQV/XIHoBUsAjncqGMEBrz1yIIK5Id/fqAnZVQl7C/8uaYH5uB0gdL1GeG/aYAC6vThXK2MCx2jAyQwJjLTv1oihc3Pfn61S+oQPpuWOe2Lz3HOGnMklfuUnoWRww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733863114; c=relaxed/simple;
	bh=ZZs+Cxqhad3o0XZOOnPlzuw8x7QigECuM0el6l7gUjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aWayNO2xOet3Q+07Yn9QGFr/Aruq0GtQEOEbBfZqSbA0zE9nNgJtEGbPQ0noSspEL9yEXdGNoAhXurfTkvsm3/yybnHt4GIuLRAnbUlq5LqoN/8lHk/cJBTz2KrxNoLa9NCmic36sAJcVmqQ41bcRsKtx7tT7L/ieJOIHnhWheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILHFi17g; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILHFi17g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733863112; x=1765399112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZs+Cxqhad3o0XZOOnPlzuw8x7QigECuM0el6l7gUjE=;
  b=ILHFi17g7h7/D73VWp/N0VCdm6wQd1A3rQgmeQi1rF0LUzfSXu7GX0tO
   x5WzKhywbSy3T2UenBHAYCgKVEfVfbJ02aaf4qVedGYV5Ipzr4JGGFJpQ
   aG8OcpNYSFzaJH7SEMN6UdrEdzDsaw/HKuezrTbG1WQtZ8p3YNWEYH2tq
   w9df2XiNOSxcgfNHBlMrwH7KDyPLK5e88IF0Pe0YV5S7Mmw80NAk7UxcE
   f17qzUAsfkQgNOBh689WGjo7DM70j/D77oZbg5mu8CUQZ/92mnNNUDIdx
   8TADRVHzd6kZ+QTbabn+QJPVx7IKs8m2XOnotl6+JOefc+nUmEzG8RY+l
   g==;
X-CSE-ConnectionGUID: BM6c+ioTRaOJh5w6FtlX3Q==
X-CSE-MsgGUID: 9M5UE/RvSKe6cFHb9VyI/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="56705670"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="56705670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 12:38:32 -0800
X-CSE-ConnectionGUID: fy5/bx8+TA2ncoLNWmnKlw==
X-CSE-MsgGUID: SNJtVjpsStyegoVw3aEqKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="96347339"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2024 12:38:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL700-0005vn-1n;
	Tue, 10 Dec 2024 20:38:28 +0000
Date: Wed, 11 Dec 2024 04:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1] fs/bcachefs/btree_iter.h:905:44:
 error: 'PF_MEMALLOC_NORECLAIM' undeclared; did you mean 'PF_MEMALLOC_NOIO'?
Message-ID: <202412110446.ltLqmTgY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   0bc1f3e0b86e80939dc960c265b3fdddd078bc85
commit: 0bc1f3e0b86e80939dc960c265b3fdddd078bc85 [1/1] Fix typos
config: riscv-randconfig-001-20241211 (https://download.01.org/0day-ci/archive/20241211/202412110446.ltLqmTgY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412110446.ltLqmTgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110446.ltLqmTgY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_key_cache.c:5:
   fs/bcachefs/btree_key_cache.c: In function 'bkey_cached_alloc':
>> fs/bcachefs/btree_iter.h:905:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     905 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:149:14: note: in expansion of macro 'allocate_dropping_locks'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:905:44: note: each undeclared identifier is reported only once for each function it appears in
     905 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:149:14: note: in expansion of macro 'allocate_dropping_locks'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.h:905:66: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     905 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:149:14: note: in expansion of macro 'allocate_dropping_locks'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_key_cache.c: In function 'btree_key_cache_create':
>> fs/bcachefs/btree_iter.h:905:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     905 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:243:40: note: in expansion of macro 'allocate_dropping_locks'
     243 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.h:905:66: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     905 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:243:40: note: in expansion of macro 'allocate_dropping_locks'
     243 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/bcachefs/btree_locking.h:13,
                    from fs/bcachefs/btree_io.h:7,
                    from fs/bcachefs/btree_cache.c:7:
   fs/bcachefs/btree_cache.c: In function 'bch2_btree_node_mem_alloc':
>> fs/bcachefs/btree_cache.c:831:31: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     831 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_cache.c:831:31: note: each undeclared identifier is reported only once for each function it appears in
     831 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~


vim +905 fs/bcachefs/btree_iter.h

   902	
   903	#define allocate_dropping_locks(_trans, _ret, _do)				\
   904	({										\
 > 905		typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
   906											\
   907		_ret = 0;								\
   908		if (unlikely(!_p)) {							\
   909			_ret = drop_locks_do(_trans, ((_p = _do), 0));			\
   910		}									\
   911		_p;									\
   912	})
   913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
