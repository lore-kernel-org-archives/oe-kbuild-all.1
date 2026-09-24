Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD92F8E88
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 06:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231567; cv=none; b=aAnOiCyxfiRms/ua3CQAQzihnZE2pzOtpFaWKkziztVhpWLDDpnVA2CoCpauFjbC8LprYCjT0J4BT1aarke5MgW4b3Lz5KTmDuqtqMq868AUmGyGnSINJodiSCCloTyUZccGw0zwLjH7U5yRwsZLJ6NZaHaGQtJipO94b1QY+IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231567; c=relaxed/simple;
	bh=XpuA7tymTrcB2vXDJnkm38jRyGFYJZN3n9+HNgap/NE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eBn8Yhs9Go1i5hkNtMTl6/85XpYX6pZTBiAKZbkcHvuXaVMvnNnr2LXt0IBrEyIXfCEKr4UEo7JUG5ffW6LeQHd9SGtKDKsyFpBNcq3r5G1Cgjc4pT6NDgENxqTAm5LkAkRagDg/EPICHC8RTLdRhWeoK5sYdaZX4Eg8FT5L3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4zhNbKG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4zhNbKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790231565; x=1821767565;
  h=date:from:to:cc:subject:message-id;
  bh=XpuA7tymTrcB2vXDJnkm38jRyGFYJZN3n9+HNgap/NE=;
  b=B4zhNbKGD8hPk+tp8c2ZcVvt542TCxI1iXvwF1i2ZnrPUF/4jvQY3fJg
   3unbtb6tolBkiHZZTepb8FcxHeuBXWqU63AGE0vdUFulECyLOGLGubL6f
   fi3oAWWTEwD3LYWE/QaHyQFMeavrDELCX88OxXwmnXFvW/dFXKfqeJHps
   ljG2m/mmOLq43B+N/g/McIhyfQuqfJSWLi+SEpQ62YjFIGs3oHgly/mdG
   mWHF38wA+Nqls0Zhw0vM010Umb95ANIM/ECHjOnEZgY3BUYA/gntQ3TJ8
   kshBFMtqrIZ95IujF/Pw80CDDvg3Fw8xPXZx9gKaSUyVe6p8zLtp31gwe
   Q==;
X-CSE-ConnectionGUID: XYiAmQqcTGWZVJlwJTlqMQ==
X-CSE-MsgGUID: tMOmgcDhTYWmmibu1clrlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89949018"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89949018"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 23:32:44 -0700
X-CSE-ConnectionGUID: 5AZP6js2RSmCubJS5U9MoQ==
X-CSE-MsgGUID: 7/GJ+wPVTJ2njyvHA7ITDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273427919"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2026 23:32:43 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9d0Z-000000000Ek-1XDs;
	Thu, 24 Sep 2026 06:32:39 +0000
Date: Thu, 24 Sep 2026 08:32:07 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6790/9480]
 arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: msp@80123000
 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
Message-ID: <202609240846.YxPsf0hS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: cc47a544d4f7e4d5603af2e0d5c18fbdac5fe257 [6790/9480] ASoC: dt-bindings: sound: Prepare Ux500 audio graph links
config: arm-randconfig-2403-20260923 (https://download.01.org/0day-ci/archive/20260924/202609240846.YxPsf0hS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 4b99afb361a8cfd45fc17aebc637688661e9e472)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240846.YxPsf0hS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240846.YxPsf0hS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x86\x00\x00\x00\x87' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x88' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
