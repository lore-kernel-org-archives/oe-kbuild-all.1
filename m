Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D31DF25C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 05:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777181530; cv=none; b=PPK0tea6Nzayz0lelBeKU6X3uRgMI24tPOGW8JplS31IglTZD774l3OkTa2mu9Ui3ve7pCmu834b3BY6dDdtD7xR2Z760dRCGQmmFhJrbmO8ttEy7WYkIjv5RsOl4ApoeIDwEFQopw3M74XnjBgv00LBqfg6yIsnZClPgBT/CeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777181530; c=relaxed/simple;
	bh=Q44j+fjCXrJwqO28pZ/NfxTehV4WHn7prQJbAgQxNuE=;
	h=Date:From:Cc:Subject:Message-ID; b=aJ2NvPgKgtoFUSRUTOaf0zmRWOcUDY9+vD3AiaN+ZQHrbEnqKQ3wscNLnoPNbduFtaF4aS8LqsJRuHiBNbGdhCr0yhvHhgj/zRYAWQGnhWHd8YBPwN50wLCGpYcsLKRUay3rBEIIPAY6+rP4ptpv7i6QLwU03elpz5EL0SVVja4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6dGCHUh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6dGCHUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777181529; x=1808717529;
  h=date:from:cc:subject:message-id;
  bh=Q44j+fjCXrJwqO28pZ/NfxTehV4WHn7prQJbAgQxNuE=;
  b=k6dGCHUh5Rpg79edbaTklnba3sWKQrPxuWsOHPv4MZINd5qbbjMIsDKe
   TVT0e70UpDrwUMgT7Ipq9d2zabSyuqwj0Wv80O6zwbO05Gx053ZQhzo8a
   83XceqPihbj7oTMYCS2SXH7QEc/p+3+UD1QRbZ7MCag2BwvSTDrApWhVa
   iVlsvke8JrXcur/5WxQlyPAM07NMXy0hFSe/vwpRM5hM26tq8Ft5aEUHr
   VaDNEkuq2WJMaqNa3Z5GLowknez+awf7+LBayst8qb2kME0kPLBFJ8kji
   Vtw5BtwRACA9phpEcymD+gzJJ/uMSWwtRZUt1uVS/2c+L0tnCFr6qXnOv
   g==;
X-CSE-ConnectionGUID: ir5i02/yQ82MgUyA1u1PkA==
X-CSE-MsgGUID: //J2BTpzRm+ssm4Ptr4eUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="65636102"
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="65636102"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 22:32:09 -0700
X-CSE-ConnectionGUID: SKjQ5nvTR9CCvwlGPmF8IA==
X-CSE-MsgGUID: FqoaQuHpQ+erSuP1IozRAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="238323722"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Apr 2026 22:32:07 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGs69-000000007W9-0Opx;
	Sun, 26 Apr 2026 05:32:05 +0000
Date: Sun, 26 Apr 2026 13:31:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
Subject: include/linux/list.h:72:19: warning: storing the address of
 local variable 'pbufl' in '*&buf_33(D)->list.prev'
Message-ID: <202604261334.fKf5nOTO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Shiraz,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   897d54018cc9aa97fd1529ca08a53b429d05a566
commit: fa0cf568fd76550c1ddb806c03a65a1a4a1ea909 RDMA/irdma: Add irdma Kconfig/Makefile and remove i40iw
date:   4 years, 11 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260426/202604261334.fKf5nOTO-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604261334.fKf5nOTO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fa0cf568fd76 ("RDMA/irdma: Add irdma Kconfig/Makefile and remove i40iw")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604261334.fKf5nOTO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pci.h:32,
                    from drivers/infiniband/hw/irdma/osdep.h:6,
                    from drivers/infiniband/hw/irdma/puda.c:3:
   In function '__list_add',
       inlined from 'list_add' at include/linux/list.h:86:2,
       inlined from 'irdma_ieq_handle_partial' at drivers/infiniband/hw/irdma/puda.c:1384:2:
>> include/linux/list.h:72:19: warning: storing the address of local variable 'pbufl' in '*&buf_33(D)->list.prev' [-Wdangling-pointer=]
      72 |         new->prev = prev;
         |         ~~~~~~~~~~^~~~~~
   drivers/infiniband/hw/irdma/puda.c: In function 'irdma_ieq_handle_partial':
   drivers/infiniband/hw/irdma/puda.c:1377:26: note: 'pbufl' declared here
    1377 |         struct list_head pbufl; /* partial buffer list */
         |                          ^~~~~
   drivers/infiniband/hw/irdma/puda.c:1371:49: note: 'buf' declared here
    1371 |                          struct irdma_puda_buf *buf, u16 fpdu_len)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~^~~


vim +72 include/linux/list.h

d7c816733d501b Kees Cook        2016-08-17  56  
^1da177e4c3f41 Linus Torvalds   2005-04-16  57  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  58   * Insert a new entry between two known consecutive entries.
^1da177e4c3f41 Linus Torvalds   2005-04-16  59   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  60   * This is only for internal list manipulation where we know
^1da177e4c3f41 Linus Torvalds   2005-04-16  61   * the prev/next entries already!
^1da177e4c3f41 Linus Torvalds   2005-04-16  62   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  63  static inline void __list_add(struct list_head *new,
^1da177e4c3f41 Linus Torvalds   2005-04-16  64  			      struct list_head *prev,
^1da177e4c3f41 Linus Torvalds   2005-04-16  65  			      struct list_head *next)
^1da177e4c3f41 Linus Torvalds   2005-04-16  66  {
d7c816733d501b Kees Cook        2016-08-17  67  	if (!__list_add_valid(new, prev, next))
d7c816733d501b Kees Cook        2016-08-17  68  		return;
d7c816733d501b Kees Cook        2016-08-17  69  
^1da177e4c3f41 Linus Torvalds   2005-04-16  70  	next->prev = new;
^1da177e4c3f41 Linus Torvalds   2005-04-16  71  	new->next = next;
^1da177e4c3f41 Linus Torvalds   2005-04-16 @72  	new->prev = prev;
1c97be677f72b3 Paul E. McKenney 2015-09-20  73  	WRITE_ONCE(prev->next, new);
^1da177e4c3f41 Linus Torvalds   2005-04-16  74  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  75  
^1da177e4c3f41 Linus Torvalds   2005-04-16  76  /**
^1da177e4c3f41 Linus Torvalds   2005-04-16  77   * list_add - add a new entry
^1da177e4c3f41 Linus Torvalds   2005-04-16  78   * @new: new entry to be added
^1da177e4c3f41 Linus Torvalds   2005-04-16  79   * @head: list head to add it after
^1da177e4c3f41 Linus Torvalds   2005-04-16  80   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  81   * Insert a new entry after the specified head.
^1da177e4c3f41 Linus Torvalds   2005-04-16  82   * This is good for implementing stacks.
^1da177e4c3f41 Linus Torvalds   2005-04-16  83   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  84  static inline void list_add(struct list_head *new, struct list_head *head)
^1da177e4c3f41 Linus Torvalds   2005-04-16  85  {
^1da177e4c3f41 Linus Torvalds   2005-04-16 @86  	__list_add(new, head, head->next);
^1da177e4c3f41 Linus Torvalds   2005-04-16  87  }
199a9afc3dbe98 Dave Jones       2006-09-29  88  

:::::: The code at line 72 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
