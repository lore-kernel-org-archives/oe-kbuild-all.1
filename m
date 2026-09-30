Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C7BCA6F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 00:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726933; cv=none; b=K0MjG9Eq5469fRABpCWTxmLXQjaVT31iK1Z2rqaZ1+EldkQC/EFFvGTpmtbOVj83BfhPIzFHzCGf44QvJmViBA02qzt399ImNu6iB5+i/SLRu3me4Fss4WSLDaiQe1W1IeKg5nPGI2ZKMsHv3Kv1W+M2M6kKjK0+gPSbaNvDLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726933; c=relaxed/simple;
	bh=v7l6YwMUMbIc9epbsQZuh/cmDBzsu+0Rle2TRhnUQIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CthA3SHJtG1PE+J2DjvI99WX805tCvcex/UZLsZs0kl1GTae5AogNfjSAlpB+vF/T2h4fcpmzsgd4sKOVpp++2T33rseZRYawDENe13XuCxr1gtk9pkkZSU7kt4XN7QIX1raF+xfdlUqBF00FnauuPudi9CfWMnzdgQGFTWus8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uh2D0izV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uh2D0izV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790726929; x=1822262929;
  h=date:from:to:cc:subject:message-id;
  bh=v7l6YwMUMbIc9epbsQZuh/cmDBzsu+0Rle2TRhnUQIk=;
  b=Uh2D0izV9jvQymaxALNfTeOBAiNnuHByP51OqDs8VSPGSokfA+Mtsf4q
   oP2DKe/VgW2ueQQ9xD2vJNXFfyfuDk/Vpv4eO6xFAUt3RALkPkzQUzNPU
   kbunmdcw0AmFrkvSBHXEOj01RTf21rB6cuh9WbSOOhG/LeuI91xDZLM7g
   gkSapXAEs8223X/dSFiuA6NmNrE3LKvsiMF+NopukMtPdg30NnhQrJkHf
   SvdK05N9a3pDgrp5roQ0fZJSmFQo9oQ3V0ibEU6AfGn51DQMlesZJItSG
   2tkIJz4UA1ZNcUmGgAPzVpP8BPPuxpke1iJXseJ1vQSqhWShYLOOxC0Vg
   A==;
X-CSE-ConnectionGUID: Wh0hnJ7yRBqrht+sofIbDw==
X-CSE-MsgGUID: IaghSu4cSsO+viH2s2ba9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102830178"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="102830178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 17:08:32 -0700
X-CSE-ConnectionGUID: vsi7IpFPRBKpPmXHSYS8ig==
X-CSE-MsgGUID: l8NhPDXSSmGNNV6LINUipg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="280276581"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 Sep 2026 17:08:30 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBhs4-000000001df-1osR;
	Wed, 30 Sep 2026 00:08:28 +0000
Date: Wed, 30 Sep 2026 02:08:12 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6660/11456]
 arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80123000
 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
Message-ID: <202609300204.qiXim0dE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6375e61c01e93e35ee7acd336a689ac1fae4b509
commit: cc47a544d4f7e4d5603af2e0d5c18fbdac5fe257 [6660/11456] ASoC: dt-bindings: sound: Prepare Ux500 audio graph links
config: arm-randconfig-2404-20260923 (https://download.01.org/0day-ci/archive/20260930/202609300204.qiXim0dE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300204.qiXim0dE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300204.qiXim0dE-lkp@intel.com/

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
