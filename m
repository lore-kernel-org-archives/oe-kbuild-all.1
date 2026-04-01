Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8A0175A79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 21:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775078174; cv=none; b=i8mddp0/LV6ZZ2Dtj4Lq90F0Q7QQRCzOlKZhEouQkBl+HDUYjfAXSXkBT4x37Q1k6/Qz2iaujKHxOYw/DtT112eoaAYdV/psaT9sk3Mc2tyVbA6OfeWXPolT1ylJJqUQfPUiaAPJJYwzWpEBrlwU8XvycciyWA6mNI+5tMJv6Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775078174; c=relaxed/simple;
	bh=0oZcW4CKOwPAjjlaCYQnWjT4Hf+CAwM5Bb3NC3Xvrdg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SD8XSineQMNESDfjNhSjWDCh5w0cWgbeH5o6/HG5K/BGMkILyvkvwrhUEcOAnnCPd9NjtR9QIVD2qX9fzDWesON5qzshuH3VebPfNdpeLw23KMG2NhlE/TrSS84jZnbKpOrR9ZpwqMauD/mf8J5+bJrY2LR7iSJFaxZG5AhcdhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9WL1p05; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9WL1p05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775078173; x=1806614173;
  h=date:from:to:cc:subject:message-id;
  bh=0oZcW4CKOwPAjjlaCYQnWjT4Hf+CAwM5Bb3NC3Xvrdg=;
  b=D9WL1p05izVp/+AmMWb00xibYA4i+0islHzeeHtbQPY79RXqT9ZBk/7M
   lrUVI/nbPM6K9+UHQ3bnJ8tk/5i2RrIDBlTk5us0H64iPulEHB2Gq2W3j
   MzR5Kd/36sNEsxef1HnF8OqaAPIZo2DOv8nwJiC3JkAmrLJB8J60OVnmW
   DIBbTl86AYSu+fq7WqvL2soJQ5GP2MoZuj79t8Cz4UogeEngh/Vh4h9lV
   JFJOixMihOQ1/bFzQi/LeG3ULJk20OAt45QJ1lvOV6NvtBtIILmxoSyOm
   TvFxQdsOlnWl6atsXJQwwD0YIeGu3Ih9ICYZy6o0Kv+wczPvFvwKoTcFA
   A==;
X-CSE-ConnectionGUID: l0CXMhSSTf63pkaF4hMZAA==
X-CSE-MsgGUID: 3sF0ykmSTgq/1l8SU+v3mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75167090"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75167090"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 14:16:12 -0700
X-CSE-ConnectionGUID: CQfth0cuReSsvfWd9Sjspg==
X-CSE-MsgGUID: oluLKdf3TuuKXmD35xqVdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="227045055"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2026 14:16:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w82v1-000000008qD-1fXD;
	Wed, 01 Apr 2026 21:16:07 +0000
Date: Wed, 01 Apr 2026 23:15:47 +0200
From: kernel test robot <lkp@intel.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10322/10352]
 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dtb: r5fss@78000000
 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
Message-ID: <202604012318.WI56Y9qt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd0f139e5fc11182777b81cefc3893ea508544ec
commit: eb4b64a1ec921824648e2185c5a2957131cea861 [10322/10352] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
config: arm64-randconfig-2052-20260331 (https://download.01.org/0day-ci/archive/20260401/202604012318.WI56Y9qt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604012318.WI56Y9qt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604012318.WI56Y9qt-lkp@intel.com/

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
