Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA07B1E1044
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728489307; cv=none; b=Pd2w8xKrei9u2Iear1HzoTqs8Py+33xKL+9Nmhu9y2eJocYU6MxB4n7dZiU6ZwvLIqnoeaMzH80Rt93w9cOy2q5n+UwT4RCLvG9dS+sal8wy6X8ov3fN7c4EBGECf6YIiF3KrWys/PFwzzorXfqgBwI+SdAbCEzxIgoBGaSi8zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728489307; c=relaxed/simple;
	bh=2L4hg2efca/pj1CBjK7z1cu0jL4UjdmcC8lHAt1pb1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TysjdvGB44GnjvqgTbI/NDaxMp4GvTnCBG8a2M5OPxnyVTv3JnNGexSRQKvyZy/YaXmOFi9AE/Gy0adEKPus6ACkue0o/eiHT9TB6cBEsNhrK5Wus/Qw6dr5kEZkEXYxc9IILRXdc1BcEMELrgT2O7KkSGJRdXMuP/Ucc3hufKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YModgU7e; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YModgU7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728489305; x=1760025305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2L4hg2efca/pj1CBjK7z1cu0jL4UjdmcC8lHAt1pb1I=;
  b=YModgU7eYjSe3TVaCZiy7S1GJHHJ9Ib0Gk1wA93EdMF0L0mzOTdehx91
   Aj671vDDQmThcUb8KcMRww8rq4HIbBECL6icQjo2azT+I0NBRcl05CcmU
   KbAWyMfoaLDr6cvhLMGyaUSNuxPuHDS48lTUlV3i3FzCIcSBTL3zVPGN/
   oT4/of//cEOe3wSW0/+mUmNPifrNWWb5a7gXiEDNHXRgQ8PYkt+qWGQis
   0VFn7ng2ah5FA59Tqrm53wjurp6n1+1okXH3fsyXkMs6CgQtmVH5boner
   SSpGphDeejjQpXAtvXM/AVtM8LlxGjQjEjy5mJcvfVKloDhARO6556moM
   Q==;
X-CSE-ConnectionGUID: ufOHgfaeRJGeptBmbyCcqw==
X-CSE-MsgGUID: pZuwfPoGSS+zqloLxI8/4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39161548"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="39161548"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 08:55:04 -0700
X-CSE-ConnectionGUID: VOqwN6pfQbSH6T0q/HBkYg==
X-CSE-MsgGUID: atdnrOgZRueh946gSHT8gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="80801483"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2024 08:55:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syZ1g-0009Qe-0x;
	Wed, 09 Oct 2024 15:55:00 +0000
Date: Wed, 9 Oct 2024 23:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [linux-next:master 2312/2853]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000:
 clocks: [[52, 122], [52, 120], [139, 10], [52, 123], [52, 125], [52, 127]]
 is too long
Message-ID: <202410092304.nR7sBZ4r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
commit: 27727cb6604e0998d03d9ec063b517b239d2bb0f [2312/2853] arm64: dts: qcom: x1e80100: fix PCIe4 and PCIe6a PHY clocks
config: arm64-randconfig-051-20241008 (https://download.01.org/0day-ci/archive/20241009/202410092304.nR7sBZ4r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410092304.nR7sBZ4r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410092304.nR7sBZ4r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4145.11-4155.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000: clocks: [[52, 122], [52, 120], [139, 10], [52, 123], [52, 125], [52, 127]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [139, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4145.11-4155.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1bfc000: clocks: [[52, 122], [52, 120], [138, 10], [52, 123], [52, 125], [52, 127]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1bfc000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [138, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4145.11-4155.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1bfc000: clocks: [[52, 122], [52, 120], [139, 10], [52, 123], [52, 125], [52, 127]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1bfc000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [139, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4145.11-4155.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1bfc000: clocks: [[52, 122], [52, 120], [139, 10], [52, 123], [52, 125], [52, 127]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1bfc000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa0p8-supply' is a required property
--
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [139, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4145.11-4155.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1bfc000: clocks: [[52, 122], [52, 120], [137, 10], [52, 123], [52, 125], [52, 127]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1bfc000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [137, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4145.11-4155.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1bfc000: clocks: [[52, 122], [52, 120], [137, 10], [52, 123], [52, 125], [52, 127]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1bfc000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [137, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4145.11-4155.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1bfc000: clocks: [[52, 122], [52, 120], [135, 10], [52, 123], [52, 125], [52, 127]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1bfc000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [135, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
