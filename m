Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0585F1898F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736674653; cv=none; b=YTo6X33bSO/jrwkUK+l6giPvFcqiFo+3fknY52TrhLl3rFh3BJXdj0UV6kzisX5MBGJ7zBPPE05rJMjL9bIKwuFKbkQtctGCElwHvyk1IUeiiT+neypeVOtTAv7deo4vKErDNgaBgxEd5bcFNxreeFqePazbE7OiGHw1tX7Nb94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736674653; c=relaxed/simple;
	bh=uqq5d/wF8OT5c+zhTUbbnr3TgoxNDIkgCYYn+oTc1pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jM4gHmjjZCO6EbzP384+CowDD5LLD/GMI33MWeJEZsT1GHYokbolCAJ5mf0Xb5+mSpsll/nc6ufF3ICZn9E+yLrp4l6KcxO5+YRnAPFxmBCDvx+8pv1pW+QwICQk0wbwCdhdM9O2tMjDcJQILsprTz/vPyyeQDIC6y1GP3XKBns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ucjl1t3G; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ucjl1t3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736674651; x=1768210651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uqq5d/wF8OT5c+zhTUbbnr3TgoxNDIkgCYYn+oTc1pw=;
  b=Ucjl1t3Gl0XuFUyRephOUhQyRz5GtAucKJwR6tXlCrjeQMiZux10fdWa
   XyyU/BvgQY1+MdUtlALtdfT+9Jd+ce5T00rTlhphuBzbFCcIZiL4Jv/D0
   hEi4tRlRctX6XERlu9lLESpDZPDihGWHOzA75KhSU6JfXVcupFl5i0cpO
   JSfgsjEKKgSiMzDwo6Ru1GmrluQro6ZhvfVewvFZsFgqH5he5QecrqZSV
   LYFwMFTaNSbSl4Hbd0Xy5+cLzqr2EGFBUjtKHZCkNEO3rFYG76lACDdni
   J2m1tjSxgbLu9HpS4BKNqyk1vzw6y8SBJ59/RPSM+wL45NCo9V2fdn6a8
   Q==;
X-CSE-ConnectionGUID: ZhCLba0ORoSlWn5i5LdTqg==
X-CSE-MsgGUID: kzjXIAk7SjqZHW70rv1osA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36601261"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="36601261"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 01:37:30 -0800
X-CSE-ConnectionGUID: XUVq3G3cRTaJwgGSMpOzkw==
X-CSE-MsgGUID: f4jbGwDGTpCDtrnEpVXJLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109188475"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2025 01:37:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWuPO-000Llr-1F;
	Sun, 12 Jan 2025 09:37:26 +0000
Date: Sun, 12 Jan 2025 17:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [linux-next:master 6760/7860]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c00000: interrupts:
 [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146,
 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
Message-ID: <202501121720.SGjYIoDu-lkp@intel.com>
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
commit: 3e14b14ec8b94c954d8d09230686cdaf5162f3ce [6760/7860] arm64: dts: qcom: sm8550: Add 'global' interrupt to the PCIe RC nodes
config: arm64-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250112/202501121720.SGjYIoDu-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121720.SGjYIoDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121720.SGjYIoDu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3288.27-3343.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: display-subsystem@ae00000: interconnects: [[183, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3193.27-3267.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3288.27-3343.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: display-subsystem@ae00000: interconnects: [[205, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3288.27-3343.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: display-subsystem@ae00000: interconnects: [[189, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3288.27-3343.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: display-subsystem@ae00000: interconnects: [[196, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3193.27-3267.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3288.27-3343.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: display-subsystem@ae00000: interconnects: [[176, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3193.27-3267.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3288.27-3343.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: display-subsystem@ae00000: interconnects: [[180, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
