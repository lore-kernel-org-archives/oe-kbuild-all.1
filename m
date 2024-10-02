Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37052940D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 03:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727840630; cv=none; b=E75BIh1dlqqRSj/rg9d0nOf1tboalmMyUzs4/2Ev31yy3wYdzCOA7dg5qLNd6IRHLOc9VCA6T9eXY75Xt7z0VaN2e7rTe8ddbga4FZ3r0gZw5+ajeaJTgp+8tXXXGUWLkAldjYgJqniVPFmY/8jQl3glKPSuiNYvluCSNOHysmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727840630; c=relaxed/simple;
	bh=jyKW6RDagElAvMMCIMDX1Pnuak8Rb75uh/10JN5G2U0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ecVDn46qNAYx/y8RnKMgqnnabTlWFLjE9hjeJVKmFaMGKmZpXB3X5mKWEv+MFm1uPIk/o1V6Q/mV+IyPNnttW5MKMB55cfhkyWBL5gWj9zxoB7hvWudTMkLtrYQtMk8AvcynNn966wRor/jk8I7nN0b8P+y4WGAG8qiDxlC/Iu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJ00HC0N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJ00HC0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727840628; x=1759376628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jyKW6RDagElAvMMCIMDX1Pnuak8Rb75uh/10JN5G2U0=;
  b=BJ00HC0NPbkHVL3NDnnoc0KkzUhrAvxTnHl2vXnID2CMibgfpfR+G58V
   qI0AqtBAeHol9qKTqtgmNxdC8FGjre8lyoZ1hQbVr2EZSyhlmyw5qWdTV
   UuS3wTw+ZTj4nicLkDO+eHQhUAGqSdnxDqmAavRiutzQ8KBe1SMWPKswt
   3KhhpwDzgbAOzW4VLGn72FQiFK6KjgF9pgjeGo4Pa81+BvREPBuoherTo
   UTcr6NzOYote7OYSfvn2nyv+BALbNZYBL0I1hjN3l06MUt16WTfViU1ia
   3yzdHVr5A45ZsGAC1vK019sygTxcRpYSV/hO/DT7knhl+SNVQ4MULQS6x
   w==;
X-CSE-ConnectionGUID: lHqzwk3lQfa9ma6MkE5T0A==
X-CSE-MsgGUID: oxCxfZIcTgaZKaYZtorDsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26873801"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26873801"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 20:43:47 -0700
X-CSE-ConnectionGUID: JYVzDuZxSfWcMnP9qjWclw==
X-CSE-MsgGUID: UqgZkF+rQ5ekKyAcBulVgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="78298846"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Oct 2024 20:43:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svqH9-000RVy-1t;
	Wed, 02 Oct 2024 03:43:43 +0000
Date: Wed, 2 Oct 2024 11:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15248/20658]
 drivers/media/platform/camx/cam_isp/isp_hw_mgr/cam_ife_hw_mgr.c:2042:37:
 warning: variable 'total_rdi_port' set but not used
Message-ID: <202410021134.KlLp2Dtl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   a81f127d7432274edb73f16568b5b097fca99d2a
commit: a68e071161903c15ed4b233026b6e8079b9caf8d [15248/20658] CHROMIUM: media: add camx drivers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410021134.KlLp2Dtl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021134.KlLp2Dtl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021134.KlLp2Dtl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/camx/cam_isp/isp_hw_mgr/cam_ife_hw_mgr.c:22:
   In file included from drivers/media/platform/camx/cam_smmu/cam_smmu_api.h:19:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2222:
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
>> drivers/media/platform/camx/cam_isp/isp_hw_mgr/cam_ife_hw_mgr.c:2042:37: warning: variable 'total_rdi_port' set but not used [-Wunused-but-set-variable]
    2042 |         uint32_t                           total_rdi_port = 0;
         |                                            ^
   drivers/media/platform/camx/cam_isp/isp_hw_mgr/cam_ife_hw_mgr.c:2190:37: warning: variable 'total_rdi_port' set but not used [-Wunused-but-set-variable]
    2190 |         uint32_t                           total_rdi_port = 0;
         |                                            ^
   7 warnings generated.
--
   In file included from drivers/media/platform/camx/cam_sensor_module/cam_csiphy/cam_csiphy_soc.c:14:
   In file included from drivers/media/platform/camx/cam_sensor_module/cam_csiphy/cam_csiphy_soc.h:23:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2222:
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
>> drivers/media/platform/camx/cam_sensor_module/cam_csiphy/cam_csiphy_soc.c:47:4: warning: 'snprintf' will always be truncated; specified size is 12, but format string expands to at least 13 [-Wformat-truncation]
      47 |                         snprintf(p_str, 12, "0x%08x: ",
         |                         ^
   drivers/media/platform/camx/cam_sensor_module/cam_csiphy/cam_csiphy_soc.c:52:3: warning: 'snprintf' will always be truncated; specified size is 9, but format string expands to at least 10 [-Wformat-truncation]
      52 |                 snprintf(p_str, 9, "%08x ", data);
         |                 ^
   7 warnings generated.


vim +/total_rdi_port +2042 drivers/media/platform/camx/cam_isp/isp_hw_mgr/cam_ife_hw_mgr.c

  2028	
  2029	/* entry function: acquire_hw */
  2030	static int cam_ife_mgr_acquire_hw(void *hw_mgr_priv, void *acquire_hw_args)
  2031	{
  2032		struct cam_ife_hw_mgr *ife_hw_mgr            = hw_mgr_priv;
  2033		struct cam_hw_acquire_args *acquire_args     = acquire_hw_args;
  2034		int rc                                       = -1;
  2035		int i, j;
  2036		struct cam_ife_hw_mgr_ctx         *ife_ctx;
  2037		struct cam_isp_in_port_info       *in_port = NULL;
  2038		struct cam_cdm_acquire_data        cdm_acquire;
  2039		uint32_t                           num_pix_port_per_in = 0;
  2040		uint32_t                           num_rdi_port_per_in = 0;
  2041		uint32_t                           total_pix_port = 0;
> 2042		uint32_t                           total_rdi_port = 0;
  2043		uint32_t                           in_port_length = 0;
  2044		uint32_t                           total_in_port_length = 0;
  2045		struct cam_isp_acquire_hw_info    *acquire_hw_info = NULL;
  2046	
  2047		CAM_DBG(CAM_ISP, "Enter...");
  2048	
  2049		if (!acquire_args || acquire_args->num_acq <= 0) {
  2050			CAM_ERR(CAM_ISP, "Nothing to acquire. Seems like error");
  2051			return -EINVAL;
  2052		}
  2053	
  2054		/* get the ife ctx */
  2055		rc = cam_ife_hw_mgr_get_ctx(&ife_hw_mgr->free_ctx_list, &ife_ctx);
  2056		if (rc || !ife_ctx) {
  2057			CAM_ERR(CAM_ISP, "Get ife hw context failed");
  2058			goto err;
  2059		}
  2060	
  2061		ife_ctx->common.cb_priv = acquire_args->context_data;
  2062		for (i = 0; i < CAM_ISP_HW_EVENT_MAX; i++)
  2063			ife_ctx->common.event_cb[i] = acquire_args->event_cb;
  2064	
  2065		ife_ctx->hw_mgr = ife_hw_mgr;
  2066	
  2067	
  2068		memcpy(cdm_acquire.identifier, "ife", sizeof("ife"));
  2069		cdm_acquire.cell_index = 0;
  2070		cdm_acquire.handle = 0;
  2071		cdm_acquire.userdata = ife_ctx;
  2072		cdm_acquire.base_array_cnt = CAM_IFE_HW_NUM_MAX;
  2073		for (i = 0, j = 0; i < CAM_IFE_HW_NUM_MAX; i++) {
  2074			if (ife_hw_mgr->cdm_reg_map[i])
  2075				cdm_acquire.base_array[j++] =
  2076					ife_hw_mgr->cdm_reg_map[i];
  2077		}
  2078		cdm_acquire.base_array_cnt = j;
  2079	
  2080		cdm_acquire.id = CAM_CDM_VIRTUAL;
  2081		cdm_acquire.cam_cdm_callback = cam_ife_cam_cdm_callback;
  2082		rc = cam_cdm_acquire(&cdm_acquire);
  2083		if (rc) {
  2084			CAM_ERR(CAM_ISP, "Failed to acquire the CDM HW");
  2085			goto free_ctx;
  2086		}
  2087	
  2088		CAM_DBG(CAM_ISP, "Successfully acquired the CDM HW hdl=%x",
  2089			cdm_acquire.handle);
  2090		ife_ctx->cdm_handle = cdm_acquire.handle;
  2091		ife_ctx->cdm_ops = cdm_acquire.ops;
  2092	
  2093		acquire_hw_info =
  2094			(struct cam_isp_acquire_hw_info *)acquire_args->acquire_info;
  2095	
  2096		rc = cam_ife_mgr_check_and_update_fe(ife_ctx, acquire_hw_info,
  2097			acquire_args->acquire_info_size);
  2098		if (rc) {
  2099			CAM_ERR(CAM_ISP, "buffer size is not enough");
  2100			goto free_cdm;
  2101		}
  2102	
  2103		in_port = (struct cam_isp_in_port_info *)
  2104			((uint8_t *)&acquire_hw_info->data +
  2105			 acquire_hw_info->input_info_offset);
  2106	
  2107		/* acquire HW resources */
  2108		for (i = 0; i < acquire_hw_info->num_inputs; i++) {
  2109	
  2110			if ((in_port->num_out_res > CAM_IFE_HW_OUT_RES_MAX) ||
  2111				(in_port->num_out_res <= 0)) {
  2112				CAM_ERR(CAM_ISP, "Invalid num output res %u",
  2113					in_port->num_out_res);
  2114				rc = -EINVAL;
  2115				goto free_res;
  2116			}
  2117	
  2118			in_port_length = sizeof(struct cam_isp_in_port_info) +
  2119				(in_port->num_out_res - 1) *
  2120				sizeof(struct cam_isp_out_port_info);
  2121			total_in_port_length += in_port_length;
  2122	
  2123			if (total_in_port_length > acquire_hw_info->input_info_size) {
  2124				CAM_ERR(CAM_ISP, "buffer size is not enough");
  2125				rc = -EINVAL;
  2126				goto free_res;
  2127			}
  2128			CAM_DBG(CAM_ISP, "in_res_type %x", in_port->res_type);
  2129			rc = cam_ife_mgr_acquire_hw_for_ctx(ife_ctx, in_port,
  2130				&num_pix_port_per_in, &num_rdi_port_per_in);
  2131			total_pix_port += num_pix_port_per_in;
  2132			total_rdi_port += num_rdi_port_per_in;
  2133	
  2134			if (rc) {
  2135				CAM_ERR(CAM_ISP, "can not acquire resource");
  2136				goto free_res;
  2137			}
  2138			in_port = (struct cam_isp_in_port_info *)((uint8_t *)in_port +
  2139				in_port_length);
  2140		}
  2141	
  2142		/* Check whether context has only RDI resource */
  2143		if (!total_pix_port) {
  2144			ife_ctx->is_rdi_only_context = 1;
  2145			CAM_DBG(CAM_ISP, "RDI only context");
  2146		}
  2147	
  2148		/* Process base info */
  2149		rc = cam_ife_mgr_process_base_info(ife_ctx);
  2150		if (rc) {
  2151			CAM_ERR(CAM_ISP, "Process base info failed");
  2152			goto free_res;
  2153		}
  2154	
  2155		acquire_args->ctxt_to_hw_map = ife_ctx;
  2156		ife_ctx->ctx_in_use = 1;
  2157	
  2158		cam_ife_hw_mgr_put_ctx(&ife_hw_mgr->used_ctx_list, &ife_ctx);
  2159	
  2160		CAM_DBG(CAM_ISP, "Exit...(success)");
  2161	
  2162		return 0;
  2163	free_res:
  2164		/*Dump all the current acquired resources */
  2165		cam_ife_hw_mgr_dump_all_ctx(ife_ctx);
  2166		cam_ife_hw_mgr_release_hw_for_ctx(ife_ctx);
  2167	free_cdm:
  2168		cam_cdm_release(ife_ctx->cdm_handle);
  2169	free_ctx:
  2170		cam_ife_hw_mgr_put_ctx(&ife_hw_mgr->free_ctx_list, &ife_ctx);
  2171	err:
  2172		CAM_DBG(CAM_ISP, "Exit...(rc=%d)", rc);
  2173		return rc;
  2174	}
  2175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
