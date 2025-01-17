Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C771B4F0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737100211; cv=none; b=oOkh3cr9OJoRT1JTMHOSo0eUoey/g3ogPBpotsUKwp90QgFdSIxHmjOhC8FOC2GGoa4rJsIiobgAtjMI5hI0DYoA9MtycoSmbyxFl3ESTKIekVKC0/xDgXTMf6OK7TrosZRNNbFZmn3ieWHoBmb65GQeBorI9tI7xvA5K5JoD98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737100211; c=relaxed/simple;
	bh=PRKbQQlxJdEG7QKm0++sourAF2nhKdduQpUsy74zLM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tx326DkPP/1EBK8zu/xspTfRxJ3A2jH19OtnE+SpQqaRJ4RJC4+hmirKoOkKC0xFeXk2579dIMqtFescWPRcnQrun97LvkLpIvUK6soRDcsivHsWhUgqOK5AasZ9U0dCOhF7dgEjTNbiuQuZQrNcgClzCnkdvmegOyjmdQDMOkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSwC2iRN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSwC2iRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737100209; x=1768636209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRKbQQlxJdEG7QKm0++sourAF2nhKdduQpUsy74zLM8=;
  b=kSwC2iRNcf7kO6kMir679D4BCUqR658ujfFGfcIRHX4Vv4kiCqZv4+uA
   BKTc5xrqR1jzgPTijyHz9j/SAZXmS12xT7fDddTQ7N0TKt7SLhfrRPh+g
   yybhGBehBbYJs253zuNVb6Oi/JaMczhjGWfThIbbbgaHra6KBXW9Vl7aD
   u3xpPpjZ+Erz1PFuvOShXzKrMN6iV2SDgB4SPqTUgRYPTlflHIsCOWitw
   FhTX4WUm+/oUeL/1qOWxuaPR5wY2feygeoDTzGolnXdbY6fMYYDpA0pxd
   SCTrVQp6Vx+TBEeEHR4kr04jXhY+f1TWDxrtvi/p8LS+Gkul3Jcjn4riS
   A==;
X-CSE-ConnectionGUID: rDzjt/0BRlqKJkrjYYo4uA==
X-CSE-MsgGUID: 0jtCLWNaTeKSEAtbySjK6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48187736"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="48187736"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 23:50:08 -0800
X-CSE-ConnectionGUID: GGssQ8ZUR/WzP+vY2ssD6g==
X-CSE-MsgGUID: 3KFGc7w+TXaLs9k0QvfDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="110733564"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2025 23:50:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYh7E-000Svv-25;
	Fri, 17 Jan 2025 07:50:04 +0000
Date: Fri, 17 Jan 2025 15:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1408/1408] include/linux/list.h:583:14:
 warning: array subscript 0 is outside array bounds of 'struct plist_node[0]'
Message-ID: <202501171519.TpEUKk9L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   52349611d09c6a9a2b558b3ce1cb1dca0d47dbe8
commit: 08c9196f65d268e1f8dccde138d4644c427bde76 [1408/1408] mm/swap: use nr_node_ids for avail_lists in swap_info_struct
config: arm64-randconfig-004-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171519.TpEUKk9L-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171519.TpEUKk9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171519.TpEUKk9L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/bug.h:37,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from mm/swapfile.c:8:
   In function 'add_to_avail_list',
       inlined from 'swap_range_free.constprop' at mm/swapfile.c:667:4:
   mm/swapfile.c:648:43: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     648 |                 WARN_ON(!plist_node_empty(&p->avail_lists[nid]));
         |                                           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:191:32: note: in definition of macro 'WARN_ON'
     191 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   In file included from mm/swapfile.c:15:
   include/linux/swap.h: In function 'swap_range_free.constprop':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c: In function '_enable_swap_info':
   mm/swapfile.c:2458:47: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2458 |                                 p->avail_lists[i].prio = 1;
         |                                 ~~~~~~~~~~~~~~^~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c:2460:47: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2460 |                                 p->avail_lists[i].prio = -p->prio;
         |                                 ~~~~~~~~~~~~~~^~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c:2455:39: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2455 |                         p->avail_lists[i].prio = -p->prio;
         |                         ~~~~~~~~~~~~~~^~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function 'add_to_avail_list',
       inlined from '_enable_swap_info' at mm/swapfile.c:2481:2:
   mm/swapfile.c:648:43: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     648 |                 WARN_ON(!plist_node_empty(&p->avail_lists[nid]));
         |                                           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:191:32: note: in definition of macro 'WARN_ON'
     191 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/swap.h: In function '_enable_swap_info':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function '__del_from_avail_list',
       inlined from 'del_from_avail_list' at mm/swapfile.c:621:2,
       inlined from 'swap_range_alloc' at mm/swapfile.c:638:3,
       inlined from 'scan_swap_map_slots' at mm/swapfile.c:802:2:
   mm/swapfile.c:615:17: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     615 |                 plist_del(&p->avail_lists[nid], &swap_avail_heads[nid]);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function 'scan_swap_map_slots':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In file included from include/asm-generic/bug.h:18:
   mm/swapfile.c: In function 'get_swap_pages':
   mm/swapfile.c:970:81: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
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
>> include/linux/list.h:583:14: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
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
   mm/swapfile.c:972:17: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     972 |                 plist_requeue(&si->avail_lists[node], &swap_avail_heads[node]);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   mm/swapfile.c:970:81: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
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
   In function '__del_from_avail_list',
       inlined from 'del_from_avail_list' at mm/swapfile.c:621:2,
       inlined from '__do_sys_swapoff' at mm/swapfile.c:2566:2,
       inlined from '__se_sys_swapoff' at mm/swapfile.c:2517:1:
   mm/swapfile.c:615:17: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     615 |                 plist_del(&p->avail_lists[nid], &swap_avail_heads[nid]);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function '__se_sys_swapoff':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function '__do_sys_swapoff',
       inlined from '__se_sys_swapoff' at mm/swapfile.c:2517:1:
   mm/swapfile.c:2576:52: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2576 |                                 if (si->avail_lists[nid].prio != 1)
         |                                     ~~~~~~~~~~~~~~~^~~~~
   include/linux/swap.h: In function '__se_sys_swapoff':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function '__do_sys_swapoff',
       inlined from '__se_sys_swapoff' at mm/swapfile.c:2517:1:
   mm/swapfile.c:2577:56: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2577 |                                         si->avail_lists[nid].prio--;
         |                                         ~~~~~~~~~~~~~~~^~~~~
   include/linux/swap.h: In function '__se_sys_swapoff':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function 'alloc_swap_info',
       inlined from '__do_sys_swapon' at mm/swapfile.c:3125:6,
       inlined from '__se_sys_swapon' at mm/swapfile.c:3097:1:
   mm/swapfile.c:2860:17: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2860 |                 plist_node_init(&p->avail_lists[i], 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function '__se_sys_swapon':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function 'alloc_swap_info',
       inlined from '__do_sys_swapon' at mm/swapfile.c:3125:6,
       inlined from '__se_sys_swapon' at mm/swapfile.c:3097:1:
   mm/swapfile.c:2860:48: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
    2860 |                 plist_node_init(&p->avail_lists[i], 0);
         |                                  ~~~~~~~~~~~~~~^~~
   include/linux/swap.h: In function '__se_sys_swapon':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In file included from include/linux/sched.h:19,
                    from arch/arm64/include/asm/pgtable.h:46,
                    from include/linux/memremap.h:7,
                    from include/linux/mm.h:27:
   In function 'plist_node_init',
       inlined from 'alloc_swap_info' at mm/swapfile.c:2860:3,
       inlined from '__do_sys_swapon' at mm/swapfile.c:3125:6,
       inlined from '__se_sys_swapon' at mm/swapfile.c:3097:1:
>> include/linux/plist.h:137:9: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     137 |         INIT_LIST_HEAD(&node->prio_list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function '__se_sys_swapon':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~
   In function 'plist_node_init',
       inlined from 'alloc_swap_info' at mm/swapfile.c:2860:3,
       inlined from '__do_sys_swapon' at mm/swapfile.c:3125:6,
       inlined from '__se_sys_swapon' at mm/swapfile.c:3097:1:
   include/linux/plist.h:138:9: warning: array subscript 0 is outside array bounds of 'struct plist_node[0]' [-Warray-bounds=]
     138 |         INIT_LIST_HEAD(&node->node_list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function '__se_sys_swapon':
   include/linux/swap.h:275:27: note: while referencing 'avail_lists'
     275 |         struct plist_node avail_lists[0]; /*
         |                           ^~~~~~~~~~~


vim +583 include/linux/list.h

6d7581e62f8be4 Jiri Pirko               2013-05-29  433  
008208c6b26f21 Oleg Nesterov            2013-11-12  434  /**
008208c6b26f21 Oleg Nesterov            2013-11-12  435   * list_next_entry - get the next element in list
008208c6b26f21 Oleg Nesterov            2013-11-12  436   * @pos:	the type * to cursor
3943f42c11896c Andrey Utkin             2014-11-14  437   * @member:	the name of the list_head within the struct.
008208c6b26f21 Oleg Nesterov            2013-11-12  438   */
008208c6b26f21 Oleg Nesterov            2013-11-12  439  #define list_next_entry(pos, member) \
008208c6b26f21 Oleg Nesterov            2013-11-12  440  	list_entry((pos)->member.next, typeof(*(pos)), member)
008208c6b26f21 Oleg Nesterov            2013-11-12  441  
008208c6b26f21 Oleg Nesterov            2013-11-12  442  /**
008208c6b26f21 Oleg Nesterov            2013-11-12  443   * list_prev_entry - get the prev element in list
008208c6b26f21 Oleg Nesterov            2013-11-12  444   * @pos:	the type * to cursor
3943f42c11896c Andrey Utkin             2014-11-14  445   * @member:	the name of the list_head within the struct.
008208c6b26f21 Oleg Nesterov            2013-11-12  446   */
008208c6b26f21 Oleg Nesterov            2013-11-12  447  #define list_prev_entry(pos, member) \
008208c6b26f21 Oleg Nesterov            2013-11-12  448  	list_entry((pos)->member.prev, typeof(*(pos)), member)
008208c6b26f21 Oleg Nesterov            2013-11-12  449  
^1da177e4c3f41 Linus Torvalds           2005-04-16  450  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  451   * list_for_each	-	iterate over a list
8e3a67a99231f9 Randy Dunlap             2006-06-25  452   * @pos:	the &struct list_head to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  453   * @head:	the head for your list.
^1da177e4c3f41 Linus Torvalds           2005-04-16  454   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  455  #define list_for_each(pos, head) \
e66eed651fd18a Linus Torvalds           2011-05-19  456  	for (pos = (head)->next; pos != (head); pos = pos->next)
^1da177e4c3f41 Linus Torvalds           2005-04-16  457  
^1da177e4c3f41 Linus Torvalds           2005-04-16  458  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  459   * list_for_each_prev	-	iterate over a list backwards
8e3a67a99231f9 Randy Dunlap             2006-06-25  460   * @pos:	the &struct list_head to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  461   * @head:	the head for your list.
^1da177e4c3f41 Linus Torvalds           2005-04-16  462   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  463  #define list_for_each_prev(pos, head) \
e66eed651fd18a Linus Torvalds           2011-05-19  464  	for (pos = (head)->prev; pos != (head); pos = pos->prev)
^1da177e4c3f41 Linus Torvalds           2005-04-16  465  
^1da177e4c3f41 Linus Torvalds           2005-04-16  466  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  467   * list_for_each_safe - iterate over a list safe against removal of list entry
8e3a67a99231f9 Randy Dunlap             2006-06-25  468   * @pos:	the &struct list_head to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  469   * @n:		another &struct list_head to use as temporary storage
^1da177e4c3f41 Linus Torvalds           2005-04-16  470   * @head:	the head for your list.
^1da177e4c3f41 Linus Torvalds           2005-04-16  471   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  472  #define list_for_each_safe(pos, n, head) \
^1da177e4c3f41 Linus Torvalds           2005-04-16  473  	for (pos = (head)->next, n = pos->next; pos != (head); \
^1da177e4c3f41 Linus Torvalds           2005-04-16  474  		pos = n, n = pos->next)
^1da177e4c3f41 Linus Torvalds           2005-04-16  475  
37c42524d60906 Denis V. Lunev           2007-10-16  476  /**
8f731f7d83d6c6 Randy Dunlap             2007-10-18  477   * list_for_each_prev_safe - iterate over a list backwards safe against removal of list entry
37c42524d60906 Denis V. Lunev           2007-10-16  478   * @pos:	the &struct list_head to use as a loop cursor.
37c42524d60906 Denis V. Lunev           2007-10-16  479   * @n:		another &struct list_head to use as temporary storage
37c42524d60906 Denis V. Lunev           2007-10-16  480   * @head:	the head for your list.
37c42524d60906 Denis V. Lunev           2007-10-16  481   */
37c42524d60906 Denis V. Lunev           2007-10-16  482  #define list_for_each_prev_safe(pos, n, head) \
37c42524d60906 Denis V. Lunev           2007-10-16  483  	for (pos = (head)->prev, n = pos->prev; \
e66eed651fd18a Linus Torvalds           2011-05-19  484  	     pos != (head); \
37c42524d60906 Denis V. Lunev           2007-10-16  485  	     pos = n, n = pos->prev)
37c42524d60906 Denis V. Lunev           2007-10-16  486  
^1da177e4c3f41 Linus Torvalds           2005-04-16  487  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  488   * list_for_each_entry	-	iterate over list of given type
8e3a67a99231f9 Randy Dunlap             2006-06-25  489   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  490   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  491   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  492   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  493  #define list_for_each_entry(pos, head, member)				\
93be3c2eb3371f Oleg Nesterov            2013-11-12  494  	for (pos = list_first_entry(head, typeof(*pos), member);	\
e66eed651fd18a Linus Torvalds           2011-05-19  495  	     &pos->member != (head);					\
8120e2e5141a42 Oleg Nesterov            2013-11-12  496  	     pos = list_next_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  497  
^1da177e4c3f41 Linus Torvalds           2005-04-16  498  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  499   * list_for_each_entry_reverse - iterate backwards over list of given type.
8e3a67a99231f9 Randy Dunlap             2006-06-25  500   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  501   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  502   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  503   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  504  #define list_for_each_entry_reverse(pos, head, member)			\
93be3c2eb3371f Oleg Nesterov            2013-11-12  505  	for (pos = list_last_entry(head, typeof(*pos), member);		\
e66eed651fd18a Linus Torvalds           2011-05-19  506  	     &pos->member != (head); 					\
8120e2e5141a42 Oleg Nesterov            2013-11-12  507  	     pos = list_prev_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  508  
^1da177e4c3f41 Linus Torvalds           2005-04-16  509  /**
72fd4a35a82433 Robert P. J. Day         2007-02-10  510   * list_prepare_entry - prepare a pos entry for use in list_for_each_entry_continue()
^1da177e4c3f41 Linus Torvalds           2005-04-16  511   * @pos:	the type * to use as a start point
^1da177e4c3f41 Linus Torvalds           2005-04-16  512   * @head:	the head of the list
3943f42c11896c Andrey Utkin             2014-11-14  513   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  514   *
72fd4a35a82433 Robert P. J. Day         2007-02-10  515   * Prepares a pos entry for use as a start point in list_for_each_entry_continue().
^1da177e4c3f41 Linus Torvalds           2005-04-16  516   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  517  #define list_prepare_entry(pos, head, member) \
^1da177e4c3f41 Linus Torvalds           2005-04-16  518  	((pos) ? : list_entry(head, typeof(*pos), member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  519  
^1da177e4c3f41 Linus Torvalds           2005-04-16  520  /**
fe96e57d77481c Randy Dunlap             2006-06-25  521   * list_for_each_entry_continue - continue iteration over list of given type
8e3a67a99231f9 Randy Dunlap             2006-06-25  522   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  523   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  524   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  525   *
fe96e57d77481c Randy Dunlap             2006-06-25  526   * Continue to iterate over list of given type, continuing after
fe96e57d77481c Randy Dunlap             2006-06-25  527   * the current position.
^1da177e4c3f41 Linus Torvalds           2005-04-16  528   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  529  #define list_for_each_entry_continue(pos, head, member) 		\
8120e2e5141a42 Oleg Nesterov            2013-11-12  530  	for (pos = list_next_entry(pos, member);			\
e66eed651fd18a Linus Torvalds           2011-05-19  531  	     &pos->member != (head);					\
8120e2e5141a42 Oleg Nesterov            2013-11-12  532  	     pos = list_next_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  533  
768f3591e2b1cc Pavel Emelyanov          2007-09-18  534  /**
768f3591e2b1cc Pavel Emelyanov          2007-09-18  535   * list_for_each_entry_continue_reverse - iterate backwards from the given point
768f3591e2b1cc Pavel Emelyanov          2007-09-18  536   * @pos:	the type * to use as a loop cursor.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  537   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  538   * @member:	the name of the list_head within the struct.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  539   *
768f3591e2b1cc Pavel Emelyanov          2007-09-18  540   * Start to iterate over list of given type backwards, continuing after
768f3591e2b1cc Pavel Emelyanov          2007-09-18  541   * the current position.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  542   */
768f3591e2b1cc Pavel Emelyanov          2007-09-18  543  #define list_for_each_entry_continue_reverse(pos, head, member)		\
8120e2e5141a42 Oleg Nesterov            2013-11-12  544  	for (pos = list_prev_entry(pos, member);			\
e66eed651fd18a Linus Torvalds           2011-05-19  545  	     &pos->member != (head);					\
8120e2e5141a42 Oleg Nesterov            2013-11-12  546  	     pos = list_prev_entry(pos, member))
768f3591e2b1cc Pavel Emelyanov          2007-09-18  547  
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  548  /**
fe96e57d77481c Randy Dunlap             2006-06-25  549   * list_for_each_entry_from - iterate over list of given type from the current point
8e3a67a99231f9 Randy Dunlap             2006-06-25  550   * @pos:	the type * to use as a loop cursor.
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  551   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  552   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  553   *
fe96e57d77481c Randy Dunlap             2006-06-25  554   * Iterate over list of given type, continuing from current position.
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  555   */
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  556  #define list_for_each_entry_from(pos, head, member) 			\
e66eed651fd18a Linus Torvalds           2011-05-19  557  	for (; &pos->member != (head);					\
8120e2e5141a42 Oleg Nesterov            2013-11-12  558  	     pos = list_next_entry(pos, member))
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  559  
b862815c3ee7b4 Jiri Pirko               2017-02-03  560  /**
b862815c3ee7b4 Jiri Pirko               2017-02-03  561   * list_for_each_entry_from_reverse - iterate backwards over list of given type
b862815c3ee7b4 Jiri Pirko               2017-02-03  562   *                                    from the current point
b862815c3ee7b4 Jiri Pirko               2017-02-03  563   * @pos:	the type * to use as a loop cursor.
b862815c3ee7b4 Jiri Pirko               2017-02-03  564   * @head:	the head for your list.
b862815c3ee7b4 Jiri Pirko               2017-02-03  565   * @member:	the name of the list_head within the struct.
b862815c3ee7b4 Jiri Pirko               2017-02-03  566   *
b862815c3ee7b4 Jiri Pirko               2017-02-03  567   * Iterate backwards over list of given type, continuing from current position.
b862815c3ee7b4 Jiri Pirko               2017-02-03  568   */
b862815c3ee7b4 Jiri Pirko               2017-02-03  569  #define list_for_each_entry_from_reverse(pos, head, member)		\
b862815c3ee7b4 Jiri Pirko               2017-02-03  570  	for (; &pos->member != (head);					\
b862815c3ee7b4 Jiri Pirko               2017-02-03  571  	     pos = list_prev_entry(pos, member))
b862815c3ee7b4 Jiri Pirko               2017-02-03  572  
^1da177e4c3f41 Linus Torvalds           2005-04-16  573  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  574   * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
8e3a67a99231f9 Randy Dunlap             2006-06-25  575   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  576   * @n:		another type * to use as temporary storage
^1da177e4c3f41 Linus Torvalds           2005-04-16  577   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  578   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  579   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  580  #define list_for_each_entry_safe(pos, n, head, member)			\
93be3c2eb3371f Oleg Nesterov            2013-11-12  581  	for (pos = list_first_entry(head, typeof(*pos), member),	\
8120e2e5141a42 Oleg Nesterov            2013-11-12  582  		n = list_next_entry(pos, member);			\
^1da177e4c3f41 Linus Torvalds           2005-04-16 @583  	     &pos->member != (head); 					\
8120e2e5141a42 Oleg Nesterov            2013-11-12  584  	     pos = n, n = list_next_entry(n, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  585  

:::::: The code at line 583 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
