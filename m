Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70332356D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766507494; cv=none; b=LhnCp5+Md9UwV9KoFmpVCx3iz3wErZc7CQQjQFfQFB+CreS5T4q3IwZ0MpL4DCKIXH6giU7CnerVmBZ0z2xOES98Mav0/XHLI1YICuWKpbZnbmzzD0pxD9dn5WF5fJirfQTo7qPaJTS6akyIruklpgICP09ePLdCdLYmnzktNFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766507494; c=relaxed/simple;
	bh=gwmK3s3H9igcEhrgg/q3SxSGD/HTkunKR+nVDymme3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uVq+ZLduArts3e35zjD+mUFvRr0/HlSCKtzpPsvM4Y5NdPbx2quA//kDyhXfOHMqNK5QNVHD4I1ux92PPS6Ke2VlOP1mKskRU+ykSAVMycTO6pm+lHGKqG0WO8DrHl3nRKfXSKUFjvtzd61Q0zOZhAX4QkvTwoC9jYPm/6f1qCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bel4q1bx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bel4q1bx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766507493; x=1798043493;
  h=date:from:to:cc:subject:message-id;
  bh=gwmK3s3H9igcEhrgg/q3SxSGD/HTkunKR+nVDymme3w=;
  b=bel4q1bxenUXMFJTjSmdcRVJabfJAWj1VqGLmVf55LG1pbfuOkh34i5W
   0YmX6K2TAoImtKJKtcvjS0Ey4o9G5Q2by4I14ZeYJYgkL8N3xF4egrtXS
   oWjXMYDjMe2KxkzkGht+toSpNHv5xHAzDZRabCGwEiHlOFgqyYaaQDkiB
   pvAW4g67bBnNDGWS2bFDXAbB56e6iHES9FB10Pclg/owHqIwh93GCWYDY
   2RYHFpuTf/6j2vlwmr2So8N9uI1vagQ8zUgbwj55fmjXqM2SfLnXyq6ZF
   2LzcdAks1iw8SRpFj3d4EqKO2e7PpAdTuEeSmvemhdwH5z8YB2W9j8MnC
   g==;
X-CSE-ConnectionGUID: Kmc4a1mZTWKXE7NRNCrFDA==
X-CSE-MsgGUID: 5S4UnugnRNKefT3GxkFAog==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68293791"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68293791"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:31:31 -0800
X-CSE-ConnectionGUID: 12w06xhwR3OS34Erc8ppuw==
X-CSE-MsgGUID: YDuoQaQ5RzKByx3uXDwmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199843411"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Dec 2025 08:31:30 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY5I1-0000000029l-0m1G;
	Tue, 23 Dec 2025 16:31:19 +0000
Date: Wed, 24 Dec 2025 00:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544]
 drivers/video/fbdev/ls2k500sfb.c:143:27: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512240049.8n7uFL15-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 8248d42b7c5f4338a54f26d8efebec8614b43466 [3544/3544] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-randconfig-r121-20251215 (https://download.01.org/0day-ci/archive/20251224/202512240049.8n7uFL15-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240049.8n7uFL15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240049.8n7uFL15-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/ls2k500sfb.c:143:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static p @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:143:27: sparse:     expected void *static p
   drivers/video/fbdev/ls2k500sfb.c:143:27: sparse:     got void [noderef] __iomem *
>> drivers/video/fbdev/ls2k500sfb.c:145:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *static p @@
   drivers/video/fbdev/ls2k500sfb.c:145:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:145:30: sparse:     got void *static p
>> drivers/video/fbdev/ls2k500sfb.c:199:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static p @@
   drivers/video/fbdev/ls2k500sfb.c:199:36: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:199:36: sparse:     got void *static p
>> drivers/video/fbdev/ls2k500sfb.c:201:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:201:37: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:201:37: sparse:     got void *
>> drivers/video/fbdev/ls2k500sfb.c:254:13: sparse: sparse: symbol 'ls2k500sfb_interrupt' was not declared. Should it be static?
>> drivers/video/fbdev/ls2k500sfb.c:456:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got char *preg @@
   drivers/video/fbdev/ls2k500sfb.c:456:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:456:28: sparse:     got char *preg
>> drivers/video/fbdev/ls2k500sfb.c:457:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got char *preg @@
   drivers/video/fbdev/ls2k500sfb.c:457:32: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:457:32: sparse:     got char *preg
>> drivers/video/fbdev/ls2k500sfb.c:569:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *penv @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:569:19: sparse:     expected char *penv
   drivers/video/fbdev/ls2k500sfb.c:569:19: sparse:     got void [noderef] __iomem *
>> drivers/video/fbdev/ls2k500sfb.c:570:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *preg @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:570:19: sparse:     expected char *preg
   drivers/video/fbdev/ls2k500sfb.c:570:19: sparse:     got void [noderef] __iomem *
   drivers/video/fbdev/ls2k500sfb.c:671:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *penv @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:671:14: sparse:     expected char *penv
   drivers/video/fbdev/ls2k500sfb.c:671:14: sparse:     got void [noderef] __iomem *

vim +143 drivers/video/fbdev/ls2k500sfb.c

   113	
   114	static void ls2k500sfb_events_fn(struct work_struct *work)
   115	{
   116		struct ls2k500sfb_struct *priv = container_of(work, struct ls2k500sfb_struct, work);
   117		struct pci_dev *pdev = priv->dev;
   118		struct pci_dev *ppdev = pdev->bus->self;
   119		uint32_t i, d, timeout, retry = 0;
   120		static const uint32_t index[] = {
   121			0x10, 0x14, 0x18, 0x1c, 0x20, 0x24, 0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80, 4
   122		};
   123	
   124		static uint32_t data[sizeof(index) / 4];
   125		static const uint32_t cindex[] = { 0x10, 0x3c, 4 };
   126	
   127		static uint32_t cdata[sizeof(cindex) / 4];
   128		static uint32_t d80c, d71c, ctrl;
   129		static void *p;
   130	
   131		if (!priv->running) {
   132			for (i = 0; i < ARRAY_SIZE(index); i++)
   133				pci_read_config_dword(ppdev, index[i], &data[i]);
   134			for (i = 0; i < ARRAY_SIZE(cindex); i++)
   135				pci_read_config_dword(pdev, cindex[i], &cdata[i]);
   136			if (ppdev->vendor == 0x14) {
   137				pci_read_config_dword(ppdev, 0x80c, &d80c);
   138				d80c = (d80c & ~(3 << 17)) | (1 << 17);
   139	
   140				pci_read_config_dword(ppdev, 0x71c, &d71c);
   141				d71c |= 1 << 26;
   142	
 > 143				p = pci_iomap(ppdev, 0, 0x100);
   144			}
 > 145			ctrl = readl(p);
   146			return;
   147		}
   148		local_bh_disable();
   149		pciebreak_smp_send_stop(100);
   150		wmb(); /* flush all write before we disable pcie window */
   151		pci_write_config_dword(ppdev, 0x18, 0);
   152		pci_write_config_dword(ppdev, 0x1c, 0);
   153		pci_write_config_dword(ppdev, 0x20, 0);
   154		atomic_set(&waiting_for_pciebreak_ipi, 0);
   155		wmb(); /* flush all write after change pcie window */
   156		local_bh_enable();
   157		if (ppdev->vendor == 0x14) {
   158			timeout = 10000;
   159			while (timeout) {
   160				pci_read_config_dword(ppdev, 0x10, &d);
   161				d &= ~0xf;
   162				if (!d)
   163					break;
   164				mdelay(1);
   165				timeout--;
   166			};
   167			if (!timeout)
   168				pr_info("bar not clear 0\n");
   169	
   170			pci_read_config_dword(ppdev, 0x0, &d);
   171			pr_info("pcie port deviceid=0x%x recover begin\n", d);
   172	retrain:
   173			while (1) {
   174				pci_write_config_dword(ppdev, index[0], data[0]);
   175				pci_read_config_dword(ppdev, index[0], &d);
   176				d &= ~0xf;
   177				if (d)
   178					break;
   179				mdelay(1);
   180			}
   181	
   182			while (1) {
   183				for (i = 0; i < ARRAY_SIZE(index); i++) {
   184					if (index[i] != 0x18 && index[i] != 0x1c && index[i] != 0x20)
   185						pci_write_config_dword(ppdev, index[i], data[i]);
   186				}
   187				pci_write_config_dword(ppdev, 0x80c, d80c);
   188				pci_write_config_dword(ppdev, 0x71c, d71c);
   189	
   190				pci_read_config_dword(ppdev, 0x10, &d);
   191				d &= ~0xf;
   192				if (d)
   193					break;
   194				mdelay(1);
   195			}
   196	
   197			timeout = 10000;
   198	
 > 199			writel(ctrl | 0x8, p);
   200			while (1) {
 > 201				d = readl(p + 0xc);
   202				if ((d & 0x11) == 0x11) {
   203					break;
   204				} else if (!timeout) {
   205					pr_info("pcie train failed status=0x%x\n", d);
   206					goto out;
   207				}
   208				mdelay(1);
   209				timeout--;
   210			}
   211	
   212	
   213			pr_info("pcie recovered done\n");
   214	
   215			if (!retry) {
   216				/*wait u-boot ddr config */
   217				set_current_state(TASK_UNINTERRUPTIBLE);
   218				schedule_timeout(HZ*resetbootwait);
   219				set_current_state(TASK_RUNNING);
   220				pci_read_config_dword(ppdev, 0x10, &d);
   221				d &= ~0xf;
   222				if (!d) {
   223					retry = 1;
   224					goto retrain;
   225				}
   226			}
   227		} else {
   228			set_current_state(TASK_UNINTERRUPTIBLE);
   229			schedule_timeout(HZ*resetbootwait);
   230			set_current_state(TASK_RUNNING);
   231		}
   232		local_bh_disable();
   233		pciebreak_smp_send_stop(10000);
   234		wmb(); /* flush all write before we update pcie window */
   235		for (i = 0; i < ARRAY_SIZE(index); i++)
   236			pci_write_config_dword(ppdev, index[i], data[i]);
   237	
   238		for (i = 0; i < ARRAY_SIZE(cindex); i++)
   239			pci_write_config_dword(pdev, cindex[i], cdata[i]);
   240		atomic_set(&waiting_for_pciebreak_ipi, 0);
   241		wmb(); /* flush all write after we update pcie window */
   242		local_bh_enable();
   243	
   244	
   245		pr_info("redraw console\n");
   246	
   247		saved_console = fg_console;
   248		switch_console(fg_console > 0?fg_console - 1 : fg_console + 1);
   249		queue_delayed_work(priv->wq, &priv->redraw_work, HZ);
   250	out:
   251		priv->running = 0;
   252	}
   253	
 > 254	irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
   255	{
   256		struct ls2k500sfb_struct *priv = arg;
   257		struct pci_dev *pdev = priv->dev;
   258	
   259		if (irq == pdev->irq)
   260			pr_info("ls2k500sfb pcie interrupt\n");
   261		else
   262			pr_info("ls2k500sfb gpio interrupt\n");
   263		if (system_state != SYSTEM_RUNNING)
   264			return IRQ_HANDLED;
   265	
   266		if (!priv->running) {
   267			if (!resetdelay || time_after(jiffies, priv->reset_time + resetdelay * HZ)) {
   268				priv->running = 1;
   269				queue_work(priv->wq, &priv->work);
   270			}
   271			priv->reset_time = jiffies;
   272		}
   273		return IRQ_HANDLED;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
