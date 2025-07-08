Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC92218821
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Jul 2025 04:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751949580; cv=none; b=HuXal1RpdAA9f5bPOtNjjyciL8jh+z3k7T+nWte89toBscU4gewagSj8h2S19ctr8ZC7Vb+cV+MQ7dSZzTWnBM01Uvmu0xssMlN0wyAhmvPYkkSaTJcFfgcVhBcbMUWS85Im/11SvWI0K1i4YFOIUo+wCMqdZfbwbuf/Pun9HRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751949580; c=relaxed/simple;
	bh=sniKzbKhFkeQE7zbf3tU7KunsEZ+EgwCM0H9dblFQio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A/sLC1m7c2UtxIgJmWahaLGbjTcc4F+JCF9ES/wa9/zTpzVaoSCPwYMcz6OL6wRFLdVU9E76DeDTj7ZuASbf6Y74+7G79bZY372NpaAAEgBNsDB9/iA/0qzMFl6pKdDlA10JQjMArCJ1ASX7lhAmk9kOFS+p7VqBAM62Xvc4VKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAhLFWwg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAhLFWwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751949578; x=1783485578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sniKzbKhFkeQE7zbf3tU7KunsEZ+EgwCM0H9dblFQio=;
  b=VAhLFWwgninshAje5PjhCRSEaCru/x5OZymhQPwALKEl5whCN93GtUh1
   CBrTJkYc+6lcQptRQ83PPABCrvB1MjIuqtczIZb6SfEqh6V6qJ58wFAX1
   ObAFZQFj0FjuDxR8N2dy6fZxo7DjpZPl7IOEdxaukqmZ7VXUmp/BvHZaT
   n/YO/sGe0lPFinymhwP0Se8w+3adJowaHesrainzSUE3QQmQGS9DHy9uj
   TGhXo8i+LSQ8Y8K1eeG0pIFlxznCbFOaYmsaeyUERyf1QXdACvYzogcjP
   S99E6xJzeMyNro0o5tzZH4qbR6IW5QduKbK7XrYfiT+4ywIOCpWicbGQs
   A==;
X-CSE-ConnectionGUID: 1diQC6w/RF2lSU5eEn4p/g==
X-CSE-MsgGUID: Ry77AgzeR9eWDJzZZxk+0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56789230"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="56789230"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 21:39:36 -0700
X-CSE-ConnectionGUID: VtZ4/JtFQkeQZQtbVja+GQ==
X-CSE-MsgGUID: eWvQjMVpTdyuiKYt7X1UsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="159662830"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jul 2025 21:39:35 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZ07B-0001l3-0A;
	Tue, 08 Jul 2025 04:39:33 +0000
Date: Tue, 8 Jul 2025 06:38:31 +0200
From: kernel test robot <lkp@intel.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [linux-next:master 1298/7381]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000
 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
Message-ID: <202507080613.ghzGQQEz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296 [1298/7381] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
config: arm64-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250708/202507080613.ghzGQQEz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080613.ghzGQQEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080613.ghzGQQEz-lkp@intel.com/

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
