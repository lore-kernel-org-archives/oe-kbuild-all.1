Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BC5225A2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 02:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720146172; cv=none; b=WiLzV4Im+GYolPIHjC8LC/2mZblzHqQ8897dRFgReSRb0VWPJ8zGq8vq+Dchkw7GYVDhYUskynsd9Z12l5Vvwsu8HuXU9lt39ZIOKbTD0WrChBQ24aebgdD/A+SLpLBMoJdAH9kVKD/57Grr0ZmLTAw92BRnV7kAJxHvXe+b9uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720146172; c=relaxed/simple;
	bh=S4JmtyUSwtz+Do88vrO17hT/UanwuRD/ej1LmVgTK1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nNGhwdn2HRZqkQvRDcI9usJQ0zQusqOV0ehlbaU8r/7UUJHgvMjDW3cVTSZV4nPpqYS6C7SeoXThBs2HPGWvT0A5lhe/gGXTJR0TVX13draqmuW40UvWbDgoKF71ZlD3m9Rv/bc+nU3+fJHCtAtoaZ35KnI1paSWjeRtvEm7lhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8QjDI8a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8QjDI8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720146169; x=1751682169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4JmtyUSwtz+Do88vrO17hT/UanwuRD/ej1LmVgTK1g=;
  b=L8QjDI8ahIJiv/VIouxJQewj84PLhZkYDQNca8D/hRZkpfOjtN9tOtZY
   JKzleNaqHO6gRzsFyaGbeui5SAU4mZPsiIyQMjvBGqGyOZeeebhwnP7FA
   V7WA1C/6qyHwNaN5yFym71z25IuKh6DUkdkOFnxmboaxZXdoA5SSGGzVv
   YUe0RaoS3BJ1TXSFWMNojH7tjKOxLRPiEiGqadI5grt6UGzR0exsL6T1G
   npeEckdegdWYFdChB3jFjHvU9WDSF0VI4+QFOFCjRAfojEPdd9aeUp8cl
   Dti7H99SvWv8Oenk5yW0DZLoQ6U4Qgdod69tE6Z/AbKxZ92/g1p/cGr9s
   A==;
X-CSE-ConnectionGUID: GQLonli4TtKqskqy3yjXQg==
X-CSE-MsgGUID: 5hAuWpTWTFmNzeAtAORN+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17250488"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17250488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 19:22:47 -0700
X-CSE-ConnectionGUID: oUZfaK0DTHWOOtHibcGoow==
X-CSE-MsgGUID: IrKlg0HIQICGKYNksHVDvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51172776"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jul 2024 19:22:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPYaw-000RnI-2o;
	Fri, 05 Jul 2024 02:22:42 +0000
Date: Fri, 5 Jul 2024 10:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 6286/10451]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb:
 ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp',
 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
Message-ID: <202407051228.gANABcWI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 01479f1b912aa499057fd29deddb1ffb9c72fa0a [6286/10451] dt-bindings: ptp: Convert ptp-qoirq to yaml format
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240705/202407051228.gANABcWI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051228.gANABcWI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051228.gANABcWI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: audio-controller@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: audio-controller@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: audio-controller@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: audio-controller@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: audio-controller@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: audio-controller@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: audio-controller@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: audio-controller@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: audio-controller@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: audio-controller@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: audio-controller@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: audio-controller@f150000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: audio-controller@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: audio-controller@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: audio-controller@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: audio-controller@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: audio-controller@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: audio-controller@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
