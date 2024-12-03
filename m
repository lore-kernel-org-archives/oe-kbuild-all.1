Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF44317555
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 02:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733194640; cv=none; b=qsVL4r6E49hPyOBx4EziB8sEknJxRWf3Ul1KpWD9mpq6TU4OmVtXAmkql21y+P4xsjYhBtIw8aUtTrUBAncSEA7QvyBbUqcJ6O+HtH60h3eZ30OwLA5TAd/nFZSQlklPvV1Jl+BBDMjIVVJHqvHRnrnEl+zRFjVwhgXPft2TUA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733194640; c=relaxed/simple;
	bh=m5ryFSwnvdNvxxwUCKwyRqxMG0zw8YBns5qC88y6gmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7p5UbYRPtJCiQ5bqXysTMsascaNL8GCtPNmAMgk1XSArt+KmfAHvtM045O3dL6lnfwpjOWG5PyOb8t37gBWgIaRcYGCx+KwjR6welXhtFKRIjX4MKU8EFkKZuLABeFLAwDflME3jvxSwDnj0SQe1fQzFl92aoEeceiMLctrcsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSaHkR0n; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSaHkR0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733194639; x=1764730639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5ryFSwnvdNvxxwUCKwyRqxMG0zw8YBns5qC88y6gmA=;
  b=gSaHkR0nEp+VLBWc06PJxpHvO2jGxfKHc7BvhI8eFmhlTr6o4piO+GPR
   NzXS3w70Z0SaCpz3NnIUemZwsHMYNvH22U1paBqUqwwRzkLyv4C4A9g/V
   iPZEpvvWROS1k0oeOwW1fWK+E9EV1D+dGHgFuwzrWk5ixljMAjiS3cb2I
   BeXmwyz7uTj6EQj5HrOYJnvT+ePhMeq7Cqhck3gkAq+WafiWdhffgPd7L
   Byq1f4ih0HTetsgjUFeoz1JA+ejAPDWOFnVVIQi7kbK0J5zgS1sC6ZNme
   UWgcQAJAvspqV8PZmdYWZ5r62hPPbVA7TGBeBBeT9NuMkpkJMj52ZmJo8
   g==;
X-CSE-ConnectionGUID: pAbdpfH4Q+CP20eI2ghGjg==
X-CSE-MsgGUID: HTLaOrmsS1OvoDsy6m2tNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33309181"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33309181"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 18:57:17 -0800
X-CSE-ConnectionGUID: +xidHXRATriWZPI6sZYlSQ==
X-CSE-MsgGUID: XA4EJJXuTtW1ft8XsIjJog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93191632"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2024 18:57:15 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIJ60-0003CV-2N;
	Tue, 03 Dec 2024 02:57:08 +0000
Date: Tue, 3 Dec 2024 10:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, tianx <tianx@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/net/ethernet/yunsilicon/xsc/pci/main.c:613:19: error: no member
 named 'physfn' in 'struct pci_dev'
Message-ID: <202412031055.Ln9fvImq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   020e0507954f21291b7b3a0a280128270a0d8959
commit: 23b8024ef459f8b615c223df6175ea17c6b50c48 [2516/2516] drivers: update yunsilicon drivers to version 1.1.0.375
config: x86_64-randconfig-r063-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031055.Ln9fvImq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031055.Ln9fvImq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031055.Ln9fvImq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/main.c:6:
   In file included from drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:11:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1579:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/main.c:6:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/main.c:13:
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/devlink.h:9:
   include/net/devlink.h:28:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      28 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:29:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:136:4: warning: no previous prototype for function 'xsc_devid_to_pcie_no' [-Wmissing-prototypes]
     136 | u8 xsc_devid_to_pcie_no(int dev_id)
         |    ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:136:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     136 | u8 xsc_devid_to_pcie_no(int dev_id)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:288:5: warning: no previous prototype for function 'xsc_priv_init' [-Wmissing-prototypes]
     288 | int xsc_priv_init(struct xsc_core_device *dev)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     288 | int xsc_priv_init(struct xsc_core_device *dev)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:302:5: warning: no previous prototype for function 'xsc_dev_res_init' [-Wmissing-prototypes]
     302 | int xsc_dev_res_init(struct xsc_core_device *dev)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:302:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     302 | int xsc_dev_res_init(struct xsc_core_device *dev)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:321:6: warning: no previous prototype for function 'xsc_dev_res_cleanup' [-Wmissing-prototypes]
     321 | void xsc_dev_res_cleanup(struct xsc_core_device *dev)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:321:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     321 | void xsc_dev_res_cleanup(struct xsc_core_device *dev)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:327:6: warning: no previous prototype for function 'xsc_init_reg_addr' [-Wmissing-prototypes]
     327 | void xsc_init_reg_addr(struct xsc_core_device *dev)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:327:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     327 | void xsc_init_reg_addr(struct xsc_core_device *dev)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:519:5: warning: no previous prototype for function 'xsc_reset_function_resource' [-Wmissing-prototypes]
     519 | int xsc_reset_function_resource(struct xsc_core_device *dev)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:519:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     519 | int xsc_reset_function_resource(struct xsc_core_device *dev)
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/pci/main.c:613:19: error: no member named 'physfn' in 'struct pci_dev'
     613 |                 if (!dev->pdev->physfn) {
         |                      ~~~~~~~~~  ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:719:5: warning: no previous prototype for function 'xsc_load_one' [-Wmissing-prototypes]
     719 | int xsc_load_one(struct xsc_core_device *dev, bool boot)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:719:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     719 | int xsc_load_one(struct xsc_core_device *dev, bool boot)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:801:5: warning: no previous prototype for function 'xsc_unload_one' [-Wmissing-prototypes]
     801 | int xsc_unload_one(struct xsc_core_device *dev, bool cleanup)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:801:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     801 | int xsc_unload_one(struct xsc_core_device *dev, bool cleanup)
         | ^
         | static 
   16 warnings and 1 error generated.
--
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c:10:
   In file included from include/linux/mm.h:1579:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c:12:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c:440:18: error: no member named 'physfn' in 'struct pci_dev'
     440 |         if (!dev->pdev->physfn)    /*for vf passthrough vm*/
         |              ~~~~~~~~~  ^
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c:443:38: error: no member named 'physfn' in 'struct pci_dev'
     443 |         pf_dev = pci_get_drvdata(dev->pdev->physfn);
         |                                  ~~~~~~~~~  ^
   6 warnings and 2 errors generated.


vim +613 drivers/net/ethernet/yunsilicon/xsc/pci/main.c

   518	
 > 519	int xsc_reset_function_resource(struct xsc_core_device *dev)
   520	{
   521		struct xsc_function_reset_mbox_in in;
   522		struct xsc_function_reset_mbox_out out;
   523		int err;
   524	
   525		memset(&in, 0, sizeof(in));
   526		in.hdr.opcode = cpu_to_be16(XSC_CMD_OP_FUNCTION_RESET);
   527		in.glb_func_id = cpu_to_be16(dev->glb_func_id);
   528		err = xsc_cmd_exec(dev, &in, sizeof(in), &out, sizeof(out));
   529		if (err || out.hdr.status)
   530			return -EINVAL;
   531	
   532		return 0;
   533	}
   534	
   535	static int xsc_fpga_not_supported(struct xsc_core_device *dev)
   536	{
   537	#define FPGA_VERSION_H 0x100
   538		u32 ver_h;
   539	
   540		if (!xsc_core_is_pf(dev))
   541			return 0;
   542	
   543		ver_h = REG_RD32(dev, HIF_CPM_CHIP_VERSION_H_REG_ADDR);
   544		if (ver_h != FPGA_VERSION_H) {
   545			xsc_core_err(dev, "fpga version 0x%x not supported\n", ver_h);
   546			return 1;
   547		}
   548	
   549		return 0;
   550	}
   551	
   552	static int xsc_init_once(struct xsc_core_device *dev)
   553	{
   554		int err;
   555	
   556	#ifndef COSIM
   557		err = xsc_cmd_init(dev);
   558		if (err) {
   559			xsc_core_err(dev, "Failed initializing command interface, aborting\n");
   560			goto err_cmd_init;
   561		}
   562	#endif
   563	#ifdef RUN_WITH_PSV
   564		err = xsc_cmd_query_psv_funcid(dev, &dev->caps);
   565		if (err) {
   566			xsc_core_err(dev, "Failed to query psv funcid, err=%d\n", err);
   567			goto err_cmdq_ver_chk;
   568		}
   569	
   570		dev->glb_func_id = xsc_get_glb_func_id(dev);
   571	#endif
   572	
   573		err = xsc_check_cmdq_version(dev);
   574		if (err) {
   575			xsc_core_err(dev, "Failed to check cmdq version\n");
   576			goto err_cmdq_ver_chk;
   577		}
   578	
   579		err = xsc_cmd_query_hca_cap(dev, &dev->caps);
   580		if (err) {
   581			xsc_core_err(dev, "Failed to query hca, err=%d\n", err);
   582			goto err_cmdq_ver_chk;
   583		}
   584	
   585		err = xsc_reset_function_resource(dev);
   586		if (err) {
   587			xsc_core_err(dev, "Failed to reset function resource\n");
   588			goto err_cmdq_ver_chk;
   589		}
   590	
   591		err = xsc_get_board_id(dev);
   592		if (err) {
   593			xsc_core_err(dev, "Failed to get board id, err=%d\n", err);
   594			goto err_cmdq_ver_chk;
   595		}
   596		if (xsc_core_is_pf(dev)) {
   597			err = xsc_pci_calc_pf_port(dev);
   598			if (err) {
   599				xsc_core_err(dev, "Failed to xsc_pci_calc_pf_port\n");
   600				goto err_cmdq_ver_chk;
   601			}
   602			err = xsc_create_res(dev);
   603			if (err) {
   604				xsc_core_err(dev, "Failed to create resource, err=%d\n", err);
   605				goto err_cmdq_ver_chk;
   606			}
   607		} else {
   608			err = xsc_pci_calc_vf_port(dev);
   609			if (err) {
   610				xsc_core_err(dev, "Failed to xsc_pci_calc_vf_port\n");
   611				goto err_cmdq_ver_chk;
   612			}
 > 613			if (!dev->pdev->physfn) {
   614				err = xsc_create_res(dev);
   615				if (err) {
   616					xsc_core_err(dev, "Failed to create resource, err=%d\n", err);
   617					goto err_cmdq_ver_chk;
   618				}
   619			}
   620		}
   621	
   622		xsc_init_cq_table(dev);
   623		xsc_init_qp_table(dev);
   624		xsc_eq_init(dev);
   625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
