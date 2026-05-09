Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB191D5CE0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 00:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286805; cv=none; b=AY2K1ED84QnTeh+st/4r469/Ren9Wvlv4OjXZUN9jD44Lknqbct0vuNK9FM6INIo13AmLPCBlaJwKO7hELoeAxh979HX5zAWdoXEo9dvw2BavDlC4VCwQdxeIqUSUf55lk2RPSLRYNSEgASXAh6AEUFcsPVsEglfrCxPHxBxliE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286805; c=relaxed/simple;
	bh=RSMaozHdrnl65ew97IhqEc2botUaKDo1QI6QbAChl0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jhmwj7vQM6fzSuS18UvA5m+/K30AeUcpAdvjTv5pvCjIifkSRR92CO30To4mbHbmxzmPCchT+aHXsaItf8/DbbOf/h8k6q3xh0irAWo2SrHN1uimTHYPga1hryXcD2KyRXb6q57A86SZXJvbZggnML2mXA+MJ9LEIBQph+loQmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PekFuD8a; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PekFuD8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778286803; x=1809822803;
  h=date:from:to:cc:subject:message-id;
  bh=RSMaozHdrnl65ew97IhqEc2botUaKDo1QI6QbAChl0A=;
  b=PekFuD8aXCBJYOPoLW32RXRHK3c/a78RUWfV/rV60rYPjGEm71NbgOoj
   7o0TnMdHFxAVwQzTQmih2lkwBX7XMxqAHn6sYkB/9rPJ9BHdifUogKYJX
   T6PP+iWxQTPA1Anv2NESFqWpV+64P8KhVnEgLH4sd3QdA+9uYGqxOXp5S
   MwZEs/TOEMXLPRaQOKePYuY3FGjVWIbacxaqLMLPliNNVz2sGUM/9PwKU
   UmYC3fGVA4T+cQebLuhN4odUX5litUe0/ahS0fQbW7tYOj9ZorNzv8CuO
   imhpqBf2IerC/RKJbzWFCiDj/+0vAA4RZDA933/4qfoucjXnayiZs5Ljb
   w==;
X-CSE-ConnectionGUID: amhV04hiTz6ZvRSl79f9KQ==
X-CSE-MsgGUID: AHe2hc3rTq68LC7nNXx3YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78291070"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="78291070"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 17:33:22 -0700
X-CSE-ConnectionGUID: ScYlvqk8SoecnHlYREYlHQ==
X-CSE-MsgGUID: bFL9QdElQiS0AKMtvVD1Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="241911486"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 May 2026 17:33:20 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLVd7-000000007Kh-1wFN;
	Sat, 09 May 2026 00:33:17 +0000
Date: Sat, 09 May 2026 02:33:15 +0200
From: kernel test robot <lkp@intel.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: [linux-next:master 1432/4394]
 arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy):
 clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
Message-ID: <202605090217.jBRJTjQj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 3e6cd0c43cdf678622c19210bd1a70b04c8a79af [1432/4394] arm64: dts: qcom: lemans: add mdss1 display device nodes
config: arm64-randconfig-2055-20260508 (https://download.01.org/0day-ci/archive/20260509/202605090217.jBRJTjQj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090217.jBRJTjQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090217.jBRJTjQj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[322, 11], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[322, 28], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[322, 11], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[322, 28], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[323, 11], [323, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[323, 28], [323, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[323, 11], [323, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[323, 28], [323, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[322, 11], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[322, 28], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[322, 11], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[322, 28], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
