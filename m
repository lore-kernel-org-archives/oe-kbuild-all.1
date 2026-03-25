Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8079230EF8F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429142; cv=none; b=iE+BVAUAu6JIkXbFWPWqMUpmb7ZQSWqWGL0vu9ldZcL+yL2ckCj2KHwzTE+O6mRD9RZjAG8jBb1M9qbrwVYHBu/4IzxcpbCIOA5cHJoQb47syFdEFHPJbkE3s/zrDjJ/d8+bxmxSUu+bFcpzi3H0pfgAkhX8CIXbmuLwg17kjNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429142; c=relaxed/simple;
	bh=SxSMPm4kHHp4fc6G9ZO9HzA9FGCnlW1lsQMamZfbkRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PhX2RSrblWaWjbHGvGzTsqvlxXwAUXOk6AS+H1d/jUNax8E49lRsdX9c5j6ggesFekdICOhmuIZ319xT5+mcJEibywBIbvmXt7js7L/VSfZK9ge0jKrOqjn06/Rg+E57QNHlnNgL0cSH7ATrFjaFFqQN0xE7qU2wq9rjsU7/hb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiU/ZKQU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiU/ZKQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774429140; x=1805965140;
  h=date:from:to:cc:subject:message-id;
  bh=SxSMPm4kHHp4fc6G9ZO9HzA9FGCnlW1lsQMamZfbkRY=;
  b=aiU/ZKQU55/6s3wMtosjOWuJVAbFeMFqAC9YbpMYOKhqlmdZK1qMyNpb
   7WwgeL59kffHcIgff1HsCN/0sFX+JqiyAE76GJtM7WvgUD35I4+nDcw4c
   h2pMYrLU9yyz+t4H7VhjVShdTLQOqr7BszucKW3R5dQqvBKIqTkp42ndG
   /fd/S68hykz9eqX3ki7+pyJHQ+705U7OMjDH64MCu5zD0R2nZ7TXHs8BK
   rRpYaZoiXHYYUATZZgXfNDYbrJmJWbrhw/16BKviUh1bH4q4JEKyO4LGt
   K+p06LThGn5z77NWLqQ6YLPygd003bNuWoA2ZLKCoLhp+bxdnvuxrgS45
   Q==;
X-CSE-ConnectionGUID: zj4yHpzyRCushgt5DwSNhw==
X-CSE-MsgGUID: tzTJnCnVSVmGj6LD+eoGRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86938372"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86938372"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:59:00 -0700
X-CSE-ConnectionGUID: nDTWhmffRNqqJ5oXLr709w==
X-CSE-MsgGUID: lYDfn/QLQEmFxeGmDRA61A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Mar 2026 01:58:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5K4l-000000006Xt-1JT6;
	Wed, 25 Mar 2026 08:58:55 +0000
Date: Wed, 25 Mar 2026 16:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Stitt <justinstitt@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: [kees:dev/v7.0-rc2/obt 2/4]
 include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined
Message-ID: <202603251629.pTdmJk1b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt
head:   537858cd27d509ec0dedfa4b96bc1d0e461367b1
commit: 368a623ca334a5de414be74df0471266c5985152 [2/4] compiler_attributes: Add overflow_behavior macros __wrap and __trap
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20260325/202603251629.pTdmJk1b-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251629.pTdmJk1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251629.pTdmJk1b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   1 warning generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:934:24: warning: conditional expression between different enumeration types ('enum iwl_mac_beacon_flags' and 'enum iwl_mac_beacon_flags_v1') [-Wenum-compare-conditional]
     934 |                 flags |= is_new_rate ? IWL_MAC_BEACON_CCK
         |                                      ^ ~~~~~~~~~~~~~~~~~~
     935 |                           : IWL_MAC_BEACON_CCK_V1;
         |                             ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:1101:21: warning: conditional expression between different enumeration types ('enum iwl_mac_beacon_flags' and 'enum iwl_mac_beacon_flags_v1') [-Wenum-compare-conditional]
    1101 |                                                0) > 10 ?
         |                                                        ^
    1102 |                         IWL_MAC_BEACON_FILS :
         |                         ~~~~~~~~~~~~~~~~~~~
    1103 |                         IWL_MAC_BEACON_FILS_V1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   drivers/infiniband/hw/ionic/ionic_datapath.c:902:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     902 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:905:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     905 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:909:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     909 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_INV);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:946:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     946 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:949:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     949 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, SEND_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:978:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     978 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, RDMA_READ);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:983:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     983 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, RDMA_WRITE);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:986:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
     986 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, RDMA_WRITE_IMM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1023:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1023 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, ATOMIC_CS);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1031:18: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1031 |                 wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, ATOMIC_FA);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1066:17: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1066 |         wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, LOCAL_INV);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:1101:17: warning: conditional expression between different enumeration types ('enum ionic_v1_op' and 'enum ionic_v2_op') [-Wenum-compare-conditional]
    1101 |         wqe->base.op = IONIC_OP(dev->lif_cfg.rdma_version, REG_MR);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/ionic/ionic_datapath.c:13:17: note: expanded from macro 'IONIC_OP'
      13 |         ((version) < 2 ? IONIC_V1_OP_##opname : IONIC_V2_OP_##opname)
         |                        ^ ~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   In file included from drivers/net/ethernet/intel/igc/igc_ethtool.c:5:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:24:
   In file included from include/linux/timer.h:8:
   In file included from include/linux/debugobjects.h:6:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/powerpc/include/asm/preempt.h:5:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:23:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:16:
   In file included from include/linux/string.h:386:
   include/linux/fortify-string.h:578:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     578 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   2 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   drivers/devfreq/event/exynos-ppmu.c:527:20: warning: cast to smaller integer type 'enum exynos_ppmu_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     527 |         info->ppmu_type = (enum exynos_ppmu_type)device_get_match_data(dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   drivers/staging/sm750fb/ddk750_swi2c.c:95:9: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
      95 |         int i, tmp;
         |                ^
   2 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2287:24: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
    2287 |                         if (ring->frag_size <= PAGE_SIZE)
         |                             ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2829:24: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
    2829 |                         if (ring->frag_size <= PAGE_SIZE)
         |                             ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   3 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   drivers/gpu/drm/pl111/pl111_versatile.c:489:24: warning: cast to smaller integer type 'enum versatile_clcd' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     489 |         versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/pl111/pl111_versatile.c:509:26: warning: cast to smaller integer type 'enum versatile_clcd' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     509 |                         versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   In file included from drivers/net/ethernet/myricom/myri10ge/myri10ge.c:43:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:12:
   In file included from include/linux/nodemask.h:91:
   In file included from include/linux/bitmap.h:13:
   In file included from include/linux/string.h:386:
   include/linux/fortify-string.h:578:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     578 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   include/linux/fortify-string.h:578:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
   3 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   drivers/net/ethernet/natsemi/ns83820.c:1703:6: warning: variable 'loops' set but not used [-Wunused-but-set-variable]
    1703 |         int loops = 0;
         |             ^
   2 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:406:10: warning: '__trap' macro redefined [-Wmacro-redefined]
     406 | # define __trap                     __attribute__((overflow_behavior(trap)))
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   drivers/net/ethernet/ni/nixge.c:1271:12: warning: cast to smaller integer type 'enum nixge_version' from 'const void *' [-Wvoid-pointer-to-enum-cast]
    1271 |         version = (enum nixge_version)of_id->data;
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
..


vim +/__trap +406 include/linux/compiler_attributes.h

   398	
   399	/*
   400	 * Optional: only supported by Clang with -Xclang -experimental-foverflow-behavior-types
   401	 * passed via CONFIG_UBSAN_INTEGER_WRAP
   402	 *
   403	 * clang: https://clang.llvm.org/docs/OverflowBehaviorTypes.html
   404	 */
   405	#if __has_attribute(overflow_behavior) && defined(INTEGER_WRAP)
 > 406	# define __trap                     __attribute__((overflow_behavior(trap)))
   407	# define __wrap                     __attribute__((overflow_behavior(wrap)))
   408	#else
   409	# define __trap
   410	# define __wrap
   411	#endif
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
