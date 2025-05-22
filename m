Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94565C2EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 03:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747884671; cv=none; b=B+UjaKsA1/kkgh8FuqLwX5uhFpf5MCxwTIUdaqnwvodF4oODXeGSJ8HQD2tEfl40dVovJiQI4g12mi4l4AT3Y7mnitgOQv9L1LH9arGB6I6x0byS7AH+iwtkDbL0hJb/wI/Ajv+wIWKGAJL6/WSVyAuHGUn37ME8PB+8Ahku9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747884671; c=relaxed/simple;
	bh=v1lLaQpFgFUtCVZvY2HwaLOsTzJf2/BY3Wn/Y47RM3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e2WeuhjJ+EittFbxyFpxcZsFPRwtJ/zdPOn/evyUsmK0kSv7+ik2Rst1Oe+Xf+xXzShFlPmxqbLUKxs+cYOFTGkkXs5ADginJjD4eXterrHV0puhRFHOjHtXmTxGT6aBzzNf/d2bHRXflBi0yXFpYVsbrQ7V98G/qHIDExyc/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEj1EqeM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEj1EqeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747884669; x=1779420669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v1lLaQpFgFUtCVZvY2HwaLOsTzJf2/BY3Wn/Y47RM3w=;
  b=gEj1EqeMTkAG/aLi6QrGTFj/DAHNzHUuGJhXC8xu8XQNsEp8Sh1DTfBw
   sXbk1z9ho5XawyBiANoaHlzN0BDhYMeaGzVjeirMPad6zNW97T2b4MfmW
   O54iyUZRa4yST9p/nNEEZEznUF7PCGIEJwBMceA+jOqOJcb/nfnRUBTqd
   Yn0yKAmKYdyrkSsvrWjUuBrqUHn78+w9Qe59MSlq8y6ik8eYSW2wpRaFc
   BtWbolupTBbHJ/RMpCQfQBhCcwxauiaLaL6u45h63jMGZ/Cq646g0/na+
   1tAYra/eetC5eouEpRtoUmSZkWjZoTVflH+fIOaoriOLf7wIihqPsAM9o
   w==;
X-CSE-ConnectionGUID: bhxqrpcfQLOWPrwhvBgn5w==
X-CSE-MsgGUID: hVH7YR06SquqbaZicM9B4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60131455"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="60131455"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 20:31:09 -0700
X-CSE-ConnectionGUID: CdpjrnRnRMSskjz+xrrEtA==
X-CSE-MsgGUID: Y41Uxrk8QkGUOGWskeT6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141444401"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2025 20:31:08 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHwe9-0001Df-2b;
	Thu, 22 May 2025 03:31:05 +0000
Date: Thu, 22 May 2025 11:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-01 4/4]
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: psci (arm,psci-1.0):
 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6',
 'cpu7' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
Message-ID: <202505221112.vmiuX5hp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-01
head:   97728a1436424265258cd2b247753e19e79202d3
commit: 4fb40b22e97ecea2d18a0c450c24388909e5b44c [4/4] arm64: dts: qcom: sc7180: Split up TF-A related PSCI configuration
config: arm64-randconfig-2051-20250516 (https://download.01.org/0day-ci/archive/20250522/202505221112.vmiuX5hp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221112.vmiuX5hp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221112.vmiuX5hp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3196.27-3267.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-2: 'idle-state-name' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: psci (arm,psci-1.0): 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: pmu@90b6300 (qcom,sc7180-cpu-bwmon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc7180-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,sc7180-cpu-bwmon' is not one of ['qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm8550-cpu-bwmon']
   	'qcom,sc7180-cpu-bwmon' is not one of ['qcom,sc8280xp-llcc-bwmon', 'qcom,sm8550-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
