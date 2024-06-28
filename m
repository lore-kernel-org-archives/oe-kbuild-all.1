Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E564502D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 05:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719552586; cv=none; b=tVsyUIXYJPdPqWTr2m207m21b9+3N0OMIMjrGsfF+ksR06D6tqsXRHeVM6xMF9oyMJrlZs+E+8J8WkYsQTg7LoyWL3/iLpt1RBg3HZvl6hYEUXN4IhnwvtPpSdrbntal33aeXHwc38Wq4k7JfqO0i7eushrwe2FnO+JrAA57c3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719552586; c=relaxed/simple;
	bh=7Rs+t3S82TQVJArr9F0sa6xnfKp7I/VTvfT/ME+xPMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fP7XVTvmGEvZMPfd011cAJXq2i9xV+VIFc/xEbQ1x17SChuRlilenVcK5PvYWWbWTTpehIwgsG5bc4zvdociYjsFQoKWhUWlPSvJsCGzRK9tcmR7gNsh1W/eIAvTKNtPEDjzJ2PDJmIzX5M5lKMVbS8lAuTMPSgkRbJjwtZUlvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVripyXz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVripyXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719552584; x=1751088584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Rs+t3S82TQVJArr9F0sa6xnfKp7I/VTvfT/ME+xPMc=;
  b=FVripyXzmWj97Pws2fxK/oMsyE0zI7eJK6ZLY+lcjIubErjBK2gyvN2S
   ZCD5cN8AhEZePaYySux+IwS79rYDHQQSrQO2T9hLDUZ1EvOyc8DgtyniC
   5PeLgziK0RZ9X5EO3vubu5o/+uA/NC549R8kLE46fJgYoeY02DUfTwKdr
   8KLuw39yJrG0QqdjCK7CLbryBF+THwjL4PWdBdeJnqajNI0oLzbM0RUM8
   9IvcyCV6Fcq5OnV3m2hZ4sScmvh6RgiXiitZZrQ45eFc0COH16y4MUxkq
   S/2H9mz0+MElSL3an+ecyke3gnv43kxP2yQLPdzkzryAO6PBA/VAF1z6Z
   Q==;
X-CSE-ConnectionGUID: nSvfhvESTGOt1r1tI4vmMA==
X-CSE-MsgGUID: +2KCJJKJSByjn44fSstlgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27853645"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="27853645"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 22:29:43 -0700
X-CSE-ConnectionGUID: x4WQpsltREuseaWwifek+w==
X-CSE-MsgGUID: +NPOUWemTUSNqQJ6CP9X6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="45368257"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 22:29:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN4B2-000Gpg-0N;
	Fri, 28 Jun 2024 05:29:40 +0000
Date: Fri, 28 Jun 2024 13:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:vmclock 22/22] drivers/ptp/ptp_vmclock.c:442:17: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202406281336.6WCFy1DQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux vmclock
head:   bc4da0d0abda0b72bc79c0c95750748cb87394c9
commit: dea92ae21f9df74ad8784ae0f343724f74f20b0e [22/22] ptp: Add vDSO-style vmclock support
config: x86_64-randconfig-121-20240628 (https://download.01.org/0day-ci/archive/20240628/202406281336.6WCFy1DQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281336.6WCFy1DQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281336.6WCFy1DQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ptp/ptp_vmclock.c:442:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct vmclock_abi *clk @@     got void [noderef] __iomem * @@
   drivers/ptp/ptp_vmclock.c:442:17: sparse:     expected struct vmclock_abi *clk
   drivers/ptp/ptp_vmclock.c:442:17: sparse:     got void [noderef] __iomem *

vim +442 drivers/ptp/ptp_vmclock.c

   421	
   422	static int vmclock_probe(struct platform_device *pdev)
   423	{
   424		struct device *dev = &pdev->dev;
   425		struct vmclock_state *st;
   426		int ret;
   427	
   428		st = devm_kzalloc(dev, sizeof (*st), GFP_KERNEL);
   429		if (!st)
   430			return -ENOMEM;
   431	
   432		if (has_acpi_companion(dev))
   433			ret = vmclock_probe_acpi(dev, st);
   434		else
   435			ret = -EINVAL; /* Only ACPI for now */
   436	
   437		if (ret) {
   438			dev_info(dev, "Failed to obtain physical address: %d\n", ret);
   439			goto out;
   440		}
   441	
 > 442		st->clk = devm_ioremap_resource(dev, &st->res);
   443		if (IS_ERR(st->clk)) {
   444			ret = PTR_ERR(st->clk);
   445			dev_info(dev, "failed to map shared memory\n");
   446			st->clk = NULL;
   447			goto out;
   448		}
   449	
   450		if (st->clk->magic != VMCLOCK_MAGIC ||
   451		    st->clk->size < sizeof(*st->clk) ||
   452		    st->clk->version != 1) {
   453			dev_info(dev, "vmclock magic fields invalid\n");
   454			ret = -EINVAL;
   455			goto out;
   456		}
   457	
   458		if (IS_ENABLED(CONFIG_ARM64) &&
   459		    st->clk->counter_id == VMCLOCK_COUNTER_ARM_VCNT) {
   460			/* Can we check it's the virtual counter? */
   461			st->cs_id = CSID_ARM_ARCH_COUNTER;
   462		} else if (IS_ENABLED(CONFIG_X86) &&
   463			   st->clk->counter_id == VMCLOCK_COUNTER_X86_TSC) {
   464			st->cs_id = CSID_X86_TSC;
   465		}
   466		st->sys_cs_id = st->cs_id;
   467	
   468		ret = ida_alloc(&vmclock_ida, GFP_KERNEL);
   469		if (ret < 0)
   470			goto out;
   471	
   472		st->index = ret;
   473	        ret = devm_add_action_or_reset(&pdev->dev, vmclock_put_idx, st);
   474		if (ret)
   475			goto out;
   476	
   477		st->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->index);
   478		if (!st->name) {
   479			ret = -ENOMEM;
   480			goto out;
   481		}
   482	
   483		/* If the structure is big enough, it can be mapped to userspace */
   484		if (st->clk->size >= PAGE_SIZE) {
   485			st->miscdev.minor = MISC_DYNAMIC_MINOR;
   486			st->miscdev.fops = &vmclock_miscdev_fops;
   487			st->miscdev.name = st->name;
   488	
   489			ret = misc_register(&st->miscdev);
   490			if (ret)
   491				goto out;
   492		}
   493	
   494		/* If there is valid clock information, register a PTP clock */
   495		if (st->cs_id) {
   496			st->ptp_clock_info = ptp_vmclock_info;
   497			strncpy(st->ptp_clock_info.name, st->name, sizeof(st->ptp_clock_info.name));
   498			st->ptp_clock = ptp_clock_register(&st->ptp_clock_info, dev);
   499	
   500			if (IS_ERR(st->ptp_clock)) {
   501				ret = PTR_ERR(st->ptp_clock);
   502				st->ptp_clock = NULL;
   503				vmclock_remove(pdev);
   504				goto out;
   505			}
   506		}
   507	
   508		dev_set_drvdata(dev, st);
   509	
   510	 out:
   511		return ret;
   512	}
   513	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
