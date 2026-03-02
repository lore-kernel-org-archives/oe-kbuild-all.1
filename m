Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2838E2EAD0D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772491814; cv=none; b=jI77dSj0kXLb34hC/+Y/GAcQJktjwSsSO5/JBoeKW8yy1luNKmkmC5/KWDPAiB1cYUL0AVKUnUq8xOEpIkwbMNH6x38ilJNKmV655O8YlnI5DkaHSZUp+eNCUJjoNwBKwbUBl0X8n1uFhenXm7xlHpa7sTSHjWbZLWyZDXQ8UOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772491814; c=relaxed/simple;
	bh=1Ej7D5nZIgVOUE+jOHAJYPFf6irLWICCr8YXl/cSYwc=;
	h=Date:From:Cc:Subject:Message-ID; b=Rxhk4t/UzblPsmBsMXv3gxNtJ9btSAXXrMIZXuuiDq9PVCr+mYewiLPdqbJN23+om8btAuhNDyD6nWbOuhRJeWSBQ8t2DwTXJb0NdR5sSpPJPPrctEB16XWz/Nt79jZb963C8E2fS6f9F/gEFkdml9hdlIEjEJ9KXJXFpbdLhEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mw/VsIGF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mw/VsIGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772491811; x=1804027811;
  h=date:from:cc:subject:message-id;
  bh=1Ej7D5nZIgVOUE+jOHAJYPFf6irLWICCr8YXl/cSYwc=;
  b=mw/VsIGFAgBc39V8a6zV486fKUL6jil0625U9yV8cA7yWPJfT8V+yEml
   x0luZ1eJRG1u28EZGW2651fUKw4H3XRuyDDLcC2CK5Jhns1XtGe852pKx
   MQz7qrL0Y4DEm2zcn35/ZNZ0zg4jENxkFA0axcgE2YuJSazanQNazc1dy
   111G1HFLs4bHhR5Ph9BS4fuW9MG55g1BOnrRbwlOnEaTljGtMuF7D04z9
   TtQSNYw6LQzEkw2QCKkCrcR9MNXRzOgnRDFgtYtt3EBaf3ZAr0/VzQ8bC
   D69Rv4rlBH+wRH0/jiWhkGgD1Lida4pSkhvWEoUhNo4fASN+z8oxK6AUx
   g==;
X-CSE-ConnectionGUID: 7Frfs1tQRxWKIlycIzjV/Q==
X-CSE-MsgGUID: C5AYmC2NTjeQdygtqHIbww==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73702017"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73702017"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 14:50:11 -0800
X-CSE-ConnectionGUID: lhGrTORYSXO/RRGGO3/9Cw==
X-CSE-MsgGUID: Ief2BIXKQaaWPLZ0qBvfLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="248298002"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2026 14:50:09 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxC5X-000000001Ib-1Acr;
	Mon, 02 Mar 2026 22:50:07 +0000
Date: Mon, 02 Mar 2026 23:49:39 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.18/linux 1/1]
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: gpu@5900000 (qcom,adreno-610.0):
 reg-names:1: 'cx_dbgc' was expected
Message-ID: <202603022330.rTrfwXIf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   c7c481f14ae7838859098e9873d18c44e73fa7cc
commit: 3c0dd95dd520822ef45c6d9235fe24ca3ffd6e6c [1/1] arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions
config: arm64-randconfig-2051-20260302 (https://download.01.org/0day-ci/archive/20260302/202603022330.rTrfwXIf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603022330.rTrfwXIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603022330.rTrfwXIf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1954.27-2025.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1912.11-1922.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: gpu@5900000 (qcom,adreno-610.0): reg-names:1: 'cx_dbgc' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: gpu@5900000 (qcom,adreno-610.0): reg-names: ['kgsl_3d0_reg_memory', 'cx_mem', 'cx_dbgc'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1954.27-2025.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1912.11-1922.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: gpu@5900000 (qcom,adreno-610.0): reg-names:1: 'cx_dbgc' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: gpu@5900000 (qcom,adreno-610.0): reg-names: ['kgsl_3d0_reg_memory', 'cx_mem', 'cx_dbgc'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
--
   arch/arm64/boot/dts/qcom/pmi632.dtsi:189.19-201.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@1c40000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1912.11-1922.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: gpu@5900000 (qcom,adreno-610.0): reg-names:1: 'cx_dbgc' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: gpu@5900000 (qcom,adreno-610.0): reg-names: ['kgsl_3d0_reg_memory', 'cx_mem', 'cx_dbgc'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1912.11-1922.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): reg-names:1: 'cx_dbgc' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): reg-names: ['kgsl_3d0_reg_memory', 'cx_mem', 'cx_dbgc'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
