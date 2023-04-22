Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B76AB5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682185912; x=1713721912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fFQbQCarcA9xP377KJJxvj+drERrrHtOwZZWiEfHPxg=;
  b=WOWwyRsQOydLuBFBikf8KJvGEZSoTlrLu6wJSArxBlK+9+c6Wx0/bExX
   4Kh/SaeJVs+zMy7O/oV47AIHEVuZyAV3+swr8UTQ9aXzq7pAM3rEtI9l7
   pnLIz/nLx55NwenZCYZAvvXO2FWaXeH8/lZTfxdXePQgQF2iwWkXBxoCd
   sivl+0VMSryMu2o6SfZPmax38TDAHMWfS3/XbgBjd/eHK2DMQ6JpD885k
   zirkmzi0f30YMFyfFMxFW4ht1tDKNppVsVhHAbmwPBLsbwHxSJpYFpvqa
   dgI3I25EC4fEGClG20sF7THHqar15TIr9VKcNDINfa/XP1G0ToHMQhDWE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="348092879"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="348092879"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 10:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="695258606"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="695258606"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2023 10:51:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqHOn-000hQ0-1W;
	Sat, 22 Apr 2023 17:51:49 +0000
Date: Sun, 23 Apr 2023 01:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Andrew F. Davis" <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Curtis Malainey <cujomalainey@chromium.org>,
	Kamal Ap <kamal.ap@intel.com>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 6778/9999]
 sound/soc/codecs/tlv320aic32x4.c:688:52: sparse: sparse: cast truncates bits
 from constant value (ffffffffc becomes fffffffc)
Message-ID: <202304230111.6qsP09d2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 9713fc5e56b6e31fad9341ae15582bc0a3ce7602 [6778/9999] UPSTREAM: ASoC: tlv320aic32x4: Use snd_soc_update_bits() in aic32x4_hw_params()
config: m68k-randconfig-s051-20230416 (https://download.01.org/0day-ci/archive/20230423/202304230111.6qsP09d2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/9713fc5e56b6e31fad9341ae15582bc0a3ce7602
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 9713fc5e56b6e31fad9341ae15582bc0a3ce7602
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230111.6qsP09d2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/codecs/tlv320aic32x4.c:661:58: sparse: sparse: cast truncates bits from constant value (fffffffffc becomes fffffffc)
   sound/soc/codecs/tlv320aic32x4.c:664:29: sparse: sparse: cast truncates bits from constant value (ffffffffff becomes ffffffff)
>> sound/soc/codecs/tlv320aic32x4.c:688:52: sparse: sparse: cast truncates bits from constant value (ffffffffc becomes fffffffc)
>> sound/soc/codecs/tlv320aic32x4.c:691:52: sparse: sparse: cast truncates bits from constant value (3ffffffff becomes ffffffff)
   sound/soc/codecs/tlv320aic32x4.c:694:52: sparse: sparse: cast truncates bits from constant value (3ffffffff becomes ffffffff)
>> sound/soc/codecs/tlv320aic32x4.c:698:51: sparse: sparse: cast truncates bits from constant value (fffffffff becomes ffffffff)
>> sound/soc/codecs/tlv320aic32x4.c:701:51: sparse: sparse: cast truncates bits from constant value (7ffffffff0 becomes fffffff0)
>> sound/soc/codecs/tlv320aic32x4.c:713:29: sparse: sparse: cast truncates bits from constant value (7fffffffff becomes ffffffff)
   sound/soc/codecs/tlv320aic32x4.c:717:29: sparse: sparse: cast truncates bits from constant value (7fffffffff becomes ffffffff)
   sound/soc/codecs/tlv320aic32x4.c:725:29: sparse: sparse: cast truncates bits from constant value (7fffffffff becomes ffffffff)
   sound/soc/codecs/tlv320aic32x4.c:729:29: sparse: sparse: cast truncates bits from constant value (7fffffffff becomes ffffffff)
   sound/soc/codecs/tlv320aic32x4.c:736:29: sparse: sparse: cast truncates bits from constant value (7fffffffff becomes ffffffff)
>> sound/soc/codecs/tlv320aic32x4.c:757:29: sparse: sparse: cast truncates bits from constant value (3ffffffff0 becomes fffffff0)
   sound/soc/codecs/tlv320aic32x4.c:768:29: sparse: sparse: cast truncates bits from constant value (3ffffffffc becomes fffffffc)
   sound/soc/codecs/tlv320aic32x4.c: note: in included file (through arch/m68k/include/asm/gpio.h, include/linux/gpio.h):
   arch/m68k/include/asm/mcfgpio.h:259:39: sparse: sparse: non size-preserving integer to pointer cast
   arch/m68k/include/asm/mcfgpio.h:259:39: sparse: sparse: non size-preserving integer to pointer cast
   sound/soc/codecs/tlv320aic32x4.c: note: in included file (through include/linux/gpio.h):
   arch/m68k/include/asm/gpio.h:55:33: sparse: sparse: non size-preserving integer to pointer cast
   arch/m68k/include/asm/gpio.h:58:33: sparse: sparse: non size-preserving integer to pointer cast

vim +688 sound/soc/codecs/tlv320aic32x4.c

   670	
   671	static int aic32x4_hw_params(struct snd_pcm_substream *substream,
   672				     struct snd_pcm_hw_params *params,
   673				     struct snd_soc_dai *dai)
   674	{
   675		struct snd_soc_codec *codec = dai->codec;
   676		struct aic32x4_priv *aic32x4 = snd_soc_codec_get_drvdata(codec);
   677		u8 iface1_reg = 0;
   678		u8 dacsetup_reg = 0;
   679		int i;
   680	
   681		i = aic32x4_get_divs(aic32x4->sysclk, params_rate(params));
   682		if (i < 0) {
   683			printk(KERN_ERR "aic32x4: sampling rate not supported\n");
   684			return i;
   685		}
   686	
   687		/* MCLK as PLL_CLKIN */
 > 688		snd_soc_update_bits(codec, AIC32X4_CLKMUX, AIC32X4_PLL_CLKIN_MASK,
   689				    AIC32X4_PLL_CLKIN_MCLK << AIC32X4_PLL_CLKIN_SHIFT);
   690		/* PLL as CODEC_CLKIN */
 > 691		snd_soc_update_bits(codec, AIC32X4_CLKMUX, AIC32X4_CODEC_CLKIN_MASK,
   692				    AIC32X4_CODEC_CLKIN_PLL << AIC32X4_CODEC_CLKIN_SHIFT);
   693		/* DAC_MOD_CLK as BDIV_CLKIN */
   694		snd_soc_update_bits(codec, AIC32X4_IFACE3, AIC32X4_BDIVCLK_MASK,
   695				    AIC32X4_DACMOD2BCLK << AIC32X4_BDIVCLK_SHIFT);
   696	
   697		/* We will fix R value to 1 and will make P & J=K.D as variable */
 > 698		snd_soc_update_bits(codec, AIC32X4_PLLPR, AIC32X4_PLL_R_MASK, 0x01);
   699	
   700		/* PLL P value */
 > 701		snd_soc_update_bits(codec, AIC32X4_PLLPR, AIC32X4_PLL_P_MASK,
   702				    aic32x4_divs[i].p_val << AIC32X4_PLL_P_SHIFT);
   703	
   704		/* PLL J value */
   705		snd_soc_write(codec, AIC32X4_PLLJ, aic32x4_divs[i].pll_j);
   706	
   707		/* PLL D value */
   708		snd_soc_write(codec, AIC32X4_PLLDMSB, (aic32x4_divs[i].pll_d >> 8));
   709		snd_soc_write(codec, AIC32X4_PLLDLSB, (aic32x4_divs[i].pll_d & 0xff));
   710	
   711		/* NDAC divider value */
   712		snd_soc_update_bits(codec, AIC32X4_NDAC,
 > 713				    AIC32X4_NDAC_MASK, aic32x4_divs[i].ndac);
   714	
   715		/* MDAC divider value */
   716		snd_soc_update_bits(codec, AIC32X4_MDAC,
   717				    AIC32X4_MDAC_MASK, aic32x4_divs[i].mdac);
   718	
   719		/* DOSR MSB & LSB values */
   720		snd_soc_write(codec, AIC32X4_DOSRMSB, aic32x4_divs[i].dosr >> 8);
   721		snd_soc_write(codec, AIC32X4_DOSRLSB, (aic32x4_divs[i].dosr & 0xff));
   722	
   723		/* NADC divider value */
   724		snd_soc_update_bits(codec, AIC32X4_NADC,
   725				    AIC32X4_NADC_MASK, aic32x4_divs[i].nadc);
   726	
   727		/* MADC divider value */
   728		snd_soc_update_bits(codec, AIC32X4_MADC,
   729				    AIC32X4_MADC_MASK, aic32x4_divs[i].madc);
   730	
   731		/* AOSR value */
   732		snd_soc_write(codec, AIC32X4_AOSR, aic32x4_divs[i].aosr);
   733	
   734		/* BCLK N divider */
   735		snd_soc_update_bits(codec, AIC32X4_BCLKN,
   736				    AIC32X4_BCLK_MASK, aic32x4_divs[i].blck_N);
   737	
   738		switch (params_width(params)) {
   739		case 16:
   740			iface1_reg |= (AIC32X4_WORD_LEN_16BITS <<
   741				       AIC32X4_IFACE1_DATALEN_SHIFT);
   742			break;
   743		case 20:
   744			iface1_reg |= (AIC32X4_WORD_LEN_20BITS <<
   745				       AIC32X4_IFACE1_DATALEN_SHIFT);
   746			break;
   747		case 24:
   748			iface1_reg |= (AIC32X4_WORD_LEN_24BITS <<
   749				       AIC32X4_IFACE1_DATALEN_SHIFT);
   750			break;
   751		case 32:
   752			iface1_reg |= (AIC32X4_WORD_LEN_32BITS <<
   753				       AIC32X4_IFACE1_DATALEN_SHIFT);
   754			break;
   755		}
   756		snd_soc_update_bits(codec, AIC32X4_IFACE1,
 > 757				    AIC32X4_IFACE1_DATALEN_MASK, iface1_reg);
   758	
   759		if (params_channels(params) == 1) {
   760			dacsetup_reg = AIC32X4_RDAC2LCHN | AIC32X4_LDAC2LCHN;
   761		} else {
   762			if (aic32x4->swapdacs)
   763				dacsetup_reg = AIC32X4_RDAC2LCHN | AIC32X4_LDAC2RCHN;
   764			else
   765				dacsetup_reg = AIC32X4_LDAC2LCHN | AIC32X4_RDAC2RCHN;
   766		}
   767		snd_soc_update_bits(codec, AIC32X4_DACSETUP,
   768				    AIC32X4_DAC_CHAN_MASK, dacsetup_reg);
   769	
   770		return 0;
   771	}
   772	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
