Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E3D1DA3D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 22:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754693428; cv=none; b=NZOSzcyefuFSrgUg31014K9Vb29hVnW3yC6g8gq6QHmbVdL9+gkdueMl1Tt1LESIYOf/C3KGkl1inCKfm0uBYjo+DORg6wVqsvtdsfLc9sk6T+jEfmhAzfvCy/SJZQPlhJa923q91uNBjXHQfCsDMjGajZON70tWUezviX4zOyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754693428; c=relaxed/simple;
	bh=IMgeHccFR5OFgshX/EV7sqMgjHq4FsbdTb0K9rdqLd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PyKFWR80OU8yB/nIhd2p+SxB3QKNtaP89xsYYBa1+pgO0eNBeJhjUa02k5wYlVsNoSMO3RvDJgkhfxETHY0+cB+Eedj8b0qbFpzwrel65Nfb40kqfgthRRoJdwcnH6uSq1wt5tCRr1AEq/Bia5KhydCJxd3xZmPDDykhErul158=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7dg0Cyu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7dg0Cyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754693426; x=1786229426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMgeHccFR5OFgshX/EV7sqMgjHq4FsbdTb0K9rdqLd8=;
  b=P7dg0CyuiOJjuCu1Yd39f4AbuSes7GR4zeigY8arQQz4Wcm5bm82Isfq
   cXJr+JVjW5b9SiSzam9k8lYLVMJZ8rAayip/hlK2/O4jbZYeZ6i8nBIyt
   fSsdDVRNNN//apCtzxIBP4Y+kKJuUGbkFvafMuMwQxIkPI2CSaVNaaKOR
   zlSdKynxGKrtkcgFm99OZfAlG9AdXfdIaMTegGNSelVoISbDFsJZLUZmO
   o5vGohFR0zmDmEdqnr6bJdaxsN8Xq9ItORihOpljGIfwLXB353NZKtqNK
   gTn87ve8dOwfDP9tnyEKvLqsIlFiM8FZOd4xYFa7B6oNvfxWsHEgLcLVJ
   A==;
X-CSE-ConnectionGUID: 891Ipa9kQJy6HPTBM4L08w==
X-CSE-MsgGUID: dhfB87rvSOuenJJCF46tIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56970809"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56970809"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 15:50:25 -0700
X-CSE-ConnectionGUID: CODSSb9wQLiRlk7TI5Y8Jg==
X-CSE-MsgGUID: 9R0dXaCBRNaWAsBVTmiBrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169883648"
Received: from unknown (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2025 15:50:25 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukVuo-0002hD-2L;
	Fri, 08 Aug 2025 22:50:22 +0000
Date: Sat, 9 Aug 2025 00:49:40 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425):
 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508090023.gTl8uf0V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c750dc582629811994978507b7055b679be149f0
commit: 92bc4b7810ed97a7fa9d5d461a33a67b9af3d617 [2/2] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
config: arm64-randconfig-2051-20250808 (https://download.01.org/0day-ci/archive/20250809/202508090023.gTl8uf0V-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090023.gTl8uf0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508090023.gTl8uf0V-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
