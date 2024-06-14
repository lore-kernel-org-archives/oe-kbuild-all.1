Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9415D26AF1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718347547; cv=none; b=jH5bX1lpxgtO6PNSMc7Syg+Hp3CBk7FHUjpXPHBpMCC+xzg8Ct6vRd8nM49jp1jI1tBEk3jIuuYmsfxh4lN6GIQ/k2miiFvmA4ADXDEmYHD+HMTJxoskflNAOWy+vfMG0FFi8uaUiJoGFzDcnhbNsl39oUQ77vrgAW9Dtb3F5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718347547; c=relaxed/simple;
	bh=VjRv9OAPq55L3xchzkACx8m0/0TiAJSfZNgOYoWbgsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+iPGgcyOavN2FmW8lFwMKGF1ZUwUAv/6odAyH5Uq5gLMHOTvwV0mE+IGo7bX899h/x5klN5COvsxR0Wp6H64XvJCM0+7ir5+g32WJ9TwO6kVbb1fB/qUJBXwJfQ3OSpA630nNKpja8jn81aXTqq0WZDJQUtQXAytJpO8MoZyck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWj5fypn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWj5fypn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718347546; x=1749883546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VjRv9OAPq55L3xchzkACx8m0/0TiAJSfZNgOYoWbgsI=;
  b=SWj5fypnqKvdSN6X6jJSil/yWjLTlcjhJ6gtthJlnmvV21H8y7q90bgf
   YySRDs1wjChwRqGMZcfg/tqImNZVtzJak9qzPTZ/0c4YiICW4B72t6uOo
   x3FzEbWf32DUx7Kt+t65Nu57xiJdlenbNzIdkGyi/+WPd8U5665qDYEZM
   1cWtBZlMG3qbxvs38Af7wKxmFrasxcxpR4vU0ZR8dRmPFdtd0E/q4uzyf
   5DAMejEWlaUAbHQpq+dTxUfbQwFLAnChOjiL4r/o+xUH4hQi59YDhiV52
   fUJjDkqbdcbJz4SktIBn4tg10HNqXWtzVkwVPbfghd3RxfMfmj5I9G5Zy
   A==;
X-CSE-ConnectionGUID: gtr+1i+VTN6rzUrAr2/JBw==
X-CSE-MsgGUID: hzD9Kam9SiC1so5XuFkB7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15048102"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15048102"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 23:45:43 -0700
X-CSE-ConnectionGUID: vvf5USk0TOCGN3Ld0ccq6A==
X-CSE-MsgGUID: dJ+lQufDTSGnWg/YAR8smg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="71610846"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2024 23:45:40 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI0gt-0000wX-1h;
	Fri, 14 Jun 2024 06:45:39 +0000
Date: Fri, 14 Jun 2024 14:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 35/52] arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: clock-controller@5990000:
 Unevaluated properties are not allowed ('power-domains', 'required-opps'
 were unexpected)
Message-ID: <202406141410.qM3EiXBR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   1c608efa13a09b28407cf405e922e4a80c778dd1
commit: ce88aedcfb959ede865c81e09fafe1f08e389a83 [35/52] arm64: dts: qcom: sm6115: Add VDD_CX to GPU_CC
config: arm64-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240614/202406141410.qM3EiXBR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141410.qM3EiXBR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141410.qM3EiXBR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1922.27-1992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1880.11-1890.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: clock-controller@5990000: Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm6115-gpucc.yaml#
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1922.27-1992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1880.11-1890.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: clock-controller@5990000: Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm6115-gpucc.yaml#
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1922.27-1992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1880.11-1890.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: clock-controller@5990000: Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm6115-gpucc.yaml#
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1880.11-1890.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: clock-controller@5990000: Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm6115-gpucc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
