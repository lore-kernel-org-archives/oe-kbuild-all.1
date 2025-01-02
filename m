Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85ED367
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735825720; cv=none; b=bYrHWRLS9WJrm5ViA2pUKUGU/jqHZdfrAbUY4ZRgRu/ZmmhJ2g696j+E3Rfw0f/qkwBJARRWeZsXHo71u+BWiXsSZex/jiVAgDzLm13zeagJgnRno4WTddISqtx8I+aMq5xfq4NpCxYJ+VKVxEJ8Ae1JWkE3pm8eI1qlg6o2+cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735825720; c=relaxed/simple;
	bh=zNP4MVsmhwSxX9IdHnExFQcc3Hoj3qqSt+tlnoZvaOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYwl3nuYXn2EEcoA9cKXw/aipOutrS0eWcgvnWsQrD3K2xGcZwphiNMq9yyDMcqBbizkiUWw5JMcvX10rvZCIWTnbxyvDCZ/XYFYIrH9fe1+uVF0W5o+NTy8SqNLqTu1ltSLL+/x+F72SOxP3T/92PokoXXUvPxwECWlPRhevIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBx1UOpt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBx1UOpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735825719; x=1767361719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNP4MVsmhwSxX9IdHnExFQcc3Hoj3qqSt+tlnoZvaOI=;
  b=oBx1UOpthywH/3Zwzrhq0PlOLIl+MJpm6xhMiePEHga5d7UGTJwW2MUB
   6CYjqO9GebCiIagQmnOoniS6ucsZP+VGfKnlQTeswPuVwUy9IPbG/hBKf
   QEUBMGmDSyFnI9wDGuCMVfRIclQYBs1jgbu3qiiLFXJVK8rCPsMt9tG6D
   4quNrexq6tZwPbTvCbfAd3TM9U2jyNrjTJ87dmO308SlvQFERN59V0iDu
   0TgMr/TbwBJVOTcXCBARNazUBPhkRsYRqA8oNVT+aMBCcc11YitAsnVhv
   tPaVZreDuDSDRyRFXlfRbrBeGECA64VJ5KLvrIbjjVeb7DdTcSThg25Ww
   w==;
X-CSE-ConnectionGUID: e2UZpK0RTb2XwpIxfGNDFA==
X-CSE-MsgGUID: iNmRO5V3RAe57nf5rEeHoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36078425"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="36078425"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 05:48:39 -0800
X-CSE-ConnectionGUID: 8OWTDBUbQO2QKNWXoNQTWQ==
X-CSE-MsgGUID: PzSh5WQDRNCyPoULWTRN+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101996534"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jan 2025 05:48:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTLYx-0008X8-0j;
	Thu, 02 Jan 2025 13:48:35 +0000
Date: Thu, 2 Jan 2025 21:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1] fs/bcachefs/btree_iter.h:889:38:
 error: 'PF_MEMALLOC_NORECLAIM' undeclared; did you mean 'PF_MEMALLOC_NOIO'?
Message-ID: <202501022136.QSXMsu7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   5aab4d7cc3e134b97e6bb36ea9d51325e66e258c
commit: d581cdb2a0705aed99b7534ad8c164ce30377a4e [1/1] Fix typos
config: x86_64-randconfig-006-20250102 (https://download.01.org/0day-ci/archive/20250102/202501022136.QSXMsu7d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501022136.QSXMsu7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501022136.QSXMsu7d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/backpointers.h:6,
                    from fs/bcachefs/ec.c:8:
   fs/bcachefs/ec.c: In function 'ec_stripe_mem_alloc':
>> fs/bcachefs/btree_iter.h:889:38: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     889 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/ec.c:950:16: note: in expansion of macro 'allocate_dropping_locks_errcode'
     950 |         return allocate_dropping_locks_errcode(trans,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:889:38: note: each undeclared identifier is reported only once for each function it appears in
     889 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/ec.c:950:16: note: in expansion of macro 'allocate_dropping_locks_errcode'
     950 |         return allocate_dropping_locks_errcode(trans,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.h:889:60: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     889 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/ec.c:950:16: note: in expansion of macro 'allocate_dropping_locks_errcode'
     950 |         return allocate_dropping_locks_errcode(trans,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/bcachefs/str_hash.h:5,
                    from fs/bcachefs/xattr.h:5,
                    from fs/bcachefs/acl.c:6:
   fs/bcachefs/acl.c: In function 'bch2_acl_from_disk':
   fs/bcachefs/btree_iter.h:899:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     899 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_locks'
     139 |         acl = allocate_dropping_locks(trans, ret,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:899:44: note: each undeclared identifier is reported only once for each function it appears in
     899 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_locks'
     139 |         acl = allocate_dropping_locks(trans, ret,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:899:66: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     899 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_locks'
     139 |         acl = allocate_dropping_locks(trans, ret,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/acl.c: In function 'bch2_acl_chmod':
>> fs/bcachefs/btree_iter.h:889:38: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     889 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:425:15: note: in expansion of macro 'allocate_dropping_locks_errcode'
     425 |         ret = allocate_dropping_locks_errcode(trans,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.h:889:60: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     889 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/acl.c:425:15: note: in expansion of macro 'allocate_dropping_locks_errcode'
     425 |         ret = allocate_dropping_locks_errcode(trans,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/bcachefs/btree_locking.h:13,
                    from fs/bcachefs/btree_io.h:7,
                    from fs/bcachefs/btree_cache.c:7:
   fs/bcachefs/btree_cache.c: In function 'bch2_btree_node_mem_alloc':
>> fs/bcachefs/btree_cache.c:831:31: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     831 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_cache.c:831:31: note: each undeclared identifier is reported only once for each function it appears in
     831 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:881:53: note: in definition of macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~


vim +889 fs/bcachefs/btree_iter.h

   886	
   887	#define allocate_dropping_locks_errcode(_trans, _do)				\
   888	({										\
 > 889		int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
   890											\
   891		if (bch2_err_matches(_ret, ENOMEM)) {					\
   892			_ret = drop_locks_do(_trans, _do);				\
   893		}									\
   894		_ret;									\
   895	})
   896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
