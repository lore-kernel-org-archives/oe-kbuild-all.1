Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAE021D3DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751135156; cv=none; b=basm3Qfx+ct2tV+6R/Brt/eu8Kjcxl+xp/qyLxin0CpeljNPg9VHyWtiKophPS7fe1AL6MC92676ipsYbU7/efZuggw2UDaVF7tr8lS/ppXPTAq78387u6mL4l1eqG9+jHGrmGl5y0Fj9oFsLL3wpj7+EQVA47HwPvIuCKZufVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751135156; c=relaxed/simple;
	bh=E7NEucfdzOwOPmrhGV8PFrCRhdGpHosZfaDaE6OnKIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t0x04+ngTZWQzuBYjr56pJiJQyXn1Do7zX+p5u738Rlhxr7KVBsDFlfJ6iKyrk187ubve/rwTfzM7NuOp9I+0a4WyP56q0s/gz6rl366HLY2jIGcun4tGqrvKHqbzl6CDKPyfumgz6QEIZFS2S25zpso9B5jS0Zqv/fiAsKMkyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0NOL+zC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0NOL+zC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751135155; x=1782671155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7NEucfdzOwOPmrhGV8PFrCRhdGpHosZfaDaE6OnKIY=;
  b=N0NOL+zCFH1C5WUdBoHMJgQOxjGVHe0i/VIxIQjiqEm7OJww5mwj1a4j
   /veWQVOqlfmlfbC4v9SAwTgBqlq3SbfoFW2HViPDswNN9Kmejmd67coTL
   ssS0BM56vsRE8130/NAWGccx0TuQDkCkOVo8rouZVTX99GkjCZL0EJLho
   tWpQQkaRGJHDk43QXKh8RrU2pID7k00lT65QWsRD6zNQWvrkmSzB2s0RR
   SftEKgcOjNCJcyS/3XslHiXDW8lYjmLVfPVVj9g2M1MTSJjNmQ0d0kfZB
   JqPNoyvK3232LLvlKbHKsY8a3FL90m5uWkqx1BdJLkBeImAOjJU80qX4k
   A==;
X-CSE-ConnectionGUID: tmFbzR25TSqxwhoCUgNs5Q==
X-CSE-MsgGUID: 7GbKrzdPQh+ld25lk2oJyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="57218144"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="57218144"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 11:25:53 -0700
X-CSE-ConnectionGUID: GHcnL2r2T9SYEoybPbFe6w==
X-CSE-MsgGUID: MFd8hoQ4Qy2vaYU2dFMbuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="157111888"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jun 2025 11:25:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVaFK-000XIM-1l;
	Sat, 28 Jun 2025 18:25:50 +0000
Date: Sun, 29 Jun 2025 02:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Manivannan Sadhasivam <mani@kernel.org>
Subject: [linux-next:master 3918/5998]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c00000
 (qcom,pcie-sc8180x): clock-names: ['pipe', 'aux', 'cfg', 'bus_master',
 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too long
Message-ID: <202506290206.DZbBHvHM-lkp@intel.com>
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
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250629/202506290206.DZbBHvHM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290206.DZbBHvHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290206.DZbBHvHM-lkp@intel.com/

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
