Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA20D7E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 02:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719023854; cv=none; b=PNTi8VNPoITAFopGAaE0Ljg++JaRVI6k14hHrqG7XTYKzBrj7Qdxkl1UOUGoUQ8waYZDdHTWdYCcBf0NmzcA/YkwWIwPj+KJ1jCCzjQr17eFxtYXcQB2oS5q2D1w3UP6Rf2x4Vuk8Hs5nKHy/hNn3CNxY2ThxUGQWq5qztPcXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719023854; c=relaxed/simple;
	bh=sINL2Bd1DkswrLiya4XUymyZZC4ADmZ8v35JPzOkUl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNj/zwO9HU1bGCX9HZ0iXMjphdIqagoLmDZgJGygILJNWEHAF9w2f0oxQ7MtMIlYSMEmME3cgo13MwosGT6nyrA9pmWDah6feRgaBMlYiLHF4sjnM37MC1b7MPgoucuL0vFxZwm9t3Ast6nbZa5UQuc7t3WVXaoHwfKSmktydOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LX8C+Z+f; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LX8C+Z+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719023852; x=1750559852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sINL2Bd1DkswrLiya4XUymyZZC4ADmZ8v35JPzOkUl8=;
  b=LX8C+Z+f+E+/4/J2oE9yKelDIx62EMWic2jg1z6koDP6AAOV+X3ot2ld
   nxvLOvi/2CwYkZUfc8BgeOE0sh9GXNf9W1LlvnzpyqeOViuasO7DuRQZn
   FW98mZNYKdB/o7SexhhEZtY0XBT0EbYQCLm5PfbAtnoiA9TpIsVT1rFUA
   qLOLXPLvc8OiV5XusirsRWGzaFFn4f4ke+VjqU7v+/kTzxbKUpjrR3jbj
   1OOZVb1U1fUqxq2tYXz5ezmsKL5aIN4HOCrEViGSCq7AgNqzqj63zIVPF
   mymUivD1SLDhVfr81wLN+a4Q2qjaDjYCtyRBVbriDjoYi2Rj4BdM5u1oV
   g==;
X-CSE-ConnectionGUID: Me/Rbh+6RnONGH6KG+FhYA==
X-CSE-MsgGUID: 4+B9oqFpR56XzqieJwt/Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15903868"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="15903868"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 19:37:31 -0700
X-CSE-ConnectionGUID: +K1vmS3FQa2F2FY7TqJ1EQ==
X-CSE-MsgGUID: 3H7G4MHIQgid4wFHbWnieQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="73509435"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jun 2024 19:37:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKqd6-0009F4-0H;
	Sat, 22 Jun 2024 02:37:28 +0000
Date: Sat, 22 Jun 2024 10:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [broonie-ci:v6_20240619_amergnat_add_audio_support_for_the_mediatek_genio_350_evk_board
 34/34] sound/soc/mediatek/mt8365/mt8365-afe-clk.c:298:5: warning: no
 previous prototype for 'mt8365_afe_hd_engen_enable'
Message-ID: <202406221007.TdiyLY0r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v6_20240619_amergnat_add_audio_support_for_the_mediatek_genio_350_evk_board
head:   bb7947bc00dc3b464cc5ce3db7617d3ef9a9d753
commit: bb7947bc00dc3b464cc5ce3db7617d3ef9a9d753 [34/34] ASoC: mediatek: Add MT8365 support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240622/202406221007.TdiyLY0r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221007.TdiyLY0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221007.TdiyLY0r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/mt8365/mt8365-afe-clk.c:298:5: warning: no previous prototype for 'mt8365_afe_hd_engen_enable' [-Wmissing-prototypes]
     298 | int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8365/mt8365-afe-clk.c:310:5: warning: no previous prototype for 'mt8365_afe_hd_engen_disable' [-Wmissing-prototypes]
     310 | int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:173:6: warning: no previous prototype for 'mt8365_afe_clk_group_44k' [-Wmissing-prototypes]
     173 | bool mt8365_afe_clk_group_44k(int sample_rate)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:499:5: warning: no previous prototype for 'mt8365_afe_fe_startup' [-Wmissing-prototypes]
     499 | int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
         |     ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c: In function 'mt8365_afe_fe_hw_free':
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:654:36: warning: unused variable 'memif' [-Wunused-variable]
     654 |         struct mtk_base_afe_memif *memif = &afe->memif[dai_id];
         |                                    ^~~~~
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c: At top level:
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:717:5: warning: no previous prototype for 'mt8365_afe_fe_trigger' [-Wmissing-prototypes]
     717 | int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
         |     ^~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:134:12: warning: 'mt8365_dai_load_dmic_iir_coeff_table' defined but not used [-Wunused-function]
     134 | static int mt8365_dai_load_dmic_iir_coeff_table(struct mtk_base_afe *afe)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from sound/soc/mediatek/mt8365/mt8365-afe-common.h:16,
                    from sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:14:
>> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:785:33: warning: 'mt8365_i2s_enum' defined but not used [-Wunused-const-variable=]
     785 | static SOC_ENUM_SINGLE_EXT_DECL(mt8365_i2s_enum, mt8365_i2s_hd_str);
         |                                 ^~~~~~~~~~~~~~~
   include/sound/soc.h:411:31: note: in definition of macro 'SOC_ENUM_SINGLE_EXT_DECL'
     411 |         const struct soc_enum name = SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(xtexts), xtexts)
         |                               ^~~~
--
   sound/soc/mediatek/mt8365/mt8365-mt6357.c: In function 'mt8365_mt6357_dev_probe':
>> sound/soc/mediatek/mt8365/mt8365-mt6357.c:295:13: warning: unused variable 'i' [-Wunused-variable]
     295 |         int i, ret;
         |             ^
>> sound/soc/mediatek/mt8365/mt8365-mt6357.c:293:29: warning: unused variable 'platform_node' [-Wunused-variable]
     293 |         struct device_node *platform_node;
         |                             ^~~~~~~~~~~~~


vim +/mt8365_afe_hd_engen_enable +298 sound/soc/mediatek/mt8365/mt8365-afe-clk.c

04f09b11a08d4f Alexandre Mergnat 2024-06-19  297  
04f09b11a08d4f Alexandre Mergnat 2024-06-19 @298  int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
04f09b11a08d4f Alexandre Mergnat 2024-06-19  299  {
04f09b11a08d4f Alexandre Mergnat 2024-06-19  300  	if (apll1)
04f09b11a08d4f Alexandre Mergnat 2024-06-19  301  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
04f09b11a08d4f Alexandre Mergnat 2024-06-19  302  				   AFE_22M_PLL_EN, AFE_22M_PLL_EN);
04f09b11a08d4f Alexandre Mergnat 2024-06-19  303  	else
04f09b11a08d4f Alexandre Mergnat 2024-06-19  304  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
04f09b11a08d4f Alexandre Mergnat 2024-06-19  305  				   AFE_24M_PLL_EN, AFE_24M_PLL_EN);
04f09b11a08d4f Alexandre Mergnat 2024-06-19  306  
04f09b11a08d4f Alexandre Mergnat 2024-06-19  307  	return 0;
04f09b11a08d4f Alexandre Mergnat 2024-06-19  308  }
04f09b11a08d4f Alexandre Mergnat 2024-06-19  309  
04f09b11a08d4f Alexandre Mergnat 2024-06-19 @310  int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
04f09b11a08d4f Alexandre Mergnat 2024-06-19  311  {
04f09b11a08d4f Alexandre Mergnat 2024-06-19  312  	if (apll1)
04f09b11a08d4f Alexandre Mergnat 2024-06-19  313  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
04f09b11a08d4f Alexandre Mergnat 2024-06-19  314  				   AFE_22M_PLL_EN, ~AFE_22M_PLL_EN);
04f09b11a08d4f Alexandre Mergnat 2024-06-19  315  	else
04f09b11a08d4f Alexandre Mergnat 2024-06-19  316  		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
04f09b11a08d4f Alexandre Mergnat 2024-06-19  317  				   AFE_24M_PLL_EN, ~AFE_24M_PLL_EN);
04f09b11a08d4f Alexandre Mergnat 2024-06-19  318  
04f09b11a08d4f Alexandre Mergnat 2024-06-19  319  	return 0;
04f09b11a08d4f Alexandre Mergnat 2024-06-19  320  }
04f09b11a08d4f Alexandre Mergnat 2024-06-19  321  

:::::: The code at line 298 was first introduced by commit
:::::: 04f09b11a08d4fc785f0cbea3ea1dfa20bb9df2a ASoC: mediatek: mt8365: Add audio clock control support

:::::: TO: Alexandre Mergnat <amergnat@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
