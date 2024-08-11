Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDF733C9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723361562; cv=none; b=hh/XzE9w7hdDbSq+KmEI655i+Hu623sgXI3vAOhd8XpVV2fSWSGBwHR2CYLPbiPVjS0ltDfVdaWwi2HhwDlFsuTDlig4Z544LTJbudrWVmshCj4n0fSkz6+NwATnMWdQFXUTuXnstEQZ/y0ZtzsJxr6RgS/3MoQdzNvVOEEya2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723361562; c=relaxed/simple;
	bh=o6Ae5okHolAbqh4w5nsQyJfAbWN02wl5ufMT31WtNCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1QMq8dpZWYiAurCSM4OcemmT74Iz3KlrNx+WYI6scCWksOeGZUD5heVUK0kTI/ZXoMJ6YpMY2uNDs0SFCho8Fhbf/cHgLD5C42VX50eNI6Nxo1w7FwLy8+57vdgpIWSaXfsoo0+o634hnKy974QXCnX/Bo1J4kuL8EeuxS2v3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wpz49F6s; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wpz49F6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723361560; x=1754897560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6Ae5okHolAbqh4w5nsQyJfAbWN02wl5ufMT31WtNCk=;
  b=Wpz49F6sl4G7Q6vwrC1Sd7hFZtITgigq55mYR7oaosDHuwfs5Ijt1KVp
   hjO4vNqZbEmFa161WZW6s2PkBU81wTsN0mlZnE0rQ2od7+jBYRCMxoguh
   awbvst7LAErqS7eDotaSrnxKtEHmIbI7t83C0V22TG6s/zt0QHWbq4/KV
   jUH5dtdAs1qBedmmfXSYHgJ4p2t7w81owIDZCzxvjRsSM3UMskepxoXx+
   ARzE1oUp78yfIgfjgsj7j+Spfo5dk2EHdlQdhU5w9inPUm4TR6GrqsCHQ
   fuUfh+9gPN07qO1HwEV9EOHbhxtJmmRZXx3WqvgNryFed+XaSTrEM4F/9
   Q==;
X-CSE-ConnectionGUID: sSZpCWCWTCG7657bYqzGCA==
X-CSE-MsgGUID: XpUrq1xlQFOeZUBEQNGPzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21342658"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21342658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 00:32:40 -0700
X-CSE-ConnectionGUID: iGGGbfr9TgivFepDDT9m2g==
X-CSE-MsgGUID: Qpj/vZtdSgykoPx5F7TfRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="57858481"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Aug 2024 00:32:38 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd348-000AfX-0y;
	Sun, 11 Aug 2024 07:32:36 +0000
Date: Sun, 11 Aug 2024 15:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.6.y-cicd 189/1221]
 drivers/net/ethernet/ti/am65-cpsw-qos.c:984:49: error: expression is not
 assignable
Message-ID: <202408111535.NxnojIq8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-linux-6.6.y-cicd
head:   2541807a1ef54deb9241788913a930d9558d38fd
commit: 87825f8638f6b320eea31e9bc68845ea796390df [189/1221] BACKPORT: net: ethernet: ti: am65-cpsw: add mqprio qdisc offload in channel mode
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240811/202408111535.NxnojIq8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111535.NxnojIq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408111535.NxnojIq8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/am65-cpsw-qos.c:11:
   In file included from include/net/pkt_cls.h:7:
   In file included from include/net/sch_generic.h:5:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2224:
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
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:984:49: error: expression is not assignable
     984 | +                               p_mqprio->tc0_q = mqprio->qopt.offset[i];
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:985:45: error: expression is not assignable
     985 | +                               rx_prio_map &= ~(0x7 << (4 * p_mqprio->tc0_q));
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:961:6: warning: no previous prototype for function 'am65_cpsw_qos_mqprio_init' [-Wmissing-prototypes]
     961 | void am65_cpsw_qos_mqprio_init(struct am65_cpsw_port *port)
         |      ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:961:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     961 | void am65_cpsw_qos_mqprio_init(struct am65_cpsw_port *port)
         | ^
         | static 
   6 warnings and 2 errors generated.


vim +984 drivers/net/ethernet/ti/am65-cpsw-qos.c

   960	
 > 961	void am65_cpsw_qos_mqprio_init(struct am65_cpsw_port *port)
   962	{
   963	       struct am65_cpsw_host *host = am65_common_get_host(port->common);
   964	       struct am65_cpsw_mqprio *p_mqprio = &port->qos.mqprio;
   965	       struct tc_mqprio_qopt_offload *mqprio;
   966	       u32 tx_prio_map = 0, rx_prio_map;
   967	       int i, fifo;
   968	
   969	       mqprio = &p_mqprio->mqprio_hw;
   970	       rx_prio_map = readl(host->port_base + AM65_CPSW_PN_REG_RX_PRI_MAP);
   971	
   972	       if (p_mqprio->enable) {
   973	               for (i = 0; i < AM65_CPSW_PN_TC_NUM; i++) {
   974	                       fifo = mqprio->qopt.prio_tc_map[i];
   975	                       tx_prio_map |= fifo << (4 * i);
   976	               }
   977	
   978	               netdev_set_num_tc(port->ndev, mqprio->qopt.num_tc);
   979	               for (i = 0; i < mqprio->qopt.num_tc; i++) {
   980	                       netdev_set_tc_queue(port->ndev, i,
   981	                                           mqprio->qopt.count[i],
   982	                                           mqprio->qopt.offset[i]);
   983	                       if (!i) {
 > 984	+                               p_mqprio->tc0_q = mqprio->qopt.offset[i];
   985	+                               rx_prio_map &= ~(0x7 << (4 * p_mqprio->tc0_q));
   986	                       }
   987	               }
   988	       } else {
   989	               /* restore default configuration */
   990	               netdev_reset_tc(port->ndev);
   991	               tx_prio_map = AM65_CPSW_PN_TX_PRI_MAP_DEFAULT;
   992	               rx_prio_map |= p_mqprio->tc0_q << (4 * p_mqprio->tc0_q);
   993	               p_mqprio->tc0_q = 0;
   994	       }
   995	
   996	       writel(tx_prio_map,
   997	              port->port_base + AM65_CPSW_PN_REG_TX_PRI_MAP);
   998	       writel(rx_prio_map,
   999	              host->port_base + AM65_CPSW_PN_REG_RX_PRI_MAP);
  1000	
  1001	       am65_cpsw_tx_pn_shaper_apply(port);
  1002	}
  1003	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
