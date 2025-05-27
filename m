Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CDD189B80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748370021; cv=none; b=VqkQBYf5/AwQ6NBIPP0iYQyFdUmCtL3S6/C5Hiz7CfJweBgkb48fCf18F/redojwYwqqpsdehfD6jftRmOYtHmChGhVTQJnXl65JYSQhheClCjjEC2nQhRRZ/rrO4G7ZbcG5DJaWfgkG2DD8bbt49/jquMU03W+BsEXT04frE6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748370021; c=relaxed/simple;
	bh=+gGejJtujKijVGuB2mCHVV5SWkDvqcDk9M4KmtYwoaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N1iXy0Ebgcaphul1ow3+7dLm/dYnm+/GMGNzMlX+HF2JwEbdsiqABk6AxOwm6VEIEeJMg/LncH5L4sOODRsKTSqS1cw29a09TiapkMhCi1ujFYg36yw8qEbjYF6QJE47rHqhxTFrg8WDqISB3e3JPlpGZUrMOeL3a2OTAppunnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFb2VWpo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFb2VWpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748370020; x=1779906020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+gGejJtujKijVGuB2mCHVV5SWkDvqcDk9M4KmtYwoaQ=;
  b=eFb2VWpoZj56OgyfheCA4sH1M7K6iGUaRnR9QgVNhbJfv6js9Eos1N1R
   sILJKN5tsGdIMI9Hn0bYYuv3DsaZyfX0LI3+nSN56/SrgogeygPowT1Io
   ckkCrPr/JunuedGJwSFnOX1fiVPUcNggXzT4QfE/uBIBA+Bbi9CFpfL4N
   16KvrvnMRvZOmHEp6FZdZ3Ip1Ijowc4QDTcFEqd51+6TGxOIl3tJ18ept
   HpnwRlrAYsrt/wy3huF6+iFfJB8SXPYPge6/o2ulOdxWtALDaX9PE6Bkn
   GTO0qWN0LMnOtRbGkXxxhQC8sizzaSXvodAjx0wTJWhQ13JLIaP3xpEsF
   A==;
X-CSE-ConnectionGUID: JrNJ24j7Q1yCidf1YsCbkA==
X-CSE-MsgGUID: 874q5mMJQ4SIci7669vmeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61429022"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61429022"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:20:19 -0700
X-CSE-ConnectionGUID: wiH5F8e2QxakJHtQQeU5aA==
X-CSE-MsgGUID: armKeUqnToOlcM0hu2vUZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143381288"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 May 2025 11:20:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJyuN-000Ute-0r;
	Tue, 27 May 2025 18:20:15 +0000
Date: Wed, 28 May 2025 02:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/interconnect/mediatek/mmqos-vcp.c:34:7: error: incompatible pointer
 to integer conversion assigning to 'phys_addr_t' (aka 'unsigned long long')
 from 'void *'
Message-ID: <202505280219.BJ0eQuvW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a8b155e1dd30a4460ca0bf9db35d30ab891d3e91
commit: eccfdd41c59e6c97a4c21756bee8492092bb7506 [133/133] CHROMIUM: mmqos: add the mtk-interconnect to support mmqos
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505280219.BJ0eQuvW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280219.BJ0eQuvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280219.BJ0eQuvW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/interconnect/mediatek/mmqos-mtk.c:21:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2194:
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
>> drivers/interconnect/mediatek/mmqos-mtk.c:487:6: warning: no previous prototype for function 'clear_reg_value' [-Wmissing-prototypes]
     487 | void clear_reg_value(bool is_on, struct mtk_mmqos *mmqos)
         |      ^
   drivers/interconnect/mediatek/mmqos-mtk.c:487:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     487 | void clear_reg_value(bool is_on, struct mtk_mmqos *mmqos)
         | ^
         | static 
>> drivers/interconnect/mediatek/mmqos-mtk.c:496:6: warning: no previous prototype for function 'set_channel_bw_reg_value' [-Wmissing-prototypes]
     496 | void set_channel_bw_reg_value(bool is_on, struct mtk_mmqos *mmqos)
         |      ^
   drivers/interconnect/mediatek/mmqos-mtk.c:496:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     496 | void set_channel_bw_reg_value(bool is_on, struct mtk_mmqos *mmqos)
         | ^
         | static 
>> drivers/interconnect/mediatek/mmqos-mtk.c:1473:5: warning: no previous prototype for function 'mtk_mmqos_probe' [-Wmissing-prototypes]
    1473 | int mtk_mmqos_probe(struct platform_device *pdev)
         |     ^
   drivers/interconnect/mediatek/mmqos-mtk.c:1473:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1473 | int mtk_mmqos_probe(struct platform_device *pdev)
         | ^
         | static 
>> drivers/interconnect/mediatek/mmqos-mtk.c:1854:22: warning: variable 'kthr_vcp' set but not used [-Wunused-but-set-variable]
    1854 |         struct task_struct *kthr_vcp;
         |                             ^
>> drivers/interconnect/mediatek/mmqos-mtk.c:2016:16: warning: no previous prototype for function 'get_larb_dev' [-Wmissing-prototypes]
    2016 | struct device *get_larb_dev(int larb_id)
         |                ^
   drivers/interconnect/mediatek/mmqos-mtk.c:2016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2016 | struct device *get_larb_dev(int larb_id)
         | ^
         | static 
>> drivers/interconnect/mediatek/mmqos-mtk.c:2052:6: warning: variable 'result' set but not used [-Wunused-but-set-variable]
    2052 |         int result;
         |             ^
>> drivers/interconnect/mediatek/mmqos-mtk.c:2047:5: warning: no previous prototype for function 'mmqos_set_larb_port_ostdl' [-Wmissing-prototypes]
    2047 | int mmqos_set_larb_port_ostdl(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/interconnect/mediatek/mmqos-mtk.c:2047:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2047 | int mmqos_set_larb_port_ostdl(const char *val, const struct kernel_param *kp)
         | ^
         | static 
   11 warnings generated.
--
   In file included from drivers/interconnect/mediatek/mmqos-vcp.c:9:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
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
>> drivers/interconnect/mediatek/mmqos-vcp.c:34:7: error: incompatible pointer to integer conversion assigning to 'phys_addr_t' (aka 'unsigned long long') from 'void *' [-Wint-conversion]
      34 |                 *pa = NULL;
         |                     ^ ~~~~
>> drivers/interconnect/mediatek/mmqos-vcp.c:295:5: warning: no previous prototype for function 'mmqos_get_vcp_mmqos_log' [-Wmissing-prototypes]
     295 | int mmqos_get_vcp_mmqos_log(char *buf, const struct kernel_param *kp)
         |     ^
   drivers/interconnect/mediatek/mmqos-vcp.c:295:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     295 | int mmqos_get_vcp_mmqos_log(char *buf, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/interconnect/mediatek/mmqos-vcp.c:308:5: warning: no previous prototype for function 'mmqos_set_vcp_mmqos_log' [-Wmissing-prototypes]
     308 | int mmqos_set_vcp_mmqos_log(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/interconnect/mediatek/mmqos-vcp.c:308:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     308 | int mmqos_set_vcp_mmqos_log(const char *val, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/interconnect/mediatek/mmqos-vcp.c:352:5: warning: no previous prototype for function 'mmqos_get_vcp_smi_log' [-Wmissing-prototypes]
     352 | int mmqos_get_vcp_smi_log(char *buf, const struct kernel_param *kp)
         |     ^
   drivers/interconnect/mediatek/mmqos-vcp.c:352:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     352 | int mmqos_get_vcp_smi_log(char *buf, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/interconnect/mediatek/mmqos-vcp.c:365:5: warning: no previous prototype for function 'mmqos_set_vcp_smi_log' [-Wmissing-prototypes]
     365 | int mmqos_set_vcp_smi_log(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/interconnect/mediatek/mmqos-vcp.c:365:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     365 | int mmqos_set_vcp_smi_log(const char *val, const struct kernel_param *kp)
         | ^
         | static 
   8 warnings and 1 error generated.


vim +34 drivers/interconnect/mediatek/mmqos-vcp.c

0819fee819e3ec5 Kyrie Wu 2024-09-03  26  
0819fee819e3ec5 Kyrie Wu 2024-09-03  27  void *mmqos_get_vcp_base(phys_addr_t *pa)
0819fee819e3ec5 Kyrie Wu 2024-09-03  28  {
0819fee819e3ec5 Kyrie Wu 2024-09-03  29  	struct mtk_mmqos *mmqos = NULL;
0819fee819e3ec5 Kyrie Wu 2024-09-03  30  
0819fee819e3ec5 Kyrie Wu 2024-09-03  31  	mmqos = mtk_mmqos_get_drv_data();
0819fee819e3ec5 Kyrie Wu 2024-09-03  32  	if (IS_ERR_OR_NULL(mmqos)) {
0819fee819e3ec5 Kyrie Wu 2024-09-03  33  		mmqos_err(mmqos->dev, "not ready");
0819fee819e3ec5 Kyrie Wu 2024-09-03 @34  		*pa = NULL;
0819fee819e3ec5 Kyrie Wu 2024-09-03  35  	}
0819fee819e3ec5 Kyrie Wu 2024-09-03  36  
0819fee819e3ec5 Kyrie Wu 2024-09-03  37  	if (pa)
0819fee819e3ec5 Kyrie Wu 2024-09-03  38  		*pa = mmqos->mmqos_memory_pa;
0819fee819e3ec5 Kyrie Wu 2024-09-03  39  
0819fee819e3ec5 Kyrie Wu 2024-09-03  40  	return mmqos->mmqos_memory_va;
0819fee819e3ec5 Kyrie Wu 2024-09-03  41  }
0819fee819e3ec5 Kyrie Wu 2024-09-03  42  EXPORT_SYMBOL_GPL(mmqos_get_vcp_base);
0819fee819e3ec5 Kyrie Wu 2024-09-03  43  

:::::: The code at line 34 was first introduced by commit
:::::: 0819fee819e3ec5611f4fb6c3c9e933ded83a0f5 CHROMIUM: mmqos: add the basic driver to support mmqos

:::::: TO: Kyrie Wu <kyrie.wu@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
