Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D0D60EC4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896497; cv=none; b=d+lMTJo8bd2XY4TU7qG+rX3Ogj9d5waQTK3tvpebFidYe8Ico04n/K4TJ2pzhA7+rapwBPIPoLo/KkcT78JVUc2TWVvSM91hD/ny4pes8yTRoqDNqYW+QzoWk/A59hmjXUg5IVtixNePTYN0PKKXXIJyMkuUJX67Jsu02+ei1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896497; c=relaxed/simple;
	bh=0h4nLhFWviZ6zB2UvWrrfoM1emvsoliqCGiF970mTFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gDLgtHS998orZcnVQrehfueaGJdt765N2zm/+z9a2KbIG7m/m00jK4lk4hCjyPSdMerjXXiln4XYaOQa3wYxms5inghtJvrdbDlZfXnSFUElRyBF1lBNJh0M9I4s9+XyoXQL7rAtpntAOCcLAFLHPVeqWnIQ5Voa/LS3DXygU6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBpYIfKu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBpYIfKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725896496; x=1757432496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0h4nLhFWviZ6zB2UvWrrfoM1emvsoliqCGiF970mTFM=;
  b=ZBpYIfKubPX7xRBp4Zp528zNuaC4BR409ZZ4zwnrUEXnRu5PCqlzAFZR
   rOP5RoYEISCHjxPmZTfTn3DLeoMu+z2n9bYLJhKCeUkoxbxSv4mDJ6kA9
   T2QL0NUsjxpOOF7VlbDCd9vTx2cKh9Bly4kuBRHLyQeCJHjY/KXmjrasZ
   EJZSJTzNB2ieVnklJn6bj1HjQ61XjRUGWw1JL9zxRshbRgk4wbJ/vSUUB
   2rpHEMX7DLINOXPgCLuQvWnSwvBr8lTCWsO7p+JBun6Dco6g/w0cvFBOd
   0YvgeI8WoTEzY9JwdI2CCJXk8O1kJUjntAdB52l8Q/fdOuDuYjaa1rTYQ
   A==;
X-CSE-ConnectionGUID: 85hDcCu3SFi2S2WlLlVsZA==
X-CSE-MsgGUID: AidjZdCEQrajrMnfkM1mmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24468452"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24468452"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:41:29 -0700
X-CSE-ConnectionGUID: N3wqs4enQ/qadrsqqJ5rEw==
X-CSE-MsgGUID: U6oPwwYXQ2utwLLZ3+fcsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="97516091"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2024 08:41:27 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sngW5-000EtS-27;
	Mon, 09 Sep 2024 15:41:25 +0000
Date: Mon, 9 Sep 2024 23:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 7339/10296]
 arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c00000: interrupts: [[0, 141,
 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0,
 147, 4], [0, 148, 4]] is too short
Message-ID: <202409092302.SUWEJJuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: 6efd853303a5eea90a21a1ec496005317b6cc2e3 [7339/10296] dt-bindings: PCI: qcom,pcie-sm8450: Add 'global' interrupt
config: arm64-randconfig-053-20240904 (https://download.01.org/0day-ci/archive/20240909/202409092302.SUWEJJuS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409092302.SUWEJJuS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092302.SUWEJJuS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3248.27-3319.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3340.27-3392.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3248.27-3319.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3340.27-3392.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3248.27-3319.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3340.27-3392.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3248.27-3319.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3340.27-3392.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
