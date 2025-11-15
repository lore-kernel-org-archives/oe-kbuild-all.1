Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524682D77F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763213170; cv=none; b=UuZfpgF88bjDEk0b+cZ118+nCHKItK8ZBEKzo8VIaA9E2cwglv5pMrHP4ddtW67Bv3wquCffBEcocpGB3P88Y2YGW9wmty6pOBigh+JEdHAsNAVDBtSQ+IhI4mRj8SyxHW/EBYI2WUHW3TI2T0qFnY649mfq3rYaAVl7tS/eBg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763213170; c=relaxed/simple;
	bh=SH2smpkmyi33McxInz8STQ0Sw1pB3Exxwcfjq6YaMoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IZeOGQr/hm2HfHMcn4afbQt+LQQmCJ1jkDv2iR9KYqnvbjcKlImkIYUPZKomu0oLRKBbLG2mrm8j5PzJr5XaU1hrWm8Ylpum4kbCLlPdxHy53k72F+3ZZEkkCS9vhj7uqkaksh1az3rTyTd/mspf9i7sG+ul8P+ugihvxWLFYYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKWELQ9u; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKWELQ9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763213167; x=1794749167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SH2smpkmyi33McxInz8STQ0Sw1pB3Exxwcfjq6YaMoQ=;
  b=MKWELQ9uo1ZLkva0dpnjPemIs5fOoAtttfpTaz0Ysjc/T0n6QgAx15rN
   FAI8zhMAW4djkrcUTVmQ9DiyR45lQ1pNHsz9hM5myUscPm17+lTuLT30V
   TuXx5lEyzAkjyjk/cORDAyVxyXrBhDnMectJEinhS7ILFl5Q3a3vAxDvb
   uuKIqu5BOMSSmYK5x4SPGVaWqCk+0Wtq30AQHjwUQjFlH+mEyO6Mr7zfT
   Dcne0Wv5EP/T63a/MaKurh7Y3mjjf65Xk9AF4OO8IvhaICWnz/Fa2RBcq
   9JzDdyS1HJ01AszKoCSm0BiyLNfu3tVjx+/4khzL/yHdhj2W/gPtr5fBE
   g==;
X-CSE-ConnectionGUID: WlJPi1jkSNm6z4s+pLzzWg==
X-CSE-MsgGUID: IuIKCnUDQE21nW4VhRVsFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76632599"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="76632599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 05:26:06 -0800
X-CSE-ConnectionGUID: Gc4PGRzNQWShTzRVUGo9tw==
X-CSE-MsgGUID: tg5R70B8TmCXganNg0hIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="190810533"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Nov 2025 05:26:05 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKGHz-0007zX-1t;
	Sat, 15 Nov 2025 13:26:03 +0000
Date: Sat, 15 Nov 2025 21:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 71/71] include/linux/list.h:378:21:
 warning: storing the address of local variable 'sublist' in
 '*&freepage_6(D)->D.16680.D.16625.D.16618.lru.next'
Message-ID: <202511152124.bQH3s0Ho-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   ad3132d9450fb83553e3cee3961a4b5eb75dd355
commit: 3aee986d0dbe0bb36fa41324518258802d331e22 [71/71] mm/page_alloc: add page->buddy_list and page->pcp_list
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251115/202511152124.bQH3s0Ho-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511152124.bQH3s0Ho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511152124.bQH3s0Ho-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/compaction.c: In function 'sysfs_compact_node':
   mm/compaction.c:2761:38: warning: variable 'compact' set but not used [-Wunused-but-set-variable]
    2761 |         char *p, *s, *compact_size, *compact;
         |                                      ^~~~~~~
   In file included from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from mm/compaction.c:11:
   In function '__list_cut_position',
       inlined from 'list_cut_position' at include/linux/list.h:407:3,
       inlined from 'move_freelist_tail' at mm/compaction.c:1327:3:
>> include/linux/list.h:378:21: warning: storing the address of local variable 'sublist' in '*&freepage_6(D)->D.16680.D.16625.D.16618.lru.next' [-Wdangling-pointer=]
     378 |         entry->next = list;
         |         ~~~~~~~~~~~~^~~~~~
   mm/compaction.c: In function 'move_freelist_tail':
   mm/compaction.c:1324:19: note: 'sublist' declared here
    1324 |         LIST_HEAD(sublist);
         |                   ^~~~~~~
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
      24 |         struct list_head name = LIST_HEAD_INIT(name)
         |                          ^~~~
   mm/compaction.c:1322:61: note: 'freepage' declared here
    1322 | move_freelist_tail(struct list_head *freelist, struct page *freepage)
         |                                                ~~~~~~~~~~~~~^~~~~~~~


vim +378 include/linux/list.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  370  
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  371  static inline void __list_cut_position(struct list_head *list,
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  372  		struct list_head *head, struct list_head *entry)
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  373  {
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  374  	struct list_head *new_first = entry->next;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  375  	list->next = head->next;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  376  	list->next->prev = list;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  377  	list->prev = entry;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06 @378  	entry->next = list;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  379  	head->next = new_first;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  380  	new_first->prev = head;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  381  }
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  382  

:::::: The code at line 378 was first introduced by commit
:::::: 00e8a4da8cf0d7dba8cc4b0da28ea0f12dcf6b36 list.h: add list_cut_position()

:::::: TO: Luis R. Rodriguez <lrodriguez@atheros.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
