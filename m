Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8D916C451
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724313299; cv=none; b=Zn/RIFZGyQxANBqbhkkdR0rm3vzVeQRJcMAfSPV6b32LXNrZAUHwLjq8aGDhZIVVUs20V2uhyio7PyrvPTfsYDNKbWM2+Y14QzY5INQXhjCRzTxa6XSqTIGllV92WnRAVvnULnVH6Sz6PeXN5643n9aMiJ7b/t9KqtmKYLezydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724313299; c=relaxed/simple;
	bh=Vxksdz14FuYMu5Oj3OV/bEiLAtdV4IQVEZpOGN0D71w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRQfJ/lI96BWVNlj4XTMRtOFFHHXdNhgCxQjiu2Sj3pQPPRaGNHmcXkMhMVucOBtd/Z5Jlmsrm0PDKUI8UsuSd5vGX4xbnbwwNXtXL02Gnss378wSFoOPdxr0q8t/pIQOiRuFVl05W+ua/F2NVEhoKBiONpg1YnYq47Q1YbYsg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y51Km89r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y51Km89r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724313298; x=1755849298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vxksdz14FuYMu5Oj3OV/bEiLAtdV4IQVEZpOGN0D71w=;
  b=Y51Km89rPAfOs0hRlosFQGbsAOyPvd9Towc3XZy+BNs+eNlK6SYw1RX3
   U0szJfbcw4N/8ZCIEMMNmGbMMC1p8aBXv8w0niYbgIxlRDsSs/cGy1DL1
   OTMmQMYpwaPgEnEJ4AhHaEVIA0fGK8Nto3NU9O+8WGkDbiAU1RCYMnDgD
   JoDbWXElZT1fodLOqFAxhSfk6d+KUtnLo/1xvVu9OqoJ85cSj+4UbBW3Z
   IVs1nX/VmF7SXtvLPC/c9UK7KAiOsmnTtaDJ1PwdmUiSCl1tqMscOCLQ9
   gWyfZlOGm0zyO4O9q1hbE85JkyIOe187pk8YXRl1s0LkXJgqWx5dkPQGD
   g==;
X-CSE-ConnectionGUID: vNyz0LJZRAKdbeUlkuO60Q==
X-CSE-MsgGUID: HsLlZ/BaQP219U/vz1n46g==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26578714"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="26578714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 00:54:57 -0700
X-CSE-ConnectionGUID: Gqde8CiVTd+gRnVyrnY34g==
X-CSE-MsgGUID: u4GOtUZWTyytr7qeT5yh6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="61028249"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2024 00:54:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh2ek-000CYW-2S;
	Thu, 22 Aug 2024 07:54:54 +0000
Date: Thu, 22 Aug 2024 15:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: daire.mcnamara@microchip.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 1/3] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <202408221512.EL84YVBf-lkp@intel.com>
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
config: openrisc-randconfig-r133-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221512.EL84YVBf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408221512.EL84YVBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221512.EL84YVBf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/plda/pcie-microchip-host.c:617:5: sparse: sparse: symbol 'mc_pcie_setup_iomems' was not declared. Should it be static?

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
