Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BBC2343C0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748683016; cv=none; b=MmDeO+FAIvdpmUSHJ0xjL33OUZjkMZc3VtF4sB1j/1U4sj9pzQeYc9U6rGhb7IxBkt4s9nrYz1uoZGLg/oN8z/j2o7guXBo2C4B8QryBXQXr0nOMetUpD6tRRagOav6FuRaEePFOvJqIE6sW0r+yFeOQpxvpidnVkpqOTOjag48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748683016; c=relaxed/simple;
	bh=B/Oh3sK/jG1Q/L2be3FKW+yuj3MjvpE7Ysm4utDrxFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzeltxekk9mdM64L1NGDIGm0+J5EjIGD6FI/d8iFJCmOjJY49vAV1TZEHpKa88cQP0i/bqiIQk8drhRg9nhIwE2lhsqUISic8Ojg22EFzGapjoTzWzu2Q2ZF415VUoj2i0Ud8aGN5Ja6fQ5pR9p6RNmGGOpLwyMCML8aqBYev1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9xE10IV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9xE10IV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748683015; x=1780219015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B/Oh3sK/jG1Q/L2be3FKW+yuj3MjvpE7Ysm4utDrxFU=;
  b=P9xE10IVdExZOkjKwskR5ZvZLLrwLC+SBmiHfxXeRltmEY6hMlZFrKyr
   l+WayBiF/izjpAax6XkGT7x658lFc+AYMR5QryB6sbLP+oku/KYVxpNhT
   OO04d5MqYcqtvi0u/FDPmHHxtXi1gVLzDO1glqrP3pyLGFLrIn57yS+7U
   OsNyZv+PuQ5CzrjmMmxpi9y9dfMQra2hwYg7k0CrGLQ8oryU4wK7es7MR
   zuGqkZSc8tA6DSoJi0y6D1ExIiF/0s3aCbmssGjuMRBxAKt9IU6h7hf21
   l6mBil5+yMcZwp9WUVFIFUT0iw+ypV0GbY6ef2enXEnKUCRjYpI/qWXP8
   Q==;
X-CSE-ConnectionGUID: 1ler1I26RW21mLu2+iISEg==
X-CSE-MsgGUID: 8+C1xY3eSGGFClKnyVRiRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61821001"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="61821001"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 02:16:54 -0700
X-CSE-ConnectionGUID: iOs/ZfIbSHWNLEwCRa3Q/A==
X-CSE-MsgGUID: DCqayTk1SMaAZ2EFb2P9sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144071532"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2025 02:16:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLIKg-000YJQ-21;
	Sat, 31 May 2025 09:16:50 +0000
Date: Sat, 31 May 2025 17:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a2f8800
 (qcom,x1e80100-dwc3): interrupt-names: ['pwr_event', 'dp_hs_phy_irq',
 'dm_hs_phy_irq'] is too short
Message-ID: <202505311725.eKtrGf57-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: f5b788d0e8cdaac7df6ec9a24926672965d87dfc [2/2] arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250531/202505311725.eKtrGf57-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311725.eKtrGf57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311725.eKtrGf57-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4146.11-4156.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a2f8800 (qcom,x1e80100-dwc3): interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
