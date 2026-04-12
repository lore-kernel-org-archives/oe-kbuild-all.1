Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC88437BE70
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Apr 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998545; cv=none; b=HRpXKaIlGdW7ebKW5JST5nWzwUrs4H3+JUvK/ZyzdkcyO88hCO5EIowNEfulhwO8ceDai/WAPVukBKpJpTxbvF04K/1ydQtiThOWrHLn7yQxS0AA3vwVQWRZOgHj11ZUQrk6XR3oVC68H7TNMko7L9Co/Tp+bBZzPSgmW2RWdfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998545; c=relaxed/simple;
	bh=5pTsgvr2ALKcrXKICjnWqmuPgMk96Io/lFr3KD1GA5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fPF/24sO801DUUOi562FkWKF5Xvcmb8cSVCcTTN+OYtK66zEn8XFbJK1gF2a1GC4MGRb+dTQy1q6QwzuSaKg5BSyC7ZE4fXGT8OCL+tj7KfnZcpkUEbKNBoWyUjuJgwAw7cxgs3hF4BjkIFN3eaGE64svppS6rc9y2VmSY0qLhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFJoX6Iy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFJoX6Iy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775998544; x=1807534544;
  h=date:from:to:cc:subject:message-id;
  bh=5pTsgvr2ALKcrXKICjnWqmuPgMk96Io/lFr3KD1GA5M=;
  b=FFJoX6IybQPC1W8Zd7jz36rYdYUnOqK/rpXaQFlyBUf0Y52PaSHWNXPZ
   Ev6+yKOkpcIKly934GLcEGMQ4cbXjd0LULcLTSVvG7/icMx+exP9+QZTd
   jWsilV/mclLUrxvrPQlDUbbALws/0TJxjaEo4p2brd6OcKu/9wp7SwTwb
   MhflH2RPoKO8K4O4tih5MawJg72SqcWWPIZgZ1z94crq8jYUfr3hplQE0
   ykOgPQo11/2oi/7uHNL6gqUi3JcBQWAqriyr815a43UyviPxcWhiQf8K5
   Wg4bwZKyM8eIMVIoAtC6GEcUlsNe3UDkaqU2p+3Kn0Hqi54o+oSBLwIK3
   g==;
X-CSE-ConnectionGUID: mkyNzlMERfCAfCPFOlHUcQ==
X-CSE-MsgGUID: DvkprCKnR+ioLyikry46FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88400211"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="88400211"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 05:55:43 -0700
X-CSE-ConnectionGUID: 2V2LRsktSsmzoIQ6yYB6Vw==
X-CSE-MsgGUID: ot3le3XSRe2Hw8mIIoV73Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="229449810"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Apr 2026 05:55:42 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBuLj-000000002CV-3Ddj;
	Sun, 12 Apr 2026 12:55:39 +0000
Date: Sun, 12 Apr 2026 20:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [linux-next:master 12359/13443]
 drivers/power/reset/qemu-virt-ctrl.c:39:34: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202604122024.X0oBetIm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66672af7a095d89f082c5327f3b15bc2f93d558e
commit: a087369bb2ab9cb059bbe5d0faa83a4469eb7ad8 [12359/13443] power: reset: Add QEMU virt-ctrl driver
config: csky-randconfig-r113-20260412 (https://download.01.org/0day-ci/archive/20260412/202604122024.X0oBetIm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604122024.X0oBetIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604122024.X0oBetIm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/reset/qemu-virt-ctrl.c:39:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got void *cb_data @@
   drivers/power/reset/qemu-virt-ctrl.c:39:34: sparse:     expected void [noderef] __iomem *base
   drivers/power/reset/qemu-virt-ctrl.c:39:34: sparse:     got void *cb_data
   drivers/power/reset/qemu-virt-ctrl.c:48:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got void *cb_data @@
   drivers/power/reset/qemu-virt-ctrl.c:48:34: sparse:     expected void [noderef] __iomem *base
   drivers/power/reset/qemu-virt-ctrl.c:48:34: sparse:     got void *cb_data
>> drivers/power/reset/qemu-virt-ctrl.c:83:49: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *cb_data @@     got void [noderef] __iomem *base @@
   drivers/power/reset/qemu-virt-ctrl.c:83:49: sparse:     expected void *cb_data
   drivers/power/reset/qemu-virt-ctrl.c:83:49: sparse:     got void [noderef] __iomem *base
   drivers/power/reset/qemu-virt-ctrl.c:92:49: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *cb_data @@     got void [noderef] __iomem *base @@
   drivers/power/reset/qemu-virt-ctrl.c:92:49: sparse:     expected void *cb_data
   drivers/power/reset/qemu-virt-ctrl.c:92:49: sparse:     got void [noderef] __iomem *base

vim +39 drivers/power/reset/qemu-virt-ctrl.c

    36	
    37	static int qemu_virt_ctrl_power_off(struct sys_off_data *data)
    38	{
  > 39		void __iomem *base = data->cb_data;
    40	
    41		virt_ctrl_write32(CMD_HALT, base + VIRT_CTRL_REG_CMD);
    42	
    43		return NOTIFY_DONE;
    44	}
    45	
    46	static int qemu_virt_ctrl_restart(struct sys_off_data *data)
    47	{
    48		void __iomem *base = data->cb_data;
    49	
    50		virt_ctrl_write32(CMD_RESET, base + VIRT_CTRL_REG_CMD);
    51	
    52		return NOTIFY_DONE;
    53	}
    54	
    55	static int qemu_virt_ctrl_reboot_notify(struct notifier_block *nb,
    56						unsigned long action, void *data)
    57	{
    58		struct qemu_virt_ctrl *ctrl = container_of(nb, struct qemu_virt_ctrl, reboot_nb);
    59	
    60		if (action == SYS_HALT)
    61			virt_ctrl_write32(CMD_HALT, ctrl->base + VIRT_CTRL_REG_CMD);
    62	
    63		return NOTIFY_DONE;
    64	}
    65	
    66	static int qemu_virt_ctrl_probe(struct platform_device *pdev)
    67	{
    68		struct qemu_virt_ctrl *ctrl;
    69		int ret;
    70	
    71		ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
    72		if (!ctrl)
    73			return -ENOMEM;
    74	
    75		ctrl->base = devm_platform_ioremap_resource(pdev, 0);
    76		if (IS_ERR(ctrl->base))
    77			return PTR_ERR(ctrl->base);
    78	
    79		ret = devm_register_sys_off_handler(&pdev->dev,
    80						    SYS_OFF_MODE_RESTART,
    81						    SYS_OFF_PRIO_DEFAULT,
    82						    qemu_virt_ctrl_restart,
  > 83						    ctrl->base);
    84		if (ret)
    85			return dev_err_probe(&pdev->dev, ret,
    86					     "cannot register restart handler\n");
    87	
    88		ret = devm_register_sys_off_handler(&pdev->dev,
    89						    SYS_OFF_MODE_POWER_OFF,
    90						    SYS_OFF_PRIO_DEFAULT,
    91						    qemu_virt_ctrl_power_off,
    92						    ctrl->base);
    93		if (ret)
    94			return dev_err_probe(&pdev->dev, ret,
    95					     "cannot register power-off handler\n");
    96	
    97		ctrl->reboot_nb.notifier_call = qemu_virt_ctrl_reboot_notify;
    98		ret = devm_register_reboot_notifier(&pdev->dev, &ctrl->reboot_nb);
    99		if (ret)
   100			return dev_err_probe(&pdev->dev, ret, "cannot register reboot notifier\n");
   101	
   102		return 0;
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
