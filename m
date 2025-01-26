Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE170839
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 06:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737874258; cv=none; b=CiNCY8AV5LGlUWdjbCh3dQoH4p+YPmkN3g2P/9B5GUc/65gGGH5UJ2iMT+EpyOz99L0GsWwUKv3O+DKe3jm+H6sAKkdRkTdaSzu2ohcoEIe/PGY9qAmvAONDM4NZPTUvFkRkrhOndBMFpIUnSm1MhCoND4aWw2e8U5dKrHwUDUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737874258; c=relaxed/simple;
	bh=91GPVpRcn+GtQz/ZHZk2ug91strsYqWEysIFQHAz5NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ReSZL2KXWkqwpjCy4Gyp3oWX6u2t7/jaTzWhkr7ZOABRL60StK8WIdGnWdeFag3SyVQUAveWMmiJ0LnGu+iS+oXdFtXiwdcgp7R6dkm84vjOxvzjCXweEB2K0FpomkzCg+dLi0EhgmmuM1aiaPvnsJRvu8IkiZxc/jmS4cDcndA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpFs8kR8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpFs8kR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737874255; x=1769410255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91GPVpRcn+GtQz/ZHZk2ug91strsYqWEysIFQHAz5NQ=;
  b=EpFs8kR85xzV8/q/16ufFcqS3h6pkuPuopBBrEJ88iGiR4UT8Lc5JXYx
   90wrQo5MoyxlG+w6iV10SrgEpX+vVZrHWnt0kvpkGIks4DrcWFh8uwxEd
   uGZUiCVcr0j/l0aQ++YSXHQEzq6MykaaUjvsClkuo/Gfj2voON7YoD5Db
   Ani+ym39OisYk2blnrxDuqD7FFOyLW0Uh0Kn/n/NBw0yMy1XjmZEUbSui
   X0nS9KakeqF8BycbWT3LIBi3Fn9olWbvSRSs6/EdTafNLdv8wain4WSWq
   9E+SRXGlJqFHcN29YWrd0ktv1gPgmgqKRtjW6Q2TzhaNENArG39tLu/Og
   g==;
X-CSE-ConnectionGUID: 6gfekTPnT/afrBS1Hyi6gA==
X-CSE-MsgGUID: KqhHWoTYR/6bnRYvpGR1Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="37563454"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="37563454"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 22:50:54 -0800
X-CSE-ConnectionGUID: JiMfXaRtQxySeSS8+KPUqA==
X-CSE-MsgGUID: Zp2aErYBQT6hmp2l38yvAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113290624"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2025 22:50:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbwTq-000f0b-0F;
	Sun, 26 Jan 2025 06:50:50 +0000
Date: Sun, 26 Jan 2025 14:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Hannes Reinecke <hare@suse.de>, Tomas Henzl <thenzl@redhat.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_os.c:210:33: warning: '%d' directive
 writing between 1 and 3 bytes into a region of size between 1 and 32
Message-ID: <202501261443.81MGH9ea-lkp@intel.com>
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
commit: 824a156633dfdb0e17979a0d0bb2c757d1bb949c scsi: mpi3mr: Base driver code
date:   3 years, 8 months ago
config: x86_64-randconfig-r121-20240105 (https://download.01.org/0day-ci/archive/20250126/202501261443.81MGH9ea-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261443.81MGH9ea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501261443.81MGH9ea-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpi3mr/mpi3mr_os.c: In function 'mpi3mr_probe':
>> drivers/scsi/mpi3mr/mpi3mr_os.c:210:33: warning: '%d' directive writing between 1 and 3 bytes into a region of size between 1 and 32 [-Wformat-overflow=]
     210 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |                                 ^~
   drivers/scsi/mpi3mr/mpi3mr_os.c:210:30: note: directive argument in the range [0, 255]
     210 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |                              ^~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c:210:9: note: 'sprintf' output between 2 and 35 bytes into a destination of size 32
     210 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/scsi/mpi3mr/mpi3mr_fw.c: In function 'mpi3mr_setup_isr':
>> drivers/scsi/mpi3mr/mpi3mr_fw.c:360:58: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     360 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |                                                          ^~
   In function 'mpi3mr_request_irq',
       inlined from 'mpi3mr_setup_isr' at drivers/scsi/mpi3mr/mpi3mr_fw.c:428:12:
   drivers/scsi/mpi3mr/mpi3mr_fw.c:360:55: note: directive argument in the range [0, 255]
     360 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |                                                       ^~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:360:55: note: directive argument in the range [0, 65507]
   drivers/scsi/mpi3mr/mpi3mr_fw.c:360:9: note: 'snprintf' output between 8 and 45 bytes into a destination of size 32
     360 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     361 |             mrioc->driver_name, mrioc->id, index);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/scsi/mpi3mr/mpi3mr_fw.c:1477:9: note: in expansion of macro 'ioc_info'
    1477 |         ioc_info(mrioc, "IOC in %s state during detection\n",
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
   drivers/scsi/mpi3mr/mpi3mr_fw.c:1488:17: note: in expansion of macro 'ioc_info'
    1488 |                 ioc_info(mrioc,
         |                 ^~~~~~~~


vim +210 drivers/scsi/mpi3mr/mpi3mr_os.c

   177	
   178	/**
   179	 * mpi3mr_probe - PCI probe callback
   180	 * @pdev: PCI device instance
   181	 * @id: PCI device ID details
   182	 *
   183	 * controller initialization routine. Checks the security status
   184	 * of the controller and if it is invalid or tampered return the
   185	 * probe without initializing the controller. Otherwise,
   186	 * allocate per adapter instance through shost_priv and
   187	 * initialize controller specific data structures, initializae
   188	 * the controller hardware, add shost to the SCSI subsystem.
   189	 *
   190	 * Return: 0 on success, non-zero on failure.
   191	 */
   192	
   193	static int
   194	mpi3mr_probe(struct pci_dev *pdev, const struct pci_device_id *id)
   195	{
   196		struct mpi3mr_ioc *mrioc = NULL;
   197		struct Scsi_Host *shost = NULL;
   198		int retval = 0;
   199	
   200		shost = scsi_host_alloc(&mpi3mr_driver_template,
   201		    sizeof(struct mpi3mr_ioc));
   202		if (!shost) {
   203			retval = -ENODEV;
   204			goto shost_failed;
   205		}
   206	
   207		mrioc = shost_priv(shost);
   208		mrioc->id = mrioc_ids++;
   209		sprintf(mrioc->driver_name, "%s", MPI3MR_DRIVER_NAME);
 > 210		sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
   211		INIT_LIST_HEAD(&mrioc->list);
   212		spin_lock(&mrioc_list_lock);
   213		list_add_tail(&mrioc->list, &mrioc_list);
   214		spin_unlock(&mrioc_list_lock);
   215	
   216		spin_lock_init(&mrioc->admin_req_lock);
   217		spin_lock_init(&mrioc->reply_free_queue_lock);
   218		spin_lock_init(&mrioc->sbq_lock);
   219	
   220		mpi3mr_init_drv_cmd(&mrioc->init_cmds, MPI3MR_HOSTTAG_INITCMDS);
   221	
   222		mrioc->logging_level = logging_level;
   223		mrioc->shost = shost;
   224		mrioc->pdev = pdev;
   225	
   226		/* init shost parameters */
   227		shost->max_cmd_len = MPI3MR_MAX_CDB_LENGTH;
   228		shost->max_lun = -1;
   229		shost->unique_id = mrioc->id;
   230	
   231		shost->max_channel = 1;
   232		shost->max_id = 0xFFFFFFFF;
   233	
   234		mrioc->is_driver_loading = 1;
   235		if (mpi3mr_init_ioc(mrioc)) {
   236			ioc_err(mrioc, "failure at %s:%d/%s()!\n",
   237			    __FILE__, __LINE__, __func__);
   238			retval = -ENODEV;
   239			goto out_iocinit_failed;
   240		}
   241	
   242		shost->nr_hw_queues = mrioc->num_op_reply_q;
   243		shost->can_queue = mrioc->max_host_ios;
   244		shost->sg_tablesize = MPI3MR_SG_DEPTH;
   245		shost->max_id = mrioc->facts.max_perids;
   246	
   247		retval = scsi_add_host(shost, &pdev->dev);
   248		if (retval) {
   249			ioc_err(mrioc, "failure at %s:%d/%s()!\n",
   250			    __FILE__, __LINE__, __func__);
   251			goto addhost_failed;
   252		}
   253	
   254		scsi_scan_host(shost);
   255		return retval;
   256	
   257	addhost_failed:
   258		mpi3mr_cleanup_ioc(mrioc);
   259	out_iocinit_failed:
   260		spin_lock(&mrioc_list_lock);
   261		list_del(&mrioc->list);
   262		spin_unlock(&mrioc_list_lock);
   263		scsi_host_put(shost);
   264	shost_failed:
   265		return retval;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
