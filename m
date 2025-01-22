Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438B1C3C05
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737536782; cv=none; b=PXxZXI+PEiJNAXK9OVsfvO389wLgUWJeOe22+tceXMOEdmbzntcQahcVvS0do5GJj2Bi/wJAXLf8hUv8QuX9ow27uT8JSVlVz94EHrYTmQOnbt7ic8IVhEoYynmieteQlVOWLdITTd/V7s4jWDtfzDb3JH99g63vt1BRIgdaJpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737536782; c=relaxed/simple;
	bh=DM4/dY+P3HsVW38kY2mrcFNhkyOxCFKH2+J9Nioi4fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHPQ88goJLlJj0JDLC6AxJ5gDnHuCTpSvJeR/qqp4cCJCS4J3B+F4OMSm95+FBStEMYYefK3TBC9zGle/XNIf/05P/8UEGLVY4Ap7YUy+yGuU+OkiNjHh2eeuJ5mQAw5B610i2H2lA1ZQZFDBz1epRU/Z6avUm1s6OOg+zXKWag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2OfCSpf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2OfCSpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737536780; x=1769072780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DM4/dY+P3HsVW38kY2mrcFNhkyOxCFKH2+J9Nioi4fQ=;
  b=J2OfCSpfC4HyOf1xeWPqDcMdUVwoZ14QM0T8eXthZnlB1xANOH3mS+Ds
   qjgl6D89NNNQpmALORr3qj8EAgmss7LhYELFOgYBIyWdPo7uTp3eOw/id
   5yHikkCAvgP3QdSURuT1DDwWoWQDZohCmZaME3kk7zBSZkwLwikq31vJf
   0/QxdpNzuNSnJfmK/6nkpH+LVGXASvPY/M5ZldnjlYO1FQfQutyN0raY4
   YmdD3XlhOym9y5UJH0MO0sxYgBiMF5/Qz+8uqqGlsamBnLh8BnB3bslKG
   h3jgFfNqu9Mmy+i/kYZgQ4Wb02rC+ZhDD4rbdbRypvPumjMfS/5aFWnG5
   Q==;
X-CSE-ConnectionGUID: iA6eZ85MQ0eTz/Noc96+Fw==
X-CSE-MsgGUID: BvXxObepTrONNkxA8VTm7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48648670"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="48648670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 01:06:18 -0800
X-CSE-ConnectionGUID: R6AlqNB2SnSES/GVj91gcA==
X-CSE-MsgGUID: cRLFyU1PT3+9fndAfMJy3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111099364"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2025 01:06:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taWgg-000Zg7-2j;
	Wed, 22 Jan 2025 09:06:14 +0000
Date: Wed, 22 Jan 2025 17:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1741:9:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202501221622.ZyAVvHaC-lkp@intel.com>
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
commit: 4b4aa2fdd905bb63f965668452f1d1986555e1a3 [1834/1834] Huawei BMA: Adding Huawei BMA driver: cdev_veth_drv
config: x86_64-randconfig-121-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221622.ZyAVvHaC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221622.ZyAVvHaC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221622.ZyAVvHaC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1741:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1750:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1764:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1812:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1816:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1832:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1838:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1842:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1849:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:56:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:56:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:56:17: sparse:     got unsigned int ( * )( ... )
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:52:30: sparse: sparse: symbol 'g_eth_edma_cdev_fops' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:68:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:71:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:75:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:61:6: sparse: sparse: symbol 'dump_global_info' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:112:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:99:6: sparse: sparse: symbol 'edma_veth_free_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:115:6: sparse: sparse: symbol 'edma_veth_free_all_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:133:17: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:124:5: sparse: sparse: symbol 'edma_veth_setup_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:158:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:148:5: sparse: sparse: symbol 'edma_veth_setup_all_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:201:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:192:5: sparse: sparse: symbol 'edma_veth_setup_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:226:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:216:5: sparse: sparse: symbol 'edma_veth_setup_all_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:273:9: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:259:6: sparse: sparse: symbol 'edma_veth_free_rx_resources' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:276:6: sparse: sparse: symbol 'edma_veth_free_all_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:316:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:322:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:334:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:346:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:352:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:364:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:285:5: sparse: sparse: symbol 'edma_veth_setup_all_rxtx_queue' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:381:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:385:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:390:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:394:9: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:369:6: sparse: sparse: symbol 'edma_veth_dump' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:398:5: sparse: sparse: symbol 'edma_veth_setup_resource' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:424:5: sparse: sparse: symbol 'edma_veth_free_rxtx_queue' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:466:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:469:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:472:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:463:6: sparse: sparse: symbol 'edma_veth_free_resource' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:484:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:492:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:500:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:506:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:525:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:475:5: sparse: sparse: symbol 'edma_veth_send_one_pkt' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:577:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:608:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:615:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:631:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:647:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:652:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:661:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:673:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:684:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:716:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:722:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:740:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:745:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:746:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:754:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:764:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:772:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:787:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:833:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:840:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:843:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:858:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:875:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:801:5: sparse: sparse: symbol 'edma_veth_recv_pkt' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:883:6: sparse: sparse: symbol 'edma_task_do_packet_recv' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:916:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:923:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:908:5: sparse: sparse: symbol '__dmacmp_err_deal_2' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:941:5: sparse: sparse: symbol 'edma_veth_check_dma_status' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1005:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1008:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1023:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1026:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:962:5: sparse: sparse: symbol '__check_dmacmp_H_2' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1059:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1078:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1096:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1042:5: sparse: sparse: symbol '__checkspace_H_2' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1147:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1167:17: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1116:5: sparse: sparse: symbol '__make_dmalistbd_h2b_H_2' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1227:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1249:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1198:5: sparse: sparse: symbol '__make_dmalistbd_b2h_H_2' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1289:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1309:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1278:5: sparse: sparse: symbol '__start_dmalist_H_2' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1322:5: sparse: sparse: symbol 'check_dma_queue_fault_2' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1361:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1367:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1376:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1383:25: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1352:5: sparse: sparse: symbol '__dma_rxtx_H_2' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1424:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1425:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1439:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1440:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1419:6: sparse: sparse: symbol 'edma_task_do_data_transmit' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1456:5: sparse: sparse: symbol 'edma_tasklet_setup' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1504:6: sparse: sparse: symbol 'edma_tasklet_free' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1554:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1577:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1588:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1598:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1612:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1619:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1645:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1680:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1693:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1720:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1725:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1405:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:1405:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c:94:26: sparse: sparse: cast removes address space '__iomem' of expression

vim +1741 drivers/net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.c

  1736	
  1737	int cdev_open(struct inode *inode_ptr, struct file *filp)
  1738	{
  1739		struct cdev_dev_s *dev = &g_eth_edmaprivate.cdev;
  1740	
> 1741		LOG(DLOG_DEBUG, "Open device.");
  1742	
  1743		if (!inode_ptr || !filp)
  1744			return -EFAULT;
  1745	
  1746		/* only one instance is allowed. */
  1747		if (IS_CDEV_IN_OPEN_STATE())
  1748			return -EBUSY;
  1749	
  1750		LOG(DLOG_DEBUG, "Init flag, rx: %d, tx:%d",
  1751		    g_eth_edmaprivate.prx_queue->pshmqhd_v->init,
  1752		    g_eth_edmaprivate.ptx_queue->pshmqhd_v->init);
  1753	
  1754		/* save to private data. */
  1755		filp->private_data = dev;
  1756		SET_CDEV_OPEN_STATE(CDEV_OPENED);
  1757		g_read_pos = 0;
  1758	
  1759		return 0;
  1760	}
  1761	
  1762	int cdev_release(struct inode *inode_ptr, struct file *filp)
  1763	{
  1764		LOG(DLOG_DEBUG, "Close device.");
  1765	
  1766		if (!filp)
  1767			return 0;
  1768	
  1769		filp->private_data = NULL;
  1770	
  1771		SET_CDEV_OPEN_STATE(CDEV_CLOSED);
  1772	
  1773		return 0;
  1774	}
  1775	
  1776	unsigned int cdev_poll(struct file *filp, poll_table *wait)
  1777	{
  1778		unsigned int mask = 0;
  1779		wait_queue_head_t *queue_head = NULL;
  1780	
  1781		if (!filp)
  1782			return 0;
  1783	
  1784		edma_veth_dump();
  1785	
  1786		queue_head = (wait_queue_head_t *)
  1787		    bma_cdev_get_wait_queue(GET_PRIVATE_DATA(filp));
  1788		if (!queue_head)
  1789			return 0;
  1790	
  1791		/* check or add to wait queue. */
  1792		poll_wait(filp, queue_head, wait);
  1793	
  1794		if (!edma_is_queue_ready(g_eth_edmaprivate.prx_queue))
  1795			return 0;
  1796	
  1797		if (cdev_check_ring_recv() > 0)
  1798			mask = (POLLIN | POLLRDNORM);
  1799	
  1800		return mask;
  1801	}
  1802	
  1803	ssize_t cdev_read(struct file *filp, char __user *data,
  1804			  size_t count, loff_t *ppos)
  1805	{
  1806		struct edma_eth_dev_s *dev = &g_eth_edmaprivate;
  1807		ssize_t length = 0;
  1808	
  1809		if (!data || count >= MAX_PACKET_LEN)
  1810			return -EFAULT;
  1811	
  1812		LOG(DLOG_DEBUG, "read begin, count: %zu, pos: %u.", count, g_read_pos);
  1813	
  1814		length = cdev_copy_packet_to_user(dev, data, count);
  1815	
> 1816		LOG(DLOG_DEBUG, "read done, length: %zd, pos: %u.", length, g_read_pos);
  1817	
  1818		return length;
  1819	}
  1820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
