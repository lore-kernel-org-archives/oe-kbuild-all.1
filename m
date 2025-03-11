Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A483C257AFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702849; cv=none; b=U67djtMaNVeJ+DyWj2ZMyrqA/5CS7KeYfCyN3/hIXCF4kAr0X9sru/+VDimfYWs8Edw+FNLgRN7ABqdNvQAv3xsX11XLRTms6IqTdcUpsYjNrKEqMcZUqG4fRCyjgmOzN9JZO2t1jwSto+dQFElRqKQa0vpYVZL+nA6duUcJIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702849; c=relaxed/simple;
	bh=HsSoUsxJtinJzrZWT/clgk0LKABV57qzxbVxY7w1TCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXeywF7fd8G+9su6vrC1HMWGW7BSnrw5CwDKwGuQtQxehPFVzV3ktB1mlPbufY/bWh+XWh7blvOT8WCOh5yVHPmZQCStX1dQkrCl6+yt7rxYYxnxZjHBD32P4B+xqpxjV7lucLobwHgglj0sVZ42tYzpEV0m0DMKJ0Oo8P6cmhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvCO6090; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvCO6090"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741702848; x=1773238848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HsSoUsxJtinJzrZWT/clgk0LKABV57qzxbVxY7w1TCQ=;
  b=JvCO6090T+wyKDA+ABCNPCqFpZIM/6LmJlDf8B8Fqq9qZ36RbRUujr02
   tkmHa6UBDmmR7hbxLU+LXpRSUoUGybhWYDpt9iZ6j/dw/J0X5Sw4zq8/3
   tRpD6SrxbZaaGQyVDYsb2YZkOsKeWUftqp2/Mcuuloi/JDeZT9oBcSiVO
   vRlDd3UmzaABAEALAoMWfn2OnWoe1yw4uQA3IoOm2Ayy+sN8uY7dNI4YG
   W/oC78QQ+0IWt9uxLT46338j3w6BEGpLhUpdtrNHhw1FsjfZ6W3Qm5PGJ
   oZUP5vMdobdP2JhFBeCScGPp4E8gtlo82cOSY89VCX4G8bUEkyL+0Ic1X
   w==;
X-CSE-ConnectionGUID: TmrwfJlCQPOVxXvseynU2Q==
X-CSE-MsgGUID: +Ez7RdeHRnSOYjGLg3wVDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="41997041"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="41997041"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 07:20:47 -0700
X-CSE-ConnectionGUID: RUXLLdmKSpyVbGgM0EezOg==
X-CSE-MsgGUID: ELpcWExBRaqbvXJBzjl/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="124504780"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2025 07:20:46 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts0Sx-0006hs-3C;
	Tue, 11 Mar 2025 14:20:31 +0000
Date: Tue, 11 Mar 2025 22:19:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/1]
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800:
 interrupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
Message-ID: <202503112251.tB21wkSN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   3e7a6629f398fbc9d78216def76bbf6b860ff58f
commit: c0e803316a048612809c556d93df9eba9e1bc299 [1/1] arm64: dts: qcom: msm8996: Fix up USB3 interrupts
config: arm64-randconfig-051-20250310 (https://download.01.org/0day-ci/archive/20250311/202503112251.tB21wkSN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503112251.tB21wkSN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503112251.tB21wkSN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: remoteproc@1c00000: clock-names: ['xo', 'aggre2'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: /soc/remoteproc@2080000: failed to match any schema with compatible: ['qcom,msm8996-mss-pil']
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: clock-controller@6400000: clocks: [[3, 1], [21]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: clock-controller@6400000: clock-names: ['xo', 'sys_apcs_aux'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: usb@6a00000: Unevaluated properties are not allowed ('extcon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: interrupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: usb@6a00000: Unevaluated properties are not allowed ('extcon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: phy@7411000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: i2c@75b6000: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-qup.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dtb: i2c@75b7000: Unevaluated properties are not allowed ('label' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
