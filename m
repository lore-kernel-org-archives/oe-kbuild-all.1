Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDB02D9796
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682459; cv=none; b=tDm3CT6AHSp+kK6+xVg3kQZv1PmxYbUK7JS1UZbr000IXzG4TyHXxs/G1JGZuEB0xJLYFYPJIrvmbG5i79RIEpb5fgTB5iRgvJUXeaG16sSFs4SS0AZTOQ2ISTEKKfHswg9IIRWQhpthkkfa7KQ6caf7FizxV6bzwbNtyixZ5VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682459; c=relaxed/simple;
	bh=OYXhH4RoRAdACG16vn/UIm3LZ8be77b4Ff8eoTQpj9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qp2o3uKhVBbck1vzHsXrFQpHe6ELRMgo2M0PnVcaHriZYfd3cAMut6IWeEPGszcWmFY1kVd5nNb1ybmC8FN8FxiOTtji+EyAWR6EIcqtxVaw5SA6HFUWOIhbUGZ+xMyT1Sdpbj8AFlSfKh8dymIZdhe/NhUsLg9WsXOS0iCxpGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iELgmLLK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iELgmLLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778682456; x=1810218456;
  h=date:from:to:cc:subject:message-id;
  bh=OYXhH4RoRAdACG16vn/UIm3LZ8be77b4Ff8eoTQpj9U=;
  b=iELgmLLK1l0c5mcAHz4V20cocvwyTnqXcFsmrXqOMJb/5kqmSJlgoEeU
   cvcTrNx5YCA7bOYvML+RgPMNEuvEQZEJNFIzjRnwsWSBcoEAdFk3Pcd2r
   DpxBRAeo3YV9IjOiK8DZ4JJjaGFftW8Cu4xRE6TM5NkHkpFI8IpmZcdka
   aKNrCmanmrTTiab5MtrpEvvTTrgSS3GVL6IPs7dlbEGg+m4S7QV+JaTMz
   oHrAItV6P3Yj+lpr6aWy3+GKx8Yd1vrE658R/JjBznMP+pI45hVDOxzXU
   mAXyXERzS3N+ShYsJtajN4ofU594gqINcnWK82emGnYCGgfCQWPQkzh0q
   Q==;
X-CSE-ConnectionGUID: WhRZNxQ5R32xqQtSlx68sg==
X-CSE-MsgGUID: Ni9G3E+LR7iZE9OtWg20vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79562401"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79562401"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:27:35 -0700
X-CSE-ConnectionGUID: /ugfXhVISd6uU54rC/Odpg==
X-CSE-MsgGUID: wTokb0y3TuO48fOgDE3UWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="276206044"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2026 07:27:33 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNAYc-000000004FL-32xB;
	Wed, 13 May 2026 14:27:30 +0000
Date: Wed, 13 May 2026 22:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 94/94]
 drivers/irqchip/irq-mtk-cirq.c:288:34: warning: 'mtk_cirq_of_match' defined
 but not used
Message-ID: <202605132236.4pMRDbtD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Zyta,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   20a1d6f1c48a1cdea99c1ffff1d7812dbbf3e0d1
commit: 3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265 [94/94] ANDROID: kconfig: Allow the MTK_IRQ to be unset
config: i386-randconfig-r122-20260513 (https://download.01.org/0day-ci/archive/20260513/202605132236.4pMRDbtD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605132236.4pMRDbtD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605132236.4pMRDbtD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-mtk-cirq.c:288:34: warning: 'mtk_cirq_of_match' defined but not used [-Wunused-const-variable=]
     288 | static const struct of_device_id mtk_cirq_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/mtk_cirq_of_match +288 drivers/irqchip/irq-mtk-cirq.c

9dbbbd33aafaf1f Youlin Pei                 2017-04-07  287  
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28 @288  static const struct of_device_id mtk_cirq_of_match[] = {
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  289  	{ .compatible = "mediatek,mt2701-cirq", .data = &mtk_cirq_regoffs_v1 },
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  290  	{ .compatible = "mediatek,mt8135-cirq", .data = &mtk_cirq_regoffs_v1 },
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  291  	{ .compatible = "mediatek,mt8173-cirq", .data = &mtk_cirq_regoffs_v1 },
5c4e0aac0b2a271 AngeloGioacchino Del Regno 2022-11-28  292  	{ .compatible = "mediatek,mt8192-cirq", .data = &mtk_cirq_regoffs_v2 },
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  293  	{ /* sentinel */ }
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  294  };
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  295  

:::::: The code at line 288 was first introduced by commit
:::::: 45ac01959edcecfa5d6652c2397d3866e55b0da8 irqchip/irq-mtk-cirq: Move register offsets to const array

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
