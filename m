Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2D2B644
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 00:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737161522; cv=none; b=F31KhAGyomYk4hAYPkT0fDzYDVplW79yOL+sfjuvi8E2MayfuYU6UnGaRJOUqKtbM+khBuDvR8prQv4BBIIbR3OxdeTXRGUCKfYStVgub1FiN8JtwBlD5/OoT9wo6I9is5fPY9BYo80Bc0aIAuodxIfONMWtccuaU4L7qCoGLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737161522; c=relaxed/simple;
	bh=eM7Pld+oYvYilFD0ZhY8ek5E6k/qmQYGFtKK/dNoQa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bU6QFrticj3smLYhX9b4In25UHX2FcxlWNQ1apqxUjljwPcYfdiBYpAAAPqWCAEq+mp/Pqkc2mVIjPGg9XwupWpfPmq16iIsDHJ3l/0bhEmRhajfqLcMzD9Y9lBHutYIhpcZdrfL0LQpxngmNnV4WA56LCkM3wURveZ2D7t+BWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjZwMhKG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjZwMhKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737161521; x=1768697521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eM7Pld+oYvYilFD0ZhY8ek5E6k/qmQYGFtKK/dNoQa8=;
  b=UjZwMhKG2J3S/znrgCfTgnqTkzVjRkQCVkAgYxDs7tT8H2qk8hNLStn1
   URyCM0SDk+1UUMKJF37dxwVPA89OLkPcdIsbkycBX2MERA1jYyVbta8r3
   NMxDp7OsqXgPKkTcmIaVxJT5xTviGwjlaHJLBSENVanfCVtRbKmswOhzi
   WqcopWOMfYO9a5kfMhAQ0lbzUl4yvGoi/9VUqLu0xSV1wKcFsbjHh0otB
   t6O+oTXWQYnoPS2QxvxpQDv5OQAcNkhQ+8dv/kBBjHJMvTBD8/iep4qEw
   bpH/Odiq2+YhnR9fK3yL+FGtEjz8oet2OC7vGeBIu1SbZCmQObFtRCQMu
   g==;
X-CSE-ConnectionGUID: aujpTj8ASyuxY2D5U1AHzg==
X-CSE-MsgGUID: JUlNP1LKT1qUsTq1/knFlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37491425"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37491425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 16:51:58 -0800
X-CSE-ConnectionGUID: XXxe76Y7RFSQTcaOCYa0fg==
X-CSE-MsgGUID: dwWD75OkQVi+bI8TaLSmdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="106546395"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2025 16:51:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYx46-000TtJ-31;
	Sat, 18 Jan 2025 00:51:54 +0000
Date: Sat, 18 Jan 2025 08:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 8782/9563]
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000:
 clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
Message-ID: <202501180802.ZsUHuQs5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: 77e4fc917b970ffd74b70b0b2a83608b6ed80fdd [8782/9563] dt-bindings: imx6q-pcie: Add ref clock for i.MX95 PCIe RC
config: arm64-randconfig-052-20250116 (https://download.01.org/0day-ci/archive/20250118/202501180802.ZsUHuQs5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180802.ZsUHuQs5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180802.ZsUHuQs5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
