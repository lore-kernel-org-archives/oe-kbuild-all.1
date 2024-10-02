Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9AE7E0E9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 06:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727851683; cv=none; b=jJuNGEc6j2qCUwOt4MEqgfxYvJ020IpZnjKG57T5jnMkdmLEAtdH1yqVf/ECDRs6DuuStOyZHlU4uJigAdLjTRR36p3jsqyCv5eToUrtXV3tG0SpGkd9dHzU+RDai46ILVTREzbhcOWHii52TgpBtT8IjgcpEue0aPg4oWAXejM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727851683; c=relaxed/simple;
	bh=mkIQYMkqAjkg401wXRD35Alq3pPOL8VeVIkPju83uTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fAUuEUsXCnA05BGCZp+RlIVIzMtO5LUhYeSbotaxOpxpihBkCks/JilEl4lcGXjwztrjOEJslzo8IuU/vib9MoUD+qn8ukKv2MQ2hidwL5PmocK2wfyzCGLTLwK42SXUIe9axfwOntRStncTg+MB8zpGsLayGVvecIvd7q/gbB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3V9uZrF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3V9uZrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727851681; x=1759387681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mkIQYMkqAjkg401wXRD35Alq3pPOL8VeVIkPju83uTg=;
  b=f3V9uZrF4qn1mdUuwM1HmAyvj+9B8hMq5s+YqbW3pzMHXBIcoGwyS0IQ
   +3k4jtA8cnEcrz97I21J4aBsNDeHzXFMtO/pQtNjf72cG5jHrF04Egvr/
   2AUdoOo35XtcW4RoFCdUtxvkQZ/DSEyZxbC6KYpHtzI6/8Q3I6dtrKUN+
   y7lf/mQWRNBLnJN0GNH+yjg5P0aJAf20qLmizO5K/fgjhiiw2JZ9G5Zfa
   nAs2kSU6o/jqmgNBey/xUG15unTGWQ9WldSSSHbw2f8Ibh/xLHFjjL3zC
   blqvwK8bDCYlcvSo523lvgZ/iDa5EXPO/Wi8zr3xqQxfRiOvdCLNQaZ86
   A==;
X-CSE-ConnectionGUID: +LLNFGhMTgmsnzROPMOsrA==
X-CSE-MsgGUID: Ly082Q54Tau0736/l5C7aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="14632363"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="14632363"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 23:47:58 -0700
X-CSE-ConnectionGUID: Y/UY+H21SHqPgkBwRz4z/A==
X-CSE-MsgGUID: IQOcuPGNQPahsaOlDqlWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="104714441"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Oct 2024 23:47:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svt9P-000Rdr-0t;
	Wed, 02 Oct 2024 06:47:55 +0000
Date: Wed, 2 Oct 2024 14:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15272/20658]
 drivers/media/platform/camx/cam_isp/isp_hw_mgr/hw_utils/cam_isp_packet_parser.c:490:38:
 warning: variable 'hdl' set but not used
Message-ID: <202410021421.wf2gVIvk-lkp@intel.com>
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
commit: 3c18a5506b400f3a6d21511a20407a31a73d988a [15272/20658] CHROMIUM: media: camx: remove secure buffer handling
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410021421.wf2gVIvk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021421.wf2gVIvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021421.wf2gVIvk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/camx/cam_isp/isp_hw_mgr/hw_utils/cam_isp_packet_parser.c:16:
   In file included from drivers/media/platform/camx/cam_req_mgr/cam_mem_mgr.h:18:
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
>> drivers/media/platform/camx/cam_isp/isp_hw_mgr/hw_utils/cam_isp_packet_parser.c:490:38: warning: variable 'hdl' set but not used [-Wunused-but-set-variable]
     490 |         int32_t                             hdl;
         |                                             ^
   6 warnings generated.


vim +/hdl +490 drivers/media/platform/camx/cam_isp/isp_hw_mgr/hw_utils/cam_isp_packet_parser.c

a68e071161903c Stephen Boyd       2021-06-23  461  
a68e071161903c Stephen Boyd       2021-06-23  462  int cam_isp_add_io_buffers(
a68e071161903c Stephen Boyd       2021-06-23  463  	int                                   iommu_hdl,
a68e071161903c Stephen Boyd       2021-06-23  464  	int                                   sec_iommu_hdl,
a68e071161903c Stephen Boyd       2021-06-23  465  	struct cam_hw_prepare_update_args    *prepare,
a68e071161903c Stephen Boyd       2021-06-23  466  	uint32_t                              base_idx,
a68e071161903c Stephen Boyd       2021-06-23  467  	struct cam_kmd_buf_info              *kmd_buf_info,
a68e071161903c Stephen Boyd       2021-06-23  468  	struct cam_ife_hw_mgr_res            *res_list_isp_out,
a68e071161903c Stephen Boyd       2021-06-23  469  	struct list_head                     *res_list_ife_in_rd,
a68e071161903c Stephen Boyd       2021-06-23  470  	uint32_t                              size_isp_out,
a68e071161903c Stephen Boyd       2021-06-23  471  	bool                                  fill_fence,
a68e071161903c Stephen Boyd       2021-06-23  472  	unsigned long                         *res_bitmap,
a68e071161903c Stephen Boyd       2021-06-23  473  	cam_fill_res_bitmap                   fill_res_bitmap)
a68e071161903c Stephen Boyd       2021-06-23  474  {
a68e071161903c Stephen Boyd       2021-06-23  475  	int rc = 0;
a68e071161903c Stephen Boyd       2021-06-23  476  	uint64_t                            io_addr[CAM_PACKET_MAX_PLANES];
a68e071161903c Stephen Boyd       2021-06-23  477  	struct cam_buf_io_cfg              *io_cfg;
a68e071161903c Stephen Boyd       2021-06-23  478  	struct cam_isp_resource_node       *res;
a68e071161903c Stephen Boyd       2021-06-23  479  	struct cam_ife_hw_mgr_res          *hw_mgr_res;
a68e071161903c Stephen Boyd       2021-06-23  480  	struct cam_isp_hw_get_cmd_update    update_buf;
a68e071161903c Stephen Boyd       2021-06-23  481  	struct cam_isp_hw_get_wm_update     wm_update;
a68e071161903c Stephen Boyd       2021-06-23  482  	struct cam_isp_hw_get_wm_update     bus_rd_update;
a68e071161903c Stephen Boyd       2021-06-23  483  	struct cam_hw_fence_map_entry      *out_map_entries;
a68e071161903c Stephen Boyd       2021-06-23  484  	struct cam_hw_fence_map_entry      *in_map_entries;
a68e071161903c Stephen Boyd       2021-06-23  485  	uint32_t                            kmd_buf_remain_size;
a68e071161903c Stephen Boyd       2021-06-23  486  	uint32_t                            i, j, num_out_buf, num_in_buf;
a68e071161903c Stephen Boyd       2021-06-23  487  	uint32_t                            io_cfg_used_bytes, num_ent;
a68e071161903c Stephen Boyd       2021-06-23  488  	u32                                 res_id_out, plane_id;
a68e071161903c Stephen Boyd       2021-06-23  489  	size_t                              size;
a68e071161903c Stephen Boyd       2021-06-23 @490  	int32_t                             hdl;
a68e071161903c Stephen Boyd       2021-06-23  491  	int                                 mmu_hdl;
3c18a5506b400f Sergey Senozhatsky 2023-12-07  492  	bool                                mode;
a68e071161903c Stephen Boyd       2021-06-23  493  	uint64_t                            req_id;
a68e071161903c Stephen Boyd       2021-06-23  494  
a68e071161903c Stephen Boyd       2021-06-23  495  	io_cfg = (struct cam_buf_io_cfg *) ((uint8_t *)
a68e071161903c Stephen Boyd       2021-06-23  496  			&prepare->packet->payload +
a68e071161903c Stephen Boyd       2021-06-23  497  			prepare->packet->io_configs_offset);
a68e071161903c Stephen Boyd       2021-06-23  498  	num_out_buf = 0;
a68e071161903c Stephen Boyd       2021-06-23  499  	num_in_buf  = 0;
a68e071161903c Stephen Boyd       2021-06-23  500  	io_cfg_used_bytes = 0;
a68e071161903c Stephen Boyd       2021-06-23  501  	prepare->pf_data->packet = prepare->packet;
a68e071161903c Stephen Boyd       2021-06-23  502  	req_id = prepare->packet->header.request_id;
a68e071161903c Stephen Boyd       2021-06-23  503  
a68e071161903c Stephen Boyd       2021-06-23  504  	/* Max one hw entries required for each base */
a68e071161903c Stephen Boyd       2021-06-23  505  	if (prepare->num_hw_update_entries + 1 >=
a68e071161903c Stephen Boyd       2021-06-23  506  			prepare->max_hw_update_entries) {
a68e071161903c Stephen Boyd       2021-06-23  507  		CAM_ERR(CAM_ISP, "Insufficient  HW entries :%d %d",
a68e071161903c Stephen Boyd       2021-06-23  508  			prepare->num_hw_update_entries,
a68e071161903c Stephen Boyd       2021-06-23  509  			prepare->max_hw_update_entries);
a68e071161903c Stephen Boyd       2021-06-23  510  		return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  511  	}
a68e071161903c Stephen Boyd       2021-06-23  512  
a68e071161903c Stephen Boyd       2021-06-23  513  	for (i = 0; i < prepare->packet->num_io_configs; i++) {
a68e071161903c Stephen Boyd       2021-06-23  514  		CAM_DBG(CAM_ISP, "======= io config idx %d ============", i);
a68e071161903c Stephen Boyd       2021-06-23  515  		CAM_DBG(CAM_REQ,
a68e071161903c Stephen Boyd       2021-06-23  516  			"i %d req_id %llu resource_type:%d fence:%d direction %d",
a68e071161903c Stephen Boyd       2021-06-23  517  			i, req_id,
a68e071161903c Stephen Boyd       2021-06-23  518  			io_cfg[i].resource_type, io_cfg[i].fence,
a68e071161903c Stephen Boyd       2021-06-23  519  			io_cfg[i].direction);
a68e071161903c Stephen Boyd       2021-06-23  520  		CAM_DBG(CAM_ISP, "format: %d", io_cfg[i].format);
a68e071161903c Stephen Boyd       2021-06-23  521  
a68e071161903c Stephen Boyd       2021-06-23  522  		if (io_cfg[i].direction == CAM_BUF_OUTPUT) {
a68e071161903c Stephen Boyd       2021-06-23  523  			res_id_out = io_cfg[i].resource_type & 0xFF;
a68e071161903c Stephen Boyd       2021-06-23  524  			if (res_id_out >= size_isp_out) {
a68e071161903c Stephen Boyd       2021-06-23  525  				CAM_ERR(CAM_ISP, "invalid out restype:%x",
a68e071161903c Stephen Boyd       2021-06-23  526  					io_cfg[i].resource_type);
a68e071161903c Stephen Boyd       2021-06-23  527  				return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  528  			}
a68e071161903c Stephen Boyd       2021-06-23  529  
a68e071161903c Stephen Boyd       2021-06-23  530  			CAM_DBG(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  531  				"configure output io with fill fence %d",
a68e071161903c Stephen Boyd       2021-06-23  532  				fill_fence);
a68e071161903c Stephen Boyd       2021-06-23  533  			out_map_entries =
a68e071161903c Stephen Boyd       2021-06-23  534  				&prepare->out_map_entries[num_out_buf];
a68e071161903c Stephen Boyd       2021-06-23  535  			if (fill_fence) {
a68e071161903c Stephen Boyd       2021-06-23  536  				if (num_out_buf <
a68e071161903c Stephen Boyd       2021-06-23  537  					prepare->max_out_map_entries) {
a68e071161903c Stephen Boyd       2021-06-23  538  					out_map_entries->resource_handle =
a68e071161903c Stephen Boyd       2021-06-23  539  						io_cfg[i].resource_type;
a68e071161903c Stephen Boyd       2021-06-23  540  					out_map_entries->sync_id =
a68e071161903c Stephen Boyd       2021-06-23  541  						io_cfg[i].fence;
a68e071161903c Stephen Boyd       2021-06-23  542  					num_out_buf++;
a68e071161903c Stephen Boyd       2021-06-23  543  				} else {
a68e071161903c Stephen Boyd       2021-06-23  544  					CAM_ERR(CAM_ISP, "ln_out:%d max_ln:%d",
a68e071161903c Stephen Boyd       2021-06-23  545  						num_out_buf,
a68e071161903c Stephen Boyd       2021-06-23  546  						prepare->max_out_map_entries);
a68e071161903c Stephen Boyd       2021-06-23  547  					return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  548  				}
a68e071161903c Stephen Boyd       2021-06-23  549  			}
a68e071161903c Stephen Boyd       2021-06-23  550  
a68e071161903c Stephen Boyd       2021-06-23  551  			hw_mgr_res = &res_list_isp_out[res_id_out];
a68e071161903c Stephen Boyd       2021-06-23  552  			if (hw_mgr_res->res_type == CAM_IFE_HW_MGR_RES_UNINIT) {
a68e071161903c Stephen Boyd       2021-06-23  553  				CAM_ERR(CAM_ISP, "io res id:%d not valid",
a68e071161903c Stephen Boyd       2021-06-23  554  					io_cfg[i].resource_type);
a68e071161903c Stephen Boyd       2021-06-23  555  				return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  556  			}
a68e071161903c Stephen Boyd       2021-06-23  557  		} else if (io_cfg[i].direction == CAM_BUF_INPUT) {
a68e071161903c Stephen Boyd       2021-06-23  558  			CAM_DBG(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  559  				"configure input io with fill fence %d",
a68e071161903c Stephen Boyd       2021-06-23  560  				fill_fence);
a68e071161903c Stephen Boyd       2021-06-23  561  			if (!list_empty(res_list_ife_in_rd)) {
a68e071161903c Stephen Boyd       2021-06-23  562  				hw_mgr_res =
a68e071161903c Stephen Boyd       2021-06-23  563  					list_first_entry(res_list_ife_in_rd,
a68e071161903c Stephen Boyd       2021-06-23  564  					struct cam_ife_hw_mgr_res, list);
a68e071161903c Stephen Boyd       2021-06-23  565  			} else {
a68e071161903c Stephen Boyd       2021-06-23  566  				CAM_ERR(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  567  					"No IFE in Read resource");
a68e071161903c Stephen Boyd       2021-06-23  568  				return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  569  			}
a68e071161903c Stephen Boyd       2021-06-23  570  			in_map_entries =
a68e071161903c Stephen Boyd       2021-06-23  571  				&prepare->in_map_entries[num_in_buf];
a68e071161903c Stephen Boyd       2021-06-23  572  			if (fill_fence) {
a68e071161903c Stephen Boyd       2021-06-23  573  				if (num_in_buf < prepare->max_in_map_entries) {
a68e071161903c Stephen Boyd       2021-06-23  574  					in_map_entries->resource_handle =
a68e071161903c Stephen Boyd       2021-06-23  575  						io_cfg[i].resource_type;
a68e071161903c Stephen Boyd       2021-06-23  576  					in_map_entries->sync_id =
a68e071161903c Stephen Boyd       2021-06-23  577  						io_cfg[i].fence;
a68e071161903c Stephen Boyd       2021-06-23  578  					num_in_buf++;
a68e071161903c Stephen Boyd       2021-06-23  579  				} else {
a68e071161903c Stephen Boyd       2021-06-23  580  					CAM_ERR(CAM_ISP, "ln_in:%d imax_ln:%d",
a68e071161903c Stephen Boyd       2021-06-23  581  						num_in_buf,
a68e071161903c Stephen Boyd       2021-06-23  582  						prepare->max_in_map_entries);
a68e071161903c Stephen Boyd       2021-06-23  583  					return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  584  				}
a68e071161903c Stephen Boyd       2021-06-23  585  			}
a68e071161903c Stephen Boyd       2021-06-23  586  		} else {
a68e071161903c Stephen Boyd       2021-06-23  587  			CAM_ERR(CAM_ISP, "Invalid io config direction :%d",
a68e071161903c Stephen Boyd       2021-06-23  588  				io_cfg[i].direction);
a68e071161903c Stephen Boyd       2021-06-23  589  			return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  590  		}
a68e071161903c Stephen Boyd       2021-06-23  591  
a68e071161903c Stephen Boyd       2021-06-23  592  		CAM_DBG(CAM_ISP, "setup mem io");
a68e071161903c Stephen Boyd       2021-06-23  593  		for (j = 0; j < CAM_ISP_HW_SPLIT_MAX &&
a68e071161903c Stephen Boyd       2021-06-23  594  			io_cfg[i].direction == CAM_BUF_OUTPUT; j++) {
a68e071161903c Stephen Boyd       2021-06-23  595  			if (!hw_mgr_res->hw_res[j])
a68e071161903c Stephen Boyd       2021-06-23  596  				continue;
a68e071161903c Stephen Boyd       2021-06-23  597  
a68e071161903c Stephen Boyd       2021-06-23  598  			if (hw_mgr_res->hw_res[j]->hw_intf->hw_idx != base_idx)
a68e071161903c Stephen Boyd       2021-06-23  599  				continue;
a68e071161903c Stephen Boyd       2021-06-23  600  
a68e071161903c Stephen Boyd       2021-06-23  601  			res = hw_mgr_res->hw_res[j];
a68e071161903c Stephen Boyd       2021-06-23  602  			if (res->res_id != io_cfg[i].resource_type) {
a68e071161903c Stephen Boyd       2021-06-23  603  				CAM_ERR(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  604  					"wm err res id:%d io res id:%d",
a68e071161903c Stephen Boyd       2021-06-23  605  					res->res_id, io_cfg[i].resource_type);
a68e071161903c Stephen Boyd       2021-06-23  606  				return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  607  			}
a68e071161903c Stephen Boyd       2021-06-23  608  
a68e071161903c Stephen Boyd       2021-06-23  609  			memset(io_addr, 0, sizeof(io_addr));
a68e071161903c Stephen Boyd       2021-06-23  610  
a68e071161903c Stephen Boyd       2021-06-23  611  			for (plane_id = 0; plane_id < CAM_PACKET_MAX_PLANES;
a68e071161903c Stephen Boyd       2021-06-23  612  						plane_id++) {
a68e071161903c Stephen Boyd       2021-06-23  613  				if (!io_cfg[i].mem_handle[plane_id])
a68e071161903c Stephen Boyd       2021-06-23  614  					break;
a68e071161903c Stephen Boyd       2021-06-23  615  
a68e071161903c Stephen Boyd       2021-06-23  616  				hdl = io_cfg[i].mem_handle[plane_id];
a68e071161903c Stephen Boyd       2021-06-23  617  				if (res->process_cmd(res,
a68e071161903c Stephen Boyd       2021-06-23  618  						CAM_ISP_HW_CMD_GET_SECURE_MODE,
a68e071161903c Stephen Boyd       2021-06-23  619  						&mode,
a68e071161903c Stephen Boyd       2021-06-23  620  						sizeof(bool)))
a68e071161903c Stephen Boyd       2021-06-23  621  					return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  622  
3c18a5506b400f Sergey Senozhatsky 2023-12-07  623  				if (mode == CAM_SECURE_MODE_NON_SECURE) {
a68e071161903c Stephen Boyd       2021-06-23  624  					mmu_hdl = iommu_hdl;
a68e071161903c Stephen Boyd       2021-06-23  625  				} else {
a68e071161903c Stephen Boyd       2021-06-23  626  					CAM_ERR_RATE_LIMIT(CAM_ISP,
3c18a5506b400f Sergey Senozhatsky 2023-12-07  627  						"Invalid hdl: port mode[%u]",
3c18a5506b400f Sergey Senozhatsky 2023-12-07  628  						mode);
a68e071161903c Stephen Boyd       2021-06-23  629  					return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  630  				}
a68e071161903c Stephen Boyd       2021-06-23  631  
a68e071161903c Stephen Boyd       2021-06-23  632  				rc = cam_mem_get_io_buf(
a68e071161903c Stephen Boyd       2021-06-23  633  					io_cfg[i].mem_handle[plane_id],
a68e071161903c Stephen Boyd       2021-06-23  634  					mmu_hdl, &io_addr[plane_id], &size);
a68e071161903c Stephen Boyd       2021-06-23  635  				if (rc) {
a68e071161903c Stephen Boyd       2021-06-23  636  					CAM_ERR(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  637  						"no io addr for plane%d Bufhdl:%d, Size =%d",
a68e071161903c Stephen Boyd       2021-06-23  638  						plane_id,
a68e071161903c Stephen Boyd       2021-06-23  639  						io_cfg[i].mem_handle[plane_id],
a68e071161903c Stephen Boyd       2021-06-23  640  						(int)size);
a68e071161903c Stephen Boyd       2021-06-23  641  					CAM_ERR(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  642  						"Port i %d Reqid %llu res_type:%d fence:%d dir %d",
a68e071161903c Stephen Boyd       2021-06-23  643  						i, req_id,
a68e071161903c Stephen Boyd       2021-06-23  644  						io_cfg[i].resource_type,
a68e071161903c Stephen Boyd       2021-06-23  645  						io_cfg[i].fence,
a68e071161903c Stephen Boyd       2021-06-23  646  						io_cfg[i].direction);
a68e071161903c Stephen Boyd       2021-06-23  647  					rc = -ENOMEM;
a68e071161903c Stephen Boyd       2021-06-23  648  					return rc;
a68e071161903c Stephen Boyd       2021-06-23  649  				}
a68e071161903c Stephen Boyd       2021-06-23  650  
a68e071161903c Stephen Boyd       2021-06-23  651  				if (j == 0) {
a68e071161903c Stephen Boyd       2021-06-23  652  					rc = cam_packet_validate_plane_size(
a68e071161903c Stephen Boyd       2021-06-23  653  							&io_cfg[i],
a68e071161903c Stephen Boyd       2021-06-23  654  							plane_id,
a68e071161903c Stephen Boyd       2021-06-23  655  							size);
a68e071161903c Stephen Boyd       2021-06-23  656  					if (rc) {
a68e071161903c Stephen Boyd       2021-06-23  657  						CAM_ERR(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  658  						"Invalid buffer size, port 0x%x plane %d req_id %llu format %d memh 0x%x",
a68e071161903c Stephen Boyd       2021-06-23  659  						io_cfg[i].resource_type,
a68e071161903c Stephen Boyd       2021-06-23  660  						plane_id,
a68e071161903c Stephen Boyd       2021-06-23  661  						req_id,
a68e071161903c Stephen Boyd       2021-06-23  662  						io_cfg[i].format,
a68e071161903c Stephen Boyd       2021-06-23  663  						io_cfg[i].mem_handle[plane_id]);
a68e071161903c Stephen Boyd       2021-06-23  664  						return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  665  					}
a68e071161903c Stephen Boyd       2021-06-23  666  				}
a68e071161903c Stephen Boyd       2021-06-23  667  
a68e071161903c Stephen Boyd       2021-06-23  668  				/* need to update with offset */
a68e071161903c Stephen Boyd       2021-06-23  669  				io_addr[plane_id] +=
a68e071161903c Stephen Boyd       2021-06-23  670  						io_cfg[i].offsets[plane_id];
a68e071161903c Stephen Boyd       2021-06-23  671  				CAM_DBG(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  672  					"get io_addr for plane %d: 0x%llx, mem_hdl=0x%x",
a68e071161903c Stephen Boyd       2021-06-23  673  					plane_id, io_addr[plane_id],
a68e071161903c Stephen Boyd       2021-06-23  674  					io_cfg[i].mem_handle[plane_id]);
a68e071161903c Stephen Boyd       2021-06-23  675  
a68e071161903c Stephen Boyd       2021-06-23  676  				CAM_DBG(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  677  					"mmu_hdl=0x%x, size=%d, end=0x%llx",
a68e071161903c Stephen Boyd       2021-06-23  678  					mmu_hdl, (int)size,
a68e071161903c Stephen Boyd       2021-06-23  679  					io_addr[plane_id]+size);
a68e071161903c Stephen Boyd       2021-06-23  680  
a68e071161903c Stephen Boyd       2021-06-23  681  			}
a68e071161903c Stephen Boyd       2021-06-23  682  			if (!plane_id) {
a68e071161903c Stephen Boyd       2021-06-23  683  				CAM_ERR(CAM_ISP, "No valid planes for res%d",
a68e071161903c Stephen Boyd       2021-06-23  684  					res->res_id);
a68e071161903c Stephen Boyd       2021-06-23  685  				rc = -ENOMEM;
a68e071161903c Stephen Boyd       2021-06-23  686  				return rc;
a68e071161903c Stephen Boyd       2021-06-23  687  			}
a68e071161903c Stephen Boyd       2021-06-23  688  
a68e071161903c Stephen Boyd       2021-06-23  689  			if ((kmd_buf_info->used_bytes + io_cfg_used_bytes) <
a68e071161903c Stephen Boyd       2021-06-23  690  				kmd_buf_info->size) {
a68e071161903c Stephen Boyd       2021-06-23  691  				kmd_buf_remain_size = kmd_buf_info->size -
a68e071161903c Stephen Boyd       2021-06-23  692  					(kmd_buf_info->used_bytes +
a68e071161903c Stephen Boyd       2021-06-23  693  					io_cfg_used_bytes);
a68e071161903c Stephen Boyd       2021-06-23  694  			} else {
a68e071161903c Stephen Boyd       2021-06-23  695  				CAM_ERR(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  696  					"no free kmd memory for base %d",
a68e071161903c Stephen Boyd       2021-06-23  697  					base_idx);
a68e071161903c Stephen Boyd       2021-06-23  698  				rc = -ENOMEM;
a68e071161903c Stephen Boyd       2021-06-23  699  				return rc;
a68e071161903c Stephen Boyd       2021-06-23  700  			}
a68e071161903c Stephen Boyd       2021-06-23  701  			update_buf.res = res;
a68e071161903c Stephen Boyd       2021-06-23  702  			update_buf.cmd_type = CAM_ISP_HW_CMD_GET_BUF_UPDATE;
a68e071161903c Stephen Boyd       2021-06-23  703  			update_buf.cmd.cmd_buf_addr = kmd_buf_info->cpu_addr +
a68e071161903c Stephen Boyd       2021-06-23  704  				kmd_buf_info->used_bytes/4 +
a68e071161903c Stephen Boyd       2021-06-23  705  					io_cfg_used_bytes/4;
a68e071161903c Stephen Boyd       2021-06-23  706  			wm_update.image_buf = io_addr;
a68e071161903c Stephen Boyd       2021-06-23  707  			wm_update.num_buf   = plane_id;
a68e071161903c Stephen Boyd       2021-06-23  708  			wm_update.io_cfg    = &io_cfg[i];
a68e071161903c Stephen Boyd       2021-06-23  709  			update_buf.cmd.size = kmd_buf_remain_size;
a68e071161903c Stephen Boyd       2021-06-23  710  			update_buf.wm_update = &wm_update;
a68e071161903c Stephen Boyd       2021-06-23  711  
a68e071161903c Stephen Boyd       2021-06-23  712  			CAM_DBG(CAM_ISP, "cmd buffer 0x%pK, size %d",
a68e071161903c Stephen Boyd       2021-06-23  713  				update_buf.cmd.cmd_buf_addr,
a68e071161903c Stephen Boyd       2021-06-23  714  				update_buf.cmd.size);
a68e071161903c Stephen Boyd       2021-06-23  715  			rc = res->hw_intf->hw_ops.process_cmd(
a68e071161903c Stephen Boyd       2021-06-23  716  				res->hw_intf->hw_priv,
a68e071161903c Stephen Boyd       2021-06-23  717  				CAM_ISP_HW_CMD_GET_BUF_UPDATE, &update_buf,
a68e071161903c Stephen Boyd       2021-06-23  718  				sizeof(struct cam_isp_hw_get_cmd_update));
a68e071161903c Stephen Boyd       2021-06-23  719  
a68e071161903c Stephen Boyd       2021-06-23  720  			if (rc) {
a68e071161903c Stephen Boyd       2021-06-23  721  				CAM_ERR(CAM_ISP, "get buf cmd error:%d",
a68e071161903c Stephen Boyd       2021-06-23  722  					res->res_id);
a68e071161903c Stephen Boyd       2021-06-23  723  				rc = -ENOMEM;
a68e071161903c Stephen Boyd       2021-06-23  724  				return rc;
a68e071161903c Stephen Boyd       2021-06-23  725  			}
a68e071161903c Stephen Boyd       2021-06-23  726  			io_cfg_used_bytes += update_buf.cmd.used_bytes;
a68e071161903c Stephen Boyd       2021-06-23  727  		}
a68e071161903c Stephen Boyd       2021-06-23  728  		for (j = 0; j < CAM_ISP_HW_SPLIT_MAX &&
a68e071161903c Stephen Boyd       2021-06-23  729  			io_cfg[i].direction == CAM_BUF_INPUT; j++) {
a68e071161903c Stephen Boyd       2021-06-23  730  			if (!hw_mgr_res->hw_res[j])
a68e071161903c Stephen Boyd       2021-06-23  731  				continue;
a68e071161903c Stephen Boyd       2021-06-23  732  
a68e071161903c Stephen Boyd       2021-06-23  733  			if (hw_mgr_res->hw_res[j]->hw_intf->hw_idx != base_idx)
a68e071161903c Stephen Boyd       2021-06-23  734  				continue;
a68e071161903c Stephen Boyd       2021-06-23  735  
a68e071161903c Stephen Boyd       2021-06-23  736  			res = hw_mgr_res->hw_res[j];
a68e071161903c Stephen Boyd       2021-06-23  737  
a68e071161903c Stephen Boyd       2021-06-23  738  			memset(io_addr, 0, sizeof(io_addr));
a68e071161903c Stephen Boyd       2021-06-23  739  
a68e071161903c Stephen Boyd       2021-06-23  740  			for (plane_id = 0; plane_id < CAM_PACKET_MAX_PLANES;
a68e071161903c Stephen Boyd       2021-06-23  741  						plane_id++) {
a68e071161903c Stephen Boyd       2021-06-23  742  				if (!io_cfg[i].mem_handle[plane_id])
a68e071161903c Stephen Boyd       2021-06-23  743  					break;
a68e071161903c Stephen Boyd       2021-06-23  744  
a68e071161903c Stephen Boyd       2021-06-23  745  				hdl = io_cfg[i].mem_handle[plane_id];
a68e071161903c Stephen Boyd       2021-06-23  746  				if (res->process_cmd(res,
a68e071161903c Stephen Boyd       2021-06-23  747  						CAM_ISP_HW_CMD_GET_SECURE_MODE,
a68e071161903c Stephen Boyd       2021-06-23  748  						&mode,
a68e071161903c Stephen Boyd       2021-06-23  749  						sizeof(bool)))
a68e071161903c Stephen Boyd       2021-06-23  750  					return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  751  
3c18a5506b400f Sergey Senozhatsky 2023-12-07  752  				if (mode == CAM_SECURE_MODE_NON_SECURE) {
a68e071161903c Stephen Boyd       2021-06-23  753  					mmu_hdl = iommu_hdl;
a68e071161903c Stephen Boyd       2021-06-23  754  				} else {
a68e071161903c Stephen Boyd       2021-06-23  755  					CAM_ERR_RATE_LIMIT(CAM_ISP,
3c18a5506b400f Sergey Senozhatsky 2023-12-07  756  						"Invalid hdl: port mode[%u]",
3c18a5506b400f Sergey Senozhatsky 2023-12-07  757  						mode);
a68e071161903c Stephen Boyd       2021-06-23  758  					return -EINVAL;
a68e071161903c Stephen Boyd       2021-06-23  759  				}
a68e071161903c Stephen Boyd       2021-06-23  760  
a68e071161903c Stephen Boyd       2021-06-23  761  				rc = cam_mem_get_io_buf(
a68e071161903c Stephen Boyd       2021-06-23  762  					io_cfg[i].mem_handle[plane_id],
a68e071161903c Stephen Boyd       2021-06-23  763  					mmu_hdl, &io_addr[plane_id], &size);
a68e071161903c Stephen Boyd       2021-06-23  764  				if (rc) {
a68e071161903c Stephen Boyd       2021-06-23  765  					CAM_ERR(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  766  						"no io addr for plane%d",
a68e071161903c Stephen Boyd       2021-06-23  767  						plane_id);
a68e071161903c Stephen Boyd       2021-06-23  768  					rc = -ENOMEM;
a68e071161903c Stephen Boyd       2021-06-23  769  					return rc;
a68e071161903c Stephen Boyd       2021-06-23  770  				}
a68e071161903c Stephen Boyd       2021-06-23  771  
a68e071161903c Stephen Boyd       2021-06-23  772  				/* need to update with offset */
a68e071161903c Stephen Boyd       2021-06-23  773  				io_addr[plane_id] +=
a68e071161903c Stephen Boyd       2021-06-23  774  						io_cfg[i].offsets[plane_id];
a68e071161903c Stephen Boyd       2021-06-23  775  				CAM_DBG(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  776  					"get io_addr for plane %d: 0x%llx, mem_hdl=0x%x",
a68e071161903c Stephen Boyd       2021-06-23  777  					plane_id, io_addr[plane_id],
a68e071161903c Stephen Boyd       2021-06-23  778  					io_cfg[i].mem_handle[plane_id]);
a68e071161903c Stephen Boyd       2021-06-23  779  
a68e071161903c Stephen Boyd       2021-06-23  780  				CAM_DBG(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  781  					"mmu_hdl=0x%x, size=%d, end=0x%llx",
a68e071161903c Stephen Boyd       2021-06-23  782  					mmu_hdl, (int)size,
a68e071161903c Stephen Boyd       2021-06-23  783  					io_addr[plane_id]+size);
a68e071161903c Stephen Boyd       2021-06-23  784  
a68e071161903c Stephen Boyd       2021-06-23  785  			}
a68e071161903c Stephen Boyd       2021-06-23  786  			if (!plane_id) {
a68e071161903c Stephen Boyd       2021-06-23  787  				CAM_ERR(CAM_ISP, "No valid planes for res%d",
a68e071161903c Stephen Boyd       2021-06-23  788  					res->res_id);
a68e071161903c Stephen Boyd       2021-06-23  789  				rc = -ENOMEM;
a68e071161903c Stephen Boyd       2021-06-23  790  				return rc;
a68e071161903c Stephen Boyd       2021-06-23  791  			}
a68e071161903c Stephen Boyd       2021-06-23  792  
a68e071161903c Stephen Boyd       2021-06-23  793  			if ((kmd_buf_info->used_bytes + io_cfg_used_bytes) <
a68e071161903c Stephen Boyd       2021-06-23  794  				kmd_buf_info->size) {
a68e071161903c Stephen Boyd       2021-06-23  795  				kmd_buf_remain_size = kmd_buf_info->size -
a68e071161903c Stephen Boyd       2021-06-23  796  					(kmd_buf_info->used_bytes +
a68e071161903c Stephen Boyd       2021-06-23  797  					io_cfg_used_bytes);
a68e071161903c Stephen Boyd       2021-06-23  798  			} else {
a68e071161903c Stephen Boyd       2021-06-23  799  				CAM_ERR(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  800  					"no free kmd memory for base %d",
a68e071161903c Stephen Boyd       2021-06-23  801  					base_idx);
a68e071161903c Stephen Boyd       2021-06-23  802  				rc = -ENOMEM;
a68e071161903c Stephen Boyd       2021-06-23  803  				return rc;
a68e071161903c Stephen Boyd       2021-06-23  804  			}
a68e071161903c Stephen Boyd       2021-06-23  805  			update_buf.res = res;
a68e071161903c Stephen Boyd       2021-06-23  806  			update_buf.cmd_type = CAM_ISP_HW_CMD_GET_BUF_UPDATE_RM;
a68e071161903c Stephen Boyd       2021-06-23  807  			update_buf.cmd.cmd_buf_addr = kmd_buf_info->cpu_addr +
a68e071161903c Stephen Boyd       2021-06-23  808  				kmd_buf_info->used_bytes/4 +
a68e071161903c Stephen Boyd       2021-06-23  809  					io_cfg_used_bytes/4;
a68e071161903c Stephen Boyd       2021-06-23  810  			bus_rd_update.image_buf = io_addr;
a68e071161903c Stephen Boyd       2021-06-23  811  			bus_rd_update.num_buf   = plane_id;
a68e071161903c Stephen Boyd       2021-06-23  812  			bus_rd_update.io_cfg    = &io_cfg[i];
a68e071161903c Stephen Boyd       2021-06-23  813  			update_buf.cmd.size = kmd_buf_remain_size;
a68e071161903c Stephen Boyd       2021-06-23  814  			update_buf.rm_update = &bus_rd_update;
a68e071161903c Stephen Boyd       2021-06-23  815  
a68e071161903c Stephen Boyd       2021-06-23  816  			CAM_DBG(CAM_ISP, "cmd buffer 0x%pK, size %d",
a68e071161903c Stephen Boyd       2021-06-23  817  				update_buf.cmd.cmd_buf_addr,
a68e071161903c Stephen Boyd       2021-06-23  818  				update_buf.cmd.size);
a68e071161903c Stephen Boyd       2021-06-23  819  			rc = res->hw_intf->hw_ops.process_cmd(
a68e071161903c Stephen Boyd       2021-06-23  820  				res->hw_intf->hw_priv,
a68e071161903c Stephen Boyd       2021-06-23  821  				CAM_ISP_HW_CMD_GET_BUF_UPDATE_RM, &update_buf,
a68e071161903c Stephen Boyd       2021-06-23  822  				sizeof(struct cam_isp_hw_get_cmd_update));
a68e071161903c Stephen Boyd       2021-06-23  823  
a68e071161903c Stephen Boyd       2021-06-23  824  			if (rc) {
a68e071161903c Stephen Boyd       2021-06-23  825  				CAM_ERR(CAM_ISP, "get buf cmd error:%d",
a68e071161903c Stephen Boyd       2021-06-23  826  					res->res_id);
a68e071161903c Stephen Boyd       2021-06-23  827  				rc = -ENOMEM;
a68e071161903c Stephen Boyd       2021-06-23  828  				return rc;
a68e071161903c Stephen Boyd       2021-06-23  829  			}
a68e071161903c Stephen Boyd       2021-06-23  830  			io_cfg_used_bytes += update_buf.cmd.used_bytes;
a68e071161903c Stephen Boyd       2021-06-23  831  		}
a68e071161903c Stephen Boyd       2021-06-23  832  
a68e071161903c Stephen Boyd       2021-06-23  833  		fill_res_bitmap(io_cfg[i].resource_type, res_bitmap);
a68e071161903c Stephen Boyd       2021-06-23  834  	}
a68e071161903c Stephen Boyd       2021-06-23  835  
a68e071161903c Stephen Boyd       2021-06-23  836  	CAM_DBG(CAM_ISP, "io_cfg_used_bytes %d, fill_fence %d",
a68e071161903c Stephen Boyd       2021-06-23  837  		io_cfg_used_bytes, fill_fence);
a68e071161903c Stephen Boyd       2021-06-23  838  	if (io_cfg_used_bytes) {
a68e071161903c Stephen Boyd       2021-06-23  839  		/* Update the HW entries */
a68e071161903c Stephen Boyd       2021-06-23  840  		num_ent = prepare->num_hw_update_entries;
a68e071161903c Stephen Boyd       2021-06-23  841  		prepare->hw_update_entries[num_ent].handle =
a68e071161903c Stephen Boyd       2021-06-23  842  					kmd_buf_info->handle;
a68e071161903c Stephen Boyd       2021-06-23  843  		prepare->hw_update_entries[num_ent].len = io_cfg_used_bytes;
a68e071161903c Stephen Boyd       2021-06-23  844  		prepare->hw_update_entries[num_ent].offset =
a68e071161903c Stephen Boyd       2021-06-23  845  			kmd_buf_info->offset;
a68e071161903c Stephen Boyd       2021-06-23  846  		prepare->hw_update_entries[num_ent].flags = CAM_ISP_IOCFG_BL;
a68e071161903c Stephen Boyd       2021-06-23  847  
a68e071161903c Stephen Boyd       2021-06-23  848  		CAM_DBG(CAM_ISP,
a68e071161903c Stephen Boyd       2021-06-23  849  			"num_ent=%d handle=0x%x, len=%u, offset=%u",
a68e071161903c Stephen Boyd       2021-06-23  850  			num_ent,
a68e071161903c Stephen Boyd       2021-06-23  851  			prepare->hw_update_entries[num_ent].handle,
a68e071161903c Stephen Boyd       2021-06-23  852  			prepare->hw_update_entries[num_ent].len,
a68e071161903c Stephen Boyd       2021-06-23  853  			prepare->hw_update_entries[num_ent].offset);
a68e071161903c Stephen Boyd       2021-06-23  854  		num_ent++;
a68e071161903c Stephen Boyd       2021-06-23  855  
a68e071161903c Stephen Boyd       2021-06-23  856  		kmd_buf_info->used_bytes += io_cfg_used_bytes;
a68e071161903c Stephen Boyd       2021-06-23  857  		kmd_buf_info->offset     += io_cfg_used_bytes;
a68e071161903c Stephen Boyd       2021-06-23  858  		prepare->num_hw_update_entries = num_ent;
a68e071161903c Stephen Boyd       2021-06-23  859  	}
a68e071161903c Stephen Boyd       2021-06-23  860  
a68e071161903c Stephen Boyd       2021-06-23  861  	if (fill_fence) {
a68e071161903c Stephen Boyd       2021-06-23  862  		prepare->num_out_map_entries = num_out_buf;
a68e071161903c Stephen Boyd       2021-06-23  863  		prepare->num_in_map_entries  = num_in_buf;
a68e071161903c Stephen Boyd       2021-06-23  864  	}
a68e071161903c Stephen Boyd       2021-06-23  865  
a68e071161903c Stephen Boyd       2021-06-23  866  	return rc;
a68e071161903c Stephen Boyd       2021-06-23  867  }
a68e071161903c Stephen Boyd       2021-06-23  868  

:::::: The code at line 490 was first introduced by commit
:::::: a68e071161903c15ed4b233026b6e8079b9caf8d CHROMIUM: media: add camx drivers

:::::: TO: Stephen Boyd <swboyd@chromium.org>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
