Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF2A1F583D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 03:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761620812; cv=none; b=EYfCr1i7pkubb69J7T3StgV6UGEVqfttyvb6DRFyxWHRtdTBXY7nzmdZuYQiFO++AWCiEO0NGQX2j8XkGvSkmW/M4tJxD5Gsw6yYgp5w+U61GIGzXcIQdOqW9Sa1QUU6kBVPN9J2AifrcOxQbA4BD7tRHeOFKLGVIf04zE1dQwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761620812; c=relaxed/simple;
	bh=LmVgHl6yXc4ukekLQfSgwoAo8zgvJIRvdwhah9gWoJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQ3V9VXFQtIB/+xFDqglie+HHDrVUCCC52go+ZVDf9Ae59aqujAK/v/hQCfTTAtaxHUItJgP4mEpNhRcKdAHBRD/wl9nkSm66sNGszKRChv3Yh1fOVX9qh5ub0aAz/MUTRWaAWSpjH/DuLtKT/i6aJEk/4UTwj3AbfiKStFFMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O47wDqeI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O47wDqeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761620810; x=1793156810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LmVgHl6yXc4ukekLQfSgwoAo8zgvJIRvdwhah9gWoJA=;
  b=O47wDqeIzrapsYj0fjLxG9ro9ZS2yEVc+I4l9WuId9m9Oi9jSfazZmTC
   2TbPZF6dMyYMa1arz6j+G7/NCd9YOoca8xaJnax4ZSvpx+S8r3Xjj3zEf
   7yCk3z5OlDpF/ByGVEJiYlE69LmHOKkfOkDiqzcSIf8X9KM61zWx3BZrf
   GYWEhY/hgj4SEH4aYVJEFXWDZAHrI0ijDK2MiyHhlMIPsEEq/AY2B9W9h
   +IRFLRf019JZmaP9nkeRZxcLnNtLNEBmEXk+U97FEAiHUJGs4un5L4oyr
   WKFavEYvRa8bGKSLyBZo4pkSJeHGi1weYl1mtGE4BIBa+mmypyIS26g5q
   Q==;
X-CSE-ConnectionGUID: 49+Le3jyTmG8dZyYvw6ATg==
X-CSE-MsgGUID: 1fKaO0u+RbOngqYe7z8/qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51287530"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="51287530"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 20:06:49 -0700
X-CSE-ConnectionGUID: Bk3u9wZmS/inKL3eaG5ZeA==
X-CSE-MsgGUID: TbOSCaymQoy/gdip4b+ZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185117295"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 27 Oct 2025 20:06:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDa2o-000IgV-1G;
	Tue, 28 Oct 2025 03:06:46 +0000
Date: Tue, 28 Oct 2025 11:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 563/692]
 fs/bcachefs/debug/async_objs.c:69:3: error: dereferencing pointer to
 incomplete type 'struct dump_iter'
Message-ID: <202510281010.ptUN6ulC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   b7ec4feebd29a5e0e301cd8743be56f74e7039ab
commit: da7a6f67bdb81c87b94b7e549f55fb1b3298fc83 [563/692] bcachefs: kill CONFIG_BCACHEFS_ASYNC_OBJECT_LISTS
config: nios2-randconfig-002-20251028 (https://download.01.org/0day-ci/archive/20251028/202510281010.ptUN6ulC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510281010.ptUN6ulC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510281010.ptUN6ulC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/radix-tree.h:16,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:200,
                    from fs/bcachefs/debug/async_objs.c:7:
   fs/bcachefs/debug/async_objs.c: In function 'bch2_async_obj_list_open':
   fs/bcachefs/debug/async_objs.c:64:21: error: invalid application of 'sizeof' to incomplete type 'struct dump_iter'
      64 |  i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |                     ^~~~~~
   include/linux/alloc_tag.h:239:9: note: in definition of macro 'alloc_hooks_tag'
     239 |  typeof(_do_alloc) _res;      \
         |         ^~~~~~~~~
   include/linux/slab.h:1041:25: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                         ^~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c:64:6: note: in expansion of macro 'kzalloc'
      64 |  i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |      ^~~~~~~
   fs/bcachefs/debug/async_objs.c:64:21: error: invalid application of 'sizeof' to incomplete type 'struct dump_iter'
      64 |  i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |                     ^~~~~~
   include/linux/alloc_tag.h:243:10: note: in definition of macro 'alloc_hooks_tag'
     243 |   _res = _do_alloc;     \
         |          ^~~~~~~~~
   include/linux/slab.h:1041:25: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                         ^~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c:64:6: note: in expansion of macro 'kzalloc'
      64 |  i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |      ^~~~~~~
   fs/bcachefs/debug/async_objs.c:64:21: error: invalid application of 'sizeof' to incomplete type 'struct dump_iter'
      64 |  i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |                     ^~~~~~
   include/linux/alloc_tag.h:246:10: note: in definition of macro 'alloc_hooks_tag'
     246 |   _res = _do_alloc;     \
         |          ^~~~~~~~~
   include/linux/slab.h:1041:25: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                         ^~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c:64:6: note: in expansion of macro 'kzalloc'
      64 |  i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |      ^~~~~~~
>> fs/bcachefs/debug/async_objs.c:64:4: warning: assignment to 'struct dump_iter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      64 |  i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |    ^
>> fs/bcachefs/debug/async_objs.c:69:3: error: dereferencing pointer to incomplete type 'struct dump_iter'
      69 |  i->from = POS_MIN;
         |   ^~
   fs/bcachefs/debug/async_objs.c: In function 'bch2_async_obj_list_read':
   fs/bcachefs/debug/async_objs.c:81:33: error: dereferencing pointer to incomplete type 'struct dump_iter'
      81 |  struct async_obj_list *list = i->list;
         |                                 ^~
   fs/bcachefs/debug/async_objs.c:91:9: error: implicit declaration of function 'bch2_debugfs_flush_buf' [-Werror=implicit-function-declaration]
      91 |   ret = bch2_debugfs_flush_buf(i);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c: At top level:
   fs/bcachefs/debug/async_objs.c:114:13: error: 'bch2_dump_release' undeclared here (not in a function); did you mean 'bch2_dump_bset'?
     114 |  .release = bch2_dump_release,
         |             ^~~~~~~~~~~~~~~~~
         |             bch2_dump_bset
   cc1: some warnings being treated as errors


vim +69 fs/bcachefs/debug/async_objs.c

41e51769b8a649 fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  58  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  59  static int bch2_async_obj_list_open(struct inode *inode, struct file *file)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  60  {
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  61  	struct async_obj_list *list = inode->i_private;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  62  	struct dump_iter *i;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  63  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21 @64  	i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  65  	if (!i)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  66  		return -ENOMEM;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  67  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  68  	file->private_data = i;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21 @69  	i->from = POS_MIN;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  70  	i->iter	= 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  71  	i->c	= container_of(list, struct bch_fs, async_objs[list->idx]);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  72  	i->list	= list;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  73  	i->buf	= PRINTBUF;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  74  	return 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  75  }
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  76  

:::::: The code at line 69 was first introduced by commit
:::::: 0499a82b18b5ddee0d97d2cfcae0c0120f858c1f bcachefs: Async object debugging

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
