Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C273B27A103
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 03:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768620023; cv=none; b=cqgmfkGENtuCcZkvBmARQPrCA4JZydZJpFExjrXy7x4mSzSd8msHRkPs9uVy1KdkitQgEj+uuvXEJwy+fF7/uqlklyHYH+SUs+vNjuDsn448wqkzjVJHir3Mp0mz/DYg2FJM0O5c6ZBoTOZe5uvZwcQOVPCSyeMHU59IAPADeEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768620023; c=relaxed/simple;
	bh=58kT5Fm/oVZN2Xh23N+cDSQOGX4V3xwOYZhSgP+foHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jOZ8YHKtk3vi9Ie8WuiOTYDTLaURepghW8SNc7hiL+zKYgyV5EZZk6LqsRUAi18buTo1+lTFXiPihiZqnd0EwnC1TRKj3Lwv5ld1sDqLkGR3V8Ala5x191MwmwO8amgPnZjbpimNkrGk4CmJXvcl47gWxpLXxrKDJ9xUFMOyrWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6pVsIcw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6pVsIcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768620022; x=1800156022;
  h=date:from:to:cc:subject:message-id;
  bh=58kT5Fm/oVZN2Xh23N+cDSQOGX4V3xwOYZhSgP+foHQ=;
  b=M6pVsIcwtwFFC3jqcaW/4C5xxOZhNsPXDog2rjM0ML7Wliw0A/N8/4nS
   Vbrn8T8JoVgW8YPCduWbR6Zvmp62nKP9Djuh5JmRDV7S3LWeNYGmryXAE
   17Ao0/B1G7R8Sm2NCyNqdWlvbbom76q43KNIkGW0z39hbfWBh6cRJRfgj
   dS/ttJZS/uggVIhXWyIL2nnr2Z1iMnI8I9kxNvy7eU2UTJsH7JLb27Pm8
   jFkfM8MceQC3OCmUTlbcpeVuJOnWnoC9Zwi3qAF1+rHz80ehl/WEBqpai
   HFkA9ZV14Kyo/tzfiPjTOa0bwPcmouVkNT3ASlWeORDMZbCuegkht5SIM
   A==;
X-CSE-ConnectionGUID: OkG0ANxwQKmjFOniz471Qg==
X-CSE-MsgGUID: K4ps73o8Sge6WW23cQbvYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73786695"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="73786695"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 19:20:21 -0800
X-CSE-ConnectionGUID: QWyO1cWHT3+Zpj4nlyrL9w==
X-CSE-MsgGUID: lv13xsVaS+SPa41iKk/HqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="242949293"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Jan 2026 19:20:20 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgwrJ-000000001tt-00J0;
	Sat, 17 Jan 2026 03:20:17 +0000
Date: Sat, 17 Jan 2026 04:20:09 +0100
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 4338/6849]
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: can@12440000
 (renesas,r9a09g057-canfd): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202601170438.elrdkPBZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 688fded2fc74b0539cd848b775418200c52a1fc2 [4338/6849] arm64: dts: renesas: r9a09g057: Add CANFD node
config: arm64-randconfig-2055-20260115 (https://download.01.org/0day-ci/archive/20260117/202601170438.elrdkPBZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170438.elrdkPBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170438.elrdkPBZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g057.dtsi:1744.10-1754.6: Warning (graph_child_address): /soc/display@16460000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: can@12440000 (renesas,r9a09g057-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g057-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb-phy@15870000 (renesas,r9a09g057-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
--
   arch/arm64/boot/dts/renesas/r9a09g057.dtsi:1744.10-1754.6: Warning (graph_child_address): /soc/display@16460000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: can@12440000 (renesas,r9a09g057-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g057-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: usb-phy@15870000 (renesas,r9a09g057-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: can@12440000 (renesas,r9a09g057-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g057-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb-phy@15870000 (renesas,r9a09g057-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: can@12440000 (renesas,r9a09g057-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g057-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g057-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb-phy@15870000 (renesas,r9a09g057-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
