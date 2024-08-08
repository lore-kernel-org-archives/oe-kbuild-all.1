Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0271465A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 18:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723142087; cv=none; b=RoWL92mGbz6HekLQEbyH/HnxEaloWnunlcbJSK79POOCRBJ/TG4v+/XgrIJ3OVoQjYV+9Y6rJdsaQ/+ZkDKFvKOX/UwcKaAKYFiHeiFPYHSb9qlLzdrouzY2JwyBuaizZXVB2+AHgf3H0x6QjB2+qG+0t+iAfUthtp31zQmXsXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723142087; c=relaxed/simple;
	bh=+cZvPCl6JpL/X4S/LN1yeXg2lShNCZsnNTKSY++4Rcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=na3i8eFDOQryMNvgcnmQ/BRLJeWCyg/ohPL+BU+fzO8ndEPXpJ1Ahmdfv32TRRTcHAX051NBljAyh4mu4KD3bXpoMehJzVSRfrJVLWWU/EXK4ZxpnSA4KzgtzRYG6KbtrAFT+GcxuBt9DZrU1GxFG1hPep1ZA/ktZxCSDcq35o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtsBNYqg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtsBNYqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723142086; x=1754678086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+cZvPCl6JpL/X4S/LN1yeXg2lShNCZsnNTKSY++4Rcg=;
  b=KtsBNYqggPekwOlV3mx2eKIccg6RAkP3oWFPNWRWN7i+YZz2vihjQRbG
   sgWUei/tr5Nniy3yJ2JgOvTGa/Ar+HilIEJYPl5b41Y6r50BdZsY0k027
   6siDZ8zGbnZKjfTUcEW5aU2mBPQ1g7YczQagNaJqxJ5ofn4ft9sAIr+LB
   GpYiwZIzlROwXhLkj9pvDBKBcfYDMwJ2yveNc7cFUoYr1Gb2Vhk84rgec
   4bgKX7yyI+3C7rmC2Yv7VGYY0ZUXjmaLDN+nRqBkF0LXLsEqT7yrms2YQ
   WGSOgVIjvvDg6Kc73XESG0eSlzpo9JJjby/kAG+DAU2GqTwDWM9/L8m8/
   A==;
X-CSE-ConnectionGUID: mMW5WJNCSVKrGh2XAtw0Qw==
X-CSE-MsgGUID: RKyqq7xQRfiXz7Aud6LqYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38749275"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="38749275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 11:34:45 -0700
X-CSE-ConnectionGUID: kkzcdUGESMON8/fg+4vW8A==
X-CSE-MsgGUID: 5u89JRoNSMiyLt+pb6yq4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="58018223"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Aug 2024 11:34:43 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc7yC-0006Pc-1Q;
	Thu, 08 Aug 2024 18:34:40 +0000
Date: Fri, 9 Aug 2024 02:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip 40/43]
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb:
 /soc/i2c@10058000/camera@3c: failed to match any schema with compatible:
 ['ovti,ov5645']
Message-ID: <202408090216.zaNeBalS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   ab928510d84ecc8ba347a32bc3a2ef037003ab93
commit: ec1744a50deddf5f618cdb191e1d8eba791a131d [40/43] arm64: dts: renesas: rzg2l-smarc: Enable CRU, CSI support
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090216.zaNeBalS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090216.zaNeBalS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090216.zaNeBalS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:711.12-719.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:721.12-730.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:756.12-765.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: cache-controller-0: Unevaluated properties are not allowed ('cache-size', 'cache-unified' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: /soc/i2c@10058000/camera@3c: failed to match any schema with compatible: ['ovti,ov5645']
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,mt25qu512a', 'jedec,spi-nor'] is too long
   	'micron,mt25qu512a' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,mt25qu512a' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: fcp@10880000: compatible:0: 'renesas,r9a07g044-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
--
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:716.12-724.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:726.12-735.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:761.12-770.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: cache-controller-0: Unevaluated properties are not allowed ('cache-size', 'cache-unified' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: /soc/i2c@10058000/camera@3c: failed to match any schema with compatible: ['ovti,ov5645']
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,mt25qu512a', 'jedec,spi-nor'] is too long
   	'micron,mt25qu512a' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,mt25qu512a' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: vsp@10870000: compatible:0: 'renesas,r9a07g054-vsp2' is not one of ['renesas,r9a07g044-vsp2', 'renesas,vsp1', 'renesas,vsp2']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
