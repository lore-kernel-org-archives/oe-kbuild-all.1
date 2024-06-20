Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4357A38FA5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718864980; cv=none; b=EpyA5EQqMsW2qciazgUD79wxlyNPG7JfXTzNrFJkl5/qY1naeZVyVCtZgA+CPAipFTI4MPdepcFqIDuvHenWgoLaLezKAyyg8gWWRnJB/YC6dcz4GZT3b7CCHRAKUm0NkEDpoKVFJdOGmdj+uYv9/pLeuYnYxo8guHlqL0Q37j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718864980; c=relaxed/simple;
	bh=RqNy5KaptfUyb3jJAu0HtBXCgNLJcd3wGJI3PmgGc1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H133hvPBA3230NyY1Px0CNT0Cl4izJWR4ej7Hit83LohxRCNdJEG5leyr9y1rf5JdfuK3tEUTwlRhDTHN1bg86EXhQ67kbZmMjZqUmsnOVlw6WSbniiwebume+oxaXLBxeu2lqMc9bARld8pN5P5UkHbUpuxpd10Bomznkxowyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpqR4lcr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpqR4lcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718864978; x=1750400978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RqNy5KaptfUyb3jJAu0HtBXCgNLJcd3wGJI3PmgGc1w=;
  b=fpqR4lcrhLjgk0RfVY7Qg0Zk/hTr5otXOjY9587hEBYH8NbBW9foulFO
   RJIhUtpVc/kZRfnZIaQVMATofi1ahEsQ2jSi+njKTw0Kq+Tpa0KzQQozE
   4wwUA4VuBls4tZqtxzONDiEmBDhMuLoU3fwMnKteQsyDfkgYX6TA8hkRW
   2HubV/SzFgDf5JTempA+xsJUBEtiljzav3ur9NLrGfocmmiiLzUv5pPT3
   oxfg59RbvrLwaI6wVaqkwiIIaSZIFx7q5B6MK7W2YbX4IHIQeQpMxPqJz
   28EhfIREwGAgaJacTLHTo1yGAZyp0s7gsya8PgJen6pou+rQKNsuPTY4b
   g==;
X-CSE-ConnectionGUID: Skw91M+rRTe8QFqwGDh82Q==
X-CSE-MsgGUID: lvfcROMZQw24MrHJYac4lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15795349"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15795349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 23:29:37 -0700
X-CSE-ConnectionGUID: o/yd+xQRTYiPRi7BasOlNg==
X-CSE-MsgGUID: iftfNy/OTa6KPVDPxyLyhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42800401"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jun 2024 23:29:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKBIc-0007O6-02;
	Thu, 20 Jun 2024 06:29:34 +0000
Date: Thu, 20 Jun 2024 14:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Neha Malcom Francis <n-francis@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 7/87]
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb:
 /bus@100000/bus@28380000/i2c@42120000/pmic@60: failed to match any schema
 with compatible: ['ti,lp8733']
Message-ID: <202406201441.mLg2RYnP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   100916322279f94e3a44135515e934c2bb8238f8
commit: 34c1fd7f08bba91298b10c1a487e39742eaf3e1d [7/87] arm64: dts: ti: k3-am68-sk-base-board: Add LP8733 and TPS6287 nodes
config: arm64-randconfig-051-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201441.mLg2RYnP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201441.mLg2RYnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201441.mLg2RYnP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: /bus@100000/bus@28380000/i2c@42120000/pmic@60: failed to match any schema with compatible: ['ti,lp8733']
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: video-codec@4210000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: fixedregulator-dp0-pwr: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
