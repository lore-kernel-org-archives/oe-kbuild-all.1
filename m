Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A9881E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 05:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736573908; cv=none; b=P7TqFnKb1H7RcPavMWRSWr01QVmYRoby2RTNb65oWFr47vMba8k2/rXYuMiMT4zGl8Syz/5HquAhrAMxMtQTNrmK45c97CAXJQHCYpJ9rhRjC24YJHoZAWawzDkt0pNCpoMCmr1VEA9RGV+dClXUyABcGcXOAfoLJ2Og8+XyL2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736573908; c=relaxed/simple;
	bh=qQNMo5BIe4wPOqty4dP/2olv/GjIs890MR4xepUpZAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WbVlxu55RMSZLJsRqszWyMOjlRIpgIp74ZIuUnX1iOeAy/eT40Rl17ZUdaRf6dizM6QwQrUUWH6/FGaWWoZEUa1zG+DOVCH0vGJBaP0PabZI/NuMvRAUx/aMhY7TMuFxO1PVrEJ0Os3a9hYQSVSmGAyrjmFho/jFipG5ReTJKuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbL7h+Tp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbL7h+Tp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736573907; x=1768109907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQNMo5BIe4wPOqty4dP/2olv/GjIs890MR4xepUpZAA=;
  b=lbL7h+TpGvhshw8iqNKs2q/KtPqSK+TczC0l1NdpFiDuSAo2JEuFxEOA
   n8o+DYPa3KEJL/l9Lho3L0NZEneb1JaQ9+5YJy+VyItp8dmHetLvl3J6k
   9sQjtUWx5U4FNeIFzapCdR0A99afl3YPv2eFbwo8GzOVKq0ixRdyFMdGj
   qheKwBiiWJLdYiJHGCSetcE5TdQfvEzhlWNdTkg/TzF8+F4UxOdTEKE4C
   sLVyQo/x3V/Pv3kRPvplu0e1adLDtrNYNX6iwjCUWysw0upEsiPSSrnmQ
   rIQDtDw1chMTseo3ufdUS/62ZpalbKzXxnyZOjdqNzUdl93wXvLnMhXDU
   A==;
X-CSE-ConnectionGUID: X8YVHv6jRw+iY/u9u6KeBQ==
X-CSE-MsgGUID: T/+IPloVSIqPqPMsmV6RKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36980370"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="36980370"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 21:37:42 -0800
X-CSE-ConnectionGUID: xOGgDSvCQHmO5jCKFfoeqg==
X-CSE-MsgGUID: xTaLI7m+QD++qE6+HhgWNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108958377"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jan 2025 21:37:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWUBm-000KEr-0Q;
	Sat, 11 Jan 2025 05:37:38 +0000
Date: Sat, 11 Jan 2025 13:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 6473/7860]
 arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ete-0: $nodename:0: 'ete-0' does
 not match '^ete([0-9a-f]+)$'
Message-ID: <202501111350.RauiFQK5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
commit: 6e8637db89bf138a0533b5442d9a0b02afa5e3e8 [6473/7860] arm64: dts: qcom: sm8450: Add coresight nodes
config: arm64-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250111/202501111350.RauiFQK5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111350.RauiFQK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111350.RauiFQK5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3438.27-3509.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3530.27-3582.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ete-0: $nodename:0: 'ete-0' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ete-1: $nodename:0: 'ete-1' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ete-2: $nodename:0: 'ete-2' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ete-3: $nodename:0: 'ete-3' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ete-4: $nodename:0: 'ete-4' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ete-5: $nodename:0: 'ete-5' does not match '^ete([0-9a-f]+)$'
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3438.27-3509.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3530.27-3582.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ete-0: $nodename:0: 'ete-0' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ete-1: $nodename:0: 'ete-1' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ete-2: $nodename:0: 'ete-2' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ete-3: $nodename:0: 'ete-3' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ete-4: $nodename:0: 'ete-4' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ete-5: $nodename:0: 'ete-5' does not match '^ete([0-9a-f]+)$'
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3438.27-3509.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3530.27-3582.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: ete-0: $nodename:0: 'ete-0' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: ete-1: $nodename:0: 'ete-1' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: ete-2: $nodename:0: 'ete-2' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: ete-3: $nodename:0: 'ete-3' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: ete-4: $nodename:0: 'ete-4' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: ete-5: $nodename:0: 'ete-5' does not match '^ete([0-9a-f]+)$'
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3438.27-3509.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3530.27-3582.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: ete-0: $nodename:0: 'ete-0' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: ete-1: $nodename:0: 'ete-1' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: ete-2: $nodename:0: 'ete-2' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: ete-3: $nodename:0: 'ete-3' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: ete-4: $nodename:0: 'ete-4' does not match '^ete([0-9a-f]+)$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: ete-5: $nodename:0: 'ete-5' does not match '^ete([0-9a-f]+)$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
