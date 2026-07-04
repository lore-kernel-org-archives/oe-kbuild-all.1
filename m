Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B795731E855
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 09:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157012; cv=none; b=MPf8FPGj3Lw+NSTKAqUgs1Ie58RSTWNjZJXXryU2oVpX1JCpjMiLGzqg0Ry+EuRhhiHp7qdUkqxw6SBVng7D7vr/TLICAqgsJYPHoQjvdmtQLOBFbYd+JGBAnlDcme+lvck5cuXo8YwiYsQNL7580gIFy8Dj47XTPCRoYLOt+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157012; c=relaxed/simple;
	bh=R2s0VGZ3Ct6pRtVaKbHJfvUMEJxRoi8HgdkKNNYYgao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U9CnmwgIAC2FmKwupcnrKEylIUJWDlwE76vMiSKvOoifCQFg/+TiLbP7NfAeVqzSInrQ6hH8kdphkK1ZCd423BPlvUmg7+zKMVgy06m+O9OJg1AMVwh24Vo5GX3Zq9d15wHwLU5HonFGMkiq5y9B/7Aa94E7oshmbODn6tDGPVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1y6M97p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1y6M97p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783157010; x=1814693010;
  h=date:from:to:cc:subject:message-id;
  bh=R2s0VGZ3Ct6pRtVaKbHJfvUMEJxRoi8HgdkKNNYYgao=;
  b=d1y6M97ptyq3I7ALFfD+dFO2fJ+J4TtR72lf55vg2wnxptT1AsFDV1g7
   2MRiAn2nc9bHSk8pWUg4N2lVK5ydhkuOxHcZwOJpsQ3BUKkrG1Ev4oQSj
   gyLjC+g3PVWqX1uXIxR4ulBDOkAyhfgv3sPnhK+E4nRWYjdNsw9y0hFUd
   zkc6REpt4XEZYiICARN7Zufs26ltIoAf+BKni0d5o8XFNv/vO29hwkFfz
   EeJRsOKB2rTX2u5BG7Sn5+a2c1Z6cnd+8wWBfchuHJigw2RNH6SAUKaxN
   ya3sb/1cfO/wY8nuzu4cYLBoh4ufsoj1PkF7eW7slKJ31Q3zqj492ykTh
   A==;
X-CSE-ConnectionGUID: AJ6h8i+7RfqpDkggvmciFQ==
X-CSE-MsgGUID: ufJjXAFAQV25Vug0PXBzfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="109422503"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="109422503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 02:23:29 -0700
X-CSE-ConnectionGUID: MIzxtIa1QweLH1JJ4iTrwA==
X-CSE-MsgGUID: 1dnJN9bdSFSFoaTt6fWUoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="276487246"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2026 02:23:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfwaq-00000000Cxz-3oOK;
	Sat, 04 Jul 2026 09:23:24 +0000
Date: Sat, 04 Jul 2026 17:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 32/121]
 drivers/remoteproc/imx_dsp_rproc.c:1161:26: warning: implicit conversion from
 'enum <anonymous>' to 'enum rproc_auto_boot'
Message-ID: <202607041725.aYV2Wi3S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: 4c74b4c4ff2b1cbf3a174ccee42cd5668d114225 [32/121] remoteproc: core: Allow restarting detached remoteprocs with new firmware
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260704/202607041725.aYV2Wi3S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041725.aYV2Wi3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041725.aYV2Wi3S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/imx_dsp_rproc.c: In function 'imx_dsp_rproc_probe':
>> drivers/remoteproc/imx_dsp_rproc.c:1161:26: warning: implicit conversion from 'enum <anonymous>' to 'enum rproc_auto_boot' [-Wenum-conversion]
    1161 |         rproc->auto_boot = false;
         |                          ^


vim +1161 drivers/remoteproc/imx_dsp_rproc.c

ec0e5549f3586d Shengjiu Wang  2021-10-11  1108  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1109  static int imx_dsp_rproc_probe(struct platform_device *pdev)
ec0e5549f3586d Shengjiu Wang  2021-10-11  1110  {
ec0e5549f3586d Shengjiu Wang  2021-10-11  1111  	const struct imx_dsp_rproc_dcfg *dsp_dcfg;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1112  	struct device *dev = &pdev->dev;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1113  	struct imx_dsp_rproc *priv;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1114  	struct rproc *rproc;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1115  	const char *fw_name;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1116  	int ret;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1117  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1118  	dsp_dcfg = of_device_get_match_data(dev);
ec0e5549f3586d Shengjiu Wang  2021-10-11  1119  	if (!dsp_dcfg)
ec0e5549f3586d Shengjiu Wang  2021-10-11  1120  		return -ENODEV;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1121  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1122  	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
e819a62d52030a Peng Fan       2025-11-19  1123  	if (ret)
e819a62d52030a Peng Fan       2025-11-19  1124  		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
ec0e5549f3586d Shengjiu Wang  2021-10-11  1125  
8f12de7913af99 Andrew Davis   2024-01-23  1126  	rproc = devm_rproc_alloc(dev, "imx-dsp-rproc", &imx_dsp_rproc_ops,
8f12de7913af99 Andrew Davis   2024-01-23  1127  				 fw_name, sizeof(*priv));
ec0e5549f3586d Shengjiu Wang  2021-10-11  1128  	if (!rproc)
ec0e5549f3586d Shengjiu Wang  2021-10-11  1129  		return -ENOMEM;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1130  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1131  	priv = rproc->priv;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1132  	priv->rproc = rproc;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1133  	priv->dsp_dcfg = dsp_dcfg;
ab7bca5acdb7f7 Iuliana Prodan 2025-04-16  1134  	/* By default, host waits for fw_ready reply */
ab7bca5acdb7f7 Iuliana Prodan 2025-04-16  1135  	priv->flags |= WAIT_FW_READY;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1136  
11bb42a94648af Iuliana Prodan 2023-02-17  1137  	if (no_mailboxes)
11bb42a94648af Iuliana Prodan 2023-02-17  1138  		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
11bb42a94648af Iuliana Prodan 2023-02-17  1139  	else
11bb42a94648af Iuliana Prodan 2023-02-17  1140  		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_alloc;
11bb42a94648af Iuliana Prodan 2023-02-17  1141  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1142  	dev_set_drvdata(dev, rproc);
ec0e5549f3586d Shengjiu Wang  2021-10-11  1143  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1144  	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);
ec0e5549f3586d Shengjiu Wang  2021-10-11  1145  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1146  	ret = imx_dsp_rproc_detect_mode(priv);
e819a62d52030a Peng Fan       2025-11-19  1147  	if (ret)
e819a62d52030a Peng Fan       2025-11-19  1148  		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_detect_mode\n");
ec0e5549f3586d Shengjiu Wang  2021-10-11  1149  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1150  	/* There are multiple power domains required by DSP on some platform */
ec0e5549f3586d Shengjiu Wang  2021-10-11  1151  	ret = imx_dsp_attach_pm_domains(priv);
3003773ad67ace Peng Fan       2025-11-19  1152  	if (ret < 0)
3003773ad67ace Peng Fan       2025-11-19  1153  		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
3003773ad67ace Peng Fan       2025-11-19  1154  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1155  	/* Get clocks */
ec0e5549f3586d Shengjiu Wang  2021-10-11  1156  	ret = imx_dsp_rproc_clk_get(priv);
3003773ad67ace Peng Fan       2025-11-19  1157  	if (ret)
3003773ad67ace Peng Fan       2025-11-19  1158  		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
ec0e5549f3586d Shengjiu Wang  2021-10-11  1159  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1160  	init_completion(&priv->pm_comp);
ec0e5549f3586d Shengjiu Wang  2021-10-11 @1161  	rproc->auto_boot = false;
36951036a72527 Peng Fan       2025-11-19  1162  	ret = devm_rproc_add(dev, rproc);
3003773ad67ace Peng Fan       2025-11-19  1163  	if (ret)
3003773ad67ace Peng Fan       2025-11-19  1164  		return dev_err_probe(dev, ret, "rproc_add failed\n");
ec0e5549f3586d Shengjiu Wang  2021-10-11  1165  
c4c432dfb00fcb Shengjiu Wang  2025-07-22  1166  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
c4c432dfb00fcb Shengjiu Wang  2025-07-22  1167  
412060242303d3 Peng Fan       2025-11-19  1168  	return devm_pm_runtime_enable(dev);
ec0e5549f3586d Shengjiu Wang  2021-10-11  1169  }
ec0e5549f3586d Shengjiu Wang  2021-10-11  1170  

:::::: The code at line 1161 was first introduced by commit
:::::: ec0e5549f3586d2cb99a05edd006d722ebad912c remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX

:::::: TO: Shengjiu Wang <shengjiu.wang@nxp.com>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
