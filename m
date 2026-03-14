Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7339D2D239B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773479528; cv=none; b=awnub6QfqZJVQAMosfDilsFxWVHpVX8pIfziGKkWMPEcf0GtVYTSvzwyk8n826F3P/oiUkui3sUTWfwKoWIsPUPB5momdOiu3+t7z7hM/nvDzmXqHxmxm9iERjSlX2uZs3YBdd3JzTb18RKcWyzFwGlZVNSbNjK9VU/RJ0Ql+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773479528; c=relaxed/simple;
	bh=Yb4PbN9po7URUrQZqg+BCMRFPgBF8n5lTNoVlHftowc=;
	h=Date:From:Cc:Subject:Message-ID; b=rXajQLqpPKKJonbQhKjhNceZZuLM80iQLNUVB/aPbOaM4lqIQ0x1b7SRgOWDFgSPxy1uNY1jRiBONRyxVwwQ6Vjs1mx2IJiOi7lKEWM6094yTwQqcEhgmNAXFJXdC7nRpm8K7vDy5N8PtEY8Lc6ucviD4slvt0I9f2EliMBui1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUhTPKVN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUhTPKVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773479526; x=1805015526;
  h=date:from:cc:subject:message-id;
  bh=Yb4PbN9po7URUrQZqg+BCMRFPgBF8n5lTNoVlHftowc=;
  b=CUhTPKVNOAyb8owueX2tGMFhAc4sS1S3XNYNvv7PNvyOXqJByzmWHHy8
   9tZ7t8SVjfNPFH/uVez2a/7REiFq7TRePDFT15vdnnvCCgk3XXtBhTklg
   64EQvXWFCs3wOctDN1zBIUjghDEw5zZzZ4Ty4W5imNzqitWqICEphVmJO
   6TnZjppl7nTVPVcbl6ew8btWDV4n2dr7fwOEILu9FSGqYHDBoZi9gw29O
   iEvhhA/AF+AxeYglSUh/sBmNjhzXCfsoyuoB+YP5uiY2Hc5g6Ph335tvV
   RJ31mVyouYDlxJJhATUzSfkXzs24HmPkHrDobYD4gbH6TUsDF/oYwxM7m
   Q==;
X-CSE-ConnectionGUID: Py37iVAhTAWVS12aPy/GYw==
X-CSE-MsgGUID: 0m+ppDF0Rwmo1Is1MjxPEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="62142531"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="62142531"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 02:12:06 -0700
X-CSE-ConnectionGUID: pockSIpBQjiqBTRLx0aSIQ==
X-CSE-MsgGUID: DNCngU4WRXS5Ctiby2F+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="217757158"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Mar 2026 02:12:04 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1L2Q-000000004tr-0OhO;
	Sat, 14 Mar 2026 09:12:02 +0000
Date: Sat, 14 Mar 2026 17:11:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
Subject: include/linux/list.h:72:19: warning: storing the address of
 local variable 'pbufl' in '*&buf_33(D)->list.prev'
Message-ID: <202603141757.il2bc9t8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Shiraz,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80234b5ab240f52fa45d201e899e207b9265ef91
commit: fa0cf568fd76550c1ddb806c03a65a1a4a1ea909 RDMA/irdma: Add irdma Kconfig/Makefile and remove i40iw
date:   4 years, 9 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260314/202603141757.il2bc9t8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603141757.il2bc9t8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603141757.il2bc9t8-lkp@intel.com/

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

:::::: The code at line 72 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
