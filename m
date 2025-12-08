Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FFB8F4A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 23:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765234870; cv=none; b=Iu3Z2Ajhg48719Vo3s4ikRERL+jKvpgbvv4N+D85q69pabiJBvQF1hvXlxw3axpA6D9jwteHz4wXKXOS8byE3Bt/NZx2Ebz2OJCWbzVZZqIxqVPkwL15r2oWsDZS0zlh/zDbgWMV21ZDVtsgSCBAlHGa46/dGQbHNaMggmn3QVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765234870; c=relaxed/simple;
	bh=gdNf0pR7R7W/ncJgJv5RT2tlT82VxJMJyCEVV+T0kwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpLSiy/SAkBxWY0M2sNYwm9Fv8PjYOKCyRKa7RVqyfbwgNCZJruPIyglGISN/b/XT9cRclPCjozRwP8dWexoqhT7Tb6lH+eTkEa3gzcMf5PNF0+ouLevVXFJD3dWRCIMPhwMuOvomfsvm3s0L5PFZCYY35muPA2Znf0yAOH9sdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrIWAs8P; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrIWAs8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765234868; x=1796770868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdNf0pR7R7W/ncJgJv5RT2tlT82VxJMJyCEVV+T0kwM=;
  b=lrIWAs8PZDN6mdaAIWUzHGSo17KXJ2rvceGMzmi8pqdHTvJiRAwwc0rD
   sfTGNi47NxM4kplF6hbwG0LbSMw9CJe2GOSPRUVHDyC5ppjAF+xkkoFFp
   UbaLPm3SdXPNGVg0IKwzf+VNWiDXtXJPNVard0x7T2ar95suCeD8v6K/F
   M3nrJa3xCViVLfpKWLzN7GtNrmEoqBIR167XQNhOdbsqXyEyLGhEvmikC
   wHY0ZYNVDT9eOJCNJm9zw5V40wVeRsqh1CH3lJfKG9lfFyQ+zOvZfHbdr
   uxR4MKVWum8Wq5l110/dz7QZMDGGacEjoyGM5ErWsc8KaYW2xEwMdFI5v
   Q==;
X-CSE-ConnectionGUID: 5AXSyG1mRvC1xatnq56HVw==
X-CSE-MsgGUID: 1812Ww4vSIOoSoJ9FLKsLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84593994"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="84593994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 15:01:07 -0800
X-CSE-ConnectionGUID: G70fjoKlRJWMP8iO4r8Gxg==
X-CSE-MsgGUID: oONsk217TM6dcIrMvxVdiA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2025 15:01:06 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSkE4-000000002HC-36Fe;
	Mon, 08 Dec 2025 23:01:04 +0000
Date: Tue, 9 Dec 2025 00:00:20 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3490/3490]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:6: error: no
 previous prototype for function 'sxe_debugfs_entries_init'
Message-ID: <202512082350.9BPj98cP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36141432a37f7dedddde8825e724b07ce3a440fb
commit: dd013ad487534c1838afc2f55efdb5daec15aace [3490/3490] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251208/202512082350.9BPj98cP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512082350.9BPj98cP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512082350.9BPj98cP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.c:11:
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.h:15:
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe.h:15:
   In file included from ./include/linux/pci.h:1670:
   In file included from ./include/linux/dmapool.h:14:
   In file included from ./include/linux/scatterlist.h:8:
   In file included from ./include/linux/mm.h:2253:
   ./include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   ./include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.c:410:6: error: no previous prototype for function 'sxe_txrx_ring_enable' [-Werror,-Wmissing-prototypes]
     410 | void sxe_txrx_ring_enable(struct sxe_adapter *adapter, u32 ring_idx)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.c:410:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     410 | void sxe_txrx_ring_enable(struct sxe_adapter *adapter, u32 ring_idx)
         | ^
         | static 
   6 errors generated.
--
   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:14:
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe.h:15:
   In file included from ./include/linux/pci.h:1670:
   In file included from ./include/linux/dmapool.h:14:
   In file included from ./include/linux/scatterlist.h:8:
   In file included from ./include/linux/mm.h:2253:
   ./include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   ./include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:6: error: no previous prototype for function 'sxe_debugfs_entries_init' [-Werror,-Wmissing-prototypes]
     432 | void sxe_debugfs_entries_init(struct sxe_adapter *adapter)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     432 | void sxe_debugfs_entries_init(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:459:6: error: no previous prototype for function 'sxe_debugfs_entries_exit' [-Werror,-Wmissing-prototypes]
     459 | void sxe_debugfs_entries_exit(struct sxe_adapter *adapter)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:459:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     459 | void sxe_debugfs_entries_exit(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:465:6: error: no previous prototype for function 'sxe_debugfs_init' [-Werror,-Wmissing-prototypes]
     465 | void sxe_debugfs_init(void)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     465 | void sxe_debugfs_init(void)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:470:6: error: no previous prototype for function 'sxe_debugfs_exit' [-Werror,-Wmissing-prototypes]
     470 | void sxe_debugfs_exit(void)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:470:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     470 | void sxe_debugfs_exit(void)
         | ^
         | static 
   9 errors generated.
--
   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:11:
   In file included from ./include/linux/highmem.h:8:
   In file included from ./include/linux/cacheflush.h:5:
   In file included from ./arch/arm64/include/asm/cacheflush.h:11:
   In file included from ./include/linux/kgdb.h:19:
   In file included from ./include/linux/kprobes.h:28:
   In file included from ./include/linux/ftrace.h:13:
   In file included from ./include/linux/kallsyms.h:13:
   In file included from ./include/linux/mm.h:2253:
   ./include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   ./include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:20:
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_filter.h:16:
   ./include/net/ip.h:466:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
     466 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   ./include/linux/jiffies.h:135:26: note: expanded from macro 'time_before'
     135 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   ./include/linux/jiffies.h:125:3: note: expanded from macro 'time_after'
     125 |         (typecheck(unsigned long, a) && \
         |          ^
   ./include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2022:5: error: no previous prototype for function 'sxe_reg_test' [-Werror,-Wmissing-prototypes]
    2022 | int sxe_reg_test(struct sxe_adapter *adapter)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2022:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2022 | int sxe_reg_test(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2644:5: error: no previous prototype for function 'sxe_phys_id_set' [-Werror,-Wmissing-prototypes]
    2644 | int sxe_phys_id_set(struct net_device *netdev, enum ethtool_phys_id_state state)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2644 | int sxe_phys_id_set(struct net_device *netdev, enum ethtool_phys_id_state state)
         | ^
         | static 
   8 errors generated.
--
   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:15:
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_pci.h:14:
   In file included from drivers/net/ethernet/linkdata/sxe/sxepf/sxe.h:15:
   In file included from ./include/linux/pci.h:1670:
   In file included from ./include/linux/dmapool.h:14:
   In file included from ./include/linux/scatterlist.h:8:
   In file included from ./include/linux/mm.h:2253:
   ./include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   ./include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:230:6: error: no previous prototype for function 'sxe_hw_no_snoop_disable' [-Werror,-Wmissing-prototypes]
     230 | void sxe_hw_no_snoop_disable(struct sxe_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     230 | void sxe_hw_no_snoop_disable(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:262:6: error: no previous prototype for function 'sxe_hw_uc_addr_pool_del' [-Werror,-Wmissing-prototypes]
     262 | void sxe_hw_uc_addr_pool_del(struct sxe_hw *hw, u32 rar_idx, u32 pool_idx)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:262:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     262 | void sxe_hw_uc_addr_pool_del(struct sxe_hw *hw, u32 rar_idx, u32 pool_idx)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:283:5: error: no previous prototype for function 'sxe_hw_uc_addr_pool_enable' [-Werror,-Wmissing-prototypes]
     283 | s32 sxe_hw_uc_addr_pool_enable(struct sxe_hw *hw, u8 rar_idx, u8 pool_idx)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     283 | s32 sxe_hw_uc_addr_pool_enable(struct sxe_hw *hw, u8 rar_idx, u8 pool_idx)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:337:5: error: no previous prototype for function 'sxe_hw_nic_reset' [-Werror,-Wmissing-prototypes]
     337 | s32 sxe_hw_nic_reset(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:337:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     337 | s32 sxe_hw_nic_reset(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:367:6: error: no previous prototype for function 'sxe_hw_pf_rst_done_set' [-Werror,-Wmissing-prototypes]
     367 | void sxe_hw_pf_rst_done_set(struct sxe_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:367:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     367 | void sxe_hw_pf_rst_done_set(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:735:5: error: no previous prototype for function 'sxe_hw_pending_irq_read_clear' [-Werror,-Wmissing-prototypes]
     735 | u32 sxe_hw_pending_irq_read_clear(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:735:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     735 | u32 sxe_hw_pending_irq_read_clear(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:740:6: error: no previous prototype for function 'sxe_hw_pending_irq_write_clear' [-Werror,-Wmissing-prototypes]
     740 | void sxe_hw_pending_irq_write_clear(struct sxe_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:740:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     740 | void sxe_hw_pending_irq_write_clear(struct sxe_hw *hw, u32 value)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:745:5: error: no previous prototype for function 'sxe_hw_irq_cause_get' [-Werror,-Wmissing-prototypes]
     745 | u32 sxe_hw_irq_cause_get(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:745:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     745 | u32 sxe_hw_irq_cause_get(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:765:6: error: no previous prototype for function 'sxe_hw_ring_irq_auto_disable' [-Werror,-Wmissing-prototypes]
     765 | void sxe_hw_ring_irq_auto_disable(struct sxe_hw *hw, bool is_msix)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:765:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     765 | void sxe_hw_ring_irq_auto_disable(struct sxe_hw *hw, bool is_msix)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:775:6: error: no previous prototype for function 'sxe_hw_irq_general_reg_set' [-Werror,-Wmissing-prototypes]
     775 | void sxe_hw_irq_general_reg_set(struct sxe_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:775:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     775 | void sxe_hw_irq_general_reg_set(struct sxe_hw *hw, u32 value)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:780:5: error: no previous prototype for function 'sxe_hw_irq_general_reg_get' [-Werror,-Wmissing-prototypes]
     780 | u32 sxe_hw_irq_general_reg_get(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:780:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     780 | u32 sxe_hw_irq_general_reg_get(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:790:6: error: no previous prototype for function 'sxe_hw_event_irq_map' [-Werror,-Wmissing-prototypes]
     790 | void sxe_hw_event_irq_map(struct sxe_hw *hw, u8 offset, u16 irq_idx)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:790:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     790 | void sxe_hw_event_irq_map(struct sxe_hw *hw, u8 offset, u16 irq_idx)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:806:6: error: no previous prototype for function 'sxe_hw_ring_irq_map' [-Werror,-Wmissing-prototypes]
     806 | void sxe_hw_ring_irq_map(struct sxe_hw *hw, bool is_tx, u16 reg_idx,
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:806:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     806 | void sxe_hw_ring_irq_map(struct sxe_hw *hw, bool is_tx, u16 reg_idx,
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:823:6: error: no previous prototype for function 'sxe_hw_ring_irq_interval_set' [-Werror,-Wmissing-prototypes]
     823 | void sxe_hw_ring_irq_interval_set(struct sxe_hw *hw, u16 irq_idx, u32 interval)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:823:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     823 | void sxe_hw_ring_irq_interval_set(struct sxe_hw *hw, u16 irq_idx, u32 interval)
         | ^
         | static 
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +/sxe_debugfs_entries_init +432 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c

   431	
 > 432	void sxe_debugfs_entries_init(struct sxe_adapter *adapter)
   433	{
   434		struct dentry *dir;
   435		const char *name = pci_name(adapter->pdev);
   436	
   437		adapter->debugfs_entries = debugfs_create_dir(name, sxe_debugfs_root);
   438		dir = debugfs_create_file("reg_ops", 0600, adapter->debugfs_entries,
   439					  adapter, &sxe_debugfs_reg_ops_fops);
   440		if (!dir || dir == ERR_PTR(-ENODEV))
   441			LOG_INFO_BDF("debugfs:reg_ops file create failed\n");
   442	
   443		dir = debugfs_create_file("netdev_ops", 0600, adapter->debugfs_entries,
   444					  adapter, &sxe_debugfs_netdev_ops_fops);
   445		if (!dir || dir == ERR_PTR(-ENODEV))
   446			LOG_INFO_BDF("debugfs:netdev_ops file create failed\n");
   447	
   448		dir = debugfs_create_file("hw_stats", 0400, adapter->debugfs_entries,
   449					  adapter, &sxe_debugfs_hw_stats_fops);
   450		if (!dir || dir == ERR_PTR(-ENODEV))
   451			LOG_INFO_BDF("debugfs:hw_stats file create failed\n");
   452	
   453		dir = debugfs_create_file("sfp_info", 0400, adapter->debugfs_entries,
   454					  adapter, &sxe_debugfs_sfp_info_fops);
   455		if (!dir || dir == ERR_PTR(-ENODEV))
   456			LOG_INFO_BDF("debugfs:sfp_info file create failed\n");
   457	}
   458	
 > 459	void sxe_debugfs_entries_exit(struct sxe_adapter *adapter)
   460	{
   461		debugfs_remove_recursive(adapter->debugfs_entries);
   462		adapter->debugfs_entries = NULL;
   463	}
   464	
 > 465	void sxe_debugfs_init(void)
   466	{
   467		sxe_debugfs_root = debugfs_create_dir(SXE_DRV_NAME, NULL);
   468	}
   469	
 > 470	void sxe_debugfs_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
