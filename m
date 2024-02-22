Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6BA140E4D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 18:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708627228; cv=none; b=SlteIlxjNUKHsWcgeaNmpbAxQZmdwRzfaLQqaAqKmHLPVlVS0dLtmQEDHN4TvfVe3TuGozqxw9BqXt/2XeKhvz9hdNTsIv/+IrleYhTqeBvteD41klrwVqpi2siauMsy04E6hllY0ofBMaALNGu34LPJ2WElHojfQDG0cgM16iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708627228; c=relaxed/simple;
	bh=x26dKhGPyGOBThhJg/bTZwZhfDNDbig8HeV5MidjfEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGl2sZ9kfxQHrnvZgdwDePG8CbuutshGN4kOzcH7SeOl40UZbUhHxMwkWzdzqTGzuL/2RSv79pTgH+MqiPcT60odMjIwGZHLnU/KcK+xiklX1ailaT7jXG0ArL6Uh5eIpxULW4J/ADWQ/DrL5tlpDVldqSCqCpFivc5PKG2C46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0CFPp4V; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0CFPp4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708627224; x=1740163224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x26dKhGPyGOBThhJg/bTZwZhfDNDbig8HeV5MidjfEY=;
  b=P0CFPp4V2BEiIbEJGKZHgRN4jjLhI8zx3ph+S3VvmUQZ8x4Rs0brOtKX
   8QnG73sEo7Oq760Tq5++rA37BKjv+OxZc7C+AF3SjN5PcqmsAjT7KQvsd
   4ubaocglhugQZvImYtjr9kYAtDGabKERN5XTsGogP2tCXw2xgdFn00DU2
   VtDGFdYvnmz6Bt8YBhi+H1imBK+d9P3Cp/PnDRNivyEnZyPZ3//gzsDDx
   dgp6jw9Eb3qPzFALqQS40IwdjFCl6NvdWoOlGNwKALk3eYHM1ktoURGI+
   BlqkAWkMSz+lYdmATjAeeimGCb+8uW7g++V1HYeK/j5fszwc81CeNx/sG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3375197"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3375197"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 10:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5518370"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Feb 2024 10:40:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdDzT-0006cD-1N;
	Thu, 22 Feb 2024 18:40:15 +0000
Date: Fri, 23 Feb 2024 02:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:8322:55: warning: variable 'ct'
 is uninitialized when used here
Message-ID: <202402230234.wEwTensI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 1549c764245c433658fc299210efea4c91365b89 driver: update mpt3sas from 32.00.00.00 to 37.00.00.00
date:   2 years, 10 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240223/202402230234.wEwTensI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230234.wEwTensI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230234.wEwTensI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpt3sas/mpt3sas_base.c:616:11: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
     616 |         if ((ioc == NULL))
         |              ~~~~^~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:616:11: note: remove extraneous parentheses around the comparison to silence this warning
     616 |         if ((ioc == NULL))
         |             ~    ^      ~
   drivers/scsi/mpt3sas/mpt3sas_base.c:616:11: note: use '=' to turn this equality comparison into an assignment
     616 |         if ((ioc == NULL))
         |                  ^~
         |                  =
   drivers/scsi/mpt3sas/mpt3sas_base.c:620:12: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
     620 |         if ((pdev == NULL))
         |              ~~~~~^~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:620:12: note: remove extraneous parentheses around the comparison to silence this warning
     620 |         if ((pdev == NULL))
         |             ~     ^      ~
   drivers/scsi/mpt3sas/mpt3sas_base.c:620:12: note: use '=' to turn this equality comparison into an assignment
     620 |         if ((pdev == NULL))
         |                   ^~
         |                   =
   drivers/scsi/mpt3sas/mpt3sas_base.c:1995:1: warning: no previous prototype for function '_base_process_reply_queue' [-Wmissing-prototypes]
    1995 | _base_process_reply_queue(struct adapter_reply_queue *reply_q)
         | ^
   drivers/scsi/mpt3sas/mpt3sas_base.c:1994:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1994 | int
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_base.c:2212:1: warning: no previous prototype for function '_base_irqpoll' [-Wmissing-prototypes]
    2212 | _base_irqpoll(struct irq_poll *irqpoll, int budget) {
         | ^
   drivers/scsi/mpt3sas/mpt3sas_base.c:2211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2211 | int
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_base.c:2241:1: warning: no previous prototype for function '_base_init_irqpolls' [-Wmissing-prototypes]
    2241 | _base_init_irqpolls(struct MPT3SAS_ADAPTER *ioc)
         | ^
   drivers/scsi/mpt3sas/mpt3sas_base.c:2240:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2240 | void
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_base.c:2843:1: warning: no previous prototype for function 'base_make_prp_nvme' [-Wmissing-prototypes]
    2843 | base_make_prp_nvme(struct MPT3SAS_ADAPTER *ioc,
         | ^
   drivers/scsi/mpt3sas/mpt3sas_base.c:2842:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2842 | void
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_base.c:4988:4: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
    4988 |                         msleep(MPI2_HARD_RESET_PCIE_SECOND_READ_DELAY_MICRO_SEC/1000);
         |                         ^
   drivers/scsi/mpt3sas/mpt3sas_base.c:4984:3: note: previous statement is here
    4984 |                 if (!(host_diagnostic & MPI2_DIAG_RESET_ADAPTER))
         |                 ^
   drivers/scsi/mpt3sas/mpt3sas_base.c:5991:24: warning: variable 'request_hdr' set but not used [-Wunused-but-set-variable]
    5991 |                 MPI2RequestHeader_t *request_hdr;
         |                                      ^
   drivers/scsi/mpt3sas/mpt3sas_base.c:6052:23: warning: variable 'request_hdr' set but not used [-Wunused-but-set-variable]
    6052 |         MPI2RequestHeader_t *request_hdr;
         |                              ^
>> drivers/scsi/mpt3sas/mpt3sas_base.c:8322:55: warning: variable 'ct' is uninitialized when used here [-Wuninitialized]
    8322 |                 if ((rc = _base_allocate_pcie_sgl_pool(ioc, sgl_sz, ct)) == -ENOMEM)
         |                                                                     ^~
   drivers/scsi/mpt3sas/mpt3sas_base.c:7944:26: note: initialize the variable 'ct' to silence this warning
    7944 |         struct chain_tracker *ct;
         |                                 ^
         |                                  = NULL
   drivers/scsi/mpt3sas/mpt3sas_base.c:8442:1: warning: no previous prototype for function '_base_flush_ios_and_panic' [-Wmissing-prototypes]
    8442 | _base_flush_ios_and_panic(struct MPT3SAS_ADAPTER *ioc, u16 fault_code)
         | ^
   drivers/scsi/mpt3sas/mpt3sas_base.c:8441:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    8441 | void
         | ^
         | static 
   11 warnings generated.
--
   drivers/scsi/mpt3sas/mpt3sas_config.c:310:5: warning: variable 'issue_reset' set but not used [-Wunused-but-set-variable]
     310 |         u8 issue_reset;
         |            ^
>> drivers/scsi/mpt3sas/mpt3sas_config.c:1862:1: warning: no previous prototype for function 'mpt3sas_config_update_driver_trigger_pg0' [-Wmissing-prototypes]
    1862 | mpt3sas_config_update_driver_trigger_pg0(struct MPT3SAS_ADAPTER *ioc,
         | ^
   drivers/scsi/mpt3sas/mpt3sas_config.c:1861:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1861 | int
         | ^
         | static 
   2 warnings generated.
--
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:910:1: warning: no previous prototype for function 'mpt3sas_get_sdev_from_target' [-Wmissing-prototypes]
     910 | mpt3sas_get_sdev_from_target(struct MPT3SAS_ADAPTER *ioc,
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:909:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     909 | struct _sas_device *
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:949:1: warning: no previous prototype for function 'mpt3sas_get_pdev_from_target' [-Wmissing-prototypes]
     949 | mpt3sas_get_pdev_from_target(struct MPT3SAS_ADAPTER *ioc,
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:948:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     948 | struct _pcie_device *
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:975:1: warning: no previous prototype for function '__mpt3sas_get_sdev_by_addr' [-Wmissing-prototypes]
     975 | __mpt3sas_get_sdev_by_addr(struct MPT3SAS_ADAPTER *ioc,
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:974:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     974 | struct _sas_device *
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1311:1: warning: no previous prototype for function '__mpt3sas_get_pdev_by_wwid' [-Wmissing-prototypes]
    1311 | __mpt3sas_get_pdev_by_wwid(struct MPT3SAS_ADAPTER *ioc, u64 wwid)
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1310:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1310 | struct _pcie_device *
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1344:1: warning: no previous prototype for function 'mpt3sas_get_pdev_by_wwid' [-Wmissing-prototypes]
    1344 | mpt3sas_get_pdev_by_wwid(struct MPT3SAS_ADAPTER *ioc, u64 wwid)
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1343 | struct _pcie_device *
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1358:1: warning: no previous prototype for function '__mpt3sas_get_pdev_by_idchannel' [-Wmissing-prototypes]
    1358 | __mpt3sas_get_pdev_by_idchannel(struct MPT3SAS_ADAPTER *ioc, int id,
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1357:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1357 | struct _pcie_device *
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1394:1: warning: no previous prototype for function 'mpt3sas_get_pdev_by_idchannel' [-Wmissing-prototypes]
    1394 | mpt3sas_get_pdev_by_idchannel(struct MPT3SAS_ADAPTER *ioc, int id, int channel)
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1393:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1393 | struct _pcie_device *
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1408:1: warning: no previous prototype for function '__mpt3sas_get_pdev_by_handle' [-Wmissing-prototypes]
    1408 | __mpt3sas_get_pdev_by_handle(struct MPT3SAS_ADAPTER *ioc, u16 handle)
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1407:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1407 | struct _pcie_device *
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1873:1: warning: no previous prototype for function 'mpt3sas_scsih_enclosure_find_by_handle' [-Wmissing-prototypes]
    1873 | mpt3sas_scsih_enclosure_find_by_handle(struct MPT3SAS_ADAPTER *ioc, u16 handle)
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1872:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1872 | struct _enclosure_node *
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1899:1: warning: no previous prototype for function 'mpt3sas_scsih_switch_find_by_handle' [-Wmissing-prototypes]
    1899 | mpt3sas_scsih_switch_find_by_handle(struct MPT3SAS_ADAPTER *ioc, u16 handle)
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1898:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1898 | struct _sas_node *
         | ^
         | static 
>> drivers/scsi/mpt3sas/mpt3sas_scsih.c:3521:1: warning: no previous prototype for function 'scsih_tm_cmd_map_status' [-Wmissing-prototypes]
    3521 | scsih_tm_cmd_map_status(struct MPT3SAS_ADAPTER *ioc, uint channel,
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3520:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3520 | int
         | ^
         | static 
>> drivers/scsi/mpt3sas/mpt3sas_scsih.c:3571:1: warning: no previous prototype for function 'scsih_tm_post_processing' [-Wmissing-prototypes]
    3571 | scsih_tm_post_processing(struct MPT3SAS_ADAPTER *ioc, u16 handle,
         | ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3570:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3570 | int
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6492:5: warning: no previous prototype for function '_scsih_build_nvme_unmap' [-Wmissing-prototypes]
    6492 | int _scsih_build_nvme_unmap(struct MPT3SAS_ADAPTER *ioc, struct scsi_cmnd *scmd,
         |     ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:6492:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6492 | int _scsih_build_nvme_unmap(struct MPT3SAS_ADAPTER *ioc, struct scsi_cmnd *scmd,
         | ^
         | static 
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8993:16: warning: variable 'timeleft' set but not used [-Wunused-but-set-variable]
    8993 |         unsigned long timeleft;
         |                       ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:11314:6: warning: variable 'pcie_device_type' set but not used [-Wunused-but-set-variable]
    11314 |         u32 pcie_device_type;
          |             ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:12310:6: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
    12310 |         int rc;
          |             ^
   16 warnings generated.
--
>> drivers/scsi/mpt3sas/mpt3sas_transport.c:190:1: warning: no previous prototype for function '_transport_get_port_id_by_rphy' [-Wmissing-prototypes]
     190 | _transport_get_port_id_by_rphy(struct MPT3SAS_ADAPTER *ioc,
         | ^
   drivers/scsi/mpt3sas/mpt3sas_transport.c:189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     189 | u8
         | ^
         | static 
   1 warning generated.


vim +/ct +8322 drivers/scsi/mpt3sas/mpt3sas_base.c

  7952	
  7953		retry_sz = 0;
  7954		facts = &ioc->facts;
  7955		/* command line tunables for max sgl entries */
  7956		if (max_sgl_entries != -1) 
  7957			sg_tablesize = max_sgl_entries;
  7958		else {
  7959			if (ioc->hba_mpi_version_belonged == MPI2_VERSION)
  7960				sg_tablesize = MPT2SAS_SG_DEPTH;
  7961			else
  7962				sg_tablesize = MPT3SAS_SG_DEPTH;
  7963		}
  7964		/* max sgl entries <= MPT_KDUMP_MIN_PHYS_SEGMENTS in KDUMP mode */
  7965		if (reset_devices)
  7966			sg_tablesize = min_t(unsigned short, sg_tablesize,
  7967						MPT_KDUMP_MIN_PHYS_SEGMENTS);
  7968		if (sg_tablesize < MPT_MIN_PHYS_SEGMENTS)
  7969			sg_tablesize = MPT_MIN_PHYS_SEGMENTS;
  7970		else if (sg_tablesize > MPT_MAX_PHYS_SEGMENTS) {
  7971	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25))
  7972			sg_tablesize = min_t(unsigned short, sg_tablesize,
  7973						MPT_MAX_SG_SEGMENTS);
  7974			printk(MPT3SAS_WARN_FMT
  7975				"sg_tablesize(%u) is bigger than kernel"
  7976				" defined %s(%u)\n", ioc->name,
  7977				sg_tablesize, MPT_MAX_PHYS_SEGMENTS_STRING, MPT_MAX_PHYS_SEGMENTS);
  7978	#else
  7979			sg_tablesize = MPT_MAX_PHYS_SEGMENTS;
  7980	#endif
  7981		}
  7982	
  7983		if(ioc->is_mcpu_endpoint)
  7984			ioc->shost->sg_tablesize = MPT_MIN_PHYS_SEGMENTS;
  7985		else
  7986			ioc->shost->sg_tablesize = sg_tablesize;
  7987	
  7988	#if defined(TARGET_MODE)
  7989		/* allocating 5 extra mf's */
  7990		ioc->internal_depth = min_t(int,
  7991		     (max_t(int, facts->HighPriorityCredit, num_cmd_buffers) + (5)),
  7992		     (facts->RequestCredit / 4));
  7993	#else
  7994		ioc->internal_depth = min_t(int, (facts->HighPriorityCredit + (5)),
  7995			(facts->RequestCredit / 4));
  7996	#endif
  7997		if (ioc->internal_depth < INTERNAL_CMDS_COUNT) {
  7998			if (facts->RequestCredit <= (INTERNAL_CMDS_COUNT +
  7999			    INTERNAL_SCSIIO_CMDS_COUNT)) {
  8000				printk(MPT3SAS_ERR_FMT "IOC doesn't have enough"
  8001				 " RequestCredits, it has just %d number of credits\n",
  8002				 ioc->name, facts->RequestCredit);
  8003				return -ENOMEM;
  8004			 }
  8005			ioc->internal_depth = 10;
  8006		}
  8007	
  8008		ioc->hi_priority_depth = ioc->internal_depth - (5);
  8009		
  8010		/* command line tunables for max controller queue depth */
  8011		if (max_queue_depth != -1 && max_queue_depth != 0) {
  8012			max_request_credit = min_t(u16, max_queue_depth +
  8013			    ioc->internal_depth, facts->RequestCredit);
  8014			if (max_request_credit > MAX_HBA_QUEUE_DEPTH)
  8015				max_request_credit =  MAX_HBA_QUEUE_DEPTH;
  8016		} 
  8017		else if (reset_devices) 
  8018			max_request_credit = min_t(u16, facts->RequestCredit,
  8019				(MPT3SAS_KDUMP_SCSI_IO_DEPTH + ioc->internal_depth));
  8020		else
  8021			max_request_credit = min_t(u16, facts->RequestCredit,
  8022			    MAX_HBA_QUEUE_DEPTH);
  8023	
  8024	retry:
  8025		/* Firmware maintains additional facts->HighPriorityCredit number of
  8026		 * credits for HiPriprity Request messages, so hba queue depth will be
  8027		 * sum of max_request_credit and high priority queue depth.
  8028		 */
  8029		ioc->hba_queue_depth = max_request_credit + ioc->hi_priority_depth;
  8030	
  8031		/* request frame size */
  8032		ioc->request_sz = facts->IOCRequestFrameSize * 4;
  8033	
  8034		/* reply frame size */
  8035		ioc->reply_sz = facts->ReplyFrameSize * 4;
  8036		/* chain segment size */
  8037		if (ioc->hba_mpi_version_belonged != MPI2_VERSION) {
  8038			if (facts->IOCMaxChainSegmentSize)
  8039				ioc->chain_segment_sz = facts->IOCMaxChainSegmentSize * MAX_CHAIN_ELEMT_SZ;
  8040			else
  8041				/* set to 128 bytes size if IOCMaxChainSegmentSize is zero */
  8042				ioc->chain_segment_sz = DEFAULT_NUM_FWCHAIN_ELEMTS * MAX_CHAIN_ELEMT_SZ;
  8043		}
  8044		else 
  8045	       		ioc->chain_segment_sz = ioc->request_sz;
  8046	
  8047		/* calculate the max scatter element size */
  8048		sge_size = max_t(u16, ioc->sge_size, ioc->sge_size_ieee);
  8049	
  8050	 retry_allocation:
  8051		total_sz = 0;
  8052		/* calculate number of sg elements left over in the 1st frame */
  8053		if (ioc->hba_mpi_version_belonged == MPI2_VERSION) {
  8054			max_sge_elements = ioc->request_sz - ((sizeof(Mpi2SCSIIORequest_t) -
  8055		    		sizeof(Mpi2SGEIOUnion_t)) + ioc->sge_size);
  8056		}
  8057		else {
  8058			/* reserve 2 SGE's, one for chain SGE and
  8059			 * anther for SGL1 (i.e. for meta data)
  8060			 */
  8061			max_sge_elements = ioc->request_sz -
  8062			 ((sizeof(Mpi25SCSIIORequest_t) -
  8063			   sizeof(Mpi25SGEIOUnion_t)) + 2 * sge_size);
  8064		}
  8065		ioc->max_sges_in_main_message = max_sge_elements/sge_size;
  8066	
  8067		/* now do the same for a chain buffer */
  8068		max_sge_elements = ioc->chain_segment_sz - sge_size;
  8069		ioc->max_sges_in_chain_message = max_sge_elements/sge_size;
  8070	
  8071		/*
  8072		 *  MPT3SAS_SG_DEPTH = CONFIG_FUSION_MAX_SGE
  8073		 */
  8074		chains_needed_per_io = ((ioc->shost->sg_tablesize -
  8075		   ioc->max_sges_in_main_message)/ioc->max_sges_in_chain_message)
  8076		    + 1;
  8077		if (chains_needed_per_io > facts->MaxChainDepth) {
  8078			chains_needed_per_io = facts->MaxChainDepth;
  8079			ioc->shost->sg_tablesize = min_t(u16,
  8080			ioc->max_sges_in_main_message + (ioc->max_sges_in_chain_message
  8081			* chains_needed_per_io), ioc->shost->sg_tablesize);
  8082		}
  8083		
  8084		/* Double the chains if DIX support is enabled for Meta data SGLs*/
  8085		if ((prot_mask & 0x78) && ioc->hba_mpi_version_belonged != MPI2_VERSION)
  8086			ioc->chains_needed_per_io = chains_needed_per_io * 2;
  8087		else
  8088			ioc->chains_needed_per_io = chains_needed_per_io;
  8089	
  8090		/* reply free queue sizing - taking into account for 64 FW events */
  8091		ioc->reply_free_queue_depth = ioc->hba_queue_depth + 64;
  8092	
  8093		/* mCPU manage single counters for simplicity */
  8094		if(ioc->is_mcpu_endpoint)
  8095			ioc->reply_post_queue_depth = ioc->reply_free_queue_depth;
  8096		else {
  8097			/* calculate reply descriptor post queue depth */
  8098			ioc->reply_post_queue_depth = ioc->hba_queue_depth +
  8099								ioc->reply_free_queue_depth +  1 ;
  8100			/* align the reply post queue on the next 16 count boundary */
  8101			if (ioc->reply_post_queue_depth % 16)
  8102				ioc->reply_post_queue_depth += 16 - (ioc->reply_post_queue_depth % 16);
  8103		}
  8104	
  8105	
  8106		if (ioc->reply_post_queue_depth >
  8107		    facts->MaxReplyDescriptorPostQueueDepth) {
  8108			ioc->reply_post_queue_depth = facts->MaxReplyDescriptorPostQueueDepth -
  8109			    (facts->MaxReplyDescriptorPostQueueDepth % 16);
  8110			ioc->hba_queue_depth = ((ioc->reply_post_queue_depth - 64) / 2) -1;
  8111			ioc->reply_free_queue_depth = ioc->hba_queue_depth + 64;
  8112		}
  8113	
  8114		printk(MPT3SAS_INFO_FMT "scatter gather: "
  8115		    "sge_in_main_msg(%d), sge_per_chain(%d), sge_per_io(%d), "
  8116		    "chains_per_io(%d)\n", ioc->name, ioc->max_sges_in_main_message,
  8117		    ioc->max_sges_in_chain_message, ioc->shost->sg_tablesize,
  8118		    ioc->chains_needed_per_io);
  8119	
  8120		ioc->scsiio_depth = ioc->hba_queue_depth -
  8121		    ioc->hi_priority_depth - ioc->internal_depth;
  8122	
  8123		/* set the scsi host can_queue depth
  8124		 * with some internal commands that could be outstanding
  8125		 */
  8126	#if defined(TARGET_MODE)
  8127		/* allocating 2 extra mf's */
  8128		ioc->shost->can_queue = ioc->scsiio_depth -
  8129					(num_cmd_buffers + INTERNAL_SCSIIO_CMDS_COUNT);
  8130	#else
  8131		ioc->shost->can_queue = ioc->scsiio_depth - INTERNAL_SCSIIO_CMDS_COUNT;
  8132	#endif
  8133		dinitprintk(ioc, printk(MPT3SAS_INFO_FMT "scsi host: "
  8134		    "can_queue depth (%d)\n", ioc->name, ioc->shost->can_queue));
  8135		
  8136		/* contiguous pool for request and chains, 16 byte align, one extra "
  8137		 * "frame for smid=0
  8138		 */
  8139		sz = ((ioc->scsiio_depth + 1) * ioc->request_sz);
  8140	
  8141		/* hi-priority queue */
  8142		sz += (ioc->hi_priority_depth * ioc->request_sz);
  8143	
  8144		/* internal queue */
  8145		sz += (ioc->internal_depth * ioc->request_sz);
  8146	
  8147		ioc->request_dma_sz = sz;
  8148		ioc->request = dma_alloc_coherent(&ioc->pdev->dev, sz,
  8149				&ioc->request_dma, GFP_KERNEL);
  8150		if (!ioc->request) {
  8151			printk(MPT3SAS_ERR_FMT "request pool: dma_alloc_consistent "
  8152			    "failed: hba_depth(%d), chains_per_io(%d), frame_sz(%d), "
  8153			    "total(%d kB)\n", ioc->name, ioc->hba_queue_depth,
  8154			    ioc->chains_needed_per_io, ioc->request_sz, sz/1024);
  8155			if (ioc->scsiio_depth < MPT3SAS_SAS_QUEUE_DEPTH) {
  8156				rc = -ENOMEM;
  8157				goto out;
  8158			}
  8159			retry_sz = 64;
  8160			if((ioc->hba_queue_depth - retry_sz) >
  8161			   (ioc->internal_depth + INTERNAL_SCSIIO_CMDS_COUNT)) {
  8162				ioc->hba_queue_depth -= retry_sz;
  8163				goto retry_allocation;
  8164			}
  8165			else {
  8166				rc = -ENOMEM;
  8167				goto out;
  8168			}
  8169		}
  8170		memset(ioc->request, 0, sz);
  8171	
  8172		if (retry_sz)
  8173			printk(MPT3SAS_ERR_FMT "request pool: dma_alloc_consistent "
  8174			    "succeed: hba_depth(%d), chains_per_io(%d), frame_sz(%d), "
  8175			    "total(%d kb)\n", ioc->name, ioc->hba_queue_depth,
  8176			    ioc->chains_needed_per_io, ioc->request_sz, sz/1024);
  8177	
  8178		/* hi-priority queue */
  8179		ioc->hi_priority = ioc->request + ((ioc->scsiio_depth + 1) *
  8180		    ioc->request_sz);
  8181		ioc->hi_priority_dma = ioc->request_dma + ((ioc->scsiio_depth + 1) *
  8182		    ioc->request_sz);
  8183	
  8184		/* internal queue */
  8185		ioc->internal = ioc->hi_priority + (ioc->hi_priority_depth *
  8186		    ioc->request_sz);
  8187		ioc->internal_dma = ioc->hi_priority_dma + (ioc->hi_priority_depth *
  8188		    ioc->request_sz);
  8189	
  8190		printk(MPT3SAS_INFO_FMT "request pool(0x%p) - dma(0x%llx): "
  8191		    "depth(%d), frame_size(%d), pool_size(%d kB)\n", ioc->name,
  8192		    ioc->request, (unsigned long long) ioc->request_dma,
  8193		    ioc->hba_queue_depth, ioc->request_sz,
  8194		    (ioc->hba_queue_depth * ioc->request_sz)/1024);
  8195	
  8196		total_sz += sz;
  8197	
  8198	#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,16,0))
  8199		sz = ioc->scsiio_depth * sizeof(struct scsiio_tracker);
  8200		ioc->scsi_lookup_pages = get_order(sz);
  8201		ioc->scsi_lookup = (struct scsiio_tracker *)__get_free_pages(
  8202		    GFP_KERNEL, ioc->scsi_lookup_pages);
  8203		if (!ioc->scsi_lookup) {
  8204			// Retry allocating memory by reducing the queue depth
  8205			if ((max_request_credit - 64) >
  8206			    (ioc->internal_depth + INTERNAL_SCSIIO_CMDS_COUNT)) {
  8207				max_request_credit -= 64;
  8208				if (ioc->request) {
  8209					dma_free_coherent(&ioc->pdev->dev, ioc->request_dma_sz,
  8210			    		    ioc->request,  ioc->request_dma);
  8211					ioc->request = NULL;
  8212				}
  8213				goto retry;
  8214			}
  8215			else {
  8216				printk(MPT3SAS_ERR_FMT "scsi_lookup: get_free_pages failed, "
  8217				    "sz(%d)\n", ioc->name, (int)sz);
  8218				rc = -ENOMEM;
  8219				goto out;
  8220			}
  8221		}
  8222	#endif 
  8223		dinitprintk(ioc, printk(MPT3SAS_INFO_FMT "scsiio(0x%p): "
  8224		    "depth(%d)\n", ioc->name, ioc->request,
  8225		    ioc->scsiio_depth));
  8226	
  8227		/* initialize hi-priority queue smid's */
  8228		ioc->hpr_lookup = kcalloc(ioc->hi_priority_depth,
  8229		    sizeof(struct request_tracker), GFP_KERNEL);
  8230		if (!ioc->hpr_lookup) {
  8231			printk(MPT3SAS_ERR_FMT "hpr_lookup: kcalloc failed\n",
  8232			    ioc->name);
  8233			rc = -ENOMEM;
  8234			goto out;
  8235		}
  8236		ioc->hi_priority_smid = ioc->scsiio_depth + 1;
  8237		dinitprintk(ioc, printk(MPT3SAS_INFO_FMT "hi_priority(0x%p): "
  8238		    "depth(%d), start smid(%d)\n", ioc->name, ioc->hi_priority,
  8239		    ioc->hi_priority_depth, ioc->hi_priority_smid));
  8240	
  8241		/* initialize internal queue smid's */
  8242		ioc->internal_lookup = kcalloc(ioc->internal_depth,
  8243		    sizeof(struct request_tracker), GFP_KERNEL);
  8244		if (!ioc->internal_lookup) {
  8245			printk(MPT3SAS_ERR_FMT "internal_lookup: kcalloc failed\n",
  8246			    ioc->name);
  8247			rc = -ENOMEM;
  8248			goto out;
  8249		}
  8250		ioc->internal_smid = ioc->hi_priority_smid + ioc->hi_priority_depth;
  8251		dinitprintk(ioc, printk(MPT3SAS_INFO_FMT "internal(0x%p): "
  8252		    "depth(%d), start smid(%d)\n", ioc->name, ioc->internal,
  8253		     ioc->internal_depth, ioc->internal_smid));
  8254	
  8255		sz = ioc->scsiio_depth * sizeof(struct chain_lookup);
  8256	
  8257		ioc->chain_lookup = kzalloc(sz, GFP_KERNEL);
  8258		if (!ioc->chain_lookup) {
  8259			// Retry allocating memory by reducing the queue depth
  8260			if ((max_request_credit - 64) >
  8261			    (ioc->internal_depth + INTERNAL_SCSIIO_CMDS_COUNT)) {
  8262				max_request_credit -= 64;
  8263				_base_release_memory_pools(ioc);
  8264				goto retry;
  8265			}
  8266			else {
  8267				printk(MPT3SAS_ERR_FMT "chain_lookup: __get_free_pages "
  8268				"failed\n", ioc->name);
  8269				rc = -ENOMEM;
  8270				goto out;
  8271			}
  8272		}
  8273		
  8274		sz = ioc->chains_needed_per_io * sizeof(struct chain_tracker);
  8275		for (i=0; i < ioc->scsiio_depth; i++) {
  8276			ioc->chain_lookup[i].chains_per_smid = kzalloc(sz, GFP_KERNEL);
  8277			if (!ioc->chain_lookup[i].chains_per_smid) {
  8278				// Retry allocating memory by reducing the queue depth
  8279				if ((max_request_credit - 64) >
  8280				    (ioc->internal_depth + INTERNAL_SCSIIO_CMDS_COUNT)) {
  8281					max_request_credit -= 64;
  8282					_base_release_memory_pools(ioc);
  8283					goto retry;
  8284				}
  8285				else {
  8286					printk(MPT3SAS_ERR_FMT "chain_lookup: "
  8287					" kzalloc failed\n", ioc->name);
  8288					rc = -ENOMEM;
  8289					goto out;
  8290				}
  8291			}
  8292		}
  8293	
  8294		/*
  8295		* The number of NVMe page sized blocks needed is: 
  8296		*     (((sg_tablesize * 8) - 1) / (page_size - 8)) + 1 
  8297		* ((sg_tablesize * 8) - 1) is the max PRP's minus the first PRP entry 
  8298		* that is placed in the main message frame.  8 is the size of each PRP 
  8299		* entry or PRP list pointer entry.  8 is subtracted from page_size 
  8300		* because of the PRP list pointer entry at the end of a page, so this 
  8301		* is not counted as a PRP entry.  The 1 added page is a round up. 
  8302		* 
  8303		* To avoid allocation failures due to the amount of memory that could 
  8304		* be required for NVMe PRP's, only each set of NVMe blocks will be 
  8305		* contiguous, so a new set is allocated for each possible I/O. 
  8306		*/
  8307		ioc->chains_per_prp_buffer = 0;
  8308		if(ioc->facts.ProtocolFlags & MPI2_IOCFACTS_PROTOCOL_NVME_DEVICES) {
  8309			nvme_blocks_needed = (ioc->shost->sg_tablesize * NVME_PRP_SIZE) - 1;
  8310			nvme_blocks_needed /= (ioc->page_size - NVME_PRP_SIZE);
  8311			nvme_blocks_needed++;
  8312	
  8313			sz = sizeof(struct pcie_sg_list) * ioc->scsiio_depth;
  8314			ioc->pcie_sg_lookup = kzalloc(sz, GFP_KERNEL);
  8315			if (!ioc->pcie_sg_lookup) {
  8316				printk(MPT3SAS_ERR_FMT "PCIe SGL lookup: kzalloc "
  8317							"failed\n", ioc->name);
  8318				rc = -ENOMEM;
  8319				goto out;
  8320			}
  8321			sgl_sz = nvme_blocks_needed * ioc->page_size;
> 8322			if ((rc = _base_allocate_pcie_sgl_pool(ioc, sgl_sz, ct)) == -ENOMEM)
  8323				return -ENOMEM;
  8324			else if (rc == -EAGAIN)
  8325				goto try_32bit_dma;
  8326			total_sz += sgl_sz * ioc->scsiio_depth;
  8327		}
  8328	
  8329		rc = _base_allocate_chain_dma_pool(ioc, ioc->chain_segment_sz, ct);
  8330		if (rc == -ENOMEM)
  8331			return -ENOMEM;
  8332		else if (rc == -EAGAIN) {
  8333			if (ioc->use_32bit_dma && ioc->dma_mask > 32)
  8334				goto try_32bit_dma;
  8335			else {
  8336				if ((max_request_credit - 64) >
  8337				    (ioc->internal_depth + INTERNAL_SCSIIO_CMDS_COUNT)) {
  8338					max_request_credit -= 64;
  8339					_base_release_memory_pools(ioc);
  8340					goto retry_allocation;
  8341				} else {
  8342					printk(MPT3SAS_ERR_FMT "chain_lookup: "
  8343							" dma_pool_alloc failed\n", ioc->name);
  8344					return -ENOMEM;
  8345				}
  8346			}
  8347		}
  8348		total_sz += ioc->chain_segment_sz *
  8349		    ((ioc->chains_needed_per_io - ioc->chains_per_prp_buffer) *
  8350		    ioc->scsiio_depth);
  8351	
  8352		/* sense buffers, 4 byte align */
  8353		sense_sz = ioc->scsiio_depth * SCSI_SENSE_BUFFERSIZE ;
  8354		if ((rc = _base_allocate_sense_dma_pool(ioc, sense_sz)) == -ENOMEM)
  8355			return -ENOMEM;
  8356		else if (rc == -EAGAIN)
  8357			goto try_32bit_dma;
  8358		total_sz += sense_sz;
  8359		/* reply pool, 4 byte align */
  8360		sz = ioc->reply_free_queue_depth * ioc->reply_sz;
  8361		if ((rc = _base_allocate_reply_pool(ioc, sz)) == -ENOMEM)
  8362			return -ENOMEM;
  8363		else if (rc == -EAGAIN)
  8364			goto try_32bit_dma;
  8365		total_sz += sz;
  8366	
  8367		/* reply free queue, 16 byte align */
  8368		sz = ioc->reply_free_queue_depth * 4;
  8369		if ((rc = _base_allocate_reply_free_dma_pool(ioc, sz)) == -ENOMEM)
  8370			return -ENOMEM;
  8371		else if (rc == -EAGAIN)
  8372			goto try_32bit_dma;
  8373		total_sz += sz;
  8374		/* reply post queue, 16 byte align */
  8375		reply_post_free_sz = ioc->reply_post_queue_depth *
  8376		    sizeof(Mpi2DefaultReplyDescriptor_t);
  8377		rdpq_sz = reply_post_free_sz * RDPQ_MAX_INDEX_IN_ONE_CHUNK;
  8378		if (_base_is_controller_msix_enabled(ioc) && !ioc->rdpq_array_enable)
  8379		rdpq_sz = reply_post_free_sz * ioc->reply_queue_count;
  8380		if ((rc = base_alloc_rdpq_dma_pool(ioc, rdpq_sz)) == -ENOMEM)
  8381			return -ENOMEM;
  8382		else if (rc == -EAGAIN)
  8383			goto try_32bit_dma;
  8384		else {
  8385			if (ioc->rdpq_array_enable && rc == 0) {
  8386				reply_post_free_array_sz = ioc->reply_queue_count *
  8387				    sizeof(Mpi2IOCInitRDPQArrayEntry);
  8388				if ((rc = _base_allocate_reply_post_free_array(ioc,
  8389				    reply_post_free_array_sz)) == -ENOMEM)
  8390					return -ENOMEM;
  8391				else if (rc == -EAGAIN)
  8392					goto try_32bit_dma;
  8393			}
  8394		}
  8395		total_sz += rdpq_sz;
  8396		ioc->config_page_sz = 512;
  8397		ioc->config_page = dma_alloc_coherent(&ioc->pdev->dev,
  8398			ioc->config_page_sz, &ioc->config_page_dma, GFP_KERNEL);
  8399		if (!ioc->config_page) {
  8400			printk(MPT3SAS_ERR_FMT "config page: dma_pool_alloc "
  8401			    "failed\n", ioc->name);
  8402			rc = -ENOMEM;
  8403			goto out;
  8404		}
  8405		printk(MPT3SAS_INFO_FMT "config page(0x%p) - dma(0x%llx): size(%d)\n",
  8406		    ioc->name, ioc->config_page,
  8407		    (unsigned long long)ioc->config_page_dma, ioc->config_page_sz);
  8408		total_sz += ioc->config_page_sz;
  8409	
  8410		printk(MPT3SAS_INFO_FMT "Allocated physical memory: size(%d kB)\n",
  8411		    ioc->name, total_sz/1024);
  8412		printk(MPT3SAS_INFO_FMT "Current Controller Queue Depth(%d), "
  8413		    "Max Controller Queue Depth(%d)\n",
  8414		    ioc->name, ioc->shost->can_queue, facts->RequestCredit);
  8415	
  8416		return 0;
  8417	
  8418	try_32bit_dma:
  8419		_base_release_memory_pools(ioc);
  8420		if (ioc->use_32bit_dma && (ioc->dma_mask > 32)) {
  8421		/* Change dma coherent mask to 32 bit and reallocate */
  8422			if (_base_config_dma_addressing(ioc, ioc->pdev) != 0) {
  8423				pr_err("Setting 32 bit coherent DMA mask Failed %s\n",
  8424					pci_name(ioc->pdev));
  8425			return -ENODEV;
  8426			}
  8427		} else if (_base_reduce_hba_queue_depth(ioc) !=0)
  8428			return -ENOMEM;
  8429		goto retry_allocation;
  8430	
  8431	 out:
  8432		return rc;
  8433	}
  8434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
