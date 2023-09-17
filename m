Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665ED6FA7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Sep 2023 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694978320; x=1726514320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o93xT3dtXgGYWU63IgnvkM9OU1+vfetirJKYhrj4Yoo=;
  b=j/bj9HgR5ebcKEFLDaTagLD1xPQwVbilhQl9SXAAVGGM+5mljO5Awz5i
   EFVIgE3P1Nh04Ni8oFgDE6LynOk5mQI8b4gDerPurYd122wUe1zRg8Ijy
   G8PU9KquGHLx+iPnXpZ/Cjggkyb/H+YQIWMzezMM2/JwUMQjI9mtfElMk
   94KPF7QvXe8cm8Qj5Rp+Air1uf0S4W1L20cyo57NskBdXiGTzXfaAtfQf
   bSOlLLu91PQHkoTfBF5a4+Zf2oZvuLTbULtweT4AutFW9SsFzo52Ngt/b
   3eJoh0iGsHJjS8cwF2sHqsnHAa8lhvVGgakYXCwW/BVS4IBCj/g7PgNkI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="465871236"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="465871236"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 12:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="748789002"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="748789002"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 17 Sep 2023 12:18:38 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhxHw-0005Pc-0M;
	Sun, 17 Sep 2023 19:18:36 +0000
Date: Mon, 18 Sep 2023 03:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 309/317]
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:2204:34: error:
 'NAND_ACC_CONTROL_ECC_SHIFT' undeclared; did you mean
 'ACC_CONTROL_ECC_SHIFT'?
Message-ID: <202309180354.j4EEOTur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   d78991f12a9a2194be28cafa8a21ab00191ec95e
commit: b0b21e2384267dba3b90eea9581d65b4d9b46a29 [309/317] mtd: rawnand: brcmnand: Fix ECC level field setting for v7.2 controller
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230918/202309180354.j4EEOTur-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309180354.j4EEOTur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309180354.j4EEOTur-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:11,
                    from drivers/mtd/nand/raw/brcmnand/brcmnand.c:17:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
   arch/m68k/include/asm/raw_io.h:83:14: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      83 |         ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |              ^~~
   arch/m68k/include/asm/raw_io.h:430:17: note: in expansion of macro 'rom_out_8'
     430 |                 rom_out_8(port, *buf++);
         |                 ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:448:17: note: in expansion of macro 'rom_out_be16'
     448 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:466:17: note: in expansion of macro 'rom_out_le16'
     466 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/linux/clk.h:12,
                    from drivers/mtd/nand/raw/brcmnand/brcmnand.c:6:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mutex.h:18,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/asm-generic/bug.h:139:34: note: in definition of macro 'WARN_ON_ONCE'
     139 |         int __ret_warn_once = !!(condition);                    \
         |                                  ^~~~~~~~~
   arch/m68k/include/asm/page_mm.h:170:33: note: in expansion of macro 'virt_addr_valid'
     170 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         |                                 ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:355:26: note: in expansion of macro 'pfn_valid'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |                          ^~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c: In function 'brcmnand_set_cfg':
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2204:34: error: 'NAND_ACC_CONTROL_ECC_SHIFT' undeclared (first use in this function); did you mean 'ACC_CONTROL_ECC_SHIFT'?
    2204 |         tmp |= cfg->ecc_level << NAND_ACC_CONTROL_ECC_SHIFT;
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  ACC_CONTROL_ECC_SHIFT
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2204:34: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +2204 drivers/mtd/nand/raw/brcmnand/brcmnand.c

27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2114  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2115  /***********************************************************************
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2116   * Per-CS setup (1 NAND device)
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2117   ***********************************************************************/
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2118  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2119  static int brcmnand_set_cfg(struct brcmnand_host *host,
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2120  			    struct brcmnand_cfg *cfg)
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2121  {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2122  	struct brcmnand_controller *ctrl = host->ctrl;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2123  	struct nand_chip *chip = &host->chip;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2124  	u16 cfg_offs = brcmnand_cs_offset(ctrl, host->cs, BRCMNAND_CS_CFG);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2125  	u16 cfg_ext_offs = brcmnand_cs_offset(ctrl, host->cs,
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2126  			BRCMNAND_CS_CFG_EXT);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2127  	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2128  			BRCMNAND_CS_ACC_CONTROL);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2129  	u8 block_size = 0, page_size = 0, device_size = 0;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2130  	u32 tmp;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2131  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2132  	if (ctrl->block_sizes) {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2133  		int i, found;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2134  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2135  		for (i = 0, found = 0; ctrl->block_sizes[i]; i++)
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2136  			if (ctrl->block_sizes[i] * 1024 == cfg->block_size) {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2137  				block_size = i;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2138  				found = 1;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2139  			}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2140  		if (!found) {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2141  			dev_warn(ctrl->dev, "invalid block size %u\n",
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2142  					cfg->block_size);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2143  			return -EINVAL;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2144  		}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2145  	} else {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2146  		block_size = ffs(cfg->block_size) - ffs(BRCMNAND_MIN_BLOCKSIZE);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2147  	}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2148  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2149  	if (cfg->block_size < BRCMNAND_MIN_BLOCKSIZE || (ctrl->max_block_size &&
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2150  				cfg->block_size > ctrl->max_block_size)) {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2151  		dev_warn(ctrl->dev, "invalid block size %u\n",
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2152  				cfg->block_size);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2153  		block_size = 0;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2154  	}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2155  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2156  	if (ctrl->page_sizes) {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2157  		int i, found;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2158  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2159  		for (i = 0, found = 0; ctrl->page_sizes[i]; i++)
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2160  			if (ctrl->page_sizes[i] == cfg->page_size) {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2161  				page_size = i;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2162  				found = 1;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2163  			}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2164  		if (!found) {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2165  			dev_warn(ctrl->dev, "invalid page size %u\n",
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2166  					cfg->page_size);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2167  			return -EINVAL;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2168  		}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2169  	} else {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2170  		page_size = ffs(cfg->page_size) - ffs(BRCMNAND_MIN_PAGESIZE);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2171  	}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2172  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2173  	if (cfg->page_size < BRCMNAND_MIN_PAGESIZE || (ctrl->max_page_size &&
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2174  				cfg->page_size > ctrl->max_page_size)) {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2175  		dev_warn(ctrl->dev, "invalid page size %u\n", cfg->page_size);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2176  		return -EINVAL;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2177  	}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2178  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2179  	if (fls64(cfg->device_size) < fls64(BRCMNAND_MIN_DEVSIZE)) {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2180  		dev_warn(ctrl->dev, "invalid device size 0x%llx\n",
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2181  			(unsigned long long)cfg->device_size);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2182  		return -EINVAL;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2183  	}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2184  	device_size = fls64(cfg->device_size) - fls64(BRCMNAND_MIN_DEVSIZE);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2185  
3f06d2a912b55c drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-10-30  2186  	tmp = (cfg->blk_adr_bytes << CFG_BLK_ADR_BYTES_SHIFT) |
3f06d2a912b55c drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-10-30  2187  		(cfg->col_adr_bytes << CFG_COL_ADR_BYTES_SHIFT) |
3f06d2a912b55c drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-10-30  2188  		(cfg->ful_adr_bytes << CFG_FUL_ADR_BYTES_SHIFT) |
3f06d2a912b55c drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-10-30  2189  		(!!(cfg->device_width == 16) << CFG_BUS_WIDTH_SHIFT) |
3f06d2a912b55c drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-10-30  2190  		(device_size << CFG_DEVICE_SIZE_SHIFT);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2191  	if (cfg_offs == cfg_ext_offs) {
3f06d2a912b55c drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-10-30  2192  		tmp |= (page_size << CFG_PAGE_SIZE_SHIFT) |
3f06d2a912b55c drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-10-30  2193  		       (block_size << CFG_BLK_SIZE_SHIFT);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2194  		nand_writereg(ctrl, cfg_offs, tmp);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2195  	} else {
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2196  		nand_writereg(ctrl, cfg_offs, tmp);
3f06d2a912b55c drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-10-30  2197  		tmp = (page_size << CFG_EXT_PAGE_SIZE_SHIFT) |
3f06d2a912b55c drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-10-30  2198  		      (block_size << CFG_EXT_BLK_SIZE_SHIFT);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2199  		nand_writereg(ctrl, cfg_ext_offs, tmp);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2200  	}
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2201  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2202  	tmp = nand_readreg(ctrl, acc_control_offs);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2203  	tmp &= ~brcmnand_ecc_level_mask(ctrl);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06 @2204  	tmp |= cfg->ecc_level << NAND_ACC_CONTROL_ECC_SHIFT;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2205  	tmp &= ~brcmnand_spare_area_mask(ctrl);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2206  	tmp |= cfg->spare_area_size;
b0b21e2384267d drivers/mtd/nand/raw/brcmnand/brcmnand.c William Zhang 2023-07-06  2207  	tmp |= cfg->ecc_level << ctrl->ecc_level_shift;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2208  	nand_writereg(ctrl, acc_control_offs, tmp);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2209  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2210  	brcmnand_set_sector_size_1k(host, cfg->sector_size_1k);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2211  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2212  	/* threshold = ceil(BCH-level * 0.75) */
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2213  	brcmnand_wr_corr_thresh(host, DIV_ROUND_UP(chip->ecc.strength * 3, 4));
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2214  
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2215  	return 0;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2216  }
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris  2015-03-06  2217  

:::::: The code at line 2204 was first introduced by commit
:::::: 27c5b17cd1b10564fa36f8f51e4b4b41436ecc32 mtd: nand: add NAND driver "library" for Broadcom STB NAND controller

:::::: TO: Brian Norris <computersforpeace@gmail.com>
:::::: CC: Brian Norris <computersforpeace@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
