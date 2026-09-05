Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A3309F09
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 00:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569107; cv=none; b=klPi4Du9cklu3L7PsXbl/J0Gumb5JtGQ0NpXsDKrO3/Y94t7EstXJE7/pTFHClC77L8jmGMHkL49/JMGdXn1ukIzAQPRzDzrCBSR+aC7lHWR1HvMHio9gVy6X6990UwvEXsAjDxfRt5LntgiXSUKaaACB8NLTJJQ/vbkC+E+zGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569107; c=relaxed/simple;
	bh=jBx/YBl8hZK7JFYSArVphcViwseQ02bb0eKnsCmxd2g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZX1dtGr63jCgB2jbWuaXXF3YHu+QJmMx2sH7VX6eIisU2x/gu+D+DcLJxR8y6y1s2Buq63Qdjl7WzbpxGS80eIfOk9nL3cuYLNkARw4WDqaKo97Cdm2Q68FzKGc4Mr/BB+JtrNbFL60EfAirJEstb8FkWE70vp3AO55jV3h2cGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTPE3d3c; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTPE3d3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788569105; x=1820105105;
  h=date:from:to:cc:subject:message-id;
  bh=jBx/YBl8hZK7JFYSArVphcViwseQ02bb0eKnsCmxd2g=;
  b=YTPE3d3c0fxFURQ/KLx/PWsHImdfVqrKvjmhKX3DKe8y5//aEq8rI106
   tVn+rU35n2Pq6rMBzVJTf74MZKWdOL/0+mSSArFHfFIwN+L6ZVagm1wqU
   ytZmkS3pa7A9EpZK/vGX/bjUCFj0si/8Ot4pp9gN3IhE38Et5KK/8KxN/
   ES7RP1p1zjGSup6jvKuj7SwHd2F5Eetpj9F8ttNRVge5+x3hF764DKBdv
   pcZnaFyxgWkWNcR3gtApgma0/ocbLtM++3S0whMJkJYOZSg1Dhgb69Ugw
   nB5P3pDcUknMelciK9U8StQGm9Ufwitd9UpSdOFDyKZxx5O5hwMLOI8Eu
   Q==;
X-CSE-ConnectionGUID: cQkOz/7xQViRjG4IacIQsw==
X-CSE-MsgGUID: Rcyq4h5AQEiwCcfGLZvUlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="114617590"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="114617590"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 17:45:05 -0700
X-CSE-ConnectionGUID: rtx/m74vTdWzNCYfiC6rlQ==
X-CSE-MsgGUID: UVRZb3jlSiG3UN1fVjpIgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="267606360"
Received: from igk-lkp-server01.igk.intel.com (HELO bcd5fd227bc8) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2026 17:45:03 -0700
Received: from kbuild by bcd5fd227bc8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2eWj-0000000009v-1pQm;
	Sat, 05 Sep 2026 00:45:01 +0000
Date: Sat, 05 Sep 2026 02:44:05 +0200
From: kernel test robot <lkp@intel.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: oe-kbuild-all@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 1181/3131]
 arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00 (fsl,mpc8308-gpio):
 'device_type' does not match any of the regexes: '^.+-hog(-[0-9]+)?$',
 '^pinctrl-[0-9]+$'
Message-ID: <202609050205.0ERnWt2p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
commit: 78c0baf85cd0ab61939b6d4670158d5c53dada69 [1181/3131] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes
config: powerpc-randconfig-2051-20260902 (https://download.01.org/0day-ci/archive/20260905/202609050205.0ERnWt2p-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050205.0ERnWt2p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050205.0ERnWt2p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/mpc8308rdb.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/mpc8308rdb.dtb: usb@23000 (fsl-usb2-dr): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/mpc8308rdb.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/mpc8308rdb.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00 (fsl,mpc8308-gpio): 'device_type' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/dma@2c000: failed to match any schema with compatible: ['fsl,mpc8308-dma']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
