Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1872D97A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 06:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545006; cv=none; b=OFqtaGhhR36mmBWwavdvyATab8CvzkOrSUZH/ZrbgWdr1nvbUJ1XHvNezbR6EdfS7G1/9m/UxB3qG01VFA21OaGXOZXjAVeXJiJOBLabS5RZWErVohb89haqBEwBTyoetgRoL1+FGpFxeWALAcbuQg6pS3Hq9ICo0UoY7b2/lw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545006; c=relaxed/simple;
	bh=Qi0iZNQ6ivOk7FBkfkXN68AWtjp/RbOvnCdKy6Kge4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Htot+n162xJ/SRj6xx5Nb3/Poxls4Dngz/O47xz3MNAmR1T05ximXK8PhN2H9uSwDA1IfoDtpNZQKfQoX5gn1y4e6SE/PBDKl45nvBzd14ri+S3lSU5UpdMxY9htaYj/6yfKd2xw7i6LkSWLuv6dLCKrCEuU48OpynUjtjGBX7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U17Mb7MS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U17Mb7MS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761545004; x=1793081004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qi0iZNQ6ivOk7FBkfkXN68AWtjp/RbOvnCdKy6Kge4g=;
  b=U17Mb7MSsPl21qsBwS5gve/yzGvQLsnteNLszLd1EUMcdcLliMGsbjVA
   Lvhz70kyaG8o2GJfAEuPhd9/31ac+bGNAaYCeRSjAD05UWgVpwFOlzTIQ
   7pGoaRt9hugQ18YtolWjZ+gXpq6AmdrNaD1hsuoORdsr41vdJyb8OxKrV
   XvOg1K9AppMdKXegwJEsxA69yxAwq2j3SK8NmgJzvdwTy3SguTtxqK6gl
   lmTceP1Kwnq0m1egGljQvkMxP5ZcZ50ZvX9KxwJcWTI1ZIoOcN7fG+zm+
   Fg46A08PCWhIl+taQ5K6u3yMIfFtSWITVFOynBWznKQ3fNrcH9cvjVzNc
   A==;
X-CSE-ConnectionGUID: 8GTrj0HVQUua3veP1x6AWg==
X-CSE-MsgGUID: owOEHkykQnWcJ1rrfGeG+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73906185"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="73906185"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:03:22 -0700
X-CSE-ConnectionGUID: JmPFh2QbROKmZ0N8hfBzmQ==
X-CSE-MsgGUID: CA6dEFtxSWaxZHdAbhGgsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185712340"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Oct 2025 23:03:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDGK6-000GYD-2r;
	Mon, 27 Oct 2025 06:03:18 +0000
Date: Mon, 27 Oct 2025 14:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3042/3042]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:743: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202510271326.G0BQX79z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9094437bec1ace7378abfe84597e722209d03f85
commit: 468b0cd7b1e1c131b3ee7d2ea8b96521d3faad8b [3042/3042] net:nebula-matrix:Add S1000 SNIC driver support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251027/202510271326.G0BQX79z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271326.G0BQX79z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271326.G0BQX79z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_product_base.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h:12:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:797:18: warning: variable 'pdev' set but not used [-Wunused-but-set-variable]
     797 |         struct pci_dev *pdev;
         |                         ^
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:4550:14: warning: attribute declaration must precede definition [-Wignored-attributes]
    4550 | static union __maybe_unused epro_aft_u aft_def[NBL_FWD_TYPE_MAX] = {
         |              ^
   include/linux/compiler_attributes.h:356:56: note: expanded from macro '__maybe_unused'
     356 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/base/nbl_ppe_epro.h:590:7: note: previous definition is here
     590 | union epro_aft_u {
         |       ^
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_product_base.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h:10:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:294:
   include/linux/fortify-string.h:606:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     606 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   8 warnings generated.
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_product_base.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h:12:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:156:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     156 |         default:
         |         ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:156:2: note: insert 'break;' to avoid fall-through
     156 |         default:
         |         ^
         |         break; 
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:1823:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1823 |         int ret = 0;
         |             ^
   7 warnings generated.
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:10:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:1378:26: warning: variable 'vector' set but not used [-Wunused-but-set-variable]
    1378 |         struct nbl_serv_vector *vector;
         |                                 ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:3025:28: warning: variable 'ring_mgt' set but not used [-Wunused-but-set-variable]
    3025 |         struct nbl_serv_ring_mgt *ring_mgt;
         |                                   ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:4002:22: warning: variable 'adapter' set but not used [-Wunused-but-set-variable]
    4002 |         struct nbl_adapter *adapter;
         |                             ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:4552:36: warning: variable 'net_resource_mgt' set but not used [-Wunused-but-set-variable]
    4552 |         struct nbl_serv_net_resource_mgt *net_resource_mgt;
         |                                           ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5726:15: warning: variable 'name' set but not used [-Wunused-but-set-variable]
    5726 |         u8 *strtab, *name, *product_code = NULL;
         |                      ^
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5730:6: warning: variable 'p4_size' set but not used [-Wunused-but-set-variable]
    5730 |         u32 p4_size = 0;
         |             ^
   11 warnings generated.
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ipsec.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ipsec.h:13:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ipsec.c:70:29: warning: result of comparison of constant 256 with expression of type 'u8' (aka 'unsigned char') is always true [-Wtautological-constant-out-of-range-compare]
      70 |             x->props.replay_window != NBL_IPSEC_WINDOW_256) {
         |             ~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc.c:1265: warning: Cannot understand  * @brief: handle action parse by type
    on line 1265 - I thought it was a doc line
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc.c:1290: warning: Cannot understand  * @brief: handle action parse
    on line 1290 - I thought it was a doc line
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:743: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * check dma conflict when multi devices in one iommu group, That is, when ACS not support.


vim +743 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c

   741	
   742	/**
 > 743	 * check dma conflict when multi devices in one iommu group, That is, when ACS not support.
   744	 * return -1 means multi devices conflict.
   745	 * return 1 means mapping exist and not conflict.
   746	 * return 0 means mapping not existed.
   747	 */
   748	static int nbl_userdev_check_dma_conflict(struct nbl_dev_user *user,
   749						  unsigned long vaddr, dma_addr_t iova, size_t size)
   750	{
   751		struct nbl_dev_user_iommu_group *group = user->group;
   752		struct nbl_userdev_dma *dma;
   753		struct rb_node *n;
   754		struct page *h_page;
   755		size_t unmapped = 0;
   756		unsigned long vfn, pfn, vaddr_new;
   757		dma_addr_t iova_new;
   758		int ret;
   759	
   760		dma = nbl_userdev_find_dma(group, vaddr, 1);
   761		if (dma && dma->vaddr != vaddr)
   762			return -1;
   763	
   764		dma = nbl_userdev_find_dma(group, vaddr + size - 1, 0);
   765		if (dma && dma->vaddr + dma->size != vaddr + size)
   766			return -1;
   767	
   768		if (!nbl_userdev_find_dma(group, vaddr, size))
   769			return 0;
   770		n = nbl_userdev_find_dma_first_node(group, vaddr, size);
   771		vaddr_new = vaddr;
   772		iova_new = iova;
   773		while (n) {
   774			dma = rb_entry(n, struct nbl_userdev_dma, node);
   775			if (dma->iova >= iova + size)
   776				break;
   777	
   778			if (dma->vaddr >= vaddr + size)
   779				break;
   780	
   781			if (dma->vaddr != vaddr_new || dma->iova != iova_new)
   782				break;
   783	
   784			vfn = vaddr_new >> PAGE_SHIFT;
   785			ret = vfio_pin_pages(NBL_USERDEV_TO_VFIO_DEV(user),
   786					     vaddr_new, 1, IOMMU_READ | IOMMU_WRITE, &h_page);
   787			if (ret <= 0)
   788				break;
   789			pfn = page_to_pfn(h_page);
   790			vfio_unpin_pages(NBL_USERDEV_TO_VFIO_DEV(user), vaddr_new, 1);
   791			if (pfn != dma->pfn)
   792				break;
   793	
   794			n = rb_next(n);
   795			unmapped += dma->size;
   796			vaddr_new += dma->size;
   797			iova_new += dma->size;
   798		}
   799	
   800		if (unmapped != size)
   801			return -1;
   802	
   803		return 1;
   804	}
   805	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
