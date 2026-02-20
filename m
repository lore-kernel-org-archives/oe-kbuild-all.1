Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186421CAA7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 02:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771553158; cv=none; b=bzQ/rMvddorbxWOtVpz5SU8mDkPNQzv56wdaUobZDVuve9L7SVqrmGa1x0RNSauWKpxwQSj5vfgHiRRb5IKHTsXRhWCNmdaZErIOoEoWzoYGbzaY71yXcYwBpCpwfVjC54VFSV7rzTpFdTV9Q/YYCZbhN3FcBoZvbxle/PwJ7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771553158; c=relaxed/simple;
	bh=H7UQtWRYGwzn+u3ZoQWimkTH6cLkX4X185gLF7RRr5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PB/Z46c53TX2mz/20438CvcQFN0W3H/swk5QNkV1oBXwPd1jhZTCPimAnKZV3+L47NEaRgHT8Dhag9sJCOdVYpRB8Z1+6gSL0tTRhXW69T6p0NlfNA36oHXthtWMLCYG1ENMEmw0iAofcTc3CGKvfME1iXpGOJQ0ERRSW+qf8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iq+ZQL+r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iq+ZQL+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771553157; x=1803089157;
  h=date:from:to:cc:subject:message-id;
  bh=H7UQtWRYGwzn+u3ZoQWimkTH6cLkX4X185gLF7RRr5g=;
  b=iq+ZQL+r5Udc6R6a68l/dXYRyCzjU8QGji7uNNFrvTaIE0f85lRRMJ1u
   OAJCz2nND/LS1hzv4yrQIWMslmOcvjmbz6opHUhGGYBaXKX3C1GXcXBVY
   PcBID5VfrGO1uc535RFgW/HcEhMzp8/ctsjiI4bDhunBPN42H3nHavCq6
   jSAmYahaAYIyTPFcUxgx6s452i2acnH8PCjA+XyJWVeAhdrnJGfG6OMma
   93DggbUW6JhK/+ZSZROUDzYk3noLbWfdUBU2XlOiHq//ymBzU/3J4DWSK
   scaZZ2rORjRujENa2V3GL0lotFjVqVV0K9zO4sSp4nMw2fQnenUPl5nSp
   A==;
X-CSE-ConnectionGUID: cPDj+CPySKWORKWcYJDAxA==
X-CSE-MsgGUID: kAYTQIlISMqAtzIlvuBtzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76266422"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="76266422"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 18:05:56 -0800
X-CSE-ConnectionGUID: M8lo9FKrTRWN+qLqOuiCXw==
X-CSE-MsgGUID: rgBNsm1sTkSiZiTaCKIoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="237702103"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2026 18:05:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtFtw-000000013io-3r33;
	Fri, 20 Feb 2026 02:05:52 +0000
Date: Fri, 20 Feb 2026 10:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-02-19 63/63]
 sound/soc/qcom/sdm845.c:193:3: error: a label can only be part of a statement
 and a declaration is not a statement
Message-ID: <202602201048.4tjFeDmy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-02-19
head:   d8836b1acbaa119a0d449cf73227c0be79ee816d
commit: d8836b1acbaa119a0d449cf73227c0be79ee816d [63/63] dai
config: arc-randconfig-001-20260220 (https://download.01.org/0day-ci/archive/20260220/202602201048.4tjFeDmy-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201048.4tjFeDmy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201048.4tjFeDmy-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/qcom/sdm845.c: In function 'sdm845_snd_hw_params':
>> sound/soc/qcom/sdm845.c:193:3: error: a label can only be part of a statement and a declaration is not a statement
      struct snd_soc_component *codec = snd_soc_dai_to_component(codec_dai);
      ^~~~~~


vim +193 sound/soc/qcom/sdm845.c

   180	
   181	static int sdm845_snd_hw_params(struct snd_pcm_substream *substream,
   182						struct snd_pcm_hw_params *params)
   183	{
   184		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
   185		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   186		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
   187		int cpu_id = snd_soc_dai_id(cpu_dai);
   188		int ret = 0;
   189	
   190		switch (cpu_id) {
   191		case PRIMARY_MI2S_RX:
   192		case PRIMARY_MI2S_TX:
 > 193			struct snd_soc_component *codec = snd_soc_dai_to_component(codec_dai);
   194	
   195			/*
   196			 * Use ASRC for internal clocks, as PLL rate isn't multiple
   197			 * of BCLK.
   198			 */
   199			rt5663_sel_asrc_clk_src(
   200				codec,
   201				RT5663_DA_STEREO_FILTER | RT5663_AD_STEREO_FILTER,
   202				RT5663_CLK_SEL_I2S1_ASRC);
   203			ret = snd_soc_dai_set_sysclk(
   204				codec_dai, RT5663_SCLK_S_MCLK, DEFAULT_MCLK_RATE,
   205				SND_SOC_CLOCK_IN);
   206			if (ret < 0)
   207				dev_err(rtd->dev,
   208					"snd_soc_dai_set_sysclk err = %d\n", ret);
   209			break;
   210		case QUATERNARY_TDM_RX_0:
   211		case QUATERNARY_TDM_TX_0:
   212			ret = sdm845_tdm_snd_hw_params(substream, params);
   213			break;
   214		case SLIMBUS_0_RX...SLIMBUS_6_TX:
   215			ret = sdm845_slim_snd_hw_params(substream, params);
   216			break;
   217		case QUATERNARY_MI2S_RX:
   218		case SECONDARY_MI2S_RX:
   219			break;
   220		default:
   221			pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_id);
   222			break;
   223		}
   224		return ret;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
