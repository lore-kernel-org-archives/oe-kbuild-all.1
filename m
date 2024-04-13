Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE27D5C8E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 23:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713052517; cv=none; b=G+xiBsOqtt+lfu3UvYgTXpTAw7OV3aGskLgSeFk5U+SibDhPI0GVzdqfijmai5dI96h2WWJiKFFFMgTffBFOnf7kOau+xUiiA99GTGVz96GJroBXTDpNkgyQvuEMIJRnQS5TwZO+QmOvaf99/Sq0OMS7X85S4h5ezKrEYQbvZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713052517; c=relaxed/simple;
	bh=gOR36d6oDDFQoa0sFZcrous375Po+oY8IWwhwWQbxws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fN2xmaUR0txAs699jkvRNtSsyPZGR2PAYFRiKsfPNDn3fH4DCFKQuKwWmgrwGCE2zG2TxG3Edf3p0TZzjqeUJyh2FQvlEmhzwnPJm7pvErUTcALKsIy/EhCl2IyBvAa1fm1O6JuTiEC+r8VJHdgIXxdklf6KZ6vEZ4BmbqjpYJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZDqglqS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZDqglqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713052514; x=1744588514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gOR36d6oDDFQoa0sFZcrous375Po+oY8IWwhwWQbxws=;
  b=OZDqglqSejYX0WoV+WSM7dIhmQBoWH7xXGkt0RWQSSSFFswZI4R87P20
   2mH8P+Uw6tw83pCw9l+D/9y8/PNDKVJn8u84NikNKs+HLecqn86zep77Z
   w+SMIkrQfzhYR7IjI4r1uvyGpCC04jOQftlzo/OmgdPzUhiF9L+IrL7NW
   ShROSrtZAbUSgO8PNYICsm2K1lySNCZr3tf72tPQyydfaMYxWnZsi2lQY
   suyo5A8H+iR2eYZjRsqHn+ckrzW19IHmYzNuxcVjuH+LrZgfJ2g9VBbww
   taTf2BrTC5UaTb/CB4pQ2uubrHrmB4NIvHYEO0fqdGA+m70WSFK35zKTt
   Q==;
X-CSE-ConnectionGUID: YTyXdorSQnGpVsoKNJTBqQ==
X-CSE-MsgGUID: 0wwM7gcUQYmIY/u/wGsCkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="12254325"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="12254325"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 16:55:13 -0700
X-CSE-ConnectionGUID: S+Dq0DHRRhaoEmGime0/rA==
X-CSE-MsgGUID: NLF3Ml3FR3eUaCcPoOd89Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="21544865"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 13 Apr 2024 16:55:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvnDB-00037C-2i;
	Sat, 13 Apr 2024 23:55:09 +0000
Date: Sun, 14 Apr 2024 07:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 2211/22089] mm/swapfile.c:970:81:
 warning: array subscript pfo_ret__ is outside array bounds of 'struct
 plist_node[0]'
Message-ID: <202404140751.A9FJ6Yan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ab9b23cd7b3e05b3fc38df24e070593493e1d8e2
commit: 08c9196f65d268e1f8dccde138d4644c427bde76 [2211/22089] mm/swap: use nr_node_ids for avail_lists in swap_info_struct
config: x86_64-randconfig-102-20240413 (https://download.01.org/0day-ci/archive/20240414/202404140751.A9FJ6Yan-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404140751.A9FJ6Yan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404140751.A9FJ6Yan-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/swapfile.c: In function '__del_from_avail_list':
   mm/swapfile.c:615:17: warning: array subscript nid is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     615 |                 plist_del(&p->avail_lists[nid], &swap_avail_heads[nid]);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/swapfile.c:15:
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from mm/swapfile.c:8:
   mm/swapfile.c: In function 'add_to_avail_list':
   mm/swapfile.c:648:43: warning: array subscript nid is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     648 |                 WARN_ON(!plist_node_empty(&p->avail_lists[nid]));
         |                                           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:122:32: note: in definition of macro 'WARN_ON'
     122 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In file included from include/linux/sched.h:19,
                    from include/linux/ioprio.h:5,
                    from include/linux/fs.h:39,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:499:
   In function 'plist_node_empty',
       inlined from 'add_to_avail_list' at mm/swapfile.c:648:3:
   include/linux/plist.h:223:16: warning: array subscript nid is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     223 |         return list_empty(&node->node_list);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function 'add_to_avail_list':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c: In function '_enable_swap_info':
   mm/swapfile.c:2460:47: warning: array subscript i is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2460 |                                 p->avail_lists[i].prio = -p->prio;
         |                                 ~~~~~~~~~~~~~~^~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c:2458:47: warning: array subscript i is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2458 |                                 p->avail_lists[i].prio = 1;
         |                                 ~~~~~~~~~~~~~~^~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c:2455:39: warning: array subscript i is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2455 |                         p->avail_lists[i].prio = -p->prio;
         |                         ~~~~~~~~~~~~~~^~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c: In function 'alloc_swap_info':
   mm/swapfile.c:2860:17: warning: array subscript i is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2860 |                 plist_node_init(&p->avail_lists[i], 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c:2860:48: warning: array subscript i is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2860 |                 plist_node_init(&p->avail_lists[i], 0);
         |                                  ~~~~~~~~~~~~~~^~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function 'plist_node_init',
       inlined from 'alloc_swap_info' at mm/swapfile.c:2860:3:
   include/linux/plist.h:137:9: warning: array subscript i is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     137 |         INIT_LIST_HEAD(&node->prio_list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function 'alloc_swap_info':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function 'plist_node_init',
       inlined from 'alloc_swap_info' at mm/swapfile.c:2860:3:
   include/linux/plist.h:138:9: warning: array subscript i is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     138 |         INIT_LIST_HEAD(&node->node_list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function 'alloc_swap_info':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In file included from include/asm-generic/bug.h:18:
   mm/swapfile.c: In function 'get_swap_pages':
>> mm/swapfile.c:970:81: warning: array subscript pfo_ret__ is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     970 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[node], avail_lists[node]) {
   include/linux/kernel.h:996:33: note: in definition of macro 'container_of'
     996 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:440:9: note: in expansion of macro 'list_entry'
     440 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:582:21: note: in expansion of macro 'list_next_entry'
     582 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/linux/plist.h:206:9: note: in expansion of macro 'list_for_each_entry_safe'
     206 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:970:9: note: in expansion of macro 'plist_for_each_entry_safe'
     970 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[node], avail_lists[node]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10:
>> include/linux/list.h:583:14: warning: array subscript pfo_ret__ is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     583 |              &pos->member != (head);                                    \
   include/linux/plist.h:206:9: note: in expansion of macro 'list_for_each_entry_safe'
     206 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:970:9: note: in expansion of macro 'plist_for_each_entry_safe'
     970 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[node], avail_lists[node]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c:972:17: warning: array subscript pfo_ret__ is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     972 |                 plist_requeue(&si->avail_lists[node], &swap_avail_heads[node]);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c:1016:38: warning: array subscript pfo_ret__ is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    1016 |                 if (plist_node_empty(&next->avail_lists[node]))
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function 'plist_node_empty',
       inlined from 'get_swap_pages' at mm/swapfile.c:1016:7:
>> include/linux/plist.h:223:16: warning: array subscript pfo_ret__ is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     223 |         return list_empty(&node->node_list);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function 'get_swap_pages':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
>> mm/swapfile.c:970:81: warning: array subscript pfo_ret__ is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     970 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[node], avail_lists[node]) {
   include/linux/kernel.h:996:33: note: in definition of macro 'container_of'
     996 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:440:9: note: in expansion of macro 'list_entry'
     440 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:584:27: note: in expansion of macro 'list_next_entry'
     584 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/linux/plist.h:206:9: note: in expansion of macro 'list_for_each_entry_safe'
     206 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:970:9: note: in expansion of macro 'plist_for_each_entry_safe'
     970 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[node], avail_lists[node]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function '__do_sys_swapoff',
       inlined from '__se_sys_swapoff' at mm/swapfile.c:2517:1:
   mm/swapfile.c:2576:52: warning: array subscript nid is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2576 |                                 if (si->avail_lists[nid].prio != 1)
         |                                     ~~~~~~~~~~~~~~~^~~~~
   include/linux/swap.h: In function '__se_sys_swapoff':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function '__do_sys_swapoff',
       inlined from '__se_sys_swapoff' at mm/swapfile.c:2517:1:
   mm/swapfile.c:2577:56: warning: array subscript nid is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2577 |                                         si->avail_lists[nid].prio--;
         |                                         ~~~~~~~~~~~~~~~^~~~~
   include/linux/swap.h: In function '__se_sys_swapoff':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.o: warning: objtool: __swap_info_get()+0x97: sibling call from callable instruction with modified stack frame
   mm/swapfile.o: warning: objtool: _swap_info_get()+0xe4: sibling call from callable instruction with modified stack frame
   mm/swapfile.o: warning: objtool: __swap_duplicate()+0x92: sibling call from callable instruction with modified stack frame
   mm/swapfile.o: warning: objtool: unuse_vma()+0xfe: sibling call from callable instruction with modified stack frame
   mm/swapfile.o: warning: objtool: get_swap_pages()+0x55: sibling call from callable instruction with modified stack frame
   mm/swapfile.o: warning: objtool: setup_swap_map_and_extents()+0x641: sibling call from callable instruction with modified stack frame
   mm/swapfile.o: warning: objtool: read_swap_header()+0x196: sibling call from callable instruction with modified stack frame
   mm/swapfile.o: warning: objtool: __se_sys_swapon()+0x6cb: sibling call from callable instruction with modified stack frame


vim +970 mm/swapfile.c

^1da177e4c3f41 Linus Torvalds 2005-04-16   942  
5d5e8f19544a35 Huang Ying     2018-08-21   943  int get_swap_pages(int n_goal, swp_entry_t swp_entries[], int entry_size)
^1da177e4c3f41 Linus Torvalds 2005-04-16   944  {
5d5e8f19544a35 Huang Ying     2018-08-21   945  	unsigned long size = swap_entry_size(entry_size);
adfab836f4908d Dan Streetman  2014-06-04   946  	struct swap_info_struct *si, *next;
36005bae205da3 Tim Chen       2017-02-22   947  	long avail_pgs;
36005bae205da3 Tim Chen       2017-02-22   948  	int n_ret = 0;
a2468cc9bfdff6 Aaron Lu       2017-09-06   949  	int node;
^1da177e4c3f41 Linus Torvalds 2005-04-16   950  
38d8b4e6bdc872 Huang Ying     2017-07-06   951  	/* Only single cluster request supported */
5d5e8f19544a35 Huang Ying     2018-08-21   952  	WARN_ON_ONCE(n_goal > 1 && size == SWAPFILE_CLUSTER);
38d8b4e6bdc872 Huang Ying     2017-07-06   953  
5d5e8f19544a35 Huang Ying     2018-08-21   954  	avail_pgs = atomic_long_read(&nr_swap_pages) / size;
36005bae205da3 Tim Chen       2017-02-22   955  	if (avail_pgs <= 0)
fb4f88dcabdc71 Hugh Dickins   2005-09-03   956  		goto noswap;
36005bae205da3 Tim Chen       2017-02-22   957  
36005bae205da3 Tim Chen       2017-02-22   958  	if (n_goal > SWAP_BATCH)
36005bae205da3 Tim Chen       2017-02-22   959  		n_goal = SWAP_BATCH;
36005bae205da3 Tim Chen       2017-02-22   960  
36005bae205da3 Tim Chen       2017-02-22   961  	if (n_goal > avail_pgs)
36005bae205da3 Tim Chen       2017-02-22   962  		n_goal = avail_pgs;
36005bae205da3 Tim Chen       2017-02-22   963  
5d5e8f19544a35 Huang Ying     2018-08-21   964  	atomic_long_sub(n_goal * size, &nr_swap_pages);
^1da177e4c3f41 Linus Torvalds 2005-04-16   965  
18ab4d4ced0817 Dan Streetman  2014-06-04   966  	spin_lock(&swap_avail_lock);
18ab4d4ced0817 Dan Streetman  2014-06-04   967  
18ab4d4ced0817 Dan Streetman  2014-06-04   968  start_over:
a2468cc9bfdff6 Aaron Lu       2017-09-06   969  	node = numa_node_id();
a2468cc9bfdff6 Aaron Lu       2017-09-06  @970  	plist_for_each_entry_safe(si, next, &swap_avail_heads[node], avail_lists[node]) {
18ab4d4ced0817 Dan Streetman  2014-06-04   971  		/* requeue si to after same-priority siblings */
a2468cc9bfdff6 Aaron Lu       2017-09-06   972  		plist_requeue(&si->avail_lists[node], &swap_avail_heads[node]);
18ab4d4ced0817 Dan Streetman  2014-06-04   973  		spin_unlock(&swap_avail_lock);
ec8acf20afb853 Shaohua Li     2013-02-22   974  		spin_lock(&si->lock);
adfab836f4908d Dan Streetman  2014-06-04   975  		if (!si->highest_bit || !(si->flags & SWP_WRITEOK)) {
18ab4d4ced0817 Dan Streetman  2014-06-04   976  			spin_lock(&swap_avail_lock);
a2468cc9bfdff6 Aaron Lu       2017-09-06   977  			if (plist_node_empty(&si->avail_lists[node])) {
ec8acf20afb853 Shaohua Li     2013-02-22   978  				spin_unlock(&si->lock);
18ab4d4ced0817 Dan Streetman  2014-06-04   979  				goto nextsi;
18ab4d4ced0817 Dan Streetman  2014-06-04   980  			}
18ab4d4ced0817 Dan Streetman  2014-06-04   981  			WARN(!si->highest_bit,
18ab4d4ced0817 Dan Streetman  2014-06-04   982  			     "swap_info %d in list but !highest_bit\n",
18ab4d4ced0817 Dan Streetman  2014-06-04   983  			     si->type);
18ab4d4ced0817 Dan Streetman  2014-06-04   984  			WARN(!(si->flags & SWP_WRITEOK),
18ab4d4ced0817 Dan Streetman  2014-06-04   985  			     "swap_info %d in list but !SWP_WRITEOK\n",
18ab4d4ced0817 Dan Streetman  2014-06-04   986  			     si->type);
a2468cc9bfdff6 Aaron Lu       2017-09-06   987  			__del_from_avail_list(si);
18ab4d4ced0817 Dan Streetman  2014-06-04   988  			spin_unlock(&si->lock);
18ab4d4ced0817 Dan Streetman  2014-06-04   989  			goto nextsi;
adfab836f4908d Dan Streetman  2014-06-04   990  		}
5d5e8f19544a35 Huang Ying     2018-08-21   991  		if (size == SWAPFILE_CLUSTER) {
f0eea189e8e969 Huang Ying     2017-09-06   992  			if (!(si->flags & SWP_FILE))
38d8b4e6bdc872 Huang Ying     2017-07-06   993  				n_ret = swap_alloc_cluster(si, swp_entries);
f0eea189e8e969 Huang Ying     2017-09-06   994  		} else
36005bae205da3 Tim Chen       2017-02-22   995  			n_ret = scan_swap_map_slots(si, SWAP_HAS_CACHE,
36005bae205da3 Tim Chen       2017-02-22   996  						    n_goal, swp_entries);
ec8acf20afb853 Shaohua Li     2013-02-22   997  		spin_unlock(&si->lock);
5d5e8f19544a35 Huang Ying     2018-08-21   998  		if (n_ret || size == SWAPFILE_CLUSTER)
36005bae205da3 Tim Chen       2017-02-22   999  			goto check_out;
18ab4d4ced0817 Dan Streetman  2014-06-04  1000  		pr_debug("scan_swap_map of si %d failed to find offset\n",
18ab4d4ced0817 Dan Streetman  2014-06-04  1001  			si->type);
36005bae205da3 Tim Chen       2017-02-22  1002  
18ab4d4ced0817 Dan Streetman  2014-06-04  1003  		spin_lock(&swap_avail_lock);
18ab4d4ced0817 Dan Streetman  2014-06-04  1004  nextsi:
adfab836f4908d Dan Streetman  2014-06-04  1005  		/*
adfab836f4908d Dan Streetman  2014-06-04  1006  		 * if we got here, it's likely that si was almost full before,
adfab836f4908d Dan Streetman  2014-06-04  1007  		 * and since scan_swap_map() can drop the si->lock, multiple
adfab836f4908d Dan Streetman  2014-06-04  1008  		 * callers probably all tried to get a page from the same si
18ab4d4ced0817 Dan Streetman  2014-06-04  1009  		 * and it filled up before we could get one; or, the si filled
18ab4d4ced0817 Dan Streetman  2014-06-04  1010  		 * up between us dropping swap_avail_lock and taking si->lock.
18ab4d4ced0817 Dan Streetman  2014-06-04  1011  		 * Since we dropped the swap_avail_lock, the swap_avail_head
18ab4d4ced0817 Dan Streetman  2014-06-04  1012  		 * list may have been modified; so if next is still in the
36005bae205da3 Tim Chen       2017-02-22  1013  		 * swap_avail_head list then try it, otherwise start over
36005bae205da3 Tim Chen       2017-02-22  1014  		 * if we have not gotten any slots.
adfab836f4908d Dan Streetman  2014-06-04  1015  		 */
a2468cc9bfdff6 Aaron Lu       2017-09-06  1016  		if (plist_node_empty(&next->avail_lists[node]))
18ab4d4ced0817 Dan Streetman  2014-06-04  1017  			goto start_over;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1018  	}
fb4f88dcabdc71 Hugh Dickins   2005-09-03  1019  
18ab4d4ced0817 Dan Streetman  2014-06-04  1020  	spin_unlock(&swap_avail_lock);
18ab4d4ced0817 Dan Streetman  2014-06-04  1021  
36005bae205da3 Tim Chen       2017-02-22  1022  check_out:
36005bae205da3 Tim Chen       2017-02-22  1023  	if (n_ret < n_goal)
5d5e8f19544a35 Huang Ying     2018-08-21  1024  		atomic_long_add((long)(n_goal - n_ret) * size,
38d8b4e6bdc872 Huang Ying     2017-07-06  1025  				&nr_swap_pages);
fb4f88dcabdc71 Hugh Dickins   2005-09-03  1026  noswap:
36005bae205da3 Tim Chen       2017-02-22  1027  	return n_ret;
36005bae205da3 Tim Chen       2017-02-22  1028  }
36005bae205da3 Tim Chen       2017-02-22  1029  

:::::: The code at line 970 was first introduced by commit
:::::: a2468cc9bfdff6139f59ca896671e5819ff5f94a swap: choose swap device according to numa node

:::::: TO: Aaron Lu <aaron.lu@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
