Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB9145FE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 05:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737522334; cv=none; b=QUmcB94S8GE73WUhkN9kvTJv8M+FjN4kp00M8vI1QdRnYt+CZz7WXL7Cn9yo8y/Rc5SbowlM9CagacrMY0+8gu1EnC4fvq7XJcoR8U5V2q4q/Ry2LaV+Oi3NzpxHvQkL7UBtgWzgcflTT9lOAfZ75+0t52bWErNAJDyzP12KJ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737522334; c=relaxed/simple;
	bh=JURhIM+kA3zHxIHS9RaGJEgHYGE0/f3HI6Y/FrwlXV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8d0p8DfKSE0+jFAo5u7vIvL9vvCb60sBCcoKHNxPXWGOJW2fKIjnuiS5mRFHUb89ihU5R4eRXcw2biskZqr5iakUpj/2WBl0Dyp8tbQbDDvTMcD6f+xMKyWtH6gt83AkQhA/UQz5SEG93XDbXiIaWU8Svmxa7LdqLHMzlZTdao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrq9m9B6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrq9m9B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737522332; x=1769058332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JURhIM+kA3zHxIHS9RaGJEgHYGE0/f3HI6Y/FrwlXV0=;
  b=nrq9m9B6dv174Tm8YFUv58BP+Zp9lWP3kY4r0I5+Mrbx3MN/2rI0tUk8
   +b/XPRuekASzOUBEeU8q05ryJvVdlqSvzywTnGkq+jirTW46g7UCgyssa
   6sIvtywAQ/ndqrvQ6WYagKMt8Vg3siG+uxmufj05Xiv/pqgZiH8yJDsUK
   v5VafpOibkUqA3wnn5qVv4+xPp4pOvZ9l5F3ibHgPYu0VL8WadzyurxM4
   9Erj+LMSLqe+enFJx5QqwgqszB8c/jbj63oDawjfF/1nxpDJPaK7CkJ6P
   vrPPcnsFfHKPKyBVa5YbwXlDW2SAhuHhJUUqjDBdpz3R1bM/2xvK21coM
   A==;
X-CSE-ConnectionGUID: 2ZsuBGNBS1WPrdVbmPtQpw==
X-CSE-MsgGUID: XSbdL/8cQIuxOcD73NRZdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48953170"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="48953170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 21:05:31 -0800
X-CSE-ConnectionGUID: PCx0OCpnRS+GiIqyYqIlLA==
X-CSE-MsgGUID: 7KhcpFuuQw6N2/u45nASxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106863092"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jan 2025 21:05:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taSvg-000ZUV-1n;
	Wed, 22 Jan 2025 05:05:28 +0000
Date: Wed, 22 Jan 2025 13:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:88:23: sparse: sparse:
 symbol 'g_bspveth_dev' was not declared. Should it be static?
Message-ID: <202501221218.JgRI8RlC-lkp@intel.com>
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
commit: 0cafdd73feea92b9a246d4fab07872eb6bec9f2b [1834/1834] Huawei BMA: Adding Huawei BMA driver: host_veth_drv
config: x86_64-randconfig-121-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221218.JgRI8RlC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221218.JgRI8RlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221218.JgRI8RlC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:88:23: sparse: sparse: symbol 'g_bspveth_dev' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:400:5: sparse: sparse: symbol 'bspveth_setup_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:449:6: sparse: sparse: symbol 'bspveth_free_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:491:5: sparse: sparse: symbol 'bspveth_setup_all_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:560:6: sparse: sparse: symbol 'bspveth_free_all_tx_resources' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:577:5: sparse: sparse: symbol 'veth_alloc_one_rx_skb' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:622:5: sparse: sparse: symbol 'veth_refill_rxskb' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:661:5: sparse: sparse: symbol 'bspveth_setup_rx_skb' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:693:6: sparse: sparse: symbol 'bspveth_free_rx_skb' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:726:5: sparse: sparse: symbol 'bspveth_setup_all_rx_skb' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:754:6: sparse: sparse: symbol 'bspveth_free_all_rx_skb' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:766:5: sparse: sparse: symbol 'bspveth_setup_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:817:6: sparse: sparse: symbol 'bspveth_free_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:849:5: sparse: sparse: symbol 'bspveth_setup_all_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:914:6: sparse: sparse: symbol 'bspveth_free_all_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:932:5: sparse: sparse: symbol 'bspveth_dev_install' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:967:5: sparse: sparse: symbol 'bspveth_dev_uninstall' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1052:5: sparse: sparse: symbol 'veth_config' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1069:6: sparse: sparse: symbol 'bspveth_initstatis' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1094:5: sparse: sparse: symbol 'veth_ioctl' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1099:25: sparse: sparse: symbol 'veth_stats' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1104:5: sparse: sparse: symbol 'veth_mac_set' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1235:6: sparse: sparse: symbol 'veth_netdev_func_init' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1265:5: sparse: sparse: symbol 'veth_send_one_pkt' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1544:6: sparse: sparse: symbol 'veth_skbtrtimer_do' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1591:6: sparse: sparse: symbol 'veth_netdev_exit' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1630:5: sparse: sparse: symbol 'veth_netdev_init' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1721:6: sparse: sparse: symbol 'veth_dma_tx_timer_do_H' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1771:5: sparse: sparse: symbol 'dmacmp_err_deal' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1808:5: sparse: sparse: symbol 'veth_check_dma_status' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1836:5: sparse: sparse: symbol '__check_dmacmp_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1908:5: sparse: sparse: symbol '__checkspace_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1989:5: sparse: sparse: symbol '__make_dmalistbd_h2b_H' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2093:5: sparse: sparse: symbol '__make_dmalistbd_b2h_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2196:5: sparse: sparse: symbol '__start_dmalist_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2242:5: sparse: sparse: symbol 'check_dma_queue_fault' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2390:6: sparse: sparse: symbol 'bspveth_host_exit_H' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2439:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2404:5: sparse: sparse: symbol 'bspveth_host_init_H' was not declared. Should it be static?

vim +/g_bspveth_dev +88 drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c

    87	
  > 88	struct bspveth_device g_bspveth_dev = {};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
