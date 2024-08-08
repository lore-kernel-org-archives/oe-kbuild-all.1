Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A9145B3F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 23:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723159797; cv=none; b=cUw57laEwcrUFh5G0nKvnaVgD8R7Op+cdfsX6sVrfvd/ZcoSXhZboHBKWOK800ytma7oBAXHSBRkim0+NrxJkPplyF5errI1xKhIihD2X8i6qGDRZ4t08Y0nQsU1S2mtPK07lI4myaGtXI1+PZrd6HdNSyptat/8scpcEpvO5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723159797; c=relaxed/simple;
	bh=Z2sfJ4PhhVvOfMblYFhsWlspQR3132oOwXd/5g/schI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=imzvI9CapuLtM0+wkhNT6MG7/84AbwZDNUAMgVTPDyH5ZuTjti73GdDU8wZJrFeFStqxYD2/4NiE4epfDC/8BcFww4Pla2NahWIce+1E7uv1x6sPVe0W/9VL93yM2zOlr7KD55Ss3A2o0a46JKmoWcXTAbDMjGGFiBlCmVKBjuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLOnIqTX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLOnIqTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723159795; x=1754695795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z2sfJ4PhhVvOfMblYFhsWlspQR3132oOwXd/5g/schI=;
  b=VLOnIqTXl7BTorgyadiR8HEe5Glqk35o0ucttOkWfwuvpYS3g9+JuBKp
   49vMhX1BO8dz4Don3r4XIronAEu6xGiYq//8DvNFk9y2DEQznwbNquhz4
   Ottu7nVzddGu6YdzjW8/RDUTmoCbmRN7qbeskqyEj34vaQnH7Xpisj+ww
   ZkFmRvM9o8afQvvGZ7zfBElFGj7YuPztcp3cJ1NEH/kl/R0u6k59TOUcR
   YhYQVZHJFo+iftdE7xi9HedM7uOToikMG+kaDqhDBvSd7u47iEC9dWgIw
   yUoJ06nRptA929scJJlCpcgtE08XtHIrzK4nX4HEzB1t4i4mqXwuWTJ0x
   Q==;
X-CSE-ConnectionGUID: svVEs8CWRZCHFRi1z1NU4g==
X-CSE-MsgGUID: HyaP4LlFS8adCUvGi7knLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38826062"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="38826062"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 16:29:55 -0700
X-CSE-ConnectionGUID: m0XirGIQTFukpiqm5DL8zQ==
X-CSE-MsgGUID: EV5CX3bnRVSp0aCukBlHow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57943136"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 08 Aug 2024 16:29:53 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scCZl-0006cY-2j;
	Thu, 08 Aug 2024 23:29:47 +0000
Date: Fri, 9 Aug 2024 07:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip 41/43]
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb:
 /soc/i2c@10058000/camera@3c: failed to match any schema with compatible:
 ['ovti,ov5645']
Message-ID: <202408090702.CddcaVsP-lkp@intel.com>
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
commit: 6da5d90e3fa6ca7efb9a6e76cd1fd2bbb4132859 [41/43] arm64: dts: renesas: rzg2lc-smarc: Enable CRU, CSI support
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090702.CddcaVsP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090702.CddcaVsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090702.CddcaVsP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:711.12-719.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:721.12-730.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:756.12-765.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: cache-controller-0: Unevaluated properties are not allowed ('cache-size', 'cache-unified' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /soc/i2c@10058000/camera@3c: failed to match any schema with compatible: ['ovti,ov5645']
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,mt25qu512a', 'jedec,spi-nor'] is too long
   	'micron,mt25qu512a' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,mt25qu512a' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000: compatible:0: 'renesas,r9a07g044-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
