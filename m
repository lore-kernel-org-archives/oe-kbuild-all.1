Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C06138
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682180331; x=1713716331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TRljkc4VCi4Q/oOsILReVt+mNJ23V1cbuuW8VR6ToIc=;
  b=T0Rom8NNwLxJQCkhwXUzTf2LQmfDTJDsdTTXhlYKjhWT7YazrmCZ6X19
   mb717F4+brlazOHzlqKRrfJhXbafzkEOqbJwBAIM0JB7dRk+DTDgE8MPu
   AAqvo393crqYb5jZQSM6FtyXr3IpfgNmC+xjjbXIoW3FWEEe7Kzp0T9S3
   OOz03oFcn+Ufa/UYMvQ7jPo7msTM12XpCkNG1FOhB50dpTaT7A4ejCGT+
   6ZHZXKsvPazl0RKX9Qusk5FGH/xx1/Lingr3aXV18YeEyiSPKeQ5I8QTn
   T6FGci9CAFauBaPHlUVv1Hv9a3td2O+EhOqZwmebh85B523Psgm6XlHVk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="411451394"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="411451394"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 09:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="757206165"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="757206165"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2023 09:18:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqFwm-000hO8-1H;
	Sat, 22 Apr 2023 16:18:48 +0000
Date: Sun, 23 Apr 2023 00:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Andrew F. Davis" <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Curtis Malainey <cujomalainey@chromium.org>,
	Kamal Ap <kamal.ap@intel.com>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 6776/9999]
 sound/soc/codecs/tlv320aic32x4.c:661:58: sparse: sparse: cast truncates bits
 from constant value (fffffffffc becomes fffffffc)
Message-ID: <202304230021.bBgwrc3T-lkp@intel.com>
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
commit: 5ba26a77c50670c9f02e3a83838a65a3b8d02225 [6776/9999] UPSTREAM: ASoC: tlv320aic32x4: Use BIT and GENMASK for bit field definitions
config: m68k-randconfig-s051-20230416 (https://download.01.org/0day-ci/archive/20230423/202304230021.bBgwrc3T-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/5ba26a77c50670c9f02e3a83838a65a3b8d02225
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 5ba26a77c50670c9f02e3a83838a65a3b8d02225
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230021.bBgwrc3T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/codecs/tlv320aic32x4.c:741:53: sparse: sparse: undefined identifier 'AIC32X4_DOSRMSB_SHIFT'
   sound/soc/codecs/tlv320aic32x4.c:744:53: sparse: sparse: undefined identifier 'AIC32X4_DOSRMSB_SHIFT'
   sound/soc/codecs/tlv320aic32x4.c:747:53: sparse: sparse: undefined identifier 'AIC32X4_DOSRMSB_SHIFT'
>> sound/soc/codecs/tlv320aic32x4.c:661:58: sparse: sparse: cast truncates bits from constant value (fffffffffc becomes fffffffc)
>> sound/soc/codecs/tlv320aic32x4.c:664:29: sparse: sparse: cast truncates bits from constant value (ffffffffff becomes ffffffff)
>> sound/soc/codecs/tlv320aic32x4.c:760:54: sparse: sparse: cast truncates bits from constant value (3ffffffffc becomes fffffffc)
   sound/soc/codecs/tlv320aic32x4.c: note: in included file (through arch/m68k/include/asm/gpio.h, include/linux/gpio.h):
   arch/m68k/include/asm/mcfgpio.h:259:39: sparse: sparse: non size-preserving integer to pointer cast
   arch/m68k/include/asm/mcfgpio.h:259:39: sparse: sparse: non size-preserving integer to pointer cast
   sound/soc/codecs/tlv320aic32x4.c: note: in included file (through include/linux/gpio.h):
   arch/m68k/include/asm/gpio.h:55:33: sparse: sparse: non size-preserving integer to pointer cast
   arch/m68k/include/asm/gpio.h:58:33: sparse: sparse: non size-preserving integer to pointer cast
   sound/soc/codecs/tlv320aic32x4.c: In function 'aic32x4_hw_params':
   sound/soc/codecs/tlv320aic32x4.c:741:39: error: 'AIC32X4_DOSRMSB_SHIFT' undeclared (first use in this function); did you mean 'AIC32X4_DOSRMSB'?
      data |= (AIC32X4_WORD_LEN_20BITS << AIC32X4_DOSRMSB_SHIFT);
                                          ^~~~~~~~~~~~~~~~~~~~~
                                          AIC32X4_DOSRMSB
   sound/soc/codecs/tlv320aic32x4.c:741:39: note: each undeclared identifier is reported only once for each function it appears in

vim +661 sound/soc/codecs/tlv320aic32x4.c

1d471cd1261a44 Javier Martin   2011-03-02  613  
1d471cd1261a44 Javier Martin   2011-03-02  614  static int aic32x4_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
1d471cd1261a44 Javier Martin   2011-03-02  615  {
1d471cd1261a44 Javier Martin   2011-03-02  616  	struct snd_soc_codec *codec = codec_dai->codec;
199027dfd0e85d Andrew F. Davis 2017-12-12  617  	u8 iface_reg_1 = 0;
199027dfd0e85d Andrew F. Davis 2017-12-12  618  	u8 iface_reg_2 = 0;
199027dfd0e85d Andrew F. Davis 2017-12-12  619  	u8 iface_reg_3 = 0;
1d471cd1261a44 Javier Martin   2011-03-02  620  
1d471cd1261a44 Javier Martin   2011-03-02  621  	/* set master/slave audio interface */
1d471cd1261a44 Javier Martin   2011-03-02  622  	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
1d471cd1261a44 Javier Martin   2011-03-02  623  	case SND_SOC_DAIFMT_CBM_CFM:
1d471cd1261a44 Javier Martin   2011-03-02  624  		iface_reg_1 |= AIC32X4_BCLKMASTER | AIC32X4_WCLKMASTER;
1d471cd1261a44 Javier Martin   2011-03-02  625  		break;
1d471cd1261a44 Javier Martin   2011-03-02  626  	case SND_SOC_DAIFMT_CBS_CFS:
1d471cd1261a44 Javier Martin   2011-03-02  627  		break;
1d471cd1261a44 Javier Martin   2011-03-02  628  	default:
1d471cd1261a44 Javier Martin   2011-03-02  629  		printk(KERN_ERR "aic32x4: invalid DAI master/slave interface\n");
1d471cd1261a44 Javier Martin   2011-03-02  630  		return -EINVAL;
1d471cd1261a44 Javier Martin   2011-03-02  631  	}
1d471cd1261a44 Javier Martin   2011-03-02  632  
1d471cd1261a44 Javier Martin   2011-03-02  633  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
1d471cd1261a44 Javier Martin   2011-03-02  634  	case SND_SOC_DAIFMT_I2S:
1d471cd1261a44 Javier Martin   2011-03-02  635  		break;
1d471cd1261a44 Javier Martin   2011-03-02  636  	case SND_SOC_DAIFMT_DSP_A:
25e30effee05c2 Andrew F. Davis 2017-12-12  637  		iface_reg_1 |= (AIC32X4_DSP_MODE <<
25e30effee05c2 Andrew F. Davis 2017-12-12  638  				AIC32X4_IFACE1_DATATYPE_SHIFT);
199027dfd0e85d Andrew F. Davis 2017-12-12  639  		iface_reg_3 |= AIC32X4_BCLKINV_MASK; /* invert bit clock */
1d471cd1261a44 Javier Martin   2011-03-02  640  		iface_reg_2 = 0x01; /* add offset 1 */
1d471cd1261a44 Javier Martin   2011-03-02  641  		break;
1d471cd1261a44 Javier Martin   2011-03-02  642  	case SND_SOC_DAIFMT_DSP_B:
25e30effee05c2 Andrew F. Davis 2017-12-12  643  		iface_reg_1 |= (AIC32X4_DSP_MODE <<
25e30effee05c2 Andrew F. Davis 2017-12-12  644  				AIC32X4_IFACE1_DATATYPE_SHIFT);
199027dfd0e85d Andrew F. Davis 2017-12-12  645  		iface_reg_3 |= AIC32X4_BCLKINV_MASK; /* invert bit clock */
1d471cd1261a44 Javier Martin   2011-03-02  646  		break;
1d471cd1261a44 Javier Martin   2011-03-02  647  	case SND_SOC_DAIFMT_RIGHT_J:
25e30effee05c2 Andrew F. Davis 2017-12-12  648  		iface_reg_1 |= (AIC32X4_RIGHT_JUSTIFIED_MODE <<
25e30effee05c2 Andrew F. Davis 2017-12-12  649  				AIC32X4_IFACE1_DATATYPE_SHIFT);
1d471cd1261a44 Javier Martin   2011-03-02  650  		break;
1d471cd1261a44 Javier Martin   2011-03-02  651  	case SND_SOC_DAIFMT_LEFT_J:
25e30effee05c2 Andrew F. Davis 2017-12-12  652  		iface_reg_1 |= (AIC32X4_LEFT_JUSTIFIED_MODE <<
25e30effee05c2 Andrew F. Davis 2017-12-12  653  				AIC32X4_IFACE1_DATATYPE_SHIFT);
1d471cd1261a44 Javier Martin   2011-03-02  654  		break;
1d471cd1261a44 Javier Martin   2011-03-02  655  	default:
1d471cd1261a44 Javier Martin   2011-03-02  656  		printk(KERN_ERR "aic32x4: invalid DAI interface format\n");
1d471cd1261a44 Javier Martin   2011-03-02  657  		return -EINVAL;
1d471cd1261a44 Javier Martin   2011-03-02  658  	}
1d471cd1261a44 Javier Martin   2011-03-02  659  
199027dfd0e85d Andrew F. Davis 2017-12-12  660  	snd_soc_update_bits(codec, AIC32X4_IFACE1,
199027dfd0e85d Andrew F. Davis 2017-12-12 @661  			    AIC32X4_IFACE1_DATATYPE_MASK |
199027dfd0e85d Andrew F. Davis 2017-12-12  662  			    AIC32X4_IFACE1_MASTER_MASK, iface_reg_1);
199027dfd0e85d Andrew F. Davis 2017-12-12  663  	snd_soc_update_bits(codec, AIC32X4_IFACE2,
199027dfd0e85d Andrew F. Davis 2017-12-12 @664  			    AIC32X4_DATA_OFFSET_MASK, iface_reg_2);
199027dfd0e85d Andrew F. Davis 2017-12-12  665  	snd_soc_update_bits(codec, AIC32X4_IFACE3,
199027dfd0e85d Andrew F. Davis 2017-12-12  666  			    AIC32X4_BCLKINV_MASK, iface_reg_3);
199027dfd0e85d Andrew F. Davis 2017-12-12  667  
1d471cd1261a44 Javier Martin   2011-03-02  668  	return 0;
1d471cd1261a44 Javier Martin   2011-03-02  669  }
1d471cd1261a44 Javier Martin   2011-03-02  670  
1d471cd1261a44 Javier Martin   2011-03-02  671  static int aic32x4_hw_params(struct snd_pcm_substream *substream,
1d471cd1261a44 Javier Martin   2011-03-02  672  			     struct snd_pcm_hw_params *params,
1d471cd1261a44 Javier Martin   2011-03-02  673  			     struct snd_soc_dai *dai)
1d471cd1261a44 Javier Martin   2011-03-02  674  {
1d471cd1261a44 Javier Martin   2011-03-02  675  	struct snd_soc_codec *codec = dai->codec;
1d471cd1261a44 Javier Martin   2011-03-02  676  	struct aic32x4_priv *aic32x4 = snd_soc_codec_get_drvdata(codec);
1d471cd1261a44 Javier Martin   2011-03-02  677  	u8 data;
1d471cd1261a44 Javier Martin   2011-03-02  678  	int i;
1d471cd1261a44 Javier Martin   2011-03-02  679  
1d471cd1261a44 Javier Martin   2011-03-02  680  	i = aic32x4_get_divs(aic32x4->sysclk, params_rate(params));
1d471cd1261a44 Javier Martin   2011-03-02  681  	if (i < 0) {
1d471cd1261a44 Javier Martin   2011-03-02  682  		printk(KERN_ERR "aic32x4: sampling rate not supported\n");
1d471cd1261a44 Javier Martin   2011-03-02  683  		return i;
1d471cd1261a44 Javier Martin   2011-03-02  684  	}
1d471cd1261a44 Javier Martin   2011-03-02  685  
1d471cd1261a44 Javier Martin   2011-03-02  686  	/* Use PLL as CODEC_CLKIN and DAC_MOD_CLK as BDIV_CLKIN */
5ba26a77c50670 Andrew F. Davis 2017-12-12  687  	snd_soc_write(codec, AIC32X4_CLKMUX, AIC32X4_CODEC_CLKIN_PLL);
1d471cd1261a44 Javier Martin   2011-03-02  688  	snd_soc_write(codec, AIC32X4_IFACE3, AIC32X4_DACMOD2BCLK);
1d471cd1261a44 Javier Martin   2011-03-02  689  
1d471cd1261a44 Javier Martin   2011-03-02  690  	/* We will fix R value to 1 and will make P & J=K.D as varialble */
1d471cd1261a44 Javier Martin   2011-03-02  691  	data = snd_soc_read(codec, AIC32X4_PLLPR);
1d471cd1261a44 Javier Martin   2011-03-02  692  	data &= ~(7 << 4);
1d471cd1261a44 Javier Martin   2011-03-02  693  	snd_soc_write(codec, AIC32X4_PLLPR,
1d471cd1261a44 Javier Martin   2011-03-02  694  		      (data | (aic32x4_divs[i].p_val << 4) | 0x01));
1d471cd1261a44 Javier Martin   2011-03-02  695  
1d471cd1261a44 Javier Martin   2011-03-02  696  	snd_soc_write(codec, AIC32X4_PLLJ, aic32x4_divs[i].pll_j);
1d471cd1261a44 Javier Martin   2011-03-02  697  
1d471cd1261a44 Javier Martin   2011-03-02  698  	snd_soc_write(codec, AIC32X4_PLLDMSB, (aic32x4_divs[i].pll_d >> 8));
1d471cd1261a44 Javier Martin   2011-03-02  699  	snd_soc_write(codec, AIC32X4_PLLDLSB,
1d471cd1261a44 Javier Martin   2011-03-02  700  		      (aic32x4_divs[i].pll_d & 0xff));
1d471cd1261a44 Javier Martin   2011-03-02  701  
1d471cd1261a44 Javier Martin   2011-03-02  702  	/* NDAC divider value */
1d471cd1261a44 Javier Martin   2011-03-02  703  	data = snd_soc_read(codec, AIC32X4_NDAC);
1d471cd1261a44 Javier Martin   2011-03-02  704  	data &= ~(0x7f);
1d471cd1261a44 Javier Martin   2011-03-02  705  	snd_soc_write(codec, AIC32X4_NDAC, data | aic32x4_divs[i].ndac);
1d471cd1261a44 Javier Martin   2011-03-02  706  
1d471cd1261a44 Javier Martin   2011-03-02  707  	/* MDAC divider value */
1d471cd1261a44 Javier Martin   2011-03-02  708  	data = snd_soc_read(codec, AIC32X4_MDAC);
1d471cd1261a44 Javier Martin   2011-03-02  709  	data &= ~(0x7f);
1d471cd1261a44 Javier Martin   2011-03-02  710  	snd_soc_write(codec, AIC32X4_MDAC, data | aic32x4_divs[i].mdac);
1d471cd1261a44 Javier Martin   2011-03-02  711  
1d471cd1261a44 Javier Martin   2011-03-02  712  	/* DOSR MSB & LSB values */
1d471cd1261a44 Javier Martin   2011-03-02  713  	snd_soc_write(codec, AIC32X4_DOSRMSB, aic32x4_divs[i].dosr >> 8);
1d471cd1261a44 Javier Martin   2011-03-02  714  	snd_soc_write(codec, AIC32X4_DOSRLSB,
1d471cd1261a44 Javier Martin   2011-03-02  715  		      (aic32x4_divs[i].dosr & 0xff));
1d471cd1261a44 Javier Martin   2011-03-02  716  
1d471cd1261a44 Javier Martin   2011-03-02  717  	/* NADC divider value */
1d471cd1261a44 Javier Martin   2011-03-02  718  	data = snd_soc_read(codec, AIC32X4_NADC);
1d471cd1261a44 Javier Martin   2011-03-02  719  	data &= ~(0x7f);
1d471cd1261a44 Javier Martin   2011-03-02  720  	snd_soc_write(codec, AIC32X4_NADC, data | aic32x4_divs[i].nadc);
1d471cd1261a44 Javier Martin   2011-03-02  721  
1d471cd1261a44 Javier Martin   2011-03-02  722  	/* MADC divider value */
1d471cd1261a44 Javier Martin   2011-03-02  723  	data = snd_soc_read(codec, AIC32X4_MADC);
1d471cd1261a44 Javier Martin   2011-03-02  724  	data &= ~(0x7f);
1d471cd1261a44 Javier Martin   2011-03-02  725  	snd_soc_write(codec, AIC32X4_MADC, data | aic32x4_divs[i].madc);
1d471cd1261a44 Javier Martin   2011-03-02  726  
1d471cd1261a44 Javier Martin   2011-03-02  727  	/* AOSR value */
1d471cd1261a44 Javier Martin   2011-03-02  728  	snd_soc_write(codec, AIC32X4_AOSR, aic32x4_divs[i].aosr);
1d471cd1261a44 Javier Martin   2011-03-02  729  
1d471cd1261a44 Javier Martin   2011-03-02  730  	/* BCLK N divider */
1d471cd1261a44 Javier Martin   2011-03-02  731  	data = snd_soc_read(codec, AIC32X4_BCLKN);
1d471cd1261a44 Javier Martin   2011-03-02  732  	data &= ~(0x7f);
1d471cd1261a44 Javier Martin   2011-03-02  733  	snd_soc_write(codec, AIC32X4_BCLKN, data | aic32x4_divs[i].blck_N);
1d471cd1261a44 Javier Martin   2011-03-02  734  
1d471cd1261a44 Javier Martin   2011-03-02  735  	data = snd_soc_read(codec, AIC32X4_IFACE1);
1d471cd1261a44 Javier Martin   2011-03-02  736  	data = data & ~(3 << 4);
bd8a5711633686 Mark Brown      2014-07-31  737  	switch (params_width(params)) {
bd8a5711633686 Mark Brown      2014-07-31  738  	case 16:
1d471cd1261a44 Javier Martin   2011-03-02  739  		break;
bd8a5711633686 Mark Brown      2014-07-31  740  	case 20:
1d471cd1261a44 Javier Martin   2011-03-02  741  		data |= (AIC32X4_WORD_LEN_20BITS << AIC32X4_DOSRMSB_SHIFT);
1d471cd1261a44 Javier Martin   2011-03-02  742  		break;
bd8a5711633686 Mark Brown      2014-07-31  743  	case 24:
1d471cd1261a44 Javier Martin   2011-03-02  744  		data |= (AIC32X4_WORD_LEN_24BITS << AIC32X4_DOSRMSB_SHIFT);
1d471cd1261a44 Javier Martin   2011-03-02  745  		break;
bd8a5711633686 Mark Brown      2014-07-31  746  	case 32:
1d471cd1261a44 Javier Martin   2011-03-02  747  		data |= (AIC32X4_WORD_LEN_32BITS << AIC32X4_DOSRMSB_SHIFT);
1d471cd1261a44 Javier Martin   2011-03-02  748  		break;
1d471cd1261a44 Javier Martin   2011-03-02  749  	}
1d471cd1261a44 Javier Martin   2011-03-02  750  	snd_soc_write(codec, AIC32X4_IFACE1, data);
1d471cd1261a44 Javier Martin   2011-03-02  751  
b44aa40f875b06 Markus Pargmann 2014-01-27  752  	if (params_channels(params) == 1) {
b44aa40f875b06 Markus Pargmann 2014-01-27  753  		data = AIC32X4_RDAC2LCHN | AIC32X4_LDAC2LCHN;
b44aa40f875b06 Markus Pargmann 2014-01-27  754  	} else {
b44aa40f875b06 Markus Pargmann 2014-01-27  755  		if (aic32x4->swapdacs)
b44aa40f875b06 Markus Pargmann 2014-01-27  756  			data = AIC32X4_RDAC2LCHN | AIC32X4_LDAC2RCHN;
b44aa40f875b06 Markus Pargmann 2014-01-27  757  		else
b44aa40f875b06 Markus Pargmann 2014-01-27  758  			data = AIC32X4_LDAC2LCHN | AIC32X4_RDAC2RCHN;
b44aa40f875b06 Markus Pargmann 2014-01-27  759  	}
b44aa40f875b06 Markus Pargmann 2014-01-27 @760  	snd_soc_update_bits(codec, AIC32X4_DACSETUP, AIC32X4_DAC_CHAN_MASK,
b44aa40f875b06 Markus Pargmann 2014-01-27  761  			data);
b44aa40f875b06 Markus Pargmann 2014-01-27  762  
1d471cd1261a44 Javier Martin   2011-03-02  763  	return 0;
1d471cd1261a44 Javier Martin   2011-03-02  764  }
1d471cd1261a44 Javier Martin   2011-03-02  765  

:::::: The code at line 661 was first introduced by commit
:::::: 199027dfd0e85dae3dd7a038465ca9978af5f520 UPSTREAM: ASoC: tlv320aic32x4: Use snd_soc_update_bits() in aic32x4_set_dai_fmt()

:::::: TO: Andrew F. Davis <afd@ti.com>
:::::: CC: chrome-bot <chrome-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
