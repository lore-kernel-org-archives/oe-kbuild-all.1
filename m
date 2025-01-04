Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D321C5F14
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736005621; cv=none; b=BT/0ADWCmAGbJGYyc1T3zD3JSADH4FEf26LtQuU6BjaGhpy2Zy4zKshO9ZMs7kQtENEo+X1PMxAxMcz6pJ8L2QGYph6BqZ2c2aDqzsxrvcL2y/b7qnCchc60emTwEfTzj9u/tBQ1AhM33eOW1pqemqICP0RLS/VmaAAzEdQKVx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736005621; c=relaxed/simple;
	bh=cDoCB8ly4BngNLiaGd43l/gh0k6AEb2hA2PowVYd5B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnExzxWwQntWB6D9zrv2mcNcwtaftAyTAqExkKxQCj1OmQaEGcqA5fp5BcV3Q0zkzfLQFqG5gB/0cxKZ9WblYBYUATwQwc0dPdsLDws/2GxSv44fUzxDVgkE9V90l05MHyAPoKwPX/Bxa15Go/eJVs6uVHOibUO/9l1Jupr5eGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUiJ//zS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUiJ//zS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736005619; x=1767541619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDoCB8ly4BngNLiaGd43l/gh0k6AEb2hA2PowVYd5B4=;
  b=bUiJ//zSVvBBo+v5vC5JFIPKrDk+Cim3d+FpHgsuxGvqNubGp0YnRYbK
   sXSicDA5z6YIAGak7C2+1JbtloRhlRMqi5Gv39CSZRcHiwV1jbHzbrCKr
   RTz3Tmk2T1kv4yPbwylAiSTU9T+ChUKTiPG4xed+no02FFcXU++RZFMM4
   h1G/+MV7nzKaaaSnAyKYOjIact9q2F5tQM7Q5Vvxx4fuZ2CHLhfOYcErw
   lw7JLDCipHvd6rNE6KvTO1+jNUnGFkiEkXNbxPqtBdQoIWqRwIZfvS4RK
   poq1aqTvQwmGBhR9z85ZJppIHiM3F0UASKITyDJXvlUGZ1HEiXpbnattB
   Q==;
X-CSE-ConnectionGUID: 8TdclY3+Qlu49dn/KFHVpQ==
X-CSE-MsgGUID: 7DhsqzDZQRW0PT8k5sP2/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="61591875"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="61591875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 07:46:58 -0800
X-CSE-ConnectionGUID: BUwNkeFxT+u1+x5IKoJhUg==
X-CSE-MsgGUID: r0bGyvbtRvKe7vAK+caTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="101861133"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jan 2025 07:46:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU6MY-000B1U-2D;
	Sat, 04 Jan 2025 15:46:54 +0000
Date: Sat, 4 Jan 2025 23:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:3135:63: warning: '-mq-poll'
 directive output may be truncated writing 8 bytes into a region of size
 between 6 and 31
Message-ID: <202501042342.wWL4vQFF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sreekanth,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 432bc7caef4eaacc1101ee2569bb870bdfeed7ce scsi: mpt3sas: Add io_uring iopoll support
date:   3 years, 5 months ago
config: csky-randconfig-r053-20231127 (https://download.01.org/0day-ci/archive/20250104/202501042342.wWL4vQFF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501042342.wWL4vQFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501042342.wWL4vQFF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpt3sas/mpt3sas_base.c: In function '_base_request_irq':
   drivers/scsi/mpt3sas/mpt3sas_base.c:3144:68: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 26 [-Wformat-truncation=]
    3144 |                 snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                                                                    ^~
   drivers/scsi/mpt3sas/mpt3sas_base.c:3144:58: note: directive argument in the range [0, 254]
    3144 |                 snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                                                          ^~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:3144:17: note: 'snprintf' output between 8 and 35 bytes into a destination of size 32
    3144 |                 snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3145 |                     ioc->driver_name, ioc->id, index);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/mpt3sas/mpt3sas_base.c:3135:63: warning: '-mq-poll' directive output may be truncated writing 8 bytes into a region of size between 6 and 31 [-Wformat-truncation=]
    3135 |                 snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-mq-poll%d",
         |                                                               ^~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:3135:58: note: directive argument in the range [-255, 255]
    3135 |                 snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-mq-poll%d",
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:3135:17: note: 'snprintf' output between 11 and 39 bytes into a destination of size 32
    3135 |                 snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-mq-poll%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3136 |                     ioc->driver_name, ioc->id, qid);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c: In function 'mpt3sas_base_start_watchdog':
   drivers/scsi/mpt3sas/mpt3sas_base.c:831:57: warning: '%s' directive output may be truncated writing up to 23 bytes into a region of size 15 [-Wformat-truncation=]
     831 |             sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                                         ^~
   drivers/scsi/mpt3sas/mpt3sas_base.c:831:51: note: directive argument in the range [0, 255]
     831 |             sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                                   ^~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:830:9: note: 'snprintf' output between 14 and 39 bytes into a destination of size 20
     830 |         snprintf(ioc->fault_reset_work_q_name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     831 |             sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     832 |             ioc->driver_name, ioc->id);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +3135 drivers/scsi/mpt3sas/mpt3sas_base.c

  3107	
  3108	/**
  3109	 * _base_request_irq - request irq
  3110	 * @ioc: per adapter object
  3111	 * @index: msix index into vector table
  3112	 *
  3113	 * Inserting respective reply_queue into the list.
  3114	 */
  3115	static int
  3116	_base_request_irq(struct MPT3SAS_ADAPTER *ioc, u8 index)
  3117	{
  3118		struct pci_dev *pdev = ioc->pdev;
  3119		struct adapter_reply_queue *reply_q;
  3120		int r, qid;
  3121	
  3122		reply_q =  kzalloc(sizeof(struct adapter_reply_queue), GFP_KERNEL);
  3123		if (!reply_q) {
  3124			ioc_err(ioc, "unable to allocate memory %zu!\n",
  3125				sizeof(struct adapter_reply_queue));
  3126			return -ENOMEM;
  3127		}
  3128		reply_q->ioc = ioc;
  3129		reply_q->msix_index = index;
  3130	
  3131		atomic_set(&reply_q->busy, 0);
  3132	
  3133		if (index >= ioc->iopoll_q_start_index) {
  3134			qid = index - ioc->iopoll_q_start_index;
> 3135			snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-mq-poll%d",
  3136			    ioc->driver_name, ioc->id, qid);
  3137			reply_q->is_iouring_poll_q = 1;
  3138			ioc->io_uring_poll_queues[qid].reply_q = reply_q;
  3139			goto out;
  3140		}
  3141	
  3142	
  3143		if (ioc->msix_enable)
  3144			snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
  3145			    ioc->driver_name, ioc->id, index);
  3146		else
  3147			snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d",
  3148			    ioc->driver_name, ioc->id);
  3149		r = request_irq(pci_irq_vector(pdev, index), _base_interrupt,
  3150				IRQF_SHARED, reply_q->name, reply_q);
  3151		if (r) {
  3152			pr_err("%s: unable to allocate interrupt %d!\n",
  3153			       reply_q->name, pci_irq_vector(pdev, index));
  3154			kfree(reply_q);
  3155			return -EBUSY;
  3156		}
  3157	out:
  3158		INIT_LIST_HEAD(&reply_q->list);
  3159		list_add_tail(&reply_q->list, &ioc->reply_queue_list);
  3160		return 0;
  3161	}
  3162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
