Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F281437C0E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789191490; cv=none; b=dzVQpXwp7AsMztTUTnwayTvSd25zF88klM6ithwr26uSz/S6v3D9U5r8h7bg8VORf0E/Mi20ZoD0iqDaZoi1d2LVkQwCPB3o++36W3tL3Vt0O2cYR2A+4PJgkDADoHnSwqYAT2pXgvhfev4XG5IXmrx+pkG8FQBjdbogHM3ONsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789191490; c=relaxed/simple;
	bh=JDn5QLhkxw7b6P2cnBEm0oDBhBnsQD8G9LEEp49ate8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yfs78kW5AL+acHuwWr8H1K+JvpvN8xxc4WL/HdUuc0KSWf8N22DW9fUnJpnaHamdFEIX1TXj9si9C5jxLRcoNQd8XRlUNsE4EgVtLfntBeSt6OEzU8ISCGPYzp//cevEuUoDo4PAZxzJK+lMOZVOgeOmcm4WAr6f/UI30R4BYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahdlA83m; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahdlA83m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789191488; x=1820727488;
  h=date:from:to:cc:subject:message-id;
  bh=JDn5QLhkxw7b6P2cnBEm0oDBhBnsQD8G9LEEp49ate8=;
  b=ahdlA83m+ceiwH1iy5dKfW57dE72+aLPz2wUj7xYR/3R/tLi7T5V6pnG
   UYrVQMOxdbvqmVMAoXfObK4MzWiGrakIfmMwopq5jUm6x46jC6HX0vOhx
   uTS9M+y1SCZU3DAMBW9vwNNQrKTJxBBxlxdOBZCGwbAn257vFlVYWBMAb
   skuVKw2cxvYvEmh3XEg+t3DFLQFtMY6XPJWq750/Sl1zKB6LKrDQ/JkQh
   FVDahwKcjAymQZZdFGt62FczTVR/DYHs/9kUAtctMCuvm4WqbFVYt+R1/
   289q3DUoxSP0Wo2ufztBiwFpjo2fenExMWvSOvCBW5HBiIpko1/wH0Bc5
   g==;
X-CSE-ConnectionGUID: GHP2X3sqRkOh6q9n0qzYkA==
X-CSE-MsgGUID: ZWtTePn9SLuJcLHWoDyF9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100308283"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="100308283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 22:38:07 -0700
X-CSE-ConnectionGUID: WCL112pNR4K/KzhUnBBJxw==
X-CSE-MsgGUID: XIFoarzLSP+GaqJMDFcD8g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2026 22:38:05 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5GR9-000000000z5-0jBS;
	Sat, 12 Sep 2026 05:38:03 +0000
Date: Sat, 12 Sep 2026 07:36:59 +0200
From: kernel test robot <lkp@intel.com>
To: Chenghai Huang <huangchenghai2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Longfang Liu <liulongfang@huawei.com>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [linux-next:master 6042/6369]
 arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: mdio@603c0000
 (hisilicon,hns-mdio): subctrl-vbase:
 b'\x00\x00\x00W\x00\x00\x038\x00\x00\n8\x00\x00S\x1c\x00\x00Z\x1c' is not of
 type 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202609120717.QCHlGRT9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   68142f986ff04b2b70b31db00f719bf690f64a9a
commit: 40ea0a15f20ca2f2b2038400dece17d26cb008ab [6042/6369] crypto: hisilicon/sec - remove SEC crypto block cipher accelerator
config: arm64-randconfig-2051-20260911 (https://download.01.org/0day-ci/archive/20260912/202609120717.QCHlGRT9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120717.QCHlGRT9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120717.QCHlGRT9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: ethernet-3 (hisilicon,hns-nic-v2): port-idx-in-ae: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: serial@602b0000 (arm,sbsa-uart): Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/arm,sbsa-uart.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa_cpld@78000010 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sds_ctrl@c2200000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/mdio@603c0000: failed to match any schema with compatible: ['hisilicon,hns-mdio']
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: mdio@603c0000 (hisilicon,hns-mdio): subctrl-vbase: b'\x00\x00\x00W\x00\x00\x038\x00\x00\n8\x00\x00S\x1c\x00\x00Z\x1c' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/dsa@c5000000: failed to match any schema with compatible: ['hisilicon,hns-dsaf-v2']
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa@c5000000 (hisilicon,hns-dsaf-v2): subctrl-syscon: b'\x00\x00\x00Y' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa@c5000000 (hisilicon,hns-dsaf-v2): reset-field-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa@c5000000 (hisilicon,hns-dsaf-v2): desc-num: b'\x00\x00\x04\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa@c5000000 (hisilicon,hns-dsaf-v2): buf-size: b'\x00\x00\x10\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@0: serdes-syscon: b'\x00\x00\x00Z' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@0: cpld-syscon: b'\x00\x00\x00[\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@0: port-rst-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@0: port-mode-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@0: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@0: media-type: b'fiber\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@1: serdes-syscon: b'\x00\x00\x00Z' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@1: cpld-syscon: b'\x00\x00\x00[\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@1: port-rst-offset: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@1: port-mode-offset: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@1: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@1: media-type: b'fiber\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@4: serdes-syscon: b'\x00\x00\x00Z' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@5: port-rst-offset: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@5: port-mode-offset: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@5: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@5: media-type: b'copper\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/infiniband@c4000000: failed to match any schema with compatible: ['hisilicon,hns-roce-v1']
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: infiniband@c4000000 (hisilicon,hns-roce-v1): eth-handle: b'\x00\x00\x00^\x00\x00\x00_\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00`\x00\x00\x00a' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: infiniband@c4000000 (hisilicon,hns-roce-v1): dsaf-handle: b'\x00\x00\x00R' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: infiniband@c4000000 (hisilicon,hns-roce-v1): node-guid: b'\x00\x9a\xcd\x00\x00\x01\x02\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/sas@c3000000: failed to match any schema with compatible: ['hisilicon,hip07-sas-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@c3000000 (hisilicon,hip07-sas-v2): sas-addr: b'P\x01\x88 \x16\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@c3000000 (hisilicon,hip07-sas-v2): hisilicon,sas-syscon: b'\x00\x00\x00Y' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@c3000000 (hisilicon,hip07-sas-v2): ctrl-reset-reg: b'\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@c3000000 (hisilicon,hip07-sas-v2): ctrl-reset-sts-reg: b'\x00\x00Z0' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@c3000000 (hisilicon,hip07-sas-v2): ctrl-clock-ena-reg: b'\x00\x00\x038' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@c3000000 (hisilicon,hip07-sas-v2): queue-count: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@c3000000 (hisilicon,hip07-sas-v2): phy-count: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/sas@a2000000: failed to match any schema with compatible: ['hisilicon,hip07-sas-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a2000000 (hisilicon,hip07-sas-v2): sas-addr: b'P\x01\x88 \x16\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a2000000 (hisilicon,hip07-sas-v2): hisilicon,sas-syscon: b'\x00\x00\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a2000000 (hisilicon,hip07-sas-v2): ctrl-reset-reg: b'\x00\x00\n\x18' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a2000000 (hisilicon,hip07-sas-v2): ctrl-reset-sts-reg: b'\x00\x00Z\x0c' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a2000000 (hisilicon,hip07-sas-v2): ctrl-clock-ena-reg: b'\x00\x00\x03\x18' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a2000000 (hisilicon,hip07-sas-v2): queue-count: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a2000000 (hisilicon,hip07-sas-v2): phy-count: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/sas@a3000000: failed to match any schema with compatible: ['hisilicon,hip07-sas-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a3000000 (hisilicon,hip07-sas-v2): sas-addr: b'P\x01\x88 \x16\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a3000000 (hisilicon,hip07-sas-v2): hisilicon,sas-syscon: b'\x00\x00\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a3000000 (hisilicon,hip07-sas-v2): ctrl-reset-reg: b'\x00\x00\n\xe0' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a3000000 (hisilicon,hip07-sas-v2): ctrl-reset-sts-reg: b'\x00\x00Zp' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a3000000 (hisilicon,hip07-sas-v2): ctrl-clock-ena-reg: b'\x00\x00\x03\xa8' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a3000000 (hisilicon,hip07-sas-v2): queue-count: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sas@a3000000 (hisilicon,hip07-sas-v2): phy-count: b'\x00\x00\x00\t' is not of type 'object', 'integer', 'array', 'boolean', 'null'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
