Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDAD86323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 00:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749516280; cv=none; b=sLjGUMrxi6ROo/lkFKgCL6/C9+KeORRy6feIjnrtvlErTIyj1FMWbN4/92/2UAYTQKwDmN9NQK9s7lbWf9Hql2kFcE4t8pGdu+7uwewesHiIqFe51vffd140b4oRG4S+1LyXjAZ7xAdchlKaF74a7sm8+RLkSEeomf1D6xqx1JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749516280; c=relaxed/simple;
	bh=L9YMrHHG/2gARt5onWv1czBBcQaL+NIxAfB+OQwDj/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AEUTpr6T+p8EulHm/SusvmO5FOg5wixUCNpWwkUsCtRSIsfsn8BbiQLM2SmsiTOQilSQbkEsICcr5OedcPduvwOlqknTIL38SAHygI/5ACu03v3/SsvFDOWcTo8rwdn6HdzWJjf9AfQ4vo+49OA6LuJ+s9CZMW9QrG+N6hrXbPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBiKLLnq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBiKLLnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749516278; x=1781052278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L9YMrHHG/2gARt5onWv1czBBcQaL+NIxAfB+OQwDj/E=;
  b=TBiKLLnqqMJ/QDO//uXw38anbMgzH9f4uRC7x0HhMwLmoH3pvXOOBMRz
   h1B0t1cJ644HaTuNoW1LTgNcWky8inEqvxDdnj5zmR3E9FJRjtIJ1smJm
   eXd5nMcvVbW+eyGvTYUXFcDMbsy6k87F8opc92qdJF51B8tls4E2DE34k
   vTLaRB0j0QFc+g0sVmSpc9N8QVJ9B+9OeJyxbNkq7odyzVSGGnNAV1iLk
   vWuv4pv7yzCLKa6+hIUPu3QKH+VwaMohLbeZeALD0sb9poURpbueHH8nN
   AymDcgMaGGMF69muot0sn+Do69pX4DE64HP1RvbI9nXKQDsccXy7mXAyC
   g==;
X-CSE-ConnectionGUID: c7S2WsPASe6AicIn38WZoQ==
X-CSE-MsgGUID: 9AvOwALwQem8PNd91b62Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="61878661"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="61878661"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 17:44:38 -0700
X-CSE-ConnectionGUID: vSZNKxzDRlK9+T0A+j0ErA==
X-CSE-MsgGUID: wam56ydvQlWlVgGD2o6lPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151475826"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2025 17:44:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOn6Q-0007an-1L;
	Tue, 10 Jun 2025 00:44:34 +0000
Date: Tue, 10 Jun 2025 08:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 30/32]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000
 (mediatek,mt7988-eth): interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4],
 [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
Message-ID: <202506100825.bAErawts-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   c421f8c367dab8230d8a4762806f36a2b8b974d3
commit: 8475f0ae74cfa98b29089ab623a0ea6cc3f8eed7 [30/32] arm64: dts: mediatek: mt7988: add interrupts for RSS
config: arm64-randconfig-051-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100825.bAErawts-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100825.bAErawts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100825.bAErawts-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:667.24-688.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:697.26-719.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:667.24-688.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:697.26-719.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000 (mediatek,mt7988-eth): interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:667.24-688.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:697.26-719.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:667.24-688.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:697.26-719.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet@15100000 (mediatek,mt7988-eth): interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
