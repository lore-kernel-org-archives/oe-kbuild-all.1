Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E25BACF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718278138; cv=none; b=dS4hZg5Caiqfqb1gWC1874E8hSZtaEaMCleiOqI0ygXhTSbdXp0xUWRQI5wwEYtWocYZDyCwbjqudi9E4duvajYY9pmd7A3EMHrYaxM5DXR48UOauUh0GakDFTzQA6zJr34e6q5z8/W4fBcSEvMF5EU1sdWTZguBC5fK8MkryHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718278138; c=relaxed/simple;
	bh=ywztoPxgJIejLdB1nZXAKQKVQZUyTAdQ6DFDlldvigg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRBVZ+HcDkCVHv/ienG7ylIvx5G9P4sQf1kr/eDHWieQ+Hc+yJ+WLa2/UlGFyOO18QDVSGrmk0htbRMXr28mUp+l3Fl1VKWU08gpbDuRJsCwNmPHBKYN4vKeRwAUio/qOD2/jjeqavr4148bvbnSjC8tLB+RjXsbXMZR/s/jBys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BF8AxDzf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BF8AxDzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718278135; x=1749814135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ywztoPxgJIejLdB1nZXAKQKVQZUyTAdQ6DFDlldvigg=;
  b=BF8AxDzfWpXk3qu8Q3R+JZQw2Vc9cSDl/MGJ7FHPczzFDT9uQdM+vLzd
   JHUBWyo/yRu0kamZ3d0+87ny6C0hfFch1xkss1ay/YxMIwBdcbwjLh2F0
   c5HZvN8E/6/+XJRdAC0YcQzfopqmNvQiBiod1cjUM81z+4IxRlvS9GlFj
   5gpsgR6765uKId0UJAEViMElFNiMiPucksBaffmbi/wiAOgOJYk4axtKQ
   AmvvqGepXllzAgAvn0YevPibPIcyTNqmiaaJ351g5OYC29zi50Ojqf2y8
   +rk9BeM00YKfV02u9hRD2B/V3+84F+L6zUYiNnB3vofJT0FQia+UMm1p4
   w==;
X-CSE-ConnectionGUID: rM9/FS4fQIGAaCq/MP/cxg==
X-CSE-MsgGUID: 5UPci8GgTCuEQS3Vfa9aHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18017240"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="18017240"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 04:28:54 -0700
X-CSE-ConnectionGUID: CoqURUtpQd6vLNiySS4N8w==
X-CSE-MsgGUID: AWvBDYmWQ+GECfqzHJ8mag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="70902829"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2024 04:28:52 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHidN-0002Xm-39;
	Thu, 13 Jun 2024 11:28:49 +0000
Date: Thu, 13 Jun 2024 19:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-v6.10-rc3 68/74]
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: phy@88e8000: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202406131940.gyRSdHv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.10-rc3
head:   959d8c14d75729561f5ce6f4c79055e18dd652cb
commit: 101c1ae512833ec96eb9127bb54750c73daeac56 [68/74] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch
config: arm64-randconfig-051-20240612 (https://download.01.org/0day-ci/archive/20240613/202406131940.gyRSdHv2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131940.gyRSdHv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131940.gyRSdHv2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-2: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1087.21-1105.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1087.21-1105.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1087.21-1105.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1087.21-1105.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: panel@0: 'avee-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: panel@0: 'avee-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4630.27-4681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pcie@1c00000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4630.27-4681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pcie@1c00000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4630.27-4681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4630.27-4681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['truly,nt35597-2K-display']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4630.27-4681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts:474.25-495.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['jdi,fhd-nt35596s']
--
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts:478.10-499.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/geniqup@8c0000/i2c@894000/touchscreen@38: failed to match any schema with compatible: ['focaltech,fts8719']
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['visionox,rm69299-shift']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4630.27-4681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4630.27-4681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4702.27-4753.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1220.44-1223.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: phy@88e3000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: phy@88e3000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: phy@88e3000: 'vdda-phy-dpdm-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: phy@88e8000: 'vdda-phy-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: phy@88e8000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: domain-idle-states: cluster-sleep-2: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: domain-idle-states: cluster-sleep-2: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: phy@1d87000: compatible: ['qcom,sc7180-qmp-ufs-phy', 'qcom,sm7150-qmp-ufs-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@88e8000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
