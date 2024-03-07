Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6154112EBE1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709836457; cv=none; b=u5j+AfUqecgF3nQFt40/+q8FyXGf7uBaW0tRF7qK7kcwOXoaPDLyC4Oplv/kJ3Rf+Sp3pcmAVzMgLjZ3Ih+oaz2rV3fGlv6mgSSB30lbN23EsqEBhKvW3oDRkA4EvIbr2HBtc7SVwrRaU9Q3IrxmmaPiqnpEv5+97h12LlP6GpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709836457; c=relaxed/simple;
	bh=ZubMbmcKlnXDHOuVQ8NNLRHpw4GQ3zmc29m0yHtvbgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xdo0n6XulmMZ//kkz3613z5GYZ1eDcAexluKwnNN/0KZoCJ7slHp+k2/2kzGcun3WEa+GajKWKNmdCENSfnOTzgu4iL7Qt3ibbU8sn0e38usq4tTzTCn29DEokQZI3/+gCyD6vBxt+oBWHsB7YIKXGMIaMvKJQNs5EEASkMLHIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvdIi/ZZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvdIi/ZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709836455; x=1741372455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZubMbmcKlnXDHOuVQ8NNLRHpw4GQ3zmc29m0yHtvbgY=;
  b=dvdIi/ZZqbQdIzB6kO1Pwg6b+s9nS+hEQy2S6rxaIjSHfGZ0NyzLmL+h
   nbR/AoB7VaiwjyODL93Z4lOZRomSeNzPEKUam58ldabj7aADLD2/3ucNV
   3n7PG7FKshBWBCA8ddR34LuiyFwzsXlxX4/RTk9v+knVwYheiyrG9vCcz
   C02bohbfdXP12e7mG2KlaxWJ9kAersB4TLN8BZ+VIhn32VJm4+YA+R/Zk
   eulptRQ+AL68u4bkl0wjV+aeHxz4VQFG8Vdof8SQQ5Mg+LgdcK+hnGd7b
   xUUr5AqK1RQF2J7ZpZQtcbepaYjQpPtaIEa1zz9mlDSSIl32+3W0MYMHq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="5112665"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="5112665"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 10:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10763378"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2024 10:34:13 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riIZG-0005Ur-1m;
	Thu, 07 Mar 2024 18:34:10 +0000
Date: Fri, 8 Mar 2024 02:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3862/3876]
 drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1456:5: warning: no previous
 prototype for function 'rnp_mbx_lldp_all_ports_enable'
Message-ID: <202403080243.ondrgrmr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97ba28f60ba0c12d39b4d3032121317ffebc06ba
commit: 455d45ae080810ae554f5e586adb9004230f9f70 [3862/3876] drivers: initial support for rnp drivers from Mucse Technology
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403080243.ondrgrmr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080243.ondrgrmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080243.ondrgrmr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:9:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:9:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
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
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:571:18: warning: array index 0 is past the end of the array (that has type 'char[0]', cast to 'int *') [-Warray-bounds]
     571 |                 ret = ((int *)(cookie->priv))[0];
         |                                ^              ~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:60:2: note: array 'priv' declared here
      60 |         char priv[0];
         |         ^
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1105:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1105 |         int err;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1145:6: warning: variable 'value' set but not used [-Wunused-but-set-variable]
    1145 |         int value;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1141:5: warning: no previous prototype for function 'rnp_fw_reg_read' [-Wmissing-prototypes]
    1141 | int rnp_fw_reg_read(struct rnp_hw *hw, int addr, int sz)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1141:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1141 | int rnp_fw_reg_read(struct rnp_hw *hw, int addr, int sz)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1456:5: warning: no previous prototype for function 'rnp_mbx_lldp_all_ports_enable' [-Wmissing-prototypes]
    1456 | int rnp_mbx_lldp_all_ports_enable(struct rnp_hw *hw, bool enable)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1456:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1456 | int rnp_mbx_lldp_all_ports_enable(struct rnp_hw *hw, bool enable)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1519:18: warning: array index 0 is past the end of the array (that has type 'char[0]', cast to 'int *') [-Warray-bounds]
    1519 |                 ret = ((int *)(cookie->priv))[0];
         |                                ^              ~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:60:2: note: array 'priv' declared here
      60 |         char priv[0];
         |         ^
   In file included from drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:4:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:11:
   In file included from include/linux/string.h:294:
   include/linux/fortify-string.h:592:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     592 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   12 warnings generated.


vim +/rnp_mbx_lldp_all_ports_enable +1456 drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c

  1455	
> 1456	int rnp_mbx_lldp_all_ports_enable(struct rnp_hw *hw, bool enable)
  1457	{
  1458		struct mbx_fw_cmd_req req;
  1459		int err;
  1460	
  1461		if (!hw->fw_lldp_ablity)
  1462			return -EOPNOTSUPP;
  1463	
  1464		memset(&req, 0, sizeof(req));
  1465	
  1466		build_lldp_ctrl_set(&req, LLDP_TX_ALL_LANES, enable);
  1467	
  1468		err = rnp_mbx_write_posted_locked(hw, &req);
  1469		return err;
  1470	}
  1471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
