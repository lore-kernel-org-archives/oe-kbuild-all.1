Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877923BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 04:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724905547; cv=none; b=bSHjveMvlFWGUyvlmW9JqG5Cfta+4ROk5lb3lhjoBJiEQwpccn64l13epWTbdviNusJME94GcNyxIcgQtGxlDf3upKnVRuEPkch0NpS3pyD93yb9//JmJK7oIhPauNT22DhdDVApO/wKgTM5Dgdahm18l5I5zCGN3pDAxco+9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724905547; c=relaxed/simple;
	bh=jUr1/ZEx4XJtTnyRG8k54NZQVxlRbxRUKDdtgAtaAgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJvvbya3cKpTmehgT25kivkg2NF68V8sUZcIlMWgK2EtVAnawWEZin16iTcQdvPU7G6vSiBq2eS2su4auNIoBQTX9fP9FA7gUQNqj0TrlSns4IopqDvQ303FTpSoPZAfERMIXMpq+3EhfNcoM+xeaFQ8SFH16ESwW1CJBxeU38g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwQNcFJt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwQNcFJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724905545; x=1756441545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jUr1/ZEx4XJtTnyRG8k54NZQVxlRbxRUKDdtgAtaAgo=;
  b=BwQNcFJtFQO1eftxwK0WvikXqEvQ5Cnk3oy8n41osRWe0/6P9AgMSkrQ
   P3xj72clV0KROu95bmEDdgJSEQniJAhVsshN/6GwggP/K7E9d6JLlmoZe
   ZRIMLuyePQBJsPbPt6Q9UL9pOltpS91JaQkQSox1VhzTamFjR2HaqorA4
   ieGmUH3zht23mYZNBNUPewZqdFtXq0yW7h5zCIWjyCbvTB8iRwUkec0oV
   CDVraiQ4Gg2a4TKAlu/8AWfHn0QVqfDtFZvST/O5bVIV2R6Dg3cxijHl6
   qfsdtWLGvMv53V5yvs1di3Y1VNw4m0rkEnflcs3epGfX63dSRkUpM0d4C
   Q==;
X-CSE-ConnectionGUID: iImo5JY5TWSVNm3F5LgORg==
X-CSE-MsgGUID: 226OgpHGS1apvGrDzopUEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27265980"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="27265980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 21:25:45 -0700
X-CSE-ConnectionGUID: Jb0UBv/dSFidWIATJlmwEQ==
X-CSE-MsgGUID: aS0K3Qx9S/OWWlKlxfcg2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="63938896"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Aug 2024 21:25:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjWj7-000Lf8-1G;
	Thu, 29 Aug 2024 04:25:41 +0000
Date: Thu, 29 Aug 2024 12:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, mufengyan <mufengyan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29656/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:597:5: warning:
 "CONFIG_HNS3_UBL" is not defined, evaluates to 0
Message-ID: <202408291246.sVhHc79w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4b9c4f6ae938c4277cb28e2364b28a566e680cd
commit: e8a59242bccb7ffe062097be020e67bacffc82cf [29656/30000] UNIC: Solve the problem of redundant print in ub mode
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240829/202408291246.sVhHc79w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291246.sVhHc79w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291246.sVhHc79w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c: In function 'hclge_tm_qs_shaper_cfg':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:597:5: warning: "CONFIG_HNS3_UBL" is not defined, evaluates to 0 [-Wundef]
     597 | #if CONFIG_HNS3_UBL
         |     ^~~~~~~~~~~~~~~


vim +/CONFIG_HNS3_UBL +597 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c

   586	
   587	int hclge_tm_qs_shaper_cfg(struct hclge_vport *vport, int max_tx_rate)
   588	{
   589		struct hnae3_knic_private_info *kinfo = &vport->nic.kinfo;
   590		struct hclge_qs_shapping_cmd *shap_cfg_cmd;
   591		struct hclge_shaper_ir_para ir_para;
   592		struct hclge_dev *hdev = vport->back;
   593		struct hclge_desc desc;
   594		u32 shaper_para;
   595		int ret, i;
   596	
 > 597	#if CONFIG_HNS3_UBL
   598		/* vf rate limiting is not supported in ub link mode, a success message
   599		 * is directly returned to prevent redundant failure information from
   600		 * being printed in the reset and uninstallation processes.
   601		 */
   602		if (hnae3_dev_ubl_supported(hdev->ae_dev))
   603			return 0;
   604	#endif
   605	
   606		if (!max_tx_rate)
   607			max_tx_rate = hdev->ae_dev->dev_specs.max_tm_rate;
   608	
   609		ret = hclge_shaper_para_calc(max_tx_rate, HCLGE_SHAPER_LVL_QSET,
   610					     &ir_para,
   611					     hdev->ae_dev->dev_specs.max_tm_rate);
   612		if (ret)
   613			return ret;
   614	
   615		shaper_para = hclge_tm_get_shapping_para(ir_para.ir_b, ir_para.ir_u,
   616							 ir_para.ir_s,
   617							 HCLGE_SHAPER_BS_U_DEF,
   618							 HCLGE_SHAPER_BS_S_DEF);
   619	
   620		for (i = 0; i < kinfo->tc_info.num_tc; i++) {
   621			hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_QCN_SHAPPING_CFG,
   622						   false);
   623	
   624			shap_cfg_cmd = (struct hclge_qs_shapping_cmd *)desc.data;
   625			shap_cfg_cmd->qs_id = cpu_to_le16(vport->qs_offset + i);
   626			shap_cfg_cmd->qs_shapping_para = cpu_to_le32(shaper_para);
   627	
   628			hnae3_set_bit(shap_cfg_cmd->flag, HCLGE_TM_RATE_VLD, 1);
   629			shap_cfg_cmd->qs_rate = cpu_to_le32(max_tx_rate);
   630	
   631			ret = hclge_cmd_send(&hdev->hw, &desc, 1);
   632			if (ret) {
   633				dev_err(&hdev->pdev->dev,
   634					"vport%u, qs%u failed to set tx_rate:%d, ret=%d\n",
   635					vport->vport_id, shap_cfg_cmd->qs_id,
   636					max_tx_rate, ret);
   637				return ret;
   638			}
   639		}
   640	
   641		return 0;
   642	}
   643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
