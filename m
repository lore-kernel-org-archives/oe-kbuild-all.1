Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4280E2232B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 05:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718168791; cv=none; b=TILkR9ZZ7sQjlp3bgV9aA6wMcSmlNc4HRXIYHqmhGDwbVOywAxuPGkDk9m12aJQ0TEaqU6tTHPu/1diCyNEQ5Inah2fkncBYUUcur4KOniqm1ixBEWP/FtXbvWQFqK+3MJRm1FE2btNKrtjYPfzEGZ0YTdiqoqZKhNA27qY4IXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718168791; c=relaxed/simple;
	bh=5iutTXJsqaCV6OijvCyu1p3AAmLSU1v0ueyJoR00k5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RBNAQPlv5kIxSycKVDvuD5DpBj0jB8s3WPCRA9W+og0BkjJZd9ohZkeEt0tqPmPD4m5fKzw+aWA7Q9owPMEjwmZL8VmKiGxEz06EYFnFv+h6bIIwbzxj4Eoj0t9sfFzw02Vpil0gepdupO1v7t4eyYK4I032ofuA3PwBMksUB8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yno0vJLx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yno0vJLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718168789; x=1749704789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5iutTXJsqaCV6OijvCyu1p3AAmLSU1v0ueyJoR00k5M=;
  b=Yno0vJLximDsOXSgYZ/5JKFje7w3uCCqN8EuRA2As1EMSqYuNPSIZ4yJ
   bjzB07n+CMQtkr+A0KnKknPTXrk4WKphty2ARLNP5Fvxj4zWitqpH2Lof
   n9GKeF2AMsKAl+1JjjrBSgaKEXuz6yUoGMNuawLpuH6vT9UHN0Xp+E6uZ
   xUCpIRNl4kGHsMQGQJp0bh0m+AD/5OqAublVeu4VulCSmni0rtPEEgszt
   UAwvIw3YESSVrR3SbGBqMsW67TU/z3BLXmLg34detPCrKDCMcw7jiK8QO
   /IqjOf/UEU1IDo8JO/oqHt+xfFqduAKTbnenKJcSe1IEYhBeD8i3AzaTz
   Q==;
X-CSE-ConnectionGUID: fYVpYYV7RGeTho3BTXgJeA==
X-CSE-MsgGUID: fkcHL7pXTGeS0CvuPmab+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37437530"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="37437530"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 22:06:29 -0700
X-CSE-ConnectionGUID: 9pPSAPMRQPC3jvnl6/dgLg==
X-CSE-MsgGUID: zayvLyoARei0Xgp5JdbIug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="44607817"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2024 22:06:28 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHGBl-0001Do-1x;
	Wed, 12 Jun 2024 05:06:25 +0000
Date: Wed, 12 Jun 2024 13:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/gpio-logic-analyzer-v9 3/4]
 arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: /i2c2-analyzer: failed
 to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
Message-ID: <202406121328.2Mbsd0Q0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/gpio-logic-analyzer-v9
head:   77ae406bb0cebaebeab8fee25fb7632935887193
commit: 0729f12c12d834df970d2bf777eadc96d65ad25a [3/4] dts: salvator: add GPIO-LA to I2C2 (snooping)
config: arm64-randconfig-051-20240612 (https://download.01.org/0day-ci/archive/20240612/202406121328.2Mbsd0Q0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121328.2Mbsd0Q0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121328.2Mbsd0Q0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
--
   arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
--
   arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
--
   arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
--
   arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
