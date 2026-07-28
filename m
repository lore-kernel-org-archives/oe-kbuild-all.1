Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B323AA4EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 09:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229559; cv=none; b=JclisurubJAZc266XjGGvJSwlbWPDC9eFvWAD09uldN3FgBfmA6xZtvxrRPM4X8ibO+5DUMq+a1VNaLzqTX3/e0XGlLPrTxQtlOvTZKEqLb2w2AH9hYatA4/YcJNQfsOJJGIC+u3lsuKauQgIeW9QczsU/eMc/jYqzGz5n/B5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229559; c=relaxed/simple;
	bh=IV0MhVPmec0gzN+9Xh5d52kEWZNpv4fT7wOlAWIWBCw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hmsvJq9Bwtfl/84xw/5POKA4fUvZWKwlop8ESUDJz8cY7mOeWQNUOs8KKF7Ve+Zvogm7+ktVJuvCinXyG+9VRXkMPSdsh8APhsoqSV9jMaenGffR09dS0DAxJUQOBxV9FBoxoabKbZSpLbXzW97T8E8URovAk35QhY+DKEiZOxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSGFQ6x7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSGFQ6x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785229558; x=1816765558;
  h=date:from:to:cc:subject:message-id;
  bh=IV0MhVPmec0gzN+9Xh5d52kEWZNpv4fT7wOlAWIWBCw=;
  b=aSGFQ6x7I6PaKllufiVrE3pCsTVjjhe6LQo7YAoGcWiyi0h+Em1CXAXy
   2OEfE5v1GVCPfQoJfy/Xw+snvvLnGP148P3Y0e4ExG6w8c6ii5llhx4Yl
   Zr1/tm3L+x2L0Ty7IHjjCG0UFDd0X8r2RzC3h1f19yTQBnRTl7T6u8HYk
   EKzk/Yw7Lsfrx7XKHfkCCGxvw6BGhThC4yN+2GJsw3xx5yFgqeu+POQgH
   5V4xhVzQJJ5XEdNLWWZrEh7J4VEFW1MCqOgsMUE9QBviYvrQeJAVpYrxS
   7fYARgRkYTKuK5LSrVaCWLXRsANQ19qsRwkO0+n4Akt6j3gTrm88Xc6FQ
   w==;
X-CSE-ConnectionGUID: C2FhLXzYTrmuQVnEU2ngZA==
X-CSE-MsgGUID: g8fTaLMiTPm/1Wqv8iQIBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96467847"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="96467847"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 02:05:57 -0700
X-CSE-ConnectionGUID: v56RkhFcTVmIcq9faMC/qw==
X-CSE-MsgGUID: TUK9Bj9zTfiIDmPviIta7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="261623431"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jul 2026 02:05:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wodl3-00000000eAZ-1k1Q;
	Tue, 28 Jul 2026 09:05:53 +0000
Date: Tue, 28 Jul 2026 17:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 35/35]
 drivers/cma/mm/mem_phys_layout.c:86:25: warning: cast from pointer to integer
 of different size
Message-ID: <202607281727.49iqY734-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Juan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   d0ed0375a65ca817f907805e163e103822348f02
commit: 2a9a81f53ac75526c6b30e27ee151e978b0830c4 [35/35] ANDROID: mm: Use vmemmap to get the address of the first page
config: i386-randconfig-005-20260728 (https://download.01.org/0day-ci/archive/20260728/202607281727.49iqY734-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281727.49iqY734-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281727.49iqY734-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:86,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/linux/memblock.h:13,
                    from drivers/cma/mm/mem_phys_layout.c:14:
   drivers/cma/mm/mem_phys_layout.c: In function 'print_pfn_start_address':
>> drivers/cma/mm/mem_phys_layout.c:86:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      86 |                         (unsigned long long)first_page);
         |                         ^
   include/linux/printk.h:422:33: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:523:9: note: in expansion of macro 'printk'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:85:9: note: in expansion of macro 'pr_info'
      85 |         pr_info("First struct page starts at: pfn_to_page(0) [mem %#010Lx]\n",
         |         ^~~~~~~


vim +86 drivers/cma/mm/mem_phys_layout.c

    12	
    13	#include <linux/init.h>
  > 14	#include <linux/memblock.h>
    15	#include <linux/module.h>
    16	#include <linux/nodemask.h>
    17	#include <linux/pfn.h>
    18	#include <linux/printk.h>
    19	#include <linux/types.h>
    20	
    21	/*
    22	 * Print the start and end of the RAM as well as the size.
    23	 *
    24	 * This information is found in the device tree.
    25	 *
    26	 *   memory@40000000 {
    27	 *       reg = <0x00 0x40000000 0x02 0x00>;
    28	 *       device_type = "memory";
    29	 *   };
    30	 */
    31	static void print_ram_info(void)
    32	{
    33		phys_addr_t start_addr = memblock_start_of_DRAM();
    34		phys_addr_t end_addr = memblock_end_of_DRAM();
    35		phys_addr_t mem_size = memblock_phys_mem_size();
    36		// What does the reserved memory includes.
    37		phys_addr_t reserved_size = memblock_reserved_size();
    38	
    39		pr_info("    start_addr:    %10llu == %#010Lx", (u64)start_addr, (u64)start_addr);
    40		pr_info("    end_addr:      %10llu == %#010Lx", (u64)end_addr, (u64)end_addr);
    41		pr_info("    mem_size:      %10llu == %#010Lx", (u64)mem_size, (u64)mem_size);
    42		pr_info("    reserved_size: %10llu == %#010Lx", (u64)reserved_size, (u64)reserved_size);
    43	}
    44	
    45	// Prints the node information in:
    46	//
    47	//     struct pglist_data *node_data;
    48	//
    49	// It uses NODE_DATA to access node_data.
    50	//
    51	//     #define NODE_DATA(nid)		(node_data[(nid)])
    52	static void print_node_data(void)
    53	{
    54		// Note: NUMA nodes are configured in the device tree.
    55		int nodeId;
    56		unsigned long phys_pages = get_num_physpages();
    57	
    58		for_each_online_node(nodeId) {
    59			// Number of Physical pages including holes in the node.
    60			uint64_t num_spanned_pages = NODE_DATA(nodeId)->node_spanned_pages;
    61			// Number of Physical pages in the node.
    62			uint64_t num_present_pages = NODE_DATA(nodeId)->node_present_pages;
    63			uint64_t start_pfn = NODE_DATA(nodeId)->node_start_pfn;
    64			uint64_t end_pfn = NODE_DATA(nodeId)->node_start_pfn + num_spanned_pages;
    65	
    66			pr_info("Node %d", nodeId);
    67			pr_info("    Page frames numbers (range): [pfn %#010Lx-%#010Lx)\n",
    68					start_pfn, end_pfn);
    69			pr_info("    Number of Page Spanned pages (includes holes): %#010Lx : %llu\n",
    70					num_spanned_pages, num_spanned_pages);
    71			pr_info("    Number of Page Present pages:                  %#010Lx : %llu",
    72					num_present_pages, num_present_pages);
    73			pr_info("    Number of Page frames (end_pfn - start_pfn):   %#010Lx : %llu",
    74					end_pfn - start_pfn, end_pfn - start_pfn);
    75		}
    76	
    77		pr_info("Total number of Physical Pages in all nodes (DO NOT include holes) %lu",
    78				phys_pages);
    79	}
    80	
    81	static void print_pfn_start_address(void)
    82	{
    83		struct page *first_page = pfn_to_page(0);
    84	
    85		pr_info("First struct page starts at: pfn_to_page(0) [mem %#010Lx]\n",
  > 86				(unsigned long long)first_page);
    87	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
