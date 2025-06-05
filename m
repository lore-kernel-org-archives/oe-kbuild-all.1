Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A931F1581F0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109673; cv=none; b=uJfHVTaYHpOiiWk5hdOXv8y1+wQjSfzVlJc0JDffSaK315jo/9HaxiMFJCs00/2eHo7CbAIWBw3Io4Nov4KWgiS/ongmurfSwDUKEZ5Z3bSUADVstFMeAHGnmoEuh+qjXumvClJMpwQ2+cloyKK5oXxi0KGUlW7dnTrkWDwBrLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109673; c=relaxed/simple;
	bh=SAeHDkHXJ9wooT+/bah3A7s0DXExmNmE+SnswQbMB74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgeNpWrw5LfuF+XdkgbEOWnbrpVWwjMzsY0Z8RolS135iXszJB1eCJo8g4cwlnmsAj4p5yrgRXsDgJuHIGun4fezDtpV/OwPYs18eBPYAmH5ic9KrpYGlbUynvNVldlLquE7jF4Hjq0SmJShCXS3XWUmAEVQhLRFI66+K8vRpZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jI/30Kj8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jI/30Kj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749109671; x=1780645671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SAeHDkHXJ9wooT+/bah3A7s0DXExmNmE+SnswQbMB74=;
  b=jI/30Kj8ZdeAW9pmrUEdjbN+Ug3gH9VribM7yhS7RMm3EblDYh+NfKm1
   k6yeLQHof5omD3l16MorKS0/M05+32aIed6wrZ+o8l26OQOQY+m7DL0qu
   APAK4lIjPU1sT9gqvfvuYE0lQNnQvCpjHd36en8otxaO+JL3PRPy+YLGK
   bcQH/LjpJse5kdgWyrn35e1PEeDuD3sN1W5dGgxHS0fQhPbKB7APnQ06D
   3bWnBqulocn2Hm38xYE2JBAelWbfWmx+isa3V2p7RF95fb5+x8eNGJxYl
   XuKck7VOKGQ+haUFDflO8FQWLuGJS09mpwvIg56/Jw05sA69U783LsxDf
   w==;
X-CSE-ConnectionGUID: Z4l1l9aCRBeJjK5K9Jy0Rw==
X-CSE-MsgGUID: i6BV8MdFQHe2g6Pe8McwJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54878837"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="54878837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 00:47:47 -0700
X-CSE-ConnectionGUID: cipsCoEkS9a9ydWWXo60tQ==
X-CSE-MsgGUID: 8RsncQhhSa+uffl8zQju6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="146372339"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2025 00:47:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN5Jh-0003rl-1O;
	Thu, 05 Jun 2025 07:47:13 +0000
Date: Thu, 5 Jun 2025 15:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
Message-ID: <202506051537.2KwuJ05d-lkp@intel.com>
References: <20250530111917.1495023-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530111917.1495023-5-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on pci/next pci/for-linus geert-renesas-drivers/renesas-clk arm64/for-next/core linus/master v6.15 next-20250604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/soc-renesas-rz-sysc-Add-syscon-regmap-support/20250530-192256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250530111917.1495023-5-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH v2 4/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for Renesas RZ/G3S SoC
config: powerpc64-randconfig-r132-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051537.2KwuJ05d-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051537.2KwuJ05d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051537.2KwuJ05d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-rzg3s-host.c:1650:12: sparse: sparse: symbol 'rzg3s_soc_power_resets' was not declared. Should it be static?
>> drivers/pci/controller/pcie-rzg3s-host.c:1654:12: sparse: sparse: symbol 'rzg3s_soc_cfg_resets' was not declared. Should it be static?
   drivers/pci/controller/pcie-rzg3s-host.c:500:13: sparse: sparse: context imbalance in 'rzg3s_pcie_msi_irq_ack' - wrong count at exit
   drivers/pci/controller/pcie-rzg3s-host.c:512:13: sparse: sparse: context imbalance in 'rzg3s_pcie_msi_irq_mask' - wrong count at exit
   drivers/pci/controller/pcie-rzg3s-host.c:525:13: sparse: sparse: context imbalance in 'rzg3s_pcie_msi_irq_unmask' - wrong count at exit
   drivers/pci/controller/pcie-rzg3s-host.c:821:13: sparse: sparse: context imbalance in 'rzg3s_pcie_intx_irq_ack' - wrong count at exit
   drivers/pci/controller/pcie-rzg3s-host.c:832:13: sparse: sparse: context imbalance in 'rzg3s_pcie_intx_irq_mask' - wrong count at exit
   drivers/pci/controller/pcie-rzg3s-host.c:842:13: sparse: sparse: context imbalance in 'rzg3s_pcie_intx_irq_unmask' - wrong count at exit

vim +/rzg3s_soc_power_resets +1650 drivers/pci/controller/pcie-rzg3s-host.c

  1649	
> 1650	const char * const rzg3s_soc_power_resets[] = {
  1651		"aresetn", "rst_cfg_b", "rst_load_b",
  1652	};
  1653	
> 1654	const char * const rzg3s_soc_cfg_resets[] = {
  1655		"rst_b", "rst_ps_b", "rst_gp_b", "rst_rsm_b",
  1656	};
  1657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
