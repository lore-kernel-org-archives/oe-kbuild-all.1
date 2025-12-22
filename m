Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C452D191C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 21:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766440635; cv=none; b=r6ioebG0ZInG9CxNQk+o43J1fZwG2MbxKiwy6/s4OZfId8qlek7J5CW7w31TpCRFBJXjvSH6ipYy0Bf0AKGoKYM4O7tWnnQus2LKbIrWMEoo9IXgeRh1YhXwvfTIvqHNh6ATLyji6V0IC/i3UenN/YOlGabxghfC44tAtQGp4zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766440635; c=relaxed/simple;
	bh=RDtO5u+wfcmH8HIq5hbIWEf+25X99HFheS/uXmSmVFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C48qB9dAiMGXlVSv5D/MgAai5PwolQFmiO0gwC2edkqZMGOft1Fcw7SeNqzayEsaiOBYTcBT0Kbl0Jgnal6ZQeIHRPvWdKXy8CJaA7A5pog48xnHWeHg0yvg8V3lQtBGxHjKKXtfpQTCauTagVdZ12NXA/9TTXAs4O4lS2v1hOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMN1fiZy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMN1fiZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766440634; x=1797976634;
  h=date:from:to:cc:subject:message-id;
  bh=RDtO5u+wfcmH8HIq5hbIWEf+25X99HFheS/uXmSmVFs=;
  b=BMN1fiZyU32h8UiPgOV8l+69N2/2FwmHivXoBUiAvpWiuZyYoHm6vg0E
   bEGu0PFK712Se+8rb/SFq6kzIw4OZoAjsXml7jUeGlW/S08O3v7N7X14/
   w8xVih84OKbEpbD5zdQlopM+7ZomPt9TzsU4dcjAFEwxel1UetyAsyp0M
   GjI5de5/QkrlvKc3kWvHSNGAdomsnF3LP7R9XFjUg4tMGQNPXCTkl1myy
   wgewg0qOKn0E9ai8NcEJA/96H2tDejSGBsdqIfsx6U5ijkzbHoFn+SIgg
   JdLGDgZYpa33xT3NxItScWFqP6Pachte7x5ILHBD0oUOqSu5kzikR/nCK
   w==;
X-CSE-ConnectionGUID: YUOwjUzASQO2rPnECrIu1Q==
X-CSE-MsgGUID: knOsnbSeT9OqFyzksvqyGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79016442"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79016442"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:57:13 -0800
X-CSE-ConnectionGUID: jGe6hvO8S2qPu0Q0x6I4Pw==
X-CSE-MsgGUID: eRxHO2GgQ82wudF/9so2fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="223101418"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 13:57:11 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnts-000000001AB-3tBg;
	Mon, 22 Dec 2025 21:57:08 +0000
Date: Tue, 23 Dec 2025 05:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544]
 drivers/video/fbdev/ls2k500sfb.c:143:27: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512230505.cMBSrJNZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 8248d42b7c5f4338a54f26d8efebec8614b43466 [3544/3544] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-randconfig-r121-20251215 (https://download.01.org/0day-ci/archive/20251223/202512230505.cMBSrJNZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230505.cMBSrJNZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230505.cMBSrJNZ-lkp@intel.com/

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
