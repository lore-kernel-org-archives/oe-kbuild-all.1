Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78D2248B9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757959618; cv=none; b=UFE8ZLJvhuvZkfUt+jbXOvxLnylzlDujKZQLX0xkhyyqjuaUJyOIV7VqfvE/nQXR4247s++FA+GNUXq4UFPG+pgMb8wpknurl0xb7r8Je+K9Sbc0Nyg56XzLhcOgHbSdBnnG++nsslIFPhfNwhC/Ob6GEWCDFtSGlRYDK/cGgtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757959618; c=relaxed/simple;
	bh=tC5FxPjZdRmxCepz+lwsZww5d/ZtDzOUY/X5W6GgjD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/4PigOXFGaQyodWiWqS2Aw6wRZ0IFnyH8kL4Fwh0PJ7bheYbOjtxYMGcHNKkPxpJr4omNYoHpch03I18TWSqIZeC9wJuH0tZz0iTzIuhB2wP7uniYP0jD++C7kgHWq1VItZcmMveWDx/SUFYyZijUd84nEwzV8br5PUEIuXVCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHJ9xFqx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHJ9xFqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757959616; x=1789495616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tC5FxPjZdRmxCepz+lwsZww5d/ZtDzOUY/X5W6GgjD8=;
  b=aHJ9xFqxN2VxETyTlFZB4tZqE5nVrmCkec52/j0ux/Yu7CJ0/VRTPv/u
   J0rXwN+hwk/sL4E1l/y4kM2TNDiOG7jKxsE5bkGIgU8bDL5hlJFm8KPlV
   J8w81/EWFfYuigyrfAOnDu09AkwTFiWismR6/a5KxGtQoL//q0UTleBB3
   aTF+/rPSQv030FZUnDnBgASAjmHhgjz4VEZGS1QR90l1l2hQyQeK5f7bH
   0Cd6pE8ry7fgNXgQLd3mVXBsWi4axOyQqWTZluX5z21kQmWUO4WUwRnOB
   pVxioYX+lQ7i2LFMioDxH4T4K2FzBDB5+f1zy+vdJfo6GAZoCCDHPEpNK
   w==;
X-CSE-ConnectionGUID: /Ad9Jb3cRayKEkfCmcgGxA==
X-CSE-MsgGUID: BqksuqipS9q4qhz9WJJ0Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70844640"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="70844640"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 11:06:55 -0700
X-CSE-ConnectionGUID: BmvX0HlaRc2XoL8nGgwoKw==
X-CSE-MsgGUID: pi3Bmqu9R/uQdbbS5w8PoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="205483222"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 15 Sep 2025 11:06:53 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uyDbH-000000002C1-0Htq;
	Mon, 15 Sep 2025 18:06:51 +0000
Date: Mon, 15 Sep 2025 20:06:25 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-10 47/47]
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: psci (arm,psci-1.0):
 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6',
 'cpu7' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
Message-ID: <202509152008.LmsW7yTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-10
head:   007d7962c6de631f2d44276c7c4404e2e0942476
commit: 4fb40b22e97ecea2d18a0c450c24388909e5b44c [47/47] arm64: dts: qcom: sc7180: Split up TF-A related PSCI configuration
config: arm64-randconfig-2051-20250915 (https://download.01.org/0day-ci/archive/20250915/202509152008.LmsW7yTW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509152008.LmsW7yTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509152008.LmsW7yTW-lkp@intel.com/

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
