Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23722E92CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040804; cv=none; b=b3VYPXR2S53ehiQnA85qrXcdStNYLOEVb0XV8kaTeChazpN7VRpgT/oOZi8u5NOurs4k6B2rB7Zye1XsXI075XNVabMK+ukExYXjaaedbU6o975/g00AYSCaIJF+XOiHc8bcAD3cbxgvukDYIMpGd0Ey84jknIBwKsWPUOi08bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040804; c=relaxed/simple;
	bh=S0IId3MTEvlfbD/Ik5Ib/Od2H7WAgvJJNzMBdN+bpoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvYmgDUKBWlezeNHuE2+fL4osJUOrdqLE8JiXTp89KDsTKVIODDuQUNOZ/rnZmvsyWuBLY7RcXGAh6Rtq6whFRSAr3ZoxmlCBGQtBB9kLhbGdB3bW4yq5+2bNCrwq/T5uSMtiqAGRqG5aZpRx7A2HHgKGoeiVtJ1kLahK3QCPTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4ugjoKQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4ugjoKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751040803; x=1782576803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S0IId3MTEvlfbD/Ik5Ib/Od2H7WAgvJJNzMBdN+bpoA=;
  b=c4ugjoKQYKn2a7caXr+emTdwCLqpIl6W2TrWH7151HSHEVuJKKrZIDBt
   GQHTVOUVUG16spnNHxA/q0CObRhPME7bOW59juiDdjmv2X1ehjyXsyUg+
   GYrP90DvJcHv/CEZJfyOwVqsR5bzl+KawDoCB064oqySZgpe3QKysCByP
   XiczTAWfsVMA/pnHJo6aivzT/C/9z4c/Vwg4WcotfCn7+Zb7aF04XzB6K
   Z4Xl5TRz61AgKWWK5VWcGdpGIJA48fB/jY/PWqWVxJPRIjYWCzf+tvUMG
   0TSt9sSzPjEUYPb+vAwHOQZhh2ilhkeH2DAxpGe3/dkCdFDybpA57ufUx
   w==;
X-CSE-ConnectionGUID: uS2XC2UpRDu+8+oOhbST2Q==
X-CSE-MsgGUID: ugjU9s2lRiS6IEQWeqDsJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52475525"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="52475525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:13:22 -0700
X-CSE-ConnectionGUID: Nm3a0OF4TfGVH8ieoD4v1w==
X-CSE-MsgGUID: T5d194nUSLeNw5bT1C22Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157226963"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2025 09:13:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVBhW-000WMM-2A;
	Fri, 27 Jun 2025 16:13:18 +0000
Date: Sat, 28 Jun 2025 00:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Manivannan Sadhasivam <mani@kernel.org>
Subject: [linux-next:master 3918/5998]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c00000
 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master',
 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
Message-ID: <202506280046.dag3OoWF-lkp@intel.com>
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
commit: 26daa18e35ebc4e192ff55d021f1cd7e69d55487 [3918/5998] dt-bindings: PCI: qcom,pcie-sc8180x: Drop unrelated clocks from PCIe hosts
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280046.dag3OoWF-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280046.dag3OoWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280046.dag3OoWF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2641.31-2686.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c00000 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c00000 (qcom,pcie-sc8180x): clocks: [[44, 54], [44, 50], [44, 52], [44, 53], [44, 55], [44, 56], [44, 233], [44, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c08000 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c08000 (qcom,pcie-sc8180x): clocks: [[44, 75], [44, 71], [44, 73], [44, 74], [44, 76], [44, 77], [44, 236], [44, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c10000 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c10000 (qcom,pcie-sc8180x): clocks: [[44, 61], [44, 57], [44, 59], [44, 60], [44, 62], [44, 63], [44, 234], [44, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c18000 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c18000 (qcom,pcie-sc8180x): clocks: [[44, 68], [44, 64], [44, 66], [44, 67], [44, 69], [44, 70], [44, 235], [44, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2641.31-2686.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c00000 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c00000 (qcom,pcie-sc8180x): clocks: [[44, 54], [44, 50], [44, 52], [44, 53], [44, 55], [44, 56], [44, 233], [44, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c08000 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c08000 (qcom,pcie-sc8180x): clocks: [[44, 75], [44, 71], [44, 73], [44, 74], [44, 76], [44, 77], [44, 236], [44, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c10000 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c10000 (qcom,pcie-sc8180x): clocks: [[44, 61], [44, 57], [44, 59], [44, 60], [44, 62], [44, 63], [44, 234], [44, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c18000 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c18000 (qcom,pcie-sc8180x): clocks: [[44, 68], [44, 64], [44, 66], [44, 67], [44, 69], [44, 70], [44, 235], [44, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
