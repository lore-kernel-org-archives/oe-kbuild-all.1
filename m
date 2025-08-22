Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15B393DE0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 01:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755825560; cv=none; b=MlM2JPn6h9yZJsBVLsSZfzRwPRIwW4Ar+1WEl0rRz3fqSdbVIfvHZyonfwN7gqlZ/E2OvaeRgvmwTjRW2CJwJQM9IDjRQbPGHBz79gb1mzccNQoDMhW/bfAUM3tBc7B0BX17WFM/8QNfcW/CBq84J8WNF+MiFkkHikBRwioNCeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755825560; c=relaxed/simple;
	bh=/tDauo6g/pKCkIl931vUMzE3uwrfEMkhaiLaseu64dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lXgTz+lBh3/b4K+15+s5BuMRbTGHdGJsn1LrogZSX5gwbIHrt39xXEYOHMK3Bu1UpdtqBltPokT0sLx+el06KsgNZQdfS8dmag6TErRjRuaXCTv2kVfwpjXWs7F6vr9S5MPolTrqgT6sPOX/H79TCVf6BuuOix/EsY91Gikf7bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQjUKpyD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQjUKpyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755825558; x=1787361558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/tDauo6g/pKCkIl931vUMzE3uwrfEMkhaiLaseu64dc=;
  b=UQjUKpyDqwHxY2/ai89sZy+2cuJ4hKG7e7XzsG03gLf+x0VQHgKGGh+r
   T4BKEOIO7O7HED5p6rWTGVRZKeiGc+OL1BZ23cSHJjG/m613Y+tewArhL
   QNj08W39kdbXLHcdeyY5zSuwQPB3YA3SEhxxOAgRl/hq3vrBd14yKq4rI
   rsUyUuM0R2/9f5xQfudekBdnHvfKEqT8nn3KueTpecA1q/NRxpSyhqaT6
   dwUErjSLI9YBKir+6lX3dTBNpx4AtGLGoxVWOv1DTjflvR0C8hObNPu5X
   m+eAVXjNsIWZXkJ7eteMyGvOIr4jt2x78+PVVXKGKiekGy6jicXPzo4SR
   w==;
X-CSE-ConnectionGUID: yODGv1EAS2CfZZtIMwd+sw==
X-CSE-MsgGUID: m/LH4Fe4SjCpys77IY5yxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57841662"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57841662"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:19:16 -0700
X-CSE-ConnectionGUID: dqRuor+PSjyGhlawhlOzlg==
X-CSE-MsgGUID: 6gK65LiTSLWpwTYU4cxC0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="199531456"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2025 18:19:15 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upGQy-0001qF-0s;
	Fri, 22 Aug 2025 01:19:12 +0000
Date: Fri, 22 Aug 2025 03:18:45 +0200
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 3659/3950]
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: phy@88e8000
 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202508220327.8biCt0DX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa4d8dc380fbd81a9d702a855c50690c9c6442c
commit: 3bad7fe22796a420c6e16b591c37ed1bd6cc2a30 [3659/3950] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch
config: arm64-randconfig-2051-20250821 (https://download.01.org/0day-ci/archive/20250822/202508220327.8biCt0DX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4f15debe13af14e0fd668ee4861aff6dbc5283df)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508220327.8biCt0DX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508220327.8biCt0DX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1085.21-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1085.21-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1085.21-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1085.21-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: phy@88e8000 (qcom,sc7180-qmp-usb3-dp-phy): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
