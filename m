Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEAB1E4B2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714770603; cv=none; b=uy5FYOoG2Xh14Ogsq70LLk6q8tA865oldmZjQbbGrjfYgzylsHYaVqwA1/Qk94xw9zyerwfhDBBSpfzYSgChLS/7SkndmMer/xG099gTqr8sx81k7965t3FE0JGB0cWlbAQeRvXLXecRVHlXMHBEpwsUVfuW1sLxgaEKOUvsaeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714770603; c=relaxed/simple;
	bh=9JTwS5NSyXEOQ/Gco2Axti2cbbZMzk7de+T7ROviKCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNEARCCuiMJ6GR5woZgqEP1BbejhlYNXkLdyGK9HXVIPbTR/4SoJf/obGBbkG/jSP0Ep3HCMPo6HCNoK2qscq85HDsCrcdG/OSu7dNHbPSllIx9O0WvZvjridbdFOI5XWRrVNRKL+oqXTn67oQX8/N+ULaQYwLBSHHOsA9SfznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHJkEzrP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHJkEzrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714770602; x=1746306602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9JTwS5NSyXEOQ/Gco2Axti2cbbZMzk7de+T7ROviKCs=;
  b=lHJkEzrP6DViIpkXtfMBt6rn/OS1LFf2HvYhh+ApoMM5XakJwiNBRWrN
   jx+EVVBXJGCyVdbVC959MEiNY5Vxm9Sj/s6g8MobH4kZvRsKf8W911hzk
   j7YjdG3x+2snPmjYSbg6Sl1EJdYv5bai22eKoEomvd93Rw6++ti+ybQvD
   t64vQPEfKxrMZRLT6CC7+lqzb86m/fWcUlsel4Djf3w1wA0qOQxibE9Ol
   o0nqsM0cMWpocQ5/jA+dlMdX0X9yA0tPpZfQMpyA9JmN1lp0eiBAtmeHm
   o1pqbLe2GM35chjz8iy0XpN6i1/5PEOyXhMRn6F2gtC6b4MUS1zKt/qEy
   g==;
X-CSE-ConnectionGUID: Jy2Ve9qxTGSQgzu/T3iBnA==
X-CSE-MsgGUID: IM3ehbQ6TzWiz1PimXhChw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21147281"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21147281"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 14:10:01 -0700
X-CSE-ConnectionGUID: eE+Au000QSiy5kiL26CcYg==
X-CSE-MsgGUID: OybJQRWfQK6+MAdWlgtbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="58761626"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 May 2024 14:09:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s30AG-000C6e-2A;
	Fri, 03 May 2024 21:09:56 +0000
Date: Sat, 4 May 2024 05:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1024/1143]
 drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:133:13: warning: shift
 count >= width of type
Message-ID: <202405040518.nI570KYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: cbd62701a0dc62129ef2fa57a6cd6b736cf54aed [1024/1143] drivers: hw_random: add DWC NIST TRNG driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405040518.nI570KYM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040518.nI570KYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040518.nI570KYM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:48:
   In file included from drivers/char/hw_random/dwc/src/trng/include/nisttrng.h:51:
   In file included from drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h:59:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:48:
   In file included from drivers/char/hw_random/dwc/src/trng/include/nisttrng.h:51:
   In file included from drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h:59:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:48:
   In file included from drivers/char/hw_random/dwc/src/trng/include/nisttrng.h:51:
   In file included from drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h:59:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:48:
   In file included from drivers/char/hw_random/dwc/src/trng/include/nisttrng.h:51:
   In file included from drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h:59:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:133:13: warning: shift count >= width of type [-Wshift-count-overflow]
     133 |                                                NIST_DFLT_MAX_REQ_PER_SEED);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/dwc/src/trng/include/nisttrng_common.h:23:36: note: expanded from macro 'NIST_DFLT_MAX_REQ_PER_SEED'
      23 | #define NIST_DFLT_MAX_REQ_PER_SEED      BIT(48)
         |                                         ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:404:54: warning: variable 'tmp' is uninitialized when used here [-Wuninitialized]
     404 |                         pdu_io_write32(state->base + NIST_TRNG_REG_ISTAT, tmp);
         |                                                                           ^~~
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:391:9: note: initialize the variable 'tmp' to silence this warning
     391 |         u32 tmp;
         |                ^
         |                 = 0
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:579:5: warning: no previous prototype for function 'nisttrng_vtrng_wait_on_busy' [-Wmissing-prototypes]
     579 | int nisttrng_vtrng_wait_on_busy(struct nist_trng_state *state, int priv, int vtrng)
         |     ^
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:579:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     579 | int nisttrng_vtrng_wait_on_busy(struct nist_trng_state *state, int priv, int vtrng)
         | ^
         | static 
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:719:5: warning: no previous prototype for function 'nisttrng_generate_private_vtrng' [-Wmissing-prototypes]
     719 | int nisttrng_generate_private_vtrng(struct nist_trng_state *state, void *random_bits,
         |     ^
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:719:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     719 | int nisttrng_generate_private_vtrng(struct nist_trng_state *state, void *random_bits,
         | ^
         | static 
   11 warnings generated.
--
   In file included from drivers/char/hw_random/dwc/src/trng/trng/nist_trng_private.c:48:
   In file included from drivers/char/hw_random/dwc/src/trng/include/nisttrng.h:51:
   In file included from drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h:59:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/char/hw_random/dwc/src/trng/trng/nist_trng_private.c:48:
   In file included from drivers/char/hw_random/dwc/src/trng/include/nisttrng.h:51:
   In file included from drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h:59:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/char/hw_random/dwc/src/trng/trng/nist_trng_private.c:48:
   In file included from drivers/char/hw_random/dwc/src/trng/include/nisttrng.h:51:
   In file included from drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h:59:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/char/hw_random/dwc/src/trng/trng/nist_trng_private.c:48:
   In file included from drivers/char/hw_random/dwc/src/trng/include/nisttrng.h:51:
   In file included from drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h:59:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng_private.c:412:11: warning: variable 'str_size' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     412 |         else if (state->status.sec_strength == SEC_STRNT_AES256)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng_private.c:415:18: note: uninitialized use occurs here
     415 |         for (i = 0; i < str_size; i++) {
         |                         ^~~~~~~~
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng_private.c:412:7: note: remove the 'if' if its condition is always true
     412 |         else if (state->status.sec_strength == SEC_STRNT_AES256)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     413 |                 str_size = 12; /* 384/32 */
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng_private.c:399:14: note: initialize the variable 'str_size' to silence this warning
     399 |         int str_size;
         |                     ^
         |                      = 0
>> drivers/char/hw_random/dwc/src/trng/trng/nist_trng_private.c:907:25: warning: shift count >= width of type [-Wshift-count-overflow]
     907 |         if (max_req_per_seed > NIST_DFLT_MAX_REQ_PER_SEED) {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/dwc/src/trng/include/nisttrng_common.h:23:36: note: expanded from macro 'NIST_DFLT_MAX_REQ_PER_SEED'
      23 | #define NIST_DFLT_MAX_REQ_PER_SEED      BIT(48)
         |                                         ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   9 warnings generated.


vim +133 drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c

    49	
    50	/* Initialize the NIST_TRNG state structure */
    51	int nisttrng_init(struct nist_trng_state *state, u32 *base)
    52	{
    53		int err;
    54		u32 tmp;
    55	
    56		DEBUG(">> %s: initialize the NIST_TRNG\n", __func__);
    57	
    58		memset(state, 0, sizeof(*state));
    59	
    60		state->base = base;
    61	
    62		/* make sure there is no alarm and the core is not busy */
    63		err = nisttrng_get_alarms(state);
    64		if (err)
    65			goto ERR;
    66	
    67		err = nisttrng_wait_on_busy(state);
    68		if (err)
    69			goto ERR;
    70	
    71		/* hardware features*/
    72		tmp = pdu_io_read32(state->base + NIST_TRNG_REG_FEATURES);
    73	
    74		state->config.features.drbg_arch = NIST_TRNG_REG_FEATURES_AES_256(tmp);
    75		state->config.features.extra_ps_present =
    76			NIST_TRNG_REG_FEATURES_EXTRA_PS_PRESENT(tmp);
    77		state->config.features.secure_rst_state =
    78			NIST_TRNG_REG_FEATURES_SECURE_RST_STATE(tmp);
    79		state->config.features.diag_level_basic_trng =
    80			NIST_TRNG_REG_FEATURES_DIAG_LEVEL_BASIC_TRNG(tmp);
    81		state->config.features.diag_level_stat_hlt =
    82			NIST_TRNG_REG_FEATURES_DIAG_LEVEL_ST_HLT(tmp);
    83		state->config.features.diag_level_ns =
    84			NIST_TRNG_REG_FEATURES_DIAG_LEVEL_NS(tmp);
    85	
    86		/* corekit */
    87		tmp = pdu_io_read32(state->base + NIST_TRNG_REG_COREKIT_REL);
    88		state->config.corekit_rel.ext_enum = NIST_TRNG_REG_EXT_ENUM(tmp);
    89		state->config.corekit_rel.ext_ver = NIST_TRNG_REG_EXT_VER(tmp);
    90		state->config.corekit_rel.rel_num = NIST_TRNG_REG_REL_NUM(tmp);
    91	
    92		/* clear registers */
    93		pdu_io_write32(state->base + NIST_TRNG_REG_ALARM, 0xFFFFFFFF);
    94		pdu_io_write32(state->base + NIST_TRNG_REG_ISTAT, 0xFFFFFFFF);
    95	
    96		/* setup the NIST_TRNG in secure mode, self seeding mode, with prediction resistance, maximum possible security strength */
    97		/* SMODE */
    98		tmp = 0;
    99		tmp = NIST_TRNG_REG_SMODE_SET_SECURE_EN(tmp, 1);
   100		tmp = NIST_TRNG_REG_SMODE_SET_NONCE(tmp, 0);
   101		tmp = NIST_TRNG_REG_SMODE_SET_MAX_REJECTS(tmp,
   102							  NIST_TRNG_DFLT_MAX_REJECTS);
   103		pdu_io_write32(state->base + NIST_TRNG_REG_SMODE, tmp);
   104		state->status.secure_mode = 1;
   105		state->status.nonce_mode = 0;
   106		/* MODE */
   107		tmp = 0;
   108		if (state->config.features.drbg_arch == AES256) {
   109			tmp = NIST_TRNG_REG_MODE_SET_SEC_ALG(tmp, 1);
   110			state->status.sec_strength = SEC_STRNT_AES256;
   111	
   112		} else if (state->config.features.drbg_arch == AES128) {
   113			tmp = NIST_TRNG_REG_MODE_SET_SEC_ALG(tmp, 0);
   114			state->status.sec_strength = SEC_STRNT_AES128;
   115	
   116		} else {
   117			SYNHW_PRINT("Invalid DRBG architecture");
   118			err = CRYPTO_FAILED;
   119			goto ERR;
   120		}
   121	
   122		tmp = NIST_TRNG_REG_MODE_SET_PRED_RESIST(tmp, 1);
   123		pdu_io_write32(state->base + NIST_TRNG_REG_MODE, 0);
   124		state->status.pred_resist = 1;
   125		/* rest of the status */
   126		state->status.alarm_code = 0;
   127		state->status.pad_ps_addin = 0;
   128	
   129		/* reminders - set the counters to the standard's maximum values. An API is be provided to change those on demand.*/
   130		nisttrng_set_reminder_max_bits_per_req(state,
   131						       NIST_DFLT_MAX_BITS_PER_REQ);
   132		nisttrng_set_reminder_max_req_per_seed(state,
 > 133						       NIST_DFLT_MAX_REQ_PER_SEED);
   134	
   135		/* display features */
   136		SYNHW_PRINT("NIST_TRNG: Hardware rel_num=0x%x, ext_ver=0x%x, ext_enum=0x%x\n",
   137			    state->config.corekit_rel.rel_num,
   138			    state->config.corekit_rel.ext_ver,
   139			    state->config.corekit_rel.ext_enum);
   140		switch (state->config.features.drbg_arch) {
   141		case AES128:
   142			DEBUG("NIST_TRNG: DRBG Architecture=128-bit AES, Extra Personalization Existence=%u\n",
   143			      state->config.features.extra_ps_present);
   144			break;
   145		case AES256:
   146			DEBUG("NIST_TRNG: DRBG Architecture=256-bit AES, Extra Personalization Existence=%u\n",
   147			      state->config.features.extra_ps_present);
   148			break;
   149		default:
   150			SYNHW_PRINT("Invalid DRBG architecture");
   151			err = CRYPTO_FAILED;
   152			goto ERR;
   153		}
   154	
   155		DEBUG("initialization is done, going for a zeroize\n");
   156	
   157		// BUILD_CFG0
   158		tmp = pdu_io_read32(state->base + NIST_TRNG_REG_BUILD_CFG0);
   159		state->config.build_cfg0.core_type = NIST_TRNG_REG_CFG0_CORE_TYPE(tmp);
   160		state->config.build_cfg0.bg8 = NIST_TRNG_REG_CFG0_BG8(tmp);
   161		state->config.build_cfg0.cdc_synch_depth =
   162			NIST_TRNG_REG_CFG0_CDC_SYNCH_DEPTH(tmp);
   163		state->config.build_cfg0.background_noise =
   164			NIST_TRNG_REG_CFG0_BACGROUND_NOISE(tmp);
   165		state->config.build_cfg0.edu_present =
   166			NIST_TRNG_REG_CFG0_EDU_PRESENT(tmp);
   167		state->config.build_cfg0.aes_datapath =
   168			NIST_TRNG_REG_CFG0_AES_DATAPATH(tmp);
   169		state->config.build_cfg0.aes_max_key_size =
   170			NIST_TRNG_REG_CFG0_AES_MAX_KEY_SIZE(tmp);
   171		state->config.build_cfg0.personilzation_str =
   172			NIST_TRNG_REG_CFG0_PERSONILIZATION_STR(tmp);
   173		DEBUG("NIST_TRNG: BUILD_CFG0 core_type=%u, bg8=%u, cdc_synch_depth=%u, background_noise=%u\n",
   174		      state->config.build_cfg0.core_type, state->config.build_cfg0.bg8,
   175		      state->config.build_cfg0.cdc_synch_depth,
   176		      state->config.build_cfg0.background_noise);
   177		DEBUG("edu_present=%u, aes_datapath=%u, aes_max_key_size=%u, personilzation_str=%u\n",
   178		      state->config.build_cfg0.edu_present,
   179		      state->config.build_cfg0.aes_datapath,
   180		      state->config.build_cfg0.aes_max_key_size,
   181		      state->config.build_cfg0.personilzation_str);
   182	
   183		tmp = pdu_io_read32(state->base + NIST_TRNG_REG_BUILD_CFG1);
   184		DEBUG("NIST_TRNG: NIST_TRNG_REG_BUILD_CFG1=0x%x\n", tmp);
   185		state->config.build_cfg1.num_raw_noise_blks =
   186			NIST_TRNG_REG_CFG1_NUM_RAW_NOISE_BLKS(tmp);
   187		state->config.build_cfg1.sticky_startup =
   188			NIST_TRNG_REG_CFG1_STICKY_STARTUP(tmp);
   189		state->config.build_cfg1.auto_correlation_test =
   190			NIST_TRNG_REG_CFG1_AUTO_CORRELATION_TEST(tmp);
   191		state->config.build_cfg1.mono_bit_test =
   192			NIST_TRNG_REG_CFG1_MONO_BIT_TEST(tmp);
   193		state->config.build_cfg1.run_test = NIST_TRNG_REG_CFG1_RUN_TEST(tmp);
   194		state->config.build_cfg1.poker_test =
   195			NIST_TRNG_REG_CFG1_POKER_TEST(tmp);
   196		state->config.build_cfg1.raw_ht_adap_test =
   197			NIST_TRNG_REG_CFG1_RAW_HT_ADAP_TEST(tmp);
   198		state->config.build_cfg1.raw_ht_rep_test =
   199			NIST_TRNG_REG_CFG1_RAW_HT_REP_TEST(tmp);
   200		state->config.build_cfg1.ent_src_rep_smpl_size =
   201			NIST_TRNG_REG_CFG1_ENT_SRC_REP_SMPL_SIZE(tmp);
   202		state->config.build_cfg1.ent_src_rep_test =
   203			NIST_TRNG_REG_CFG1_ENT_SRC_REP_TEST(tmp);
   204		state->config.build_cfg1.ent_src_rep_min_entropy =
   205			NIST_TRNG_REG_CFG1_ENT_SRC_REP_MIN_ENTROPY(tmp);
   206		DEBUG("NIST_TRNG: BUILD_CFG1 num_raw_noise_blks=%u, sticky_startup=%u, auto_correlation_test=%u\n",
   207		      state->config.build_cfg1.num_raw_noise_blks,
   208		      state->config.build_cfg1.sticky_startup,
   209		      state->config.build_cfg1.auto_correlation_test);
   210		DEBUG("mono_bit_test=%u, run_test=%u, poker_test=%u, raw_ht_adap_test=%u\n",
   211		      state->config.build_cfg1.mono_bit_test,
   212		      state->config.build_cfg1.run_test,
   213		      state->config.build_cfg1.poker_test,
   214		      state->config.build_cfg1.raw_ht_adap_test);
   215		DEBUG("raw_ht_rep_test=%u, ent_src_rep_smpl_size=%u, ent_src_rep_test=%u, ent_src_rep_min_entropy=%u\n",
   216		      state->config.build_cfg1.raw_ht_rep_test,
   217		      state->config.build_cfg1.ent_src_rep_smpl_size,
   218		      state->config.build_cfg1.ent_src_rep_test,
   219		      state->config.build_cfg1.ent_src_rep_min_entropy);
   220	
   221		tmp = pdu_io_read32(state->base + NIST_TRNG_EDU_BUILD_CFG0);
   222		state->config.edu_build_cfg0.rbc2_rate_width =
   223			NIST_TRNG_REG_EDU_CFG0_RBC2_RATE_WIDTH(tmp);
   224		state->config.edu_build_cfg0.rbc1_rate_width =
   225			NIST_TRNG_REG_EDU_CFG0_RBC1_RATE_WIDTH(tmp);
   226		state->config.edu_build_cfg0.rbc0_rate_width =
   227			NIST_TRNG_REG_EDU_CFG0_RBC0_RATE_WIDTH(tmp);
   228		state->config.edu_build_cfg0.public_vtrng_channels =
   229			NIST_TRNG_REG_EDU_CFG0_PUBLIC_VTRNG_CHANNELS(tmp);
   230		state->config.edu_build_cfg0.esm_channel =
   231			NIST_TRNG_REG_EDU_CFG0_ESM_CHANNEL(tmp);
   232		state->config.edu_build_cfg0.rbc_channels =
   233			NIST_TRNG_REG_EDU_CFG0_RBC_CHANNELS(tmp);
   234		state->config.edu_build_cfg0.fifo_depth =
   235			NIST_TRNG_REG_EDU_CFG0_FIFO_DEPTH(tmp);
   236		DEBUG("NIST_TRNG: EDU_BUILD_CFG0  rbc2_rate_width=%u, rbc1_rate_width=%u, rbc0_rate_width=%u\n",
   237		      state->config.edu_build_cfg0.rbc2_rate_width,
   238		      state->config.edu_build_cfg0.rbc1_rate_width,
   239		      state->config.edu_build_cfg0.rbc0_rate_width);
   240		DEBUG("public_vtrng_channels=%u, esm_channel=%u, rbc_channels=%u, fifo_depth=%u\n",
   241		      state->config.edu_build_cfg0.public_vtrng_channels,
   242		      state->config.edu_build_cfg0.esm_channel,
   243		      state->config.edu_build_cfg0.rbc_channels,
   244		      state->config.edu_build_cfg0.fifo_depth);
   245	
   246		state->status.edu_vstat.seed_enum =
   247			NIST_TRNG_REG_EDU_VSTAT_SEED_ENUM(tmp);
   248		state->status.edu_vstat.rnc_enabled =
   249			NIST_TRNG_REG_EDU_VSTAT_RNC_ENABLED(tmp);
   250	
   251		err = nisttrng_zeroize(state);
   252		if (err)
   253			goto ERR;
   254	
   255		err = CRYPTO_OK;
   256		state->status.current_state = NIST_TRNG_STATE_INITIALIZE;
   257	ERR:
   258		DEBUG("--- %s Return, err = %i\n", __func__, err);
   259		return err;
   260	} /* nisttrng_init */
   261	EXPORT_SYMBOL(nisttrng_init);
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
