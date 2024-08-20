Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274ED18EFD3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724154636; cv=none; b=DWkFyw78VERdMzBd4D+GKaOdBFchJzaGxvcTdBOtxz0IUy+QPw9ih0kOch6xvAlx3gMEBex4/5IKqPpVv5xLamMx0UbW+8q6fzrzZJcMbwEW0rJSQimHeZyka4Tc0CmmEbNWZwFOfg4Wic6dTeYFuDHbQvfLjpa9XtDBGIbQeio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724154636; c=relaxed/simple;
	bh=f/xAv0FvfUyAazBUMTRHqnIC/ZuvJFcQE4osCTJVWJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fxcli0kJMq1P1EiiLm6UMqs0FYKRf+ifDmQ1kxXONSX/EbWSijHPp6qxklKQlPa0GlT2subPTytmnioHzWLGcim6KMVlXXoRdZ0IM7fjy312UU5fxFMCHIEbO0fwsbndQlwPKOIoZ+eU9ZmQ/QblGmfFL85+cJYNLc1d/83FR6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mO9fNKfV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mO9fNKfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724154634; x=1755690634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f/xAv0FvfUyAazBUMTRHqnIC/ZuvJFcQE4osCTJVWJs=;
  b=mO9fNKfVwulO3v5ykhThLAY5MEiKOm9DUAxHYjI78oXIJWnQWJkpMn89
   Q6HOaR7vgK5iDx6DyMG5ixsUqf9poY8Ix/QXnoapd72QdAlRRISKa9o6K
   vqvyyvam5YDxukwf8TWVphwwDTGMATv4x+8yunpEtVwo2vYUJDxKwn0n2
   Prqz08QGxIb5nIyEEpnzetOxBcMinhqL+0iTw0Tj1A68dWdIly1rre2Kk
   YlzUs95C/GTVE4EyupBXqfSSb76CBy0Ruuob02g/YJZz9Zo2Rttw+66BV
   Us1egbLbHBbQ9b6Qm2HKzP6FTPGlbdaqXLtXV4iDw27+SrFXqst7eXqfS
   g==;
X-CSE-ConnectionGUID: 8CmkIQGLTPCj6TJidV2KGg==
X-CSE-MsgGUID: RXEepY6QRmK/D51WZl3SJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33066306"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="33066306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 04:50:33 -0700
X-CSE-ConnectionGUID: TqZCwbmDTNWa6o7Mq1BjgQ==
X-CSE-MsgGUID: woWC0XxXT9SMxD/Bgsl6fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="65667907"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Aug 2024 04:50:31 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgNNd-000A82-1w;
	Tue, 20 Aug 2024 11:50:29 +0000
Date: Tue, 20 Aug 2024 19:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 5294/5508]
 arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: bluetooth: Unevaluated
 properties are not allowed ('clock-names' was unexpected)
Message-ID: <202408201954.SOs0kjsw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bb1b0acdcd66e0d8eedee3570d249e076b89ab32
commit: c006059101a18b5c225ef68d6e52504a4d0a6085 [5294/5508] dt-bindings: bluetooth: reference serial-peripheral-props.yaml
config: arm64-randconfig-054-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201954.SOs0kjsw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201954.SOs0kjsw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201954.SOs0kjsw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: bluetooth: clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: bluetooth: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: bluetooth: clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: bluetooth: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: syr827@40: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: syr828@41: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: typec-portc@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: bluetooth: clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: bluetooth: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: bluetooth: clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: bluetooth: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:486.10-497.6: Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: bluetooth: reset-gpios: False schema does not allow [[34, 20, 1]]
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: bluetooth: Unevaluated properties are not allowed ('device-wake-gpios', 'host-wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb2phy@fe8a0000: otg-port: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: bluetooth: clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: bluetooth: Unevaluated properties are not allowed ('clock-names', 'device-wake-gpios', 'host-wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
