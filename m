Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74031EF0BE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 11:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749985970; cv=none; b=lrxB7KrlmpkQeOABBE9PdAwWn4/hpynsSRyDCRRsQSEuFQPgHugA5L9EYIaMJixE+cQIDAo3JtYVmOtDUL9uG94ZMJje4vtS8UXGw01O4wEJ/1koPQFuJYG00ZGcOxgD5TYCg6ccDQSrKX6U5Ng1ur7K3aYoCfNZsPeMgktjrs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749985970; c=relaxed/simple;
	bh=3pc/POokBIOiTj5DB4WcAE2iTYAqdJXZQilLg8O0fAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8pC5RKftgxp8o2wv7l7wdNBfmFUsLJ+INibOCjwUSEFLTC29R16dLu4oAkJBjFEluID6DnAfCAuhT2wHr1WzWDrzO0lb8N95Y4YykpADT9QHM1vL0YTMJ02hMm548PY7CnUwJ5UFZ4bQqEbyHWf7FmcdiCE5cgMrOGDsvQ2H8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ej6d9HDi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ej6d9HDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749985968; x=1781521968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3pc/POokBIOiTj5DB4WcAE2iTYAqdJXZQilLg8O0fAE=;
  b=ej6d9HDiED/vzR7S1Whs71tfPTLqZpVOqmiBG7GjD7YHSncY4J2ff9mM
   A0BTOYbv82j04pILRKXV7qquPr+GgNl9nxl1qEKrnV4KUAN9DzfS2Lm0E
   awqED9s4KyLXiSKuQu18CpUvIjsHg5bbnT+8Rftwx+BAN6BjN1s0SUFu2
   fZmX9DJ7n9v5IpqXti3fyZgHoMGgRjlTNXTNEXdo+BylPr17KEGeFDiHi
   NMOUshv17bbZcVzeRRyaG6rUpo3icOwozivflhQqz58NsRfLG4QnpYYOe
   0VKjUEq5n+xamN6eLPGGFnBW8WCCUZ5mVXm68hkPH8PjuQXN9yHmVZmbV
   g==;
X-CSE-ConnectionGUID: sn7iiyV/Sjy6civheV7N3Q==
X-CSE-MsgGUID: zA+Bm+aTSqabg23Byenlvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="63558202"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="63558202"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 04:12:47 -0700
X-CSE-ConnectionGUID: YJwD0Tw8R46hzn39260sIA==
X-CSE-MsgGUID: tfVIrTfJQxaERGvha2EtvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="149096810"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2025 04:12:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQlI2-000EIS-0U;
	Sun, 15 Jun 2025 11:12:42 +0000
Date: Sun, 15 Jun 2025 19:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [linux-next:master 1625/2468]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000
 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
Message-ID: <202506151907.LcLf1RIB-lkp@intel.com>
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
commit: a02a8f8cb7f6f54b077a6f9eb74ccd840b472416 [1625/2468] dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains
config: arm64-randconfig-052-20250612 (https://download.01.org/0day-ci/archive/20250615/202506151907.LcLf1RIB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506151907.LcLf1RIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151907.LcLf1RIB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5202.27-5277.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
