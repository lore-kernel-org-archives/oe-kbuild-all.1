Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADC826562D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 22:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741212487; cv=none; b=ZMzqMvgU3ybkmnpcxHdUCUUSF04s0eQ1gTM8Rlxw2Uugg6cYltXQhZdwDqJRso6+ZBLa4YzPyo1ealy3NXNT1OgbqC4u0S21KJxuToIi9voiF+Ms2oVlC5IxqFSc4GZ5F7b1aVBv5ZW77U3EFTpjKFG03Q8NHtiBGJyIli33Q94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741212487; c=relaxed/simple;
	bh=xiZIt373GKfO4Iv+OJvmwRqk1BXMX1WoQvyfwmgD35w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5Pl0o2ig7nOyNXtKUvFVaZK8eGqYSxCtHFcQrmn0neVDw78zGjC+atZfchkbI04ZQ40Ga6LRb82H8O4sp28CyflbchS/QNsHeg+jkHyVi8lo3RYQNB9SB0IJvF8FnGkKfQgPZlQGT19WztyefhltU6z7m6yYY8S1IYikvQrbKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECcBJODI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECcBJODI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741212475; x=1772748475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xiZIt373GKfO4Iv+OJvmwRqk1BXMX1WoQvyfwmgD35w=;
  b=ECcBJODIWGcrntv3DIm+TZUHdx0YDU3fSNgeBmBHVIjq5S3/jERq0bw9
   IS6w17lh3iyZVvOeZ82PymhLLA01Vyyc1PBt+EXHEYcv4zvkXqklpbq1S
   sd51xhLOb0P7PPIwLFpi8RlrcJ4B2RV+z2Mae4ScRNsrCaxOBoWO7qPDy
   T1VgdROi+QKYn6D3C1iYZCPWxKIznoJ78JF9SAkXkg2aWZYCCqfAmv2jS
   V4cga87Gr0QCHyHd7E2jjn45NVsHiRwcldqVE83yBPEQE9piyzvuCsY8H
   qBT4yioPEPzHmTeeS/q7YZn7iJhFh3cxcuocSIJbgS5MsrA+CKW+3M1Fo
   w==;
X-CSE-ConnectionGUID: 9uUj7VNHTt+NBpXj1ucogQ==
X-CSE-MsgGUID: 2TerErnfQoiSbXMoOaunag==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42108132"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="42108132"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 14:07:54 -0800
X-CSE-ConnectionGUID: riD5Mlj4T9GB4sXJnwEYNA==
X-CSE-MsgGUID: RAWkhr3jQwS0VHeEs5BvEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156034981"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Mar 2025 14:07:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpwu5-000MFO-03;
	Wed, 05 Mar 2025 22:07:49 +0000
Date: Thu, 6 Mar 2025 06:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-lts 1/1]
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones:
 cpu0-thermal: 'polling-delay' is a required property
Message-ID: <202503060613.Y31NSSjy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   8e76d55979c1abc234e6fa16e4d697c318a38ea2
commit: 0da37d9875809e40d859305822569a9d96a4e275 [1/1] arm64: dts: qcom: sc7180-*: Remove thermal zone polling delays
config: arm64-randconfig-052-20250220 (https://download.01.org/0day-ci/archive/20250306/202503060613.Y31NSSjy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060613.Y31NSSjy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060613.Y31NSSjy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-2: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1331.21-1349.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a8c000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: thermal-zones: skin-temp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1331.21-1349.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a8c000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: thermal-zones: skin-temp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: thermal-zones: skin-temp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: thermal-zones: skin-temp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: thermal-zones: skin-temp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/pm6150.dtsi:81.30-89.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: thermal-zones: skin-temp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: thermal-zones: skin-temp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: thermal-zones: skin-temp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: thermal-zones: skin-temp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3177.27-3248.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu2-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu3-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu4-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu5-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu6-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu7-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu8-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpu9-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: aoss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: gpuss0-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: gpuss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: aoss1-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: cwlan-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: audio-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: ddr-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: q6-hvx-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: camera-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: mdm-core-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: mdm-dsp-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: npu-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: video-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: pm6150-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: charger-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: thermal-zones: charger-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: haptics@5a: awinic,r-spare: b'h' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: /soc@0/geniqup@9c0000/i2c@990000/haptics@5a: failed to match any schema with compatible: ['awinic,aw8695']
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: pmic@2: 'pinctrl@c000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: thermal-zones: pm6150l-thermal: 'polling-delay' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: thermal-zones: pm6150l-thermal: 'polling-delay-passive' is a required property
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
