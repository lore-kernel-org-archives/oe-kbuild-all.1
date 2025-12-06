Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92123239E7D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765016516; cv=none; b=ZWDBR6M10vXmUaQUfAh1PC89s3tkHLrZ21qvbzkJhzaiMAJbaAh6JueOrkFxkc4m3sQRYX5VLHS2Bz09JF7ail2sp2qvI6yPNNmBp967/+s8Q5k6+GxK8vP7DaNAhNSDWU1t8hQFT+jnOHcUNRjrEyj1GFqCQ4RXGTY0Db5v5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765016516; c=relaxed/simple;
	bh=fGRB3JUOvYmueCOfPZsGeuy3AqMYyx4SuLL60S5146I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FjeO2tV3bDcp1tOfE5gB3efR35ooP+57fR3oQFymh/HDfjcuAXCwM3VyIXwafX9t9RDGs76znrftmtDgClosfbVMt4ThCPfOd3EKfANFsy09w/gRRSKWQBt9t8jVHpgNMzZtfHINw9fy8erzpD3J8PVY2TSL+8Tayd/xYKc7HdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPdZSX9/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPdZSX9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765016514; x=1796552514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGRB3JUOvYmueCOfPZsGeuy3AqMYyx4SuLL60S5146I=;
  b=WPdZSX9/WdNfId/CNpA/p2LFBavtmSYLMtBpP12QqOVyF7cfaXn1RxSz
   fsHGMY4o61gvICJoWkCKpgsjji3p9Zou4ttfEsruJZtidFNiglaNdbma1
   5vsHISA1GERJ5dIhn5CC8rXyNEC5UYg5jeyvVzxwY23WNmDszpXLlQn8v
   L7rDyopbl+mDJtMdGSQaD4boxDPszweuDrcGhpy6bXOYgQICqfEVEiIpr
   DpNF700kV3lXXVlZoIVPopufV4VZKwJtE8ZRl58F+Zs/U1G3/q4RmSwsE
   IQrdfyQfgpPg7rwA/N2rm7tvFhJUGbh/e9edHO05AY/iHMeq7hd2VtxdH
   A==;
X-CSE-ConnectionGUID: E1UKJCdeSC2kUSsMe11LLw==
X-CSE-MsgGUID: nAhumcFEQeC3nrUKNujsmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67115443"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="67115443"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 02:21:54 -0800
X-CSE-ConnectionGUID: PLBLnVf2SJGtpaoDAB1Ypw==
X-CSE-MsgGUID: Ch/NwRyxRcid3uB+GWzDIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="200643709"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Dec 2025 02:21:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRpQD-00000000G51-2jwR;
	Sat, 06 Dec 2025 10:21:49 +0000
Date: Sat, 6 Dec 2025 18:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482]
 drivers/platform/mpam/mpam_devices.c:1491:28: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202512061826.DcyOGdhZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: bb66b4d115e55249e317def258a6992ec839bab4 [3482/3482] arm_mpam: Add mpam_msmon_read() to read monitor value
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061826.DcyOGdhZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061826.DcyOGdhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061826.DcyOGdhZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/mpam/mpam_devices.c:1491:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] __iomem io @@     got void [noderef] __iomem * @@
   drivers/platform/mpam/mpam_devices.c:1491:28: sparse:     expected void *[noderef] __iomem io
   drivers/platform/mpam/mpam_devices.c:1491:28: sparse:     got void [noderef] __iomem *
>> drivers/platform/mpam/mpam_devices.c:1500:44: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *mapped_hwpage @@     got void *[noderef] __iomem io @@
   drivers/platform/mpam/mpam_devices.c:1500:44: sparse:     expected void [noderef] __iomem *mapped_hwpage
   drivers/platform/mpam/mpam_devices.c:1500:44: sparse:     got void *[noderef] __iomem io
   drivers/platform/mpam/mpam_devices.c:1518:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] __iomem io @@     got void [noderef] __iomem * @@
   drivers/platform/mpam/mpam_devices.c:1518:28: sparse:     expected void *[noderef] __iomem io
   drivers/platform/mpam/mpam_devices.c:1518:28: sparse:     got void [noderef] __iomem *
>> drivers/platform/mpam/mpam_devices.c:1531:44: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *mapped_hwpage @@     got void * @@
   drivers/platform/mpam/mpam_devices.c:1531:44: sparse:     expected void [noderef] __iomem *mapped_hwpage
   drivers/platform/mpam/mpam_devices.c:1531:44: sparse:     got void *
   drivers/platform/mpam/mpam_devices.c:831:13: sparse: sparse: context imbalance in '__ris_msmon_read' - different lock contexts for basic block
>> drivers/platform/mpam/mpam_devices.c:1493:36: sparse: sparse: dereference of noderef expression
>> drivers/platform/mpam/mpam_devices.c:1493:36: sparse: sparse: dereference of noderef expression
   drivers/platform/mpam/mpam_devices.c:1496:47: sparse: sparse: dereference of noderef expression
   drivers/platform/mpam/mpam_devices.c:1496:47: sparse: sparse: dereference of noderef expression
   drivers/platform/mpam/mpam_devices.c:1520:36: sparse: sparse: dereference of noderef expression
   drivers/platform/mpam/mpam_devices.c:1520:36: sparse: sparse: dereference of noderef expression
   drivers/platform/mpam/mpam_devices.c:1524:47: sparse: sparse: dereference of noderef expression
   drivers/platform/mpam/mpam_devices.c:1524:47: sparse: sparse: dereference of noderef expression

vim +1491 drivers/platform/mpam/mpam_devices.c

3e9e723f3bf92a James Morse 2024-01-22  1433  
3e9e723f3bf92a James Morse 2024-01-22  1434  static int mpam_msc_drv_probe(struct platform_device *pdev)
3e9e723f3bf92a James Morse 2024-01-22  1435  {
3e9e723f3bf92a James Morse 2024-01-22  1436  	int err;
3e9e723f3bf92a James Morse 2024-01-22  1437  	pgprot_t prot;
3e9e723f3bf92a James Morse 2024-01-22  1438  	void * __iomem io;
3e9e723f3bf92a James Morse 2024-01-22  1439  	struct mpam_msc *msc;
3e9e723f3bf92a James Morse 2024-01-22  1440  	struct resource *msc_res;
3e9e723f3bf92a James Morse 2024-01-22  1441  	void *plat_data = pdev->dev.platform_data;
3e9e723f3bf92a James Morse 2024-01-22  1442  
3e9e723f3bf92a James Morse 2024-01-22  1443  	mutex_lock(&mpam_list_lock);
3e9e723f3bf92a James Morse 2024-01-22  1444  	do {
3e9e723f3bf92a James Morse 2024-01-22  1445  		msc = devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
3e9e723f3bf92a James Morse 2024-01-22  1446  		if (!msc) {
3e9e723f3bf92a James Morse 2024-01-22  1447  			err = -ENOMEM;
3e9e723f3bf92a James Morse 2024-01-22  1448  			break;
3e9e723f3bf92a James Morse 2024-01-22  1449  		}
3e9e723f3bf92a James Morse 2024-01-22  1450  
3e9e723f3bf92a James Morse 2024-01-22  1451  		INIT_LIST_HEAD_RCU(&msc->glbl_list);
3e9e723f3bf92a James Morse 2024-01-22  1452  		msc->pdev = pdev;
3e9e723f3bf92a James Morse 2024-01-22  1453  
3e9e723f3bf92a James Morse 2024-01-22  1454  		err = device_property_read_u32(&pdev->dev, "arm,not-ready-us",
3e9e723f3bf92a James Morse 2024-01-22  1455  					       &msc->nrdy_usec);
3e9e723f3bf92a James Morse 2024-01-22  1456  		if (err) {
3e9e723f3bf92a James Morse 2024-01-22  1457  			/* This will prevent CSU monitors being usable */
3e9e723f3bf92a James Morse 2024-01-22  1458  			msc->nrdy_usec = 0;
3e9e723f3bf92a James Morse 2024-01-22  1459  		}
3e9e723f3bf92a James Morse 2024-01-22  1460  
3e9e723f3bf92a James Morse 2024-01-22  1461  		err = get_msc_affinity(msc);
3e9e723f3bf92a James Morse 2024-01-22  1462  		if (err)
3e9e723f3bf92a James Morse 2024-01-22  1463  			break;
3e9e723f3bf92a James Morse 2024-01-22  1464  		if (cpumask_empty(&msc->accessibility)) {
3e9e723f3bf92a James Morse 2024-01-22  1465  			pr_err_once("msc:%u is not accessible from any CPU!",
3e9e723f3bf92a James Morse 2024-01-22  1466  				    msc->id);
3e9e723f3bf92a James Morse 2024-01-22  1467  			err = -EINVAL;
3e9e723f3bf92a James Morse 2024-01-22  1468  			break;
3e9e723f3bf92a James Morse 2024-01-22  1469  		}
3e9e723f3bf92a James Morse 2024-01-22  1470  
3e9e723f3bf92a James Morse 2024-01-22  1471  		mutex_init(&msc->lock);
3e9e723f3bf92a James Morse 2024-01-22  1472  		msc->id = mpam_num_msc++;
3e9e723f3bf92a James Morse 2024-01-22  1473  		INIT_LIST_HEAD_RCU(&msc->ris);
3e9e723f3bf92a James Morse 2024-01-22  1474  		spin_lock_init(&msc->part_sel_lock);
3e9e723f3bf92a James Morse 2024-01-22  1475  		spin_lock_init(&msc->mon_sel_lock);
3e9e723f3bf92a James Morse 2024-01-22  1476  
79a4fc6c372c12 James Morse 2024-01-22  1477  		err = mpam_msc_setup_error_irq(msc);
79a4fc6c372c12 James Morse 2024-01-22  1478  		if (err) {
79a4fc6c372c12 James Morse 2024-01-22  1479  			devm_kfree(&pdev->dev, msc);
79a4fc6c372c12 James Morse 2024-01-22  1480  			msc = ERR_PTR(err);
79a4fc6c372c12 James Morse 2024-01-22  1481  			break;
79a4fc6c372c12 James Morse 2024-01-22  1482  		}
79a4fc6c372c12 James Morse 2024-01-22  1483  
3e9e723f3bf92a James Morse 2024-01-22  1484  		if (device_property_read_u32(&pdev->dev, "pcc-channel",
3e9e723f3bf92a James Morse 2024-01-22  1485  					     &msc->pcc_subspace_id))
3e9e723f3bf92a James Morse 2024-01-22  1486  			msc->iface = MPAM_IFACE_MMIO;
3e9e723f3bf92a James Morse 2024-01-22  1487  		else
3e9e723f3bf92a James Morse 2024-01-22  1488  			msc->iface = MPAM_IFACE_PCC;
3e9e723f3bf92a James Morse 2024-01-22  1489  
3e9e723f3bf92a James Morse 2024-01-22  1490  		if (msc->iface == MPAM_IFACE_MMIO) {
3e9e723f3bf92a James Morse 2024-01-22 @1491  			io = devm_platform_get_and_ioremap_resource(pdev, 0,
3e9e723f3bf92a James Morse 2024-01-22  1492  								    &msc_res);
3e9e723f3bf92a James Morse 2024-01-22 @1493  			if (IS_ERR(io)) {
3e9e723f3bf92a James Morse 2024-01-22  1494  				pr_err("Failed to map MSC base address\n");
3e9e723f3bf92a James Morse 2024-01-22  1495  				devm_kfree(&pdev->dev, msc);
3e9e723f3bf92a James Morse 2024-01-22  1496  				err = PTR_ERR(io);
3e9e723f3bf92a James Morse 2024-01-22  1497  				break;
3e9e723f3bf92a James Morse 2024-01-22  1498  			}
3e9e723f3bf92a James Morse 2024-01-22  1499  			msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
3e9e723f3bf92a James Morse 2024-01-22 @1500  			msc->mapped_hwpage = io;
3e9e723f3bf92a James Morse 2024-01-22  1501  		} else if (msc->iface == MPAM_IFACE_PCC) {
3e9e723f3bf92a James Morse 2024-01-22  1502  			msc->pcc_cl.dev = &pdev->dev;
3e9e723f3bf92a James Morse 2024-01-22  1503  			msc->pcc_cl.rx_callback = mpam_pcc_rx_callback;
3e9e723f3bf92a James Morse 2024-01-22  1504  			msc->pcc_cl.tx_block = false;
3e9e723f3bf92a James Morse 2024-01-22  1505  			msc->pcc_cl.tx_tout = 1000; /* 1s */
3e9e723f3bf92a James Morse 2024-01-22  1506  			msc->pcc_cl.knows_txdone = false;
3e9e723f3bf92a James Morse 2024-01-22  1507  
3e9e723f3bf92a James Morse 2024-01-22  1508  			msc->pcc_chan = pcc_mbox_request_channel(&msc->pcc_cl,
3e9e723f3bf92a James Morse 2024-01-22  1509  								 msc->pcc_subspace_id);
3e9e723f3bf92a James Morse 2024-01-22  1510  			if (IS_ERR(msc->pcc_chan)) {
3e9e723f3bf92a James Morse 2024-01-22  1511  				pr_err("Failed to request MSC PCC channel\n");
3e9e723f3bf92a James Morse 2024-01-22  1512  				devm_kfree(&pdev->dev, msc);
3e9e723f3bf92a James Morse 2024-01-22  1513  				err = PTR_ERR(msc->pcc_chan);
3e9e723f3bf92a James Morse 2024-01-22  1514  				break;
3e9e723f3bf92a James Morse 2024-01-22  1515  			}
3e9e723f3bf92a James Morse 2024-01-22  1516  
3e9e723f3bf92a James Morse 2024-01-22  1517  			prot = __acpi_get_mem_attribute(msc->pcc_chan->shmem_base_addr);
3e9e723f3bf92a James Morse 2024-01-22  1518  			io = ioremap_prot(msc->pcc_chan->shmem_base_addr,
3e9e723f3bf92a James Morse 2024-01-22  1519  					  msc->pcc_chan->shmem_size, pgprot_val(prot));
3e9e723f3bf92a James Morse 2024-01-22  1520  			if (IS_ERR(io)) {
3e9e723f3bf92a James Morse 2024-01-22  1521  				pr_err("Failed to map MSC base address\n");
3e9e723f3bf92a James Morse 2024-01-22  1522  				pcc_mbox_free_channel(msc->pcc_chan);
3e9e723f3bf92a James Morse 2024-01-22  1523  				devm_kfree(&pdev->dev, msc);
3e9e723f3bf92a James Morse 2024-01-22  1524  				err = PTR_ERR(io);
3e9e723f3bf92a James Morse 2024-01-22  1525  				break;
3e9e723f3bf92a James Morse 2024-01-22  1526  			}
3e9e723f3bf92a James Morse 2024-01-22  1527  
3e9e723f3bf92a James Morse 2024-01-22  1528  			/* TODO: issue a read to update the registers */
3e9e723f3bf92a James Morse 2024-01-22  1529  
3e9e723f3bf92a James Morse 2024-01-22  1530  			msc->mapped_hwpage_sz = msc->pcc_chan->shmem_size;
3e9e723f3bf92a James Morse 2024-01-22 @1531  			msc->mapped_hwpage = io + sizeof(struct acpi_pcct_shared_memory);
3e9e723f3bf92a James Morse 2024-01-22  1532  		}
3e9e723f3bf92a James Morse 2024-01-22  1533  
3e9e723f3bf92a James Morse 2024-01-22  1534  		list_add_rcu(&msc->glbl_list, &mpam_all_msc);
3e9e723f3bf92a James Morse 2024-01-22  1535  		platform_set_drvdata(pdev, msc);
3e9e723f3bf92a James Morse 2024-01-22  1536  	} while (0);
3e9e723f3bf92a James Morse 2024-01-22  1537  	mutex_unlock(&mpam_list_lock);
3e9e723f3bf92a James Morse 2024-01-22  1538  
3e9e723f3bf92a James Morse 2024-01-22  1539  	if (!err) {
3e9e723f3bf92a James Morse 2024-01-22  1540  		/* Create RIS entries described by firmware */
3e9e723f3bf92a James Morse 2024-01-22  1541  		if (!acpi_disabled)
3e9e723f3bf92a James Morse 2024-01-22  1542  			err = acpi_mpam_parse_resources(msc, plat_data);
3e9e723f3bf92a James Morse 2024-01-22  1543  		else
3e9e723f3bf92a James Morse 2024-01-22  1544  			err = mpam_dt_parse_resources(msc, plat_data);
3e9e723f3bf92a James Morse 2024-01-22  1545  	}
3e9e723f3bf92a James Morse 2024-01-22  1546  
3e9e723f3bf92a James Morse 2024-01-22  1547  	if (!err && fw_num_msc == mpam_num_msc)
3f4b9c31f924c3 James Morse 2024-01-22  1548  		mpam_register_cpuhp_callbacks(&mpam_discovery_cpu_online);
3e9e723f3bf92a James Morse 2024-01-22  1549  
3e9e723f3bf92a James Morse 2024-01-22  1550  	return err;
3e9e723f3bf92a James Morse 2024-01-22  1551  }
3e9e723f3bf92a James Morse 2024-01-22  1552  

:::::: The code at line 1491 was first introduced by commit
:::::: 3e9e723f3bf92a19e5e15dda89bbb136ce463294 arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Zeng Heng <zengheng4@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
