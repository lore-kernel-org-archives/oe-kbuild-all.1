Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4C1494D9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 22:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751150843; cv=none; b=sAHZCLhvj+H0C6Z/xm9ooZDhVx745abScGq7+q5gMTprMBj6Znzo9My6Veq4gcSe5brf2I0zALrxnBqMWN9VTWUhedtD6De4RFs0U3cBohIgnZ/blfz7gc6eWFYoqrIFxIe1lCP/dQFaDY+3QYkWA59FX+j4f+YdJyE5zRL5yQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751150843; c=relaxed/simple;
	bh=ADbLaJCOrpLaHw4yAMS/xz4Iscvid8hLKvjcKJMDlGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSGF8wHxGwITbj56c00L77RHG44g9VaIuIgy/+B25NY2Xl6I1rgQfsYlk5ADFNi3D1ea04IAoSAZnHp7VQtn+dtW2Kg/bU0LLCyXv85Ax935HgExzuMeqorRU4b4lJeVkZlP0et2agj224601aTv9+uIS0uhDCaCj75jtoWtvY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aty+yMPD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aty+yMPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751150841; x=1782686841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ADbLaJCOrpLaHw4yAMS/xz4Iscvid8hLKvjcKJMDlGA=;
  b=Aty+yMPD9fzOQJ5j6OaR3THvCxlb6i6iIoTNL4BaMqG5KtU/vIXdMz8E
   LFsFCZaCUdKQriX3VirmEMVsB/axPULj1ona6/CrkE0PTIoii+iDt96Bt
   zn69nwUjWUgKhpsB/pWGeT2OjgulN9ABh+KGnGG8rsHej9lscp/dx0QTy
   MYACIFmBsz2T8zo23hbe9Exuajh7Vj53mm3yUazb8Y++kfkxL83TbCMEV
   +oL2S7w4phFhD+kxUErFsSzuJONEQByU5Q9E47T2b9X4x0IFxuhnf5tk6
   162oZwXZnhQp3k8tTVdmrk1KE6VM8XYBym4mJO5vwHPSnJtSt9LfBhlBq
   w==;
X-CSE-ConnectionGUID: Vh2b8JCFSrax2ysnzwycjQ==
X-CSE-MsgGUID: 3Q5Wdu9AQUyAfluBsR2adw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53574469"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53574469"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 15:47:17 -0700
X-CSE-ConnectionGUID: Y3fRA6FFTQiTPKDiLEg1nA==
X-CSE-MsgGUID: XukEXUipSGytcLQrr+MDwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152613751"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jun 2025 15:47:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVeKI-000XSE-0D;
	Sat, 28 Jun 2025 22:47:14 +0000
Date: Sun, 29 Jun 2025 06:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Manivannan Sadhasivam <mani@kernel.org>
Subject: [linux-next:master 3919/5998]
 arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c00000 (qcom,pcie-sm8150):
 clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a',
 'tbu', 'ref'] is too long
Message-ID: <202506290636.axKi6BBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: e1cb67ab82aab44cda410616498d4749399da217 [3919/5998] dt-bindings: PCI: qcom,pcie-sm8150: Drop unrelated clocks from PCIe hosts
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250629/202506290636.axKi6BBg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290636.axKi6BBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290636.axKi6BBg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c00000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c00000 (qcom,pcie-sm8150): clocks: [[44, 55], [44, 50], [44, 52], [44, 54], [44, 56], [44, 57], [44, 0], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c08000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c08000 (qcom,pcie-sm8150): clocks: [[44, 63], [44, 58], [44, 60], [44, 62], [44, 64], [44, 65], [44, 0], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8150): clocks: [[44, 55], [44, 50], [44, 52], [44, 54], [44, 56], [44, 57], [44, 0], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8150): clocks: [[44, 63], [44, 58], [44, 60], [44, 62], [44, 64], [44, 65], [44, 0], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: pcie@1c00000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: pcie@1c00000 (qcom,pcie-sm8150): clocks: [[44, 55], [44, 50], [44, 52], [44, 54], [44, 56], [44, 57], [44, 0], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: pcie@1c08000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: pcie@1c08000 (qcom,pcie-sm8150): clocks: [[44, 63], [44, 58], [44, 60], [44, 62], [44, 64], [44, 65], [44, 0], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8150): clocks: [[44, 55], [44, 50], [44, 52], [44, 54], [44, 56], [44, 57], [44, 0], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8150): clocks: [[44, 63], [44, 58], [44, 60], [44, 62], [44, 64], [44, 65], [44, 0], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: pcie@1c00000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: pcie@1c00000 (qcom,pcie-sm8150): clocks: [[2, 55], [2, 50], [2, 52], [2, 54], [2, 56], [2, 57], [2, 0], [42, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: pcie@1c08000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: pcie@1c08000 (qcom,pcie-sm8150): clocks: [[2, 63], [2, 58], [2, 60], [2, 62], [2, 64], [2, 65], [2, 0], [42, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: pcie@1c00000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: pcie@1c00000 (qcom,pcie-sm8150): clocks: [[2, 55], [2, 50], [2, 52], [2, 54], [2, 56], [2, 57], [2, 0], [42, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: pcie@1c08000 (qcom,pcie-sm8150): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: pcie@1c08000 (qcom,pcie-sm8150): clocks: [[2, 63], [2, 58], [2, 60], [2, 62], [2, 64], [2, 65], [2, 0], [42, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
