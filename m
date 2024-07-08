Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69953C0C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 03:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720410473; cv=none; b=blkOExRupDyA3skPrHEphjSqilcESkorDZyYVYIeAVPmGVEcS5TdbcVSt0A+u4QzAkaGjj5D1ZFc94bsArn2yqMeYPtykciuVG115QWWjChT3Acku20c0/Z5wXQyMwIMeKwcGHCD8qJ9JP4LBWFR9GIA9UAq+Y2xnWA2oFJQDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720410473; c=relaxed/simple;
	bh=RJ12Wz9rEhxqn/+6HKbfKswifUkxpI8CU0/2zWFhWW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnEF4to2zLQz+2kipaCR5sXH4BLJKp2n5AYkaI3vhDcDSqmA2d3/05Byi1du+2R4w1sPZ7f+vXsORHOcHxCTG9oLOAy7lhQ1Fw6Vi2Kd72Tmzp4j3ZcT8vBbbLOLlBtp4MsVEbu0UVk7SKyKN/G21IvzLdrF0S486gxhNx03Ukg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRly0KaV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRly0KaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720410471; x=1751946471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RJ12Wz9rEhxqn/+6HKbfKswifUkxpI8CU0/2zWFhWW8=;
  b=DRly0KaVAFddQWImmV4Fv/gbmpyjP8Tjn5n6SRO0W0dyeXnYM+0VYI6f
   xVChcaoTnz1iPRYBMFjklu1/dmDU0t/CpVCfKVPN9DqjnRJ6fx32rPnHN
   PxenNf++nvPmTLg7fOp07J1U8qtxn99XLCfPzHUpAalCHfFxZg0Vjsl74
   RBA6FOPCWZj+nyOtyOt/EK+BeFzYuoEfQG1NM6ogIVeGAAetwdOCgUzmB
   hq4zPNwXTPO8zMt1GvGVNsQYFxMSAvYvbt39h1pfjcbQA67ZOvYr0BonP
   Qtc9czaTCCj5GQHdeRr6c0CDBNGQbMfLaIxuf7EZ5FxTtp6K23Gy9yGGe
   g==;
X-CSE-ConnectionGUID: qzWk6BahSSGFbi7ScKcnrQ==
X-CSE-MsgGUID: wDHhyZ5WS9uY/5zruldpjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="21407761"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="21407761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 20:47:49 -0700
X-CSE-ConnectionGUID: U2c5xlTDTSGltUSk/loCWw==
X-CSE-MsgGUID: aaBQO51USpCdSBwfmL1YbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="78116678"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2024 20:47:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQfLs-000VUc-2V;
	Mon, 08 Jul 2024 03:47:44 +0000
Date: Mon, 8 Jul 2024 11:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7037/10596]
 drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202407081155.6fc6bMvH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3b421b6002e287e38790cbdad4a3e08baf7e1bc4
commit: f0db1bf5852542c46c16d0b305193069e265f769 [7037/10596] Huawei BMA: Adding Huawei BMA driver: host_edma_drv
config: loongarch-randconfig-r132-20240707 (https://download.01.org/0day-ci/archive/20240708/202407081155.6fc6bMvH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407081155.6fc6bMvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081155.6fc6bMvH-lkp@intel.com/

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
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *edma_send_addr @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     expected void *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     got void [noderef] __iomem *edma_send_addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1377:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1376:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *edma_recv_addr @@     got void * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1376:35: sparse:     expected void [noderef] __iomem *edma_recv_addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1376:35: sparse:     got void *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1380:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1406:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1413:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1442:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1374 drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c

  1268	
  1269	struct edma_user_inft_s *edma_host_get_user_inft(u32 type)
  1270	{
  1271		if (type >= TYPE_MAX) {
> 1272			BMA_LOG(DLOG_ERROR, "type error %d\n", type);
  1273			return NULL;
  1274		}
  1275	
  1276		return g_user_func[type];
  1277	}
  1278	
  1279	int edma_host_user_register(u32 type, struct edma_user_inft_s *func)
  1280	{
  1281		if (type >= TYPE_MAX) {
  1282			BMA_LOG(DLOG_ERROR, "type error %d\n", type);
  1283			return -EFAULT;
  1284		}
  1285	
  1286		if (!func) {
  1287			BMA_LOG(DLOG_ERROR, "func is NULL\n");
  1288			return -EFAULT;
  1289		}
  1290	
  1291		g_user_func[type] = func;
  1292	
  1293		return 0;
  1294	}
  1295	
  1296	int edma_host_user_unregister(u32 type)
  1297	{
  1298		if (type >= TYPE_MAX) {
  1299			BMA_LOG(DLOG_ERROR, "type error %d\n", type);
  1300			return -EFAULT;
  1301		}
  1302	
  1303		g_user_func[type] = NULL;
  1304	
  1305		return 0;
  1306	}
  1307	
  1308	int edma_host_init(struct edma_host_s *edma_host)
  1309	{
  1310		int ret = 0;
  1311		struct bma_dev_s *bma_dev = NULL;
  1312		struct notify_msg *pnm = NULL;
  1313	
  1314		if (!edma_host)
  1315			return -1;
  1316	
  1317		bma_dev = list_entry(edma_host, struct bma_dev_s, edma_host);
  1318		g_bma_dev = bma_dev;
  1319	
  1320		edma_host->pdev = bma_dev->bma_pci_dev->pdev;
  1321	
  1322	#ifdef EDMA_TIMER
  1323		#ifdef HAVE_TIMER_SETUP
  1324			timer_setup(&edma_host->timer, edma_host_timeout, 0);
  1325		#else
  1326			setup_timer(&edma_host->timer, edma_host_timeout,
  1327				    (unsigned long)edma_host);
  1328		#endif
  1329		(void)mod_timer(&edma_host->timer, jiffies_64 + TIMER_INTERVAL_CHECK);
  1330	#ifdef USE_DMA
  1331		#ifdef HAVE_TIMER_SETUP
  1332			timer_setup(&edma_host->dma_timer, edma_host_dma_timeout, 0);
  1333	
  1334		#else
  1335			setup_timer(&edma_host->dma_timer, edma_host_dma_timeout,
  1336				    (unsigned long)edma_host);
  1337		#endif
  1338		(void)mod_timer(&edma_host->dma_timer,
  1339				jiffies_64 + DMA_TIMER_INTERVAL_CHECK);
  1340	#endif
  1341	
  1342	#else
  1343		init_completion(&edma_host->msg_ready);
  1344	
  1345		edma_host->edma_thread =
  1346		    kthread_run(edma_host_thread, (void *)edma_host, "edma_host_msg");
  1347	
  1348		if (IS_ERR(edma_host->edma_thread)) {
  1349			BMA_LOG(DLOG_ERROR, "kernel_run  edma_host_msg failed\n");
  1350			return PTR_ERR(edma_host->edma_thread);
  1351		}
  1352	#endif
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
> 1371		edma_host->edma_send_addr =
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
