Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E61EF9CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 01:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751073787; cv=none; b=XadwclQfqJIzBfXwAOmkZUEBmDAAcJrwz3UNcaWtVo8CYzFhpWrx/UYygKC/91LBw+QIQPUse7rFSIyX158SS3JxHQBzy91Pmu7zkDJlZ5y0NtYDwrk9fhk8IG1CYxkboM3lTzg7sAq80WTbimvi/aw26uLwuuvNdNSIVLoNxfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751073787; c=relaxed/simple;
	bh=oFqRvmB79tkRiPkXfLqCK3/TCRhaXU/ZmX3G9TS4hBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eODfzxznr9fFX4GC98YZm1+tj0Tv+0VXywPgha8PgXMEAkfjkdOadpH1xup1JSr5BoqeY7YjkXuFJlIsqxJRIjxkvYOeEN+4G1/yHLJo+Csky/E4N2Kbv/y0tJINbfs6nqM5oXG1Gc9kujFxNZqwbA0+MepaLUAiotnkonXPOU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcX1fD1R; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcX1fD1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751073785; x=1782609785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oFqRvmB79tkRiPkXfLqCK3/TCRhaXU/ZmX3G9TS4hBs=;
  b=LcX1fD1RcldJFmTay5njsKs2rNvQst54PbD7C/9hLg37HtgdoIt+NIRp
   ADUl6p4H9HfmGcVO5QCCnw9Hq0xOFIS9pleZXG10wYSapbGyyD0PAC6nk
   Fp30g6NHiUedITF9nAe661U5p1YB2Eg6lsxw2E1e36UAgaJohNP4H5z4n
   oNsRWvLIhOPkuYqAukYXKUnbrbQSF19KRGgSLyH1W9FkiHEFdvMaFxdQq
   QaPipABUMKusogm3wtiF/ZZ00OK2eiSBSTh+Aa9r4TUht/QfTaqvnVPfR
   Je+d0rSDdjTjSec5qNlZhwmlULzlK50sOKn/EStK9qSshaA08Zpd2CWnx
   w==;
X-CSE-ConnectionGUID: sPmtTMxOSCC3N/A47OHFJg==
X-CSE-MsgGUID: JlJObTBXR+SJdRGZPMWrOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53113687"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53113687"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 18:23:05 -0700
X-CSE-ConnectionGUID: 3MCTH5SwTnqxeChRUogsVg==
X-CSE-MsgGUID: VzuxuaU9R9mY7+HGwOnsfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="153126440"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jun 2025 18:23:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVKHV-000We6-0H;
	Sat, 28 Jun 2025 01:23:01 +0000
Date: Sat, 28 Jun 2025 09:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Manivannan Sadhasivam <mani@kernel.org>
Subject: [linux-next:master 3919/5998]
 arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c00000 (qcom,pcie-sm8150):
 clock-names: ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a',
 'tbu', 'ref'] is too long
Message-ID: <202506280928.b0NfYVw8-lkp@intel.com>
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
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280928.b0NfYVw8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280928.b0NfYVw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280928.b0NfYVw8-lkp@intel.com/

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
