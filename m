Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A1DE552
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 01:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761268704; cv=none; b=quuwoH336Nxb6RHC794SxqKjeqEGJUXNhkVeq6Yo70/fdirFjQNP/k49J17ik9UCEh/YGFAprC7BT/pIikxPxMa5oy6DPjKSDM9E2vz/HTZ8NfkP6OxrhJfMYmhHYuciQyS8XTnCRr21m1mrSNCEl2WZR5Ih6ZxW0mRAZObPrtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761268704; c=relaxed/simple;
	bh=59FO9Amj4ysi/kc47tN83xqFTK/m8OqAO7T7dJZqYb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tllCBIUH3MJcKp+UT5a9JgXlWZOWHUdk7X8AhTi0OVwEIIJZq7xPvMwbu+ciUoNsBkxtTvT7eB5dskzido2FwQB8tvmBQ6VOkkLCPw1lER8G4Pnwq/8gVDY+tOmJKUu8AZ5/o6peRSHpsmqea/7sDaUurWAEi01vxzZax/lbxZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6EyMwV6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6EyMwV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761268703; x=1792804703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=59FO9Amj4ysi/kc47tN83xqFTK/m8OqAO7T7dJZqYb4=;
  b=d6EyMwV6TPJ9HGh4ZARm4Wz+IGI7NGcgvN/aInGABcf1Lwfpq33wlToB
   3q16ddeK77U4rKlgHGOOYoXDfNnpfZDeZ7I4n5KbWLjCXp7bCCKyvS3SV
   1oJSp7hUTnH9g9BHMtoQ+VSuYyNrS1LduVXQLwXgk6QjBdIBjviwtT072
   ELyuMzF9gaYY6ze8zh8mOgJJUe9vq/FM0MTMFUwSTPzfCdcvImHuj4T5y
   8auH2uNH0gY+Qpwn2IV/A9kZiSPAOSKfI1w+Gro6Qzzgsbd4ww6WQjKo2
   luWCWw0iGD++aJCUtfvCp3fdDopRgr+XEOGN1HORzfDMoIQeGwhncVirQ
   g==;
X-CSE-ConnectionGUID: P7JuSofRS+S149SAl8Zcmg==
X-CSE-MsgGUID: dF3XA1DhRUKsf58lvJztXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67317060"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="67317060"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 18:18:22 -0700
X-CSE-ConnectionGUID: CKIP91qTTQeI7w7Tlnz6Fg==
X-CSE-MsgGUID: UgEJhx29S0+C9FhOxviPPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="221502573"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2025 18:18:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC6Rf-000E3N-0j;
	Fri, 24 Oct 2025 01:18:19 +0000
Date: Fri, 24 Oct 2025 09:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 17/25] dmaengine: dw-edma: Add
 dw_edma_find_by_child() helper
Message-ID: <202510240850.wHR4rcrk-lkp@intel.com>
References: <20251023071916.901355-18-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023071916.901355-18-den@valinux.co.jp>

Hi Koichiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on jonmason-ntb/ntb-next]
[also build test ERROR on vkoul-dmaengine/next pci/next pci/for-linus linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251023-153325
base:   https://github.com/jonmason/ntb ntb-next
patch link:    https://lore.kernel.org/r/20251023071916.901355-18-den%40valinux.co.jp
patch subject: [RFC PATCH 17/25] dmaengine: dw-edma: Add dw_edma_find_by_child() helper
config: x86_64-buildonly-randconfig-005-20251024 (https://download.01.org/0day-ci/archive/20251024/202510240850.wHR4rcrk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240850.wHR4rcrk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240850.wHR4rcrk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   ld: drivers/pci/controller/dwc/pcie-designware-ep.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:pcie-designware.c:(.text+0x820): first defined here
   ld: drivers/pci/controller/dwc/pci-keystone.o: in function `dw_edma_find_by_child':
   pci-keystone.c:(.text+0x1050): multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:pcie-designware.c:(.text+0x820): first defined here
   ld: drivers/pci/controller/dwc/pci-layerscape-ep.o: in function `dw_edma_find_by_child':
   pci-layerscape-ep.c:(.text+0x360): multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:pcie-designware.c:(.text+0x820): first defined here
   ld: drivers/pci/controller/dwc/pcie-qcom-common.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:pcie-designware.c:(.text+0x820): first defined here
   ld: drivers/pci/controller/dwc/pcie-qcom-ep.o: in function `dw_edma_find_by_child':
   pcie-qcom-ep.c:(.text+0xec0): multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:pcie-designware.c:(.text+0x820): first defined here
--
   In file included from drivers/pci/controller/dwc/pcie-designware.h:18,
                    from drivers/pci/controller/dwc/pci-layerscape-ep.c:19:
>> include/linux/dma/edma.h:145:17: warning: no previous prototype for 'dw_edma_find_by_child' [-Wmissing-prototypes]
     145 | struct dw_edma *dw_edma_find_by_child(struct device *child)
         |                 ^~~~~~~~~~~~~~~~~~~~~


vim +148 include/linux/dma/edma.h

   140	
   141	static inline void dw_edma_unregister_selfirq(struct dw_edma *dw,
   142						      dw_edma_selfirq_fn fn, void *data)
   143	{
   144	}
 > 145	struct dw_edma *dw_edma_find_by_child(struct device *child)
   146	{
   147		return NULL;
 > 148	}
   149	#endif /* CONFIG_DW_EDMA */
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
