Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58B3318EE6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033234; cv=none; b=m1X5sCs7dd8vEEEvvC1+ewD1Uq2Q2cUXt4MEfm54Ck3CqJofonP1IS6N4t1oafBESzb3hEqaPAFeT63+T5Dy7ZY5cMBLKiRNwc0elWjkSgNo0MiQ4hCjKAQfgTNFJH9qNRzhDEUZwnnoLAYjTwWHbVbxLK8FirjUgVG43ktx7I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033234; c=relaxed/simple;
	bh=7YZJYXyL9/EF7vbXzPVzwkczzng+s7/zPciP6id/ueM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eID1ueANW4RrBL28b6d7oe0MpZa2mYPZaMiIACnVLzpqwqgvZQ1fmZIR1cPYNRS/BPi1n2I+oLLy7Hr9y7a6bbNAz1AuryLJQ2fgI8e5Jz9rZhlqz5YqimVnJCB0aQHZ0Sj7ueFf01uGVIIoRhuM+Askzkf/2ZgXomcJHRDaYsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8sC9RRs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8sC9RRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775033230; x=1806569230;
  h=date:from:to:cc:subject:message-id;
  bh=7YZJYXyL9/EF7vbXzPVzwkczzng+s7/zPciP6id/ueM=;
  b=j8sC9RRs3OkegUmXoQZ3A4MuOY5LOEYEtmfwHGcqq9vqmmwAKLz1SDmr
   mj3/opm6KsqV+7iT5e6jxZgPLyQr7DU34ZjOZrY8n0i55TMN6G4xkgzG3
   VWQU8LYoUvEt5kX9VPYgKqR/nSZnYIhZyXgNWWDkuRsbPpWr/biTMlFHi
   GaFB022btWS748w5LGjaKCYVjZUkiAKSYoSI4VSiuSqeLb8Q8vnfnKu2W
   1wRtsn+Y2+mgVbpwsfM+TzxP89IiRpVP1o0JZKuZDMBge7TkVDNFix7cf
   t3XjZqeDoJG63DDLzqno6MwOmGBmfy53ocHSVe+VYG5761wa30d7qNmJT
   w==;
X-CSE-ConnectionGUID: jQR3V9V6QoC6REkZ0KFX9g==
X-CSE-MsgGUID: /ElYXqPHTU2mnQ/hYOlezw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75957668"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75957668"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 01:47:00 -0700
X-CSE-ConnectionGUID: 90AMHFQJRlOl+wg+r7cS+A==
X-CSE-MsgGUID: jTpNpoDhTyKTg1PlqrwWyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="221762649"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2026 01:46:59 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7rE0-000000008fd-3MLt;
	Wed, 01 Apr 2026 08:46:56 +0000
Date: Wed, 01 Apr 2026 10:46:10 +0200
From: kernel test robot <lkp@intel.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [linux-next:master 9886/10705]
 arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: r5fss@78000000
 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
Message-ID: <202604011046.wVV6RFKA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: 479ba9d293f5fa32cfd2a14a502690eca769e5ee [9886/10705] dt-bindings: remoteproc: k3-r5f: Add memory-region-names
config: arm64-randconfig-2054-20260331 (https://download.01.org/0day-ci/archive/20260401/202604011046.wVV6RFKA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011046.wVV6RFKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011046.wVV6RFKA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6254atl-sk.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62d2-evm.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dev.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dev.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dev.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dev.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-sk.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-sk.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-sk.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-sk.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: r5fss@41000000 (ti,j7200-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: r5fss@41000000 (ti,j7200-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: r5fss@5c00000 (ti,j7200-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: r5fss@5c00000 (ti,j7200-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: r5fss@78400000 (ti,am62-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: r5fss@78400000 (ti,am62-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-disable-eth-phy.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-disable-rtc.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-disable-spi-nor.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-gpio-fan.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-qspi-nor.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-eth-phy.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-eth-phy.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-rtc.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-rtc.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-spi-nor.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-spi-nor.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-gpio-fan.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-gpio-fan.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-qspi-nor.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-qspi-nor.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j7200-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j7200-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j7200-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j7200-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: r5fss@78400000 (ti,am62-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: r5fss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: r5fss@78400000 (ti,am62-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5900000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-usb3.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-usb3.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am654-gp-evm.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am654-gp-evm.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am654-evm.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am654-evm.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j7200-evm.dtb: r5fss@41000000 (ti,j7200-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j7200-evm.dtb: r5fss@41000000 (ti,j7200-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j7200-evm.dtb: r5fss@5c00000 (ti,j7200-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j7200-evm.dtb: r5fss@5c00000 (ti,j7200-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am654-idk.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am654-idk.dtb: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
