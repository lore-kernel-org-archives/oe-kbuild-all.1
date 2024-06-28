Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598F2481B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719605192; cv=none; b=jMW8ZrLnBz6g6SVV3gG6tQ9cKXeTHaEyys2DeXiXt2pmUmUYm/HFdXsvfuxw37CH+TN0HwQwBvGb4hDmFroljLRE5xyepBgvBBmuDfmXyeIBmcZ5xOxXMIellgdEttnVGznqeyVqN1edY1CclzEK2rX2UdsB//VOy84UFX+bqwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719605192; c=relaxed/simple;
	bh=bNvP5CoeOyi5Ql2EWNSM0hW7iHf/42WPjoYo9JbHOBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXbucMqD6ir12MtG61Im7ggd9kXq5UtglFd1j+tM4Ck9VO2kNYSRpc2w2vTQpTkoT9QHAPUbTkHoIwAe9Nfd9JUewDzj56J3JYw+TqNMjyKwQyBPxDpJFNGPzAYvvGleJUL0nMlhUch6fAzNvzRNGN0K9PS8GnZ7nOeJv5zA4lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EN0Gmx5m; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EN0Gmx5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719605190; x=1751141190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNvP5CoeOyi5Ql2EWNSM0hW7iHf/42WPjoYo9JbHOBo=;
  b=EN0Gmx5m45AgScBNmbnVH2m5Pl4Rc39uRmdOfuQf1xo/5cy1e3OUr11Z
   G5QnrRhYnWzPIoNl+GEGh2aBAy6dr7REcQraBVj3HhulKGaeylblhOt2l
   u5knL3KJZG3co5bZ6Uc/JyQ9tf1OAQYka3Xbg5whb9cuDrmE9rMpI9WJ3
   jTaN8jajl1+OXjeYAYjaCi0LURQtW0b8thhGliALLVlB4MhOsYj3b6UZC
   jVouKtD6C11M8Ery3Cq2tiQl1Xz6evRwUdfC3GNd4Lh9+GcrahH6KC6Tx
   X/VmSL7rJZFmDKGMsYRKsqJAAmAhcA/ki8p6efaVCw6ynRDns+vjH6F4k
   w==;
X-CSE-ConnectionGUID: SPhOR7PoTWK1UAl0ZOwlIQ==
X-CSE-MsgGUID: 7N9Xt0BOS2WnBATahFL0FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="19703861"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="19703861"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 13:06:29 -0700
X-CSE-ConnectionGUID: hILK/Z3sQPifudRmpbImvw==
X-CSE-MsgGUID: 9I2DDOdqTUGCyZmyr/UX1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="45260434"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jun 2024 13:06:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNHrW-000IHs-0E;
	Fri, 28 Jun 2024 20:06:26 +0000
Date: Sat, 29 Jun 2024 04:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 112/251]
 arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: system-cache-controller@19200000:
 reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128,
 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288], [0,
 432013312, 0, 524288]] is too long
Message-ID: <202406290342.xjz3glVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   fd513b922e34edb0db1284a4abee7f6c10ffd9a7
commit: c566143137aaacfed1af09d8710edab1971c312d [112/251] arm64: dts: qcom: sm8450: Add Broadcast_AND register in LLCC block
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240629/202406290342.xjz3glVS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290342.xjz3glVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290342.xjz3glVS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3248.27-3319.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3340.27-3392.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c08000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128, 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288], [0, 432013312, 0, 524288]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: system-cache-controller@19200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3248.27-3319.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3340.27-3392.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128, 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288], [0, 432013312, 0, 524288]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: system-cache-controller@19200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3248.27-3319.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3340.27-3392.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128, 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288], [0, 432013312, 0, 524288]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: system-cache-controller@19200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3248.27-3319.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3340.27-3392.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128, 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288], [0, 432013312, 0, 524288]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: system-cache-controller@19200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
