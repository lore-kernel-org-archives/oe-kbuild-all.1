Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78C5440C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 00:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725497638; cv=none; b=JM7V3Sjv/9PygZ5sO13qyD9cB4pTHvLO5RfVnNutAlWQbHmIiWCAPD9dhDl7YsyL2MiIdAZd86LohDPLkBPz82AvOR2cIVk/mtmg1Gs/W1BY2U1uoGj9J5QQw5I/fuOzqX4fqpZ+9Uy4YEPO2sixseHR5VNp7Pu93jQWMDmK1hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725497638; c=relaxed/simple;
	bh=RwyHA7ypGYIImsEUJLiz5RLM0B+aph5GmZVezAwO33c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vu5m2SdqI5Kv5/zRynw+V8GJ7hjdLPKnQGKUFOtI5qWiE4NiYKVIMsxLgcdM/A/xk5ZKRgdjRdmOx/8/XsIcBybkJhfI+0HnIRGsDqeHFxjf+sXf/JUsgFEKP+sp0ZYgAU1I02ruSzqLgCJn4ahlSImLhgh+RL3xN9nwqlyFZ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DN/dMpwq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DN/dMpwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725497636; x=1757033636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RwyHA7ypGYIImsEUJLiz5RLM0B+aph5GmZVezAwO33c=;
  b=DN/dMpwqozCQEv4+IWX1MQ6PM8p0uR0O7ouwiw3jBEYCbSuh4D99pkPt
   8M5HyXQFQDMWLA3RiC8ort5P0mpNL0mWa23HXsOJrdDBdOk6Gw/WuP1Y/
   Mv57yo4aWrMe/0CFchbnsCAtfrBdx6n0brOLEV51CXLFg03gJIUze+JlH
   syR8mhYnO499vrvboG/Q4AuHEx9ZiscH2IV/IFWqtZZAjpeV7f28RWxB3
   3m8rnzUoTbtCLSkXhPpl5yj3zrqhw6oWCfNODcFQzU8y383ypyoonU009
   Tqozy5hHqXJ8Ed4KoWAV7LHnwtqnFDC647oH++J7Mfe+Z5pbuTOJsHWIp
   w==;
X-CSE-ConnectionGUID: GijWTYF2RW2oa8zrlKtANw==
X-CSE-MsgGUID: b5tIR9o3T0ip9AuZf7n9JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24334487"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="24334487"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 17:53:55 -0700
X-CSE-ConnectionGUID: +xvvDH6eQcCjR4tG/A2cNw==
X-CSE-MsgGUID: ERcnwKobTtecZJ6RsY0Eqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="102896011"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2024 17:53:54 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm0kx-0008kh-1a;
	Thu, 05 Sep 2024 00:53:51 +0000
Date: Thu, 5 Sep 2024 08:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [linux-next:master 8385/9291]
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed00000:
 compatible: ['renesas,r8a779g0-isp', 'renesas,rcar-gen4-isp'] is too long
Message-ID: <202409050822.pUGzHuA9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fdadd93817f124fd0ea6ef251d4a1068b7feceba
commit: 2c5c9e37c10e5c84035d7b202050c0879f135ef9 [8385/9291] arm64: dts: renesas: r8a779g0: Add family fallback for CSISP IP
config: arm64-randconfig-051-20240904 (https://download.01.org/0day-ci/archive/20240905/202409050822.pUGzHuA9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409050822.pUGzHuA9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409050822.pUGzHuA9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6efe000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6eff000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed00000: compatible: ['renesas,r8a779g0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed20000: compatible: ['renesas,r8a779g0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6efe000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6eff000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed00000: compatible: ['renesas,r8a779g0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed20000: compatible: ['renesas,r8a779g0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6efe000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
   arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6eff000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed00000: compatible: ['renesas,r8a779g0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed20000: compatible: ['renesas,r8a779g0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6efe000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6eff000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed00000: compatible: ['renesas,r8a779g0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed20000: compatible: ['renesas,r8a779g0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
