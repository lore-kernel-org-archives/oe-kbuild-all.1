Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FB41EA7CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 05:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757913709; cv=none; b=kuxOkPKNQQ2GD359dwLXXH5Mbt6F0JB8OhEjatoutctrxLaH8tsq5GSX/JQKScNKOAgXBJPKXV56cepQp+ieS4VLw+4pOnyN6Fxg5ryGOZhsRD8dzpA3ifmGMnlrTi/tJOwEcN7UueQzM0GVYILBPY78uy+a8lubTRgNf+GrIuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757913709; c=relaxed/simple;
	bh=f3ocGFngrbYyaWHhl2JKjjhCUTl57cdmOb2X1FPRqiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmikz2VhGg33tfrUuwgGnr7Uy+aXmuiqoUENCz6+z75h1ndd0fmOLMN03xnPVMwfiA9ORKlQti4jqaoJaNLMMcK7F7NA4v7WaV4Ix8k1NAH+pBG6EWg5G9fAEif0U2Zct6inYzoMowAdMuwuHck3KdXDw4GzeOOPrrA5Ra5ZeVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y43OjIfq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y43OjIfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757913707; x=1789449707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3ocGFngrbYyaWHhl2JKjjhCUTl57cdmOb2X1FPRqiM=;
  b=Y43OjIfqQMUtOw11oZWlrPCq4uiN1xYN5jzIZ5Y4bBAd1Ink3U4MwxSp
   BQw1s24LTE3VtdTJeEcHhb+GMp114lYZRfHIjdeu7UtPr7lo4Ew0bqwAQ
   mvqYj1ZWYEb2Agrv7NR+GLDYwzLFwm28zqRNT2predhw6mWWuzkoHAC36
   2Z+FppEIY5+GHrhQZqt8YLtx8pJtxzDESwGqP160/zaL38xNbAVqCIRDO
   10SpAXKJl+we8owIE/QCKaNkqI91TyvKajXM/Qt38zRO1mQfxZfJzs7Ve
   PGCzkCPhBLg5ysCzWzl4CzBIEBvUfx9OkYs4e7xGg+gSZfJCBwgDO11Wq
   g==;
X-CSE-ConnectionGUID: qLpbRjE/RwqXelmCczjWcg==
X-CSE-MsgGUID: EbGMi1PZT72f7Y9miNIo1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60105260"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60105260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 22:21:47 -0700
X-CSE-ConnectionGUID: IMp36epDRPWquGqQ0KCzAQ==
X-CSE-MsgGUID: qMvUX9B4SnGVDJLZz3K/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="178528842"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 14 Sep 2025 22:21:46 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uy1ep-000000001y5-0eqo;
	Mon, 15 Sep 2025 05:21:43 +0000
Date: Mon, 15 Sep 2025 07:20:51 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: display-subsystem@ae00000
 (qcom,sm8350-mdss): interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg']
 is too long
Message-ID: <202509150736.UUhHZFIg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8e86454f068ad3187350cd9fb81aca87249d02c1
commit: 5e1cf9f1f397a3d24dc6b06eda069be954504a16 [1/1] arm64: dts: qcom: sm8350: add MDSS registers interconnect
config: arm64-randconfig-2051-20250906 (https://download.01.org/0day-ci/archive/20250915/202509150736.UUhHZFIg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ffbd6162103041697ce7387029f321d3a466ca34)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509150736.UUhHZFIg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509150736.UUhHZFIg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects: [[133, 7, 0, 88, 1, 0], [133, 8, 0, 88, 1, 0], [89, 2, 3, 90, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects: [[117, 7, 0, 76, 1, 0], [117, 8, 0, 76, 1, 0], [77, 2, 3, 78, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects: [[117, 7, 0, 76, 1, 0], [117, 8, 0, 76, 1, 0], [77, 2, 3, 78, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects: [[123, 7, 0, 79, 1, 0], [123, 8, 0, 79, 1, 0], [80, 2, 3, 81, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
