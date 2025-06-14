Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF942E11CC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 03:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749871859; cv=none; b=cDuBBORk+IwV8wWvrjbG2XAB/3UwBp+wpkmT5yVuqCaT2OFzuA51sMd9UnRb6Y7KdDI0LxVLe52/dOX5pLzVhNW/VoPls4XHmjHldMd9Hp8VMdWV6ws7h7RV7YCdczzBMxheTql8HAq65z8Yne2dDnjHyQafJh9D/S8EmTBUShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749871859; c=relaxed/simple;
	bh=ajNQuep6XfBvIodkNKEXmHbbH17X9oEDjYhWP4If2hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJCbMfEMZsG3JtTbJkXiOKX/Ej4K/k8k0d5qMTKT9HpisKUxFIgRyvyvTDX39eCWDLWAWkBjA3/xL71ZEQWKREEz66zZoZB4SGPDLrB9z6aBfsu+Z1zdRt2Z3m+8hMejVeAqI6O0t40xMn4pYP9VyyXl5/n3Rj/oWFZyu/mtfyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWX4vUSY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWX4vUSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749871857; x=1781407857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ajNQuep6XfBvIodkNKEXmHbbH17X9oEDjYhWP4If2hY=;
  b=IWX4vUSYcFKNDxDn0yRKglkxicYkXuVU6kph0b30VudLnoQC0dtSpT0o
   8iHs99Y54sLHoJQbOfiWMVYcdD0yS3vROndlhE1lBuLpjsyl0GRK6LaOB
   0zVwwzOvBet82jDZLoAOVeNPJJJYJmfhQ9OjZDqZ8PInzvfVg8AOS6zq5
   XD9mXJZ28UMSCmLduhOIgBgrUfgM/fF9k0DveXFO+qggvhHxb5OJiuf3K
   fncdAI2i1Vi69lM8GhlPxzMfhqsc/qwqCi7osE5D1/5ca1VCF6nT7tF1G
   JE5f9fSPy7Olh0ma/T5z6HYjYqR5rMQ5Rsr1D7QShymNDQIl7p3w81/Nm
   w==;
X-CSE-ConnectionGUID: Br/30ww6QCGRI1JZEFJPng==
X-CSE-MsgGUID: q34H0afoSxejPIdecXDc8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52228964"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="52228964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 20:30:56 -0700
X-CSE-ConnectionGUID: Lx5aufvOSEK/5KDkZfpp9A==
X-CSE-MsgGUID: 6gTy6iZ4RGCYeo6i62S0xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="151808907"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 20:30:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQHbX-000DFG-0x;
	Sat, 14 Jun 2025 03:30:51 +0000
Date: Sat, 14 Jun 2025 11:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/5] PCI: rockchip-host: Use standard PCIe defines
Message-ID: <202506141053.s2TxMChc-lkp@intel.com>
References: <fc88993a561fcc9a9960c038bbc8b0b717924888.1749791474.git.geraldogabriel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc88993a561fcc9a9960c038bbc8b0b717924888.1749791474.git.geraldogabriel@gmail.com>

Hi Geraldo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on pci/next pci/for-linus mani-mhi/mhi-next linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geraldo-Nascimento/PCI-rockchip-host-Use-standard-PCIe-defines/20250613-132302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/fc88993a561fcc9a9960c038bbc8b0b717924888.1749791474.git.geraldogabriel%40gmail.com
patch subject: [RFC PATCH v3 1/5] PCI: rockchip-host: Use standard PCIe defines
config: s390-randconfig-002-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141053.s2TxMChc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141053.s2TxMChc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141053.s2TxMChc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-rockchip-host.c: In function 'rockchip_pcie_enable_bw_int':
   drivers/pci/controller/pcie-rockchip-host.c:43:40: error: 'PCIE_RC_CONFIG_CR' undeclared (first use in this function); did you mean 'PCIE_RC_CONFIG_DCR'?
      43 |  status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        PCIE_RC_CONFIG_DCR
   drivers/pci/controller/pcie-rockchip-host.c:43:40: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pci/controller/pcie-rockchip-host.c: In function 'rockchip_pcie_clr_bw_int':
   drivers/pci/controller/pcie-rockchip-host.c:52:40: error: 'PCIE_RC_CONFIG_CR' undeclared (first use in this function); did you mean 'PCIE_RC_CONFIG_DCR'?
      52 |  status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        PCIE_RC_CONFIG_DCR
   drivers/pci/controller/pcie-rockchip-host.c: In function 'rockchip_pcie_set_power_limit':
>> drivers/pci/controller/pcie-rockchip-host.c:272:17: error: implicit declaration of function 'FIELD_MAX' [-Werror=implicit-function-declaration]
     272 |  while (power > FIELD_MAX(PCI_EXP_DEVCAP_PWR_VAL)) {
         |                 ^~~~~~~~~
   drivers/pci/controller/pcie-rockchip-host.c:281:40: error: 'PCIE_RC_CONFIG_CR' undeclared (first use in this function); did you mean 'PCIE_RC_CONFIG_DCR'?
     281 |  status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        PCIE_RC_CONFIG_DCR
>> drivers/pci/controller/pcie-rockchip-host.c:282:12: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     282 |  status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
         |            ^~~~~~~~~~
   drivers/pci/controller/pcie-rockchip-host.c: In function 'rockchip_pcie_host_init_port':
   drivers/pci/controller/pcie-rockchip-host.c:312:40: error: 'PCIE_RC_CONFIG_CR' undeclared (first use in this function); did you mean 'PCIE_RC_CONFIG_DCR'?
     312 |  status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        PCIE_RC_CONFIG_DCR
   cc1: some warnings being treated as errors


vim +/FIELD_MAX +272 drivers/pci/controller/pcie-rockchip-host.c

   250	
   251	static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
   252	{
   253		int curr;
   254		u32 status, scale, power;
   255	
   256		if (IS_ERR(rockchip->vpcie3v3))
   257			return;
   258	
   259		/*
   260		 * Set RC's captured slot power limit and scale if
   261		 * vpcie3v3 available. The default values are both zero
   262		 * which means the software should set these two according
   263		 * to the actual power supply.
   264		 */
   265		curr = regulator_get_current_limit(rockchip->vpcie3v3);
   266		if (curr <= 0)
   267			return;
   268	
   269		scale = 3; /* 0.001x */
   270		curr = curr / 1000; /* convert to mA */
   271		power = (curr * 3300) / 1000; /* milliwatt */
 > 272		while (power > FIELD_MAX(PCI_EXP_DEVCAP_PWR_VAL)) {
   273			if (!scale) {
   274				dev_warn(rockchip->dev, "invalid power supply\n");
   275				return;
   276			}
   277			scale--;
   278			power = power / 10;
   279		}
   280	
   281		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
 > 282		status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
   283		status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);
   284		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
