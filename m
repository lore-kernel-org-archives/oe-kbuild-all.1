Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8116C451
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581077; cv=none; b=kAFXFyk7n3HI6hUYWkh7QOsnVevP+dSxi15ZMQ0Bi7PtsgeDCwtID61ewPcmXQswGGZ8CbXWsEJvITQ9cqVw+ONNlmVIL1occTYk1n0aMeQ0O2WtqH+dZqm36B9K9wfBHjfRWnUZ4BvIGR+8CQYQ9BDyhnkw+LdNwIF+oGXTf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581077; c=relaxed/simple;
	bh=BamK8mwvcuHxQKh+Jdl6AWEFE6CwMziSKzzFjVfLbCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pkmeytWcxwHgRs5Cz96ciyvIxIXuwtB9frwEoiRePWTtKsfEWZtlPFS1Y270wF0NiNW6Wu/E0fe9UECHJruiA4Ra84jtPcjRq6BnX6mgU7f8MslSmw/u3VeiGwSy/emtN8DqyFFTubuL/dnGliEpdlBZh2Gs/KWJrbwt2aGT7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gz3K9TI+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gz3K9TI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730581075; x=1762117075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BamK8mwvcuHxQKh+Jdl6AWEFE6CwMziSKzzFjVfLbCM=;
  b=gz3K9TI+8zSJXheXw1KGkcbif+8I6ShMYkWbm7LnRq6U+zosk0hwVj97
   1fdvCvKXBgJn4apUS8aIqT9mIFz7vjNov5ulISasqHznmIWRAoM72fQHI
   wFTAIZD6q3t5x5QtPVeTcP/oyo3YigW79GwtIs1Hdlc0NJK1a27AtGR4+
   fsceZwhTV9jx1wf/13VKTLV4PwfdMz5wAvitSj9E87YnT4Q7rrErW8prb
   RPkPgiV3E4h1dan6nNLkHO/owsTYXW+GmpNR6VkPA06Y/tGTBJ6rd1Lqu
   3Z2h6twZoiCxoxcSC5/KT/p303UF61kFIqbCnQ9MCerOixwyyhcsJIlN7
   g==;
X-CSE-ConnectionGUID: pJdfjuK0QVKwBPRozM3t5g==
X-CSE-MsgGUID: AnmrWkImQP2Hqs3K889SNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="40950697"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="40950697"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 13:57:54 -0700
X-CSE-ConnectionGUID: 7Ke7RoIjQr+EjIR9oPrrCw==
X-CSE-MsgGUID: LY7GIvPUQDWDbJG7DeIPIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="114086077"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Nov 2024 13:57:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7LBv-000jLQ-1j;
	Sat, 02 Nov 2024 20:57:51 +0000
Date: Sun, 3 Nov 2024 04:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Melody Olvera <quic_molvera@quicinc.com>
Subject: [krzk-github:b4/sm8750-audio 13/36]
 drivers/interconnect/qcom/sm8750.c:1411:29: warning: 'lpass_ag_noc_bcms'
 defined but not used
Message-ID: <202411030425.T55iXBIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/sm8750-audio
head:   5c4247ed056c28382180718f04a756348a628dd7
commit: c013177b6be9c3ed3501e3de36ea4e73b7ded154 [13/36] interconnect: qcom: Add interconnect provider driver for SM8750
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241103/202411030425.T55iXBIc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030425.T55iXBIc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030425.T55iXBIc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/interconnect/qcom/sm8750.c:1411:29: warning: 'lpass_ag_noc_bcms' defined but not used [-Wunused-variable]
    1411 | static struct qcom_icc_bcm *lpass_ag_noc_bcms[] = {
         |                             ^~~~~~~~~~~~~~~~~
>> drivers/interconnect/qcom/sm8750.c:1236:29: warning: 'aggre1_noc_bcms' defined but not used [-Wunused-variable]
    1236 | static struct qcom_icc_bcm *aggre1_noc_bcms[] = {
         |                             ^~~~~~~~~~~~~~~


vim +/lpass_ag_noc_bcms +1411 drivers/interconnect/qcom/sm8750.c

  1235	
> 1236	static struct qcom_icc_bcm *aggre1_noc_bcms[] = {
  1237	};
  1238	
  1239	static struct qcom_icc_node *aggre1_noc_nodes[] = {
  1240		[MASTER_QSPI_0] = &qhm_qspi,
  1241		[MASTER_QUP_1] = &qhm_qup1,
  1242		[MASTER_QUP_3] = &qxm_qup02,
  1243		[MASTER_SDCC_4] = &xm_sdc4,
  1244		[MASTER_UFS_MEM] = &xm_ufs_mem,
  1245		[MASTER_USB3_0] = &xm_usb3_0,
  1246		[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
  1247	};
  1248	
  1249	static struct qcom_icc_desc sm8750_aggre1_noc = {
  1250		.nodes = aggre1_noc_nodes,
  1251		.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
  1252	};
  1253	
  1254	static struct qcom_icc_bcm *aggre2_noc_bcms[] = {
  1255		&bcm_ce0,
  1256	};
  1257	
  1258	static struct qcom_icc_node *aggre2_noc_nodes[] = {
  1259		[MASTER_QDSS_BAM] = &qhm_qdss_bam,
  1260		[MASTER_QUP_2] = &qhm_qup2,
  1261		[MASTER_CRYPTO] = &qxm_crypto,
  1262		[MASTER_IPA] = &qxm_ipa,
  1263		[MASTER_SOCCP_AGGR_NOC] = &qxm_soccp,
  1264		[MASTER_SP] = &qxm_sp,
  1265		[MASTER_QDSS_ETR] = &xm_qdss_etr_0,
  1266		[MASTER_QDSS_ETR_1] = &xm_qdss_etr_1,
  1267		[MASTER_SDCC_2] = &xm_sdc2,
  1268		[SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
  1269	};
  1270	
  1271	static struct qcom_icc_desc sm8750_aggre2_noc = {
  1272		.nodes = aggre2_noc_nodes,
  1273		.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
  1274		.bcms = aggre2_noc_bcms,
  1275		.num_bcms = ARRAY_SIZE(aggre2_noc_bcms),
  1276	};
  1277	
  1278	static struct qcom_icc_bcm *clk_virt_bcms[] = {
  1279		&bcm_qup0,
  1280		&bcm_qup1,
  1281		&bcm_qup2,
  1282	};
  1283	
  1284	static struct qcom_icc_node *clk_virt_nodes[] = {
  1285		[MASTER_QUP_CORE_0] = &qup0_core_master,
  1286		[MASTER_QUP_CORE_1] = &qup1_core_master,
  1287		[MASTER_QUP_CORE_2] = &qup2_core_master,
  1288		[SLAVE_QUP_CORE_0] = &qup0_core_slave,
  1289		[SLAVE_QUP_CORE_1] = &qup1_core_slave,
  1290		[SLAVE_QUP_CORE_2] = &qup2_core_slave,
  1291	};
  1292	
  1293	static struct qcom_icc_desc sm8750_clk_virt = {
  1294		.nodes = clk_virt_nodes,
  1295		.num_nodes = ARRAY_SIZE(clk_virt_nodes),
  1296		.bcms = clk_virt_bcms,
  1297		.num_bcms = ARRAY_SIZE(clk_virt_bcms),
  1298	};
  1299	
  1300	static struct qcom_icc_bcm *cnoc_cfg_bcms[] = {
  1301		&bcm_cn0,
  1302		&bcm_cn1,
  1303	};
  1304	
  1305	static struct qcom_icc_node *cnoc_cfg_nodes[] = {
  1306		[MASTER_CNOC_CFG] = &qsm_cfg,
  1307		[SLAVE_AHB2PHY_SOUTH] = &qhs_ahb2phy0,
  1308		[SLAVE_AHB2PHY_NORTH] = &qhs_ahb2phy1,
  1309		[SLAVE_CAMERA_CFG] = &qhs_camera_cfg,
  1310		[SLAVE_CLK_CTL] = &qhs_clk_ctl,
  1311		[SLAVE_CRYPTO_0_CFG] = &qhs_crypto0_cfg,
  1312		[SLAVE_DISPLAY_CFG] = &qhs_display_cfg,
  1313		[SLAVE_EVA_CFG] = &qhs_eva_cfg,
  1314		[SLAVE_GFX3D_CFG] = &qhs_gpuss_cfg,
  1315		[SLAVE_I2C] = &qhs_i2c,
  1316		[SLAVE_I3C_IBI0_CFG] = &qhs_i3c_ibi0_cfg,
  1317		[SLAVE_I3C_IBI1_CFG] = &qhs_i3c_ibi1_cfg,
  1318		[SLAVE_IMEM_CFG] = &qhs_imem_cfg,
  1319		[SLAVE_CNOC_MSS] = &qhs_mss_cfg,
  1320		[SLAVE_PCIE_CFG] = &qhs_pcie_cfg,
  1321		[SLAVE_PRNG] = &qhs_prng,
  1322		[SLAVE_QDSS_CFG] = &qhs_qdss_cfg,
  1323		[SLAVE_QSPI_0] = &qhs_qspi,
  1324		[SLAVE_QUP_3] = &qhs_qup02,
  1325		[SLAVE_QUP_1] = &qhs_qup1,
  1326		[SLAVE_QUP_2] = &qhs_qup2,
  1327		[SLAVE_SDCC_2] = &qhs_sdc2,
  1328		[SLAVE_SDCC_4] = &qhs_sdc4,
  1329		[SLAVE_SPSS_CFG] = &qhs_spss_cfg,
  1330		[SLAVE_TCSR] = &qhs_tcsr,
  1331		[SLAVE_TLMM] = &qhs_tlmm,
  1332		[SLAVE_UFS_MEM_CFG] = &qhs_ufs_mem_cfg,
  1333		[SLAVE_USB3_0] = &qhs_usb3_0,
  1334		[SLAVE_VENUS_CFG] = &qhs_venus_cfg,
  1335		[SLAVE_VSENSE_CTRL_CFG] = &qhs_vsense_ctrl_cfg,
  1336		[SLAVE_CNOC_MNOC_CFG] = &qss_mnoc_cfg,
  1337		[SLAVE_PCIE_ANOC_CFG] = &qss_pcie_anoc_cfg,
  1338		[SLAVE_QDSS_STM] = &xs_qdss_stm,
  1339		[SLAVE_TCU] = &xs_sys_tcu_cfg,
  1340	};
  1341	
  1342	static struct qcom_icc_desc sm8750_cnoc_cfg = {
  1343		.nodes = cnoc_cfg_nodes,
  1344		.num_nodes = ARRAY_SIZE(cnoc_cfg_nodes),
  1345		.bcms = cnoc_cfg_bcms,
  1346		.num_bcms = ARRAY_SIZE(cnoc_cfg_bcms),
  1347	};
  1348	
  1349	static struct qcom_icc_bcm *cnoc_main_bcms[] = {
  1350		&bcm_cn0,
  1351	};
  1352	
  1353	static struct qcom_icc_node *cnoc_main_nodes[] = {
  1354		[MASTER_GEM_NOC_CNOC] = &qnm_gemnoc_cnoc,
  1355		[MASTER_GEM_NOC_PCIE_SNOC] = &qnm_gemnoc_pcie,
  1356		[SLAVE_AOSS] = &qhs_aoss,
  1357		[SLAVE_IPA_CFG] = &qhs_ipa,
  1358		[SLAVE_IPC_ROUTER_CFG] = &qhs_ipc_router,
  1359		[SLAVE_SOCCP] = &qhs_soccp,
  1360		[SLAVE_TME_CFG] = &qhs_tme_cfg,
  1361		[SLAVE_APPSS] = &qns_apss,
  1362		[SLAVE_CNOC_CFG] = &qss_cfg,
  1363		[SLAVE_DDRSS_CFG] = &qss_ddrss_cfg,
  1364		[SLAVE_BOOT_IMEM] = &qxs_boot_imem,
  1365		[SLAVE_IMEM] = &qxs_imem,
  1366		[SLAVE_BOOT_IMEM_2] = &qxs_modem_boot_imem,
  1367		[SLAVE_SERVICE_CNOC] = &srvc_cnoc_main,
  1368		[SLAVE_PCIE_0] = &xs_pcie,
  1369	};
  1370	
  1371	static struct qcom_icc_desc sm8750_cnoc_main = {
  1372		.nodes = cnoc_main_nodes,
  1373		.num_nodes = ARRAY_SIZE(cnoc_main_nodes),
  1374		.bcms = cnoc_main_bcms,
  1375		.num_bcms = ARRAY_SIZE(cnoc_main_bcms),
  1376	};
  1377	
  1378	static struct qcom_icc_bcm *gem_noc_bcms[] = {
  1379		&bcm_sh0,
  1380		&bcm_sh1,
  1381		&bcm_ubw0,
  1382	};
  1383	
  1384	static struct qcom_icc_node *gem_noc_nodes[] = {
  1385		[MASTER_GPU_TCU] = &alm_gpu_tcu,
  1386		[MASTER_SYS_TCU] = &alm_sys_tcu,
  1387		[MASTER_APPSS_PROC] = &chm_apps,
  1388		[MASTER_GFX3D] = &qnm_gpu,
  1389		[MASTER_LPASS_GEM_NOC] = &qnm_lpass_gemnoc,
  1390		[MASTER_MSS_PROC] = &qnm_mdsp,
  1391		[MASTER_MNOC_HF_MEM_NOC] = &qnm_mnoc_hf,
  1392		[MASTER_MNOC_SF_MEM_NOC] = &qnm_mnoc_sf,
  1393		[MASTER_COMPUTE_NOC] = &qnm_nsp_gemnoc,
  1394		[MASTER_ANOC_PCIE_GEM_NOC] = &qnm_pcie,
  1395		[MASTER_SNOC_SF_MEM_NOC] = &qnm_snoc_sf,
  1396		[MASTER_UBWC_P] = &qnm_ubwc_p,
  1397		[MASTER_GIC] = &xm_gic,
  1398		[SLAVE_UBWC_P] = &chs_ubwc_p,
  1399		[SLAVE_GEM_NOC_CNOC] = &qns_gem_noc_cnoc,
  1400		[SLAVE_LLCC] = &qns_llcc,
  1401		[SLAVE_MEM_NOC_PCIE_SNOC] = &qns_pcie,
  1402	};
  1403	
  1404	static struct qcom_icc_desc sm8750_gem_noc = {
  1405		.nodes = gem_noc_nodes,
  1406		.num_nodes = ARRAY_SIZE(gem_noc_nodes),
  1407		.bcms = gem_noc_bcms,
  1408		.num_bcms = ARRAY_SIZE(gem_noc_bcms),
  1409	};
  1410	
> 1411	static struct qcom_icc_bcm *lpass_ag_noc_bcms[] = {
  1412	};
  1413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
