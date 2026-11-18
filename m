Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017966;
	b=KFOFwbCC4xLaoVldbLg2oUQaifqyTxPXA/PgcBzEasnGbCGrUUFh37eMMQraiq9mT1d5
	 ff5RP0F9447dIRHlAtCMP9+7RWbkhCXGxNyFsVGEblC+5+dyvTLteSgsksGAeq13FuVGC
	 LOjAz3E8M9lSq7YlyeY+a7NFMfWYeI/jwguaT1qnWMJxXr9L4Xg4hhEIN2B700ztMo7PZ
	 yT61d69WHhWIl8Q1pXOnmeR2S+n6YO5nAZ2+JdjaXZoa3/zdLmQPlgLjtEm8TM8kXRgdl
	 muAccjNHxTJ10H9oMQ4U3YKCISc+va6Yuz20Xygj/tDY3Qbn7cxKIo6o6spitzIB4tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017966;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TzCfIZixRQmaszpi1CHXES2rA3JRIbMRc4P2ibJAU1s=;
	b=bvTtL2a9hXMmG43lFAy2VvbrlEFx6IzlszqbVTbRzve4N7oAD2wVi9JdhacqEjUL7YHe
	 8SCJu0ErSl9BFHAkdqAdZ+Ng2LPtiuo1zntQrmWayIGsw94vlwfsDIYBXRg5Ak257KAxf
	 b0rJ/85SD1mdk1dEU96+NqGLSA25Zrv1aEV1KC/JM/ZG13fjLYoik3zgQa17EQCijurpO
	 NH/3t+8P8FnEvVrrzgsyCBA1eFk641Le/39lMT8RLXCHp1li3a7ql6clS8jrO8ZOVljzA
	 zU6v2VnduVRt9AcY3qXRe5ihQFdMNgxdGeSfK2CI3pbLPYgTop8SBDT6x1nK+PoW1Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mv1H9mXz;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33989606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 16:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33989606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mv1H9mXz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795017966; x=1826553966;
  h=date:from:to:cc:subject:message-id;
  bh=rnSajuY2/46tPLBL6ecMQzQ2v7HUhhZPM1wCCVRN6J4=;
  b=Mv1H9mXz1KyrFydxn+52awx+mKscpuSQm73gr0EFXdVCw5dPLgl71BdI
   Rxz8PEU6fDAnKYwE1f0jGWaoBJjR33G0FGRqiw4tTUQUmJofSV6epinxc
   9nhSS5/J7gxspHFVvbOTZxshS1lNfQ6dA2l8MiQI8QfzsdsCHgstj26Rc
   G1xwwpKpS80zRMo7ls70pk9NGOUF8Bc0JsD4rgmZf8ApxZexAi2KHwc8k
   CV4AwUvhJfVcxtqDyPH0Yax5V2340pBlcxgqL/gCBlVHgtfGoBA7wSyul
   PAjq+UYmpejnUAsTlFbah27Q3fgIZgxL9L8Ob/S4U3AmrVoCHJEb2K5gQ
   w==;
X-CSE-ConnectionGUID: r80jRhhMRWGGiIJMILy9Dg==
X-CSE-MsgGUID: zPi1vjWVQ4+kz6YC9PVTNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3826239"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3826239"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:06:04 -0800
X-CSE-ConnectionGUID: PMO1CinQQLmZ3otMOqyjDQ==
X-CSE-MsgGUID: Ztq/VeV7REWF5EKPB3HOPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10573438"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2026 08:06:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTiAb-000000003QU-0TR2;
	Wed, 18 Nov 2026 16:06:01 +0000
Date: Wed, 18 Nov 2026 17:05:32 +0100
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 24/44] drivers/tty/tty_jobctrl.c:81:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <20261118165552.hIqx6N4d-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   1efe42321ef5d10bbcc545a533befa0ee30acfa5
commit: 232e9ffc112aa965cbd3857c61f71acc2d0ae673 [24/44] tty_jobctrl: use guard
config: powerpc-randconfig-r2306-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118165552.hIqx6N4d-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118165552.hIqx6N4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118165552.hIqx6N4d-lkp@intel.com/

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
