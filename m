Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453493E6DEB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044146; cv=none; b=Os1JSb7As1I3Iv7zB/UrNBr8ueyny33haPh2I06H2gfwf7SfO/YMxITxV/Mvry3gPeohAQwiHMz6MLv+9FeyAVxq+/1h2nRBf18C/CeiR/hZc7eQnNfRnPmrw1dXn6BL2DKHfPZgMEbzBlNrzPonICp4ypK8jNexChhskKz+NzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044146; c=relaxed/simple;
	bh=UZO2inuKENiPEORQBaBYn9EgC4CgP1k1V1SOEsUZK/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k09Ht+JC47kWqnqD6cgZidHyUh/PF+ntbxiPhAO4FvgyG4KerrHeVG8vr//Piu/s5oiitilvup1RZ3I71q7ZLjuw92AsNRREktZRazPhMhXGuhL3oVOShs5eS00/+0zmrf1+k+/bD9J95rNuOWK5TjCzkyyOUrC5ZV8mle+t+Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYPKpARd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYPKpARd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775044145; x=1806580145;
  h=date:from:to:cc:subject:message-id;
  bh=UZO2inuKENiPEORQBaBYn9EgC4CgP1k1V1SOEsUZK/Y=;
  b=fYPKpARdJdenV7tEmouHiBeD7cWz6ImP25WMEp8/kl3eZqGYoLeGVAIZ
   Vo7w7ohYKMtE3tHjdd4ZQkKl3NlXs2NMoxtaBnZsJaVUbywCnImKoXqO4
   3fQS2NwB/uzKy+j7mFRu+eOxJlvp0ABDOMYF0jEed4dRko69SDHLsr+HI
   OGjSLCYi6JvfZZgGaJ+3VzmlNpAaD4I7rPtTpnmD+uYLEjtr4jNzdA2RJ
   nUSonfCVxkxQmrnEzdzQe8mqfYAkc+95uhRGdOxrhI45ZlPCdIkkJ2hnW
   hlSDQ2yP/b02D3o62pU2YZV73kc3FuDPGp4EqT8Te4mnOqBtgjUw0tMk7
   Q==;
X-CSE-ConnectionGUID: NgsMx+91SW2GokdJQGGE4g==
X-CSE-MsgGUID: wiN1j+E+T+KLEYFg9VEoww==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="63629067"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="63629067"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:49:04 -0700
X-CSE-ConnectionGUID: zFd/uTg2SjCbwygACnlOFg==
X-CSE-MsgGUID: OGenBJGKQ+ar1EazvcpAqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226637460"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 01 Apr 2026 04:49:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7u4C-000000008iK-22er;
	Wed, 01 Apr 2026 11:49:00 +0000
Date: Wed, 01 Apr 2026 13:48:33 +0200
From: kernel test robot <lkp@intel.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10322/10352]
 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dtb: r5fss@78000000
 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
Message-ID: <202604011307.zmNerUX3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: eb4b64a1ec921824648e2185c5a2957131cea861 [10322/10352] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
config: arm64-randconfig-2052-20260331 (https://download.01.org/0day-ci/archive/20260401/202604011307.zmNerUX3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011307.zmNerUX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011307.zmNerUX3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-zinnia.dtb: r5fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
--
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
   arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtb: r5fss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtb: r5fss@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml
>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtb: r5fss@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
