Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA67719DFAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735666380; cv=none; b=XML5nJwY0/d7hWlYs01yxfcdgyA6uvyxLfXdBxpaPJn9wF+38qZIAiglanq5NYf5EFcDt0ndQVWXY4jefbzu9j0zwFTHtGj36ULeLxOs4uX9/ut2GPNtzHCBcdMRXubipYVqvbcF703u1TS6jwQrJSguwZ73gRtOvZ8aqfYCrgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735666380; c=relaxed/simple;
	bh=QKpN37+g7m0II1Jh0oK8WYTLtph/MHgxrzhhLdYVfHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EgtzQGzUoh8nBj2VXYacQUYDrCVYGO+ICVLH1QAi5jDNMUv8jyxQ7/4r7DJ0cX9Cpt7VNo8globRUjUauBFT6MVloJiwx3YrI9125c4UflCacOj59Bnst913+yFHlGX3y0mCXjOm4CAzufoF7smy7UyVV78Esb34CSux3rVIGK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bp0qqGkP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bp0qqGkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735666377; x=1767202377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QKpN37+g7m0II1Jh0oK8WYTLtph/MHgxrzhhLdYVfHo=;
  b=Bp0qqGkP9JAXRAgFiFBqU+KS2/RbbTOrxfjx6Qx0GVeGLbcM8I+tENke
   EU8JemZvwljZUvknx0GXsUEXrArW8NN/pPCrtimfkEKgdNMkLPHjOWI7X
   jCX+PXcC1Zyj11gc3tsHlNSqoWYhGXkOUebUULwlUWbhEQ1C+ymv6Ygtp
   oRtIFivrg0vLs4UJuvZKNHFW3xhSD+lR8DGrR2h+Y1NbmpOtlTeWVb3Eo
   1v9gJkToZHVRsVMn0QnCk25rYcYrdnGd5hMSFza114q28MMs4bT+VhGgH
   LlfHhG9Ml0cch7TV7SxeLdGNgufihKZC3q7eSJX3sDGFIR6jOrW4FsJPJ
   w==;
X-CSE-ConnectionGUID: G982gkBVRKuWLF6N9Nf27A==
X-CSE-MsgGUID: bY5fDT8BQ7iYapLE3WIurw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35826318"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="35826318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 09:32:57 -0800
X-CSE-ConnectionGUID: 2DyyKzgRRauw9+fDmDy1/Q==
X-CSE-MsgGUID: ZT9hXrpnR66Zddi2WgLOJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="106073281"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Dec 2024 09:32:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSg6v-0007Ix-21;
	Tue, 31 Dec 2024 17:32:53 +0000
Date: Wed, 1 Jan 2025 01:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1682/1682]
 drivers/net/ethernet/huawei/hinic/hinic_lld.c:2138:10: error: use of
 undeclared identifier 'disable_vf_load'
Message-ID: <202501010108.ACLHt8gM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1e531b8351b843cd4a160764c0f67e4c9805234d
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [1682/1682] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: arm64-randconfig-001-20241231 (https://download.01.org/0day-ci/archive/20250101/202501010108.ACLHt8gM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010108.ACLHt8gM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010108.ACLHt8gM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic/hinic_lld.c:18:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:447:6: warning: no previous prototype for function 'hinic_init_syncfw_timer' [-Wmissing-prototypes]
     447 | void hinic_init_syncfw_timer(struct hinic_pcidev *pci_adapter)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:447:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     447 | void hinic_init_syncfw_timer(struct hinic_pcidev *pci_adapter)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:462:6: warning: no previous prototype for function 'hinic_destroy_syncfw_timer' [-Wmissing-prototypes]
     462 | void hinic_destroy_syncfw_timer(struct hinic_pcidev *pci_adapter)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:462:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     462 | void hinic_destroy_syncfw_timer(struct hinic_pcidev *pci_adapter)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:550:5: warning: no previous prototype for function 'hinic_version_cmp' [-Wmissing-prototypes]
     550 | int hinic_version_cmp(char *ver1, char *ver2)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:550:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     550 | int hinic_version_cmp(char *ver1, char *ver2)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1139:7: warning: no previous prototype for function 'hinic_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
    1139 | void *hinic_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1139 | void *hinic_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1296:6: warning: no previous prototype for function 'hinic_get_card_func_info_by_card_name' [-Wmissing-prototypes]
    1296 | void hinic_get_card_func_info_by_card_name(const char *chip_name,
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1296:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1296 | void hinic_get_card_func_info_by_card_name(const char *chip_name,
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1896:6: warning: no previous prototype for function 'hinic_event_process' [-Wmissing-prototypes]
    1896 | void hinic_event_process(void *adapter, struct hinic_event_info *event)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1896:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1896 | void hinic_event_process(void *adapter, struct hinic_event_info *event)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:2138:10: error: use of undeclared identifier 'disable_vf_load'
    2138 |                 return disable_vf_load;
         |                        ^
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2156:9: error: use of undeclared identifier 'disable_vf_load'
    2156 |         return disable_vf_load;
         |                ^
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2198:39: error: use of undeclared identifier 'disable_vf_load'
    2198 |         hinic_set_vf_load_state(pci_adapter, disable_vf_load);
         |                                              ^
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2263:33: warning: shift count >= width of type [-Wshift-count-overflow]
    2263 |         err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2273:42: warning: shift count >= width of type [-Wshift-count-overflow]
    2273 |         err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
         |                                                 ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2419:11: error: use of undeclared identifier 'disable_vf_load'
    2419 |                         true : disable_vf_load;
         |                                ^
   9 warnings and 4 errors generated.


vim +/disable_vf_load +2138 drivers/net/ethernet/huawei/hinic/hinic_lld.c

  2126	
  2127	static bool hinic_get_vf_load_state(struct pci_dev *pdev)
  2128	{
  2129		unsigned char parent_bus_number;
  2130		struct card_node *chip_node;
  2131		u8 id;
  2132	
  2133		if (!pdev->is_virtfn)
  2134			return false;
  2135	
  2136		/* vf used in vm */
  2137		if (pci_is_root_bus(pdev->bus))
> 2138			return disable_vf_load;
  2139	
  2140		parent_bus_number = pdev->bus->parent->number;
  2141	
  2142		lld_dev_hold();
  2143		list_for_each_entry(chip_node, &g_hinic_chip_list, node) {
  2144			if (chip_node->dp_bus_num == parent_bus_number) {
  2145				for (id = 0; id < HINIC_MAX_PF_NUM; id++) {
  2146					if (chip_node->pf_bus_num[id] ==
  2147					    pdev->bus->number) {
  2148						lld_dev_put();
  2149						return chip_node->disable_vf_load[id];
  2150					}
  2151				}
  2152			}
  2153		}
  2154		lld_dev_put();
  2155	
  2156		return disable_vf_load;
  2157	}
  2158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
