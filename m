Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B5316D302
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712760015; cv=none; b=Bx4mI+rCS/G/k61sD/syKNrbGW99ybJy3iFb9F5J1iq9zO9rZzElzxBRMZjmH+rcx15KbJuxvxazBBLHLj5SlyWTscDzR8Ucd3vuwrvU4eNq9LM6kbXohDQkDE1OXiOl9b646LPfHC3gIKE5/mVBMc4KAW0fpHZG+SFLqqvEcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712760015; c=relaxed/simple;
	bh=FAQHrBAqk64yKRUCwPjPIiS4XOUnYQ2K1M8s0iD/NSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S9fAg+7DvvTJLtN+WzojyopNIjLxUdpCJxQztCI93Ed7fBloTzVgq4k7QZGTeDCNV6jxXyBnfh9hlgGnMi7q9ReguFJqziDqVlzqHS/CvbvxQYhBMW+8xPrUB7dxGFfvbf01EfB1v8MbLiqFkBVVnRtAhfOBnnVPwF4LfR2K0gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLrNQGXa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLrNQGXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712760013; x=1744296013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FAQHrBAqk64yKRUCwPjPIiS4XOUnYQ2K1M8s0iD/NSc=;
  b=WLrNQGXa0rJdas1LUrd4oXMhIsCEGh8t9bxEiea6zhQz7SP7PlggI1ea
   rFHzEkAxFK1sOmbq9UphFgQyZpd5abuQF/juHq1d3hmgvD6yjdUhDM1n4
   jD3iOFPc2L6ezALU4WBukKTzPkLL0WWj7rgQAC7eNmprAIffZapPdbMpI
   XbMx3XY2Uf8i61mPBoUHBmLUZOtzqOTRszlqUQv+FfaKZ3KR2t49C4vL8
   OuIwDCBm3iV3IPJ/lLF24yq3wq6FMsJS7pD7hES+/bsuqKQrmgpWOuOOV
   exgDfQbKOwJ3TTBO0MaeVSPsSCWqpwycTxJjVU2SS6PIPkOFzTrVV9TQA
   w==;
X-CSE-ConnectionGUID: ALzua2XIRUKrVqdHIql/NQ==
X-CSE-MsgGUID: zj6t+F0/SL2DC12Oa29Jrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11906161"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11906161"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 07:40:12 -0700
X-CSE-ConnectionGUID: v9LTey1YT2ecNb7GiWhlPg==
X-CSE-MsgGUID: /+atHIkhT06b4bY2TLGqKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20668407"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2024 07:40:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruZ7R-0007Uq-0D;
	Wed, 10 Apr 2024 14:40:09 +0000
Date: Wed, 10 Apr 2024 22:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20978/30000]
 drivers/video/fbdev/ls2k500sfb.c:140:27: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202404102205.GZY9jAYq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f1776d0ca22cf72bfcdc93dced47d9dde9934d97
commit: d74f3b70d73220d919db010ec1c81aa1d89082b6 [20978/30000] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-randconfig-r122-20240410 (https://download.01.org/0day-ci/archive/20240410/202404102205.GZY9jAYq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404102205.GZY9jAYq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404102205.GZY9jAYq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/ls2k500sfb.c:140:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static p @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:140:27: sparse:     expected void *static p
   drivers/video/fbdev/ls2k500sfb.c:140:27: sparse:     got void [noderef] __iomem *
>> drivers/video/fbdev/ls2k500sfb.c:142:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *static p @@
   drivers/video/fbdev/ls2k500sfb.c:142:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:142:30: sparse:     got void *static p
>> drivers/video/fbdev/ls2k500sfb.c:196:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static p @@
   drivers/video/fbdev/ls2k500sfb.c:196:36: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:196:36: sparse:     got void *static p
>> drivers/video/fbdev/ls2k500sfb.c:198:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:198:37: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:198:37: sparse:     got void *
>> drivers/video/fbdev/ls2k500sfb.c:251:13: sparse: sparse: symbol 'ls2k500sfb_interrupt' was not declared. Should it be static?
>> drivers/video/fbdev/ls2k500sfb.c:453:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got char *preg @@
   drivers/video/fbdev/ls2k500sfb.c:453:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:453:28: sparse:     got char *preg
>> drivers/video/fbdev/ls2k500sfb.c:454:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got char *preg @@
   drivers/video/fbdev/ls2k500sfb.c:454:32: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:454:32: sparse:     got char *preg
>> drivers/video/fbdev/ls2k500sfb.c:566:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *penv @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:566:19: sparse:     expected char *penv
   drivers/video/fbdev/ls2k500sfb.c:566:19: sparse:     got void [noderef] __iomem *
>> drivers/video/fbdev/ls2k500sfb.c:567:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *preg @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:567:19: sparse:     expected char *preg
   drivers/video/fbdev/ls2k500sfb.c:567:19: sparse:     got void [noderef] __iomem *
   drivers/video/fbdev/ls2k500sfb.c:668:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *penv @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/ls2k500sfb.c:668:14: sparse:     expected char *penv
   drivers/video/fbdev/ls2k500sfb.c:668:14: sparse:     got void [noderef] __iomem *

vim +140 drivers/video/fbdev/ls2k500sfb.c

   110	
   111	static void ls2k500sfb_events_fn(struct work_struct *work)
   112	{
   113		struct ls2k500sfb_struct *priv = container_of(work, struct ls2k500sfb_struct, work);
   114		struct pci_dev *pdev = priv->dev;
   115		struct pci_dev *ppdev = pdev->bus->self;
   116		uint32_t i, d, timeout, retry = 0;
   117		static const uint32_t index[] = {
   118			0x10, 0x14, 0x18, 0x1c, 0x20, 0x24, 0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80, 4
   119		};
   120	
   121		static uint32_t data[sizeof(index) / 4];
   122		static const uint32_t cindex[] = { 0x10, 0x3c, 4 };
   123	
   124		static uint32_t cdata[sizeof(cindex) / 4];
   125		static uint32_t d80c, d71c, ctrl;
   126		static void *p;
   127	
   128		if (!priv->running) {
   129			for (i = 0; i < ARRAY_SIZE(index); i++)
   130				pci_read_config_dword(ppdev, index[i], &data[i]);
   131			for (i = 0; i < ARRAY_SIZE(cindex); i++)
   132				pci_read_config_dword(pdev, cindex[i], &cdata[i]);
   133			if (ppdev->vendor == 0x14) {
   134				pci_read_config_dword(ppdev, 0x80c, &d80c);
   135				d80c = (d80c & ~(3 << 17)) | (1 << 17);
   136	
   137				pci_read_config_dword(ppdev, 0x71c, &d71c);
   138				d71c |= 1 << 26;
   139	
 > 140				p = pci_iomap(ppdev, 0, 0x100);
   141			}
 > 142			ctrl = readl(p);
   143			return;
   144		}
   145		local_bh_disable();
   146		pciebreak_smp_send_stop(100);
   147		wmb(); /* flush all write before we disable pcie window */
   148		pci_write_config_dword(ppdev, 0x18, 0);
   149		pci_write_config_dword(ppdev, 0x1c, 0);
   150		pci_write_config_dword(ppdev, 0x20, 0);
   151		atomic_set(&waiting_for_pciebreak_ipi, 0);
   152		wmb(); /* flush all write after change pcie window */
   153		local_bh_enable();
   154		if (ppdev->vendor == 0x14) {
   155			timeout = 10000;
   156			while (timeout) {
   157				pci_read_config_dword(ppdev, 0x10, &d);
   158				d &= ~0xf;
   159				if (!d)
   160					break;
   161				mdelay(1);
   162				timeout--;
   163			};
   164			if (!timeout)
   165				pr_info("bar not clear 0\n");
   166	
   167			pci_read_config_dword(ppdev, 0x0, &d);
   168			pr_info("pcie port deviceid=0x%x recover begin\n", d);
   169	retrain:
   170			while (1) {
   171				pci_write_config_dword(ppdev, index[0], data[0]);
   172				pci_read_config_dword(ppdev, index[0], &d);
   173				d &= ~0xf;
   174				if (d)
   175					break;
   176				mdelay(1);
   177			}
   178	
   179			while (1) {
   180				for (i = 0; i < ARRAY_SIZE(index); i++) {
   181					if (index[i] != 0x18 && index[i] != 0x1c && index[i] != 0x20)
   182						pci_write_config_dword(ppdev, index[i], data[i]);
   183				}
   184				pci_write_config_dword(ppdev, 0x80c, d80c);
   185				pci_write_config_dword(ppdev, 0x71c, d71c);
   186	
   187				pci_read_config_dword(ppdev, 0x10, &d);
   188				d &= ~0xf;
   189				if (d)
   190					break;
   191				mdelay(1);
   192			}
   193	
   194			timeout = 10000;
   195	
 > 196			writel(ctrl | 0x8, p);
   197			while (1) {
 > 198				d = readl(p + 0xc);
   199				if ((d & 0x11) == 0x11) {
   200					break;
   201				} else if (!timeout) {
   202					pr_info("pcie train failed status=0x%x\n", d);
   203					goto out;
   204				}
   205				mdelay(1);
   206				timeout--;
   207			}
   208	
   209	
   210			pr_info("pcie recovered done\n");
   211	
   212			if (!retry) {
   213				/*wait u-boot ddr config */
   214				set_current_state(TASK_UNINTERRUPTIBLE);
   215				schedule_timeout(HZ*resetbootwait);
   216				set_current_state(TASK_RUNNING);
   217				pci_read_config_dword(ppdev, 0x10, &d);
   218				d &= ~0xf;
   219				if (!d) {
   220					retry = 1;
   221					goto retrain;
   222				}
   223			}
   224		} else {
   225			set_current_state(TASK_UNINTERRUPTIBLE);
   226			schedule_timeout(HZ*resetbootwait);
   227			set_current_state(TASK_RUNNING);
   228		}
   229		local_bh_disable();
   230		pciebreak_smp_send_stop(10000);
   231		wmb(); /* flush all write before we update pcie window */
   232		for (i = 0; i < ARRAY_SIZE(index); i++)
   233			pci_write_config_dword(ppdev, index[i], data[i]);
   234	
   235		for (i = 0; i < ARRAY_SIZE(cindex); i++)
   236			pci_write_config_dword(pdev, cindex[i], cdata[i]);
   237		atomic_set(&waiting_for_pciebreak_ipi, 0);
   238		wmb(); /* flush all write after we update pcie window */
   239		local_bh_enable();
   240	
   241	
   242		pr_info("redraw console\n");
   243	
   244		saved_console = fg_console;
   245		switch_console(fg_console > 0?fg_console - 1 : fg_console + 1);
   246		queue_delayed_work(priv->wq, &priv->redraw_work, HZ);
   247	out:
   248		priv->running = 0;
   249	}
   250	
 > 251	irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
   252	{
   253		struct ls2k500sfb_struct *priv = arg;
   254		struct pci_dev *pdev = priv->dev;
   255	
   256		if (irq == pdev->irq)
   257			pr_info("ls2k500sfb pcie interrupt\n");
   258		else
   259			pr_info("ls2k500sfb gpio interrupt\n");
   260		if (system_state != SYSTEM_RUNNING)
   261			return IRQ_HANDLED;
   262	
   263		if (!priv->running) {
   264			if (!resetdelay || time_after(jiffies, priv->reset_time + resetdelay * HZ)) {
   265				priv->running = 1;
   266				queue_work(priv->wq, &priv->work);
   267			}
   268			priv->reset_time = jiffies;
   269		}
   270		return IRQ_HANDLED;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
