Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F654705D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 00:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791332069; cv=none; b=i1ORe07yIp/XeBBhSzAM1GZ/ksrp5AcDliAcwkaccOCQW3eFuVymgj5IK2xDgh3iWToXTAcjrb3yiS5/BYJVy03yPIKMCXBC4OIzR24Wz/GVNhPm5leL9X85zFpfVJ/qZcRBXo1ybh3VVu3BiJVex7ux84j1EknXZHBVJlkmoUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791332069; c=relaxed/simple;
	bh=uvDDzRXBZ4AQbR4Lu65TYZEMsC9PqldF0FY+DzA6DAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Umn0TbgiC9bw+tE9xBkuKTP0waStpvm3azpNJokAj+TUcfCr3wS0LASP/8Tzpxl18uT3bGWUzjUSrxAjjCNH/eJXeRc0gIEvHioyfndHDslZ807kXlRLBlYHXZjnsFvlzothhS0oSj2w51Y/CJctWJO+yLGNzQL7ktAx0zn2zDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjLQSd6M; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjLQSd6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791332067; x=1822868067;
  h=date:from:to:cc:subject:message-id;
  bh=uvDDzRXBZ4AQbR4Lu65TYZEMsC9PqldF0FY+DzA6DAY=;
  b=PjLQSd6MEiBXYBDsaTNn/jUHLkZ/ULbsVo2seTfkTt6iC2vV8kCTY94l
   g6vFno3VnixQdjvexd5+daS4cXPHbc9Zg84/o/YoUKDvwsPRk0G9lIi6m
   6wkqnkCAQJYLU9sv/Oh/gN8KDzIsMfICRxnfwbLc7gCFFEL/AJ5Qktr4j
   7xyD5g3A0UMpAHGJkOqv0Mm1DVupsPXnGxhHxlP+Saqioqu9HAz49JZ+T
   lYIzoYm/2CVv8osEHwOWvYYdGGrGIoRQD3vVRIsgEigaJuIIryqc/nef2
   pqKhDONouNtgSWsqipK/oGGvIaedPchS1jxKDjaqQqEn4zHKwNbb6DQH1
   Q==;
X-CSE-ConnectionGUID: E13zK1l4RCaOxHwNhnrHCA==
X-CSE-MsgGUID: GCRLYR4GTXKg0B8J1OQOpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="78290"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="78290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 17:14:27 -0700
X-CSE-ConnectionGUID: McvPP8MbTOarCAVqDqtMyQ==
X-CSE-MsgGUID: 0moEOqo8R1WXk6P1lecX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="305262573"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2026 17:14:24 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEFIc-000000002KC-0k8Z;
	Wed, 07 Oct 2026 00:14:22 +0000
Date: Wed, 07 Oct 2026 08:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [morimoto:sound-cleanup-2026-10-02 0/332]
 sound/soc/sof/amd/acp.c:1153:27: error: implicit declaration of function
 'acpi_find_child_device'; did you mean 'acpi_match_device'?
Message-ID: <202610070851.VWGLXfJH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-02
head:   f081696132aafae20dd9ebf62abbf292789b89f9
commit: 203ea76c4b0a84f0c70e0ab27503a29f77e0a471 [0/332] ASoC: SOF: amd: add ACP7.B/7.F PDM controller scan and pdata propagation
config: i386-buildonly-randconfig-1003-20261007 (https://download.01.org/0day-ci/archive/20261007/202610070851.VWGLXfJH-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070851.VWGLXfJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070851.VWGLXfJH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/sof/amd/acp.c: In function 'amd_sof_acp7x_probe':
>> sound/soc/sof/amd/acp.c:1153:27: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
    1153 |                 pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
         |                           ^~~~~~~~~~~~~~~~~~~~~~
         |                           acpi_match_device
>> sound/soc/sof/amd/acp.c:1153:25: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1153 |                 pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
         |                         ^
   cc1: some warnings being treated as errors


vim +1153 sound/soc/sof/amd/acp.c

  1090	
  1091	int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
  1092	{
  1093		struct pci_dev *pci = to_pci_dev(sdev->dev);
  1094		struct acp_dev_data *adata;
  1095		const struct sof_amd_acp_desc *chip;
  1096		const union acpi_object *obj;
  1097		struct acpi_device *adev;
  1098		struct acpi_device *pdm_dev;
  1099		unsigned int addr;
  1100		unsigned int irqflags;
  1101		int ret;
  1102	
  1103		chip = get_chip_info(sdev->pdata);
  1104		if (!chip) {
  1105			dev_err(sdev->dev, "no such device supported, chip id:%x\n", pci->device);
  1106			return -EIO;
  1107		}
  1108		adata = devm_kzalloc(sdev->dev, sizeof(struct acp_dev_data), GFP_KERNEL);
  1109		if (!adata)
  1110			return -ENOMEM;
  1111	
  1112		adata->dev = sdev;
  1113		adata->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
  1114								PLATFORM_DEVID_NONE, NULL, 0);
  1115		if (IS_ERR(adata->dmic_dev)) {
  1116			dev_err(sdev->dev, "failed to register platform for dmic codec\n");
  1117			return PTR_ERR(adata->dmic_dev);
  1118		}
  1119	
  1120		addr = pci_resource_start(pci, ACP_DSP_BAR);
  1121		sdev->bar[ACP_DSP_BAR] = devm_ioremap(sdev->dev, addr, pci_resource_len(pci, ACP_DSP_BAR));
  1122		if (!sdev->bar[ACP_DSP_BAR]) {
  1123			dev_err(sdev->dev, "ioremap error\n");
  1124			ret = -ENXIO;
  1125			goto unregister_dev;
  1126		}
  1127	
  1128		pci_set_master(pci);
  1129		adata->addr = addr;
  1130		adata->reg_range = chip->reg_end_addr - chip->reg_start_addr;
  1131		adata->pci_rev = pci->revision;
  1132		mutex_init(&adata->acp_lock);
  1133		sdev->pdata->hw_pdata = adata;
  1134	
  1135		ret = acp_init(sdev);
  1136		if (ret < 0)
  1137			goto unregister_dev;
  1138	
  1139		adev = ACPI_COMPANION(&pci->dev);
  1140	
  1141		sdev->ipc_irq = pci->irq;
  1142		irqflags = IRQF_SHARED;
  1143	
  1144		ret = request_threaded_irq(pci->irq, acp7x_irq_handler, acp_irq_thread,
  1145					   irqflags, "AudioDSP", sdev);
  1146		if (ret < 0) {
  1147			dev_err(sdev->dev, "failed to register IRQ %d\n", sdev->ipc_irq);
  1148			goto unregister_dev;
  1149		}
  1150	
  1151		if (adev) {
  1152			/* DMIC ACPI child address is 2 on ACP7x platforms */
> 1153			pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
  1154			if (pdm_dev)
  1155				acp_sof_scan_pdm_devices(sdev, pdm_dev);
  1156	
  1157			if (!acpi_dev_get_property(adev, "acp-sof-signed-firmware-image",
  1158						   ACPI_TYPE_INTEGER, &obj))
  1159				adata->acp_sof_signed_firmware_image = obj->integer.value;
  1160		}
  1161	
  1162		sdev->dsp_box.offset = 0;
  1163		sdev->dsp_box.size = BOX_SIZE_512;
  1164	
  1165		sdev->host_box.offset = sdev->dsp_box.offset + sdev->dsp_box.size;
  1166		sdev->host_box.size = BOX_SIZE_512;
  1167	
  1168		sdev->debug_box.offset = sdev->host_box.offset + sdev->host_box.size;
  1169		sdev->debug_box.size = BOX_SIZE_1024;
  1170	
  1171		if (adata->acp_sof_signed_firmware_image) {
  1172			adata->fw_code_bin = devm_kasprintf(sdev->dev, GFP_KERNEL,
  1173							    "sof-%s-code.bin", chip->name);
  1174			if (!adata->fw_code_bin) {
  1175				ret = -ENOMEM;
  1176				goto free_ipc_irq;
  1177			}
  1178			adata->fw_data_bin = devm_kasprintf(sdev->dev, GFP_KERNEL,
  1179							    "sof-%s-data.bin", chip->name);
  1180			if (!adata->fw_data_bin) {
  1181				ret = -ENOMEM;
  1182				goto free_ipc_irq;
  1183			}
  1184		}
  1185	
  1186		adata->enable_fw_debug = enable_fw_debug;
  1187		acp_memory_init(sdev);
  1188		acp_dsp_stream_init(sdev);
  1189	
  1190		return 0;
  1191	
  1192	free_ipc_irq:
  1193		free_irq(sdev->ipc_irq, sdev);
  1194	unregister_dev:
  1195		platform_device_unregister(adata->dmic_dev);
  1196		return ret;
  1197	}
  1198	EXPORT_SYMBOL_NS(amd_sof_acp7x_probe, "SND_SOC_SOF_AMD_COMMON");
  1199	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
