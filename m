Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77AF3A268
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 21:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYXWIlcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703021186; x=1734557186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eajT42vNHTnSd7bw8QbZk5cmlWSfpFEVDifl0yi6+eQ=;
  b=OYXWIlcDfnw23ZMi+z77bQlHeBcPno7ea6hKVWZNyCoEg2HEoKGGAPzt
   E77i+yyhnMSLryei2DkN8fV2VvJ0FkfFut4nZrIdOzmk8EpiA8RbQ15gg
   pekAeEfMOAu55DGm6XSTazRsNIiYydj0OZqEEv7HEy0B3/2j9CoAWsYEv
   tkvfPoUXZKqEXthI7sbONWpGJ2h/XxPsfRiMiH5YlxHz/kzpqe/A84Jmm
   pr23KvL15dbOI5fHS99OApg/zy6/TmwqZtB3zCAmr8zE4ypY9C9l/6U4m
   qObn0Cv0cmV+C2uYXYcsl4aK4uttt75+1y+Tah1NWiSbU4e5z2MOCE93V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9167240"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="9167240"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 13:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="752311569"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="752311569"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Dec 2023 13:26:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFhbY-0005yD-2L;
	Tue, 19 Dec 2023 21:26:20 +0000
Date: Wed, 20 Dec 2023 05:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Selvin Xavier <selvin.xavier@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Leon Romanovsky <leon@kernel.org>,
	Damodharam Ammepalli <damodharam.ammepalli@broadcom.com>
Subject: [linux-next:master 5887/9096]
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:909:27: sparse: sparse: invalid
 assignment: |=
Message-ID: <202312200537.HoNqPL5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa4db8324c4d0e67aa4670356df4e9fae14b4d37
commit: 07f830ae4913d0b986c8c0ff88a7d597948b9bd8 [5887/9096] RDMA/bnxt_re: Adds MSN table capability for Gen P7 adapters
config: x86_64-randconfig-121-20231220 (https://download.01.org/0day-ci/archive/20231220/202312200537.HoNqPL5L-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312200537.HoNqPL5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312200537.HoNqPL5L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:909:27: sparse: sparse: invalid assignment: |=
>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:909:27: sparse:    left side has type restricted __le16
>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:909:27: sparse:    right side has type unsigned long
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/infiniband/hw/bnxt_re/qplib_fp.c:1620:44: sparse: sparse: invalid assignment: |=
>> drivers/infiniband/hw/bnxt_re/qplib_fp.c:1620:44: sparse:    left side has type restricted __le64
>> drivers/infiniband/hw/bnxt_re/qplib_fp.c:1620:44: sparse:    right side has type unsigned long long
   drivers/infiniband/hw/bnxt_re/qplib_fp.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +909 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c

   828	
   829	int bnxt_qplib_init_rcfw(struct bnxt_qplib_rcfw *rcfw,
   830				 struct bnxt_qplib_ctx *ctx, int is_virtfn)
   831	{
   832		struct creq_initialize_fw_resp resp = {};
   833		struct cmdq_initialize_fw req = {};
   834		struct bnxt_qplib_cmdqmsg msg = {};
   835		u8 pgsz, lvl;
   836		int rc;
   837	
   838		bnxt_qplib_rcfw_cmd_prep((struct cmdq_base *)&req,
   839					 CMDQ_BASE_OPCODE_INITIALIZE_FW,
   840					 sizeof(req));
   841		/* Supply (log-base-2-of-host-page-size - base-page-shift)
   842		 * to bono to adjust the doorbell page sizes.
   843		 */
   844		req.log2_dbr_pg_size = cpu_to_le16(PAGE_SHIFT -
   845						   RCFW_DBR_BASE_PAGE_SHIFT);
   846		/*
   847		 * Gen P5 devices doesn't require this allocation
   848		 * as the L2 driver does the same for RoCE also.
   849		 * Also, VFs need not setup the HW context area, PF
   850		 * shall setup this area for VF. Skipping the
   851		 * HW programming
   852		 */
   853		if (is_virtfn)
   854			goto skip_ctx_setup;
   855		if (bnxt_qplib_is_chip_gen_p5_p7(rcfw->res->cctx))
   856			goto config_vf_res;
   857	
   858		lvl = ctx->qpc_tbl.level;
   859		pgsz = bnxt_qplib_base_pg_size(&ctx->qpc_tbl);
   860		req.qpc_pg_size_qpc_lvl = (pgsz << CMDQ_INITIALIZE_FW_QPC_PG_SIZE_SFT) |
   861					   lvl;
   862		lvl = ctx->mrw_tbl.level;
   863		pgsz = bnxt_qplib_base_pg_size(&ctx->mrw_tbl);
   864		req.mrw_pg_size_mrw_lvl = (pgsz << CMDQ_INITIALIZE_FW_QPC_PG_SIZE_SFT) |
   865					   lvl;
   866		lvl = ctx->srqc_tbl.level;
   867		pgsz = bnxt_qplib_base_pg_size(&ctx->srqc_tbl);
   868		req.srq_pg_size_srq_lvl = (pgsz << CMDQ_INITIALIZE_FW_QPC_PG_SIZE_SFT) |
   869					   lvl;
   870		lvl = ctx->cq_tbl.level;
   871		pgsz = bnxt_qplib_base_pg_size(&ctx->cq_tbl);
   872		req.cq_pg_size_cq_lvl = (pgsz << CMDQ_INITIALIZE_FW_QPC_PG_SIZE_SFT) |
   873					 lvl;
   874		lvl = ctx->tim_tbl.level;
   875		pgsz = bnxt_qplib_base_pg_size(&ctx->tim_tbl);
   876		req.tim_pg_size_tim_lvl = (pgsz << CMDQ_INITIALIZE_FW_QPC_PG_SIZE_SFT) |
   877					   lvl;
   878		lvl = ctx->tqm_ctx.pde.level;
   879		pgsz = bnxt_qplib_base_pg_size(&ctx->tqm_ctx.pde);
   880		req.tqm_pg_size_tqm_lvl = (pgsz << CMDQ_INITIALIZE_FW_QPC_PG_SIZE_SFT) |
   881					   lvl;
   882		req.qpc_page_dir =
   883			cpu_to_le64(ctx->qpc_tbl.pbl[PBL_LVL_0].pg_map_arr[0]);
   884		req.mrw_page_dir =
   885			cpu_to_le64(ctx->mrw_tbl.pbl[PBL_LVL_0].pg_map_arr[0]);
   886		req.srq_page_dir =
   887			cpu_to_le64(ctx->srqc_tbl.pbl[PBL_LVL_0].pg_map_arr[0]);
   888		req.cq_page_dir =
   889			cpu_to_le64(ctx->cq_tbl.pbl[PBL_LVL_0].pg_map_arr[0]);
   890		req.tim_page_dir =
   891			cpu_to_le64(ctx->tim_tbl.pbl[PBL_LVL_0].pg_map_arr[0]);
   892		req.tqm_page_dir =
   893			cpu_to_le64(ctx->tqm_ctx.pde.pbl[PBL_LVL_0].pg_map_arr[0]);
   894	
   895		req.number_of_qp = cpu_to_le32(ctx->qpc_tbl.max_elements);
   896		req.number_of_mrw = cpu_to_le32(ctx->mrw_tbl.max_elements);
   897		req.number_of_srq = cpu_to_le32(ctx->srqc_tbl.max_elements);
   898		req.number_of_cq = cpu_to_le32(ctx->cq_tbl.max_elements);
   899	
   900	config_vf_res:
   901		req.max_qp_per_vf = cpu_to_le32(ctx->vf_res.max_qp_per_vf);
   902		req.max_mrw_per_vf = cpu_to_le32(ctx->vf_res.max_mrw_per_vf);
   903		req.max_srq_per_vf = cpu_to_le32(ctx->vf_res.max_srq_per_vf);
   904		req.max_cq_per_vf = cpu_to_le32(ctx->vf_res.max_cq_per_vf);
   905		req.max_gid_per_vf = cpu_to_le32(ctx->vf_res.max_gid_per_vf);
   906	
   907	skip_ctx_setup:
   908		if (BNXT_RE_HW_RETX(rcfw->res->dattr->dev_cap_flags))
 > 909			req.flags |= CMDQ_INITIALIZE_FW_FLAGS_HW_REQUESTER_RETX_SUPPORTED;
   910		req.stat_ctx_id = cpu_to_le32(ctx->stats.fw_id);
   911		bnxt_qplib_fill_cmdqmsg(&msg, &req, &resp, NULL, sizeof(req), sizeof(resp), 0);
   912		rc = bnxt_qplib_rcfw_send_message(rcfw, &msg);
   913		if (rc)
   914			return rc;
   915		set_bit(FIRMWARE_INITIALIZED_FLAG, &rcfw->cmdq.flags);
   916		return 0;
   917	}
   918	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
