Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92805505E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706750; cv=none; b=MgkemwewrOidROlpObJuY/3G1xnPDIuC/1blFU6fiQBA8Mj3jxvzy3noOTDJ+z/DoeJCDyYaGXQP8/MNt/iJHYIEPGvWKB7dKFfWqcMHoYbb3vjDEfdt1XSUaGTx5AXBlihmR8GY1g4lujbcolZzi3Ypzh5RBokx4/VNMvO9XqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706750; c=relaxed/simple;
	bh=NXsLvE7eYJYE7r6ur1Y0WopaaWCF/K/pf3AMW2x0lu8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eVOXxmpMYLn+5Lk2eEbJuYQigJLwllh31yrB8lIHo9CYmJdid9ad5xUhtG08HeN8Ztnwxh71kuN8Y7MgD/MO0h5YsanZtPZ/GA1rYLxQ+MsbfCWnpKUG4N9N6KyCyRzLZma8ICWyzixuc2jMmNgtQoWtMvxwHFK8EzlrblY/C3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vr/3GuVR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vr/3GuVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790706748; x=1822242748;
  h=date:from:to:cc:subject:message-id;
  bh=NXsLvE7eYJYE7r6ur1Y0WopaaWCF/K/pf3AMW2x0lu8=;
  b=Vr/3GuVR59BZt0vKv9A0UCm4uRSQidef2ChKdcSQO5lwOjGicsnOT382
   yFDEQ+TFRhXsDtRxk7F6Ordze8r0ObQ+i7xOxo9V1PeHdoZVJnotZxsja
   d7LgWrCWF+wWGDSrrmMQ9bZQpxMenZuCNiUWwhHgJqK+t6SahjelNEr+v
   ML00l9hvDckfyS7YvcnsmdUIsVq3J1Gq8tRzbnMoeMHUHhYNdeYdBi6HZ
   e7x9M2bDxjCdh52dYnantimZkH7n4+gWGpNkmjT13fZtbf+ON5Zn0A/wf
   jzpqm7KG6NzM6GspADTJO+ihTUru0xLYs3XMfhdTTbtmbjZM6Rl1LqoD6
   w==;
X-CSE-ConnectionGUID: 6cj4o12iSPKNX08bekTCyQ==
X-CSE-MsgGUID: 91xHOXsXTA2DN799crOWBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90478829"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90478829"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:32:21 -0700
X-CSE-ConnectionGUID: 8/R5X89vTCiG7KYUcdCfRg==
X-CSE-MsgGUID: Ip2+Fx0/Q/eCLvA974oS2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="278649338"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2026 11:32:19 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBccj-000000001Vb-3VIk;
	Tue, 29 Sep 2026 18:32:17 +0000
Date: Tue, 29 Sep 2026 20:31:48 +0200
From: kernel test robot <lkp@intel.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: 
 drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c:283:17:
 warning: assignment to 'struct irq_data *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202609292029.ynftATMU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Karunika-Choo/drm-panthor-Ignore-EOPNOTSUPP-for-shader-present-nvmem-lookup/20260922-214455
head:   d1fb2a7097a879293d3b0e71e2556f48f2793224
commit: 63cfc63d64c81b04d163214896204034c88aa688 drm/panthor: Add AM_PARTITION_CONTROL support
date:   7 days ago
config: sparc64-randconfig-r2303-20260929 (https://download.01.org/0day-ci/archive/20260929/202609292029.ynftATMU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609292029.ynftATMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609292029.ynftATMU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c: In function 'partition_state_get':
   drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c:22:49: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      22 | #define   AM_PART_STATE_GET(x)                  FIELD_GET(GENMASK(11, 8), x)
         |                                                 ^~~~~~~~~
   drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c:83:16: note: in expansion of macro 'AM_PART_STATE_GET'
      83 |         return AM_PART_STATE_GET(state);
         |                ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c: In function 'yield_now':
   drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c:30:49: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      30 | #define   AM_PART_SET_COMMAND(x)                FIELD_PREP(GENMASK(7, 0), x)
         |                                                 ^~~~~~~~~~
   drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c:107:19: note: in expansion of macro 'AM_PART_SET_COMMAND'
     107 |                   AM_PART_SET_COMMAND(PART_CMD_YIELD_NOW));
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c: In function 'partition_control_init':
   drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c:283:19: error: implicit declaration of function 'irq_get_irq_data'; did you mean 'irq_set_irq_wake'? [-Werror=implicit-function-declaration]
     283 |         irqdata = irq_get_irq_data(irq);
         |                   ^~~~~~~~~~~~~~~~
         |                   irq_set_irq_wake
>> drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c:283:17: warning: assignment to 'struct irq_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     283 |         irqdata = irq_get_irq_data(irq);
         |                 ^
   drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c:285:29: error: implicit declaration of function 'irqd_get_trigger_type' [-Werror=implicit-function-declaration]
     285 |                 irq_flags = irqd_get_trigger_type(irqdata);
         |                             ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +283 drivers/gpu/drm/panthor/arbitration/panthor_partition_control.c

   237	
   238	static int partition_control_init(struct panthor_arbitration *adev,
   239					   const struct fwnode_handle *child)
   240	{
   241		struct panthor_arbitration_resource res;
   242		struct panthor_partition_control *pc;
   243		struct device *dev = adev->dev;
   244		struct irq_data *irqdata;
   245		void __iomem *iomem;
   246		u32 irq_flags = 0;
   247		char *name;
   248		int irq;
   249		int ret;
   250	
   251		ret = panthor_arbitration_parse_resource(dev, child, &res);
   252		if (ret)
   253			return ret;
   254	
   255		if (res.id >= AM_ARB_MAX_PC_COUNT)
   256			return -ENODEV;
   257	
   258		if (adev->pc[res.id])
   259			return dev_warn_probe(dev, -ENODEV, "partition@%llx: id (%u) already present",
   260					      res.res.start, res.id);
   261	
   262		pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
   263		if (!pc)
   264			return -ENOMEM;
   265	
   266		name = devm_kasprintf(dev, GFP_KERNEL, "pc%d", res.id);
   267	
   268		iomem = devm_ioremap_resource(dev, &res.res);
   269		if (IS_ERR(iomem))
   270			return dev_err_probe(dev, PTR_ERR(iomem), "%s: Failed to ioremap", name);
   271	
   272		pc->name = name;
   273		pc->dev = dev;
   274		pc->iomem = iomem;
   275	
   276		spin_lock_init(&pc->lock);
   277		pc->current_aw = -1;
   278	
   279		irq = fwnode_irq_get(child, 0);
   280		if (irq < 0)
   281			return dev_err_probe(dev, irq, "%s: Failed to get IRQ", name);
   282	
 > 283		irqdata = irq_get_irq_data(irq);
   284		if (irqdata)
   285			irq_flags = irqd_get_trigger_type(irqdata);
   286	
   287		ret = devm_request_irq(
   288			dev, irq, partition_irq_raw_handler, irq_flags | IRQF_SHARED,
   289			devm_kasprintf(dev, GFP_KERNEL, "panthor-%s-irq", name), pc);
   290		if (ret)
   291			return ret;
   292	
   293		adev->pc[res.id] = pc;
   294	
   295		partition_irq_resume(pc);
   296	
   297		return 0;
   298	}
   299	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
