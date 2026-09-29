Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C45A54CF50
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712884; cv=none; b=sF4OfpKXk+aLezBnq9bt0uQmVlN0mET3O2pPXl/sp30Z1Iq0qBiDiEi+r+WxSu4ZmbbXBoD/AJX8dWvajcgGqrQWB8T2pygY9ho5/Z08XQqcQWWjSrXqnP43aWl8ywb9dKa0U4fvyP1M83yLKykafoIye2Dor2XxobN6Chm+zaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712884; c=relaxed/simple;
	bh=4w4qYY8drV3/EKK1qhrLcQB0Fksbs9Uxqh5vvQjlWiI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W2rF0rzhxdNZHVaIUZ4YikHoqh7L8VVr8KjgQhhWfsc1jVujn2k+FXX7cQmj2U6eAl84LhMlokWKr8QVc33Da0lKxMQSwcQqLfgzKVfkbPJ8liaCEynjLeZVcb8TVrLPhGohHEXsE6i+/AdDLWvQZUZ84iEhQTVWuQ8W7h/dyNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fV0eAle1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fV0eAle1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790712883; x=1822248883;
  h=date:from:to:cc:subject:message-id;
  bh=4w4qYY8drV3/EKK1qhrLcQB0Fksbs9Uxqh5vvQjlWiI=;
  b=fV0eAle1cxl+TcoJUI+kYoMTE8WeXiEyNEKmELUyRjB5Lb9/ww+hTAZU
   EMCqaaPrBs2Mlvngxn8zU8bqiyerEzVqxflCZ9+A9+9Ebi5L0sgBDJmkm
   i9CgCOM9SUwLczvKSZ5xMS5nEvgGgKYf7xM4a/gnr9wxVwd6lY2AV/GFd
   szRn6DFsIr6eO+E1C8C6uctshaV7Vb5uxK+m4cn93UegqpJDAJx7zqi0z
   4ItqQI8OnvwELg7ADJSsk5guaCBdQP37u0Yaz3j/QZBExInbTGW1F/SY1
   W7NC+cGPXWulw1t93OghhCGHlGnS0NKZBXKOd3+73MHVMM55E9zyhXVl/
   A==;
X-CSE-ConnectionGUID: wSK1BPj8RU+f13U/3cQSHQ==
X-CSE-MsgGUID: 4NQrh1pCT6SyqQMjTb117Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90661634"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90661634"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 13:14:42 -0700
X-CSE-ConnectionGUID: 2OI+4lJKSh6u/VGD+/HEoQ==
X-CSE-MsgGUID: Pv0qJOKFQDuOC+zxvqxMDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274676626"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2026 13:14:39 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBeDk-000000001Xr-3CJQ;
	Tue, 29 Sep 2026 20:14:36 +0000
Date: Tue, 29 Sep 2026 22:13:43 +0200
From: kernel test robot <lkp@intel.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: 
 drivers/gpu/drm/panthor/arbitration/panthor_resource_group.c:291:17: warning:
 assignment to 'struct irq_data *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202609292234.i7NglRRm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Karunika-Choo/drm-panthor-Ignore-EOPNOTSUPP-for-shader-present-nvmem-lookup/20260922-214455
head:   d1fb2a7097a879293d3b0e71e2556f48f2793224
commit: 8d5d47f7a6f68c74679c1d6cc1214cfbbc24d401 drm/panthor: Add AM_RESOURCE_GROUP support
date:   7 days ago
config: sparc64-randconfig-r2303-20260929 (https://download.01.org/0day-ci/archive/20260929/202609292234.i7NglRRm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609292234.i7NglRRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609292234.i7NglRRm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/arbitration/panthor_resource_group.c: In function 'resource_group_init':
   drivers/gpu/drm/panthor/arbitration/panthor_resource_group.c:291:19: error: implicit declaration of function 'irq_get_irq_data'; did you mean 'irq_set_irq_wake'? [-Werror=implicit-function-declaration]
     291 |         irqdata = irq_get_irq_data(irq);
         |                   ^~~~~~~~~~~~~~~~
         |                   irq_set_irq_wake
>> drivers/gpu/drm/panthor/arbitration/panthor_resource_group.c:291:17: warning: assignment to 'struct irq_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     291 |         irqdata = irq_get_irq_data(irq);
         |                 ^
   drivers/gpu/drm/panthor/arbitration/panthor_resource_group.c:293:29: error: implicit declaration of function 'irqd_get_trigger_type' [-Werror=implicit-function-declaration]
     293 |                 irq_flags = irqd_get_trigger_type(irqdata);
         |                             ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +291 drivers/gpu/drm/panthor/arbitration/panthor_resource_group.c

   238	
   239	static int resource_group_init(struct panthor_arbitration *adev,
   240				       const struct fwnode_handle *child)
   241	{
   242		struct panthor_arbitration_resource res;
   243		struct panthor_resource_group *rg;
   244		struct device *dev = adev->dev;
   245		struct irq_data *irqdata;
   246		void __iomem *iomem;
   247		u32 irq_flags = 0;
   248		char *name;
   249		int irq;
   250		int ret;
   251	
   252		ret = panthor_arbitration_parse_resource(dev, child, &res);
   253		if (ret)
   254			return ret;
   255	
   256		if (res.id >= AM_ARB_MAX_RG_COUNT)
   257			return -ENODEV;
   258	
   259		if (adev->rg[res.id])
   260			return dev_warn_probe(dev, -ENODEV, "resource-group@%llx: id (%u) already present",
   261					      res.res.start, res.id);
   262	
   263		rg = devm_kzalloc(dev, sizeof(*rg), GFP_KERNEL);
   264		if (!rg)
   265			return -ENOMEM;
   266	
   267		name = devm_kasprintf(dev, GFP_KERNEL, "rg%d", res.id);
   268	
   269		iomem = devm_ioremap_resource(dev, &res.res);
   270		if (IS_ERR(iomem))
   271			return dev_err_probe(dev, PTR_ERR(iomem), "%s: Failed to ioremap", name);
   272	
   273		rg->name = name;
   274		rg->dev = dev;
   275		rg->iomem = iomem;
   276	
   277		rg->wq = devm_alloc_ordered_workqueue(dev, "panthor-%s-wq", 0, name);
   278		if (!rg->wq)
   279			return -ENOMEM;
   280	
   281		INIT_WORK(&rg->msg_retry_work, rg_retry_messages);
   282	
   283		for (int i = 0; i < AM_ARB_MAX_AW_COUNT; i++)
   284			panthor_am_msg_init(&rg->aw_data[i].msg,
   285					    rg->iomem + AM_RG_AW_MESSAGE(i));
   286	
   287		irq = fwnode_irq_get(child, 0);
   288		if (irq < 0)
   289			return dev_err_probe(dev, irq, "%s: Failed to get IRQ", name);
   290	
 > 291		irqdata = irq_get_irq_data(irq);
   292		if (irqdata)
   293			irq_flags = irqd_get_trigger_type(irqdata);
   294	
   295		ret = devm_request_irq(
   296			dev, irq, rg_irq_raw_handler, irq_flags | IRQF_SHARED,
   297			devm_kasprintf(dev, GFP_KERNEL, "panthor-%s-irq", name), rg);
   298		if (ret)
   299			return ret;
   300	
   301		adev->rg[res.id] = rg;
   302	
   303		rg_irq_resume(rg);
   304	
   305		rg_handshake_init(rg);
   306	
   307		return 0;
   308	}
   309	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
