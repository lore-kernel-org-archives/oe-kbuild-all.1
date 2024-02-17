Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C074657BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 22:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708209904; cv=none; b=MEMbKiVIQxaH7U+OmfA6DhGNRW5DWBtutY5L/Jo2fby13s7FxZBl3a4YEs23pN1DS2l/qb7AztJurJjaBVVdPsDb/H5xaik22XcaR3TV9sxwuSeXcoQVgWlgniCdbJTeMW/H3bm0EFRBSDLohG86l8/JYxaVKMY1SNIYMr11k4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708209904; c=relaxed/simple;
	bh=44ghp+jALDrLwZm8OPwPqSDVt36wJWx8NRTXSVtNb4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zr26Uh/FayKXTBGg9pObRyVVm9YAUmz7roGdZa00pdbxnDhdFuVZBqjD/g/+6NLFOi1I3PsP6PV0OVFKE2tto5qwpPjqLLxS8aT4RVz7xjJS3S/w2fYR08Lfu0uuZv8OuhOdhpYg4LAidYWylL5H3e602W0KeaI3GXjIqZTnC/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5CnUVIj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5CnUVIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708209903; x=1739745903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=44ghp+jALDrLwZm8OPwPqSDVt36wJWx8NRTXSVtNb4c=;
  b=C5CnUVIjq0CPIfvpGgRyewyLCNjDQRZy7HWXQQ2jg+t7LzVTn9xfTQMp
   snzNAv0GYy1IQ6mKFxu6dleLoJHWVo90xUSwDwveyNM03nV9E94vJdt+l
   giMKjbDCqAkEYwjKd92r1tkV9tFvdCWcM5OFYTNV8P7r5Rvt0OTSNbHoL
   mf26IjJnfK07Rch4t6zelBp4T3PGGUPOb4yLg+gc+1vYT9RGtozijxSIy
   ikkKjdC1A59ZIXm2GKFE1O1S4dbzPAJqIFTRfaA2HCa2Qb+Le2KzXjBM3
   2OiUWLanhkXsASDAeutkM7Ex2onGDfNUXb7E1Hr85YASCqxOUmou09BZ3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2429573"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2429573"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 14:45:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4210103"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2024 14:45:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbTQX-0002YC-39;
	Sat, 17 Feb 2024 22:44:58 +0000
Date: Sun, 18 Feb 2024 06:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Cheatham <Benjamin.Cheatham@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] pcie/cxl_timeout: Add CXL.mem Timeout &
 Isolation interrupt support
Message-ID: <202402180605.q2KA3Ka5-lkp@intel.com>
References: <20240215194048.141411-7-Benjamin.Cheatham@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215194048.141411-7-Benjamin.Cheatham@amd.com>

Hi Ben,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus cxl/next cxl/pending linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ben-Cheatham/cxl-core-Add-CXL-Timeout-Isolation-capability-parsing/20240216-034328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240215194048.141411-7-Benjamin.Cheatham%40amd.com
patch subject: [RFC PATCH 6/6] pcie/cxl_timeout: Add CXL.mem Timeout & Isolation interrupt support
config: i386-randconfig-005-20240217 (https://download.01.org/0day-ci/archive/20240218/202402180605.q2KA3Ka5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180605.q2KA3Ka5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180605.q2KA3Ka5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/cxl/core/port.o: in function `pcie_cxlt_register_dport':
>> drivers/cxl/cxlpci.h:114: multiple definition of `pcie_cxlt_register_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:114: first defined here
   ld: drivers/cxl/core/port.o: in function `pcie_cxlt_unregister_dport':
>> drivers/cxl/cxlpci.h:115: multiple definition of `pcie_cxlt_unregister_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:115: first defined here
   ld: drivers/cxl/core/regs.o: in function `pcie_cxlt_register_dport':
>> drivers/cxl/cxlpci.h:114: multiple definition of `pcie_cxlt_register_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:114: first defined here
   ld: drivers/cxl/core/regs.o: in function `pcie_cxlt_unregister_dport':
>> drivers/cxl/cxlpci.h:115: multiple definition of `pcie_cxlt_unregister_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:115: first defined here
   ld: drivers/cxl/core/mbox.o: in function `pcie_cxlt_register_dport':
>> drivers/cxl/cxlpci.h:114: multiple definition of `pcie_cxlt_register_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:114: first defined here
   ld: drivers/cxl/core/mbox.o: in function `pcie_cxlt_unregister_dport':
>> drivers/cxl/cxlpci.h:115: multiple definition of `pcie_cxlt_unregister_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:115: first defined here
   ld: drivers/cxl/core/pci.o: in function `pcie_cxlt_register_dport':
>> drivers/cxl/cxlpci.h:114: multiple definition of `pcie_cxlt_register_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:114: first defined here
   ld: drivers/cxl/core/pci.o: in function `pcie_cxlt_unregister_dport':
>> drivers/cxl/cxlpci.h:115: multiple definition of `pcie_cxlt_unregister_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:115: first defined here
   ld: drivers/cxl/core/cdat.o: in function `pcie_cxlt_register_dport':
>> drivers/cxl/cxlpci.h:114: multiple definition of `pcie_cxlt_register_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:114: first defined here
   ld: drivers/cxl/core/cdat.o: in function `pcie_cxlt_unregister_dport':
>> drivers/cxl/cxlpci.h:115: multiple definition of `pcie_cxlt_unregister_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:115: first defined here
   ld: drivers/cxl/pci.o: in function `pcie_cxlt_register_dport':
>> drivers/cxl/cxlpci.h:114: multiple definition of `pcie_cxlt_register_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:114: first defined here
   ld: drivers/cxl/pci.o: in function `pcie_cxlt_unregister_dport':
>> drivers/cxl/cxlpci.h:115: multiple definition of `pcie_cxlt_unregister_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:115: first defined here
   ld: drivers/cxl/mem.o: in function `pcie_cxlt_register_dport':
>> drivers/cxl/cxlpci.h:114: multiple definition of `pcie_cxlt_register_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:114: first defined here
   ld: drivers/cxl/mem.o: in function `pcie_cxlt_unregister_dport':
>> drivers/cxl/cxlpci.h:115: multiple definition of `pcie_cxlt_unregister_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:115: first defined here
   ld: drivers/cxl/port.o: in function `pcie_cxlt_register_dport':
>> drivers/cxl/cxlpci.h:114: multiple definition of `pcie_cxlt_register_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:114: first defined here
   ld: drivers/cxl/port.o: in function `pcie_cxlt_unregister_dport':
>> drivers/cxl/cxlpci.h:115: multiple definition of `pcie_cxlt_unregister_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:115: first defined here
   ld: drivers/perf/cxl_pmu.o: in function `pcie_cxlt_register_dport':
   drivers/perf/../cxl/cxlpci.h:114: multiple definition of `pcie_cxlt_register_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:114: first defined here
   ld: drivers/perf/cxl_pmu.o: in function `pcie_cxlt_unregister_dport':
   drivers/perf/../cxl/cxlpci.h:115: multiple definition of `pcie_cxlt_unregister_dport'; drivers/pci/pcie/portdrv.o:drivers/pci/pcie/../../cxl/cxlpci.h:115: first defined here


vim +114 drivers/cxl/cxlpci.h

   100	
   101	int devm_cxl_port_enumerate_dports(struct cxl_port *port);
   102	struct cxl_dev_state;
   103	int cxl_hdm_decode_init(struct cxl_dev_state *cxlds, struct cxl_hdm *cxlhdm,
   104				struct cxl_endpoint_dvsec_info *info);
   105	void read_cdat_data(struct cxl_port *port);
   106	void cxl_cor_error_detected(struct pci_dev *pdev);
   107	pci_ers_result_t cxl_error_detected(struct pci_dev *pdev,
   108					    pci_channel_state_t state);
   109	
   110	#ifdef CONFIG_PCIE_CXL_TIMEOUT
   111	int pcie_cxlt_register_dport(struct cxl_dport *dport);
   112	void pcie_cxlt_unregister_dport(struct cxl_dport *dport);
   113	#else
 > 114	int pcie_cxlt_register_dport(void *dport) { return -ENXIO; }
 > 115	void pcie_cxlt_unregister_dport(void *dport) {}
   116	#endif
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
