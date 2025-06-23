Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859691D5175
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 05:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750657244; cv=none; b=YJXdn3E+RjGX4ZqqS/fdTpv0P/srVBWWFBpMDTTSNPWA+ioL9dzFeOUAviibJ9KKogfNWdPQaSyMUfZguS+m502QsgnGlLIwoBoL2JaP3lFBAEeuEkbTRoDkAVnYzI9QWoCm8ZHCUWJwH/SZ+7Q+5LZ8dm+dCsA5ZuZpmbXoSbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750657244; c=relaxed/simple;
	bh=dPy8WIyQcoTIE5MwRK5ugvTzx69g7v3tR6Im0I/SXyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Th5USq0mEjwyoIrI118BaEUkTCmpGiEfdbI6Rgh8v2XAZWcdBtfBXqdyIVUlPicb2T2Xf4KEcq4vkM07n2y28mSeb9EurnJmbbzSkvFCGte8/fW7yCxpuszEoxn1dnpkoEfQXrPMzXHZSTGFl5eiN7gIuzLP295S4fjB8x8dd88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJF80BoL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJF80BoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750657241; x=1782193241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPy8WIyQcoTIE5MwRK5ugvTzx69g7v3tR6Im0I/SXyM=;
  b=oJF80BoLXjNwNyg+0dsWTe6kko1BlUis7pVsI+14ciWr6R4k9Y0x80TQ
   t/S9syRw9QwBHpd3QOaf/3RO/SmGgJg6Ivrm+7xYX2x3OiMny3Dw7bc7m
   IN8usdNC2+ACrqHg4w9C5o6HrCxv+H/zAtaIpqMfsryTvNDvaJiyuKAhm
   GRcPFU9eU5Lpq0LMgfC0HypTleAMgy9AQyf95k8PL8VLZPuiN8r+XyNYA
   31u8T1A0jJpf3wUFLgXKR6Se9dChw/gCnfDhhxFCMLGz181pbBF2L6LEx
   cyac+L/yuk5MfL4xA/um33DL6LFtAgm8V0HNQvPRfDyWphWFvwzmF5KbX
   w==;
X-CSE-ConnectionGUID: BBD84JO+RmeorVZ9TMh3Vg==
X-CSE-MsgGUID: XRXvMFPORy+y1S13M1ZeQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52072338"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52072338"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 22:40:34 -0700
X-CSE-ConnectionGUID: qBfmst5VRpOSO6kap/ImXw==
X-CSE-MsgGUID: MbFKYp19SvSBpH5RMz7DUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155886878"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jun 2025 22:40:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTZul-000Niw-0k;
	Mon, 23 Jun 2025 05:40:19 +0000
Date: Mon, 23 Jun 2025 13:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-ci:filefSlNCG 38/39] sound/soc/sdca/sdca_hid.c: warning:
 EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
Message-ID: <202506231304.86cssphq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filefSlNCG
head:   c4ca928a6db1593802cd945f075a7e21dd0430c1
commit: ac558015dfd803626622bd0ba9645d58a3ed16b1 [38/39] ASoC: SDCA: add a HID device for HIDE entity
config: s390-randconfig-001-20250623 (https://download.01.org/0day-ci/archive/20250623/202506231304.86cssphq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231304.86cssphq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231304.86cssphq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/wcd937x-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd938x-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd939x-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wl1273.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8350.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8731.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8804.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8903.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8962.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8994.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8996.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm_adsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm_hubs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/fsl_asrc_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/fsl_asrc_m2m.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/fsl_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/imx-audmux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/imx-pcm-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/imx-pcm-fiq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/lpc3xxx-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/mpc5200_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/generic/audio-graph-card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/generic/audio-graph-card2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/generic/simple-card-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/atom/sst-mfld-platform-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/atom/sst/sst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/atom/sst/sst_pvt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/hda_dsp_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_board_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_cirrus_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_maxim_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_nuvoton_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_realtek_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-adl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-arl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-bxt-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-byt-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cfl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cht-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cml-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cnl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-ehl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-glk-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-hda-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-icl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-jsl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-kbl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-lnl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-mtl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-ptl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-rpl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-skl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-ssp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-tgl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/loongson/loongson_i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-afe-fe-dai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-afe-platform-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-dai-adda-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-dsp-sof-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-soundcard-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8186/mt8186-afe-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8186/mt8186-dai-i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8186/mt8186-mt6366-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8188/mt8188-afe-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8192/mt8192-afe-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8192/mt8192-dai-i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8195/mt8195-afe-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/axg-fifo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/axg-tdm-formatter.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/axg-tdm-interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/meson-card-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/meson-codec-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mxs/mxs-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mxs/mxs-saif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/lpass-cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/lpass-hdmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/audioreach.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6adm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6afe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6apm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6asm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6dsp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6prm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6routing.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/usb_offload_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/renesas/siu_pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/samsung/dmaengine.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/samsung/idma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_asoc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_functions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> sound/soc/sdca/sdca_hid.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_cs42l42.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_cs42l43.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_cs_amp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_dmic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_maxim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt5682.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt700.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt711.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_amp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_dmic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-component.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-dai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-dapm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-generic-dmaengine-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-link.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-usb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-probes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-stream.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp63.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp70.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/rembrandt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/renoir.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/vangogh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/fw-file-profile.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/imx/imx-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/atom.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/cnl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-codec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-common-ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-ctrl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-dai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-dsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-mlink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-probes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-sdw-bpt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-stream.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/lnl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/mtl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/ptl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/skl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/iomem-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc3.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc4-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/mediatek/mtk-adsp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/sof-acpi-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/sof-audio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/sof-client.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/sof-of-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/sof-pci-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/sof-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/xtensa/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/spear/spear_pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sprd/sprd-mcdt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sti/uniperif_player.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sti/uniperif_reader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sunxi/sun8i-adda-pr-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/tegra/tegra30_ahub.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/tegra/tegra_pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/ti/edma-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/ti/omap-mcbsp-st.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/ti/omap-mcpdm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/ti/sdma-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/ti/udma-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/uniphier/aio-cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/uniphier/aio-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/ux500/ux500_pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/sound_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
