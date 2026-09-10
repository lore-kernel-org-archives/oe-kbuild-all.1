Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32833CC7CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057416; cv=none; b=avv7N0pKt1oZEip1GfKXeciK2du94tAvZ5N6hcWqM6+9widTGJ+JO18X15xO8oOpAW86Je2Jk2Goo8zuKs1EHWpAURBUKAHdo64reUBh6l42D6fPNU+vUivyrtTw9iGgBGlmjNqDpLt0mEzRlvBcViip2qS3LlkpehKMFMI0xjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057416; c=relaxed/simple;
	bh=QjYupMId281bLHy6usghOHBC4n0P7mYSK4jT8lihon0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XEkXDlsms9kuCUOSI45yTeXVuRXygqovMfplfDawGBkLfzTcJw71BgIkEnq6q6kNtHTs1hQrqFiSGxnC5zJvBZtX9Di0k21d+ggufGcQX/FARTppeRlo8hN4//t9RDy4QWptRUKDS7Tu3mbmHsMmaUM060zyRJSd1f/KQzeBzwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvKDF7WA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvKDF7WA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789057414; x=1820593414;
  h=date:from:to:cc:subject:message-id;
  bh=QjYupMId281bLHy6usghOHBC4n0P7mYSK4jT8lihon0=;
  b=dvKDF7WA8wIlpaSa7LFdV9w4T7iv6SELV5TSFSOxrfBxlsv3E3HC61/W
   I+8WmQjf/NsiqUOcXsOiig7SXtPdw5emGeckJdtues5vmL9puzU0hJt6S
   Eco4fMO1Bk9Uw/nxpqh3Ui2mEiyBhMjQXKxTuBoNLVTPAoWU1JkArnwYm
   19guJNrAB7kR6OAGGpgdQ9cYxgFqSB9YMNp5yQqM5WhCTSGLORi3JvDPt
   HW2PD83dsbasvnWITxZ3F6eesa/SLaDlUWPsknzFpB6wt9cqFN1eiVwNY
   uU68peT63jliZci3YwUM9keYfAg9BoZGNIVXJ0JyW6RPzKAbSqIUzSeF+
   A==;
X-CSE-ConnectionGUID: QHeWWg8fTeSjWR5cyGUWtQ==
X-CSE-MsgGUID: H+T87ofGRpuiZ21LtJTNHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100105401"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100105401"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 09:23:34 -0700
X-CSE-ConnectionGUID: mfhY+LorRGCwNtEBiGPbtQ==
X-CSE-MsgGUID: 8QoyeXRpR+iO7zQMkYNdpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="47017"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 10 Sep 2026 09:23:33 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4hYg-000000000SN-2d3s;
	Thu, 10 Sep 2026 16:23:30 +0000
Date: Thu, 10 Sep 2026 18:23:30 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-wireless-next-main 32/32]
 arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: am35x_otg_hs@0
 (ti,omap3-musb): $nodename:0: 'am35x_otg_hs@0' does not match '^usb(@.*)?'
Message-ID: <202609101851.WU5XzlC6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-wireless-next-main
head:   13e51269b6656768dc595ed6025e4974f2026543
commit: 0b5bde9e1c4df3bbf93a01a0e00c05085f3449fd [32/32] dt-bindings: usb: ti,omap4-musb: Drop duplicate 'usb-phy' property constraints
config: arm-randconfig-2054-20260908 (https://download.01.org/0day-ci/archive/20260910/202609101851.WU5XzlC6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101851.WU5XzlC6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b5bde9e1c4d ("dt-bindings: usb: ti,omap4-musb: Drop duplicate 'usb-phy' property constraints")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101851.WU5XzlC6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: target-module@480ab000 (ti,sysc-omap2): 'clocks' is a dependency of 'clock-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: am35x_otg_hs@0 (ti,omap3-musb): $nodename:0: 'am35x_otg_hs@0' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/ti,omap4-musb.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/ethernet@5c000000: failed to match any schema with compatible: ['ti,am3517-emac']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-reg-offset: b'\x00\x01\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-mod-reg-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-ram-offset: b'\x00\x02\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-ram-size: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
