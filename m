Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA31F1E520A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Mar 2026 05:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773551075; cv=none; b=NwJPVTVk3bGNjTigCO0+CDH7v6HwbQYkip0V5eY4SetdP8yS3bJkIzD8B7RIUeCZXDVn9NvhU6LqutEMK/HwlBviICavlaUVLY1SMQk8kz8xijSBiLafkCx0zL2Tm3p4W4v8Tg1UYkMcydFhgtqzqeTQOzTkb15QVM0CvtRKsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773551075; c=relaxed/simple;
	bh=I7bDrV0wIych6tzO6txXpH2PxQVpK0Po3TRfEgEQZ/4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RIIwvvPAG2r/e9xSw6a+xhWd9hKfIsOMEokFVGtlyW+N6CRvJDj5g/qIfjY483N+uOSOAfl06N6usHuNDpY96hodJsEBE98uWBGPRCddJhywHW3fPJLatw5Cq4MljeuE6+i5kYQ0COlTtfCJ6B0JZi5/tWwdPt1cPDNuSOZbL8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=no2bjuJk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="no2bjuJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773551074; x=1805087074;
  h=date:from:to:cc:subject:message-id;
  bh=I7bDrV0wIych6tzO6txXpH2PxQVpK0Po3TRfEgEQZ/4=;
  b=no2bjuJkMcqUSOsd4ACWGZfDrR8viVbO8ulxxSobWuewSCMavNnqZoCp
   MHFRsHZsxS+sSwWbvQZlgYLTPaCvQPijzvGfAV+LAMTXxC89pLluCb5W6
   BXwaLYzTmvJSinUMcba7Vc0BZP+7tRJY1nQIY6I52YyF0hwGIYtJsTt2C
   YX/ijZc8QLm2n/ufQCCtzTZaM0wecldke4FC+9BYyMtKVt/PyqABDTXR9
   +p9VuXTtQ+WqOlhtOu9B4AfRpDwiDus3K3nObwKJnImvlyNIo4bnZfn45
   Gu4ihDS3KtrdexvfpE+zdGfw0sndwaa8e/V6gyj2p7I1pmhptMAg0HVq1
   Q==;
X-CSE-ConnectionGUID: SOn3CmYLTymPgieuQiimRA==
X-CSE-MsgGUID: Kqoja0gMQb+qt8zdauBq3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="78452060"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="78452060"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 22:04:33 -0700
X-CSE-ConnectionGUID: 47a/tjn4RA2FY1fSDgJahQ==
X-CSE-MsgGUID: KYmEJnIZSDqOdSZlMAhmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="220811133"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 14 Mar 2026 22:04:31 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1deO-000000003yD-0ypT;
	Sun, 15 Mar 2026 05:04:28 +0000
Date: Sun, 15 Mar 2026 06:04:09 +0100
From: kernel test robot <lkp@intel.com>
To: Val Packett <val@packett.cool>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 5208/6488]
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: clock-controller@5f00000
 (qcom,sm6125-dispcc): '#reset-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202603150629.GYoouFwZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b84a0ebe421ca56995ff78b66307667b62b3a900
commit: bb4d28e377cf04fbee8a01322059fa14808cdfe9 [5208/6488] arm64: dts: qcom: sm6125: Add missing MDSS core reset
config: arm64-randconfig-2051-20260314 (https://download.01.org/0day-ci/archive/20260315/202603150629.GYoouFwZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603150629.GYoouFwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1324.27-1391.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: clock-controller@5f00000 (qcom,sm6125-dispcc): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
