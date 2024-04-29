Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE02C2C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714380637; cv=none; b=XASIeGDsBkgvu94SCso41q4DP2MskxDwgZ8wRAMknctGvOLRsFC34T5xfGvRzH+w0XfysLurAAH6dVAkcif1evI3KSUR7RCXvoSEXDJRtXc98ulyX+ZvvEfAZbV2KiU/r5xVYbTnjY6sCsfvYbjBu7sV+GevSmQt93z/OyY8zHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714380637; c=relaxed/simple;
	bh=ILo/sW7BRpnsNaGv4Lp23BVw7AnQMELlmBTXgeglUxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpW7keauyiF0GnSXDxY1m5GwDqKhfhrVV9cEIoeTI432ZjUcezsmbf4TvrpZKJDVEC1UoTVUIXJuZV/g0hKxJ5kstLKXVI2SBGcxAdUOH90o3jf11XmEj5xB4H4bqJP2stH2r9RFWj5TKCg0zmgCY5d0qznXJms6yKs8fFRyqYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1AiAzna; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1AiAzna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714380635; x=1745916635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILo/sW7BRpnsNaGv4Lp23BVw7AnQMELlmBTXgeglUxA=;
  b=H1AiAznauVX2gIJQ7i/cjvEQUmc3Y+XKlO1+SM3v2lyaqVcs8scG4yRi
   p7iaMa6OFe3UJDh61PEytG8cqhRVMSqD+NPFO/t1CkScee0WYLAbH+ujc
   ylyHq6f0TstnSr+G62wgYtlFXxaio3qOopsd517lO5kEanHca20RtEz2s
   Y5Xz39YW6xGOnY/8lYkKMgsFrsWCzmR399Le+FWTr5o3MlrwxSjMxPMOe
   4V8cC1mg770pG5sOt+ctalBgbgjBg1qAAYhNnmdN8hMJpTcuK4Owl5Syn
   ESwuuG6mpxpT4W2aA/sBrtvb2xYG9x5uakLu8Hj645HxH1DQ1bB3/p8ca
   w==;
X-CSE-ConnectionGUID: a7szpQbcRTaeha1BKzTWcg==
X-CSE-MsgGUID: VlSP64vESlye+zdnu/YFEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20648639"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="20648639"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:50:34 -0700
X-CSE-ConnectionGUID: X6NMyjiYTnGl6nAijzaNyg==
X-CSE-MsgGUID: uQT+83g3T7qR9mRdHXoRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26676704"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2024 01:50:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1MiV-00074E-1L;
	Mon, 29 Apr 2024 08:50:31 +0000
Date: Mon, 29 Apr 2024 16:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3312/29983]
 drivers/irqchip/irq-imx-irqsteer.c:385:21: error: use of undeclared
 identifier 'imx_irqsteer_runtime_suspend'; did you mean
 'pm_generic_runtime_suspend'?
Message-ID: <202404291617.h9A9nnYz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: 5e46c8d4031866e0084fcdeb68ca1998f158aa9d [3312/29983] MLK-17290-01 irqchip: imx-irqsteer: add runtime pm support
config: i386-buildonly-randconfig-002-20240429 (https://download.01.org/0day-ci/archive/20240429/202404291617.h9A9nnYz-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291617.h9A9nnYz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291617.h9A9nnYz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-imx-irqsteer.c:193:27: error: use of undeclared identifier 'irqsteer_data'
     193 |         ret = clk_prepare_enable(irqsteer_data->ipg_clk);
         |                                  ^
>> drivers/irqchip/irq-imx-irqsteer.c:385:21: error: use of undeclared identifier 'imx_irqsteer_runtime_suspend'; did you mean 'pm_generic_runtime_suspend'?
     385 |         SET_RUNTIME_PM_OPS(imx_irqsteer_runtime_suspend,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                            pm_generic_runtime_suspend
   include/linux/pm.h:341:21: note: expanded from macro 'SET_RUNTIME_PM_OPS'
     341 |         .runtime_suspend = suspend_fn, \
         |                            ^
   include/linux/pm_runtime.h:33:12: note: 'pm_generic_runtime_suspend' declared here
      33 | extern int pm_generic_runtime_suspend(struct device *dev);
         |            ^
>> drivers/irqchip/irq-imx-irqsteer.c:386:7: error: use of undeclared identifier 'imx_irqsteer_runtime_resume'
     386 |                            imx_irqsteer_runtime_resume, NULL)
         |                            ^
   3 errors generated.


vim +385 drivers/irqchip/irq-imx-irqsteer.c

   381	
   382	static const struct dev_pm_ops imx_irqsteer_pm_ops = {
   383		SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
   384					      pm_runtime_force_resume)
 > 385		SET_RUNTIME_PM_OPS(imx_irqsteer_runtime_suspend,
 > 386				   imx_irqsteer_runtime_resume, NULL)
   387	};
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
