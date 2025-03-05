Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B22586CC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 18:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741198603; cv=none; b=GzJlobZ864S+F9QG7Byzjs3vXh0HcEpaD+218aWkUhyEwrcKW+E9bz9JNWos23Dny0Gc9IQ7WWxXbtDY1pBP4bTKDlOE0A/i71QqnVZ0pnyhAUq5El7hchWv2iv6X+OIYC4ILkWzQQdG/XQFEz6RT3KWE9GyW8MFZE/7GmS4p84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741198603; c=relaxed/simple;
	bh=IuhiorAeQVnzBjx5HSQYhc0QJ+5NAQdcEifEXX+IIt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a79Y8ZZICva4SWobMRjUHUjDpdxbLUSqs7zus4ytncKYn0glYYqrkS/QCZILKyNJl/t81DgD525IxAM+88royaK9/Dgo4YZEAZhyZaDOJY0ehuVWIKpbiTcaQnCj4l9WjDnjsHZNqCs0oI1Lm2p4xPGeQiwfxtKgOOxvWi794/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFNKXnsF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFNKXnsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741198601; x=1772734601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IuhiorAeQVnzBjx5HSQYhc0QJ+5NAQdcEifEXX+IIt0=;
  b=SFNKXnsFSvcudopV0dFAW2YzUVh7fiAJAzEkYaKH1vejf6xVgkZ9BRTR
   /hiyaJqazIhiGHYIUjWjPaT4CfNrTwgSMvCsEM1oQHjHFh6NZqWsFxB5d
   0J92RpIPFxqPcEXge4MCzO0yK/27Ujr/0iEPO5aNnd8fj2OcojczHCD5s
   d0tJJvfIcQHy4pI0S5uelKOWlB9yXpGqD8QpHfvTuljYwsWcSamKGkjIa
   S3+2U3LcSL17sz1llVCfY6AwMPSgqGLLjBIz0uPkkwczZ1J4ywhWj/UXF
   qiFRckpPqQaXjQkiP0k4PvU+2naOxr7xmPvEmuVkMHjmxfF5QKsjpNINe
   g==;
X-CSE-ConnectionGUID: Sb7ouUsrT5SQN4G1nDGsmw==
X-CSE-MsgGUID: CDRz12WeRwe2Jj+3tJwoKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42309699"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42309699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 10:16:39 -0800
X-CSE-ConnectionGUID: pXyTLAHCRMyz68hR9SIvrQ==
X-CSE-MsgGUID: kSx3iCvITgSvNkTh5sVCCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="123870140"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2025 10:16:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tptIG-000Lrm-20;
	Wed, 05 Mar 2025 18:16:32 +0000
Date: Thu, 6 Mar 2025 02:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
	andersson@kernel.org, konradybcio@kernel.org,
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_msavaliy@quicinc.com,
	quic_anupkulk@quicinc.com,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <202503060145.gERd9R0P-lkp@intel.com>
References: <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303124349.3474185-7-quic_vdadhani@quicinc.com>

Hi Viken,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next tty/tty-testing tty/tty-next tty/tty-linus linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-qcom-geni-se-Add-firmware-name-property-for-firmware-loading/20250303-204936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250303124349.3474185-7-quic_vdadhani%40quicinc.com
patch subject: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
config: mips-randconfig-r131-20250305 (https://download.01.org/0day-ci/archive/20250306/202503060145.gERd9R0P-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce: (https://download.01.org/0day-ci/archive/20250306/202503060145.gERd9R0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060145.gERd9R0P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/qcom-geni-se.c:1215:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/soc/qcom/qcom-geni-se.c:1215:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/soc/qcom/qcom-geni-se.c:1215:9: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +1215 drivers/soc/qcom/qcom-geni-se.c

  1112	
  1113	/**
  1114	 * geni_load_se_fw() - Load Serial Engine specific firmware.
  1115	 * @rsc: Pointer to a structure representing SE-related resources.
  1116	 * @fw: Pointer to the firmware structure.
  1117	 *
  1118	 * Load the protocol firmware into the IRAM of the Serial Engine.
  1119	 *
  1120	 * Return: 0 if successful, otherwise return an error value.
  1121	 */
  1122	static int geni_load_se_fw(struct qup_se_rsc *rsc, const struct firmware *fw)
  1123	{
  1124		const u32 *fw_val_arr, *cfg_val_arr;
  1125		const u8 *cfg_idx_arr;
  1126		u32 i, reg_value, mask, ramn_cnt;
  1127		int ret;
  1128		struct elf_se_hdr *hdr;
  1129		struct elf32_phdr *phdr;
  1130	
  1131		ret = geni_icc_set_bw(rsc->se);
  1132		if (ret) {
  1133			dev_err(rsc->se->dev, "%s: Failed to set ICC BW %d\n", __func__, ret);
  1134			return ret;
  1135		}
  1136	
  1137		ret = geni_icc_enable(rsc->se);
  1138		if (ret) {
  1139			dev_err(rsc->se->dev, "%s: Failed to enable ICC %d\n", __func__, ret);
  1140			return ret;
  1141		}
  1142	
  1143		ret = geni_se_resources_on(rsc->se);
  1144		if (ret) {
  1145			dev_err(rsc->se->dev, "%s: Failed to enable common clocks %d\n", __func__, ret);
  1146			goto err;
  1147		}
  1148	
  1149		ret = read_elf(rsc, fw, &hdr, &phdr);
  1150		if (ret) {
  1151			dev_err(rsc->se->dev, "%s: ELF parsing failed ret: %d\n", __func__, ret);
  1152			goto err;
  1153		}
  1154	
  1155		fw_val_arr = (const u32 *)((u8 *)hdr + hdr->fw_offset);
  1156		cfg_idx_arr = (const u8 *)hdr + hdr->cfg_idx_offset;
  1157		cfg_val_arr = (const u32 *)((u8 *)hdr + hdr->cfg_val_offset);
  1158	
  1159		geni_config_common_control(rsc);
  1160	
  1161		/* Allows to drive corresponding data according to hardware value. */
  1162		writel_relaxed(0x0, rsc->se->base + GENI_OUTPUT_CTRL);
  1163	
  1164		/* Set SCLK and HCLK to program RAM */
  1165		setbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
  1166				GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
  1167		writel_relaxed(0x0, rsc->se->base + SE_GENI_CLK_CTRL);
  1168		clrbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
  1169				GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
  1170	
  1171		/* Enable required clocks for DMA CSR, TX and RX. */
  1172		reg_value = DMA_GENERAL_CFG_AHB_SEC_SLV_CLK_CGC_ON_BMSK |
  1173			DMA_GENERAL_CFG_DMA_AHB_SLV_CLK_CGC_ON_BMSK |
  1174			DMA_GENERAL_CFG_DMA_TX_CLK_CGC_ON_BMSK |
  1175			DMA_GENERAL_CFG_DMA_RX_CLK_CGC_ON_BMSK;
  1176	
  1177		setbits32(rsc->se->base + DMA_GENERAL_CFG, reg_value);
  1178	
  1179		/* Let hardware control CGC by default. */
  1180		writel_relaxed(DEFAULT_CGC_EN, rsc->se->base + GENI_CGC_CTRL);
  1181	
  1182		/* Set version of the configuration register part of firmware. */
  1183		writel_relaxed(hdr->cfg_version, rsc->se->base + GENI_INIT_CFG_REVISION);
  1184		writel_relaxed(hdr->cfg_version, rsc->se->base + GENI_S_INIT_CFG_REVISION);
  1185	
  1186		/* Configure GENI primitive table. */
  1187		for (i = 0; i < hdr->cfg_size_in_items; i++)
  1188			writel_relaxed(cfg_val_arr[i],
  1189				       rsc->se->base + GENI_CFG_REG0 + (cfg_idx_arr[i] * sizeof(u32)));
  1190	
  1191		/* Configure condition for assertion of RX_RFR_WATERMARK condition. */
  1192		reg_value = readl_relaxed(rsc->se->base + QUPV3_SE_HW_PARAM_1);
  1193		mask = (reg_value >> RX_FIFO_WIDTH_BIT) & RX_FIFO_WIDTH_MASK;
  1194		writel_relaxed(mask - 2, rsc->se->base + GENI_RX_RFR_WATERMARK_REG);
  1195	
  1196		/* Let hardware control CGC */
  1197		setbits32(rsc->se->base + GENI_OUTPUT_CTRL, DEFAULT_IO_OUTPUT_CTRL_MSK);
  1198	
  1199		ret = geni_configure_xfer_mode(rsc);
  1200		if (ret)
  1201			goto err_resource;
  1202	
  1203		geni_enable_interrupts(rsc);
  1204	
  1205		geni_flash_fw_revision(rsc, hdr);
  1206	
  1207		ramn_cnt = hdr->fw_size_in_items;
  1208		if (hdr->fw_size_in_items % 2 != 0)
  1209			ramn_cnt++;
  1210	
  1211		if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
  1212			goto err_resource;
  1213	
  1214		/* Program RAM address space. */
> 1215		memcpy((void *)(rsc->se->base + SE_GENI_CFG_RAMN), fw_val_arr, ramn_cnt * sizeof(u32));
  1216	
  1217		/* Put default values on GENI's output pads. */
  1218		writel_relaxed(0x1, rsc->se->base + GENI_FORCE_DEFAULT_REG);
  1219	
  1220		/* High to low SCLK and HCLK to finish RAM. */
  1221		setbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
  1222				GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
  1223		setbits32(rsc->se->base + SE_GENI_CLK_CTRL, GENI_CLK_CTRL_SER_CLK_SEL_BMSK);
  1224		clrbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
  1225				GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
  1226	
  1227		/* Serial engine DMA interface is enabled. */
  1228		setbits32(rsc->se->base + SE_DMA_IF_EN, DMA_IF_EN_DMA_IF_EN_BMSK);
  1229	
  1230		/* Enable or disable FIFO interface of the serial engine. */
  1231		if (rsc->mode == GENI_SE_FIFO)
  1232			clrbits32(rsc->se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
  1233		else
  1234			setbits32(rsc->se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
  1235	
  1236	err_resource:
  1237		geni_se_resources_off(rsc->se);
  1238	err:
  1239		geni_icc_disable(rsc->se);
  1240		return ret;
  1241	}
  1242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
