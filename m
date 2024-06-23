Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3471849C1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 20:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176093; cv=none; b=aJqwWfyP2baubdmLaa+P8bBic9PtwW7SbGubyeooQ4ihokiKdIV9QtCk8Yc7i1Xzzs3UjXlrHxevA2YP0ai/4OlkWX93M4aAAIISnjTSmN5SvL0FnKoZv0yTJ5VllPeAm6lwsl9sJ4SeJo7RqboKYexciQoXWutEpVy/0fAslCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176093; c=relaxed/simple;
	bh=mmHvrm7P9Hn6Z9pOLZsUXb5UF/dd/HwPm4VkGJ4nOwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YVPu5guolsOiEB7+b75n4+4LU7c/fBvA8cc/kMaSiYcfkj7hr4EMPtSLLh+oxhkxIl+cmoE/XM+QjpMJSPEO+cebu1JUA9Dafin+uObyouAimW73e/lnudXSYUSp3m5uZU+/ZiWy/De9ZVMSDeo9XEj1XVPlNUGafhquW7ppVBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTnkNYz4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTnkNYz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719176089; x=1750712089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mmHvrm7P9Hn6Z9pOLZsUXb5UF/dd/HwPm4VkGJ4nOwA=;
  b=GTnkNYz4kGpD9wP6Fv83QvaHq47HePD45bS7ZIGpt+4F96enVw5EkuOq
   kuxVwICApZ4bKSZa/3LvFqoqJT45/5sz8ZhoJPSCja0YHiygrjEi8RTWB
   r6QhGC7YxdqZf5rDFzOPWPFMD5O7HitE8f2bMF8IroIMymyMLrn1OfBS4
   oaEL29nthEzymg2MXn7Drgm2vli14Pb1YSz+cX3QcKZnIbcVdjAoCB2Dh
   Z+L5vGVkg1yi7AMTSNADsTfwyw7fYiqUBQAi7bZ3SZ4Xmt5azILa3P+P6
   ZVvHkIMkvazThzDSI1zadeeijZNBu6b9TC2uhY/ejYuqXurCeXjl1Ddmh
   g==;
X-CSE-ConnectionGUID: xaU8wiCjSAuClLgUExxgEQ==
X-CSE-MsgGUID: Ycj3ocvdRHuJgOX/VRu+yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="27543300"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="27543300"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 13:54:48 -0700
X-CSE-ConnectionGUID: xCrmUV7zTP+laiTU6ep5yQ==
X-CSE-MsgGUID: jLCYUyDKTnOf5eldxUyBWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="47561767"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jun 2024 13:54:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLUEV-000BQE-1N;
	Sun, 23 Jun 2024 20:54:43 +0000
Date: Mon, 24 Jun 2024 04:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 7415/7797] arch/powerpc/boot/dts/mpc8313erdb.dtb:
 ptp_clock@24E00: interrupts: [[12, 8], [13, 8]] is too long
Message-ID: <202406240419.pwD9la4U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
commit: 01479f1b912aa499057fd29deddb1ffb9c72fa0a [7415/7797] dt-bindings: ptp: Convert ptp-qoirq to yaml format
config: powerpc-randconfig-051-20240623 (https://download.01.org/0day-ci/archive/20240624/202406240419.pwD9la4U-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406240419.pwD9la4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406240419.pwD9la4U-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/sleep-nexus/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/spi@7000: failed to match any schema with compatible: ['fsl,spi']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr']
>> arch/powerpc/boot/dts/mpc8313erdb.dtb: ptp_clock@24E00: interrupts: [[12, 8], [13, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   	from schema $id: http://devicetree.org/schemas/hwmon/national,lm90.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/i2c@3000/clock-generator@69: failed to match any schema with compatible: ['idt,6v49205b']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/gpio-controller@fc00: failed to match any schema with compatible: ['fsl,pq3-gpio']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/turris1x.dtb: switch@10: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/qca8k.yaml#
>> arch/powerpc/boot/dts/turris1x.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p2020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p2020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
--
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr', 'fsl-usb2-dr-v2.2']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr', 'fsl-usb2-dr-v2.2']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/sdhc@2e000: failed to match any schema with compatible: ['fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9131-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9131-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/memory-controller@2000: failed to match any schema with compatible: ['fsl,bsc9131-memory-controller']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/i2c@3000/fpga@66: failed to match any schema with compatible: ['fsl,bsc9132qds-fpga', 'fsl,fpga-qixis-i2c']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/i2c@3000/fpga@66: failed to match any schema with compatible: ['fsl,bsc9132qds-fpga', 'fsl,fpga-qixis-i2c']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr', 'fsl-usb2-dr-v2.2']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr', 'fsl-usb2-dr-v2.2']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9132-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9132-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@c300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/gpio-controller@fc00: failed to match any schema with compatible: ['fsl,pq3-gpio']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p2020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p2020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
--
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
--
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/gpio-controller@fc00: failed to match any schema with compatible: ['fsl,pq3-gpio']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/gpio-controller@f000: failed to match any schema with compatible: ['fsl,mpc8572-gpio']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8572-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/ethernet@27000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/mdio@27520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/gpio-controller@fc00: failed to match any schema with compatible: ['fsl,pq3-gpio']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/gpio-controller@f000: failed to match any schema with compatible: ['fsl,mpc8572-gpio']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8572-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/ethernet@27000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/mdio@27520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/gpio-controller@fc00: failed to match any schema with compatible: ['fsl,pq3-gpio']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/gpio-controller@f000: failed to match any schema with compatible: ['fsl,mpc8572-gpio']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8572-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ethernet@27000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/mdio@27520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/gpio-controller@fc00: failed to match any schema with compatible: ['fsl,pq3-gpio']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/gpio-controller@f000: failed to match any schema with compatible: ['fsl,mpc8572-gpio']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8572-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ethernet@27000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/mdio@27520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@c300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/gpio-controller@fc00: failed to match any schema with compatible: ['fsl,pq3-gpio']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p2020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p2020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1010-memory-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1010-memory-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1010-memory-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1010-memory-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000/slic@0: failed to match any schema with compatible: ['zarlink,le88266']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000/slic@1: failed to match any schema with compatible: ['zarlink,le88266']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000/display@2,0: failed to match any schema with compatible: ['solomon,ssd1289fb']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p2020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p2020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
