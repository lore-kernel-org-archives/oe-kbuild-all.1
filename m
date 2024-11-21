Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38FE2AD00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732203623; cv=none; b=qJj3jR8bs6T6rV5muy4hxAihlPsv+YyqZ+QG3/BGH5s6fgbPP+ezTdA/RxiN99lGlyAf+Hrg0ZFE7LeB0Tcp8A4Hc8oka6HVv4BW3wqDZmmWU96XTNtRMuqgip1MZ0otgRCRgmFOOjb0HJhnZFMhorJpvlg6VHy68Om0zP2eVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732203623; c=relaxed/simple;
	bh=dUfHyXDbdzGmzbTmbk8DiNd+g1edKKcLIWhcsQfsme0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uM+VFg6EVi5kl2OVh812rzrEXZxVoquG9/9jEE/p7Sl+73zmkz2HFZZz8APz/GLdiRwQr5C3vSp73Q3OMCLVyi448YGvKi9zEgBwiNBKKxcbLI2tnGBDFa2ynjF5ImrILhHEC/6X1yNQoveBIJ/RjAWvGUta/ep1Q7agoLCGPl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqY992uh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqY992uh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732203621; x=1763739621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dUfHyXDbdzGmzbTmbk8DiNd+g1edKKcLIWhcsQfsme0=;
  b=cqY992uhjU3uD7irWmmkDnEdq71mci/+ahUFvfW8C+Kevt05fCjEilF1
   xJ77CvCw5385s9Xj1LMRZkJmt2iFd6ht0Xa3JXRFdmUafI6ogjHw68Ij2
   qsSKkccLUM9D8ZjeuFUXfrkGh4TD89+96xgTMROhCr+qSv88aayEK9m0Y
   1Dg/z7OL+mcukhokbjqfreoP8JUA5sKx9XMMAy6oW5a7IQFysEBi4GEvS
   42L6btqr4P38RnlTi/qIoo2wVMhEAJgebxWyCPf0QAC9Vk69IL+V7e3WK
   F7oT1MpQBC3jRnDbCKkO8Hf/y7MUO32LxZSGlzPsiinw7nF9GLYGbnSPu
   A==;
X-CSE-ConnectionGUID: +Yff0tkDRqmFa4M1QdtzgA==
X-CSE-MsgGUID: uSYWb7j+Si6JpTqeADHitA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="57721055"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="57721055"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 07:40:21 -0800
X-CSE-ConnectionGUID: xVgF7SN/Twe7d8N1PV5djg==
X-CSE-MsgGUID: EgBT8WFVQsaDo+AlhbMelw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="90219234"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2024 07:40:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE9Hx-00037T-2P;
	Thu, 21 Nov 2024 15:40:13 +0000
Date: Thu, 21 Nov 2024 23:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-ea7682dbe6cf 104/520]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb:
 regulators: vrf18: Unevaluated properties are not allowed ('compatible' was
 unexpected)
Message-ID: <202411212311.Q7mHJrLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-ea7682dbe6cf
head:   ac7a77c24fbce62cf3a673f994358d50cb59808a
commit: f99ae53d82d287e60e236395ffa09d77106292fc [104/520] CHROMIUM: arm64: dts: mediatek: mt8186: support early corsola devices
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241121/202411212311.Q7mHJrLx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411212311.Q7mHJrLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411212311.Q7mHJrLx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,elm' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: regulators: vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
