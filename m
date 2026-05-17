Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2B617BEBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778981859; cv=none; b=TkkOX+z9kOaowU4BcCgMr5pZL1a/5CnmecR88dUa6R6v0uOu81fpZZO4nee1zi2KkJ2ZHfRZ+LVpDu6UOFENBhYBInZWrPhH8lTiEatKBolMifQP/lXB/WMUsCZ6ykTgHlNyfEvhtoewpucDTk3fjL7HlHiTd6kmc/2k8wH0Q88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778981859; c=relaxed/simple;
	bh=AiHq4SnKlJWFwAiCnsHTmqAwmzgYi77UocOuoGvMG10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CZO9er2RwMXBqy4Y/uKnJDOkF35ezQ7AtpZtt5xssz/alQq8JZQ8IW8MciK4wIdcmra+jVhl27TTCxkZ5dyTIXszKdmOcEzdDDKHN4BFRDI0CLFuq7n1sdVrGZWfqwjnDAqPaLF5NMc44U1c8hUGRc0pbXQK1A7MppwfPzkerwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bS9HQOGL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bS9HQOGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778981858; x=1810517858;
  h=date:from:to:cc:subject:message-id;
  bh=AiHq4SnKlJWFwAiCnsHTmqAwmzgYi77UocOuoGvMG10=;
  b=bS9HQOGL9gxAZoJEw/6gT+syQAOKzaJ4oRYvmJU2grNkaGIv1AxE2paM
   7De6VNf9bi9ku189kbussWJmQEKVfkhhTZrwOJvQWkbonDZCuuzDuDtDm
   TQSWBZKWzrSB26Oa9h5qaztx+DB+BZeCdFXPHfOeM/ppe2xinM8rk5bRd
   Vn4fNGF8MgvOPGHaXcLqkSWhyABSAzGBedMsNr5agnYKbk40aax4YMOsj
   fkBRSwgkgh9USy6XwDkttIl4/Iq28/xilj1FvWhQ4Y2ELZsPlkPF3zmMp
   +kHFAc1gPFvDSk50Ipf5Mk179vj7MVwKSe7VPwiDfrff5m8RlwPDZrSlV
   A==;
X-CSE-ConnectionGUID: qWW2ljHHTl+xFFBk6GyDOw==
X-CSE-MsgGUID: RKLMnEnJQSuK7Bgv0kHzVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="102556548"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="102556548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 18:37:38 -0700
X-CSE-ConnectionGUID: m0Iy3PYrQp2sP+4GsIPIkg==
X-CSE-MsgGUID: /3HDGp38SgGaJWY4VW7XpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="238192550"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2026 18:37:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOQRh-000000009Rd-1Y5h;
	Sun, 17 May 2026 01:37:33 +0000
Date: Sun, 17 May 2026 03:36:54 +0200
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: arch/arm64/boot/dts/qcom/sm8650-hdk.dtb:
 displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are
 not allowed ('sound-name-prefix' was unexpected)
Message-ID: <202605170340.XoofX2Ka-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6916d5703ddf9a38f1f6c2cc793381a24ee914c6
commit: d5391c94cf48fff33fe3d79e50c6354b8c636f87 arm64: dts: qcom: sm8650: Add sound DAI prefix for DP
date:   7 weeks ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260517/202605170340.XoofX2Ka-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170340.XoofX2Ka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d5391c94cf48 ("arm64: dts: qcom: sm8650: Add sound DAI prefix for DP")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170340.XoofX2Ka-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5692.27-5767.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5789.27-5845.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5789.27-5845.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card-rear-camera-card.dtb: displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtb: displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
