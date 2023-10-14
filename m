Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C9134D3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9yopCIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697298431; x=1728834431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ow0mZDwu9JKzWKzNSEWkNF95FuRtKsfThNQu6kcrmV8=;
  b=k9yopCIcYhvldKucZbswZP+JwtTdbc4GgIWqTTmmv/Zoaeb2yGYhWTgh
   8Iwegn5LdSqI8g+8h91xzevLrJNpzYcbWJdXN0ApFmdRMHpfglw6p0ll7
   I5cTiK5/fav6fDLC065IzvpsEqCy/UhHWCEsIXU5eBwNMA5/wwEgVMDoC
   D9DsHFvhtT8ltv9eY5Nq2wMtZPbeoWkou9UwPwWeA2DgvZ8+AE8HhO2tl
   QhjznuImFTQK5b04wfniV8oJCdzEbR5lE5/L3E4r/M3GXXeG/uyeMeWZv
   UuKqq1jzLVpwJ7h/kkWAa/x2R5glDDlu41MEM4xbenKJcT/aErYt2nQt8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449521965"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="449521965"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 08:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1086504488"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1086504488"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2023 08:47:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrgqy-0006KH-1C;
	Sat, 14 Oct 2023 15:47:00 +0000
Date: Sat, 14 Oct 2023 23:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2462/30000]
 arch/m68k/include/asm/raw_io.h:83:14: error: variable '__w' set but not used
Message-ID: <202310142320.40oaQwFr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: d30d0c1e963944b56c0b21744b1996039fa4eb8c [2462/30000] config: add SDK QBMan driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310142320.40oaQwFr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142320.40oaQwFr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142320.40oaQwFr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from drivers/staging/fsl_qbman/dpa_sys.h:37,
                    from drivers/staging/fsl_qbman/dpa_alloc.c:32:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
>> arch/m68k/include/asm/raw_io.h:83:14: error: variable '__w' set but not used [-Werror=unused-but-set-variable]
      83 |         ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |              ^~~
   arch/m68k/include/asm/raw_io.h:430:17: note: in expansion of macro 'rom_out_8'
     430 |                 rom_out_8(port, *buf++);
         |                 ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:15: error: variable '__w' set but not used [-Werror=unused-but-set-variable]
      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:448:17: note: in expansion of macro 'rom_out_be16'
     448 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: error: variable '__w' set but not used [-Werror=unused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:466:17: note: in expansion of macro 'rom_out_le16'
     466 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from drivers/staging/fsl_qbman/dpa_sys.h:35:
   include/linux/scatterlist.h: In function 'sg_set_buf':
>> arch/m68k/include/asm/page_mm.h:169:50: error: ordered comparison of pointer with null pointer [-Werror=extra]
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
                    from include/linux/io.h:11:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
>> arch/m68k/include/asm/page_mm.h:169:50: error: ordered comparison of pointer with null pointer [-Werror=extra]
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
   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66:
   include/linux/fsl_qman.h: At top level:
   include/linux/fsl_qman.h:415:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1679:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   cc1: all warnings being treated as errors
--
   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from drivers/staging/fsl_qbman/dpa_sys.h:37,
                    from drivers/staging/fsl_qbman/bman_private.h:32,
                    from drivers/staging/fsl_qbman/bman_config.c:33:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
>> arch/m68k/include/asm/raw_io.h:83:14: error: variable '__w' set but not used [-Werror=unused-but-set-variable]
      83 |         ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |              ^~~
   arch/m68k/include/asm/raw_io.h:430:17: note: in expansion of macro 'rom_out_8'
     430 |                 rom_out_8(port, *buf++);
         |                 ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:15: error: variable '__w' set but not used [-Werror=unused-but-set-variable]
      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:448:17: note: in expansion of macro 'rom_out_be16'
     448 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: error: variable '__w' set but not used [-Werror=unused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:466:17: note: in expansion of macro 'rom_out_le16'
     466 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:5,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from arch/m68k/include/asm/cacheflush_mm.h:5,
                    from arch/m68k/include/asm/cacheflush.h:5,
                    from drivers/staging/fsl_qbman/bman_config.c:32:
   include/linux/scatterlist.h: In function 'sg_set_buf':
>> arch/m68k/include/asm/page_mm.h:169:50: error: ordered comparison of pointer with null pointer [-Werror=extra]
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
   include/linux/dma-mapping.h: In function 'dma_map_resource':
>> arch/m68k/include/asm/page_mm.h:169:50: error: ordered comparison of pointer with null pointer [-Werror=extra]
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
   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66:
   include/linux/fsl_qman.h: At top level:
   include/linux/fsl_qman.h:415:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1679:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   drivers/staging/fsl_qbman/bman_config.c:340:12: error: no previous prototype for 'bman_init_early' [-Werror=missing-prototypes]
     340 | __init int bman_init_early(void)
         |            ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from drivers/staging/fsl_qbman/dpa_sys.h:37,
                    from drivers/staging/fsl_qbman/bman_private.h:32,
                    from drivers/staging/fsl_qbman/bman_low.h:32,
                    from drivers/staging/fsl_qbman/bman_high.c:32:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
>> arch/m68k/include/asm/raw_io.h:83:14: error: variable '__w' set but not used [-Werror=unused-but-set-variable]
      83 |         ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |              ^~~
   arch/m68k/include/asm/raw_io.h:430:17: note: in expansion of macro 'rom_out_8'
     430 |                 rom_out_8(port, *buf++);
         |                 ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:15: error: variable '__w' set but not used [-Werror=unused-but-set-variable]
      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:448:17: note: in expansion of macro 'rom_out_be16'
     448 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: error: variable '__w' set but not used [-Werror=unused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:466:17: note: in expansion of macro 'rom_out_le16'
     466 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from drivers/staging/fsl_qbman/dpa_sys.h:35:
   include/linux/scatterlist.h: In function 'sg_set_buf':
>> arch/m68k/include/asm/page_mm.h:169:50: error: ordered comparison of pointer with null pointer [-Werror=extra]
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
                    from include/linux/io.h:11:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
>> arch/m68k/include/asm/page_mm.h:169:50: error: ordered comparison of pointer with null pointer [-Werror=extra]
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
   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66:
   include/linux/fsl_qman.h: At top level:
   include/linux/fsl_qman.h:415:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1679:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   drivers/staging/fsl_qbman/bman_low.h: In function 'bm_rcr_init':
   drivers/staging/fsl_qbman/bman_low.h:223:44: error: 'BM_CL_RCR' undeclared (first use in this function)
     223 |         rcr->ring = portal->addr.addr_ce + BM_CL_RCR;
         |                                            ^~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:223:44: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:528,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12:
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_CI_CINH' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__be32_to_cpu'
      40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
         |                                                   ^
   arch/m68k/include/asm/raw_io.h:41:21: note: in expansion of macro 'in_be32'
      41 | #define __raw_readl in_be32
         |                     ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:224:19: note: in expansion of macro 'bm_in'
     224 |         rcr->ci = bm_in(RCR_CI_CINH) & (BM_RCR_SIZE - 1);
         |                   ^~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_PI_CINH' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__be32_to_cpu'
      40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
         |                                                   ^
   arch/m68k/include/asm/raw_io.h:41:21: note: in expansion of macro 'in_be32'
      41 | #define __raw_readl in_be32
         |                     ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:226:14: note: in expansion of macro 'bm_in'
     226 |         pi = bm_in(RCR_PI_CINH) & (BM_RCR_SIZE - 1);
         |              ^~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_ITR' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__be32_to_cpu'
      40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
         |                                                   ^
   arch/m68k/include/asm/raw_io.h:41:21: note: in expansion of macro 'in_be32'
      41 | #define __raw_readl in_be32
         |                     ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:231:24: note: in expansion of macro 'bm_in'
     231 |         rcr->ithresh = bm_in(RCR_ITR);
         |                        ^~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_CFG' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__be32_to_cpu'
      40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
         |                                                   ^
   arch/m68k/include/asm/raw_io.h:41:21: note: in expansion of macro 'in_be32'
      41 | #define __raw_readl in_be32
         |                     ^~~~~~~
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +/__w +83 arch/m68k/include/asm/raw_io.h

^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds  2005-04-16  49  
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  50  /*
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  51   * Atari ROM port (cartridge port) ISA adapter, used for the EtherNEC NE2000
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  52   * network card driver.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  53   * The ISA adapter connects address lines A9-A13 to ISA address lines A0-A4,
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  54   * and hardwires the rest of the ISA addresses for a base address of 0x300.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  55   *
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  56   * Data lines D8-D15 are connected to ISA data lines D0-D7 for reading.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  57   * For writes, address lines A1-A8 are latched to ISA data lines D0-D7
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  58   * (meaning the bit pattern on A1-A8 can be read back as byte).
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  59   *
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  60   * Read and write operations are distinguished by the base address used:
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  61   * reads are from the ROM A side range, writes are through the B side range
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  62   * addresses (A side base + 0x10000).
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  63   *
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  64   * Reads and writes are byte only.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  65   *
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  66   * 16 bit reads and writes are necessary for the NetUSBee adapter's USB
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  67   * chipset - 16 bit words are read straight off the ROM port while 16 bit
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  68   * reads are split into two byte writes. The low byte is latched to the
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  69   * NetUSBee buffer by a read from the _read_ window (with the data pattern
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  70   * asserted as A1-A8 address pattern). The high byte is then written to the
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  71   * write range as usual, completing the write cycle.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  72   */
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  73  
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  74  #if defined(CONFIG_ATARI_ROM_ISA)
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  75  #define rom_in_8(addr) \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  76  	({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  77  #define rom_in_be16(addr) \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  78  	({ u16 __v = (*(__force volatile u16 *) (addr)); __v; })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  79  #define rom_in_le16(addr) \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  80  	({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v; })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  81  
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  82  #define rom_out_8(addr, b)	\
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06 @83  	({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  84  	__w = ((*(__force volatile u8 *)  ((_addr | 0x10000) + (__v<<1)))); })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  85  #define rom_out_be16(addr, w)	\
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  86  	({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  87  	__w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  88  	__w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v >> 8)<<1)))); })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  89  #define rom_out_le16(addr, w)	\
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  90  	({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  91  	__w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v >> 8)<<1)))); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  92  	__w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v & 0xFF)<<1)))); })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz 2013-04-06  93  

:::::: The code at line 83 was first introduced by commit
:::::: 84b16b7b0d5c818fadc731a69965dc76dce0c91e m68k/atari: ROM port ISA adapter support

:::::: TO: Michael Schmitz <schmitz@opal.biophys.uni-duesseldorf.de>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
