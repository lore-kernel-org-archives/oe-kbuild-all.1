Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D17328E7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694103259; x=1725639259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jnefjn4HP/xdvdwlqf5ycqN2mkHKL1Yq4tyryLuwYb0=;
  b=Z7eXednK2w9KHhHAWSufWPxsH295k2EHq6qRglGohGbX3aeI+hPJxqKT
   xIpWAIOR09+gmJsVcRtcwFkwQD8P3jfgnHqtI/7wsA7glEjzxsZX1vfUc
   OyDkPbCA/dR1Qs2c84u2lF6c+2JO+tBLHaCYqvPDbPKD6lKgppvKWY/Q2
   2dzd+FWLMX/JXmS6Yzl4C4SQGGGafLsqjBOrXRE+xV+y5vVzB4ZCY8tbR
   5WPdlCOJDbiouCaRGXn4nCkGCOnS/6guFv6zv2vCKk78j45llGXnoKqAz
   JAZJ8PIAponppc5Fh4ngI6Viq3m3jS8O1AQZOi8NUKDFewcTEXrDUBAjF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="374787088"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="374787088"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 09:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="865710956"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="865710956"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Sep 2023 09:10:10 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeHa4-0001Mg-0d;
	Thu, 07 Sep 2023 16:10:08 +0000
Date: Fri, 8 Sep 2023 00:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 488/618]
 drivers/interconnect/qcom/qcm2290.c:1201:10: error: 'const struct
 qcom_icc_desc' has no member named 'keep_alive'
Message-ID: <202309080012.VV6vJPe1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.5
head:   a369e6e4e96387fafd2686cb85ef80ebedec5909
commit: 9555b04b42304c433c6cf46c5254b39d3065c99b [488/618] interconnect: qcom: qcm2290: Enable keep_alive on all buses
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230908/202309080012.VV6vJPe1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080012.VV6vJPe1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080012.VV6vJPe1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/interconnect/qcom/qcm2290.c:1201:10: error: 'const struct qcom_icc_desc' has no member named 'keep_alive'
    1201 |         .keep_alive = true,
         |          ^~~~~~~~~~
   drivers/interconnect/qcom/qcm2290.c:1203:23: warning: initialized field overwritten [-Woverride-init]
    1203 |         .qos_offset = 0x8000,
         |                       ^~~~~~
   drivers/interconnect/qcom/qcm2290.c:1203:23: note: (near initialization for 'qcm2290_bimc.qos_offset')
   drivers/interconnect/qcom/qcm2290.c:1257:10: error: 'const struct qcom_icc_desc' has no member named 'keep_alive'
    1257 |         .keep_alive = true,
         |          ^~~~~~~~~~
   drivers/interconnect/qcom/qcm2290.c:1299:10: error: 'const struct qcom_icc_desc' has no member named 'keep_alive'
    1299 |         .keep_alive = true,
         |          ^~~~~~~~~~
   drivers/interconnect/qcom/qcm2290.c:1301:23: warning: initialized field overwritten [-Woverride-init]
    1301 |         .qos_offset = 0x15000,
         |                       ^~~~~~~
   drivers/interconnect/qcom/qcm2290.c:1301:23: note: (near initialization for 'qcm2290_snoc.qos_offset')
>> drivers/interconnect/qcom/qcm2290.c:1313:9: error: expected expression before '.' token
    1313 | +       .keep_alive = true,
         |         ^
   drivers/interconnect/qcom/qcm2290.c:1328:10: error: 'const struct qcom_icc_desc' has no member named 'keep_alive'
    1328 |         .keep_alive = true,
         |          ^~~~~~~~~~
   drivers/interconnect/qcom/qcm2290.c:1329:23: warning: initialized field overwritten [-Woverride-init]
    1329 |         .qos_offset = 0x15000,
         |                       ^~~~~~~
   drivers/interconnect/qcom/qcm2290.c:1329:23: note: (near initialization for 'qcm2290_mmnrt_virt.qos_offset')
   drivers/interconnect/qcom/qcm2290.c:1343:10: error: 'const struct qcom_icc_desc' has no member named 'keep_alive'
    1343 |         .keep_alive = true,
         |          ^~~~~~~~~~
   drivers/interconnect/qcom/qcm2290.c:1344:23: warning: initialized field overwritten [-Woverride-init]
    1344 |         .qos_offset = 0x15000,
         |                       ^~~~~~~
   drivers/interconnect/qcom/qcm2290.c:1344:23: note: (near initialization for 'qcm2290_mmrt_virt.qos_offset')


vim +1201 drivers/interconnect/qcom/qcm2290.c

  1195	
  1196	static const struct qcom_icc_desc qcm2290_bimc = {
  1197		.type = QCOM_ICC_BIMC,
  1198		.nodes = qcm2290_bimc_nodes,
  1199		.num_nodes = ARRAY_SIZE(qcm2290_bimc_nodes),
  1200		.regmap_cfg = &qcm2290_bimc_regmap_config,
> 1201		.keep_alive = true,
  1202		/* M_REG_BASE() in vendor msm_bus_bimc_adhoc driver */
  1203		.qos_offset = 0x8000,
  1204	};
  1205	
  1206	static struct qcom_icc_node * const qcm2290_cnoc_nodes[] = {
  1207		[MASTER_SNOC_CNOC] = &mas_snoc_cnoc,
  1208		[MASTER_QDSS_DAP] = &mas_qdss_dap,
  1209		[SLAVE_BIMC_CFG] = &slv_bimc_cfg,
  1210		[SLAVE_CAMERA_NRT_THROTTLE_CFG] = &slv_camera_nrt_throttle_cfg,
  1211		[SLAVE_CAMERA_RT_THROTTLE_CFG] = &slv_camera_rt_throttle_cfg,
  1212		[SLAVE_CAMERA_CFG] = &slv_camera_cfg,
  1213		[SLAVE_CLK_CTL] = &slv_clk_ctl,
  1214		[SLAVE_CRYPTO_0_CFG] = &slv_crypto_0_cfg,
  1215		[SLAVE_DISPLAY_CFG] = &slv_display_cfg,
  1216		[SLAVE_DISPLAY_THROTTLE_CFG] = &slv_display_throttle_cfg,
  1217		[SLAVE_GPU_CFG] = &slv_gpu_cfg,
  1218		[SLAVE_HWKM] = &slv_hwkm,
  1219		[SLAVE_IMEM_CFG] = &slv_imem_cfg,
  1220		[SLAVE_IPA_CFG] = &slv_ipa_cfg,
  1221		[SLAVE_LPASS] = &slv_lpass,
  1222		[SLAVE_MESSAGE_RAM] = &slv_message_ram,
  1223		[SLAVE_PDM] = &slv_pdm,
  1224		[SLAVE_PIMEM_CFG] = &slv_pimem_cfg,
  1225		[SLAVE_PKA_WRAPPER] = &slv_pka_wrapper,
  1226		[SLAVE_PMIC_ARB] = &slv_pmic_arb,
  1227		[SLAVE_PRNG] = &slv_prng,
  1228		[SLAVE_QDSS_CFG] = &slv_qdss_cfg,
  1229		[SLAVE_QM_CFG] = &slv_qm_cfg,
  1230		[SLAVE_QM_MPU_CFG] = &slv_qm_mpu_cfg,
  1231		[SLAVE_QPIC] = &slv_qpic,
  1232		[SLAVE_QUP_0] = &slv_qup_0,
  1233		[SLAVE_SDCC_1] = &slv_sdcc_1,
  1234		[SLAVE_SDCC_2] = &slv_sdcc_2,
  1235		[SLAVE_SNOC_CFG] = &slv_snoc_cfg,
  1236		[SLAVE_TCSR] = &slv_tcsr,
  1237		[SLAVE_USB3] = &slv_usb3,
  1238		[SLAVE_VENUS_CFG] = &slv_venus_cfg,
  1239		[SLAVE_VENUS_THROTTLE_CFG] = &slv_venus_throttle_cfg,
  1240		[SLAVE_VSENSE_CTRL_CFG] = &slv_vsense_ctrl_cfg,
  1241		[SLAVE_SERVICE_CNOC] = &slv_service_cnoc,
  1242	};
  1243	
  1244	static const struct regmap_config qcm2290_cnoc_regmap_config = {
  1245		.reg_bits	= 32,
  1246		.reg_stride	= 4,
  1247		.val_bits	= 32,
  1248		.max_register	= 0x8200,
  1249		.fast_io	= true,
  1250	};
  1251	
  1252	static const struct qcom_icc_desc qcm2290_cnoc = {
  1253		.type = QCOM_ICC_NOC,
  1254		.nodes = qcm2290_cnoc_nodes,
  1255		.num_nodes = ARRAY_SIZE(qcm2290_cnoc_nodes),
  1256		.regmap_cfg = &qcm2290_cnoc_regmap_config,
  1257		.keep_alive = true,
  1258	};
  1259	
  1260	static struct qcom_icc_node * const qcm2290_snoc_nodes[] = {
  1261		[MASTER_CRYPTO_CORE0] = &mas_crypto_core0,
  1262		[MASTER_SNOC_CFG] = &mas_snoc_cfg,
  1263		[MASTER_TIC] = &mas_tic,
  1264		[MASTER_ANOC_SNOC] = &mas_anoc_snoc,
  1265		[MASTER_BIMC_SNOC] = &mas_bimc_snoc,
  1266		[MASTER_PIMEM] = &mas_pimem,
  1267		[MASTER_QDSS_BAM] = &mas_qdss_bam,
  1268		[MASTER_QUP_0] = &mas_qup_0,
  1269		[MASTER_IPA] = &mas_ipa,
  1270		[MASTER_QDSS_ETR] = &mas_qdss_etr,
  1271		[MASTER_SDCC_1] = &mas_sdcc_1,
  1272		[MASTER_SDCC_2] = &mas_sdcc_2,
  1273		[MASTER_QPIC] = &mas_qpic,
  1274		[MASTER_USB3_0] = &mas_usb3_0,
  1275		[SLAVE_APPSS] = &slv_appss,
  1276		[SLAVE_SNOC_CNOC] = &slv_snoc_cnoc,
  1277		[SLAVE_IMEM] = &slv_imem,
  1278		[SLAVE_PIMEM] = &slv_pimem,
  1279		[SLAVE_SNOC_BIMC] = &slv_snoc_bimc,
  1280		[SLAVE_SERVICE_SNOC] = &slv_service_snoc,
  1281		[SLAVE_QDSS_STM] = &slv_qdss_stm,
  1282		[SLAVE_TCU] = &slv_tcu,
  1283		[SLAVE_ANOC_SNOC] = &slv_anoc_snoc,
  1284	};
  1285	
  1286	static const struct regmap_config qcm2290_snoc_regmap_config = {
  1287		.reg_bits	= 32,
  1288		.reg_stride	= 4,
  1289		.val_bits	= 32,
  1290		.max_register	= 0x60200,
  1291		.fast_io	= true,
  1292	};
  1293	
  1294	static const struct qcom_icc_desc qcm2290_snoc = {
  1295		.type = QCOM_ICC_QNOC,
  1296		.nodes = qcm2290_snoc_nodes,
  1297		.num_nodes = ARRAY_SIZE(qcm2290_snoc_nodes),
  1298		.regmap_cfg = &qcm2290_snoc_regmap_config,
> 1299		.keep_alive = true,
  1300		/* Vendor DT node fab-sys_noc property 'qcom,base-offset' */
  1301		.qos_offset = 0x15000,
  1302	};
  1303	
  1304	static struct qcom_icc_node * const qcm2290_qup_virt_nodes[] = {
  1305		[MASTER_QUP_CORE_0] = &mas_qup_core_0,
  1306		[SLAVE_QUP_CORE_0] = &slv_qup_core_0
  1307	};
  1308	
  1309	static const struct qcom_icc_desc qcm2290_qup_virt = {
  1310		.type = QCOM_ICC_QNOC,
  1311		.nodes = qcm2290_qup_virt_nodes,
  1312		.num_nodes = ARRAY_SIZE(qcm2290_qup_virt_nodes),
> 1313	+	.keep_alive = true,
  1314	};
  1315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
