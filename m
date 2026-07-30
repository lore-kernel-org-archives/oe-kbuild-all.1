Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360B3B52E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 05:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785390087; cv=none; b=VD66sO/rXOd0sDhm5yXLQ9r/URq3gdPKWqBPHF8NRh+zmn82T1xlhOUdPyddtFUXaK2ko/hm9ki7bQACT/MrpQ2R44dqyYlVVJYNighqSW4eTPPBePXje3iOe3kM7ZdIzIKJBuTPUuBw9VmxYMHcx5rLjNMy2bWoD7xD78jyhf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785390087; c=relaxed/simple;
	bh=pYt30x/vAzMLMGbbVZ1K6ZyVS/x6gFbSPedi3sWXQno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZGNYs0fgYWB1pYLhCt/CAgCVHTo3z4xrCu/2mVsyV/+QN9WRef0NEyIdgOGeXLRNjzPwAoq4jn1jQK+BlCaXgP4PE5IroCOp2mghDkAsVJNyookviBNzCdxIBVXu2W8LKkxAgnJm8MofWzUMu8kfFtmPQCxrNi8pWQnANYYJ0Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USB3vPkf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USB3vPkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785390084; x=1816926084;
  h=date:from:to:cc:subject:message-id;
  bh=pYt30x/vAzMLMGbbVZ1K6ZyVS/x6gFbSPedi3sWXQno=;
  b=USB3vPkfreq/MmuW1NiIWFOWFFAKCt/dvcD0iTvcIzWCfEMd1Z+IWQe+
   JbzwZ2yN77kXa6ZtI2GzEWljyqo66Vvu6gkTwMa99DpGEAyq1BejYQ9EK
   b+t4gb7hHY39veN9FjQKsA7kpq56O9XJJXrvssSTJQ2oJT3N7qHOhnNwt
   2KxntdRmqKjspkLL/DPB61t3AmsU59f65Ds8fYjyO5SUKlI3h43/eFnUN
   29zWJqk8P1VhRG5/kwwRBw0Hm3K8Lg5JzSGSfWAAjXLaNJ4sEKEZTIQ7n
   YNmiZHoDig5SChbv7zWbiTq3/qx5bAgOZIZokhc1PbjrviiabjWsi85Jx
   g==;
X-CSE-ConnectionGUID: twmw3ucuQ02coCxCWG/bDQ==
X-CSE-MsgGUID: JzWUyNp0TzG/iXDiHAdMpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85765443"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="85765443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 22:41:24 -0700
X-CSE-ConnectionGUID: sN7/Y+21RySav36VLMh/Zw==
X-CSE-MsgGUID: HlRf0CbVRdmq+31j+dH1tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="262160390"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jul 2026 22:41:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpJW9-00000000g70-0zxl;
	Thu, 30 Jul 2026 05:41:17 +0000
Date: Thu, 30 Jul 2026 13:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 19/33] drivers/tty/tty_jobctrl.c:81:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202607301356.Ao2WFOAM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   669a01e6370e97909bed21cbd5f5548ace604a59
commit: 2124d9e4207beb048693453df5a4ca8aa732ee7f [19/33] tty_jobctrl: use guard
config: x86_64-randconfig-123-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301356.Ao2WFOAM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301356.Ao2WFOAM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301356.Ao2WFOAM-lkp@intel.com/

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
   drivers/tty/tty_jobctrl.c:316:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:316:9: sparse:     expected struct spinlock [usertype] *_T
   drivers/tty/tty_jobctrl.c:316:9: sparse:     got struct spinlock [noderef] __rcu *
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
