Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB23A60B96
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 19:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720380001; cv=none; b=UjiG9MrVNFAecI1dKxwLxtTVIwyZOlHYjc09JQZHJAFYzN5374s7lPVos6soiCKnCQKMmDPb5T/m/belOOlvk2XRjfXD+jQFfER8W6muDVRMu49lzJciMrHXwHOO2On5zu3yvZTXWqmjuqlaoQ2tWrnOSNZVSrUqV2u5nMfqHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720380001; c=relaxed/simple;
	bh=opNg/6hcLjIW+OIf0gytZndQOpqpuc+EzV3uLvoxhb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K34CNKCmHrZU3rXNZm4CmWh8XC/oPS/x0bxd1jBELCu6tpOa48yeUrE3ZyE/Kn85EQNGD9aXNxn1Pqg2NucYznuLvwZrEUIA996JP47CO/RvpsdA9AdU3rekALma0UF7o04ZmTTDjrF8TuEtpQ2g/oLqJIsC4Ng+9HDzCRn0wTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUmyCNCq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUmyCNCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720379999; x=1751915999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=opNg/6hcLjIW+OIf0gytZndQOpqpuc+EzV3uLvoxhb4=;
  b=WUmyCNCqldePa6ztPbLCLHMtmwGhTDxz3n5X7oV/j5G0Nw5TjbgzAkz5
   5iuAu+RZJK0yYspCU+ErkOD27JgDLE78BGeBbWn9ZO3ReJ2wtwc60b2df
   PRXDvLKcX/ei0roNI9dwwk5JW7YovaUVaipHhE/j2/g8pt1NZBXOwGIic
   pK8kkMeOoPI6u0KB/474YI+CMNL6ShC9mHmZs9RXWM8Wt0Gu+ZCR3nUD3
   u6iRAM5LLfKAfkpNy0festl2sxgtTUCwXvTZQCOnxV6cL/akWtIiaD//8
   FKVbeXbljlW8Bg4+6nvyyrwwxWw+2NSiEsVABl7jZlCpGW0epZUH8xWzK
   w==;
X-CSE-ConnectionGUID: dmgP2xGwQg6Nc0xrF7An3g==
X-CSE-MsgGUID: f5TLRkYAS2yN0LqdjiAquA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="21448461"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="21448461"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 12:19:58 -0700
X-CSE-ConnectionGUID: SgQCTqjMRDiPDY+ChMpP9g==
X-CSE-MsgGUID: L5djYBicTKOV/f8t3snEnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="78451810"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jul 2024 12:19:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQXQQ-000VDG-1J;
	Sun, 07 Jul 2024 19:19:54 +0000
Date: Mon, 8 Jul 2024 03:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3778/10596]
 drivers/video/fbdev/ls2k500sfb.c:322:49: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202407080311.6JOR7V5E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xianglai,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3b421b6002e287e38790cbdad4a3e08baf7e1bc4
commit: 351aa968603500987e891b20cc97a677602ae7c2 [3778/10596] loongarch/kernel: Fix loongarch compilation error
config: loongarch-randconfig-r132-20240707 (https://download.01.org/0day-ci/archive/20240708/202407080311.6JOR7V5E-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407080311.6JOR7V5E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080311.6JOR7V5E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/ls2k500sfb.c:144:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static p @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:144:27: sparse:     expected void *static p
   drivers/video/fbdev/ls2k500sfb.c:144:27: sparse:     got void [noderef] __iomem *
   drivers/video/fbdev/ls2k500sfb.c:146:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *static p @@
   drivers/video/fbdev/ls2k500sfb.c:146:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:146:30: sparse:     got void *static p
   drivers/video/fbdev/ls2k500sfb.c:201:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static p @@
   drivers/video/fbdev/ls2k500sfb.c:201:36: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:201:36: sparse:     got void *static p
   drivers/video/fbdev/ls2k500sfb.c:203:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:203:37: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:203:37: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:256:13: sparse: sparse: symbol 'ls2k500sfb_interrupt' was not declared. Should it be static?
   drivers/video/fbdev/ls2k500sfb.c:322:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:322:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:322:22: sparse:     got void *
>> drivers/video/fbdev/ls2k500sfb.c:322:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:322:49: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:322:49: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:323:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:323:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:323:22: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:323:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:323:53: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:323:53: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:324:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:324:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:324:22: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:324:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:324:53: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:324:53: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:325:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:325:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:325:22: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:325:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:325:51: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:325:51: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:458:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got char *preg @@
   drivers/video/fbdev/ls2k500sfb.c:458:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:458:28: sparse:     got char *preg
   drivers/video/fbdev/ls2k500sfb.c:459:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got char *preg @@
   drivers/video/fbdev/ls2k500sfb.c:459:32: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:459:32: sparse:     got char *preg
   drivers/video/fbdev/ls2k500sfb.c:571:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *penv @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:571:19: sparse:     expected char *penv
   drivers/video/fbdev/ls2k500sfb.c:571:19: sparse:     got void [noderef] __iomem *
   drivers/video/fbdev/ls2k500sfb.c:572:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *preg @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:572:19: sparse:     expected char *preg
   drivers/video/fbdev/ls2k500sfb.c:572:19: sparse:     got void [noderef] __iomem *
   drivers/video/fbdev/ls2k500sfb.c:674:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *penv @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:674:14: sparse:     expected char *penv
   drivers/video/fbdev/ls2k500sfb.c:674:14: sparse:     got void [noderef] __iomem *

vim +322 drivers/video/fbdev/ls2k500sfb.c

8248d42b7c5f433 Chong Qiao 2023-12-11  113  
4fbeaa84ef36adc Chong Qiao 2023-12-11  114  static unsigned long event_jiffies;
8248d42b7c5f433 Chong Qiao 2023-12-11  115  static void ls2k500sfb_events_fn(struct work_struct *work)
8248d42b7c5f433 Chong Qiao 2023-12-11  116  {
8248d42b7c5f433 Chong Qiao 2023-12-11  117  	struct ls2k500sfb_struct *priv = container_of(work, struct ls2k500sfb_struct, work);
8248d42b7c5f433 Chong Qiao 2023-12-11  118  	struct pci_dev *pdev = priv->dev;
8248d42b7c5f433 Chong Qiao 2023-12-11  119  	struct pci_dev *ppdev = pdev->bus->self;
8248d42b7c5f433 Chong Qiao 2023-12-11  120  	uint32_t i, d, timeout, retry = 0;
8248d42b7c5f433 Chong Qiao 2023-12-11  121  	static const uint32_t index[] = {
8248d42b7c5f433 Chong Qiao 2023-12-11  122  		0x10, 0x14, 0x18, 0x1c, 0x20, 0x24, 0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80, 4
8248d42b7c5f433 Chong Qiao 2023-12-11  123  	};
8248d42b7c5f433 Chong Qiao 2023-12-11  124  
8248d42b7c5f433 Chong Qiao 2023-12-11  125  	static uint32_t data[sizeof(index) / 4];
8248d42b7c5f433 Chong Qiao 2023-12-11  126  	static const uint32_t cindex[] = { 0x10, 0x3c, 4 };
8248d42b7c5f433 Chong Qiao 2023-12-11  127  
8248d42b7c5f433 Chong Qiao 2023-12-11  128  	static uint32_t cdata[sizeof(cindex) / 4];
8248d42b7c5f433 Chong Qiao 2023-12-11  129  	static uint32_t d80c, d71c, ctrl;
8248d42b7c5f433 Chong Qiao 2023-12-11  130  	static void *p;
8248d42b7c5f433 Chong Qiao 2023-12-11  131  
8248d42b7c5f433 Chong Qiao 2023-12-11  132  	if (!priv->running) {
8248d42b7c5f433 Chong Qiao 2023-12-11  133  		for (i = 0; i < ARRAY_SIZE(index); i++)
8248d42b7c5f433 Chong Qiao 2023-12-11  134  			pci_read_config_dword(ppdev, index[i], &data[i]);
8248d42b7c5f433 Chong Qiao 2023-12-11  135  		for (i = 0; i < ARRAY_SIZE(cindex); i++)
8248d42b7c5f433 Chong Qiao 2023-12-11  136  			pci_read_config_dword(pdev, cindex[i], &cdata[i]);
8248d42b7c5f433 Chong Qiao 2023-12-11  137  		if (ppdev->vendor == 0x14) {
8248d42b7c5f433 Chong Qiao 2023-12-11  138  			pci_read_config_dword(ppdev, 0x80c, &d80c);
8248d42b7c5f433 Chong Qiao 2023-12-11  139  			d80c = (d80c & ~(3 << 17)) | (1 << 17);
8248d42b7c5f433 Chong Qiao 2023-12-11  140  
8248d42b7c5f433 Chong Qiao 2023-12-11  141  			pci_read_config_dword(ppdev, 0x71c, &d71c);
8248d42b7c5f433 Chong Qiao 2023-12-11  142  			d71c |= 1 << 26;
8248d42b7c5f433 Chong Qiao 2023-12-11  143  
8248d42b7c5f433 Chong Qiao 2023-12-11  144  			p = pci_iomap(ppdev, 0, 0x100);
8248d42b7c5f433 Chong Qiao 2023-12-11  145  		}
8248d42b7c5f433 Chong Qiao 2023-12-11  146  		ctrl = readl(p);
8248d42b7c5f433 Chong Qiao 2023-12-11  147  		return;
8248d42b7c5f433 Chong Qiao 2023-12-11  148  	}
8248d42b7c5f433 Chong Qiao 2023-12-11  149  	local_bh_disable();
8248d42b7c5f433 Chong Qiao 2023-12-11  150  	pciebreak_smp_send_stop(100);
8248d42b7c5f433 Chong Qiao 2023-12-11  151  	wmb(); /* flush all write before we disable pcie window */
8248d42b7c5f433 Chong Qiao 2023-12-11  152  	pci_write_config_dword(ppdev, 0x18, 0);
8248d42b7c5f433 Chong Qiao 2023-12-11  153  	pci_write_config_dword(ppdev, 0x1c, 0);
8248d42b7c5f433 Chong Qiao 2023-12-11  154  	pci_write_config_dword(ppdev, 0x20, 0);
4fbeaa84ef36adc Chong Qiao 2023-12-11  155  	event_jiffies = jiffies;
8248d42b7c5f433 Chong Qiao 2023-12-11  156  	atomic_set(&waiting_for_pciebreak_ipi, 0);
8248d42b7c5f433 Chong Qiao 2023-12-11  157  	wmb(); /* flush all write after change pcie window */
8248d42b7c5f433 Chong Qiao 2023-12-11  158  	local_bh_enable();
8248d42b7c5f433 Chong Qiao 2023-12-11  159  	if (ppdev->vendor == 0x14) {
8248d42b7c5f433 Chong Qiao 2023-12-11  160  		timeout = 10000;
8248d42b7c5f433 Chong Qiao 2023-12-11  161  		while (timeout) {
8248d42b7c5f433 Chong Qiao 2023-12-11  162  			pci_read_config_dword(ppdev, 0x10, &d);
8248d42b7c5f433 Chong Qiao 2023-12-11  163  			d &= ~0xf;
8248d42b7c5f433 Chong Qiao 2023-12-11  164  			if (!d)
8248d42b7c5f433 Chong Qiao 2023-12-11  165  				break;
8248d42b7c5f433 Chong Qiao 2023-12-11  166  			mdelay(1);
8248d42b7c5f433 Chong Qiao 2023-12-11  167  			timeout--;
8248d42b7c5f433 Chong Qiao 2023-12-11  168  		};
8248d42b7c5f433 Chong Qiao 2023-12-11  169  		if (!timeout)
8248d42b7c5f433 Chong Qiao 2023-12-11  170  			pr_info("bar not clear 0\n");
8248d42b7c5f433 Chong Qiao 2023-12-11  171  
8248d42b7c5f433 Chong Qiao 2023-12-11  172  		pci_read_config_dword(ppdev, 0x0, &d);
8248d42b7c5f433 Chong Qiao 2023-12-11  173  		pr_info("pcie port deviceid=0x%x recover begin\n", d);
8248d42b7c5f433 Chong Qiao 2023-12-11  174  retrain:
8248d42b7c5f433 Chong Qiao 2023-12-11  175  		while (1) {
8248d42b7c5f433 Chong Qiao 2023-12-11  176  			pci_write_config_dword(ppdev, index[0], data[0]);
8248d42b7c5f433 Chong Qiao 2023-12-11  177  			pci_read_config_dword(ppdev, index[0], &d);
8248d42b7c5f433 Chong Qiao 2023-12-11  178  			d &= ~0xf;
8248d42b7c5f433 Chong Qiao 2023-12-11  179  			if (d)
8248d42b7c5f433 Chong Qiao 2023-12-11  180  				break;
8248d42b7c5f433 Chong Qiao 2023-12-11  181  			mdelay(1);
8248d42b7c5f433 Chong Qiao 2023-12-11  182  		}
8248d42b7c5f433 Chong Qiao 2023-12-11  183  
8248d42b7c5f433 Chong Qiao 2023-12-11  184  		while (1) {
8248d42b7c5f433 Chong Qiao 2023-12-11  185  			for (i = 0; i < ARRAY_SIZE(index); i++) {
8248d42b7c5f433 Chong Qiao 2023-12-11  186  				if (index[i] != 0x18 && index[i] != 0x1c && index[i] != 0x20)
8248d42b7c5f433 Chong Qiao 2023-12-11  187  					pci_write_config_dword(ppdev, index[i], data[i]);
8248d42b7c5f433 Chong Qiao 2023-12-11  188  			}
8248d42b7c5f433 Chong Qiao 2023-12-11  189  			pci_write_config_dword(ppdev, 0x80c, d80c);
8248d42b7c5f433 Chong Qiao 2023-12-11  190  			pci_write_config_dword(ppdev, 0x71c, d71c);
8248d42b7c5f433 Chong Qiao 2023-12-11  191  
8248d42b7c5f433 Chong Qiao 2023-12-11  192  			pci_read_config_dword(ppdev, 0x10, &d);
8248d42b7c5f433 Chong Qiao 2023-12-11  193  			d &= ~0xf;
8248d42b7c5f433 Chong Qiao 2023-12-11  194  			if (d)
8248d42b7c5f433 Chong Qiao 2023-12-11  195  				break;
8248d42b7c5f433 Chong Qiao 2023-12-11  196  			mdelay(1);
8248d42b7c5f433 Chong Qiao 2023-12-11  197  		}
8248d42b7c5f433 Chong Qiao 2023-12-11  198  
8248d42b7c5f433 Chong Qiao 2023-12-11  199  		timeout = 10000;
8248d42b7c5f433 Chong Qiao 2023-12-11  200  
8248d42b7c5f433 Chong Qiao 2023-12-11 @201  		writel(ctrl | 0x8, p);
8248d42b7c5f433 Chong Qiao 2023-12-11  202  		while (1) {
8248d42b7c5f433 Chong Qiao 2023-12-11  203  			d = readl(p + 0xc);
8248d42b7c5f433 Chong Qiao 2023-12-11  204  			if ((d & 0x11) == 0x11) {
8248d42b7c5f433 Chong Qiao 2023-12-11  205  				break;
8248d42b7c5f433 Chong Qiao 2023-12-11  206  			} else if (!timeout) {
8248d42b7c5f433 Chong Qiao 2023-12-11  207  				pr_info("pcie train failed status=0x%x\n", d);
8248d42b7c5f433 Chong Qiao 2023-12-11  208  				goto out;
8248d42b7c5f433 Chong Qiao 2023-12-11  209  			}
8248d42b7c5f433 Chong Qiao 2023-12-11  210  			mdelay(1);
8248d42b7c5f433 Chong Qiao 2023-12-11  211  			timeout--;
8248d42b7c5f433 Chong Qiao 2023-12-11  212  		}
8248d42b7c5f433 Chong Qiao 2023-12-11  213  
8248d42b7c5f433 Chong Qiao 2023-12-11  214  
8248d42b7c5f433 Chong Qiao 2023-12-11  215  		pr_info("pcie recovered done\n");
8248d42b7c5f433 Chong Qiao 2023-12-11  216  
8248d42b7c5f433 Chong Qiao 2023-12-11  217  		if (!retry) {
8248d42b7c5f433 Chong Qiao 2023-12-11  218  			/*wait u-boot ddr config */
8248d42b7c5f433 Chong Qiao 2023-12-11  219  			set_current_state(TASK_UNINTERRUPTIBLE);
8248d42b7c5f433 Chong Qiao 2023-12-11  220  			schedule_timeout(HZ*resetbootwait);
8248d42b7c5f433 Chong Qiao 2023-12-11  221  			set_current_state(TASK_RUNNING);
8248d42b7c5f433 Chong Qiao 2023-12-11  222  			pci_read_config_dword(ppdev, 0x10, &d);
8248d42b7c5f433 Chong Qiao 2023-12-11  223  			d &= ~0xf;
8248d42b7c5f433 Chong Qiao 2023-12-11  224  			if (!d) {
8248d42b7c5f433 Chong Qiao 2023-12-11  225  				retry = 1;
8248d42b7c5f433 Chong Qiao 2023-12-11  226  				goto retrain;
8248d42b7c5f433 Chong Qiao 2023-12-11  227  			}
8248d42b7c5f433 Chong Qiao 2023-12-11  228  		}
8248d42b7c5f433 Chong Qiao 2023-12-11  229  	} else {
8248d42b7c5f433 Chong Qiao 2023-12-11  230  		set_current_state(TASK_UNINTERRUPTIBLE);
8248d42b7c5f433 Chong Qiao 2023-12-11  231  		schedule_timeout(HZ*resetbootwait);
8248d42b7c5f433 Chong Qiao 2023-12-11  232  		set_current_state(TASK_RUNNING);
8248d42b7c5f433 Chong Qiao 2023-12-11  233  	}
8248d42b7c5f433 Chong Qiao 2023-12-11  234  	local_bh_disable();
8248d42b7c5f433 Chong Qiao 2023-12-11  235  	pciebreak_smp_send_stop(10000);
8248d42b7c5f433 Chong Qiao 2023-12-11  236  	wmb(); /* flush all write before we update pcie window */
8248d42b7c5f433 Chong Qiao 2023-12-11  237  	for (i = 0; i < ARRAY_SIZE(index); i++)
8248d42b7c5f433 Chong Qiao 2023-12-11  238  		pci_write_config_dword(ppdev, index[i], data[i]);
8248d42b7c5f433 Chong Qiao 2023-12-11  239  
8248d42b7c5f433 Chong Qiao 2023-12-11  240  	for (i = 0; i < ARRAY_SIZE(cindex); i++)
8248d42b7c5f433 Chong Qiao 2023-12-11  241  		pci_write_config_dword(pdev, cindex[i], cdata[i]);
8248d42b7c5f433 Chong Qiao 2023-12-11  242  	atomic_set(&waiting_for_pciebreak_ipi, 0);
8248d42b7c5f433 Chong Qiao 2023-12-11  243  	wmb(); /* flush all write after we update pcie window */
8248d42b7c5f433 Chong Qiao 2023-12-11  244  	local_bh_enable();
8248d42b7c5f433 Chong Qiao 2023-12-11  245  
8248d42b7c5f433 Chong Qiao 2023-12-11  246  
8248d42b7c5f433 Chong Qiao 2023-12-11  247  	pr_info("redraw console\n");
8248d42b7c5f433 Chong Qiao 2023-12-11  248  
8248d42b7c5f433 Chong Qiao 2023-12-11  249  	saved_console = fg_console;
8248d42b7c5f433 Chong Qiao 2023-12-11  250  	switch_console(fg_console > 0?fg_console - 1 : fg_console + 1);
8248d42b7c5f433 Chong Qiao 2023-12-11  251  	queue_delayed_work(priv->wq, &priv->redraw_work, HZ);
8248d42b7c5f433 Chong Qiao 2023-12-11  252  out:
8248d42b7c5f433 Chong Qiao 2023-12-11  253  	priv->running = 0;
8248d42b7c5f433 Chong Qiao 2023-12-11  254  }
8248d42b7c5f433 Chong Qiao 2023-12-11  255  
8248d42b7c5f433 Chong Qiao 2023-12-11  256  irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
8248d42b7c5f433 Chong Qiao 2023-12-11  257  {
8248d42b7c5f433 Chong Qiao 2023-12-11  258  	struct ls2k500sfb_struct *priv = arg;
8248d42b7c5f433 Chong Qiao 2023-12-11  259  	struct pci_dev *pdev = priv->dev;
8248d42b7c5f433 Chong Qiao 2023-12-11  260  
8248d42b7c5f433 Chong Qiao 2023-12-11  261  	if (irq == pdev->irq)
8248d42b7c5f433 Chong Qiao 2023-12-11  262  		pr_info("ls2k500sfb pcie interrupt\n");
8248d42b7c5f433 Chong Qiao 2023-12-11  263  	else
8248d42b7c5f433 Chong Qiao 2023-12-11  264  		pr_info("ls2k500sfb gpio interrupt\n");
8248d42b7c5f433 Chong Qiao 2023-12-11  265  	if (system_state != SYSTEM_RUNNING)
8248d42b7c5f433 Chong Qiao 2023-12-11  266  		return IRQ_HANDLED;
8248d42b7c5f433 Chong Qiao 2023-12-11  267  
8248d42b7c5f433 Chong Qiao 2023-12-11  268  	if (!priv->running) {
8248d42b7c5f433 Chong Qiao 2023-12-11  269  		if (!resetdelay || time_after(jiffies, priv->reset_time + resetdelay * HZ)) {
8248d42b7c5f433 Chong Qiao 2023-12-11  270  			priv->running = 1;
8248d42b7c5f433 Chong Qiao 2023-12-11  271  			queue_work(priv->wq, &priv->work);
8248d42b7c5f433 Chong Qiao 2023-12-11  272  		}
8248d42b7c5f433 Chong Qiao 2023-12-11  273  		priv->reset_time = jiffies;
8248d42b7c5f433 Chong Qiao 2023-12-11  274  	}
8248d42b7c5f433 Chong Qiao 2023-12-11  275  	return IRQ_HANDLED;
8248d42b7c5f433 Chong Qiao 2023-12-11  276  }
8248d42b7c5f433 Chong Qiao 2023-12-11  277  
8248d42b7c5f433 Chong Qiao 2023-12-11  278  #ifdef CONFIG_LOONGARCH
8248d42b7c5f433 Chong Qiao 2023-12-11  279  #define GPIO_OEN ((void *)IO_BASE+0x1fe00000+0x500)
8248d42b7c5f433 Chong Qiao 2023-12-11  280  #define GPIO_FUNCEN ((void *)IO_BASE+0x1fe00000+0x504)
8248d42b7c5f433 Chong Qiao 2023-12-11  281  #define GPIO_OUT ((void *)IO_BASE+0x1fe00000+0x508)
8248d42b7c5f433 Chong Qiao 2023-12-11  282  #define GPIO_IN ((void *)IO_BASE+0x1fe00000+0x50c)
8248d42b7c5f433 Chong Qiao 2023-12-11  283  #define GPIO_INTPOL ((void *)IO_BASE+0x1fe00000+0x510)
8248d42b7c5f433 Chong Qiao 2023-12-11  284  #define GPIO_INTEN ((void *)IO_BASE+0x1fe00000+0x514)
8248d42b7c5f433 Chong Qiao 2023-12-11  285  
8248d42b7c5f433 Chong Qiao 2023-12-11  286  static int gpiochip_match_name(struct gpio_chip *chip, void *data)
8248d42b7c5f433 Chong Qiao 2023-12-11  287  {
8248d42b7c5f433 Chong Qiao 2023-12-11  288  	const char *name = data;
8248d42b7c5f433 Chong Qiao 2023-12-11  289  
8248d42b7c5f433 Chong Qiao 2023-12-11  290  	return !strcmp(chip->label, name);
8248d42b7c5f433 Chong Qiao 2023-12-11  291  }
8248d42b7c5f433 Chong Qiao 2023-12-11  292  static int get_gpio_irq_from_acpi_table(int gpio)
8248d42b7c5f433 Chong Qiao 2023-12-11  293  {
8248d42b7c5f433 Chong Qiao 2023-12-11  294  	struct gpio_chip *chip;
8248d42b7c5f433 Chong Qiao 2023-12-11  295  	struct gpio_desc *desc;
8248d42b7c5f433 Chong Qiao 2023-12-11  296  
8248d42b7c5f433 Chong Qiao 2023-12-11  297  	chip = gpiochip_find("LOON0007:00", gpiochip_match_name);
8248d42b7c5f433 Chong Qiao 2023-12-11  298  	if (!chip)
8248d42b7c5f433 Chong Qiao 2023-12-11  299  		return -ENOENT;
8248d42b7c5f433 Chong Qiao 2023-12-11  300  	desc = gpiochip_request_own_desc(chip, gpio, "reboot", GPIO_LOOKUP_FLAGS_DEFAULT, GPIOD_IN);
8248d42b7c5f433 Chong Qiao 2023-12-11  301  	if (!desc)
8248d42b7c5f433 Chong Qiao 2023-12-11  302  		return -ENOENT;
8248d42b7c5f433 Chong Qiao 2023-12-11  303  	return gpiod_to_irq(desc);
8248d42b7c5f433 Chong Qiao 2023-12-11  304  }
8248d42b7c5f433 Chong Qiao 2023-12-11  305  
8248d42b7c5f433 Chong Qiao 2023-12-11  306  static int get_gpio_irq_from_acpi_gsi(int gpio)
8248d42b7c5f433 Chong Qiao 2023-12-11  307  {
8248d42b7c5f433 Chong Qiao 2023-12-11  308  	int gsi = 16 + (gpio & 7);
8248d42b7c5f433 Chong Qiao 2023-12-11  309  
8248d42b7c5f433 Chong Qiao 2023-12-11  310  	return  acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
8248d42b7c5f433 Chong Qiao 2023-12-11  311  }
8248d42b7c5f433 Chong Qiao 2023-12-11  312  
8248d42b7c5f433 Chong Qiao 2023-12-11  313  static int register_gpio_reboot_handler(struct ls2k500sfb_struct *priv)
8248d42b7c5f433 Chong Qiao 2023-12-11  314  {
8248d42b7c5f433 Chong Qiao 2023-12-11  315  	int irq = get_gpio_irq_from_acpi_table(GPIO);
8248d42b7c5f433 Chong Qiao 2023-12-11  316  
8248d42b7c5f433 Chong Qiao 2023-12-11  317  	if (irq < 0) {
8248d42b7c5f433 Chong Qiao 2023-12-11  318  		irq = get_gpio_irq_from_acpi_gsi(GPIO);
8248d42b7c5f433 Chong Qiao 2023-12-11  319  		pr_notice("gsi gpio irq %d\n", irq);
8248d42b7c5f433 Chong Qiao 2023-12-11  320  	} else
8248d42b7c5f433 Chong Qiao 2023-12-11  321  		pr_notice("acpi gpio irq %d\n", irq);
8248d42b7c5f433 Chong Qiao 2023-12-11 @322  	writel(readl(GPIO_OEN) | (0x1 << GPIO), GPIO_OEN);
8248d42b7c5f433 Chong Qiao 2023-12-11  323  	writel(readl(GPIO_FUNCEN) & ~(0x1 << GPIO), GPIO_FUNCEN);
8248d42b7c5f433 Chong Qiao 2023-12-11  324  	writel(readl(GPIO_INTPOL) & ~(0x1 << GPIO), GPIO_INTPOL);
8248d42b7c5f433 Chong Qiao 2023-12-11  325  	writel(readl(GPIO_INTEN) | (0x1 << GPIO), GPIO_INTEN);
8248d42b7c5f433 Chong Qiao 2023-12-11  326  	if (request_irq(irq, ls2k500sfb_interrupt, IRQF_SHARED | IRQF_TRIGGER_FALLING,
8248d42b7c5f433 Chong Qiao 2023-12-11  327  				"ls2k500sfb", priv))
8248d42b7c5f433 Chong Qiao 2023-12-11  328  		pr_err("request_irq(%d) failed\n", irq);
8248d42b7c5f433 Chong Qiao 2023-12-11  329  	return 0;
8248d42b7c5f433 Chong Qiao 2023-12-11  330  }
8248d42b7c5f433 Chong Qiao 2023-12-11  331  #endif
8248d42b7c5f433 Chong Qiao 2023-12-11  332  

:::::: The code at line 322 was first introduced by commit
:::::: 8248d42b7c5f4338a54f26d8efebec8614b43466 fbdev: add ls2k500sfb driver for ls2k500 bmc.

:::::: TO: Chong Qiao <qiaochong@loongson.cn>
:::::: CC: Hongchen Zhang <zhanghongchen@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
