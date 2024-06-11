Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984422033E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 21:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718142013; cv=none; b=pDdMUVmfu5jC4XH4sKCoqRpMTI3WjhyboNS2U2cZH0Lu2VheRKQK4o2xO7CJ+6Cwr5shpHA3wbe9hCcLdR9RDPu12xnBeLH0Tq1/GKP6gFuR8fO4jzEfAOMgWWr6z+kXxQLXOZqMNIoos7mxYPtCbvJLYY3df9Nf66+P750CfSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718142013; c=relaxed/simple;
	bh=lr9fq0ldupMxbnUrPBCXBw6xAg0+KTZvpkspZs8EVPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFOKo4kCpNl0//cj8OLlT7c8gEXm0QZ5Ccx/aPLxA1qCaPPagub+YF5VcywwoGpUMESUHQAOVvrt1bRMTFUpBcpMHiS9wkLxWETw/TEFapjCqCJm8nxvM2Ufipov9bFaX99CNsM/HvpVRus53AkeNdPOzYy474sdS3frTmwA1Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLdJUgGp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLdJUgGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718142010; x=1749678010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lr9fq0ldupMxbnUrPBCXBw6xAg0+KTZvpkspZs8EVPk=;
  b=nLdJUgGpBebDi8GIgXncXrNXQgrS20KwWBJsbNnxK1x913BS8RNN+Nc5
   tVoChfJqcZiMvWgtNYcdVkf4TIFiCCRFAGJdk7FSTHXnY87Tj4XMQfs0a
   aBkLPzdtvES+78D6mcNE6xfNwBExYbLOdhaQZeoaQz6G8rvbVhwcscfve
   sdQNz03b6Gvken3JZBLyL+27BBdVFTpKAPV/gpH1CnyjkwtK8LUh9rMq8
   46245WUbnOY3MsotcXJb7cw20QErhTsvwxM81GfFAeoZWg+aGTYXIQp8z
   62bB1Hn+Kp/QIkXambMcUcDVvB6cEwdIS9oUvdUdGOlQ2lDjfPE2BvqmF
   w==;
X-CSE-ConnectionGUID: fRxKQ+x0TWacqSg4hNuxbA==
X-CSE-MsgGUID: U3X5fEE6TPGhdyFeOpISLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14713735"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="14713735"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 14:40:10 -0700
X-CSE-ConnectionGUID: nTrgfCz1SGugskmWrqKA2w==
X-CSE-MsgGUID: Ww9OVJfBQ4ii4j+7WPKpBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="44115947"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2024 14:40:08 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH9Dq-0000uo-06;
	Tue, 11 Jun 2024 21:40:06 +0000
Date: Wed, 12 Jun 2024 05:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [robh:for-next 3/15] arch/arm64/boot/dts/qcom/apq8096-db820c.dtb:
 ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194],
 [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
Message-ID: <202406120539.JncGA8mn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   fec32ea96dd90bf0af97e001f380d4a240013aa0
commit: a9a34fc737aea5d5d7a47c885f5ed45dfb1df07f [3/15] dt-bindings: ufs: qcom,ufs: drop source clock entries
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240612/202406120539.JncGA8mn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120539.JncGA8mn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120539.JncGA8mn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1049.26-1098.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1117.26-1166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:132.9-151.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194], [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194], [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194], [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1049.26-1098.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1117.26-1166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:132.9-151.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [27, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [27, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [27, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1049.26-1098.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1117.26-1166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clocks: [[22, 73], [22, 193], [22, 82], [22, 209], [22, 194], [22, 74], [22, 200], [22, 201], [23, 74], [22, 197], [22, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clocks: [[22, 73], [22, 193], [22, 82], [22, 209], [22, 194], [22, 74], [22, 200], [22, 201], [23, 74], [22, 197], [22, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: ufshc@624000: clocks: [[22, 73], [22, 193], [22, 82], [22, 209], [22, 194], [22, 74], [22, 200], [22, 201], [23, 74], [22, 197], [22, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1049.26-1098.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1117.26-1166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:132.9-151.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [3, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [3, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [3, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: remoteproc@1c00000: 'px-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1049.26-1098.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1117.26-1166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:132.9-151.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [3, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [3, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [3, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: remoteproc@1c00000: 'px-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:3240.27-3255.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@7577000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [29, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [29, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [29, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:132.9-151.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [29, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [29, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [29, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:132.9-151.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [29, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [29, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: ufshc@624000: clocks: [[26, 73], [26, 193], [26, 82], [26, 209], [26, 194], [26, 74], [26, 200], [26, 201], [29, 74], [26, 197], [26, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: panel@0: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194], [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194], [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194], [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: panel@0: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194], [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194], [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: ufshc@624000: clocks: [[28, 73], [28, 193], [28, 82], [28, 209], [28, 194], [28, 74], [28, 200], [28, 201], [31, 74], [28, 197], [28, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1049.26-1098.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1117.26-1166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:132.9-151.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1214.11-1224.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clocks: [[29, 73], [29, 193], [29, 82], [29, 209], [29, 194], [29, 74], [29, 200], [29, 201], [32, 74], [29, 197], [29, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clocks: [[29, 73], [29, 193], [29, 82], [29, 209], [29, 194], [29, 74], [29, 200], [29, 201], [32, 74], [29, 197], [29, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names:0: 'core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names:1: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names:2: 'bus_aggr_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names:3: 'iface_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names:4: 'core_clk_unipro' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names:5: 'core_clk_ice' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names:6: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names:7: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names:8: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clock-names: ['core_clk_src', 'core_clk', 'bus_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro_src', 'core_clk_unipro', 'core_clk_ice', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: ufshc@624000: clocks: [[29, 73], [29, 193], [29, 82], [29, 209], [29, 194], [29, 74], [29, 200], [29, 201], [32, 74], [29, 197], [29, 198]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
