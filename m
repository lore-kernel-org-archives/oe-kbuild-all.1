Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE121A433
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753978810; cv=none; b=Ss6ge2eywwFC1dRS2IQ1tvqIbCKD2rdNr7VgmGk1nVhsSetCJiVctey7buh7DLl14HTaS0DCj+ycaLzn2jCMsMcdvQGGi2xnlHkEaOS3bqA0HIuf8xEeIkXo1UmWVz3CEoUKnVXC/pfKGa1WsnADZmQLzXqA5Y6MCzwvuPxeLro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753978810; c=relaxed/simple;
	bh=1/3dtNGgyd/5kgq7GttR3zh1e8laYzrDwVPgu97IukQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAo5j6v1H9lH7qqVyys4g/xetCIQy2iRv9xg1TocoJJqxwRoilKxAwH/RYDexyO9f71SjWJTEf3eWUNjD1hF75VU+wnYG1iBPUYM7pco4c9/eCF7rG+MrSafQI7lHMBHk0jhxD6OiYbhbT3aVPZ01h1ZUk3B5ixRofXP87z+22A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioc1jbhY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioc1jbhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753978808; x=1785514808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/3dtNGgyd/5kgq7GttR3zh1e8laYzrDwVPgu97IukQ=;
  b=ioc1jbhYK1phmYh7lyeV5vRrrTsCS4LR4ozHJttK2C1EBPxxN3V2GSJz
   88MJSCboNYiacZ5zi2BLYVKOEAWpOvZFVmpotx0m5KvQT+q1+HpfXfDww
   3St1ccejpBqolPeVVqQqtoK+igywv/NvENA6Y0ZzC5+FdgVdIOFQAfhBw
   Bu6VvS+MHGJjMY5oE9XLaiyyHQ8StBPxEdiNonwz7QH8NaoetkR3U6R4l
   5jJqow8LeIq+7mdDIu2jRHq/jP4ALcTyT/jsxaAFT4iv3INvo4qvEV1eN
   GBnRkzCwlo7bPvrT8IsNFmPNf88W6Gzt2GASLcLud4AYOzEggAobiyaE5
   g==;
X-CSE-ConnectionGUID: nf5QHMLJTDSG2X/Vsp8T0Q==
X-CSE-MsgGUID: Pth2A7a1SYOXf/73sGHVMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56455659"
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; 
   d="scan'208";a="56455659"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 09:20:08 -0700
X-CSE-ConnectionGUID: 1rgF5bEqTJiAxtJr0tsZYA==
X-CSE-MsgGUID: 4hSoEkZORpuO8Lmy6vjeMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; 
   d="scan'208";a="167791002"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2025 09:20:06 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhW0h-0003uq-2t;
	Thu, 31 Jul 2025 16:20:03 +0000
Date: Fri, 1 Aug 2025 00:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: drivers/irqchip/irq-gic-v5-iwb.c:265:1-8: WARNING: invalid free of
 devm_ allocated data
Message-ID: <202508010038.N3r4ZmII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lorenzo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   260f6f4fda93c8485c8037865c941b42b9cba5d2
commit: 53bb952a625fd3247647c7a28366ce990a579415 arm64: Kconfig: Enable GICv5
date:   3 weeks ago
config: arm64-randconfig-r052-20250731 (https://download.01.org/0day-ci/archive/20250801/202508010038.N3r4ZmII-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010038.N3r4ZmII-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-gic-v5-iwb.c:265:1-8: WARNING: invalid free of devm_ allocated data

vim +265 drivers/irqchip/irq-gic-v5-iwb.c

695949d8b16f11 Lorenzo Pieralisi 2025-07-03  238  
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  239  static int gicv5_iwb_device_probe(struct platform_device *pdev)
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  240  {
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  241  	struct gicv5_iwb_chip_data *iwb_node;
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  242  	void __iomem *iwb_base;
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  243  	struct resource *res;
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  244  	int ret;
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  245  
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  246  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  247  	if (!res)
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  248  		return -EINVAL;
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  249  
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  250  	iwb_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  251  	if (!iwb_base) {
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  252  		dev_err(&pdev->dev, "failed to ioremap %pR\n", res);
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  253  		return -ENOMEM;
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  254  	}
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  255  
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  256  	iwb_node = gicv5_iwb_init_bases(iwb_base, pdev);
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  257  	if (IS_ERR(iwb_node)) {
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  258  		ret = PTR_ERR(iwb_node);
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  259  		goto out_unmap;
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  260  	}
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  261  
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  262  	return 0;
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  263  
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  264  out_unmap:
695949d8b16f11 Lorenzo Pieralisi 2025-07-03 @265  	iounmap(iwb_base);
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  266  	return ret;
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  267  }
695949d8b16f11 Lorenzo Pieralisi 2025-07-03  268  

:::::: The code at line 265 was first introduced by commit
:::::: 695949d8b16f11f2f172d8d0c7ccc1ae09ed6cb7 irqchip/gic-v5: Add GICv5 IWB support

:::::: TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
