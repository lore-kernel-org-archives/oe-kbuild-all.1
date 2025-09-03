Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939132C15AB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 04:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756873312; cv=none; b=RtIkpzdVfjCNlMAYzblCNTzXfw+xUxbpk6DsPWOhkHl9z/m1mm/kqyVhrHohOoDkWy55DTTbInH7TH8Sl7S+21HeuGmtxkWPmupuzb+g49KkllwcmR0/xPccgFpImFaRmBxoqgzsjyOjWljE7DBO6CK6fn9zLMsukO1MLKjQ0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756873312; c=relaxed/simple;
	bh=1F5AGXdQ6FvgdV84y6KbTy9NKqD5ReWCcVRlIrWWzWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XT2aO/9lw/Y+Ia4axug1XmjBjvRIg1wcxXa+e2+Jmd0crQd9+vocFMETwDMS+QyJmNuH9QvCSUtznVUoNOF+VWUlsDllo2AdFu5Q5eolXbM2wmyvB5EgR+9bRPGnsuDobVzkZDaoq4Y9Z5tTi3dE1Ygpl2IQNE4arAddJdJk64Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJDljzB6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJDljzB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756873311; x=1788409311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1F5AGXdQ6FvgdV84y6KbTy9NKqD5ReWCcVRlIrWWzWo=;
  b=mJDljzB6mJ3FO+Q4TvhDyD8rgAPM9kQXyWDn8TDX4UDKHSM1a6UH3IqZ
   d7mrCA7Lbm0DeGoNAoHD7+6Bu+AcoBSa8tp/a3E2pEB/puxpAfH3VV0pD
   E+hZ4T75tJYxLIhiMzCpNqQbCnJ4BgnZbkAfOPJQQ9frZ9kuzue6dBseR
   gZVMBd3nL16MmorhwsRRhZ9hgdzKMM65QZYAKK5IMOr8VsUnWlNUPlm52
   3+vEgqCDV6YS8rL+7ewyNQDiED6QVskNuNAXUX+vPw59pz34tledy1lx1
   Zqw8dsmkV309d3v79NAD6X61Gr7iuwlxP+CJy0OdAVz3qCTet7XTGajhE
   w==;
X-CSE-ConnectionGUID: SVkn4UCNRyCbgR9gzWreRQ==
X-CSE-MsgGUID: DJ0UY9EaTGCu+5rGhRBSrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="61814563"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="61814563"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 21:21:50 -0700
X-CSE-ConnectionGUID: f6HsngfhS7mo7NiAzrCZfw==
X-CSE-MsgGUID: EAtBRngSSPOm+9zydB/JDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171438674"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2025 21:21:48 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utf0E-0003OF-1A;
	Wed, 03 Sep 2025 04:21:46 +0000
Date: Wed, 3 Sep 2025 06:20:47 +0200
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 2959/5641]
 arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: mmc@ab1000
 (mrvl,pxav3-mmc): pinctrl-names: ['default'] is too short
Message-ID: <202509030625.PBgLIAwG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3db46a82d467bd23d9ebc473d872a865785299d8
commit: 5a22df198bd3f515dfd9ff064a81f41567427dfc [2959/5641] dt-bindings: mmc: sdhci-pxa: add state_uhs pinctrl
config: arm-randconfig-2052-20250902 (https://download.01.org/0day-ci/archive/20250903/202509030625.PBgLIAwG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030625.PBgLIAwG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030625.PBgLIAwG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: /: failed to match any schema with compatible: ['sony,nsz-gs7', 'marvell,berlin2', 'marvell,berlin']
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: /: failed to match any schema with compatible: ['sony,nsz-gs7', 'marvell,berlin2', 'marvell,berlin']
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: /: failed to match any schema with compatible: ['sony,nsz-gs7', 'marvell,berlin2', 'marvell,berlin']
>> arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: mmc@ab1000 (mrvl,pxav3-mmc): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: /soc@f7000000/ethernet@b90000: failed to match any schema with compatible: ['marvell,pxa168-eth']
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: /soc@f7000000/cpu-ctrl@dd0000: failed to match any schema with compatible: ['marvell,berlin-cpu-ctrl']
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: /soc@f7000000/ethernet@e50000: failed to match any schema with compatible: ['marvell,pxa168-eth']
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: chip-control@ea0000 (simple-mfd): compatible: ['simple-mfd', 'syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: /soc@f7000000/chip-control@ea0000/pin-controller: failed to match any schema with compatible: ['marvell,berlin2-soc-pinctrl']
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: system-controller@d000 (simple-mfd): compatible: ['simple-mfd', 'syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/synaptics/berlin2-sony-nsz-gs7.dtb: /soc@f7000000/apb@fc0000/system-controller@d000/pin-controller: failed to match any schema with compatible: ['marvell,berlin2-system-pinctrl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
