Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445C249E5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741204911; cv=none; b=Wb73kSfQ4QX3zxuNzvewn4o/w4ODYtOWhpGXbwgB34Uchc9WXacpxsrxITu0KgVKnxLwEUfyrb4V01/jhLMmX9UN4GNrBmD7yjh6ujOJ57s/rFR3A00k3bKzik0KJGsMRA/nGYixymzdqUdA9nUTZRFdUTeseYs0z5YVg+Pgxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741204911; c=relaxed/simple;
	bh=2Djra09Y78SVo/lDmRaaz6izjXctyTzyUOBWixXqnYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdEgKVybqFa9FBbTWN8g+GL5kHz/Ef/JmRgh+MSjvVlnQaP5ELGWeGfFMWpPvBSC8RMjkSpiLX7gfBWnUBJ5qfdsn1bcj8j0WdYVrdJ13+Vmo6QFepfK5b7XwkowAOpM//wAz87+BD6Z8IGLU0fvjp77yskQcp4c0cTHYphEa6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2CqRkGV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2CqRkGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741204910; x=1772740910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Djra09Y78SVo/lDmRaaz6izjXctyTzyUOBWixXqnYU=;
  b=V2CqRkGVTR8rmgxrYkaEYz7X5OxRXHhP5EybbJ/GbrjjW+woECTYWHyG
   1n5U9uf4CYpPoZmt+aZGy31B6Y58GD1qVtwXzKq/dDOfk7J7dvKUdq2I/
   XFmqrTXy7hC0bW8qTMHEInd4KTgH2u70doBNIlkC1vA6wouKRHRQ8bTSt
   JpbUUR6YQ5GlrzxeXHEhN/+fbS5wJ5mGNV1TggnwiSAchkiFJfjb59mRE
   j260hFg56eZIMSG4+Jv2Imtw9WmIQECpBNay/+vlLpxoLWKd8afv6vwWw
   HUlCtLA5TobiE0C4Jg4yG75hxnajruIy6pOQgB8n1aWBXx7sx6kRonkAC
   g==;
X-CSE-ConnectionGUID: UEb2IO69Se2ZdPWLsxrwsA==
X-CSE-MsgGUID: TB1uKa3ASrGP8x/3ngdcbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42387148"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="42387148"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 12:01:49 -0800
X-CSE-ConnectionGUID: iVWoQAI7Tr+1iW4AorwQZg==
X-CSE-MsgGUID: zjYYmjYwQQG6OvB2p5iKjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="142026329"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2025 12:01:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpuw6-000M9A-0i;
	Wed, 05 Mar 2025 20:01:46 +0000
Date: Thu, 6 Mar 2025 04:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [linux-next:master 6885/8790]
 arch/arm64/boot/dts/ti/k3-j742s2-evm-pcie-ntb.dtb: /epf-bus: failed to match
 any schema with compatible: ['pci-epf-bus']
Message-ID: <202503060638.Zf6O7X2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7ec162622e66a4ff886f8f28712ea1b13069e1aa
commit: e313a45b472cbf08cf26aaec5dc1f0adbb0edbd4 [6885/8790] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay for PCIe NTB
config: arm64-randconfig-051-20250304 (https://download.01.org/0day-ci/archive/20250306/202503060638.Zf6O7X2B-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060638.Zf6O7X2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060638.Zf6O7X2B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j742s2-evm-pcie-ntb.dtb: /epf-bus: failed to match any schema with compatible: ['pci-epf-bus']
>> arch/arm64/boot/dts/ti/k3-j742s2-evm-pcie-ntb.dtb: /epf-bus/ntb: failed to match any schema with compatible: ['pci-epf-ntb']
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie-ntb.dtb: /epf-bus: failed to match any schema with compatible: ['pci-epf-bus']
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie-ntb.dtb: /epf-bus/ntb: failed to match any schema with compatible: ['pci-epf-ntb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
