Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EA7C2EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 06:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767075337; cv=none; b=sbLEyMrsxNryn6fGt1vksiD8zPxJ5hNKdU59iLERtXxjsDAZMMNfDXw0wLVap3HYupbsReAsaWYCVnmFaXfVbYXGEFqtLL/FMm30JLZ2U0tyZ9SuOKa3Cjbck6tRk2XB0nndwqGAjBsqmjjiWl0bbPBbHtazIv7T3u5gOotA4LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767075337; c=relaxed/simple;
	bh=5iHsyYTsRaFghLWncnbb71HvxKsqaUd35UMxB/miJ48=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tIHmqvSynOF+32y40sw6flYv6IuY6EuahjMszBZeNo0XSC89lLrExo9TalJhi0RDswT+HIhjUoDjIGsvq6MYw36E31Wmbv25wSmcjGuRuyPJZjr20a8+17PUCFiqNFLvdQ9M5VJ22HZUeW72rSeAa7olU+BRjIwBTTvtjmXPI8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWEFzDQR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWEFzDQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767075335; x=1798611335;
  h=date:from:to:cc:subject:message-id;
  bh=5iHsyYTsRaFghLWncnbb71HvxKsqaUd35UMxB/miJ48=;
  b=nWEFzDQRS+AhUvIlS8HIo5rRaDRpBqI07oM3UpEAK24i9et+6Cg65HFr
   Ri9gS7Owx9IoYYcZ68V2xmFpYP428q3c/d4ueakSPaimH5GRve6ffhh89
   p6OFwM+XmIjylZmwzjVeJ8l7ACnvElNkSB5NZSvfMZu1b8xpsTnChD3A5
   uOnyvK5MAB72NwG02RsRStT/o2QWD6HtoIPPe7+z+4f5NVvJyZqUqO8IZ
   Jg75G3epXv2w7nYNypREcV4MPH9bqYcHOD0KaEuSE67NDg1MIhEBHuJ/8
   0ENzvQcsotmxZKuxQR5BEFmP4r1Pya7VCI5Ewv1PLvVjNMRoARzQBvsZ7
   Q==;
X-CSE-ConnectionGUID: 9oehJm+USsWKJ6jcJP/o0g==
X-CSE-MsgGUID: 1PpiiTWdQ4yOmhF8dvGnFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68713931"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68713931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 22:15:34 -0800
X-CSE-ConnectionGUID: LkkFBAJuSoC7NKD49N8xeQ==
X-CSE-MsgGUID: e986ecVPTOidZf+zUCYAkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201407101"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Dec 2025 22:15:31 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaT0z-0000000007b-2AaA;
	Tue, 30 Dec 2025 06:15:29 +0000
Date: Tue, 30 Dec 2025 14:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 0/15]
 drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202512301413.8DZpsCQ4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f148785f0bb856bba8ceca2b699a2f102f22174a
commit: f0db1bf5852542c46c16d0b305193069e265f769 [0/15] Huawei BMA: Adding Huawei BMA driver: host_edma_drv
config: x86_64-randconfig-121-20251230 (https://download.01.org/0day-ci/archive/20251230/202512301413.8DZpsCQ4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512301413.8DZpsCQ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301413.8DZpsCQ4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:108:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:110:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:131:35: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:136:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:147:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:254:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:413:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:581:6: sparse: sparse: symbol 'host_dma_transfer_without_list' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:629:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:608:6: sparse: sparse: symbol 'host_dma_transfer_withlist' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:653:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:668:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:708:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:716:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:748:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:754:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:759:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:765:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:777:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:791:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:810:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:852:35: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:859:49: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:869:49: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:876:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:960:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:966:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:996:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1046:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1050:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1061:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1087:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1102:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1126:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1138:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1160:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1162:44: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1165:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1166:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1166:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1166:33: sparse:     got unsigned char *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1167:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1167:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1167:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1167:22: sparse:     got unsigned char *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1169:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1175:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1175:28: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1175:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1175:28: sparse:     got void *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1181:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1186:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1196:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1200:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1201:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1203:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1217:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1218:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1219:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1227:36: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1227:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1227:36: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1227:36: sparse:     got void *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1272:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1282:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1287:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1299:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1356:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1372:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1371:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *edma_send_addr @@     got void * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1371:35: sparse:     expected void [noderef] __iomem *edma_send_addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1371:35: sparse:     got void *
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *edma_send_addr @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     expected void const *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     got void [noderef] __iomem *edma_send_addr
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *edma_send_addr @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     expected void const *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     got void [noderef] __iomem *edma_send_addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got void [noderef] __iomem *edma_send_addr @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     expected void *p
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     got void [noderef] __iomem *edma_send_addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1377:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1376:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *edma_recv_addr @@     got void * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1376:35: sparse:     expected void [noderef] __iomem *edma_recv_addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1376:35: sparse:     got void *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1380:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1406:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1413:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1442:16: sparse: sparse: cast removes address space '__iomem' of expression

vim +1374 drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c

  1353	
  1354		edma_host->msg_send_buf = kmalloc(HOST_MAX_SEND_MBX_LEN, GFP_KERNEL);
  1355		if (!edma_host->msg_send_buf) {
  1356			BMA_LOG(DLOG_ERROR, "malloc msg_send_buf failed!");
  1357			ret = -ENOMEM;
  1358			goto failed1;
  1359		}
  1360	
  1361		edma_host->msg_send_write = 0;
  1362	
  1363		spin_lock_init(&edma_host->send_msg_lock);
  1364	
  1365		tasklet_init(&edma_host->tasklet,
  1366			     (void (*)(unsigned long))edma_host_isr_tasklet,
  1367			     (unsigned long)edma_host);
  1368	
  1369		edma_host->edma_flag = bma_dev->bma_pci_dev->edma_swap_addr;
  1370	
  1371		edma_host->edma_send_addr =
  1372		    (void *)((unsigned char *)bma_dev->bma_pci_dev->edma_swap_addr +
  1373			     HOST_DMA_FLAG_LEN);
> 1374		memset(edma_host->edma_send_addr, 0, SIZE_OF_MBX_HDR);
  1375	
  1376		edma_host->edma_recv_addr =
  1377		    (void *)((unsigned char *)edma_host->edma_send_addr +
  1378			     HOST_MAX_SEND_MBX_LEN);
  1379	
  1380		BMA_LOG(DLOG_DEBUG,
  1381			"edma_flag = %p, edma_send_addr = %p, edma_recv_addr = %p\n",
  1382			edma_host->edma_flag, edma_host->edma_send_addr,
  1383			edma_host->edma_recv_addr);
  1384	
  1385		edma_host->hostrtc_viraddr = bma_dev->bma_pci_dev->hostrtc_viraddr;
  1386	
  1387		init_waitqueue_head(&edma_host->wq_dmah2b);
  1388		init_waitqueue_head(&edma_host->wq_dmab2h);
  1389	
  1390		spin_lock_init(&edma_host->reg_lock);
  1391	
  1392		edma_host->h2b_state = H2BSTATE_IDLE;
  1393		edma_host->b2h_state = B2HSTATE_IDLE;
  1394	
  1395		#ifdef HAVE_TIMER_SETUP
  1396			timer_setup(&edma_host->heartbeat_timer,
  1397				    edma_host_heartbeat_timer, 0);
  1398		#else
  1399			setup_timer(&edma_host->heartbeat_timer,
  1400				    edma_host_heartbeat_timer,
  1401				    (unsigned long)edma_host);
  1402		#endif
  1403		(void)mod_timer(&edma_host->heartbeat_timer,
  1404				jiffies_64 + HEARTBEAT_TIMER_INTERVAL_CHECK);
  1405	
  1406		pnm = (struct notify_msg *)edma_host->edma_flag;
  1407		if (pnm)
  1408			pnm->host_registered = REGISTERED;
  1409	
  1410		GET_SYS_SECONDS(edma_host->statistics.init_time);
  1411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
