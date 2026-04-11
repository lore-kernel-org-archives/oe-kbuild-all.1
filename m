Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EEB29994B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 02:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775876340; cv=none; b=DgKvzV0EjmotpAVna2yQ84KvQQYgRG6WKf8gY2o2NN/EwWnPHRdlBl11pKR4v8D/y62rhzodjYzjzypSoOpGuOFdy2zMvaXt642FKBDHa9Kme7lUNwsL6xfInmXUfVTVvAvh8NHf3P7EyV1UCPlmf2gjJk56oeQvFhM15PYts/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775876340; c=relaxed/simple;
	bh=hRYF1ZdOmvi7oBubE0NPvEuWtkiOJKmeaMh22HVtL+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EggyGSE0PBQBT09OfbFiYrLjmWcVe3jfFqLxf7Bj94hhVMLme5R+qAEYcM5kefG8dmhlYStfCHy35SDPpp6u3UxQ51OQZOh3VABveDMc1pT8M3390j7YJN5gOSOeqAbcxP4k1EBmyHSF2XyFwyGjQXaUlirgsOLdafWjohHYRe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxZZNK9a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxZZNK9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775876339; x=1807412339;
  h=date:from:to:cc:subject:message-id;
  bh=hRYF1ZdOmvi7oBubE0NPvEuWtkiOJKmeaMh22HVtL+I=;
  b=IxZZNK9a6ixojNmVQVg2xv9Az3xs8sSVdXlZLJgTOc3kq0eCUcnUe5YY
   a++AcxaIzqzcPxzYfecBIlOY5i29Qv5lOSTbLBJEuiSW1XF1mTKyyBASF
   S6KlGS0OcMXt0tJrk08Yw7qsEog3wi16z9LytsoAuaqdFWemhGIDaKuXy
   cwvJebrI/jflwqJ+9okl4jx5S9PZ6tm76jZw0JRX+0jr4l5S1Dfh+PZG0
   ItHPQM6RRgtaJTmVymNKF3YnM7h9RJwunrvirwMIJ87gXJ4e4wANNxev6
   uh4XeBqMSC20Omt7OZ1dr6cpQ453WF2iCbQXz5pmyw8fJBtBMt2+aFuR2
   w==;
X-CSE-ConnectionGUID: GT1jFNz0Tqi1WToDpeEjxw==
X-CSE-MsgGUID: b7p+yqmnQtWecBVb/ni1cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76916566"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76916566"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 19:58:57 -0700
X-CSE-ConnectionGUID: GKPmZ0wtSzO9Tz6MIGGZ5w==
X-CSE-MsgGUID: 34oRCicRQ8mpIPp+Ct7apg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 19:58:55 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBOYe-000000000fx-4598;
	Sat, 11 Apr 2026 02:58:52 +0000
Date: Sat, 11 Apr 2026 10:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Sebastian Reichel <sre@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [sre-misc:thinkpad-t14s-x1e 71/106]
 drivers/remoteproc/imx_dsp_rproc.c:1179:26: warning: implicit conversion from
 'enum <anonymous>' to 'enum rproc_auto_boot'
Message-ID: <202604111031.c655r13k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   c368130866898c0f67e75fb8e36b0708e623553b
commit: 1d54655f688dc3470a318d3ee2b498b37d78f045 [71/106] remoteproc: core: Allow restarting detached remoteprocs with new firmware
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604111031.c655r13k-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111031.c655r13k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111031.c655r13k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/imx_dsp_rproc.c: In function 'imx_dsp_rproc_probe':
>> drivers/remoteproc/imx_dsp_rproc.c:1179:26: warning: implicit conversion from 'enum <anonymous>' to 'enum rproc_auto_boot' [-Wenum-conversion]
    1179 |         rproc->auto_boot = false;
         |                          ^


vim +1179 drivers/remoteproc/imx_dsp_rproc.c

ec0e5549f3586d Shengjiu Wang  2021-10-11  1126  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1127  static int imx_dsp_rproc_probe(struct platform_device *pdev)
ec0e5549f3586d Shengjiu Wang  2021-10-11  1128  {
ec0e5549f3586d Shengjiu Wang  2021-10-11  1129  	const struct imx_dsp_rproc_dcfg *dsp_dcfg;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1130  	struct device *dev = &pdev->dev;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1131  	struct imx_dsp_rproc *priv;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1132  	struct rproc *rproc;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1133  	const char *fw_name;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1134  	int ret;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1135  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1136  	dsp_dcfg = of_device_get_match_data(dev);
ec0e5549f3586d Shengjiu Wang  2021-10-11  1137  	if (!dsp_dcfg)
ec0e5549f3586d Shengjiu Wang  2021-10-11  1138  		return -ENODEV;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1139  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1140  	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
e819a62d52030a Peng Fan       2025-11-19  1141  	if (ret)
e819a62d52030a Peng Fan       2025-11-19  1142  		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
ec0e5549f3586d Shengjiu Wang  2021-10-11  1143  
8f12de7913af99 Andrew Davis   2024-01-23  1144  	rproc = devm_rproc_alloc(dev, "imx-dsp-rproc", &imx_dsp_rproc_ops,
8f12de7913af99 Andrew Davis   2024-01-23  1145  				 fw_name, sizeof(*priv));
ec0e5549f3586d Shengjiu Wang  2021-10-11  1146  	if (!rproc)
ec0e5549f3586d Shengjiu Wang  2021-10-11  1147  		return -ENOMEM;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1148  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1149  	priv = rproc->priv;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1150  	priv->rproc = rproc;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1151  	priv->dsp_dcfg = dsp_dcfg;
424f22b48ca38f Iuliana Prodan 2025-12-04  1152  	/* By default, host waits for fw_confirmation reply */
424f22b48ca38f Iuliana Prodan 2025-12-04  1153  	priv->flags |= WAIT_FW_CONFIRMATION;
ec0e5549f3586d Shengjiu Wang  2021-10-11  1154  
11bb42a94648af Iuliana Prodan 2023-02-17  1155  	if (no_mailboxes)
11bb42a94648af Iuliana Prodan 2023-02-17  1156  		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
11bb42a94648af Iuliana Prodan 2023-02-17  1157  	else
11bb42a94648af Iuliana Prodan 2023-02-17  1158  		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_alloc;
11bb42a94648af Iuliana Prodan 2023-02-17  1159  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1160  	dev_set_drvdata(dev, rproc);
ec0e5549f3586d Shengjiu Wang  2021-10-11  1161  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1162  	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);
ec0e5549f3586d Shengjiu Wang  2021-10-11  1163  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1164  	ret = imx_dsp_rproc_detect_mode(priv);
e819a62d52030a Peng Fan       2025-11-19  1165  	if (ret)
e819a62d52030a Peng Fan       2025-11-19  1166  		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_detect_mode\n");
ec0e5549f3586d Shengjiu Wang  2021-10-11  1167  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1168  	/* There are multiple power domains required by DSP on some platform */
ec0e5549f3586d Shengjiu Wang  2021-10-11  1169  	ret = imx_dsp_attach_pm_domains(priv);
3003773ad67ace Peng Fan       2025-11-19  1170  	if (ret < 0)
3003773ad67ace Peng Fan       2025-11-19  1171  		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
3003773ad67ace Peng Fan       2025-11-19  1172  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1173  	/* Get clocks */
ec0e5549f3586d Shengjiu Wang  2021-10-11  1174  	ret = imx_dsp_rproc_clk_get(priv);
3003773ad67ace Peng Fan       2025-11-19  1175  	if (ret)
3003773ad67ace Peng Fan       2025-11-19  1176  		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
ec0e5549f3586d Shengjiu Wang  2021-10-11  1177  
ec0e5549f3586d Shengjiu Wang  2021-10-11  1178  	init_completion(&priv->pm_comp);
ec0e5549f3586d Shengjiu Wang  2021-10-11 @1179  	rproc->auto_boot = false;
36951036a72527 Peng Fan       2025-11-19  1180  	ret = devm_rproc_add(dev, rproc);
3003773ad67ace Peng Fan       2025-11-19  1181  	if (ret)
3003773ad67ace Peng Fan       2025-11-19  1182  		return dev_err_probe(dev, ret, "rproc_add failed\n");
ec0e5549f3586d Shengjiu Wang  2021-10-11  1183  
c4c432dfb00fcb Shengjiu Wang  2025-07-22  1184  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
c4c432dfb00fcb Shengjiu Wang  2025-07-22  1185  
412060242303d3 Peng Fan       2025-11-19  1186  	return devm_pm_runtime_enable(dev);
ec0e5549f3586d Shengjiu Wang  2021-10-11  1187  }
ec0e5549f3586d Shengjiu Wang  2021-10-11  1188  

:::::: The code at line 1179 was first introduced by commit
:::::: ec0e5549f3586d2cb99a05edd006d722ebad912c remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX

:::::: TO: Shengjiu Wang <shengjiu.wang@nxp.com>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
