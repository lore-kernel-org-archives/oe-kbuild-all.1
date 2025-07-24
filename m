Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422671C84B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 02:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753325424; cv=none; b=dRUtl/QRGhEynpdkP5wNBfd4Ur2yawWhl9pu34iVW2hHoCqHVkV3n35LVmZhQR830i9dCTkdYcdWayENP1TtX7AM3Ene/ORRA7+Vo7n+5tCxGu+RA/g6294UDfEvGIzXYMtVbC2NkOu4A+Xfv8caDYdOuif3FwjmJizw4PuJVkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753325424; c=relaxed/simple;
	bh=sYFo3YVMQlmNqV4TDCOVMlgfUv8fwFR+2eb7S659bZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mbP6ZZHu/P9vlQEmHgNV78RRc6aZ6jWlnJEEI7fFK64mDwhNKOgopdPKXEuZOmZ9kqbKOwlEFVoAR2T6M9YbCMQeJIomeiBoWikBgQnRJgMBKbSa+jBUGQ5wYe7qx8N22WKJrA57WtzZ3vvVN4jBPyp5hfbG0OPKeR1py5ZK2fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSrKvywC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSrKvywC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753325424; x=1784861424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sYFo3YVMQlmNqV4TDCOVMlgfUv8fwFR+2eb7S659bZ4=;
  b=ZSrKvywC8IhJoLs2qtvjTGFaxHsSTxMqKzIfbddioTeUZUb2Pu1K/j/r
   ouyMIrv54qcNG8/LIDKdNv2utyv3auTmNYrpLJlVSUIqj/4ylhLEbiRza
   lEsUv1i8Xh7YKAmH1OVfhRdZWWsXegREWzR2wpqyNcn+S4lWXQ+kexE6P
   VgMFWV7lMHrowNFBfxY6ovO3ugCAm2GuJDHoX/mXVH82WXnD5D5QplFDY
   mtO7Sel3bgphBT6djW4mQBOuHE8/WT0cnQzWRGQdZ1lAtwqEW/Holi00V
   aenxA3xasLYnqLx8z+kZj711dlPz9s306O8spYuVgOEDd7qRZrMUEXRQm
   A==;
X-CSE-ConnectionGUID: ePZDmTrmS/a2hdWzYqPe5g==
X-CSE-MsgGUID: 0q+KYzC1RQSTfRdAe9flHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55500074"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="55500074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 19:50:21 -0700
X-CSE-ConnectionGUID: ttSv31bQRD6osJWVrFhJcA==
X-CSE-MsgGUID: kTF0TFtwTJ2OxVKrHGncUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="164170858"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jul 2025 19:50:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uem2D-000K1W-24;
	Thu, 24 Jul 2025 02:50:17 +0000
Date: Thu, 24 Jul 2025 10:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 5561/11931]
 arch/mips/boot/dts/ralink/rt3052_eval.dtb: syscon@0 (ralink,rt3052-sysc):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202507241000.zMWAH2xr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
commit: 292f0b50d3918220663cf6416ce2fdc2928d2e34 [5561/11931] dt-bindings: clock: mediatek,mtmips-sysc: Adapt compatible for MT7688 boards
config: mips-randconfig-051-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241000.zMWAH2xr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241000.zMWAH2xr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241000.zMWAH2xr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ralink/rt3050.dtsi:10.9-12.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpu@0 (mips,mips24KEc): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: syscon@0 (ralink,rt3052-sysc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ralink,rt3052-sysc', 'ralink,rt3050-sysc', 'syscon'] is too long
   	'ralink,mt7628-sysc' was expected
   	'syscon' was expected
   	'ralink,mt7688-sysc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mtmips-sysc.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: intc@200 (ralink,rt3052-intc): $nodename:0: 'intc@200' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: intc@200 (ralink,rt3052-intc): compatible:0: 'ralink,rt2880-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: intc@200 (ralink,rt3052-intc): compatible: ['ralink,rt3052-intc', 'ralink,rt2880-intc'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
