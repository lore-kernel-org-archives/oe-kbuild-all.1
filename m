Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6441CB517
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 16:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727799991; cv=none; b=t6Kuk51PRjdbrhgK87F9sSv+z4dqPBJW3EeVWZXA37oUckNvH+jXJBGiJsQHJNVtJK1FP/TjNwnZTAZFEpgy5lYIHMBFycrg2aj6OODBhe6MCwQCPOwvY8czzvF0arbk4mmGtFSIu02L7PnDmRN4vMUkyn0J+OgAQ31g6on3G6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727799991; c=relaxed/simple;
	bh=Avt+APGX6ahmCmGZwvnQjniDfleo01sEgjJKZuYVB5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+cNMZ7xkcR8oFNM60i4S9Z3n3g57JSC335jOjiXpGBYZIjMwB9NY9JaTaefdgs/QxSZgo1RnM6KJ1dNiCnU19Q2NsQxRS+NDGRhO4rsZczN/6JAGq4VaQw5HYIctwT2a77Z+UxPHz9GKg0vze3KFt6ajYd6D1DELj6mJKLZ7QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuEZ0Vvw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuEZ0Vvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727799989; x=1759335989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Avt+APGX6ahmCmGZwvnQjniDfleo01sEgjJKZuYVB5I=;
  b=JuEZ0Vvw/vcflDBetqcRkyEQeL1mhwnKaD2qV7ibw1H3IKNx468fEcDY
   +LwPFuHda9x8JymTXsHkIbGeFV8bRSnGRLW+uYEjZgu6EL/5NVMZOYDiQ
   FhRkzRtuFm5xcPsN/4OWY7VbhPudUPjlHhVAOMaYeJExGpTu+rqMf4LtI
   ZO8ozTBhuNVWEvlauO2nFZDY+p+49aKDAXZt1EjRpwZSlHddWRvMc+mit
   V5jtESYmkB6R8wQKBqTzzY/Fsu2eMxHnZDsS2YJYpl5EVEh8woX3C+d2p
   Z+7OzcZSjgmqDMQQDuzBSdLdtI1YoSeBXEF0rHe/rRVemjfrteRMyWorq
   A==;
X-CSE-ConnectionGUID: ZowphdDYSZm+pCdzV0z2mQ==
X-CSE-MsgGUID: +M/IVMYiQEqvRL4glz7lBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30832475"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="30832475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 09:26:26 -0700
X-CSE-ConnectionGUID: hwrFJeGZQRCSScXXMzQ23w==
X-CSE-MsgGUID: hXWJB3vsRP+RqD/vk3HNbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="78135504"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Oct 2024 09:26:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svfhf-000Qsx-1L;
	Tue, 01 Oct 2024 16:26:23 +0000
Date: Wed, 2 Oct 2024 00:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 969/1347]
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb:
 /i2c@ff110000/rt5651@1a: failed to match any schema with compatible:
 ['realtek,rt5651']
Message-ID: <202410020004.4imQt5MT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   77df9e4bb2224d8ffbddec04c333a9d7965dad6c
commit: 577b5761679da90e691acc939ebbe7879fff5f31 [969/1347] arm64: dts: rockchip: Fix rt5651 compatible value on rk3399-sapphire-excavator
config: arm64-randconfig-051-20241001 (https://download.01.org/0day-ci/archive/20241002/202410020004.4imQt5MT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020004.4imQt5MT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020004.4imQt5MT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /i2c@ff110000/rt5651@1a: failed to match any schema with compatible: ['realtek,rt5651']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
