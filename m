Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052281;
	b=4dMUZf+gbBV4m6Tnnw4e1pkA3a+jqNQwZ16MMxlbT+8MwD5CPVM2g8XQPVkqTY4rQnzJ
	 1uiKCjb1Ij+l6eurilWfsqdByqGCU7VIbFX9Hi6ffu0VUgTUIQXglrl/Z6hQHpAw9MKsW
	 xgGugKncIOnGAWT4K/CRbDGopNbymbHPzCkjCyy7JJrOupGOIyZcZJ2S0zRlKVBBpbVUn
	 Vp0bqNAoDmJtu6fFtmMRwOjdgz+u02R1qaphlC4PXpvkXw0ApwDSy+iYj0FdTsX+pAY/t
	 N/rvK0TGtaTjXZDcTgfRtssj5AdTXoKZ8aS7WUgE91eEuZYsKqp5MZzXu/Jpny9LGHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052281;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JzJtuaxbVBHPPXsswG5AfUPpySDYW/Cdcswp6CPyHRg=;
	b=DuGiLWNRhcI4jN3/epNKayNHrT/NMHKUK3B1wY8d/dvLZV5fMUHC0OB2UiGRh60rT+Og
	 eOiISFsd8r0sOuW8MjePERNL+RKTMsYiHi2hKPZszob6TXQXcoSwNFgD6LH5s7eldYGn9
	 VgMITwMG0R21C1iMtIiSf6rq468r36UZA2HHHIw3DbOzUvtopqFp65zYprw8fr7mRxzln
	 Dyaw2/tyh6XICxQ8EzhU9xqRNsaSlkK7awA3EluY+CllgxVg0nudeBcTo0Aiz1jNwPEMR
	 NKtKn81XuNLw9fhLFgO7ZR69l9ZC2uF58C+c4WFNfFalsv6umYVu+ZEHfhY5usm3maA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PC00l5by;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822F1606A333
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 01:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822F1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PC00l5by
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795052281; x=1826588281;
  h=date:from:to:cc:subject:message-id;
  bh=tDqFyU+yRiE3m2UQQtly/dlnBBZJndu2ofUpnHDK4IY=;
  b=PC00l5byzGByRxSzBbuGADIrkwysFiSuaSLZI28Y3rSTH4d5t1XN7CGH
   q4Cf1DR0eMjQ3uT5Rh3TIy3GStwIGAPxPtqAYJ06DMeuk2n/xY9Dcc3m0
   FaO4hvPheXobXZJXHe++tXpIhsrwMm5dpjWuEeRUdAnTRxw4gW3SSSg+2
   i75D05UwuSqz6heOVNjr06VjH/QfLq/hvU4BACczpbhsZ3Z5TSqIedREk
   HQFSepPOqaHlGJ8kERlYWQvArw1jXAWxkQAtUg609D/tY1JNEUzcVbD2a
   hIo2Q8ObBtBX8ISjp0Ia8iQV0mh3YpePsyixtmktKiEXzjGFuivb0lzHN
   g==;
X-CSE-ConnectionGUID: /mgSg3zqQyWgBh917v3tKA==
X-CSE-MsgGUID: B/hNGl/tTtusqTDFuu9yJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3892054"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3892054"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:38:00 -0800
X-CSE-ConnectionGUID: JBLRm0ceT9aLU6GKtNAP0g==
X-CSE-MsgGUID: C65+K9z5TneKZ/O1AsVvfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10864591"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2026 17:37:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTr61-000000003aH-3mIq;
	Thu, 19 Nov 2026 01:37:53 +0000
Date: Thu, 19 Nov 2026 02:37:45 +0100
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:type2-revoke 2/13] include/linux/stddef.h:8:14:
 error: called object is not a function or function pointer
Message-ID: <20261119022954.OxxEQ3x0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git type2-revoke
head:   73f29beb504173aa2e12857fddba3a039f6922d9
commit: b081168db6af34744459599b374441b4b2be5a63 [2/13] cxl: Notify Type2 drivers before their region is torn down
config: parisc-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119022954.OxxEQ3x0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119022954.OxxEQ3x0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119022954.OxxEQ3x0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from arch/parisc/include/uapi/asm/stat.h:5,
                    from include/linux/stat.h:6,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/debugfs.h:15,
                    from drivers/cxl/mem.c:3:
   drivers/cxl/mem.c: In function 'cxl_attach_unbind_notify':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   drivers/cxl/cxlmem.h:156:34: note: in expansion of macro 'NULL'
     156 | #define cxl_memdev_attach_disarm NULL
         |                                  ^~~~
   drivers/cxl/mem.c:239:17: note: in expansion of macro 'cxl_memdev_attach_disarm'
     239 |                 cxl_memdev_attach_disarm(attach->cxlmd);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~


vim +8 include/linux/stddef.h

^1da177e4c3f415 Linus Torvalds   2005-04-16  6  
^1da177e4c3f415 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f415 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e2182874324727 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
