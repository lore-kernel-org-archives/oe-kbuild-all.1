Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9099B38DC62
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463748; cv=none; b=tanhTQ8GG04wS0G2hilYLT+Fcp8EhEzMIx2EBufr3DNuL1xYDn9uZUMG4410aUz824yfh6wANjmfzLUsQiHs8M5KH2hZvqBwG1HWeMSj2+5XLTdknbXr5uJmLdXkHMhesdEyXxoKkLhndi3lRX1e+nsm6PF6fEel+t3erqFuPsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463748; c=relaxed/simple;
	bh=4WV4FbJTeKuPrZemPaQvtu/WzKxYDMo8YF7q9WMZU4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tyHBrOAB4uMw6u6waOks+jRzlz2GXjQsaFS0X45PEcHFGUdPmSsXkHF7J3hWicx0xRQLWNkZ/szsJDn1HJquu5eFeW81f01g8Kwq4UgjNDJQ/Ser/s8y/caaMOLe36wnRbz+IyMV47a2LJ3N9oAnDiIA4MUWs3xxVCqRWGZtx6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7ksabuV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7ksabuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791463746; x=1822999746;
  h=date:from:to:cc:subject:message-id;
  bh=4WV4FbJTeKuPrZemPaQvtu/WzKxYDMo8YF7q9WMZU4U=;
  b=I7ksabuVjIFUar2BJoOgZFi7aGwltD5jUbY7Rj+stapPTTmAe9ckdp2r
   o7crQgyELuQyxxFvKEKWuxvzwjWJtCYegbd45caB7YiB1XW1zglvhtqdE
   k7TgaaAgeKCuSkEf1R7abkEBQQFD5ixyZyrNsdDiUTwJnAu16LCspnypN
   yldGfS35YZJdvn0pwWS/UnAG6+hUpoln3LWdL+p+HSFCPlg0RddQP8ApT
   jv3HWUhAgZlTRdm1vlNnkZo0mn67KQjf1oysw3KOJ/4uY04+CGQJpb6Kd
   LPs6KjLEbRTMKwSWdcIidGSAOJu2vs8cb/ofObj2t8odwAOCL5K7Lxe8+
   w==;
X-CSE-ConnectionGUID: 2deXlN2kQeKAtE0Kzt4EUQ==
X-CSE-MsgGUID: vQMeUKBRQwak328CS3vI8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="270908"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="270908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 05:49:06 -0700
X-CSE-ConnectionGUID: H30yoWwcTHSzeHZd3rOXrA==
X-CSE-MsgGUID: jwTp3o9rQxSEsdMN5JrgLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="56065"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Oct 2026 05:49:04 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEnYU-000000005Sg-3KGP;
	Thu, 08 Oct 2026 12:49:02 +0000
Date: Thu, 08 Oct 2026 14:48:41 +0200
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 24/45] drivers/tty/tty_jobctrl.c:81:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202610081449.FyXbwlC5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   28cbfabc2a887eee4c21c54cc78e2d41ef4c5c34
commit: ba25057f2aac2cfc74cf3f6ab1202afa43146dce [24/45] tty_jobctrl: use guard
config: arm-randconfig-r2307-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081449.FyXbwlC5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081449.FyXbwlC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081449.FyXbwlC5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/tty_jobctrl.c:81:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:81:9: sparse:     expected struct spinlock [usertype] *_T
   drivers/tty/tty_jobctrl.c:81:9: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:124:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:124:9: sparse:     expected struct spinlock [usertype] *_T
   drivers/tty/tty_jobctrl.c:124:9: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:134:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:134:9: sparse:     expected struct spinlock [usertype] *_T
   drivers/tty/tty_jobctrl.c:134:9: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:160:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:160:9: sparse:     expected struct spinlock [usertype] *_T
   drivers/tty/tty_jobctrl.c:160:9: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:198:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:198:25: sparse:     expected struct spinlock [usertype] *_T
   drivers/tty/tty_jobctrl.c:198:25: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:209:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:209:51: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:209:51: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:285:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:285:17: sparse:     expected struct spinlock [usertype] *_T
   drivers/tty/tty_jobctrl.c:285:17: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:314:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:314:9: sparse:     expected struct spinlock [usertype] *_T
   drivers/tty/tty_jobctrl.c:314:9: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:20:41: sparse: sparse: dereference of noderef expression

vim +81 drivers/tty/tty_jobctrl.c

    76	
    77	void proc_clear_tty(struct task_struct *p)
    78	{
    79		struct tty_struct *tty;
    80	
  > 81		scoped_guard(spinlock_irqsave, &p->sighand->siglock) {
    82			tty = p->signal->tty;
    83			p->signal->tty = NULL;
    84		}
    85		tty_kref_put(tty);
    86	}
    87	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
