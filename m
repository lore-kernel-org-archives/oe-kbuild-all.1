Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7F017E9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 00:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719447355; cv=none; b=mrZoN7I0aM730ZKFnltWx/r5P+vBpkHi6kXaT46YdI7ZSDJb2uDrxy4zHoxIv/JIX983Xq3qkc9yG/boDHwr0K7p4++yysWrhTqbj0kxME02NpnM9tKqwD/8K+c8Ui1ABMAO40P0mjrIj0h2pjBIHx98oVcxEjOoFl47GCs+JCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719447355; c=relaxed/simple;
	bh=9UK2MBKoe/cDDxJ8/CUtGrKqLJs2uax83Lv/FrTTJ2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GxaBInTREDzapVPGnfSXeUgpRoQgS+r1hyz1ve7T6BlYxR7h6ENLNRw0oT3e2bKZG3+bWL59BAvwhNnLpPsdYvsE1GmYtE7ttKdLLlvZXXwxQG1Ai/HbyxWzPByiUf+Q10vfJsK+AZF4cXK/ZqHLqAL68FMGo85hqVedVBDLkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QV21EdLV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QV21EdLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719447353; x=1750983353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9UK2MBKoe/cDDxJ8/CUtGrKqLJs2uax83Lv/FrTTJ2E=;
  b=QV21EdLVuLoJ6yZhDyHIfikwugPpjg00JsuYOTAx+dZt9evsbSzVd9u+
   stssFW8P4L1oR+lHP5lOM+L+DfVQ5V03BrN62YGlTiBU0AKjFoT5Fuf+r
   NC6UCI4gwJKUfyVp1vVaz+fpUM+H+JIjduEWjIc3Ph+vd76T4kCxD0sQP
   eICV26F3f1ccXTV7tMHcgQiH5XAwP2B51CAei0VuWeWdLHI+82GX3Ndru
   oUm9DcjennbdB6ia9Mn3IUIPKNH9KwtMN56whspDmACxvhG/TwhN26n4B
   X389IYJe8ScTKzFTsSuhFTXuHCUvK2A0fkbcae8ObFH0vIlwvb2N08uBh
   w==;
X-CSE-ConnectionGUID: i/o7AUPQTe6qItlJOiioJA==
X-CSE-MsgGUID: FyO5KBRdQna3LYVuhjBVkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16695723"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="16695723"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 17:15:53 -0700
X-CSE-ConnectionGUID: oJRd9BUlTKO/hvzp5425yg==
X-CSE-MsgGUID: 47hBYYk+QUqLoWHPNPaUYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="44255620"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jun 2024 17:15:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMcnl-000FhO-0C;
	Thu, 27 Jun 2024 00:15:49 +0000
Date: Thu, 27 Jun 2024 08:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 8025/8719]
 arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dtb: gpu@1c00000:
 clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem',
 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
Message-ID: <202406270818.rudgdA19-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: 399af57ccca2f4bdf6feba8a41b80967b10ea9f1 [8025/8719] dt-bindings: display/msm/gpu: fix the schema being not applied
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240627/202406270818.rudgdA19-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270818.rudgdA19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270818.rudgdA19-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8953.dtsi:911.27-961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1329.11-1339.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
--
   arch/arm64/boot/dts/qcom/msm8953.dtsi:911.27-961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1329.11-1339.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
--
   arch/arm64/boot/dts/qcom/msm8953.dtsi:911.27-961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1329.11-1339.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
--
   arch/arm64/boot/dts/qcom/msm8953.dtsi:911.27-961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1329.11-1339.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
--
   arch/arm64/boot/dts/qcom/msm8953.dtsi:911.27-961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1329.11-1339.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
--
   arch/arm64/boot/dts/qcom/msm8953.dtsi:911.27-961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1329.11-1339.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
--
   arch/arm64/boot/dts/qcom/msm8953.dtsi:911.27-961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi632.dtsi:184.9-203.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi632.dtsi:190.19-202.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1329.11-1339.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
--
   arch/arm64/boot/dts/qcom/msm8953.dtsi:911.27-961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1329.11-1339.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
   arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dtb: /soc@0/i2c@7af5000/led-controller@36: failed to match any schema with compatible: ['ti,lm3697']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
