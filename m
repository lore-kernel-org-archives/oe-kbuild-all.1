Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE58528E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 04:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749873661; cv=none; b=exeqnQXiFlgipmJWxlDnqVOg9tORk4oFDmHPe4CgFwLlt0RT3mOpI3aHjqzQQyjUnI+V4/59ij98WZ7qVQM2bxMn1YdQaaeTiEQpqSM/CmR6xUFQLWtt4fHVjEx0g+yxxOnH5tT5RFJaWTaQBJ1HlwZpVtHWdaDx75f9b6l8LG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749873661; c=relaxed/simple;
	bh=El60Ya16gg3Qc9NgpYRlB6CHeeV9z3bsGW9Ua/f6VzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/TS9yJbqU+qxv9gLC8/V/8Lu7/xuPqRRvufK8KUhrRx3WeBJSy4YthlkbO9VvGUj0+DYIASsVTqb10TPZW1IXEVkeJZnorRbe4YzC9V9vahWX3Uo4cVZxGssZ4H6QJsMDDbPRUPmjU6VgKacBb2iXeq7i7gPtvFBYfAs7Ss5YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUeUa5lK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUeUa5lK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749873659; x=1781409659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=El60Ya16gg3Qc9NgpYRlB6CHeeV9z3bsGW9Ua/f6VzI=;
  b=LUeUa5lK6oBfJ5CGPxUoYQz5RmstsAS2uBDpopDgBJAr8MU/MZ7AYwsi
   6ekYa43vmG2t3qcEBX5S1jhOhKoZzZLiK0GmQlMg6rsRKG6Enc22VDz2s
   pWS+qYj/BgjvUXGrifrWU3eH+c+hulR7ph0vjk/E+zmCmBh8O3OutdM95
   q9Yy7J9TzitOliUvn2IB3aGEmAUySUXUVKPyXwpOsgkGFhvqMZd5ID7mZ
   r+F/az8ooPcBNgEkuOpszM7pzDPsFwJ8UUXJbKIF4iVsX0ALx/STK3AbP
   5Be6PMH70VLIAXM9Je5I3zMn3OjJYp8Dy/dATusKHqmJUE1PCQdyLoUkH
   w==;
X-CSE-ConnectionGUID: 4vcOhEeBRuygBINHZBka3Q==
X-CSE-MsgGUID: R1bR7Xo/TcO45LvvMYpJaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="39706410"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="39706410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 21:00:58 -0700
X-CSE-ConnectionGUID: P43qc66FR/iD6SGNBxXPFg==
X-CSE-MsgGUID: qgMD+vAqQYixdHt8j+Yi1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="152760092"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jun 2025 21:00:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQI4c-000DH0-0Y;
	Sat, 14 Jun 2025 04:00:54 +0000
Date: Sat, 14 Jun 2025 12:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [linux-next:master 1624/2468]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000
 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
Message-ID: <202506141133.AEQRFOWe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc6e0ba6c9bafa6241b05524b9829808056ac4ad
commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296 [1624/2468] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
config: arm64-randconfig-052-20250612 (https://download.01.org/0day-ci/archive/20250614/202506141133.AEQRFOWe-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141133.AEQRFOWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141133.AEQRFOWe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5202.27-5277.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
