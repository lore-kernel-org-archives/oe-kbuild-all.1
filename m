Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027ED347C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761661227; cv=none; b=TIebaaK4yECt20tzBXku89esPnyQJoW2RHk0dE6h8iOM9YOJy+4Zff0aIcLTFIiYyYbcyKNaLOYMrI+j2Ybyg1y3QBWbetYpl6TomFjbHisRRk0IeLMUuD6UQk1+qMumqsVNLzGp9JXiPOinQT4WmVBmrfVkTyqO1AD9ITPkJ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761661227; c=relaxed/simple;
	bh=GsOAIHo9DDAehOFcR5khnl4hal+zwSW0TXSXZnmpHvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARsj66CugzNNYY1PkrTzAslQzrSSv1ymSt/u22NjCpY1/3iX6B99h5Hge7igHeSxa/qm6JO3omJLliNkdDYBpZ0TysFAZdciMsGJKTsPhNnUdyhlc6GhLvwSbNKpLdWdTB0f3CbrKTke5shpBmE2lRjSxaBqWOE4far3CF2vq7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3yKO/Tj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3yKO/Tj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761661225; x=1793197225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GsOAIHo9DDAehOFcR5khnl4hal+zwSW0TXSXZnmpHvE=;
  b=Y3yKO/TjE7Qpv8qrIJoeN8O7yhVOdAbf+bw2w9xFoT9w4kOFZwKHBvxL
   T0SW1Bc74ny02BUH355g+ZAHZ+uCstqFTJpOLJsRrHfs5V/EFCNEp91gM
   LeRgMhR2bl9lFlb1BcK3zFB1BqxuBYgatn9Two4cXteR1dW4cGUUqwzmn
   r2wVSgnNlhHvXmWgEPRkaMmukxn8xZOJlUPqLH4x6uGwb8wovT8M2Pq8i
   xFd2cTQf0zNWgOFF43v5q/30Jo0PL7lgAFvPtY2uDmtY7/4/vsl2+2GXM
   aQP1TfSbOH+U4X5bktU/+mi+4Cpufk675zrDu9kkLy3G2eLyecnPp6Zaj
   A==;
X-CSE-ConnectionGUID: DRziw8vPS3CPM4DxgigiCQ==
X-CSE-MsgGUID: G/GSUxtrSWK2VxxaeYAtoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74881885"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="74881885"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:20:24 -0700
X-CSE-ConnectionGUID: T26Xq+nIQdG/qm5a8ivEew==
X-CSE-MsgGUID: dXKA02j7RMSdnKJ61ZTYNA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2025 07:20:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkYX-000JDC-2T;
	Tue, 28 Oct 2025 14:20:16 +0000
Date: Tue, 28 Oct 2025 22:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 563/688]
 fs/bcachefs/debug/async_objs.c:64:28: error: invalid application of 'sizeof'
 to incomplete type 'struct dump_iter'
Message-ID: <202510282257.XkMbAoIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   c001f57ee1b67b890a092c7c427d0488e91d350b
commit: da7a6f67bdb81c87b94b7e549f55fb1b3298fc83 [563/688] bcachefs: kill CONFIG_BCACHEFS_ASYNC_OBJECT_LISTS
config: m68k-mvme147_defconfig (https://download.01.org/0day-ci/archive/20251028/202510282257.XkMbAoIV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282257.XkMbAoIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282257.XkMbAoIV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/radix-tree.h:16,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:200,
                    from fs/bcachefs/debug/async_objs.c:7:
   fs/bcachefs/debug/async_objs.c: In function 'bch2_async_obj_list_open':
>> fs/bcachefs/debug/async_objs.c:64:28: error: invalid application of 'sizeof' to incomplete type 'struct dump_iter'
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |                            ^~~~~~
   include/linux/alloc_tag.h:239:16: note: in definition of macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c:64:13: note: in expansion of macro 'kzalloc'
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |             ^~~~~~~
>> fs/bcachefs/debug/async_objs.c:64:28: error: invalid application of 'sizeof' to incomplete type 'struct dump_iter'
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |                            ^~~~~~
   include/linux/alloc_tag.h:243:24: note: in definition of macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c:64:13: note: in expansion of macro 'kzalloc'
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |             ^~~~~~~
>> fs/bcachefs/debug/async_objs.c:64:28: error: invalid application of 'sizeof' to incomplete type 'struct dump_iter'
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |                            ^~~~~~
   include/linux/alloc_tag.h:246:24: note: in definition of macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c:64:13: note: in expansion of macro 'kzalloc'
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |             ^~~~~~~
   fs/bcachefs/debug/async_objs.c:64:11: error: assignment to 'struct dump_iter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |           ^
   fs/bcachefs/debug/async_objs.c:69:10: error: invalid use of undefined type 'struct dump_iter'
      69 |         i->from = POS_MIN;
         |          ^~
   fs/bcachefs/debug/async_objs.c:70:10: error: invalid use of undefined type 'struct dump_iter'
      70 |         i->iter = 0;
         |          ^~
   fs/bcachefs/debug/async_objs.c:71:10: error: invalid use of undefined type 'struct dump_iter'
      71 |         i->c    = container_of(list, struct bch_fs, async_objs[list->idx]);
         |          ^~
   fs/bcachefs/debug/async_objs.c:72:10: error: invalid use of undefined type 'struct dump_iter'
      72 |         i->list = list;
         |          ^~
   fs/bcachefs/debug/async_objs.c:73:10: error: invalid use of undefined type 'struct dump_iter'
      73 |         i->buf  = PRINTBUF;
         |          ^~
   fs/bcachefs/debug/async_objs.c: In function 'bch2_async_obj_list_read':
   fs/bcachefs/debug/async_objs.c:81:40: error: invalid use of undefined type 'struct dump_iter'
      81 |         struct async_obj_list *list = i->list;
         |                                        ^~
   fs/bcachefs/debug/async_objs.c:84:10: error: invalid use of undefined type 'struct dump_iter'
      84 |         i->ubuf = buf;
         |          ^~
   fs/bcachefs/debug/async_objs.c:85:10: error: invalid use of undefined type 'struct dump_iter'
      85 |         i->size = size;
         |          ^~
   fs/bcachefs/debug/async_objs.c:86:10: error: invalid use of undefined type 'struct dump_iter'
      86 |         i->ret  = 0;
         |          ^~
   In file included from fs/bcachefs/util/fast_list.h:4,
                    from fs/bcachefs/bcachefs.h:229:
   fs/bcachefs/debug/async_objs.c:90:58: error: invalid use of undefined type 'struct dump_iter'
      90 |         fast_list_for_each_from(&list->list, iter, obj, i->iter) {
         |                                                          ^~
   include/linux/generic-radix-tree.h:190:25: note: in definition of macro '__genradix_idx_to_offset'
     190 |         __idx_to_offset(_idx, __genradix_obj_size(_radix), _offset)
         |                         ^~~~
   fs/bcachefs/util/fast_list.h:28:22: note: in expansion of macro 'genradix_iter_init'
      28 |         for (_iter = genradix_iter_init(&(_list)->items, _start);       \
         |                      ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c:90:9: note: in expansion of macro 'fast_list_for_each_from'
      90 |         fast_list_for_each_from(&list->list, iter, obj, i->iter) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c:90:58: error: invalid use of undefined type 'struct dump_iter'
      90 |         fast_list_for_each_from(&list->list, iter, obj, i->iter) {
         |                                                          ^~
   include/linux/generic-radix-tree.h:292:28: note: in definition of macro 'genradix_iter_init'
     292 |                 .pos    = (_idx),                               \
         |                            ^~~~
   fs/bcachefs/debug/async_objs.c:90:9: note: in expansion of macro 'fast_list_for_each_from'
      90 |         fast_list_for_each_from(&list->list, iter, obj, i->iter) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/debug/async_objs.c:91:23: error: implicit declaration of function 'bch2_debugfs_flush_buf' [-Wimplicit-function-declaration]
      91 |                 ret = bch2_debugfs_flush_buf(i);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/debug/async_objs.c:95:23: error: invalid use of undefined type 'struct dump_iter'
      95 |                 if (!i->size)
         |                       ^~
   fs/bcachefs/debug/async_objs.c:98:37: error: invalid use of undefined type 'struct dump_iter'
      98 |                 list->obj_to_text(&i->buf, i->c, obj);
         |                                     ^~
   fs/bcachefs/debug/async_objs.c:98:45: error: invalid use of undefined type 'struct dump_iter'
      98 |                 list->obj_to_text(&i->buf, i->c, obj);
         |                                             ^~
   fs/bcachefs/debug/async_objs.c:99:18: error: invalid use of undefined type 'struct dump_iter'
      99 |                 i->iter = iter.pos;
         |                  ^~
   fs/bcachefs/debug/async_objs.c:102:14: error: invalid use of undefined type 'struct dump_iter'
     102 |         if (i->buf.allocation_failure)
         |              ^~
   fs/bcachefs/debug/async_objs.c:108:24: error: invalid use of undefined type 'struct dump_iter'
     108 |         return ret ?: i->ret;
         |                        ^~
   fs/bcachefs/debug/async_objs.c: At top level:
>> fs/bcachefs/debug/async_objs.c:114:27: error: 'bch2_dump_release' undeclared here (not in a function); did you mean 'bch2_dump_bset'?
     114 |         .release        = bch2_dump_release,
         |                           ^~~~~~~~~~~~~~~~~
         |                           bch2_dump_bset


vim +64 fs/bcachefs/debug/async_objs.c

41e51769b8a649 fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   58  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   59  static int bch2_async_obj_list_open(struct inode *inode, struct file *file)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   60  {
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   61  	struct async_obj_list *list = inode->i_private;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   62  	struct dump_iter *i;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   63  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  @64  	i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   65  	if (!i)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   66  		return -ENOMEM;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   67  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   68  	file->private_data = i;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   69  	i->from = POS_MIN;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   70  	i->iter	= 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   71  	i->c	= container_of(list, struct bch_fs, async_objs[list->idx]);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   72  	i->list	= list;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   73  	i->buf	= PRINTBUF;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   74  	return 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   75  }
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   76  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   77  static ssize_t bch2_async_obj_list_read(struct file *file, char __user *buf,
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   78  					size_t size, loff_t *ppos)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   79  {
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   80  	struct dump_iter *i = file->private_data;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   81  	struct async_obj_list *list = i->list;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   82  	ssize_t ret = 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   83  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   84  	i->ubuf = buf;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   85  	i->size	= size;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   86  	i->ret	= 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   87  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   88  	struct genradix_iter iter;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   89  	void *obj;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   90  	fast_list_for_each_from(&list->list, iter, obj, i->iter) {
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  @91  		ret = bch2_debugfs_flush_buf(i);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   92  		if (ret)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   93  			return ret;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   94  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   95  		if (!i->size)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   96  			break;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   97  
43b6a46d5d95bf fs/bcachefs/async_objs.c Kent Overstreet 2025-07-10   98  		list->obj_to_text(&i->buf, i->c, obj);
90221f7301320b fs/bcachefs/async_objs.c Kent Overstreet 2025-07-10   99  		i->iter = iter.pos;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  100  	}
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  101  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  102  	if (i->buf.allocation_failure)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  103  		ret = -ENOMEM;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  104  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  105  	if (!ret)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  106  		ret = bch2_debugfs_flush_buf(i);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  107  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  108  	return ret ?: i->ret;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  109  }
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  110  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  111  static const struct file_operations async_obj_ops = {
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  112  	.owner		= THIS_MODULE,
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  113  	.open		= bch2_async_obj_list_open,
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21 @114  	.release	= bch2_dump_release,
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  115  	.read		= bch2_async_obj_list_read,
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  116  };
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  117  

:::::: The code at line 64 was first introduced by commit
:::::: 0499a82b18b5ddee0d97d2cfcae0c0120f858c1f bcachefs: Async object debugging

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
