Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A321A13AA20
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737898660; cv=none; b=fFQfCEYSgkf2FdyKUL80JZX4WV4qoyLKUuZ8iKgd8YGCriwqtvJOueutj9T29Lgg1nNsT9ElJpZJOk2lC0c0HbGhsmGM0TVnjd3oF2m84qdrxFpDc0ImdgBACcnoBrqz7Hw9x0Dz955hLehaYEHHNXED73o/7tYwG8R76NNUppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737898660; c=relaxed/simple;
	bh=GrVrASTuaNzT9u+43PdMjTaePkNR/C76pvu0Vfd3JJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C6ZmJWlgsdiZdkW/rsFHv9gt4VbV0SGu7qS9H+yMJmYIGix7i2aIFf3ZjLmSKfsmpQtRyUHXdPzmeKgziknYn0icZe7roXqzsk9eE5O+Ea/Tbl/ddfJGv9jkT8K3xITJ38NyCe3y+aPFXCi8ywxCwxCepO7ZxaLuRjeUFG8XEjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeMdkCum; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeMdkCum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737898658; x=1769434658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GrVrASTuaNzT9u+43PdMjTaePkNR/C76pvu0Vfd3JJc=;
  b=QeMdkCumDpNerQgcdeSdnku0rCtev07dEDNclnMBR29TBxfXUc/Qyyni
   ENOfPZR2+nHgFM9AQBh1jz7e+Rq15AFG1C0nXNR3fpD7NlTmW37+x0yck
   C9i9RyhsA/8TcnB6x2Wq2sKhNrvOTbIM4KTH9Dly03Obs+F/Lz09HgD0S
   WuIiIkd51ZxxwaYsWVdcvml0QlCJYPEBBvm4EKWM7cjsy7x1CNZBtA4Ct
   cZUqdBBWBwrJ1CUN9sba8uZSdOKbEqrBk9zrZSCbm7PzwahW2BdRq3cYJ
   G7o9Z7+nQc1iP/M67PadDl23GnzPuX8bFtlHyahsyhXiu688o2uIgTnLU
   Q==;
X-CSE-ConnectionGUID: fjaPfCI5TiqUscbCVFe1xg==
X-CSE-MsgGUID: VMlPQyQaR+eMt4pR8ksQmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38628671"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="38628671"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 05:37:37 -0800
X-CSE-ConnectionGUID: y2qw5ozeSLSAX5xVbiQblQ==
X-CSE-MsgGUID: hFFY01IPR223V/ccgP9ubA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="113187888"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jan 2025 05:37:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc2pR-000fOR-0w;
	Sun, 26 Jan 2025 13:37:33 +0000
Date: Sun, 26 Jan 2025 21:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Hannes Reinecke <hare@suse.de>, Tomas Henzl <thenzl@redhat.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_fw.c:1549:60: warning: '%s' directive
 output may be truncated writing up to 31 bytes into a region of size 11
Message-ID: <202501262141.CoWXdqty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kashyap,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aa22f4da2a46b484a257d167c67a2adc1b7aaf68
commit: 672ae26c82166d63e0352403b7ea16ab4705edc1 scsi: mpi3mr: Add support for internal watchdog thread
date:   3 years, 8 months ago
config: x86_64-randconfig-r121-20240105 (https://download.01.org/0day-ci/archive/20250126/202501262141.CoWXdqty-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501262141.CoWXdqty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501262141.CoWXdqty-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpi3mr/mpi3mr_fw.c: In function 'mpi3mr_setup_isr':
   drivers/scsi/mpi3mr/mpi3mr_fw.c:453:58: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     453 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |                                                          ^~
   In function 'mpi3mr_request_irq',
       inlined from 'mpi3mr_setup_isr' at drivers/scsi/mpi3mr/mpi3mr_fw.c:528:12:
   drivers/scsi/mpi3mr/mpi3mr_fw.c:453:55: note: directive argument in the range [0, 255]
     453 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |                                                       ^~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:453:55: note: directive argument in the range [0, 65507]
   drivers/scsi/mpi3mr/mpi3mr_fw.c:453:9: note: 'snprintf' output between 8 and 45 bytes into a destination of size 32
     453 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     454 |             mrioc->driver_name, mrioc->id, index);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c: In function 'mpi3mr_start_watchdog':
>> drivers/scsi/mpi3mr/mpi3mr_fw.c:1549:60: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size 11 [-Wformat-truncation=]
    1549 |             sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
         |                                                            ^~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:1549:50: note: directive argument in the range [0, 255]
    1549 |             sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
         |                                                  ^~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:1548:9: note: 'snprintf' output between 11 and 44 bytes into a destination of size 20
    1548 |         snprintf(mrioc->watchdog_work_q_name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1549 |             sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1550 |             mrioc->id);
         |             ~~~~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:17,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from include/linux/blkdev.h:5,
                    from drivers/scsi/mpi3mr/mpi3mr.h:13,
                    from drivers/scsi/mpi3mr/mpi3mr_fw.c:10:
   drivers/scsi/mpi3mr/mpi3mr_fw.c: In function 'mpi3mr_init_ioc':
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:373:16: note: in expansion of macro 'KERN_INFO'
     373 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_debug.h:51:9: note: in expansion of macro 'pr_info'
      51 |         pr_info("%s: " fmt, (ioc)->name, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:2427:9: note: in expansion of macro 'ioc_info'
    2427 |         ioc_info(mrioc, "IOC in %s state during detection\n",
         |         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:373:16: note: in expansion of macro 'KERN_INFO'
     373 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_debug.h:51:9: note: in expansion of macro 'pr_info'
      51 |         pr_info("%s: " fmt, (ioc)->name, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:2438:17: note: in expansion of macro 'ioc_info'
    2438 |                 ioc_info(mrioc,
         |                 ^~~~~~~~


vim +1549 drivers/scsi/mpi3mr/mpi3mr_fw.c

  1532	
  1533	/**
  1534	 * mpi3mr_start_watchdog - Start watchdog
  1535	 * @mrioc: Adapter instance reference
  1536	 *
  1537	 * Create and start the watchdog thread to monitor controller
  1538	 * faults.
  1539	 *
  1540	 * Return: Nothing.
  1541	 */
  1542	void mpi3mr_start_watchdog(struct mpi3mr_ioc *mrioc)
  1543	{
  1544		if (mrioc->watchdog_work_q)
  1545			return;
  1546	
  1547		INIT_DELAYED_WORK(&mrioc->watchdog_work, mpi3mr_watchdog_work);
  1548		snprintf(mrioc->watchdog_work_q_name,
> 1549		    sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
  1550		    mrioc->id);
  1551		mrioc->watchdog_work_q =
  1552		    create_singlethread_workqueue(mrioc->watchdog_work_q_name);
  1553		if (!mrioc->watchdog_work_q) {
  1554			ioc_err(mrioc, "%s: failed (line=%d)\n", __func__, __LINE__);
  1555			return;
  1556		}
  1557	
  1558		if (mrioc->watchdog_work_q)
  1559			queue_delayed_work(mrioc->watchdog_work_q,
  1560			    &mrioc->watchdog_work,
  1561			    msecs_to_jiffies(MPI3MR_WATCHDOG_INTERVAL));
  1562	}
  1563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
