Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832A518AE2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 22:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737500021; cv=none; b=FcoBKMsdGK7VsHi3OR2QRPzgHthX4SnNtdkPUqdkfRk7KUBeNEqyEbAV/MhXE4TgRYWfSsa43c+1ES2hX8JdK6AOkqRt3xy6VRmJRv/9E/EmB0+URuFPcCfYWFyxOl1f5jXoNtyQvJQ9TleEiqRDXXUJ2BTFBaCX3tFqaxWrh9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737500021; c=relaxed/simple;
	bh=Ck/o4NAd80v/7IYuB7j7l+ml+XvTibrxjtxW5YVUHJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzukIP0qAI3Q4JtywwFCG18jBmRdTzbm3Q/oy0MO6KXJyjiNCmIFcrMNDnIqpJY9t/m9qK8CdfbBUI1olS+F+eV8r/bWObiyg/tTDHjnpgc7gu6Dvbr7ys7DhsILk+ZwJtnH08ra4XTZUyDBlSekD/XgRwhVCOuRUJLlyHv1NVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW0stFKk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW0stFKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737500018; x=1769036018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ck/o4NAd80v/7IYuB7j7l+ml+XvTibrxjtxW5YVUHJU=;
  b=OW0stFKkr+FxM6RnMi1xj8U55K17SqAVtZCh+Za1Qj5KuFfaI2O+a165
   CUboUh788sIv8x4URgfIv76q1zIVOkU6aWM2yUcOefNc6u7n18VLxCWyI
   W1g1S+fB/VSVje85askB1LUEuwsz3wt/us4y6e9Y9gVeZMe+PuGAxVe7U
   8ZM0JCIoXBDr+//55Qq8NYbiOEUknGrqXOOFesi/fFof5AAaIsQXV2G8l
   NnzvlnNgTnyEPhysf2Demrk/GTsHAXkdMFX00WNLg3kf++2ncuOA4V/p/
   2XCvZcNln4lRk/z8ocuRJjLalCQfSZ53XVPjVtin4ww4sWZIUthLqz053
   g==;
X-CSE-ConnectionGUID: iPg5Sq6ASFKE6udANLiiBA==
X-CSE-MsgGUID: G2aSg4jOR1+asE3qA+/hBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="63295633"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="63295633"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 14:53:38 -0800
X-CSE-ConnectionGUID: YoDZfqegS9qvkDsSdzbj6A==
X-CSE-MsgGUID: /emF48e5Q26IbG3FxOuVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="107486864"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jan 2025 14:53:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taN7m-000Z5K-2T;
	Tue, 21 Jan 2025 22:53:34 +0000
Date: Wed, 22 Jan 2025 06:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/scsi/leapioraid/leapioraid_app.c:547:55: sparse: sparse: restricted
 __le16 degrades to integer
Message-ID: <202501220628.ocqpqpGr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: 7fea595ef48e9ab13bd31df067b19152153e1925 [1834/1834] SCSI: LEAPIORAID: Supports LEAPIO RAID controller
config: x86_64-randconfig-122-20250122 (https://download.01.org/0day-ci/archive/20250122/202501220628.ocqpqpGr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220628.ocqpqpGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220628.ocqpqpGr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/leapioraid/leapioraid_app.c:547:55: sparse: sparse: restricted __le16 degrades to integer
>> drivers/scsi/leapioraid/leapioraid_app.c:2197:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/scsi/leapioraid/leapioraid_app.c:2197:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/scsi/leapioraid/leapioraid_app.c:2197:17: sparse:     got unsigned int ( * )( ... )
   drivers/scsi/leapioraid/leapioraid_app.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:244:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/scsi/leapioraid/leapioraid_func.c:304:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 static [addressable] [assigned] [toplevel] [usertype] s_addr @@     got unsigned int [addressable] [usertype] ip @@
   drivers/scsi/leapioraid/leapioraid_func.c:304:35: sparse:     expected restricted __be32 static [addressable] [assigned] [toplevel] [usertype] s_addr
   drivers/scsi/leapioraid/leapioraid_func.c:304:35: sparse:     got unsigned int [addressable] [usertype] ip
>> drivers/scsi/leapioraid/leapioraid_func.c:325:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long [usertype] iov_len @@     got restricted __le32 [usertype] datasize @@
   drivers/scsi/leapioraid/leapioraid_func.c:325:21: sparse:     expected unsigned long [usertype] iov_len
   drivers/scsi/leapioraid/leapioraid_func.c:325:21: sparse:     got restricted __le32 [usertype] datasize
>> drivers/scsi/leapioraid/leapioraid_func.c:369:71: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le32 [usertype] datasize @@     got unsigned int [assigned] [usertype] send_sz @@
   drivers/scsi/leapioraid/leapioraid_func.c:369:71: sparse:     expected restricted __le32 [usertype] datasize
   drivers/scsi/leapioraid/leapioraid_func.c:369:71: sparse:     got unsigned int [assigned] [usertype] send_sz
   drivers/scsi/leapioraid/leapioraid_func.c:671:1: sparse: sparse: symbol 'leapioraid_base_stop_smart_polling' was not declared. Should it be static?
>> drivers/scsi/leapioraid/leapioraid_func.c:1395:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/leapioraid/leapioraid_func.c:1395:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/leapioraid/leapioraid_func.c:1395:67: sparse:     got unsigned long long [usertype] *
   drivers/scsi/leapioraid/leapioraid_func.c:1427:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/leapioraid/leapioraid_func.c:1427:51: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/leapioraid/leapioraid_func.c:1427:51: sparse:     got unsigned long long [usertype] *
   drivers/scsi/leapioraid/leapioraid_func.c:1300:1: sparse: sparse: symbol 'leapioraid_base_process_reply_queue' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:1468:5: sparse: sparse: symbol 'leapioraid_base_irqpoll' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:1490:1: sparse: sparse: symbol 'leapioraid_base_init_irqpolls' was not declared. Should it be static?
>> drivers/scsi/leapioraid/leapioraid_func.c:1924:21: sparse: sparse: symbol 'leapioraid_pcie_link_speed' was not declared. Should it be static?
>> drivers/scsi/leapioraid/leapioraid_func.c:2946:31: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/scsi/leapioraid/leapioraid_func.c:3291:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3291:16: sparse:     expected unsigned int val
   drivers/scsi/leapioraid/leapioraid_func.c:3291:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3304:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3304:16: sparse:     expected unsigned int val
   drivers/scsi/leapioraid/leapioraid_func.c:3304:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3317:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3317:16: sparse:     expected unsigned int val
   drivers/scsi/leapioraid/leapioraid_func.c:3317:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3330:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3330:16: sparse:     expected unsigned int val
   drivers/scsi/leapioraid/leapioraid_func.c:3330:16: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/leapioraid/leapioraid_func.c:3373:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ImageSize @@     got unsigned long [assigned] [usertype] data_length @@
   drivers/scsi/leapioraid/leapioraid_func.c:3373:32: sparse:     expected restricted __le32 [usertype] ImageSize
   drivers/scsi/leapioraid/leapioraid_func.c:3373:32: sparse:     got unsigned long [assigned] [usertype] data_length
   drivers/scsi/leapioraid/leapioraid_func.c:4414:1: sparse: sparse: symbol 'leapioraid_base_flush_ios_and_panic' was not declared. Should it be static?
>> drivers/scsi/leapioraid/leapioraid_func.c:4747:40: sparse: sparse: invalid assignment: |=
   drivers/scsi/leapioraid/leapioraid_func.c:4747:40: sparse:    left side has type restricted __le16
   drivers/scsi/leapioraid/leapioraid_func.c:4747:40: sparse:    right side has type int
>> drivers/scsi/leapioraid/leapioraid_func.c:4799:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [addressable] [assigned] [usertype] BufAddr @@     got unsigned long long [usertype] log_buffer_dma @@
   drivers/scsi/leapioraid/leapioraid_func.c:4799:29: sparse:     expected restricted __le64 [addressable] [assigned] [usertype] BufAddr
   drivers/scsi/leapioraid/leapioraid_func.c:4799:29: sparse:     got unsigned long long [usertype] log_buffer_dma
>> drivers/scsi/leapioraid/leapioraid_func.c:4800:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] BufSize @@     got int @@
   drivers/scsi/leapioraid/leapioraid_func.c:4800:29: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] BufSize
   drivers/scsi/leapioraid/leapioraid_func.c:4800:29: sparse:     got int
   drivers/scsi/leapioraid/leapioraid_func.c:5242:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/leapioraid/leapioraid_func.c:5242:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/leapioraid/leapioraid_func.c:5242:67: sparse:     got unsigned long long [usertype] *
   drivers/scsi/leapioraid/leapioraid_func.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:244:46: sparse: sparse: self-comparison always evaluates to false
   drivers/scsi/leapioraid/leapioraid_func.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> drivers/scsi/leapioraid/leapioraid_os.c:5965:29: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:521:30: sparse: sparse: symbol 'leapioraid_get_sdev_from_target' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_os.c:534:30: sparse: sparse: symbol '__leapioraid_get_sdev_by_addr' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_os.c:866:34: sparse: sparse: symbol 'leapioraid_scsihost_enclosure_find_by_handle' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_os.c:1854:1: sparse: sparse: symbol 'leapioraid_scsihost_tm_cmd_map_status' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_os.c:1889:1: sparse: sparse: symbol 'leapioraid_scsihost_tm_post_processing' was not declared. Should it be static?
>> drivers/scsi/leapioraid/leapioraid_os.c:3080:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dev_handle @@     got restricted __le16 [usertype] DevHandle @@
   drivers/scsi/leapioraid/leapioraid_os.c:3080:25: sparse:     expected unsigned short [usertype] dev_handle
   drivers/scsi/leapioraid/leapioraid_os.c:3080:25: sparse:     got restricted __le16 [usertype] DevHandle
   drivers/scsi/leapioraid/leapioraid_os.c:3081:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:3091:35: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:3093:42: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:3094:45: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:3095:25: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:3099:42: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:3100:61: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:3102:25: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:3106:42: sparse: sparse: cast to restricted __le16
   drivers/scsi/leapioraid/leapioraid_os.c:3107:35: sparse: sparse: cast to restricted __le16
>> drivers/scsi/leapioraid/leapioraid_os.c:6840:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] EnclosureHandle @@     got unsigned short [usertype] @@
   drivers/scsi/leapioraid/leapioraid_os.c:6840:37: sparse:     expected restricted __le16 [usertype] EnclosureHandle
   drivers/scsi/leapioraid/leapioraid_os.c:6840:37: sparse:     got unsigned short [usertype]
>> drivers/scsi/leapioraid/leapioraid_os.c:6844:76: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] handle @@     got restricted __le16 [usertype] EnclosureHandle @@
   drivers/scsi/leapioraid/leapioraid_os.c:6844:76: sparse:     expected unsigned short [usertype] handle
   drivers/scsi/leapioraid/leapioraid_os.c:6844:76: sparse:     got restricted __le16 [usertype] EnclosureHandle
>> drivers/scsi/leapioraid/leapioraid_os.c:6859:59: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] handle @@     got restricted __le16 [usertype] EnclosureHandle @@
   drivers/scsi/leapioraid/leapioraid_os.c:6859:59: sparse:     expected unsigned int [usertype] handle
   drivers/scsi/leapioraid/leapioraid_os.c:6859:59: sparse:     got restricted __le16 [usertype] EnclosureHandle
   drivers/scsi/leapioraid/leapioraid_os.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:244:46: sparse: sparse: self-comparison always evaluates to false
   drivers/scsi/leapioraid/leapioraid_os.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +547 drivers/scsi/leapioraid/leapioraid_app.c

   506	
   507	static int
   508	leapioraid_ctl_set_task_mid(struct LEAPIORAID_ADAPTER *ioc,
   509			  struct leapio_ioctl_command *karg,
   510			  struct LeapioraidSCSITmgReq_t *tm_request)
   511	{
   512		u8 found = 0;
   513		u16 smid;
   514		u16 handle;
   515		struct scsi_cmnd *scmd;
   516		struct LEAPIORAID_DEVICE *priv_data;
   517		struct LeapioraidSCSITmgRep_t *tm_reply;
   518		u32 sz;
   519		u32 lun;
   520		char *desc = NULL;
   521		struct leapioraid_scsiio_tracker *st = NULL;
   522	
   523		if (tm_request->TaskType == LEAPIORAID_SCSITASKMGMT_TASKTYPE_ABORT_TASK)
   524			desc = "abort_task";
   525		else if (tm_request->TaskType ==
   526			 LEAPIORAID_SCSITASKMGMT_TASKTYPE_QUERY_TASK)
   527			desc = "query_task";
   528		else
   529			return 0;
   530		lun = scsilun_to_int((struct scsi_lun *)tm_request->LUN);
   531		handle = le16_to_cpu(tm_request->DevHandle);
   532		for (smid = ioc->shost->can_queue; smid && !found; smid--) {
   533			scmd = leapioraid_scsihost_scsi_lookup_get(ioc, smid);
   534			if (scmd == NULL || scmd->device == NULL ||
   535			    scmd->device->hostdata == NULL)
   536				continue;
   537			if (lun != scmd->device->lun)
   538				continue;
   539			priv_data = scmd->device->hostdata;
   540			if (priv_data->sas_target == NULL)
   541				continue;
   542			if (priv_data->sas_target->handle != handle)
   543				continue;
   544			st = leapioraid_base_scsi_cmd_priv(scmd);
   545			if ((!st) || (st->smid == 0))
   546				continue;
 > 547			if (!tm_request->TaskMID || tm_request->TaskMID == st->smid) {
   548				tm_request->TaskMID = cpu_to_le16(st->smid);
   549				found = 1;
   550			}
   551		}
   552		if (!found) {
   553			dctlprintk(ioc, pr_info(
   554				"%s %s: handle(0x%04x), lun(%d), no active mid!!\n",
   555					       ioc->name, desc,
   556					       le16_to_cpu(tm_request->DevHandle),
   557					       lun));
   558			tm_reply = ioc->ctl_cmds.reply;
   559			tm_reply->DevHandle = tm_request->DevHandle;
   560			tm_reply->Function = LEAPIORAID_FUNC_SCSI_TASK_MGMT;
   561			tm_reply->TaskType = tm_request->TaskType;
   562			tm_reply->MsgLength =
   563			    sizeof(struct LeapioraidSCSITmgRep_t) / 4;
   564			tm_reply->VP_ID = tm_request->VP_ID;
   565			tm_reply->VF_ID = tm_request->VF_ID;
   566			sz = min_t(u32, karg->max_reply_bytes, ioc->reply_sz);
   567			if (copy_to_user(karg->reply_frame_buf_ptr, ioc->ctl_cmds.reply,
   568					 sz))
   569				pr_err("failure at %s:%d/%s()!\n", __FILE__,
   570				       __LINE__, __func__);
   571			return 1;
   572		}
   573		dctlprintk(ioc, pr_info(
   574			"%s %s: handle(0x%04x), lun(%d), task_mid(%d)\n",
   575			ioc->name, desc,
   576			le16_to_cpu(tm_request->DevHandle), lun,
   577			le16_to_cpu(tm_request->TaskMID)));
   578		return 0;
   579	}
   580	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
