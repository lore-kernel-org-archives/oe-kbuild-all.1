Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD25E573
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765520857; cv=none; b=Zm+aosI4ojdhPfuK+2JzwcpR362cv+/xbPp9Asm9JMCu+i9XbzQlX9l+7dyu6LIaZJhg1HIVy+p72paZOUqZBdM34OLt6L/vq5d8p1kSdHoTZ7MqQ2OEnpksvCAMQ3eYTNsdvCpm0N3PQPg6y7hfPGF4EXFLdqcBd2FytUByP6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765520857; c=relaxed/simple;
	bh=klvsRBURmAOfxlX3zKoN43uiA88KAEjE+s9qpubCJzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ACwdHgnYaqxekvYVzRrfCnAjvEMVBcvWOnw+Co+IXXB7Qq2+QNVFtx78P0EiA3ClGZDdXtceql6XsR5z6Y9GDu5e0Q7an6/QbxTL/EgOeogWxFdmpPohDHOCc7ZTYkJ90yzVuEdTAH1BE5aGpVoWat83NFBYJxnCT/x6VT4vGeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmLjv/Rs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmLjv/Rs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765520855; x=1797056855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=klvsRBURmAOfxlX3zKoN43uiA88KAEjE+s9qpubCJzQ=;
  b=nmLjv/RsCF4FOiHaNPMj0NJCVeA+zWtJlmzKpH74UC44JFnDMCRzLS2w
   Sc90LINwODGkkIifUm9ww257hep9wZltBELNrVpB6T1vdL8DfBT1Dbx3b
   x8TmirUnpX0rUmhCOoKfxtmAjBW9NzfVZCKJ+wCTwvy2oWOwVyjkKe7vd
   MB9dx8SsukvnHRPWaCB1bo5LzJPfN2o1BTUOAt/AB0rUQdAWJMl/DyGlB
   OmOdljYUBrGUR5dzNDE0U8P36/Hcj4SjV8JPSGTda9iaOWTcOM5XDpv9f
   YAe4th//bbj3fzp3KrLrtiMFZ+oX3DtGp4a1C4hpQYOFHssOIYBZM6cw9
   A==;
X-CSE-ConnectionGUID: s3GkPWWWStiZ0BRtBR06Ig==
X-CSE-MsgGUID: eRqd6ACoRCefgotPWez6wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66690385"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="66690385"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 22:27:32 -0800
X-CSE-ConnectionGUID: BGk+6pMZRLKEXn7UbY7L7Q==
X-CSE-MsgGUID: mAQcd7coTqKQVOp8xHp+JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197267884"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2025 22:27:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTwcj-000000005fF-0LVQ;
	Fri, 12 Dec 2025 06:27:29 +0000
Date: Fri, 12 Dec 2025 14:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/irqchip/irq-mtk-cirq.c:288:34: warning: unused variable
 'mtk_cirq_of_match'
Message-ID: <202512121423.BJiHKG2f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zyta,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265
commit: 3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265 [1/1] ANDROID: kconfig: Allow the MTK_IRQ to be unset
config: x86_64-randconfig-r051-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121423.BJiHKG2f-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121423.BJiHKG2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121423.BJiHKG2f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-mtk-cirq.c:288:34: warning: unused variable 'mtk_cirq_of_match' [-Wunused-const-variable]
     288 | static const struct of_device_id mtk_cirq_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
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


vim +/mtk_cirq_of_match +288 drivers/irqchip/irq-mtk-cirq.c

9dbbbd33aafaf1 Youlin Pei                 2017-04-07  287  
45ac01959edcec AngeloGioacchino Del Regno 2022-11-28 @288  static const struct of_device_id mtk_cirq_of_match[] = {
45ac01959edcec AngeloGioacchino Del Regno 2022-11-28  289  	{ .compatible = "mediatek,mt2701-cirq", .data = &mtk_cirq_regoffs_v1 },
45ac01959edcec AngeloGioacchino Del Regno 2022-11-28  290  	{ .compatible = "mediatek,mt8135-cirq", .data = &mtk_cirq_regoffs_v1 },
45ac01959edcec AngeloGioacchino Del Regno 2022-11-28  291  	{ .compatible = "mediatek,mt8173-cirq", .data = &mtk_cirq_regoffs_v1 },
5c4e0aac0b2a27 AngeloGioacchino Del Regno 2022-11-28  292  	{ .compatible = "mediatek,mt8192-cirq", .data = &mtk_cirq_regoffs_v2 },
45ac01959edcec AngeloGioacchino Del Regno 2022-11-28  293  	{ /* sentinel */ }
45ac01959edcec AngeloGioacchino Del Regno 2022-11-28  294  };
45ac01959edcec AngeloGioacchino Del Regno 2022-11-28  295  

:::::: The code at line 288 was first introduced by commit
:::::: 45ac01959edcecfa5d6652c2397d3866e55b0da8 irqchip/irq-mtk-cirq: Move register offsets to const array

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
