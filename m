Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53A1188CB7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720532974; cv=none; b=FJn9RlkQsNSMwo45BdClHa5faiRQysR9QYYSBH5rPWHYfAYulJSG3T1xIUhYW1PE49LgR+7w5FfgoJesdXLUJ5O8TjdtfB+ujwH6w5s+Ex0j+mxhEAU7Pf/i6J6boUtw4jk3zSqcmLLIRU+fJykZcyzgk6Bgu4wFr1Da6eIS9+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720532974; c=relaxed/simple;
	bh=x285ooidfnRKFlQVDEfLwaTThhb6kQiKq/FXHg/nVrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QeAzCdiKPdDmOXMHKf2ErLhr/MZuMsOdgBYewK+MCmmU5wFsmWjgUyiJlUHix+O0iU/fUlNwldtgIFou5MmlIKOrdNi3zUx9pFJKSjnXV9XF9Fks9Oo/KBQYcNMsK09EluI336vWBT/R6JoJphuokXrfr6maZ3iZXk5mQBzHj/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuexrrGY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuexrrGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720532973; x=1752068973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x285ooidfnRKFlQVDEfLwaTThhb6kQiKq/FXHg/nVrU=;
  b=UuexrrGYoNtiYbpZefqaJx8zlax0Q/iFU92KSpasT+O6sbyiyqcKTOZL
   Bc8+aqByy+YHRcVRwjUgxNS+p0zg34uNTvF83dN51ysHIF4V153SLdslx
   kxvoJahbIIcUrXFi9EiASQZWjcyWU6q+klrW2DJZu6+rECLByt9NEKKlK
   GWPzQ8H1c6R4ZMahPEiX1df8re5RCd/rvcvvjLYvA+GqnAJwGrURtBlhi
   HJ1mOxbjcmQ3qyWtfiu5RcFFyAplNN+E6YlAZHqtXP7wHKCWCtqIu3GF2
   9EsoJvXHyvFCXJHX9FGeeAhvD5NoETcgRlKHbq4jr/mv7TeCSFnq0bH6V
   w==;
X-CSE-ConnectionGUID: GYmRzwUNR0qtIZnBMydSxg==
X-CSE-MsgGUID: 153LUkG5R4y85NSzdT8OiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17607470"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="17607470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 06:49:32 -0700
X-CSE-ConnectionGUID: sez2PpU5T3+l8NO4p+fQ4A==
X-CSE-MsgGUID: P8b4VlA6RXyamnYvSwyWew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="48516617"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2024 06:49:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRBDk-000Wio-11;
	Tue, 09 Jul 2024 13:49:28 +0000
Date: Tue, 9 Jul 2024 21:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [linux-next:master 11228/11980]
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: smsm: 'anyOf' conditional
 failed, one must be fixed:
Message-ID: <202407092131.SBGStBhZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82d01fe6ee52086035b201cfa1410a3b04384257
commit: 0655b447461607f93c55435b32a7783aa7d711ef [11228/11980] arm64: dts: qcom: msm8916-lg-m216: Add initial device tree
config: arm64-randconfig-051-20240707 (https://download.01.org/0day-ci/archive/20240709/202407092131.SBGStBhZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092131.SBGStBhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407092131.SBGStBhZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: smsm: 'anyOf' conditional failed, one must be fixed:
   	'qcom,ipc-1' is a required property
   	'qcom,ipc-2' is a required property
   	'qcom,ipc-3' is a required property
   	'qcom,ipc-4' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smsm.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: smsm: 'mboxes' does not match any of the regexes: '@[0-9a-f]$', '^qcom,ipc-[1-4]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smsm.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/audio-codec@771c000: failed to match any schema with compatible: ['qcom,msm8916-wcd-digital-codec']
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/i2c@78b9000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
