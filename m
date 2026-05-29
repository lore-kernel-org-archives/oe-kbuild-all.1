Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95A53B8BD8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780091084; cv=none; b=FgNv1sOvr6JKIfP3a2a2rjv9UEgpaADZTC2xR93F3KWW/1vlqUIFrT4be2JmgW4GhbrVYSzRinB8ufFLU86ta6SJwyPjU6/atEwJs6znquWO+FbfSctd5A9yAGAq0UsfQ4OU6zSJh8kj3LDdREVyHw6YJSilIZAMr6GvCBbndwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780091084; c=relaxed/simple;
	bh=DPwWOLgmxZSkaD3LdGEZaRINKyaiqYuLZqoPZmLsWvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bCPm15JIvS3iYEsO72pBJqTYuicLmU57xjKULT4h9xVKNoBSPT7q6PdgT4Jd+BDxQV3y3EPgWON6jm0aFGVmW+gK/dqI7wOZo2eqKCVP22Stan9ipgMgK2YIVkgEQp6xQ0hSRg02iZyzI7iFPgH8+IZXTm4AIviGTy/9vHKPZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Es2MvzqZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Es2MvzqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780091083; x=1811627083;
  h=date:from:to:cc:subject:message-id;
  bh=DPwWOLgmxZSkaD3LdGEZaRINKyaiqYuLZqoPZmLsWvg=;
  b=Es2MvzqZ7iclMhxz0VIUJn8doJXBy5ul086kuD4/JkoFD00fqpTBw3/I
   G20bZRzFOalZoCDgrwbSp6LFJ/lq4vTW6NAkjTmG80FDr0gh+pp4Hu8EP
   Cm8ra4AJXCNPv2NyJW5w3H18j7Wq6sxLZRDcxL/lcVNdSOshpjQFX82fv
   vLTCpJum7CcHYQuWA/Q1I+e9g+ouTb/hSURYAVAVcmIST+ZDzoOjvBShy
   xaCtUus1q0uInx4+yQZHbcysCoq9P606Y7kYKgA1HWhsG1ep7NHsVhSbG
   lDz818/XUhypP56tR8rtRQU1JhOXN+YMuUWJ63aPa11m8ie8LLz61WEUd
   A==;
X-CSE-ConnectionGUID: /2cX3OlySkaeO2LpYLdlBw==
X-CSE-MsgGUID: 1LucbmTHTpyI3GyHRAGRvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81135918"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="81135918"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 14:44:42 -0700
X-CSE-ConnectionGUID: OGDUrkgAQw2pfwGDgG5A9w==
X-CSE-MsgGUID: xPrd7q0PRRqpmDhtQfHBZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="244794036"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 May 2026 14:44:40 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT50P-000000000wf-1vz6;
	Fri, 29 May 2026 21:44:37 +0000
Date: Fri, 29 May 2026 23:44:00 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Sven Peter <sven@kernel.org>,
 Michael Reeves <michael.reeves077@gmail.com>,
 Joshua Peisach <jpeisach@ubuntu.com>, Neal Gompa <neal@gompa.dev>
Subject: [linux-next:master 7324/9137]
 arch/arm64/boot/dts/apple/t8122-j433.dtb: power-management@2d0700000
 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202605292354.YWmq9NMc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
commit: 1dfa7853353417e720ad3dd6653a6110e897e6cd [7324/9137] arm64: dts: apple: Initial t8122 (M3) device trees
config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260529/202605292354.YWmq9NMc-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605292354.YWmq9NMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605292354.YWmq9NMc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j433.dtb: /soc/i2c@23501c000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t8122-j433.dtb: i2c@235020000 (apple,t8122-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-i2c' was expected
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j433.dtb: /soc/i2c@235020000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t8122-j433.dtb: power-management@2d0700000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j433.dtb: /soc/power-management@2d0700000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/apple/t8122-j433.dtb: power-management@2e4280000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j433.dtb: /soc/power-management@2e4280000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t8122-j433.dtb: watchdog@2e42b0000 (apple,t8122-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-wdt' was expected
   	'apple,t8122-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
   arch/arm64/boot/dts/apple/t8122-j433.dtb: /soc/watchdog@2e42b0000: failed to match any schema with compatible: ['apple,t8122-wdt', 'apple,t8103-wdt']
--
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j434.dtb: /soc/i2c@23501c000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t8122-j434.dtb: i2c@235020000 (apple,t8122-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-i2c' was expected
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j434.dtb: /soc/i2c@235020000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t8122-j434.dtb: power-management@2d0700000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j434.dtb: /soc/power-management@2d0700000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/apple/t8122-j434.dtb: power-management@2e4280000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j434.dtb: /soc/power-management@2e4280000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t8122-j434.dtb: watchdog@2e42b0000 (apple,t8122-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-wdt' was expected
   	'apple,t8122-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
   arch/arm64/boot/dts/apple/t8122-j434.dtb: /soc/watchdog@2e42b0000: failed to match any schema with compatible: ['apple,t8122-wdt', 'apple,t8103-wdt']
--
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j504.dtb: /soc/i2c@23501c000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t8122-j504.dtb: i2c@235020000 (apple,t8122-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-i2c' was expected
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j504.dtb: /soc/i2c@235020000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t8122-j504.dtb: power-management@2d0700000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j504.dtb: /soc/power-management@2d0700000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/apple/t8122-j504.dtb: power-management@2e4280000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j504.dtb: /soc/power-management@2e4280000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t8122-j504.dtb: watchdog@2e42b0000 (apple,t8122-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-wdt' was expected
   	'apple,t8122-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
   arch/arm64/boot/dts/apple/t8122-j504.dtb: /soc/watchdog@2e42b0000: failed to match any schema with compatible: ['apple,t8122-wdt', 'apple,t8103-wdt']
--
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j613.dtb: /soc/i2c@23501c000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t8122-j613.dtb: i2c@235020000 (apple,t8122-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-i2c' was expected
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j613.dtb: /soc/i2c@235020000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t8122-j613.dtb: power-management@2d0700000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j613.dtb: /soc/power-management@2d0700000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/apple/t8122-j613.dtb: power-management@2e4280000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j613.dtb: /soc/power-management@2e4280000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t8122-j613.dtb: watchdog@2e42b0000 (apple,t8122-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-wdt' was expected
   	'apple,t8122-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
   arch/arm64/boot/dts/apple/t8122-j613.dtb: /soc/watchdog@2e42b0000: failed to match any schema with compatible: ['apple,t8122-wdt', 'apple,t8103-wdt']
--
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j615.dtb: /soc/i2c@23501c000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t8122-j615.dtb: i2c@235020000 (apple,t8122-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-i2c' was expected
   	'apple,t8122-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t8122-j615.dtb: /soc/i2c@235020000: failed to match any schema with compatible: ['apple,t8122-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t8122-j615.dtb: power-management@2d0700000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j615.dtb: /soc/power-management@2d0700000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/apple/t8122-j615.dtb: power-management@2e4280000 (apple,t8122-pmgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8122-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	'apple,t6020-pmgr' was expected
   	'apple,pmgr' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8122-j615.dtb: /soc/power-management@2e4280000: failed to match any schema with compatible: ['apple,t8122-pmgr', 'apple,t8103-pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t8122-j615.dtb: watchdog@2e42b0000 (apple,t8122-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-wdt' was expected
   	'apple,t8122-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
   arch/arm64/boot/dts/apple/t8122-j615.dtb: /soc/watchdog@2e42b0000: failed to match any schema with compatible: ['apple,t8122-wdt', 'apple,t8103-wdt']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
