Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11116130C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 18:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737398985; cv=none; b=YhWcvCY9Pejl3jzh7qIz0Xu+Ep/3+AzgAorLaTEeyW0fJVPvoHib/wpDcXM+IRz2JTTE06DtaR5TDlipeaXrTwxB9eYAt1aiIZ3vmDLQw+F3sSwDA3iZpT90abs+KT4o1d3xoVhW5+bLyX+9Eh7GCFTbfhUiq2acBo0iKgBicDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737398985; c=relaxed/simple;
	bh=2NuMas0zjjcyjSmMdybfFNdItGGf44+0gMw1E1McW/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k+fxApcuZFVX2bwpVeOSrm1VKi3C+jsnandcMdPqvQRd4yaeNznjEM8nJtI0MXgBGXKliM4hFtRhjKn2me4jyLDKxvs4kk0h+SKIdFIYy1FZZ/SOyNLm8+WeF9sKGaA9CDgK9cgPIu19Adq+eBuCO8Dvmxagq0Sqws27gZB5Tnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEl/ebBZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEl/ebBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737398984; x=1768934984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2NuMas0zjjcyjSmMdybfFNdItGGf44+0gMw1E1McW/E=;
  b=PEl/ebBZa8FZdt+qOMmcy+4r1x/vpINlm2ge+8dYJZcBFT0B8XatUBHH
   OIMx+6fvWvuXyb9Uls3L6ebefh2hcoC0wqCwWMnOC2u7D0aw2qENVS8fl
   85oBAzGuhnotIVmvg2NcqvDqpyXoacdDmyx3BT5VFAOYK8vRjbrkH49dq
   524AkAtYrFjxBFLZC3osyb+lG16xgtQX5DfeiZu7ETc2ImwXYYUoxKpMn
   kohmVoKn9hpnqFCBUMA46RuXMmhA5F7tbnEDWSutcQJFdq8O4uo7bM5C2
   0byneOy2HRZ3ks+BPjSElbmAkVDBXNh2feenxqgdsCCymP1qB6cpA0cyq
   w==;
X-CSE-ConnectionGUID: QAMk7GyMQqup7FrZpuDsig==
X-CSE-MsgGUID: 0KhohCgmTQWvK1H6qHF5oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="38047517"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="38047517"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 10:49:43 -0800
X-CSE-ConnectionGUID: I5DpMU5MTpS99U/ZUyO8Ng==
X-CSE-MsgGUID: JI5P+bVcQqifF9ZiTu3kQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107502967"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jan 2025 10:49:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZwqB-000WsN-34;
	Mon, 20 Jan 2025 18:49:39 +0000
Date: Tue, 21 Jan 2025 02:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1] fs/bcachefs/btree_iter.h:900:44:
 error: 'PF_MEMALLOC_NORECLAIM' undeclared; did you mean 'PF_MEMALLOC_NOIO'?
Message-ID: <202501210234.WeNY4rRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   10f9cb84b36d3a4a52e122083f5be7c96a08ba75
commit: 10f9cb84b36d3a4a52e122083f5be7c96a08ba75 [1/1] Fix typos
config: i386-buildonly-randconfig-001-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210234.WeNY4rRs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210234.WeNY4rRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210234.WeNY4rRs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_key_cache.c:5:
   fs/bcachefs/btree_key_cache.c: In function 'bkey_cached_alloc':
>> fs/bcachefs/btree_iter.h:900:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:149:14: note: in expansion of macro 'allocate_dropping_locks'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:900:44: note: each undeclared identifier is reported only once for each function it appears in
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:149:14: note: in expansion of macro 'allocate_dropping_locks'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.h:900:66: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:149:14: note: in expansion of macro 'allocate_dropping_locks'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_key_cache.c: In function 'btree_key_cache_create':
>> fs/bcachefs/btree_iter.h:900:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:245:40: note: in expansion of macro 'allocate_dropping_locks'
     245 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.h:900:66: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:245:40: note: in expansion of macro 'allocate_dropping_locks'
     245 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/bcachefs/btree_locking.h:13,
                    from fs/bcachefs/btree_io.h:7,
                    from fs/bcachefs/btree_cache.c:7:
   fs/bcachefs/btree_cache.c: In function 'bch2_btree_node_mem_alloc':
>> fs/bcachefs/btree_cache.c:831:31: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     831 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_cache.c:831:31: note: each undeclared identifier is reported only once for each function it appears in
     831 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~


vim +900 fs/bcachefs/btree_iter.h

   897	
   898	#define allocate_dropping_locks(_trans, _ret, _do)				\
   899	({										\
 > 900		typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
   901											\
   902		_ret = 0;								\
   903		if (unlikely(!_p)) {							\
   904			_ret = drop_locks_do(_trans, ((_p = _do), 0));			\
   905		}									\
   906		_p;									\
   907	})
   908	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
