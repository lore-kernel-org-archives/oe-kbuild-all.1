Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD4D388E6B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 03:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790394318; cv=none; b=Lz09RH/+wGbiWzI09enuJ+09kSe3gexo5d7aSD7sk+pvQzn3N130us4cJI+ucqvOnxljr+7peZvNbk8b6Tuzof9IroE9OZDRPR5jmrlT2PquP0NPqTiCAdLCC63w7umsVVtancymCZ/swwQ2kDgI9aNrgdRb9v6xdRb+b3/sgqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790394318; c=relaxed/simple;
	bh=OFFvPAsiUUK+QmLGFaGPWeACvA/QKfaQJc03b7aja2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U2GxJGssjd7uqnqE/tWJMB2wKLESkdcRXR3epCJYCwbJkTANSvrbTaBr7IjEIi6pk416hUVqAJzcq+iNX650ACR+1EgbOdyHarDFTSw50SSDS8RWYTbc5dv+KpwIG7RyRHjNkJnEFeYlGVMjuDoCRFLUsmoEH9cOetPHT1w9OF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jANBr6m2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jANBr6m2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790394314; x=1821930314;
  h=date:from:to:cc:subject:message-id;
  bh=OFFvPAsiUUK+QmLGFaGPWeACvA/QKfaQJc03b7aja2s=;
  b=jANBr6m2KddTKSDuxBd8RlyIWzeEA4I6jX+xw00ZIstQVD4nk0WAqCLn
   1v6qDKOC/x6qf5BOu/y1Af05fXmh+9EllcrgI9zEBPQ2H7iAIN724dEbz
   QwvVNL0sB7hhrghr/+RRLrmC7L5fPYJ3dS6cNtLTBwlvJtkk7E0mvK4h5
   7yiBSSozbCkQxfvn6J7sacO6FPjglbMWfuLoZGeDxQ9qWrTCtXXVf5g9g
   mEqeU5C4CGEy+FRcPWnIs/DoN2JhjTYXV9tIRQVec6acb9f9ptsrbDCLj
   sTeBS4yoUhz/XN8+g2dQuuGd58h1mlVGXjxP1+fuvLbQIZrjJUaFG6Ykp
   g==;
X-CSE-ConnectionGUID: lfN3XpqZTw+Rs6AutnU2CA==
X-CSE-MsgGUID: JcGxVg7YS06FxA7PB0/IsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102545238"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="102545238"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 20:45:13 -0700
X-CSE-ConnectionGUID: EI69kiajSTuyEbKQfZHIBg==
X-CSE-MsgGUID: T8jHcY43Q9O7PrparjaKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="277864748"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Sep 2026 20:45:11 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAJLZ-000000000CP-2jVX;
	Sat, 26 Sep 2026 03:45:09 +0000
Date: Sat, 26 Sep 2026 05:44:54 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6897/10910]
 arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80123000
 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
Message-ID: <202609260522.xdtJrXSZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: cc47a544d4f7e4d5603af2e0d5c18fbdac5fe257 [6897/10910] ASoC: dt-bindings: sound: Prepare Ux500 audio graph links
config: arm-randconfig-2404-20260923 (https://download.01.org/0day-ci/archive/20260926/202609260522.xdtJrXSZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260522.xdtJrXSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260522.xdtJrXSZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x8e\x00\x00\x00\x8f' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x90' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x86\x00\x00\x00\x87' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x88' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-snowball.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x82\x00\x00\x00\x83' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x84' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x8f\x00\x00\x00\x90' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x91' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x8f\x00\x00\x00\x90' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x91' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
