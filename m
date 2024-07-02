Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2426D63D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719941473; cv=none; b=tCStvoAbbfBOVx42OM59ckZmHhIpNF35JW/B1jZNUn+E9hjMb9dP9b/a59OlIS1eiCkpaiLbAjBjQtfHN+nM/aolV07RyOl7zbcnS3ma06K5qqM7ZGDdKeKtn+HPbzqpOGdTqnrfJTET2iwz+1gS4adgYJIZ4KYr/N2l2oNWVG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719941473; c=relaxed/simple;
	bh=f9M98RRc77TyAaYB3L2Of38uQ5QDLqG2yOXtUMVOGoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ko20eerXZzgPYrf8ctTu11i3ZYar4juFGS8AUhSPQiOOQ4hpW1BfTwde+9VEcWoxg2+Nks86b/rEeQZzFARHuiBRRtgejAzYP4w5BlSoFhuAKRaDFZD3WLviiN3mO3gzqHGYFeeKPLSlyuQo2BRO2FAMpThBMddn4ODtYYFtEo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AI0FgNZx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AI0FgNZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719941472; x=1751477472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f9M98RRc77TyAaYB3L2Of38uQ5QDLqG2yOXtUMVOGoA=;
  b=AI0FgNZx3HlY787bNW42WKx5NlMtFgmkPGtFWfJ64u6AlCqlqCbBYVOK
   IXfgwJlcGsksFYgYS3zIHrYQ2x0A76qr0wRAcUKLAJP3rc+GQb2WPrlxK
   CVDIg1frb8g+Mz0vFeV8PFCEhYZTKYIlsGPjeBSTEaCletAlkTeTb9Fjo
   w6ATbQgAtO+L7CbE0cMrk34geMnSzJUJIaC2mi4ZI+mAtld97Ej6jtHgh
   l/iAn0QGIGyxkuh7yWuMLEJ4R4hOiFd8d7SnTyB+oetV5jDXmV/tLmuEe
   0fTkCbP0T8Hn14Z4ScfESAVUJQzwtEhPhY09Q/askxsrr49/JgIchWiN8
   Q==;
X-CSE-ConnectionGUID: ckELfftlQXWTWuxuLLShuA==
X-CSE-MsgGUID: vdG8Ett6TIuHoYY1w9J6fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16974713"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="16974713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 10:31:11 -0700
X-CSE-ConnectionGUID: RdixuWjFRgC61LPhy1VNvQ==
X-CSE-MsgGUID: /mTlKmyPRia54rOH4W43Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="83530139"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2024 10:31:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOhLQ-000OTE-0a;
	Tue, 02 Jul 2024 17:31:08 +0000
Date: Wed, 3 Jul 2024 01:30:08 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 8728/10049]
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: ethernet-phy@0:
 compatible: ['ethernet-phy-id001c.c916', 'ethernet-phy-ieee802.3-c22'] is
 too long
Message-ID: <202407030109.R57yPLho-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
commit: 8fda53719a596fa2a2880c42b5fa4126fbbbfc3d [8728/10049] dt-bindings: net: realtek,rtl82xx: Document known PHY IDs as compatible strings
config: arm64-randconfig-051-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030109.R57yPLho-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030109.R57yPLho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030109.R57yPLho-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
   	'renesas,rzg2l-sdhi' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: mmc@85020000: clocks: [[3, 1, 26], [3, 1, 28], [3, 1, 27], [3, 1, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: mmc@85020000: clock-names: ['core', 'clkh', 'cd', 'aclk'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: mmc@85020000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c916', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
   arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: pinctrl@b6250000: emmc: 'anyOf' conditional failed, one must be fixed:
   	'ctrl', 'data' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'power-source' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzv2m-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: pinctrl@b6250000: sd0: 'anyOf' conditional failed, one must be fixed:
   	'cd', 'ctrl', 'data' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'power-source' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzv2m-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: pinctrl@b6250000: sd0-uhs: 'anyOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
