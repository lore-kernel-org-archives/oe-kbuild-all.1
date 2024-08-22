Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2910313CA81
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 06:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724308916; cv=none; b=qOo/z7fXuHwxEb9xYcHQH7k7XH+QkWTNijmHhq/R/fhc49Pe9A1l7LhMqnF3xy+4uZwgCleRu7RBTdHYhoSPQvnMifqoS4nhtwdn3G4OjqpCKMl+sCYYT8L6jajXBsiplLYpSgrFhrMs3QS0P6rOlPtI0HoglSTHVNGS/W1pWvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724308916; c=relaxed/simple;
	bh=p2IozRmDN/sxJkwPso2FxIGNPhYNwsgAF6oxyphKEw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2rOPXErbLvDnVBMgh8vsZeK1epa7+haT2lcR7DrZC6GvE4rXjULmOPeFAfxSi1qswURihcJCZAnYvN0U4it0G8GR6E0lqTwUSdQ353wqfdVK4fpy/+aacs9aZqi/7zH2DSB1e6QWkFAVzy/uWox7OTxArQosfDp80N31VhraJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ii0BwZpI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ii0BwZpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724308914; x=1755844914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p2IozRmDN/sxJkwPso2FxIGNPhYNwsgAF6oxyphKEw8=;
  b=ii0BwZpIoGM7qijFCpn2DfLx6QxWWC6EGu36LuWZ1Jw7MvGVqA6M7Qqq
   +AvB6vdQVgR2vQsf5tDxcHvB4ey9FuMbBlQXH0F06pT7uX+OmOKfgRj7z
   ZggIrdbJG6GS7FAE5YPu5LnxNuQaXH7Ejc4LgG6TyLSLPrSEW6h23H56C
   ffpIJyzuvuqCwkc8ipj+LP1P6n+1897ElobtuB21Nri94tvQukoTbfe2G
   SixDlG1vJM6m3Ff2z8HIgHNSJqXIHcw4TOc4Fq+Kso9v5CSJSNA8UZGzZ
   nXNlCUbODioOg1vuQ+8a3TzL82RqaaXwakFUf40lqJgrasHAdXWkuJpx5
   g==;
X-CSE-ConnectionGUID: fsMQqmS8TqmTgiJxNaya6Q==
X-CSE-MsgGUID: JtWbfY+KSvq0cybS+s1bMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="34086921"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="34086921"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 23:41:53 -0700
X-CSE-ConnectionGUID: ilJX+NfbQByKUdXPQGR2zA==
X-CSE-MsgGUID: ODoDZ6k0Q6akNIxX/lWnBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66224462"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2024 23:41:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh1W2-000CT2-2Z;
	Thu, 22 Aug 2024 06:41:50 +0000
Date: Thu, 22 Aug 2024 14:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: daire.mcnamara@microchip.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 1/3] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <202408221406.A9GgBOCs-lkp@intel.com>
References: <20240821130217.957424-2-daire.mcnamara@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821130217.957424-2-daire.mcnamara@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/daire-mcnamara-microchip-com/PCI-microchip-Fix-outbound-address-translation-tables/20240821-210421
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240821130217.957424-2-daire.mcnamara%40microchip.com
patch subject: [PATCH v8 1/3] PCI: microchip: Fix outbound address translation tables
config: x86_64-buildonly-randconfig-001-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221406.A9GgBOCs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221406.A9GgBOCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221406.A9GgBOCs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/plda/pcie-microchip-host.c:617:5: warning: no previous prototype for 'mc_pcie_setup_iomems' [-Wmissing-prototypes]
     617 | int mc_pcie_setup_iomems(struct pci_host_bridge *bridge,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/mc_pcie_setup_iomems +617 drivers/pci/controller/plda/pcie-microchip-host.c

   616	
 > 617	int mc_pcie_setup_iomems(struct pci_host_bridge *bridge,
   618				   struct plda_pcie_rp *port)
   619	{
   620		void __iomem *bridge_base_addr = port->bridge_addr;
   621		struct resource_entry *entry;
   622		u64 pci_addr;
   623		u32 index = 1;
   624	
   625		resource_list_for_each_entry(entry, &bridge->windows) {
   626			if (resource_type(entry->res) == IORESOURCE_MEM) {
   627				pci_addr = entry->res->start - entry->offset;
   628				plda_pcie_setup_window(bridge_base_addr, index,
   629						       entry->res->start & MC_OUTBOUND_TRANS_TBL_MASK,
   630						       pci_addr, resource_size(entry->res));
   631				index++;
   632			}
   633		}
   634	
   635		return 0;
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
