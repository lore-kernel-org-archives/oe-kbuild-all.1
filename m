Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AA616F851
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727629423; cv=none; b=Rjjc67cbstTZtCIyByJblSQDr7R+pk1Ct32r//TVeqE46YjD7AE6eiLGPKj0o5/SSiRZqcwdO+pLzhIqijaQP/DCFxj8cdhy95k3jG/a7sC+ApWhrGqgh45ODE/T3OF9kWFNoEtcNN3vZ16MltJcdJODfDQXIMM9izx58m0qosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727629423; c=relaxed/simple;
	bh=XvA73ox+fdqSR30OI2nHK6yqt7oPSXzcV6BPQWfrtgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pDTplnwAVEcb+7Mv7N12WAW/zkxsZ8+za0YNlKXJBGAS8RKAScMDXDqJB/lU5YLFpgVG/P7GL7y+OFQbN3vyXWoLf5JNfDHUX7OHEDkKB1jxsI7imexU+NfT5D02T9clkNuGYZzMR/SoYiQNF1J0gobTmXyRFEzo1yLI6ff3JgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWsoP/Jb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWsoP/Jb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727629422; x=1759165422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XvA73ox+fdqSR30OI2nHK6yqt7oPSXzcV6BPQWfrtgQ=;
  b=DWsoP/Jb5qYk0FUVGCRDFfSs2+SpylDGPPuZzM7u+r85qOKDsj2hzzOb
   hQ9mAUNgiMQuauClTPlRumU+OkppCprubvoXde3IAsNdiPDfqU2hkj/Nv
   m+Low0HrOHp7YHn6RGhjgZbYG/VCC8XvYh/NhSksmSJwnrpW/HnM27uqX
   uAWl8FPmQNGZoGVS6BJy0mmvIt1+8uHZRf0dchy/RrTwATgmgqPQ8KOaI
   q7nZWkhm7FuanAlGE5kikY8DgsOoDiED7fIc/gU/sLJpgScdUcLjFaETb
   QZcgaWGZVld0l3EF3kVRdfsMixuUls5lEy9nCaJ31+KHjv1/2HjfLXe76
   A==;
X-CSE-ConnectionGUID: KycLYzMLST6Wm+rM/DXsSg==
X-CSE-MsgGUID: DfQ40tgIToqVm/143Pg7mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44178709"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="44178709"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:03:41 -0700
X-CSE-ConnectionGUID: sVSSWTU9Q6udFKxSXkfjHw==
X-CSE-MsgGUID: ZZGHvSeASH2ZCT4jkgFCig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="110545330"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Sep 2024 10:03:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suxKb-000OTt-1b;
	Sun, 29 Sep 2024 17:03:37 +0000
Date: Mon, 30 Sep 2024 01:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 6701/16788]
 drivers/pci/controller/dwc/pci-imx6.c:1805:13: warning: no previous
 prototype for function 'host_wake_irq_handler'
Message-ID: <202409300026.OM8Rt96f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 4798df98caca7055fa7b0549378829f4f0dd349d [6701/16788] LF-10866-1 PCI: imx6: Add pci host wakeup support on imx platforms.
config: arm-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240930/202409300026.OM8Rt96f-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300026.OM8Rt96f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300026.OM8Rt96f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/dwc/pci-imx6.c:25:
   In file included from include/linux/pci.h:1621:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/pci/controller/dwc/pci-imx6.c:1315:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1315 |         int ret = 0;
         |             ^
>> drivers/pci/controller/dwc/pci-imx6.c:1805:13: warning: no previous prototype for function 'host_wake_irq_handler' [-Wmissing-prototypes]
    1805 | irqreturn_t host_wake_irq_handler(int irq, void *priv)
         |             ^
   drivers/pci/controller/dwc/pci-imx6.c:1805:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1805 | irqreturn_t host_wake_irq_handler(int irq, void *priv)
         | ^
         | static 
   3 warnings generated.


vim +/host_wake_irq_handler +1805 drivers/pci/controller/dwc/pci-imx6.c

  1804	
> 1805	irqreturn_t host_wake_irq_handler(int irq, void *priv)
  1806	{
  1807		struct imx6_pcie *imx6_pcie = priv;
  1808		struct device *dev = imx6_pcie->pci->dev;
  1809	
  1810		dev_dbg(dev, "%s: host wakeup by pcie", __func__);
  1811	
  1812		/* Notify PM core we are wakeup source */
  1813		pm_wakeup_event(dev, 0);
  1814		pm_system_wakeup();
  1815	
  1816		return IRQ_HANDLED;
  1817	}
  1818	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
