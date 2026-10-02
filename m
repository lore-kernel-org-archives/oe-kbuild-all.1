Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC609209F43
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 04:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914673; cv=none; b=AVlXvX0nAe+zAIq3FSf/KSiS0zhUgVsduwgPRt/7fjCkitrpQaoThRmkfXrH+yrtxnQZ8U1j4/lDKRpSdeFjp7bG38MiVJRTITWeaK/rJSDrkvRDToTS5qaIOI4qfhbL1bxigUKWR3yUwkDmfT3y7zeL7XR8PMPbjBjvaa4JdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914673; c=relaxed/simple;
	bh=vnFYv77cWNSDsh1K4Wz99VuCNhaaJH7hoMtGwdvgCrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o63pM3Hv6PtZhSRH9cNiegYS2aeFylw0v+c7aH3jVIn1XHDMhU5g/QpcPjPiDNeNBVZlg9HgvgQIHENWSP2jXQ5nVzsg8/9y9NnSC51w/EzytBN134U1KxVjdD+wZYQ56CJmWxwlZ6p9SQ2rsUtDoOG5btC2llXptxjwwTnZHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqasS4H3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqasS4H3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790914671; x=1822450671;
  h=date:from:to:cc:subject:message-id;
  bh=vnFYv77cWNSDsh1K4Wz99VuCNhaaJH7hoMtGwdvgCrI=;
  b=fqasS4H3QSmWa9/sxlgjC5U2eKNjuCn68lc7lNImLnrkMXITP2+dTYFL
   k9ANSMZwtJBbEeTEvQJLwQtJaIiS8xmsynzuOEtDs4igrxzouUJvuceWH
   j7tikW5GCx57lE2yxRf9hwkkvg/k5xqIYJABfMqORqz5xOVPJXyC1YqJT
   VwG+7N6AyQ2wbNgqN3/AuAyNGuVcH/dia4HCakBOmLpRnMJ/bsYYXLPaL
   t/dJrkOo80KDKMWhhYxPhN9JNyjzX2dXlu8KlDoot1Sp/7o3AlZa5zrz7
   yb3vlnktiPxWh1HXAJoxus81qMAUW/WXrPWOjStSr07Wswc7mFsgCqWqX
   Q==;
X-CSE-ConnectionGUID: PVQV+j0JT7yPgn/5vpQJVg==
X-CSE-MsgGUID: vVTvqyleQtCD9X127wWE9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94167810"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="94167810"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:17:50 -0700
X-CSE-ConnectionGUID: /rY4bhQkRKGillMHFjehgA==
X-CSE-MsgGUID: yaeNzHo3R720azXD1Z43pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="279462403"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 21:17:49 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCUiQ-000000000P7-2Ptm;
	Fri, 02 Oct 2026 04:17:46 +0000
Date: Fri, 02 Oct 2026 06:17:17 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 11523/13246]
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811):
 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202610020609.Ja1CECqV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: f05cb3d259d3fb9f811cb9b14591ab08e9e7a182 [11523/13246] ARM: dts: imx: remove undocument properties of st,stmpe*
config: arm-randconfig-2403-20260930 (https://download.01.org/0day-ci/archive/20261002/202610020609.Ja1CECqV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020609.Ja1CECqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020609.Ja1CECqV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dts:230.7-249.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/ethernet@2188000/mdio: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:936.28-944.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: ethernet-phy (ethernet-phy-ieee802.3-c22): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
