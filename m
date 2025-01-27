Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127384039
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737991878; cv=none; b=Lvg76CCDI1ZKx6gRLuFWe1y4GHQldK14YerIMzMZzA/J2h2N3okwtJRVRZ7LirNeLyZzKnN+M73AWO4cMgxOWMCwr43icXZouAtcL70Pb3yW3QK29GrRsf0nTpILdWm1rF6gM0DpAEnvx1SEjs0lNoyVkvuTVC8Y0hTa6u3Qkhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737991878; c=relaxed/simple;
	bh=qWcqQzZecacXqE6hdI6n/cCWxd3QSi5swcNjdjTcYFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYcfo7ZPLjQHTLnabxCJY1xt59hJ52ijpRL1V6n+H79UYoOKWa2YArPcbtLIapSSZy0U3VTzARVwVNmpxDBLLpFnpiYm0UXhytx18VeCj3td2q/kmOPjCzJpOQXOmI8357A3GfELmJXyM/aZk+fF3enUJR74OUygAxcQ+RUcuAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0FqwJpG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0FqwJpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737991877; x=1769527877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qWcqQzZecacXqE6hdI6n/cCWxd3QSi5swcNjdjTcYFU=;
  b=b0FqwJpGKbjbI3reHLK6pu4ssu9FsCoFecUy2mnD0VNxcri8/oZ+nGlx
   iGy9hpcCxNZRJVYyUK3e3IWfEufPxW5dBCCLRDDUbc9n4PF5k8anOk7Nr
   QXSBGiLXhohJheAw2JiAl80ZKvE9tDA2bkyMYW7VgaTKeQ1HYQ+8K8pbc
   Q+4EiH3OMbeCRundcI7jXkrovKuJR7M5FCLZEi4YLe84Xnh3IYfaG6zET
   Wm0AnkBqEQeyY4RNFUboloRk0TqDl62EiPq1G7D45niNBMay8TW30x4pc
   2psVdtVZArnTl+6B++fNtlTPOe+NdypW39isbWaSqtiXdRK4dI97wped3
   Q==;
X-CSE-ConnectionGUID: WZRXRKXhST2+9/lJG5CrFQ==
X-CSE-MsgGUID: 0Sm/rTvXTX+frAtS7lWGfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42119813"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="42119813"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 07:31:16 -0800
X-CSE-ConnectionGUID: RLYEl/DXTniNtZ0Xhm1t8A==
X-CSE-MsgGUID: gUcFUnljSJK3mVgManGy9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113433231"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jan 2025 07:31:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcR4y-000gtP-2U;
	Mon, 27 Jan 2025 15:31:12 +0000
Date: Mon, 27 Jan 2025 23:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 13/14] ahci: sata_highbank: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Message-ID: <202501272311.wwRTRF7F-lkp@intel.com>
References: <20250127-pm_ata-v1-13-f8f50c821a2a@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-pm_ata-v1-13-f8f50c821a2a@gmail.com>

Hi Raphael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5ffa57f6eecefababb8cbe327222ef171943b183]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/ahci-brcm-Switch-from-CONFIG_PM_SLEEP-guards-to-pm_sleep_ptr/20250127-205128
base:   5ffa57f6eecefababb8cbe327222ef171943b183
patch link:    https://lore.kernel.org/r/20250127-pm_ata-v1-13-f8f50c821a2a%40gmail.com
patch subject: [PATCH RFC 13/14] ahci: sata_highbank: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
config: csky-randconfig-002-20250127 (https://download.01.org/0day-ci/archive/20250127/202501272311.wwRTRF7F-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501272311.wwRTRF7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501272311.wwRTRF7F-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ata/sata_highbank.c: In function 'ahci_highbank_suspend':
>> drivers/ata/sata_highbank.c:590:9: error: implicit declaration of function 'ata_host_suspend'; did you mean 'ata_sas_port_suspend'? [-Wimplicit-function-declaration]
     590 |         ata_host_suspend(host, PMSG_SUSPEND);
         |         ^~~~~~~~~~~~~~~~
         |         ata_sas_port_suspend
   drivers/ata/sata_highbank.c: In function 'ahci_highbank_resume':
>> drivers/ata/sata_highbank.c:607:9: error: implicit declaration of function 'ata_host_resume'; did you mean 'ahci_port_resume'? [-Wimplicit-function-declaration]
     607 |         ata_host_resume(host);
         |         ^~~~~~~~~~~~~~~
         |         ahci_port_resume


vim +590 drivers/ata/sata_highbank.c

8996b89d6bc98ae Mark Langsdorf  2012-09-06  567  
8996b89d6bc98ae Mark Langsdorf  2012-09-06  568  static int ahci_highbank_suspend(struct device *dev)
8996b89d6bc98ae Mark Langsdorf  2012-09-06  569  {
8996b89d6bc98ae Mark Langsdorf  2012-09-06  570  	struct ata_host *host = dev_get_drvdata(dev);
8996b89d6bc98ae Mark Langsdorf  2012-09-06  571  	struct ahci_host_priv *hpriv = host->private_data;
8996b89d6bc98ae Mark Langsdorf  2012-09-06  572  	void __iomem *mmio = hpriv->mmio;
8996b89d6bc98ae Mark Langsdorf  2012-09-06  573  	u32 ctl;
8996b89d6bc98ae Mark Langsdorf  2012-09-06  574  
8996b89d6bc98ae Mark Langsdorf  2012-09-06  575  	if (hpriv->flags & AHCI_HFLAG_NO_SUSPEND) {
8996b89d6bc98ae Mark Langsdorf  2012-09-06  576  		dev_err(dev, "firmware update required for suspend/resume\n");
8996b89d6bc98ae Mark Langsdorf  2012-09-06  577  		return -EIO;
8996b89d6bc98ae Mark Langsdorf  2012-09-06  578  	}
8996b89d6bc98ae Mark Langsdorf  2012-09-06  579  
8996b89d6bc98ae Mark Langsdorf  2012-09-06  580  	/*
8996b89d6bc98ae Mark Langsdorf  2012-09-06  581  	 * AHCI spec rev1.1 section 8.3.3:
8996b89d6bc98ae Mark Langsdorf  2012-09-06  582  	 * Software must disable interrupts prior to requesting a
8996b89d6bc98ae Mark Langsdorf  2012-09-06  583  	 * transition of the HBA to D3 state.
8996b89d6bc98ae Mark Langsdorf  2012-09-06  584  	 */
8996b89d6bc98ae Mark Langsdorf  2012-09-06  585  	ctl = readl(mmio + HOST_CTL);
8996b89d6bc98ae Mark Langsdorf  2012-09-06  586  	ctl &= ~HOST_IRQ_EN;
8996b89d6bc98ae Mark Langsdorf  2012-09-06  587  	writel(ctl, mmio + HOST_CTL);
8996b89d6bc98ae Mark Langsdorf  2012-09-06  588  	readl(mmio + HOST_CTL); /* flush */
8996b89d6bc98ae Mark Langsdorf  2012-09-06  589  
ec87cf3782f7b05 Sergey Shtylyov 2022-02-02 @590  	ata_host_suspend(host, PMSG_SUSPEND);
ec87cf3782f7b05 Sergey Shtylyov 2022-02-02  591  	return 0;
8996b89d6bc98ae Mark Langsdorf  2012-09-06  592  }
8996b89d6bc98ae Mark Langsdorf  2012-09-06  593  
8996b89d6bc98ae Mark Langsdorf  2012-09-06  594  static int ahci_highbank_resume(struct device *dev)
8996b89d6bc98ae Mark Langsdorf  2012-09-06  595  {
8996b89d6bc98ae Mark Langsdorf  2012-09-06  596  	struct ata_host *host = dev_get_drvdata(dev);
8996b89d6bc98ae Mark Langsdorf  2012-09-06  597  	int rc;
8996b89d6bc98ae Mark Langsdorf  2012-09-06  598  
8996b89d6bc98ae Mark Langsdorf  2012-09-06  599  	if (dev->power.power_state.event == PM_EVENT_SUSPEND) {
8996b89d6bc98ae Mark Langsdorf  2012-09-06  600  		rc = ahci_reset_controller(host);
8996b89d6bc98ae Mark Langsdorf  2012-09-06  601  		if (rc)
8996b89d6bc98ae Mark Langsdorf  2012-09-06  602  			return rc;
8996b89d6bc98ae Mark Langsdorf  2012-09-06  603  
8996b89d6bc98ae Mark Langsdorf  2012-09-06  604  		ahci_init_controller(host);
8996b89d6bc98ae Mark Langsdorf  2012-09-06  605  	}
8996b89d6bc98ae Mark Langsdorf  2012-09-06  606  
8996b89d6bc98ae Mark Langsdorf  2012-09-06 @607  	ata_host_resume(host);
8996b89d6bc98ae Mark Langsdorf  2012-09-06  608  
8996b89d6bc98ae Mark Langsdorf  2012-09-06  609  	return 0;
8996b89d6bc98ae Mark Langsdorf  2012-09-06  610  }
8996b89d6bc98ae Mark Langsdorf  2012-09-06  611  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
