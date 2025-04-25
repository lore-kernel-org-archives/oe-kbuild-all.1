Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7F949620
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 01:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745545943; cv=none; b=sMi+9396GhAD5lqrFXQxvzqCd1RsY/REAZLAA9G+dZ66j5/OP/OvBIYMh9AFF8bwBfMYYz7ZlbM/THMmKNF05K4AF4n8PJ9yR10UR378dxnAp304GwqerBUa9/SSIxkix+MtFYuo0S9dKh7tEXJUg98hFGr3ORPy3lwU7QDLnFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745545943; c=relaxed/simple;
	bh=/fgwVL3kJajn8hkX9HPAs+1x1w0B/qOzHzuvQsoSJNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4tMTgLWlOMCEG0wmv3ZPTpiXNEstyx6C1n99mFaJGKmYltVifwL4Q+qHowR+g6hxA9LVw0knHPo7ytEKIf/hbbLQwCS+o99ypsOG61HcK4DYrcCZmBdvpcdQxE+FRL/BFstWYcMCnNwwuJYrrvav9wCDJAPox7S1mDyQTCX/+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bB9o5IkP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bB9o5IkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745545941; x=1777081941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/fgwVL3kJajn8hkX9HPAs+1x1w0B/qOzHzuvQsoSJNc=;
  b=bB9o5IkPuwbOkYdp1/RXUj/1pUp8qW2jtPJi1F4xuznU13cydedy0+fg
   LlM5WE7bm+XH4/IWNSvPG/2Vf99Ky/npSQyFH271/G+FyAJmJRngyuUUO
   x4NI4U2HDBuTD7smYwwY6xkXq9mJ+dJ8Pco4o9bXi3hZuWQnA4PTKusaH
   JveMfbgL0eP2VMRxcmB91g7OR0VujGCKtlTe0K6sFs4FuzJd9gl3izDmN
   aahu1S+KeRXA4xAF8lL0Spq9mU3RyA2Mk+dg0ylQcbMQdcq/ky9806s0s
   xY/bE8DvJhl7dcIurFF1tcm07/q+8q59uKkVY5JoOA3bn1wKEBroy94Y4
   Q==;
X-CSE-ConnectionGUID: ZzlsIY4TQ6S5rB8+LXwIfg==
X-CSE-MsgGUID: OUkgVTulREaQtpACWBi23g==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50866346"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="50866346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 18:52:17 -0700
X-CSE-ConnectionGUID: uv+FoalAQteWLzoATnFFOA==
X-CSE-MsgGUID: NRBvSTYDQjid/zzgkhyhOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="137858295"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2025 18:52:15 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u88Ef-0004in-12;
	Fri, 25 Apr 2025 01:52:13 +0000
Date: Fri, 25 Apr 2025 09:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 19/19] include/linux/list.h:70:20:
 warning: storing the address of local variable 'list' in
 '*&ascb_list_9(D)->list.prev'
Message-ID: <202504250930.gG6uhkjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   4bad2cd1902185593ae2d7cdf67ac43d5aa2dfe9
commit: 3bd4786c7657e7f2d1f4a106994bcd19eaed51f9 [19/19] Compiler attributes: GCC cold function alignment workarounds
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250425/202504250930.gG6uhkjt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250930.gG6uhkjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250930.gG6uhkjt-lkp@intel.com/

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
^1da177e4c3f41 Linus Torvalds   2005-04-16 @70  	next->prev = new;
^1da177e4c3f41 Linus Torvalds   2005-04-16  71  	new->next = next;
^1da177e4c3f41 Linus Torvalds   2005-04-16  72  	new->prev = prev;
1c97be677f72b3 Paul E. McKenney 2015-09-20  73  	WRITE_ONCE(prev->next, new);
^1da177e4c3f41 Linus Torvalds   2005-04-16  74  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  75  

:::::: The code at line 70 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
