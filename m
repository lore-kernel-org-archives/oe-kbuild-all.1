Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E818BE0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 05:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VB00BaO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702531975; x=1734067975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SEza1KCIzEbEuDeDN2He7S9uLDcEOqYh6qA86G+7ToQ=;
  b=VB00BaO1sl3BSobvzCJdiOVlUnkWjkxM5VVKW4R7108/X4qKdMnTUfE1
   8zBEZpvIXzA5VIm245o/QLWpfRPxLA4/S7Wt1ZyFHFxPEU1AE83L/7J8w
   slAPnHYF1sWoFlf6V3qFs5uZNpT0KFOJNwiY8GzG8F3e+T8mBpjpRCDCY
   oadhHXsZo3gey6Ak7BjwquNScOKBK5kIVbJylucTeBZJ+5sZ8zzpkp8N2
   cFM+oX0KYs85sH0+Qi1La1SYoOwPgemnDNG7Fyf1dEO/Sjohu6L8wO8xo
   Almz9Fh0e0Dc4pIYfOQ6oz9kpNBAkwDTnKC352ubGg5EHlqMsL36P9UGM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8433585"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="8433585"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 21:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="892314273"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="892314273"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2023 21:32:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDeL4-000Lcp-1c;
	Thu, 14 Dec 2023 05:32:50 +0000
Date: Thu, 14 Dec 2023 13:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 5/6]
 drivers/media/platform/camx/cam_isp/isp_hw_mgr/hw_utils/cam_isp_packet_parser.c:490:38:
 warning: variable 'hdl' set but not used
Message-ID: <202312141307.3uR8kbME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   2acc2abd74d0c0d2f685294d1d6f664ca19fc944
commit: 6828e48be0be75e42c11430222a7f4acc1950e27 [5/6] CHROMIUM: media: camx: remove secure buffer handling
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231214/202312141307.3uR8kbME-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141307.3uR8kbME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141307.3uR8kbME-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/camx/cam_isp/isp_hw_mgr/hw_utils/cam_isp_packet_parser.c:490:38: warning: variable 'hdl' set but not used [-Wunused-but-set-variable]
     490 |         int32_t                             hdl;
         |                                             ^
   1 warning generated.


vim +/hdl +490 drivers/media/platform/camx/cam_isp/isp_hw_mgr/hw_utils/cam_isp_packet_parser.c

d3d9d274fb84ea Stephen Boyd       2021-06-23  461  
d3d9d274fb84ea Stephen Boyd       2021-06-23  462  int cam_isp_add_io_buffers(
d3d9d274fb84ea Stephen Boyd       2021-06-23  463  	int                                   iommu_hdl,
d3d9d274fb84ea Stephen Boyd       2021-06-23  464  	int                                   sec_iommu_hdl,
d3d9d274fb84ea Stephen Boyd       2021-06-23  465  	struct cam_hw_prepare_update_args    *prepare,
d3d9d274fb84ea Stephen Boyd       2021-06-23  466  	uint32_t                              base_idx,
d3d9d274fb84ea Stephen Boyd       2021-06-23  467  	struct cam_kmd_buf_info              *kmd_buf_info,
d3d9d274fb84ea Stephen Boyd       2021-06-23  468  	struct cam_ife_hw_mgr_res            *res_list_isp_out,
d3d9d274fb84ea Stephen Boyd       2021-06-23  469  	struct list_head                     *res_list_ife_in_rd,
d3d9d274fb84ea Stephen Boyd       2021-06-23  470  	uint32_t                              size_isp_out,
d3d9d274fb84ea Stephen Boyd       2021-06-23  471  	bool                                  fill_fence,
d3d9d274fb84ea Stephen Boyd       2021-06-23  472  	unsigned long                         *res_bitmap,
d3d9d274fb84ea Stephen Boyd       2021-06-23  473  	cam_fill_res_bitmap                   fill_res_bitmap)
d3d9d274fb84ea Stephen Boyd       2021-06-23  474  {
d3d9d274fb84ea Stephen Boyd       2021-06-23  475  	int rc = 0;
d3d9d274fb84ea Stephen Boyd       2021-06-23  476  	uint64_t                            io_addr[CAM_PACKET_MAX_PLANES];
d3d9d274fb84ea Stephen Boyd       2021-06-23  477  	struct cam_buf_io_cfg              *io_cfg;
d3d9d274fb84ea Stephen Boyd       2021-06-23  478  	struct cam_isp_resource_node       *res;
d3d9d274fb84ea Stephen Boyd       2021-06-23  479  	struct cam_ife_hw_mgr_res          *hw_mgr_res;
d3d9d274fb84ea Stephen Boyd       2021-06-23  480  	struct cam_isp_hw_get_cmd_update    update_buf;
d3d9d274fb84ea Stephen Boyd       2021-06-23  481  	struct cam_isp_hw_get_wm_update     wm_update;
d3d9d274fb84ea Stephen Boyd       2021-06-23  482  	struct cam_isp_hw_get_wm_update     bus_rd_update;
d3d9d274fb84ea Stephen Boyd       2021-06-23  483  	struct cam_hw_fence_map_entry      *out_map_entries;
d3d9d274fb84ea Stephen Boyd       2021-06-23  484  	struct cam_hw_fence_map_entry      *in_map_entries;
d3d9d274fb84ea Stephen Boyd       2021-06-23  485  	uint32_t                            kmd_buf_remain_size;
d3d9d274fb84ea Stephen Boyd       2021-06-23  486  	uint32_t                            i, j, num_out_buf, num_in_buf;
d3d9d274fb84ea Stephen Boyd       2021-06-23  487  	uint32_t                            io_cfg_used_bytes, num_ent;
d3d9d274fb84ea Stephen Boyd       2021-06-23  488  	u32                                 res_id_out, plane_id;
d3d9d274fb84ea Stephen Boyd       2021-06-23  489  	size_t                              size;
d3d9d274fb84ea Stephen Boyd       2021-06-23 @490  	int32_t                             hdl;
d3d9d274fb84ea Stephen Boyd       2021-06-23  491  	int                                 mmu_hdl;
6828e48be0be75 Sergey Senozhatsky 2023-12-07  492  	bool                                mode;
d3d9d274fb84ea Stephen Boyd       2021-06-23  493  	uint64_t                            req_id;
d3d9d274fb84ea Stephen Boyd       2021-06-23  494  
d3d9d274fb84ea Stephen Boyd       2021-06-23  495  	io_cfg = (struct cam_buf_io_cfg *) ((uint8_t *)
d3d9d274fb84ea Stephen Boyd       2021-06-23  496  			&prepare->packet->payload +
d3d9d274fb84ea Stephen Boyd       2021-06-23  497  			prepare->packet->io_configs_offset);
d3d9d274fb84ea Stephen Boyd       2021-06-23  498  	num_out_buf = 0;
d3d9d274fb84ea Stephen Boyd       2021-06-23  499  	num_in_buf  = 0;
d3d9d274fb84ea Stephen Boyd       2021-06-23  500  	io_cfg_used_bytes = 0;
d3d9d274fb84ea Stephen Boyd       2021-06-23  501  	prepare->pf_data->packet = prepare->packet;
d3d9d274fb84ea Stephen Boyd       2021-06-23  502  	req_id = prepare->packet->header.request_id;
d3d9d274fb84ea Stephen Boyd       2021-06-23  503  
d3d9d274fb84ea Stephen Boyd       2021-06-23  504  	/* Max one hw entries required for each base */
d3d9d274fb84ea Stephen Boyd       2021-06-23  505  	if (prepare->num_hw_update_entries + 1 >=
d3d9d274fb84ea Stephen Boyd       2021-06-23  506  			prepare->max_hw_update_entries) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  507  		CAM_ERR(CAM_ISP, "Insufficient  HW entries :%d %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  508  			prepare->num_hw_update_entries,
d3d9d274fb84ea Stephen Boyd       2021-06-23  509  			prepare->max_hw_update_entries);
d3d9d274fb84ea Stephen Boyd       2021-06-23  510  		return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  511  	}
d3d9d274fb84ea Stephen Boyd       2021-06-23  512  
d3d9d274fb84ea Stephen Boyd       2021-06-23  513  	for (i = 0; i < prepare->packet->num_io_configs; i++) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  514  		CAM_DBG(CAM_ISP, "======= io config idx %d ============", i);
d3d9d274fb84ea Stephen Boyd       2021-06-23  515  		CAM_DBG(CAM_REQ,
d3d9d274fb84ea Stephen Boyd       2021-06-23  516  			"i %d req_id %llu resource_type:%d fence:%d direction %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  517  			i, req_id,
d3d9d274fb84ea Stephen Boyd       2021-06-23  518  			io_cfg[i].resource_type, io_cfg[i].fence,
d3d9d274fb84ea Stephen Boyd       2021-06-23  519  			io_cfg[i].direction);
d3d9d274fb84ea Stephen Boyd       2021-06-23  520  		CAM_DBG(CAM_ISP, "format: %d", io_cfg[i].format);
d3d9d274fb84ea Stephen Boyd       2021-06-23  521  
d3d9d274fb84ea Stephen Boyd       2021-06-23  522  		if (io_cfg[i].direction == CAM_BUF_OUTPUT) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  523  			res_id_out = io_cfg[i].resource_type & 0xFF;
d3d9d274fb84ea Stephen Boyd       2021-06-23  524  			if (res_id_out >= size_isp_out) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  525  				CAM_ERR(CAM_ISP, "invalid out restype:%x",
d3d9d274fb84ea Stephen Boyd       2021-06-23  526  					io_cfg[i].resource_type);
d3d9d274fb84ea Stephen Boyd       2021-06-23  527  				return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  528  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  529  
d3d9d274fb84ea Stephen Boyd       2021-06-23  530  			CAM_DBG(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  531  				"configure output io with fill fence %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  532  				fill_fence);
d3d9d274fb84ea Stephen Boyd       2021-06-23  533  			out_map_entries =
d3d9d274fb84ea Stephen Boyd       2021-06-23  534  				&prepare->out_map_entries[num_out_buf];
d3d9d274fb84ea Stephen Boyd       2021-06-23  535  			if (fill_fence) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  536  				if (num_out_buf <
d3d9d274fb84ea Stephen Boyd       2021-06-23  537  					prepare->max_out_map_entries) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  538  					out_map_entries->resource_handle =
d3d9d274fb84ea Stephen Boyd       2021-06-23  539  						io_cfg[i].resource_type;
d3d9d274fb84ea Stephen Boyd       2021-06-23  540  					out_map_entries->sync_id =
d3d9d274fb84ea Stephen Boyd       2021-06-23  541  						io_cfg[i].fence;
d3d9d274fb84ea Stephen Boyd       2021-06-23  542  					num_out_buf++;
d3d9d274fb84ea Stephen Boyd       2021-06-23  543  				} else {
d3d9d274fb84ea Stephen Boyd       2021-06-23  544  					CAM_ERR(CAM_ISP, "ln_out:%d max_ln:%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  545  						num_out_buf,
d3d9d274fb84ea Stephen Boyd       2021-06-23  546  						prepare->max_out_map_entries);
d3d9d274fb84ea Stephen Boyd       2021-06-23  547  					return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  548  				}
d3d9d274fb84ea Stephen Boyd       2021-06-23  549  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  550  
d3d9d274fb84ea Stephen Boyd       2021-06-23  551  			hw_mgr_res = &res_list_isp_out[res_id_out];
d3d9d274fb84ea Stephen Boyd       2021-06-23  552  			if (hw_mgr_res->res_type == CAM_IFE_HW_MGR_RES_UNINIT) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  553  				CAM_ERR(CAM_ISP, "io res id:%d not valid",
d3d9d274fb84ea Stephen Boyd       2021-06-23  554  					io_cfg[i].resource_type);
d3d9d274fb84ea Stephen Boyd       2021-06-23  555  				return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  556  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  557  		} else if (io_cfg[i].direction == CAM_BUF_INPUT) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  558  			CAM_DBG(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  559  				"configure input io with fill fence %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  560  				fill_fence);
d3d9d274fb84ea Stephen Boyd       2021-06-23  561  			if (!list_empty(res_list_ife_in_rd)) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  562  				hw_mgr_res =
d3d9d274fb84ea Stephen Boyd       2021-06-23  563  					list_first_entry(res_list_ife_in_rd,
d3d9d274fb84ea Stephen Boyd       2021-06-23  564  					struct cam_ife_hw_mgr_res, list);
d3d9d274fb84ea Stephen Boyd       2021-06-23  565  			} else {
d3d9d274fb84ea Stephen Boyd       2021-06-23  566  				CAM_ERR(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  567  					"No IFE in Read resource");
d3d9d274fb84ea Stephen Boyd       2021-06-23  568  				return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  569  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  570  			in_map_entries =
d3d9d274fb84ea Stephen Boyd       2021-06-23  571  				&prepare->in_map_entries[num_in_buf];
d3d9d274fb84ea Stephen Boyd       2021-06-23  572  			if (fill_fence) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  573  				if (num_in_buf < prepare->max_in_map_entries) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  574  					in_map_entries->resource_handle =
d3d9d274fb84ea Stephen Boyd       2021-06-23  575  						io_cfg[i].resource_type;
d3d9d274fb84ea Stephen Boyd       2021-06-23  576  					in_map_entries->sync_id =
d3d9d274fb84ea Stephen Boyd       2021-06-23  577  						io_cfg[i].fence;
d3d9d274fb84ea Stephen Boyd       2021-06-23  578  					num_in_buf++;
d3d9d274fb84ea Stephen Boyd       2021-06-23  579  				} else {
d3d9d274fb84ea Stephen Boyd       2021-06-23  580  					CAM_ERR(CAM_ISP, "ln_in:%d imax_ln:%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  581  						num_in_buf,
d3d9d274fb84ea Stephen Boyd       2021-06-23  582  						prepare->max_in_map_entries);
d3d9d274fb84ea Stephen Boyd       2021-06-23  583  					return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  584  				}
d3d9d274fb84ea Stephen Boyd       2021-06-23  585  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  586  		} else {
d3d9d274fb84ea Stephen Boyd       2021-06-23  587  			CAM_ERR(CAM_ISP, "Invalid io config direction :%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  588  				io_cfg[i].direction);
d3d9d274fb84ea Stephen Boyd       2021-06-23  589  			return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  590  		}
d3d9d274fb84ea Stephen Boyd       2021-06-23  591  
d3d9d274fb84ea Stephen Boyd       2021-06-23  592  		CAM_DBG(CAM_ISP, "setup mem io");
d3d9d274fb84ea Stephen Boyd       2021-06-23  593  		for (j = 0; j < CAM_ISP_HW_SPLIT_MAX &&
d3d9d274fb84ea Stephen Boyd       2021-06-23  594  			io_cfg[i].direction == CAM_BUF_OUTPUT; j++) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  595  			if (!hw_mgr_res->hw_res[j])
d3d9d274fb84ea Stephen Boyd       2021-06-23  596  				continue;
d3d9d274fb84ea Stephen Boyd       2021-06-23  597  
d3d9d274fb84ea Stephen Boyd       2021-06-23  598  			if (hw_mgr_res->hw_res[j]->hw_intf->hw_idx != base_idx)
d3d9d274fb84ea Stephen Boyd       2021-06-23  599  				continue;
d3d9d274fb84ea Stephen Boyd       2021-06-23  600  
d3d9d274fb84ea Stephen Boyd       2021-06-23  601  			res = hw_mgr_res->hw_res[j];
d3d9d274fb84ea Stephen Boyd       2021-06-23  602  			if (res->res_id != io_cfg[i].resource_type) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  603  				CAM_ERR(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  604  					"wm err res id:%d io res id:%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  605  					res->res_id, io_cfg[i].resource_type);
d3d9d274fb84ea Stephen Boyd       2021-06-23  606  				return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  607  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  608  
d3d9d274fb84ea Stephen Boyd       2021-06-23  609  			memset(io_addr, 0, sizeof(io_addr));
d3d9d274fb84ea Stephen Boyd       2021-06-23  610  
d3d9d274fb84ea Stephen Boyd       2021-06-23  611  			for (plane_id = 0; plane_id < CAM_PACKET_MAX_PLANES;
d3d9d274fb84ea Stephen Boyd       2021-06-23  612  						plane_id++) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  613  				if (!io_cfg[i].mem_handle[plane_id])
d3d9d274fb84ea Stephen Boyd       2021-06-23  614  					break;
d3d9d274fb84ea Stephen Boyd       2021-06-23  615  
d3d9d274fb84ea Stephen Boyd       2021-06-23  616  				hdl = io_cfg[i].mem_handle[plane_id];
d3d9d274fb84ea Stephen Boyd       2021-06-23  617  				if (res->process_cmd(res,
d3d9d274fb84ea Stephen Boyd       2021-06-23  618  						CAM_ISP_HW_CMD_GET_SECURE_MODE,
d3d9d274fb84ea Stephen Boyd       2021-06-23  619  						&mode,
d3d9d274fb84ea Stephen Boyd       2021-06-23  620  						sizeof(bool)))
d3d9d274fb84ea Stephen Boyd       2021-06-23  621  					return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  622  
6828e48be0be75 Sergey Senozhatsky 2023-12-07  623  				if (mode == CAM_SECURE_MODE_NON_SECURE) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  624  					mmu_hdl = iommu_hdl;
d3d9d274fb84ea Stephen Boyd       2021-06-23  625  				} else {
d3d9d274fb84ea Stephen Boyd       2021-06-23  626  					CAM_ERR_RATE_LIMIT(CAM_ISP,
6828e48be0be75 Sergey Senozhatsky 2023-12-07  627  						"Invalid hdl: port mode[%u]",
6828e48be0be75 Sergey Senozhatsky 2023-12-07  628  						mode);
d3d9d274fb84ea Stephen Boyd       2021-06-23  629  					return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  630  				}
d3d9d274fb84ea Stephen Boyd       2021-06-23  631  
d3d9d274fb84ea Stephen Boyd       2021-06-23  632  				rc = cam_mem_get_io_buf(
d3d9d274fb84ea Stephen Boyd       2021-06-23  633  					io_cfg[i].mem_handle[plane_id],
d3d9d274fb84ea Stephen Boyd       2021-06-23  634  					mmu_hdl, &io_addr[plane_id], &size);
d3d9d274fb84ea Stephen Boyd       2021-06-23  635  				if (rc) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  636  					CAM_ERR(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  637  						"no io addr for plane%d Bufhdl:%d, Size =%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  638  						plane_id,
d3d9d274fb84ea Stephen Boyd       2021-06-23  639  						io_cfg[i].mem_handle[plane_id],
d3d9d274fb84ea Stephen Boyd       2021-06-23  640  						(int)size);
d3d9d274fb84ea Stephen Boyd       2021-06-23  641  					CAM_ERR(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  642  						"Port i %d Reqid %llu res_type:%d fence:%d dir %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  643  						i, req_id,
d3d9d274fb84ea Stephen Boyd       2021-06-23  644  						io_cfg[i].resource_type,
d3d9d274fb84ea Stephen Boyd       2021-06-23  645  						io_cfg[i].fence,
d3d9d274fb84ea Stephen Boyd       2021-06-23  646  						io_cfg[i].direction);
d3d9d274fb84ea Stephen Boyd       2021-06-23  647  					rc = -ENOMEM;
d3d9d274fb84ea Stephen Boyd       2021-06-23  648  					return rc;
d3d9d274fb84ea Stephen Boyd       2021-06-23  649  				}
d3d9d274fb84ea Stephen Boyd       2021-06-23  650  
d3d9d274fb84ea Stephen Boyd       2021-06-23  651  				if (j == 0) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  652  					rc = cam_packet_validate_plane_size(
d3d9d274fb84ea Stephen Boyd       2021-06-23  653  							&io_cfg[i],
d3d9d274fb84ea Stephen Boyd       2021-06-23  654  							plane_id,
d3d9d274fb84ea Stephen Boyd       2021-06-23  655  							size);
d3d9d274fb84ea Stephen Boyd       2021-06-23  656  					if (rc) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  657  						CAM_ERR(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  658  						"Invalid buffer size, port 0x%x plane %d req_id %llu format %d memh 0x%x",
d3d9d274fb84ea Stephen Boyd       2021-06-23  659  						io_cfg[i].resource_type,
d3d9d274fb84ea Stephen Boyd       2021-06-23  660  						plane_id,
d3d9d274fb84ea Stephen Boyd       2021-06-23  661  						req_id,
d3d9d274fb84ea Stephen Boyd       2021-06-23  662  						io_cfg[i].format,
d3d9d274fb84ea Stephen Boyd       2021-06-23  663  						io_cfg[i].mem_handle[plane_id]);
d3d9d274fb84ea Stephen Boyd       2021-06-23  664  						return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  665  					}
d3d9d274fb84ea Stephen Boyd       2021-06-23  666  				}
d3d9d274fb84ea Stephen Boyd       2021-06-23  667  
d3d9d274fb84ea Stephen Boyd       2021-06-23  668  				/* need to update with offset */
d3d9d274fb84ea Stephen Boyd       2021-06-23  669  				io_addr[plane_id] +=
d3d9d274fb84ea Stephen Boyd       2021-06-23  670  						io_cfg[i].offsets[plane_id];
d3d9d274fb84ea Stephen Boyd       2021-06-23  671  				CAM_DBG(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  672  					"get io_addr for plane %d: 0x%llx, mem_hdl=0x%x",
d3d9d274fb84ea Stephen Boyd       2021-06-23  673  					plane_id, io_addr[plane_id],
d3d9d274fb84ea Stephen Boyd       2021-06-23  674  					io_cfg[i].mem_handle[plane_id]);
d3d9d274fb84ea Stephen Boyd       2021-06-23  675  
d3d9d274fb84ea Stephen Boyd       2021-06-23  676  				CAM_DBG(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  677  					"mmu_hdl=0x%x, size=%d, end=0x%llx",
d3d9d274fb84ea Stephen Boyd       2021-06-23  678  					mmu_hdl, (int)size,
d3d9d274fb84ea Stephen Boyd       2021-06-23  679  					io_addr[plane_id]+size);
d3d9d274fb84ea Stephen Boyd       2021-06-23  680  
d3d9d274fb84ea Stephen Boyd       2021-06-23  681  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  682  			if (!plane_id) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  683  				CAM_ERR(CAM_ISP, "No valid planes for res%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  684  					res->res_id);
d3d9d274fb84ea Stephen Boyd       2021-06-23  685  				rc = -ENOMEM;
d3d9d274fb84ea Stephen Boyd       2021-06-23  686  				return rc;
d3d9d274fb84ea Stephen Boyd       2021-06-23  687  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  688  
d3d9d274fb84ea Stephen Boyd       2021-06-23  689  			if ((kmd_buf_info->used_bytes + io_cfg_used_bytes) <
d3d9d274fb84ea Stephen Boyd       2021-06-23  690  				kmd_buf_info->size) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  691  				kmd_buf_remain_size = kmd_buf_info->size -
d3d9d274fb84ea Stephen Boyd       2021-06-23  692  					(kmd_buf_info->used_bytes +
d3d9d274fb84ea Stephen Boyd       2021-06-23  693  					io_cfg_used_bytes);
d3d9d274fb84ea Stephen Boyd       2021-06-23  694  			} else {
d3d9d274fb84ea Stephen Boyd       2021-06-23  695  				CAM_ERR(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  696  					"no free kmd memory for base %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  697  					base_idx);
d3d9d274fb84ea Stephen Boyd       2021-06-23  698  				rc = -ENOMEM;
d3d9d274fb84ea Stephen Boyd       2021-06-23  699  				return rc;
d3d9d274fb84ea Stephen Boyd       2021-06-23  700  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  701  			update_buf.res = res;
d3d9d274fb84ea Stephen Boyd       2021-06-23  702  			update_buf.cmd_type = CAM_ISP_HW_CMD_GET_BUF_UPDATE;
d3d9d274fb84ea Stephen Boyd       2021-06-23  703  			update_buf.cmd.cmd_buf_addr = kmd_buf_info->cpu_addr +
d3d9d274fb84ea Stephen Boyd       2021-06-23  704  				kmd_buf_info->used_bytes/4 +
d3d9d274fb84ea Stephen Boyd       2021-06-23  705  					io_cfg_used_bytes/4;
d3d9d274fb84ea Stephen Boyd       2021-06-23  706  			wm_update.image_buf = io_addr;
d3d9d274fb84ea Stephen Boyd       2021-06-23  707  			wm_update.num_buf   = plane_id;
d3d9d274fb84ea Stephen Boyd       2021-06-23  708  			wm_update.io_cfg    = &io_cfg[i];
d3d9d274fb84ea Stephen Boyd       2021-06-23  709  			update_buf.cmd.size = kmd_buf_remain_size;
d3d9d274fb84ea Stephen Boyd       2021-06-23  710  			update_buf.wm_update = &wm_update;
d3d9d274fb84ea Stephen Boyd       2021-06-23  711  
d3d9d274fb84ea Stephen Boyd       2021-06-23  712  			CAM_DBG(CAM_ISP, "cmd buffer 0x%pK, size %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  713  				update_buf.cmd.cmd_buf_addr,
d3d9d274fb84ea Stephen Boyd       2021-06-23  714  				update_buf.cmd.size);
d3d9d274fb84ea Stephen Boyd       2021-06-23  715  			rc = res->hw_intf->hw_ops.process_cmd(
d3d9d274fb84ea Stephen Boyd       2021-06-23  716  				res->hw_intf->hw_priv,
d3d9d274fb84ea Stephen Boyd       2021-06-23  717  				CAM_ISP_HW_CMD_GET_BUF_UPDATE, &update_buf,
d3d9d274fb84ea Stephen Boyd       2021-06-23  718  				sizeof(struct cam_isp_hw_get_cmd_update));
d3d9d274fb84ea Stephen Boyd       2021-06-23  719  
d3d9d274fb84ea Stephen Boyd       2021-06-23  720  			if (rc) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  721  				CAM_ERR(CAM_ISP, "get buf cmd error:%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  722  					res->res_id);
d3d9d274fb84ea Stephen Boyd       2021-06-23  723  				rc = -ENOMEM;
d3d9d274fb84ea Stephen Boyd       2021-06-23  724  				return rc;
d3d9d274fb84ea Stephen Boyd       2021-06-23  725  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  726  			io_cfg_used_bytes += update_buf.cmd.used_bytes;
d3d9d274fb84ea Stephen Boyd       2021-06-23  727  		}
d3d9d274fb84ea Stephen Boyd       2021-06-23  728  		for (j = 0; j < CAM_ISP_HW_SPLIT_MAX &&
d3d9d274fb84ea Stephen Boyd       2021-06-23  729  			io_cfg[i].direction == CAM_BUF_INPUT; j++) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  730  			if (!hw_mgr_res->hw_res[j])
d3d9d274fb84ea Stephen Boyd       2021-06-23  731  				continue;
d3d9d274fb84ea Stephen Boyd       2021-06-23  732  
d3d9d274fb84ea Stephen Boyd       2021-06-23  733  			if (hw_mgr_res->hw_res[j]->hw_intf->hw_idx != base_idx)
d3d9d274fb84ea Stephen Boyd       2021-06-23  734  				continue;
d3d9d274fb84ea Stephen Boyd       2021-06-23  735  
d3d9d274fb84ea Stephen Boyd       2021-06-23  736  			res = hw_mgr_res->hw_res[j];
d3d9d274fb84ea Stephen Boyd       2021-06-23  737  
d3d9d274fb84ea Stephen Boyd       2021-06-23  738  			memset(io_addr, 0, sizeof(io_addr));
d3d9d274fb84ea Stephen Boyd       2021-06-23  739  
d3d9d274fb84ea Stephen Boyd       2021-06-23  740  			for (plane_id = 0; plane_id < CAM_PACKET_MAX_PLANES;
d3d9d274fb84ea Stephen Boyd       2021-06-23  741  						plane_id++) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  742  				if (!io_cfg[i].mem_handle[plane_id])
d3d9d274fb84ea Stephen Boyd       2021-06-23  743  					break;
d3d9d274fb84ea Stephen Boyd       2021-06-23  744  
d3d9d274fb84ea Stephen Boyd       2021-06-23  745  				hdl = io_cfg[i].mem_handle[plane_id];
d3d9d274fb84ea Stephen Boyd       2021-06-23  746  				if (res->process_cmd(res,
d3d9d274fb84ea Stephen Boyd       2021-06-23  747  						CAM_ISP_HW_CMD_GET_SECURE_MODE,
d3d9d274fb84ea Stephen Boyd       2021-06-23  748  						&mode,
d3d9d274fb84ea Stephen Boyd       2021-06-23  749  						sizeof(bool)))
d3d9d274fb84ea Stephen Boyd       2021-06-23  750  					return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  751  
6828e48be0be75 Sergey Senozhatsky 2023-12-07  752  				if (mode == CAM_SECURE_MODE_NON_SECURE) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  753  					mmu_hdl = iommu_hdl;
d3d9d274fb84ea Stephen Boyd       2021-06-23  754  				} else {
d3d9d274fb84ea Stephen Boyd       2021-06-23  755  					CAM_ERR_RATE_LIMIT(CAM_ISP,
6828e48be0be75 Sergey Senozhatsky 2023-12-07  756  						"Invalid hdl: port mode[%u]",
6828e48be0be75 Sergey Senozhatsky 2023-12-07  757  						mode);
d3d9d274fb84ea Stephen Boyd       2021-06-23  758  					return -EINVAL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  759  				}
d3d9d274fb84ea Stephen Boyd       2021-06-23  760  
d3d9d274fb84ea Stephen Boyd       2021-06-23  761  				rc = cam_mem_get_io_buf(
d3d9d274fb84ea Stephen Boyd       2021-06-23  762  					io_cfg[i].mem_handle[plane_id],
d3d9d274fb84ea Stephen Boyd       2021-06-23  763  					mmu_hdl, &io_addr[plane_id], &size);
d3d9d274fb84ea Stephen Boyd       2021-06-23  764  				if (rc) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  765  					CAM_ERR(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  766  						"no io addr for plane%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  767  						plane_id);
d3d9d274fb84ea Stephen Boyd       2021-06-23  768  					rc = -ENOMEM;
d3d9d274fb84ea Stephen Boyd       2021-06-23  769  					return rc;
d3d9d274fb84ea Stephen Boyd       2021-06-23  770  				}
d3d9d274fb84ea Stephen Boyd       2021-06-23  771  
d3d9d274fb84ea Stephen Boyd       2021-06-23  772  				/* need to update with offset */
d3d9d274fb84ea Stephen Boyd       2021-06-23  773  				io_addr[plane_id] +=
d3d9d274fb84ea Stephen Boyd       2021-06-23  774  						io_cfg[i].offsets[plane_id];
d3d9d274fb84ea Stephen Boyd       2021-06-23  775  				CAM_DBG(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  776  					"get io_addr for plane %d: 0x%llx, mem_hdl=0x%x",
d3d9d274fb84ea Stephen Boyd       2021-06-23  777  					plane_id, io_addr[plane_id],
d3d9d274fb84ea Stephen Boyd       2021-06-23  778  					io_cfg[i].mem_handle[plane_id]);
d3d9d274fb84ea Stephen Boyd       2021-06-23  779  
d3d9d274fb84ea Stephen Boyd       2021-06-23  780  				CAM_DBG(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  781  					"mmu_hdl=0x%x, size=%d, end=0x%llx",
d3d9d274fb84ea Stephen Boyd       2021-06-23  782  					mmu_hdl, (int)size,
d3d9d274fb84ea Stephen Boyd       2021-06-23  783  					io_addr[plane_id]+size);
d3d9d274fb84ea Stephen Boyd       2021-06-23  784  
d3d9d274fb84ea Stephen Boyd       2021-06-23  785  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  786  			if (!plane_id) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  787  				CAM_ERR(CAM_ISP, "No valid planes for res%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  788  					res->res_id);
d3d9d274fb84ea Stephen Boyd       2021-06-23  789  				rc = -ENOMEM;
d3d9d274fb84ea Stephen Boyd       2021-06-23  790  				return rc;
d3d9d274fb84ea Stephen Boyd       2021-06-23  791  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  792  
d3d9d274fb84ea Stephen Boyd       2021-06-23  793  			if ((kmd_buf_info->used_bytes + io_cfg_used_bytes) <
d3d9d274fb84ea Stephen Boyd       2021-06-23  794  				kmd_buf_info->size) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  795  				kmd_buf_remain_size = kmd_buf_info->size -
d3d9d274fb84ea Stephen Boyd       2021-06-23  796  					(kmd_buf_info->used_bytes +
d3d9d274fb84ea Stephen Boyd       2021-06-23  797  					io_cfg_used_bytes);
d3d9d274fb84ea Stephen Boyd       2021-06-23  798  			} else {
d3d9d274fb84ea Stephen Boyd       2021-06-23  799  				CAM_ERR(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  800  					"no free kmd memory for base %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  801  					base_idx);
d3d9d274fb84ea Stephen Boyd       2021-06-23  802  				rc = -ENOMEM;
d3d9d274fb84ea Stephen Boyd       2021-06-23  803  				return rc;
d3d9d274fb84ea Stephen Boyd       2021-06-23  804  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  805  			update_buf.res = res;
d3d9d274fb84ea Stephen Boyd       2021-06-23  806  			update_buf.cmd_type = CAM_ISP_HW_CMD_GET_BUF_UPDATE_RM;
d3d9d274fb84ea Stephen Boyd       2021-06-23  807  			update_buf.cmd.cmd_buf_addr = kmd_buf_info->cpu_addr +
d3d9d274fb84ea Stephen Boyd       2021-06-23  808  				kmd_buf_info->used_bytes/4 +
d3d9d274fb84ea Stephen Boyd       2021-06-23  809  					io_cfg_used_bytes/4;
d3d9d274fb84ea Stephen Boyd       2021-06-23  810  			bus_rd_update.image_buf = io_addr;
d3d9d274fb84ea Stephen Boyd       2021-06-23  811  			bus_rd_update.num_buf   = plane_id;
d3d9d274fb84ea Stephen Boyd       2021-06-23  812  			bus_rd_update.io_cfg    = &io_cfg[i];
d3d9d274fb84ea Stephen Boyd       2021-06-23  813  			update_buf.cmd.size = kmd_buf_remain_size;
d3d9d274fb84ea Stephen Boyd       2021-06-23  814  			update_buf.rm_update = &bus_rd_update;
d3d9d274fb84ea Stephen Boyd       2021-06-23  815  
d3d9d274fb84ea Stephen Boyd       2021-06-23  816  			CAM_DBG(CAM_ISP, "cmd buffer 0x%pK, size %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  817  				update_buf.cmd.cmd_buf_addr,
d3d9d274fb84ea Stephen Boyd       2021-06-23  818  				update_buf.cmd.size);
d3d9d274fb84ea Stephen Boyd       2021-06-23  819  			rc = res->hw_intf->hw_ops.process_cmd(
d3d9d274fb84ea Stephen Boyd       2021-06-23  820  				res->hw_intf->hw_priv,
d3d9d274fb84ea Stephen Boyd       2021-06-23  821  				CAM_ISP_HW_CMD_GET_BUF_UPDATE_RM, &update_buf,
d3d9d274fb84ea Stephen Boyd       2021-06-23  822  				sizeof(struct cam_isp_hw_get_cmd_update));
d3d9d274fb84ea Stephen Boyd       2021-06-23  823  
d3d9d274fb84ea Stephen Boyd       2021-06-23  824  			if (rc) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  825  				CAM_ERR(CAM_ISP, "get buf cmd error:%d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  826  					res->res_id);
d3d9d274fb84ea Stephen Boyd       2021-06-23  827  				rc = -ENOMEM;
d3d9d274fb84ea Stephen Boyd       2021-06-23  828  				return rc;
d3d9d274fb84ea Stephen Boyd       2021-06-23  829  			}
d3d9d274fb84ea Stephen Boyd       2021-06-23  830  			io_cfg_used_bytes += update_buf.cmd.used_bytes;
d3d9d274fb84ea Stephen Boyd       2021-06-23  831  		}
d3d9d274fb84ea Stephen Boyd       2021-06-23  832  
d3d9d274fb84ea Stephen Boyd       2021-06-23  833  		fill_res_bitmap(io_cfg[i].resource_type, res_bitmap);
d3d9d274fb84ea Stephen Boyd       2021-06-23  834  	}
d3d9d274fb84ea Stephen Boyd       2021-06-23  835  
d3d9d274fb84ea Stephen Boyd       2021-06-23  836  	CAM_DBG(CAM_ISP, "io_cfg_used_bytes %d, fill_fence %d",
d3d9d274fb84ea Stephen Boyd       2021-06-23  837  		io_cfg_used_bytes, fill_fence);
d3d9d274fb84ea Stephen Boyd       2021-06-23  838  	if (io_cfg_used_bytes) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  839  		/* Update the HW entries */
d3d9d274fb84ea Stephen Boyd       2021-06-23  840  		num_ent = prepare->num_hw_update_entries;
d3d9d274fb84ea Stephen Boyd       2021-06-23  841  		prepare->hw_update_entries[num_ent].handle =
d3d9d274fb84ea Stephen Boyd       2021-06-23  842  					kmd_buf_info->handle;
d3d9d274fb84ea Stephen Boyd       2021-06-23  843  		prepare->hw_update_entries[num_ent].len = io_cfg_used_bytes;
d3d9d274fb84ea Stephen Boyd       2021-06-23  844  		prepare->hw_update_entries[num_ent].offset =
d3d9d274fb84ea Stephen Boyd       2021-06-23  845  			kmd_buf_info->offset;
d3d9d274fb84ea Stephen Boyd       2021-06-23  846  		prepare->hw_update_entries[num_ent].flags = CAM_ISP_IOCFG_BL;
d3d9d274fb84ea Stephen Boyd       2021-06-23  847  
d3d9d274fb84ea Stephen Boyd       2021-06-23  848  		CAM_DBG(CAM_ISP,
d3d9d274fb84ea Stephen Boyd       2021-06-23  849  			"num_ent=%d handle=0x%x, len=%u, offset=%u",
d3d9d274fb84ea Stephen Boyd       2021-06-23  850  			num_ent,
d3d9d274fb84ea Stephen Boyd       2021-06-23  851  			prepare->hw_update_entries[num_ent].handle,
d3d9d274fb84ea Stephen Boyd       2021-06-23  852  			prepare->hw_update_entries[num_ent].len,
d3d9d274fb84ea Stephen Boyd       2021-06-23  853  			prepare->hw_update_entries[num_ent].offset);
d3d9d274fb84ea Stephen Boyd       2021-06-23  854  		num_ent++;
d3d9d274fb84ea Stephen Boyd       2021-06-23  855  
d3d9d274fb84ea Stephen Boyd       2021-06-23  856  		kmd_buf_info->used_bytes += io_cfg_used_bytes;
d3d9d274fb84ea Stephen Boyd       2021-06-23  857  		kmd_buf_info->offset     += io_cfg_used_bytes;
d3d9d274fb84ea Stephen Boyd       2021-06-23  858  		prepare->num_hw_update_entries = num_ent;
d3d9d274fb84ea Stephen Boyd       2021-06-23  859  	}
d3d9d274fb84ea Stephen Boyd       2021-06-23  860  
d3d9d274fb84ea Stephen Boyd       2021-06-23  861  	if (fill_fence) {
d3d9d274fb84ea Stephen Boyd       2021-06-23  862  		prepare->num_out_map_entries = num_out_buf;
d3d9d274fb84ea Stephen Boyd       2021-06-23  863  		prepare->num_in_map_entries  = num_in_buf;
d3d9d274fb84ea Stephen Boyd       2021-06-23  864  	}
d3d9d274fb84ea Stephen Boyd       2021-06-23  865  
d3d9d274fb84ea Stephen Boyd       2021-06-23  866  	return rc;
d3d9d274fb84ea Stephen Boyd       2021-06-23  867  }
d3d9d274fb84ea Stephen Boyd       2021-06-23  868  

:::::: The code at line 490 was first introduced by commit
:::::: d3d9d274fb84ea36a6f783cbfa739a3b50ff1f5d CHROMIUM: media: add camx drivers

:::::: TO: Stephen Boyd <swboyd@chromium.org>
:::::: CC: Tzung-Bi Shih <tzungbi@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
