Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8892313B58A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742021063; cv=none; b=ZFIELpOxGx4Ayo95cPNNKuuLjP+PCK9LZvQ4c7/bTn09t50J6NYWPMQR2ToikdDQJBgncBc7LYNqCRTZ9PzMw0ko+oENv1oZIKKsGa2B+GiKvwcotxukB5L/n472oBpYQeA9VuyjMSb4pkVJUbzOnKZnIC5gQ+idN+d+uLXssr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742021063; c=relaxed/simple;
	bh=Eqjf50s+r5VgHFiHpt6VTzNTjVezKZ5+vXhmPeoBk4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dl5fnogjeB1pXjcwfpY0iWuaqexmpDta/S85taDs2ERhV60GCXxjZSp+4jzbVMpDZIlE84BwPQd8fxqKAeu7awMj10RpZhOeVHzJkH9dgTJVsNiqIDhT/2FIhwa6FqbgpvRrMzoW6KXdLYzLAuoIARJMIz5iBcJS5vn174ympZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tev7BQl/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tev7BQl/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742021062; x=1773557062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eqjf50s+r5VgHFiHpt6VTzNTjVezKZ5+vXhmPeoBk4Y=;
  b=Tev7BQl/AsZm2vAipf1ieV8ycRLS24QmS/Hsk2wQ8ZBLaWnQyzlqWX8T
   P+MN8SkW2naqlMYlngHpH0a5yBhI1KFVeCQA6e+ePibiqQJma9lfltMwW
   fK6PEaKb3aIxaTVPFCWc4/n4FQ5xvTM+8L7QBioRXPcvKN/7hqfdgkV2e
   UQC+D+j1e3WIAA44xCpbVLB0biXAfQ1cVyZy8WkIrINDB3s7mVdrfYnt2
   /lIyZSHfmgrjATOQhGCs3pHqXkbU4r6AhPxA7BhsulpWeBDpGRTaSsETq
   KEVkJYvnsoBDGpZSiv5XJfj27wZ0phS+Y+QOsqqDMMW7Soh0Dp+8zUfTM
   A==;
X-CSE-ConnectionGUID: 0RPKNcsbSZegrcHziOmLqw==
X-CSE-MsgGUID: 5e1QiQA2TKqma1DsD7W6AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43385308"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43385308"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 23:44:21 -0700
X-CSE-ConnectionGUID: 01dNie6+RHu1d7WaIVDiuA==
X-CSE-MsgGUID: qw/m6RzhTKazAtvHYdzvcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="126528005"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Mar 2025 23:44:20 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttLFp-000B7L-0l;
	Sat, 15 Mar 2025 06:44:17 +0000
Date: Sat, 15 Mar 2025 14:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/1]
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: usb@6af8800:
 interrupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
Message-ID: <202503151419.yVbEIJVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   5c68dbf977c4aebedda2aeb928d2e519b38c10ba
commit: c0e803316a048612809c556d93df9eba9e1bc299 [1/1] arm64: dts: qcom: msm8996: Fix up USB3 interrupts
config: arm64-randconfig-052-20250310 (https://download.01.org/0day-ci/archive/20250315/202503151419.yVbEIJVc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151419.yVbEIJVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151419.yVbEIJVc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: remoteproc@1c00000: clock-names: ['xo', 'aggre2'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: /soc/remoteproc@2080000: failed to match any schema with compatible: ['qcom,msm8996-mss-pil']
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: clock-controller@6400000: clocks: [[2, 1], [20]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: clock-controller@6400000: clock-names: ['xo', 'sys_apcs_aux'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: usb@6af8800: usb@6a00000: Unevaluated properties are not allowed ('extcon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: usb@6af8800: interrupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: usb@6af8800: interrupt-names:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: usb@6af8800: interrupt-names:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: usb@6af8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: usb@6a00000: Unevaluated properties are not allowed ('extcon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: phy@7411000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: i2c@75b6000: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-qup.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dtb: i2c@75b7000: Unevaluated properties are not allowed ('label' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: /soc/remoteproc@2080000: failed to match any schema with compatible: ['qcom,msm8996-mss-pil']
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: clock-controller@6400000: clocks: [[3, 1], [21]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: clock-controller@6400000: clock-names: ['xo', 'sys_apcs_aux'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: usb@6a00000: Unevaluated properties are not allowed ('extcon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: interrupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6a00000: Unevaluated properties are not allowed ('extcon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: phy@7411000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: i2c@75b6000: Unevaluated properties are not allowed ('label' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
