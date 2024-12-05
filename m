Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD21B87C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 21:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733435046; cv=none; b=aL8ULDqbOhI8LSqF5Zuu6YEH2gdpZBEFzFVkW/MYhV4UYn31QT4VoKIQTfvzKDHYmBddSLKWc3TI+z0CgIHUatSeTDysWf74D9mEAX2OjGhQWVAp9ZU/y1tYIpzpQeOsf9YxwMoW0lb6vi07TXokfI27RcBa2Quy/zuHJj+4hPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733435046; c=relaxed/simple;
	bh=FkvSRWcaplPgkOtOJOUyPWq9/rWQFmEvAgAOTQDiFHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vCmVDFBoCEiAv/EY4JMRrxk4LyfWXOgZgKZoy5biLniLiUsLkMY7nO/nUUmY8nhssGfazESzVCUi6sukZ1c9wF5AEKAhiLedYEj1NA12LlXS32sS/QAfCbeKgovDKK58U4PdZMCs1WdccSPd3QbJFTbRGFqZpUSQp9MGJHMXU48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9LIfPzY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9LIfPzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733435044; x=1764971044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FkvSRWcaplPgkOtOJOUyPWq9/rWQFmEvAgAOTQDiFHI=;
  b=f9LIfPzYwv8VSeguwPHvn5nWvxet6Op8nkb8U2bt0copLRzzDXoCkUvx
   eTLL2WEqwfHM/myZhl5CBGcQcUeJ3BxbClVG9kd3bxhODRFioGLgfuPGV
   9gZ2Snl1YdvMxsnKEysrNGS6l+Lbhtbm9gUeQNO7UUwMXP4FewZkon4Ke
   s4BNk1qepD43g0nGZPMmXSAKGENoajidyLJ5wSla4og61Gvv/A9Xdl7sf
   gIb23EZCRXDudTk9jMJ85x5iWI2g64JtFGe6BSn+6fT0YHmY0b/0XslcA
   s2O63UeayJGD4Dyjkxk56lf5UfsW67JrDQ6d9pDAY1hHXDHglJ9LJhzeQ
   g==;
X-CSE-ConnectionGUID: /S8BQ0qrSZeNmZyfEJPItw==
X-CSE-MsgGUID: vZ/Vlk/ZQa6CkDjJ+Y9CGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37709396"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="37709396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 13:44:03 -0800
X-CSE-ConnectionGUID: N8HZS2tOTQC6jQyf3XuxFw==
X-CSE-MsgGUID: Xk3ttneARrOjMEuhZoCPHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="125124882"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Dec 2024 13:44:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJJdf-0000Pd-3D;
	Thu, 05 Dec 2024 21:43:59 +0000
Date: Fri, 6 Dec 2024 05:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, haodongdong <doubled@leap-io.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1600/1600]
 drivers/scsi/leapioraid/leapioraid_func.c:671:1: warning: no previous
 prototype for 'leapioraid_base_stop_smart_polling'
Message-ID: <202412060551.aZtqTJZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f0c88450d57092a03a2efd8e066f146f2b7c4ee0
commit: 7fea595ef48e9ab13bd31df067b19152153e1925 [1600/1600] SCSI: LEAPIORAID: Supports LEAPIO RAID controller
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241206/202412060551.aZtqTJZV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060551.aZtqTJZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060551.aZtqTJZV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/leapioraid/leapioraid_func.c: In function 'leapioraid_udp_init':
   drivers/scsi/leapioraid/leapioraid_func.c:289:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     289 |         int ret;
         |             ^~~
   drivers/scsi/leapioraid/leapioraid_func.c: At top level:
>> drivers/scsi/leapioraid/leapioraid_func.c:671:1: warning: no previous prototype for 'leapioraid_base_stop_smart_polling' [-Wmissing-prototypes]
     671 | leapioraid_base_stop_smart_polling(struct LEAPIORAID_ADAPTER *ioc)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_func.c:1300:1: warning: no previous prototype for 'leapioraid_base_process_reply_queue' [-Wmissing-prototypes]
    1300 | leapioraid_base_process_reply_queue(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_func.c:1468:5: warning: no previous prototype for 'leapioraid_base_irqpoll' [-Wmissing-prototypes]
    1468 | int leapioraid_base_irqpoll(struct irq_poll *irqpoll, int budget)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_func.c:1490:1: warning: no previous prototype for 'leapioraid_base_init_irqpolls' [-Wmissing-prototypes]
    1490 | leapioraid_base_init_irqpolls(struct LEAPIORAID_ADAPTER *ioc)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c: In function 'leapioraid_base_build_sg_scmd_ieee':
   drivers/scsi/leapioraid/leapioraid_func.c:1720:34: warning: variable 'sgl_zero_addr' set but not used [-Wunused-but-set-variable]
    1720 |         void *sg_local, *chain, *sgl_zero_addr;
         |                                  ^~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c: At top level:
>> drivers/scsi/leapioraid/leapioraid_func.c:4414:1: warning: no previous prototype for 'leapioraid_base_flush_ios_and_panic' [-Wmissing-prototypes]
    4414 | leapioraid_base_flush_ios_and_panic(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c: In function 'leapioraid_base_hard_reset_handler':
   drivers/scsi/leapioraid/leapioraid_func.c:5723:13: warning: variable 'ioc_state' set but not used [-Wunused-but-set-variable]
    5723 |         u32 ioc_state;
         |             ^~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c: In function 'leapioraid_config_request':
   drivers/scsi/leapioraid/leapioraid_func.c:5974:12: warning: variable 'issue_reset' set but not used [-Wunused-but-set-variable]
    5974 |         u8 issue_reset;
         |            ^~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c: In function 'leapioraid_base_request_irq':
>> drivers/scsi/leapioraid/leapioraid_func.c:2039:75: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 26 [-Wformat-truncation=]
    2039 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%d-msix%d",
         |                                                                           ^~
   drivers/scsi/leapioraid/leapioraid_func.c:2039:65: note: directive argument in the range [0, 254]
    2039 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%d-msix%d",
         |                                                                 ^~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:2039:17: note: 'snprintf' output between 8 and 35 bytes into a destination of size 32
    2039 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%d-msix%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2040 |                          ioc->driver_name, ioc->id, index);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_func.c:2030:70: warning: '-mq-poll' directive output may be truncated writing 8 bytes into a region of size between 6 and 31 [-Wformat-truncation=]
    2030 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%d-mq-poll%d",
         |                                                                      ^~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:2030:65: note: directive argument in the range [-255, 255]
    2030 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%d-mq-poll%d",
         |                                                                 ^~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:2030:17: note: 'snprintf' output between 11 and 39 bytes into a destination of size 32
    2030 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%d-mq-poll%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2031 |                          ioc->driver_name, ioc->id, qid);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c: In function 'leapioraid_base_start_log_watchdog':
>> drivers/scsi/leapioraid/leapioraid_func.c:392:59: warning: '%s' directive output may be truncated writing up to 23 bytes into a region of size 15 [-Wformat-truncation=]
     392 |                  sizeof(ioc->pcie_log_work_q_name), "poll_%s%d_status",
         |                                                           ^~
   drivers/scsi/leapioraid/leapioraid_func.c:392:53: note: directive argument in the range [0, 255]
     392 |                  sizeof(ioc->pcie_log_work_q_name), "poll_%s%d_status",
         |                                                     ^~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:391:9: note: 'snprintf' output between 14 and 39 bytes into a destination of size 20
     391 |         snprintf(ioc->pcie_log_work_q_name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     392 |                  sizeof(ioc->pcie_log_work_q_name), "poll_%s%d_status",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     393 |                  ioc->driver_name, ioc->id);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c: In function 'leapioraid_base_start_watchdog':
   drivers/scsi/leapioraid/leapioraid_func.c:588:62: warning: '%s' directive output may be truncated writing up to 23 bytes into a region of size 15 [-Wformat-truncation=]
     588 |                  sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                                              ^~
   drivers/scsi/leapioraid/leapioraid_func.c:588:56: note: directive argument in the range [0, 255]
     588 |                  sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                                        ^~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:587:9: note: 'snprintf' output between 14 and 39 bytes into a destination of size 20
     587 |         snprintf(ioc->fault_reset_work_q_name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     588 |                  sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     589 |                  ioc->driver_name, ioc->id);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c: In function 'leapioraid_base_start_hba_unplug_watchdog':
   drivers/scsi/leapioraid/leapioraid_func.c:637:24: warning: '%s' directive output may be truncated writing up to 23 bytes into a region of size 15 [-Wformat-truncation=]
     637 |                  "poll_%s%d_hba_unplug", ioc->driver_name, ioc->id);
         |                        ^~
   drivers/scsi/leapioraid/leapioraid_func.c:637:18: note: directive argument in the range [0, 255]
     637 |                  "poll_%s%d_hba_unplug", ioc->driver_name, ioc->id);
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:635:9: note: 'snprintf' output between 18 and 43 bytes into a destination of size 20
     635 |         snprintf(ioc->hba_hot_unplug_work_q_name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     636 |                  sizeof(ioc->hba_hot_unplug_work_q_name),
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     637 |                  "poll_%s%d_hba_unplug", ioc->driver_name, ioc->id);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/scsi/leapioraid/leapioraid_os.c:521:31: warning: no previous prototype for 'leapioraid_get_sdev_from_target' [-Wmissing-prototypes]
     521 | struct leapioraid_sas_device *leapioraid_get_sdev_from_target(
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_os.c:534:31: warning: no previous prototype for '__leapioraid_get_sdev_by_addr' [-Wmissing-prototypes]
     534 | struct leapioraid_sas_device *__leapioraid_get_sdev_by_addr(
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_os.c:866:35: warning: no previous prototype for 'leapioraid_scsihost_enclosure_find_by_handle' [-Wmissing-prototypes]
     866 | struct leapioraid_enclosure_node *leapioraid_scsihost_enclosure_find_by_handle(
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_os.c:1854:1: warning: no previous prototype for 'leapioraid_scsihost_tm_cmd_map_status' [-Wmissing-prototypes]
    1854 | leapioraid_scsihost_tm_cmd_map_status(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_os.c:1889:1: warning: no previous prototype for 'leapioraid_scsihost_tm_post_processing' [-Wmissing-prototypes]
    1889 | leapioraid_scsihost_tm_post_processing(struct LEAPIORAID_ADAPTER *ioc, u16 handle,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_os.c: In function 'leapioraid_scsihost_flush_running_cmds':
   drivers/scsi/leapioraid/leapioraid_os.c:3602:39: warning: variable 'mpi_request' set but not used [-Wunused-but-set-variable]
    3602 |         struct LeapioraidSCSIIOReq_t *mpi_request;
         |                                       ^~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_os.c: In function 'leapioraid_scsi_send_scsi_io':
   drivers/scsi/leapioraid/leapioraid_os.c:5293:23: warning: variable 'timeleft' set but not used [-Wunused-but-set-variable]
    5293 |         unsigned long timeleft;
         |                       ^~~~~~~~
   drivers/scsi/leapioraid/leapioraid_os.c: In function 'leapioraid_scsihost_reprobe_lun':
   drivers/scsi/leapioraid/leapioraid_os.c:7164:13: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
    7164 |         int rc;
         |             ^~
   drivers/scsi/leapioraid/leapioraid_os.c: In function 'leapioraid_scsihost_update_device_qdepth':
   drivers/scsi/leapioraid/leapioraid_os.c:7727:35: warning: variable 'sas_target_priv_data' set but not used [-Wunused-but-set-variable]
    7727 |         struct LEAPIORAID_TARGET *sas_target_priv_data;
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_os.c: In function 'leapioraid_scsihost_probe':
   drivers/scsi/leapioraid/leapioraid_os.c:9379:12: warning: variable 'revision' set but not used [-Wunused-but-set-variable]
    9379 |         u8 revision;
         |            ^~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_os.c:9464:28: warning: '%s' directive output may be truncated writing up to 23 bytes into a region of size 11 [-Wformat-truncation=]
    9464 |                  "fw_event_%s%d", ioc->driver_name, ioc->id);
         |                            ^~
   drivers/scsi/leapioraid/leapioraid_os.c:9464:18: note: directive argument in the range [0, 255]
    9464 |                  "fw_event_%s%d", ioc->driver_name, ioc->id);
         |                  ^~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_os.c:9463:9: note: 'snprintf' output between 11 and 36 bytes into a destination of size 20
    9463 |         snprintf(ioc->firmware_event_name, sizeof(ioc->firmware_event_name),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    9464 |                  "fw_event_%s%d", ioc->driver_name, ioc->id);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/scsi/leapioraid/leapioraid_transport.c:104:1: warning: no previous prototype for 'leapioraid_transport_get_port_id_by_rphy' [-Wmissing-prototypes]
     104 | leapioraid_transport_get_port_id_by_rphy(struct LEAPIORAID_ADAPTER *ioc,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/leapioraid_base_stop_smart_polling +671 drivers/scsi/leapioraid/leapioraid_func.c

   669	
   670	void
 > 671	leapioraid_base_stop_smart_polling(struct LEAPIORAID_ADAPTER *ioc)
   672	{
   673		struct workqueue_struct *wq;
   674	
   675		wq = ioc->smart_poll_work_q;
   676		ioc->smart_poll_work_q = NULL;
   677		if (wq) {
   678			if (!cancel_delayed_work(&ioc->smart_poll_work))
   679				flush_workqueue(wq);
   680			destroy_workqueue(wq);
   681		}
   682	}
   683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
