Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BBB3EA66
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jul 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783279289; cv=none; b=hbfY6qUlXE3mfY5QwBy9c+OkCGYXDtBpJooT/0o8g9pF0KVAnwEA80KhHzvlGLPLLShnUeC4/pVKQmuUn0Ucus8BhfGXajRtgViL2chQPZpt4qO3N1edDKmqEHoe8eb2HmjT4F40JVEaft/mALVPbA+uKY9RpIPoRckQuTQtdqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783279289; c=relaxed/simple;
	bh=IvJ3sg4LzH+KxXOw4NJSAUkYkcoEnAIUfRbYurGQFbc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZjPYEWFED+8NICYPlTU6eiTOpWnizhwnOrV4obVl+DQ8hpd9a2ZNaO6DvtW6DrVzq4iqQhtksNpe6RsJEzCpyGp/isDA/zC6fL+gYufRN67pFzQm9hrAr10bbPfDCXF5mMKrWMWCk9iEdO7j4+ow5UppnDHRF4JnIQhNaL29Xp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4azUXY4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4azUXY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783279286; x=1814815286;
  h=date:from:to:cc:subject:message-id;
  bh=IvJ3sg4LzH+KxXOw4NJSAUkYkcoEnAIUfRbYurGQFbc=;
  b=S4azUXY4ygUO4SPkTYG662sKQg7fiYxp5kQV/AYX3bAoSbqN9dgUjQZO
   jN2B2a7VSmQuB3VgqktU//6Ac80oASKUYyQOnKKUcXmDH/lF7XQ4M3sP+
   HzkVI1lzXwcE86rxxAASfB34D4Rm6Tl8Wh2+LgIxESBPZQ/w5rDhmLPm8
   08Vib1IWmh8LBUnz9q+lt0ZXhCIL+Yp1JGn+PTpdoTlyn4haLGmEfixFc
   /ZC8MrsyJwKiVo14mnsmzF0nvf8+V/FAFyxOKMdaOvyJWOsQxER1+gPw2
   PQ9o8wcPkudg/0xqeRTITeAfLHDkgUEfMof8CYAsuLjM4i4bCTMyoLWw2
   A==;
X-CSE-ConnectionGUID: o7/kN1miRHeaEy2UGkS03g==
X-CSE-MsgGUID: TKdtVlHvTKeOxh92a/+J6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83971858"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83971858"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 12:21:25 -0700
X-CSE-ConnectionGUID: We0BbeaXT02ubEdmkaFBmA==
X-CSE-MsgGUID: mJPTMQBYTbOTUN6z7P1A5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="249547397"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jul 2026 12:21:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgSP3-00000000Dkx-1Ki5;
	Sun, 05 Jul 2026 19:21:21 +0000
Date: Mon, 06 Jul 2026 03:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 drivers/mmc/host/dw_mmc.c:710:33: warning: implicit conversion from 'unsigned
 long' to '__u32' (aka 'unsigned int') changes value from 18446744073709551597
 to 4294967277
Message-ID: <202607060321.GHxXBOSZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c1dfb29d7df698e3cb488dcf1ae69ee66586bbba
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [1/1] UPSTREAM: block: add a rq_list type
config: arm64-randconfig-r113-20260705 (https://download.01.org/0day-ci/archive/20260706/202607060321.GHxXBOSZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607060321.GHxXBOSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607060321.GHxXBOSZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/mmc/host/dw_mmc.c:10:
   include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
>> drivers/mmc/host/dw_mmc.c:710:33: warning: implicit conversion from 'unsigned long' to '__u32' (aka 'unsigned int') changes value from 18446744073709551597 to 4294967277 [-Wconstant-conversion]
     710 |         desc_last->des0 &= cpu_to_le32(~(IDMAC_DES0_CH |
         |                            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
     711 |                                        IDMAC_DES0_DIC));
         |                                        ~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/big_endian.h:34:53: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ~~~~~~~~~~^~~
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
     120 |         __fswab32(x))
         |         ~~~~~~~~~ ^
   drivers/mmc/host/dw_mmc.c:3044:33: warning: shift count >= width of type [-Wshift-count-overflow]
    3044 |                         if (!dma_set_mask(host->dev, DMA_BIT_MASK(64)))
         |                                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   drivers/mmc/host/dw_mmc.c:3046:13: warning: shift count >= width of type [-Wshift-count-overflow]
    3046 |                                                       DMA_BIT_MASK(64));
         |                                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   4 warnings and 1 error generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/mmc/host/sunxi-mmc.c:23:
   In file included from include/linux/mmc/host.h:19:
   In file included from include/linux/blk-crypto-profile.h:10:
   In file included from include/linux/blk-crypto.h:127:
   include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
>> drivers/mmc/host/sunxi-mmc.c:388:36: warning: implicit conversion from 'unsigned long' to '__u32' (aka 'unsigned int') changes value from 18446744073709551613 to 4294967293 [-Wconstant-conversion]
     388 |         pdes[i - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
         |                               ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/big_endian.h:34:53: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ~~~~~~~~~~^~~
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
     120 |         __fswab32(x))
         |         ~~~~~~~~~ ^
   2 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +710 drivers/mmc/host/dw_mmc.c

69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  648  
ec0baaa6b33932 Shawn Lin         2016-09-02  649  
3b2a067b98b45f Shawn Lin         2016-09-02  650  static inline int dw_mci_prepare_desc32(struct dw_mci *host,
ec0baaa6b33932 Shawn Lin         2016-09-02  651  					 struct mmc_data *data,
ec0baaa6b33932 Shawn Lin         2016-09-02  652  					 unsigned int sg_len)
ec0baaa6b33932 Shawn Lin         2016-09-02  653  {
ec0baaa6b33932 Shawn Lin         2016-09-02  654  	unsigned int desc_len;
5959b32e3636f9 Alexey Brodkin    2015-06-25  655  	struct idmac_desc *desc_first, *desc_last, *desc;
b6d2d81c5c2de6 Shawn Lin         2017-02-17  656  	u32 val;
ec0baaa6b33932 Shawn Lin         2016-09-02  657  	int i;
f95f3850f7a9e1 Will Newton       2011-01-02  658  
5959b32e3636f9 Alexey Brodkin    2015-06-25  659  	desc_first = desc_last = desc = host->sg_cpu;
5959b32e3636f9 Alexey Brodkin    2015-06-25  660  
5959b32e3636f9 Alexey Brodkin    2015-06-25  661  	for (i = 0; i < sg_len; i++) {
f95f3850f7a9e1 Will Newton       2011-01-02  662  		unsigned int length = sg_dma_len(&data->sg[i]);
0e3a22c044478b Shawn Lin         2015-08-03  663  
f95f3850f7a9e1 Will Newton       2011-01-02  664  		u32 mem_addr = sg_dma_address(&data->sg[i]);
f95f3850f7a9e1 Will Newton       2011-01-02  665  
5959b32e3636f9 Alexey Brodkin    2015-06-25  666  		for ( ; length ; desc++) {
5959b32e3636f9 Alexey Brodkin    2015-06-25  667  			desc_len = (length <= DW_MCI_DESC_DATA_LENGTH) ?
5959b32e3636f9 Alexey Brodkin    2015-06-25  668  				   length : DW_MCI_DESC_DATA_LENGTH;
5959b32e3636f9 Alexey Brodkin    2015-06-25  669  
5959b32e3636f9 Alexey Brodkin    2015-06-25  670  			length -= desc_len;
5959b32e3636f9 Alexey Brodkin    2015-06-25  671  
3b2a067b98b45f Shawn Lin         2016-09-02  672  			/*
3b2a067b98b45f Shawn Lin         2016-09-02  673  			 * Wait for the former clear OWN bit operation
3b2a067b98b45f Shawn Lin         2016-09-02  674  			 * of IDMAC to make sure that this descriptor
3b2a067b98b45f Shawn Lin         2016-09-02  675  			 * isn't still owned by IDMAC as IDMAC's write
3b2a067b98b45f Shawn Lin         2016-09-02  676  			 * ops and CPU's read ops are asynchronous.
3b2a067b98b45f Shawn Lin         2016-09-02  677  			 */
b6d2d81c5c2de6 Shawn Lin         2017-02-17  678  			if (readl_poll_timeout_atomic(&desc->des0, val,
b6d2d81c5c2de6 Shawn Lin         2017-02-17  679  						      IDMAC_OWN_CLR64(val),
b6d2d81c5c2de6 Shawn Lin         2017-02-17  680  						      10,
b6d2d81c5c2de6 Shawn Lin         2017-02-17  681  						      100 * USEC_PER_MSEC))
3b2a067b98b45f Shawn Lin         2016-09-02  682  				goto err_own_bit;
3b2a067b98b45f Shawn Lin         2016-09-02  683  
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  684  			/*
5959b32e3636f9 Alexey Brodkin    2015-06-25  685  			 * Set the OWN bit and disable interrupts
5959b32e3636f9 Alexey Brodkin    2015-06-25  686  			 * for this descriptor
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  687  			 */
6687c42fa71acd Ben Dooks         2015-03-25  688  			desc->des0 = cpu_to_le32(IDMAC_DES0_OWN |
5959b32e3636f9 Alexey Brodkin    2015-06-25  689  						 IDMAC_DES0_DIC |
5959b32e3636f9 Alexey Brodkin    2015-06-25  690  						 IDMAC_DES0_CH);
5959b32e3636f9 Alexey Brodkin    2015-06-25  691  
f95f3850f7a9e1 Will Newton       2011-01-02  692  			/* Buffer length */
5959b32e3636f9 Alexey Brodkin    2015-06-25  693  			IDMAC_SET_BUFFER1_SIZE(desc, desc_len);
f95f3850f7a9e1 Will Newton       2011-01-02  694  
f95f3850f7a9e1 Will Newton       2011-01-02  695  			/* Physical address to DMA to/from */
6687c42fa71acd Ben Dooks         2015-03-25  696  			desc->des2 = cpu_to_le32(mem_addr);
5959b32e3636f9 Alexey Brodkin    2015-06-25  697  
5959b32e3636f9 Alexey Brodkin    2015-06-25  698  			/* Update physical address for the next desc */
5959b32e3636f9 Alexey Brodkin    2015-06-25  699  			mem_addr += desc_len;
5959b32e3636f9 Alexey Brodkin    2015-06-25  700  
5959b32e3636f9 Alexey Brodkin    2015-06-25  701  			/* Save pointer to the last descriptor */
5959b32e3636f9 Alexey Brodkin    2015-06-25  702  			desc_last = desc;
5959b32e3636f9 Alexey Brodkin    2015-06-25  703  		}
f95f3850f7a9e1 Will Newton       2011-01-02  704  	}
f95f3850f7a9e1 Will Newton       2011-01-02  705  
f95f3850f7a9e1 Will Newton       2011-01-02  706  	/* Set first descriptor */
5959b32e3636f9 Alexey Brodkin    2015-06-25  707  	desc_first->des0 |= cpu_to_le32(IDMAC_DES0_FD);
f95f3850f7a9e1 Will Newton       2011-01-02  708  
f95f3850f7a9e1 Will Newton       2011-01-02  709  	/* Set last descriptor */
5959b32e3636f9 Alexey Brodkin    2015-06-25 @710  	desc_last->des0 &= cpu_to_le32(~(IDMAC_DES0_CH |
5959b32e3636f9 Alexey Brodkin    2015-06-25  711  				       IDMAC_DES0_DIC));
5959b32e3636f9 Alexey Brodkin    2015-06-25  712  	desc_last->des0 |= cpu_to_le32(IDMAC_DES0_LD);
3b2a067b98b45f Shawn Lin         2016-09-02  713  
3b2a067b98b45f Shawn Lin         2016-09-02  714  	return 0;
3b2a067b98b45f Shawn Lin         2016-09-02  715  err_own_bit:
3b2a067b98b45f Shawn Lin         2016-09-02  716  	/* restore the descriptor chain as it's polluted */
26be9d705f4452 Colin Ian King    2016-11-16  717  	dev_dbg(host->dev, "descriptor is still owned by IDMAC.\n");
cc190d4c6499b1 Shawn Lin         2016-09-02  718  	memset(host->sg_cpu, 0, DESC_RING_BUF_SZ);
3b2a067b98b45f Shawn Lin         2016-09-02  719  	dw_mci_idmac_init(host);
3b2a067b98b45f Shawn Lin         2016-09-02  720  	return -EINVAL;
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  721  }
f95f3850f7a9e1 Will Newton       2011-01-02  722  

:::::: The code at line 710 was first introduced by commit
:::::: 5959b32e3636f9bfe3f869d1e440bc4a4d660965 mmc: dw_mmc: handle data blocks > than 4kB if IDMAC is used

:::::: TO: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
