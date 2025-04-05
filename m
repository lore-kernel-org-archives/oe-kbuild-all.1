Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8B31993B2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882777; cv=none; b=LcC2mnfRhd9O70p5sWhzgvwbVwAZgMsJr3DcoDfeFHj5V2nbjfYi9dR64rIxFRSvlVYCKsxOC+oK3fOpcpehIQ63R3hHvWkn+X0sQmGNjbNTmapjqIhXDDf3MQS4GkSX9syrpDMu4CfqT3f+5F9R8Oxhbg801ZllcL7X5HanzIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882777; c=relaxed/simple;
	bh=r/1ED5Ob5gJA6Ky/2iCSQeDp8WIPpNc6ufyy71ZHEI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYfE6+bzQPFksfsseiejNLWkAe9E3944O6w3DJf/RxBFyJKolgLCK5JRpjoM3oeSeQBXLQ0emcgdzTXQXf0FODqkDqfOc566C/z9cI9bMbDqisY6l8NSwchmf+DgD1cHEpRIkWiq4D9oVGhUzuApIKXg8XXVMTxmw1UhAOw5J4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqTdy86U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqTdy86U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743882775; x=1775418775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r/1ED5Ob5gJA6Ky/2iCSQeDp8WIPpNc6ufyy71ZHEI0=;
  b=hqTdy86UKYbJHLZewUVoAtDvduPI0A8HNVkJDaDocIq7aH9g/16HD8WS
   cya/7wq1PpfSMnbAnL47N9pKGQuYNzQPzxyxji0ywKb2DJEkxmteZlyWY
   EeGBu3ftQ6N9FBO90KHqceeoTL6xqcP9fqA95zG1+Q2tzYGWYimeOQ7LN
   lXnLiX6/mr8VCZ/qThQlkp3BuN3gDFQ9aX9C1LF313iTN0N6eTMB3Hsul
   w77tC/oE8nnhGhjgAoj4SEdmwq+grwMaDbi6cfbxRuQuBZhdWxx8gzese
   I7rCim+YDvo5MKxOaMN1ENNKhkmfVzyf6YOtvkJ3Avv/B/sDYojeMvGmb
   A==;
X-CSE-ConnectionGUID: TrpXP4SCQ2WwlvB0vLGqXg==
X-CSE-MsgGUID: v7tkn07qTQ6fyfzqmCi91Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="44446129"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="44446129"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 12:52:54 -0700
X-CSE-ConnectionGUID: G5oASTgOQnqh+RTSZPox2Q==
X-CSE-MsgGUID: PaBojaFiSNmpZyuX9hXB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="132304279"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Apr 2025 12:52:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u19ZT-0002Ez-0e;
	Sat, 05 Apr 2025 19:52:51 +0000
Date: Sun, 6 Apr 2025 03:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 03/10] ASoC: tas2770: Set the SDOUT polarity correctly
Message-ID: <202504060322.XScsxcUB-lkp@intel.com>
References: <20250405-apple-codec-changes-v4-3-d007e46ce4a2@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405-apple-codec-changes-v4-3-d007e46ce4a2@gmail.com>

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Calligeros/ASoC-tas2770-Power-cycle-amp-on-ISENSE-VSENSE-change/20250405-081800
base:   3a0f0a4355df0240485ed62b6bd6afa5b3e689c5
patch link:    https://lore.kernel.org/r/20250405-apple-codec-changes-v4-3-d007e46ce4a2%40gmail.com
patch subject: [PATCH v4 03/10] ASoC: tas2770: Set the SDOUT polarity correctly
config: arc-randconfig-001-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060322.XScsxcUB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060322.XScsxcUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060322.XScsxcUB-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/tas2770.c: In function 'tas2770_set_fmt':
>> sound/soc/codecs/tas2770.c:371:30: error: 'TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING' undeclared (first use in this function); did you mean 'TAS2770_TDM_CFG_REG1_RX_FALING'?
     371 |                 asi_cfg_4 |= TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING;
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              TAS2770_TDM_CFG_REG1_RX_FALING
   sound/soc/codecs/tas2770.c:371:30: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/codecs/tas2770.c:390:56: error: 'TAS2770_TDM_CFG_REG4' undeclared (first use in this function); did you mean 'TAS2770_TDM_CFG_REG7'?
     390 |         ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
         |                                                        ^~~~~~~~~~~~~~~~~~~~
         |                                                        TAS2770_TDM_CFG_REG7


vim +371 sound/soc/codecs/tas2770.c

   348	
   349	static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
   350	{
   351		struct snd_soc_component *component = dai->component;
   352		struct tas2770_priv *tas2770 =
   353				snd_soc_component_get_drvdata(component);
   354		u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0, asi_cfg_4 = 0;
   355		int ret;
   356	
   357		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
   358		case SND_SOC_DAIFMT_CBC_CFC:
   359			break;
   360		default:
   361			dev_err(tas2770->dev, "ASI invalid DAI clocking\n");
   362			return -EINVAL;
   363		}
   364	
   365		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
   366		case SND_SOC_DAIFMT_NB_IF:
   367			invert_fpol = 1;
   368			fallthrough;
   369		case SND_SOC_DAIFMT_NB_NF:
   370			asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_RSING;
 > 371			asi_cfg_4 |= TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING;
   372			break;
   373		case SND_SOC_DAIFMT_IB_IF:
   374			invert_fpol = 1;
   375			fallthrough;
   376		case SND_SOC_DAIFMT_IB_NF:
   377			asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_FALING;
   378			break;
   379		default:
   380			dev_err(tas2770->dev, "ASI format Inverse is not found\n");
   381			return -EINVAL;
   382		}
   383	
   384		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG1,
   385						    TAS2770_TDM_CFG_REG1_RX_MASK,
   386						    asi_cfg_1);
   387		if (ret < 0)
   388			return ret;
   389	
 > 390		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
   391						    TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING,
   392						    asi_cfg_4);
   393		if (ret < 0)
   394			return ret;
   395	
   396		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
   397		case SND_SOC_DAIFMT_I2S:
   398			tdm_rx_start_slot = 1;
   399			fpol_preinv = 0;
   400			break;
   401		case SND_SOC_DAIFMT_DSP_A:
   402			tdm_rx_start_slot = 0;
   403			fpol_preinv = 1;
   404			break;
   405		case SND_SOC_DAIFMT_DSP_B:
   406			tdm_rx_start_slot = 1;
   407			fpol_preinv = 1;
   408			break;
   409		case SND_SOC_DAIFMT_LEFT_J:
   410			tdm_rx_start_slot = 0;
   411			fpol_preinv = 1;
   412			break;
   413		default:
   414			dev_err(tas2770->dev,
   415				"DAI Format is not found, fmt=0x%x\n", fmt);
   416			return -EINVAL;
   417		}
   418	
   419		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG1,
   420						    TAS2770_TDM_CFG_REG1_MASK,
   421						    (tdm_rx_start_slot << TAS2770_TDM_CFG_REG1_51_SHIFT));
   422		if (ret < 0)
   423			return ret;
   424	
   425		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
   426						    TAS2770_TDM_CFG_REG0_FPOL_MASK,
   427						    (fpol_preinv ^ invert_fpol)
   428						     ? TAS2770_TDM_CFG_REG0_FPOL_RSING
   429						     : TAS2770_TDM_CFG_REG0_FPOL_FALING);
   430		if (ret < 0)
   431			return ret;
   432	
   433		return 0;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
