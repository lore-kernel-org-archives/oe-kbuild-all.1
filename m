Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9389E136A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 04:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725857496; cv=none; b=E7ENcGXI9IJ6aTddhC6BsRMRwI+Hb971mSQDMk1vadCqTOExXZOyW1ph1Aonsgh/IwhrcVvB5GxOUhzWVsk2QdgMBmCQB9uHVD9P/YPGiwCbsIiymjRx0QGk5acoA34C2Ws1tOh4lFtyb6LiGxL62MVKJel3oVixXIVc456ADoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725857496; c=relaxed/simple;
	bh=5erWqy+SKYI0FDwmRliUjq5hc1nh/ca3WvxCkcc2I7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iS2qQ01pF2KO82+I4pdE3Ex6HXKL/smulmo84KPlc/b8XwkRzs4dl9FsnInJYaq+Bcnx0JndJHAV+PWe55hIkfWGB4qIKUvG7r4LXRovRuq8DovOcT49aNr+y9wSHcNjH7Chs0B0DZqbTF8BTxzNpG8PfirUzgmV3xn53GOX5yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkfxFyZV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkfxFyZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725857495; x=1757393495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5erWqy+SKYI0FDwmRliUjq5hc1nh/ca3WvxCkcc2I7o=;
  b=DkfxFyZVYff/73p7Yeriq1pmFN2oGdTkKu4wmcDXkYzjBWjdW5GxnoM9
   vWNBL8ViyPvS9aqpX41tqKzK5bW8tCpSCuP6e3jlFpNcntpvegA/8R2Li
   FNN9oGyHZTC7wEN0d8tvZZM/BCFLOiydhXTVOz6fvwqjb64qUkf9WKegq
   +Y6m3y3aO0o2t3lPkZ+MQ78D5LaaMp+wnZhAgqnjlD0NRZfPWgZMZpmXA
   7EnyusU4riyaKrka/9Vi/PHM3h8OI51Nhh7216YHx1JbdJf9FxVIvpuqU
   EFB0feS41foz877jKDEXtc3Fo2iAQ5+UhBNSB4OnEwrMCgbR7asLtaXaX
   w==;
X-CSE-ConnectionGUID: fr76sWMPQmyLEMAZppXGrw==
X-CSE-MsgGUID: qeA/Amw5S66Hxu4XxK+1jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24722509"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24722509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 21:51:34 -0700
X-CSE-ConnectionGUID: 6DVrSsDgS42sl3Q8pk/5nA==
X-CSE-MsgGUID: ZGvIM/AqRQKUsIPspwjKCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66533755"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2024 21:51:27 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snWN2-000EJ9-32;
	Mon, 09 Sep 2024 04:51:24 +0000
Date: Mon, 9 Sep 2024 12:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 20/48] drivers/video/fbdev/ls2k500sfb.c:143:27:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202409091238.fh3tBGXA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95e99651a23c1ccc103007c3b0532ff97d7c357d
commit: 3a50da023fae0cfab612bffb333d4b1343299208 [20/48] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: loongarch-randconfig-r111-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091238.fh3tBGXA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240909/202409091238.fh3tBGXA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091238.fh3tBGXA-lkp@intel.com/

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
   drivers/video/fbdev/ls2k500sfb.c:320:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:320:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:320:22: sparse:     got void *
>> drivers/video/fbdev/ls2k500sfb.c:320:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:320:49: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:320:49: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:321:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:321:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:321:22: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:321:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:321:53: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:321:53: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:322:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:322:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:322:22: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:322:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:322:53: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:322:53: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:323:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:323:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:323:22: sparse:     got void *
   drivers/video/fbdev/ls2k500sfb.c:323:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/ls2k500sfb.c:323:51: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/ls2k500sfb.c:323:51: sparse:     got void *
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
   drivers/video/fbdev/ls2k500sfb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

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
   276	#ifdef CONFIG_LOONGARCH
   277	#define GPIO_OEN ((void *)IO_BASE+0x1fe00000+0x500)
   278	#define GPIO_FUNCEN ((void *)IO_BASE+0x1fe00000+0x504)
   279	#define GPIO_OUT ((void *)IO_BASE+0x1fe00000+0x508)
   280	#define GPIO_IN ((void *)IO_BASE+0x1fe00000+0x50c)
   281	#define GPIO_INTPOL ((void *)IO_BASE+0x1fe00000+0x510)
   282	#define GPIO_INTEN ((void *)IO_BASE+0x1fe00000+0x514)
   283	
   284	static int gpiochip_match_name(struct gpio_chip *chip, void *data)
   285	{
   286		const char *name = data;
   287	
   288		return !strcmp(chip->label, name);
   289	}
   290	static int get_gpio_irq_from_acpi_table(int gpio)
   291	{
   292		struct gpio_chip *chip;
   293		struct gpio_desc *desc;
   294	
   295		chip = gpiochip_find("LOON0007:00", gpiochip_match_name);
   296		if (!chip)
   297			return -ENOENT;
   298		desc = gpiochip_request_own_desc(chip, gpio, "reboot", GPIO_LOOKUP_FLAGS_DEFAULT, GPIOD_IN);
   299		if (!desc)
   300			return -ENOENT;
   301		return gpiod_to_irq(desc);
   302	}
   303	
   304	static int get_gpio_irq_from_acpi_gsi(int gpio)
   305	{
   306		int gsi = 16 + (gpio & 7);
   307	
   308		return  acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
   309	}
   310	
   311	static int register_gpio_reboot_handler(struct ls2k500sfb_struct *priv)
   312	{
   313		int irq = get_gpio_irq_from_acpi_table(GPIO);
   314	
   315		if (irq < 0) {
   316			irq = get_gpio_irq_from_acpi_gsi(GPIO);
   317			pr_notice("gsi gpio irq %d\n", irq);
   318		} else
   319			pr_notice("acpi gpio irq %d\n", irq);
 > 320		writel(readl(GPIO_OEN) | (0x1 << GPIO), GPIO_OEN);
   321		writel(readl(GPIO_FUNCEN) & ~(0x1 << GPIO), GPIO_FUNCEN);
 > 322		writel(readl(GPIO_INTPOL) & ~(0x1 << GPIO), GPIO_INTPOL);
 > 323		writel(readl(GPIO_INTEN) | (0x1 << GPIO), GPIO_INTEN);
   324		if (request_irq(irq, ls2k500sfb_interrupt, IRQF_SHARED | IRQF_TRIGGER_FALLING,
   325					"ls2k500sfb", priv))
   326			pr_err("request_irq(%d) failed\n", irq);
   327		return 0;
   328	}
   329	#endif
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
