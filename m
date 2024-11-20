Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638871494A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732083120; cv=none; b=T7ghEUUtyYL+l+9BDHO8ppwVSuJZ+LQZWxXeLx770fi2qGE8M62J3jwuihu2jRVmhE+d2o2i2N8NuxcnfUeY6cJ1RrtnqzuOmB4D8d0xWOsOj00/S1Zz4Zg4LbMd5+VadJglGm/a8mQ/96fkjmzWT7ZraAxUgeC1CAVeGX/PA3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732083120; c=relaxed/simple;
	bh=pHPaejXn6HUrtyp5ZPpCtmQmnv/flVP1W995dgGebjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKv64EkwJEiqNQdOx/r5VRUQz6T9r1M6AGU4k5NmoYQRcYJyekpw2wGm/5cDPuYofJ7x6/VdJjfQBm6iyLbZBqXeLdR8O+rC50wbkFrRULDogCiN1uU7Ihrcr2yuD9EblXzpaUqyzJtNwwSlWQUh13rt3YlXz7bl2/blbODK70I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3Srb0MC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3Srb0MC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732083118; x=1763619118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHPaejXn6HUrtyp5ZPpCtmQmnv/flVP1W995dgGebjY=;
  b=Y3Srb0MCcUpJIJhNr3mHZLg6rzbj0AVGNrG5jnsvXWCrczG1w+HugGBS
   mzREbQ/k4fsCZpGi1vAheGzZBeygcYNVVK08k1MCMD64xJgkym8uiAdi5
   IV6oG/E6Wq0XS0KkG3UrD0X9gPHud2rbhuSc8EJiYqT1qVqnXBzX2TcdZ
   7T/cw87O3mFaArXQXzvA32G0z+TzdxjeODWyPxSLtRoPRfaMNAHxJ+AAj
   Y/dphYMlYf+NJsQ6WiiO+huUiq4jw4rlNdG619VavO1mK8R9ZwMVltNCO
   LCng3m/Lby6aapdEgvJh8ycKdYDGLEu3RdX11JOff0pCLCF0LlKy5TQj4
   g==;
X-CSE-ConnectionGUID: roXb0hlUSzCOeqwXOdQPKA==
X-CSE-MsgGUID: eQ3dO+gDS8aeoxdodsBOIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43521141"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="43521141"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 22:11:57 -0800
X-CSE-ConnectionGUID: Fo1KbCqMQsykZsShWhEbow==
X-CSE-MsgGUID: 7WMdWyG+QJ64RB4aA058bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90625186"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 22:11:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDdwQ-0000W9-0c;
	Wed, 20 Nov 2024 06:11:54 +0000
Date: Wed, 20 Nov 2024 14:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1] fs/bcachefs/btree_iter.h:905:44:
 error: 'PF_MEMALLOC_NORECLAIM' undeclared; did you mean 'PF_MEMALLOC_NOIO'?
Message-ID: <202411201449.egY0QASw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   6b0cc29d15ef1d80120c936e982104c33e757ba2
commit: 6b0cc29d15ef1d80120c936e982104c33e757ba2 [1/1] Fix typos
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241120/202411201449.egY0QASw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201449.egY0QASw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201449.egY0QASw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/str_hash.h:5,
                    from fs/bcachefs/xattr.h:5,
                    from fs/bcachefs/acl.c:6:
   fs/bcachefs/acl.c: In function 'bch2_acl_from_disk':
>> fs/bcachefs/btree_iter.h:905:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     905 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_locks'
     139 |         acl = allocate_dropping_locks(trans, ret,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:905:44: note: each undeclared identifier is reported only once for each function it appears in
     905 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_locks'
     139 |         acl = allocate_dropping_locks(trans, ret,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.h:905:66: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     905 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_locks'
     139 |         acl = allocate_dropping_locks(trans, ret,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/acl.c: In function 'bch2_acl_chmod':
   fs/bcachefs/btree_iter.h:895:38: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     895 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:425:15: note: in expansion of macro 'allocate_dropping_locks_errcode'
     425 |         ret = allocate_dropping_locks_errcode(trans,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:895:60: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     895 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:425:15: note: in expansion of macro 'allocate_dropping_locks_errcode'
     425 |         ret = allocate_dropping_locks_errcode(trans,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/bcachefs/btree_locking.h:13,
                    from fs/bcachefs/btree_io.h:7,
                    from fs/bcachefs/btree_cache.c:7:
   fs/bcachefs/btree_cache.c: In function 'bch2_btree_node_mem_alloc':
>> fs/bcachefs/btree_cache.c:832:31: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     832 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_cache.c:832:31: note: each undeclared identifier is reported only once for each function it appears in
     832 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:887:53: note: in definition of macro 'memalloc_flags_do'
     887 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
--
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
