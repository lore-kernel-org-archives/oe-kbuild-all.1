Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3076B1A4E92
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727175740; cv=none; b=K/bbOgb24E4RGVoxm9Z9xQUQeg3ez3agltyrzzp1eKkitYTAegSLSeTOonY6Niqpoag6Gey7SCk3BG9+1JHbIVM3kwyMa5GGNzbt7DQ801wgyynpej3VBg24wIFZB6kR/0/QLsg7sbOgs5M2ibaVqf9A2MiHvg/H7HYRvdMvjkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727175740; c=relaxed/simple;
	bh=diTwcqRO2YyV+EGtPR+5d8EL+q5zRKuYST8tYu1hLGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qgv8unUTfjM6dJ1INLiYo95olkyGK9dK7rK5/TMPfwhOq6TZNEsOPDtYOWD484sAB9tHOjtOTosZVjQsGbJzJWiF0uKCqOMN/4RiR/GIJZ6fOX3nulLFQsAvUYWTmfKEOfugEeTvAKhFCX/6R8F31FTdDmjqt4o53TQOFDkuGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8meSlme; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8meSlme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727175738; x=1758711738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=diTwcqRO2YyV+EGtPR+5d8EL+q5zRKuYST8tYu1hLGk=;
  b=h8meSlmebTFilJ6iSegUrsQJ10JaeALNaPH0I7poAwjWUbMBIBxlqpW6
   btuG75IzXrM7/8P0oJc1rqwc2FohxewW906Vnswr2jK+TQWRLEEnPqjLh
   A8aTqwJuiEiwqLmsBspWd2zZZz5u5Z4KFZ6g+gayM3jM+KENUxlvUCWJC
   MbXdyDCwX19LUDNzEzTVXHH2AF+hg6T6eSakch6f1varYnF3gCgkdmirH
   EIoGsWnw12fSoQ3scHLl8eXA7VSUAWeB2Q5gtSpez9DdSRPSbPaXILTAb
   33W3jALZu1+L9Vn/6dYU7TLfbZGz4rjvWna3JneCfr+GHJljciQ6/eI4c
   A==;
X-CSE-ConnectionGUID: 8Cbz6bGiQxKyjrwjnAnt3Q==
X-CSE-MsgGUID: cpAbcUsQQIm20NEvcLchLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26308101"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="26308101"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 04:02:15 -0700
X-CSE-ConnectionGUID: VTzxWufBRJqh6gg/2UfMFQ==
X-CSE-MsgGUID: WRrFV5BCQgmNYDVuRw3v0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="76307105"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:02:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st3J5-000IFy-20;
	Tue, 24 Sep 2024 11:02:11 +0000
Date: Tue, 24 Sep 2024 19:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16261/30000]
 drivers/video/fbdev/ls2k500sfb.c:244: undefined reference to `fg_console'
Message-ID: <202409241851.FLydbyQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ec708b533135368027cf0b97c4d1abf6950e86db
commit: d74f3b70d73220d919db010ec1c81aa1d89082b6 [16261/30000] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-randconfig-074-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241851.FLydbyQT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241851.FLydbyQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241851.FLydbyQT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/video/fbdev/ls2k500sfb.o: in function `ls2k500sfb_events_fn':
>> drivers/video/fbdev/ls2k500sfb.c:244: undefined reference to `fg_console'
>> ld: drivers/video/fbdev/ls2k500sfb.c:244: undefined reference to `fg_console'
>> ld: drivers/video/fbdev/ls2k500sfb.c:244: undefined reference to `fg_console'


vim +244 drivers/video/fbdev/ls2k500sfb.c

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
   140				p = pci_iomap(ppdev, 0, 0x100);
   141			}
   142			ctrl = readl(p);
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
   196			writel(ctrl | 0x8, p);
   197			while (1) {
   198				d = readl(p + 0xc);
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
 > 244		saved_console = fg_console;
   245		switch_console(fg_console > 0?fg_console - 1 : fg_console + 1);
   246		queue_delayed_work(priv->wq, &priv->redraw_work, HZ);
   247	out:
   248		priv->running = 0;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
