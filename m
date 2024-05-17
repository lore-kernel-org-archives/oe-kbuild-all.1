Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3092F29CE3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 23:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715987344; cv=none; b=UP1LTb7LfLLkDr86rFhcl5Su+NHIsOBL4fS+ZOkGyoe9uuEmnnbjvP3P/e1nRzjHL0TKKCPGrzxQaZjgPHqYdD3i5q1UUSuMKLd8sdIrvCTXGQDaxBqfWkocltghSKOC3/uIbwZWSwnb/I+Lfo5t+RAbCCSkliUHf+4JbhEd3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715987344; c=relaxed/simple;
	bh=Tvhbbbrmr6yq6Pr+d3+rMDm9xyfr3AL5GREj5W9eW+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gtDE2M2m5LhY5dQOmpMFW1ri1QXoDjqT6igH9+5tyuS4NFI37/pXMBqS6dlREVCQbzFWuj0z8kRlfTPUAqnsFYgfpvex1ro6KrF3kNPMBAoxULsjOWbetysMKU3pLzVumoacXqMAzA+hh1fhK6N7WFa0QNTTpbkRkrnUqu/t7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+JcFv0a; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+JcFv0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715987343; x=1747523343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tvhbbbrmr6yq6Pr+d3+rMDm9xyfr3AL5GREj5W9eW+g=;
  b=m+JcFv0aKSLGatt6W44ylj6oPR6h4o6TIhZ9f0oMjWpoALuhe3XAJyja
   T9bjBXkpatBkT0UcqDLDdIwhQ2yE45zZkGlc9tgbkPG/KK/Pf5b8ZISiN
   F0JgVTPTE+R95h8bnzANvtELJc2OxLRmbio/3i7897PNVAdobfzTKcAQZ
   bndeihyOCxg9RpVtOQJd16FXPoCmWfSg+Z6jhYJdQy7gCZRlIy8mwDprF
   29sqK7mUibv+lZUfisju/BO9B6Tcd972UBJztbvL6X4ARFb1pDTTLgE7r
   PHnbipvT/acap1emrrTa0qWmDM5WrNqhCiC93W0Ng20VVa0Pi+mHcZ0/d
   g==;
X-CSE-ConnectionGUID: Yi6ru2XKS8ePrM7YHEHecw==
X-CSE-MsgGUID: 0zfIzQGyTXiV8ItkDMy7Sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12312875"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="12312875"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 16:09:02 -0700
X-CSE-ConnectionGUID: oI80CrVqRce+M92w/nHSwQ==
X-CSE-MsgGUID: skg4863lQN62CbUDXbmM7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="32052437"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 May 2024 16:08:58 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s86h6-0001Da-1d;
	Fri, 17 May 2024 23:08:56 +0000
Date: Sat, 18 May 2024 07:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 20/48]
 drivers/video/fbdev/ls2k500sfb.c:247:undefined reference to `fg_console'
Message-ID: <202405180712.JzAhFFKa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95dac159be359bc7ba42421426462f1a96f50ee9
commit: 3a50da023fae0cfab612bffb333d4b1343299208 [20/48] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-randconfig-072-20240518 (https://download.01.org/0day-ci/archive/20240518/202405180712.JzAhFFKa-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405180712.JzAhFFKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405180712.JzAhFFKa-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/video/fbdev/ls2k500sfb.o: in function `ls2k500sfb_events_fn':
>> drivers/video/fbdev/ls2k500sfb.c:247:(.text+0xd75): undefined reference to `fg_console'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +247 drivers/video/fbdev/ls2k500sfb.c

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
   143				p = pci_iomap(ppdev, 0, 0x100);
   144			}
   145			ctrl = readl(p);
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
   199			writel(ctrl | 0x8, p);
   200			while (1) {
   201				d = readl(p + 0xc);
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
 > 247		saved_console = fg_console;
   248		switch_console(fg_console > 0?fg_console - 1 : fg_console + 1);
   249		queue_delayed_work(priv->wq, &priv->redraw_work, HZ);
   250	out:
   251		priv->running = 0;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
