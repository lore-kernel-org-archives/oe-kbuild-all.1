Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7EC1C3D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="aAVIWj5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=rFMEHjNeOOmt0vk/J8eUvlo1PdkECbPgHOks40x4QNM=;
  b=aAVIWj5P1uDSKFVVLMDAm14Z46NpG3vikYS9FXf1ak6KPWIeoXxWzAkK
   3eem730q4ah3Il50sSba0ssmZKVOqm7hCF4m7rna7L/CNiDY90IPw5UpX
   XULSSlh0giW5Qz+N65Bgrp48jREulpqBA83Z/jQcir8ndpmeDrRBdHmWf
   Y=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.04,265,1695679200"; 
   d="scan'208";a="73970994"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 15:32:51 +0100
Date: Sun, 10 Dec 2023 15:32:51 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/pushpull 30/32] kernel/time/timer_migration.c:1529:6-9:
 WARNING: Unsigned expression compared with zero: ret     <     0 (fwd)
Message-ID: <alpine.DEB.2.22.394.2312101532350.3198@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sun, 10 Dec 2023 22:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tglx-devel:timers/pushpull 30/32]
    kernel/time/timer_migration.c:1529:6-9: WARNING: Unsigned expression
    compared with zero: ret     <     0

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Anna-Maria Behnsen" <anna-maria@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/pushpull
head:   c5f729902c462bd2f9153641aebe042bbb5f9ede
commit: f7012466efc3b7e5a3220e702ada7e51245caf20 [30/32] timers: Implement the hierarchical pull model
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-101-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102211.FOZEOMnd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312102211.FOZEOMnd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312102211.FOZEOMnd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/time/timer_migration.c:1529:6-9: WARNING: Unsigned expression compared with zero: ret     <     0

vim +1529 kernel/time/timer_migration.c

f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1518
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1519  static int tmigr_cpu_online(unsigned int cpu)
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1520  {
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1521  	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1522  	unsigned int ret;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1523
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1524  	/* First online attempt? Initialize CPU data */
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1525  	if (!tmc->tmgroup) {
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1526  		raw_spin_lock_init(&tmc->lock);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1527
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1528  		ret = tmigr_add_cpu(cpu);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21 @1529  		if (ret < 0)
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1530  			return ret;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1531
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1532  		if (tmc->childmask == 0)
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1533  			return -EINVAL;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1534
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1535  		timerqueue_init(&tmc->cpuevt.nextevt);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1536  		tmc->cpuevt.nextevt.expires = KTIME_MAX;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1537  		tmc->cpuevt.ignore = true;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1538  		tmc->cpuevt.cpu = cpu;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1539
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1540  		tmc->remote = false;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1541  		WRITE_ONCE(tmc->wakeup, KTIME_MAX);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1542  	}
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1543  	raw_spin_lock_irq(&tmc->lock);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1544  	if (timer_base_is_idle())
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1545  		tmc->idle = true;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1546  	else
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1547  		__tmigr_cpu_activate(tmc);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1548  	tmc->online = true;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1549  	raw_spin_unlock_irq(&tmc->lock);
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1550  	return 0;
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1551  }
f7012466efc3b7 Anna-Maria Behnsen 2019-03-21  1552

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
