Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA311EDA1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748404386; cv=none; b=JZEn/rpv8qRo3ul9j8pwjVhJHy2KiykUSFtdRX0B4Fz4mNxLOxGWfCr+YUtRBpKFJyf9kQy2HB7Ww5XqheYzubIrADBZO+SnWEwjwbg9UF7mzdd7rG/RICxBLJBzMCzotNZ3BKnvYtLP+pkc/rOb83p7Wzm1UjXkQhYiDAIoX00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748404386; c=relaxed/simple;
	bh=576dKooYp8lZnANK3TwvzAOGDIOyipUsHP7EDAJ7AHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0blKQWO6FnEQ+OAhqee31Z2rvSznsD7EGjFJ2ldKONtERMImeKPaXj9q3fE2T7gkepErmW+9FFHdT2pRDANjzAQcZJl+28ABPakOAguAHHmBwHKE9inO4EOWcs77XiQoxePVcLkDZDe8EQq9HgWQLW3iAaAPAy+G1kvDkz+8EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHETt5rk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHETt5rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748404385; x=1779940385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=576dKooYp8lZnANK3TwvzAOGDIOyipUsHP7EDAJ7AHk=;
  b=EHETt5rkkYTvpsyeIk378riLyl3B8NHPe5k+XoGjpf/R4Plcq1Fp5jmF
   OdycZ3Dl4WQx812uIJklDsKPcWRxE4wnzWjRShEWTBaIkCVQ2Rzd80tbb
   6PSsEJG7JEtE8ztjiIPWyL+MbH4ORVb2NUsa5PfoKXnJvI0zJbrjsyeYu
   i3duZ90vXZe6IudFa8t7v9yzWUyCfvNOe+XkSTYeYyOR8QOn6JIBG3l8J
   /DpQj2Z1kF9zBNrvq00RKLJZJExdpsWbdGcgcDGNqRH37blakoeDqmMB2
   FKOt32E+aPz8+uuZ3AbuLulPYAahD47VcsKTSX1Yy8vCmQVfYj8UGsS4a
   g==;
X-CSE-ConnectionGUID: 7aGRo/nwSQ+pBL3XQJ9oWA==
X-CSE-MsgGUID: ClTnuzz1S/KMKgSUal1cNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61075209"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61075209"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 20:53:04 -0700
X-CSE-ConnectionGUID: Sto4SneERjin9v2aMIzb8Q==
X-CSE-MsgGUID: B1Pu5XXVR2OjRhfcRPTycQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="142919054"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 May 2025 20:53:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK7qf-000VFa-1W;
	Wed, 28 May 2025 03:53:01 +0000
Date: Wed, 28 May 2025 11:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 13/13] include/linux/list.h:70:20:
 warning: storing the address of local variable 'list' in
 '*&ascb_list_9(D)->list.prev'
Message-ID: <202505281100.xKHeBmEr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e95cc0ad46897957309e1dc44abe311daab7d881
commit: 3bd4786c7657e7f2d1f4a106994bcd19eaed51f9 [13/13] Compiler attributes: GCC cold function alignment workarounds
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250528/202505281100.xKHeBmEr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281100.xKHeBmEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281100.xKHeBmEr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pci.h:33,
                    from drivers/scsi/aic94xx/aic94xx_hwi.c:9:
   In function '__list_add',
       inlined from 'asd_ascb_free_list' at drivers/scsi/aic94xx/aic94xx_hwi.h:348:2:
>> include/linux/list.h:70:20: warning: storing the address of local variable 'list' in '*&ascb_list_9(D)->list.prev' [-Wdangling-pointer=]
      70 |         next->prev = new;
         |         ~~~~~~~~~~~^~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h: In function 'asd_ascb_free_list':
   drivers/scsi/aic94xx/aic94xx_hwi.h:345:19: note: 'list' declared here
     345 |         LIST_HEAD(list);
         |                   ^~~~
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
      24 |         struct list_head name = LIST_HEAD_INIT(name)
         |                          ^~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:345:19: note: 'ascb_list' declared here
     345 |         LIST_HEAD(list);
         |                   ^~~~
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
      24 |         struct list_head name = LIST_HEAD_INIT(name)
         |                          ^~~~


vim +70 include/linux/list.h

d7c816733d501b5 Kees Cook        2016-08-17  56  
^1da177e4c3f415 Linus Torvalds   2005-04-16  57  /*
^1da177e4c3f415 Linus Torvalds   2005-04-16  58   * Insert a new entry between two known consecutive entries.
^1da177e4c3f415 Linus Torvalds   2005-04-16  59   *
^1da177e4c3f415 Linus Torvalds   2005-04-16  60   * This is only for internal list manipulation where we know
^1da177e4c3f415 Linus Torvalds   2005-04-16  61   * the prev/next entries already!
^1da177e4c3f415 Linus Torvalds   2005-04-16  62   */
^1da177e4c3f415 Linus Torvalds   2005-04-16  63  static inline void __list_add(struct list_head *new,
^1da177e4c3f415 Linus Torvalds   2005-04-16  64  			      struct list_head *prev,
^1da177e4c3f415 Linus Torvalds   2005-04-16  65  			      struct list_head *next)
^1da177e4c3f415 Linus Torvalds   2005-04-16  66  {
d7c816733d501b5 Kees Cook        2016-08-17  67  	if (!__list_add_valid(new, prev, next))
d7c816733d501b5 Kees Cook        2016-08-17  68  		return;
d7c816733d501b5 Kees Cook        2016-08-17  69  
^1da177e4c3f415 Linus Torvalds   2005-04-16 @70  	next->prev = new;
^1da177e4c3f415 Linus Torvalds   2005-04-16  71  	new->next = next;
^1da177e4c3f415 Linus Torvalds   2005-04-16  72  	new->prev = prev;
1c97be677f72b3c Paul E. McKenney 2015-09-20  73  	WRITE_ONCE(prev->next, new);
^1da177e4c3f415 Linus Torvalds   2005-04-16  74  }
^1da177e4c3f415 Linus Torvalds   2005-04-16  75  

:::::: The code at line 70 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
