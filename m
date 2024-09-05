Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51214F10E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725532858; cv=none; b=BaDIOxVYttjKa3sfJJ0H9AEY6LJdEFUQq2d8yEt/0ZzvjVaMTw93mNGBtQdQKNXxTyOp5RpCP+adkteooQFcAktIDirsl9hCN21t9I3yKKrjameX962HYIYRjrrGTdEhgOkD2iz+27g2qC1/pSeJE9jTtGhIGRusBOQf5aJmszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725532858; c=relaxed/simple;
	bh=jNhHAPUECGSA2lUm7ZVJEYI4bvp4HtD/ihRUoqGvCfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/Z/zUXIgA9NuyrVw2m3CdaEmzteTh3l5+x6MaKaPYlulKQ0wGZ8V0nCCuqeK5G3nrEoCSGwAclDMN5zTvJbDz43VB4U311kDU5H1pxkw+cryMeYC7Nw0YNYtg7+pJuSclF4A3tDFxIR1mNlpowxIc+YxbjrW8bJbQQyuSw/Y+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3aWTJUJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3aWTJUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725532856; x=1757068856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jNhHAPUECGSA2lUm7ZVJEYI4bvp4HtD/ihRUoqGvCfY=;
  b=J3aWTJUJACKUoSSRB7w8q5wSbNNkbJfisagVl0dxhKkApqUSP1gJIbKr
   AUtuUH5hi2Vje/HUjN/jqkDVZ4JCGOktfQ//IbKUxT6c3zfyINBYTPV+r
   1D0wFTDOkKn60fLR2JbtegEAqQrQNUSIzFuROgM8x6JL1tKRzEfBaT72U
   kwDkeXkzXtPd4KQvXraX4Vgnoi/x1VyyvYMGXHlSBbtYVyrtdEL5q90So
   Xl9e6hg/UQQ7fPJuCstUi8UEWaspwoPDVKMsA5jD31NqQggjC+9funZle
   DqSxI3r3PmSIb0nC0VH5wCf4p+3YYz3jnICF+prTbK9m3VSxY+YhlaowT
   w==;
X-CSE-ConnectionGUID: q9RAfH+dS5KpDxs83n292A==
X-CSE-MsgGUID: Y7PTX+/xQMCsZi0JdA7H+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="46770624"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="46770624"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 03:40:55 -0700
X-CSE-ConnectionGUID: vn427pWYRlOsamjeQ9pgYA==
X-CSE-MsgGUID: Qss9BdqPS9STeSDzTJ5egA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="69724183"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Sep 2024 03:40:54 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm9v2-0009gB-0P;
	Thu, 05 Sep 2024 10:40:52 +0000
Date: Thu, 5 Sep 2024 18:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 8405/9291]
 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb:
 clock-controller@30e20000: '#reset-cells' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202409051804.ODbU8pIu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fdadd93817f124fd0ea6ef251d4a1068b7feceba
commit: 7c68a3bf350f6f94803ddf02684440abef1baa02 [8405/9291] arm64: dts: imx8mp-var-som-symphony: Add Variscite Symphony board and VAR-SOM-MX8MP SoM
config: arm64-randconfig-053-20240904 (https://download.01.org/0day-ci/archive/20240905/202409051804.ODbU8pIu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051804.ODbU8pIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051804.ODbU8pIu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx8mp' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: /: failed to match any schema with compatible: ['variscite,var-som-mx8mp-symphony', 'variscite,var-som-mx8mp', 'fsl,imx8mp']
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: /: failed to match any schema with compatible: ['variscite,var-som-mx8mp-symphony', 'variscite,var-som-mx8mp', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
