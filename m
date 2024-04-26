Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632243BB25
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 23:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714172657; cv=none; b=I4k1eRVbc7e/DsIh5cs/2U82GU/Lwi2MR8Zv5/zLA9lQnLSLm7dTXsqwChJDG1ElbwOQEFFRUuJduqQWBfJYqogQTVpjmjndOx+dVG6snhLkPTyv1yaZPHoI7wun4m9qxeO0Simr+zAR4l/bwHzvh4xIUyfENcdFGwPtV6nQRPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714172657; c=relaxed/simple;
	bh=Miy9H74OK1ebCpvpS95qFA/9tvsK9IARhMbox0jN6J8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRkw8D1bqRtTjRwpVftisc9AUaVpQ2OISvwSWDCRM7CuqFRSXmhN6VcSfJ0P3t1TEmV1/IhLZIutE77S0a2FtzBV6iQDoYIx+OGoulHpwXaoX423WSiyjDwNFwv/U2Z75mtAHJVCFthviJ32baibtAP1qXeO93Nq1D44419T6QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKEVbzWj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKEVbzWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714172655; x=1745708655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Miy9H74OK1ebCpvpS95qFA/9tvsK9IARhMbox0jN6J8=;
  b=PKEVbzWj79c4UuvwGEXaSRuf4fdZY5LIO9jS/gxRx8L7cLL2ZaJbqO+g
   YE1esnwzG80D2PsT/n4ggEgPSE0zYmnsPINP/wyAOKsVYC8kXv2rSeBIt
   NbSO4AqMBUT3ueoLJlPSAZnueaYi7Qj02vJxjICRoUgiHFypjHZb7WJ9l
   PfJOesII98yRGw61ZtFzK68Tdh3PUuji0BQYsr2XaPXfHperr2AGFjVp5
   NPzNnZFFaL+C8t9freb8sXw5Vp2apceWrnfP351MByiCr/zs5QsBYTulJ
   Byln73QNmw3M6WD/hBt2i3hXrkY0I/w8+9heMPDwqaLbZF8C7Uq+8gnkF
   w==;
X-CSE-ConnectionGUID: CbchwerpR4u6xPI/viiXmw==
X-CSE-MsgGUID: zr/a7wT1SzKw7hyMh2EMiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21071139"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="21071139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 16:04:14 -0700
X-CSE-ConnectionGUID: tD5HVPOkSEiBJyM4jb0vOw==
X-CSE-MsgGUID: RUc6KtS6Qi6tRYO/YjdBEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="25552117"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2024 16:04:13 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0Ubz-0004Oi-27;
	Fri, 26 Apr 2024 23:04:11 +0000
Date: Sat, 27 Apr 2024 07:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 144/29910]
 sound/soc/fsl/imx-pdm.c:241:16: error: incompatible pointer types passing
 'unsigned int *' to parameter of type 'uint64_t *' (aka 'unsigned long long
 *')
Message-ID: <202404270721.DfltPT4Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   ebcdbe7ec49f9c3405ee4b89e7ec279e313026f3
commit: d715564642db6f453a7d5ac2f82f81ae3a147b14 [144/29910] MLK-24423: sound: soc: fsl: imx pdm: fixed mclk improve voice
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240427/202404270721.DfltPT4Y-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404270721.DfltPT4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270721.DfltPT4Y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/imx-pdm.c:16:
   In file included from include/sound/soc.h:23:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/fsl/imx-pdm.c:241:16: warning: comparison of distinct pointer types ('typeof ((sample_rate)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     241 |                 mclk_freq = (do_div(sample_rate, 8000) ?
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> sound/soc/fsl/imx-pdm.c:241:16: error: incompatible pointer types passing 'unsigned int *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     241 |                 mclk_freq = (do_div(sample_rate, 8000) ?
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
>> sound/soc/fsl/imx-pdm.c:241:16: warning: shift count >= width of type [-Wshift-count-overflow]
     241 |                 mclk_freq = (do_div(sample_rate, 8000) ?
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   sound/soc/fsl/imx-pdm.c:322:33: error: no member named 'pll8k_clk' in 'struct fsl_sai'; did you mean 'mclk_clk'?
     322 |                 sai_pll8k = clk_get_rate(sai->pll8k_clk);
         |                                               ^~~~~~~~~
         |                                               mclk_clk
   sound/soc/fsl/fsl_sai.h:260:14: note: 'mclk_clk' declared here
     260 |         struct clk *mclk_clk[FSL_SAI_MCLK_MAX];
         |                     ^
   3 warnings and 2 errors generated.


vim +241 sound/soc/fsl/imx-pdm.c

   213	
   214	static int imx_pdm_mic_hw_params(struct snd_pcm_substream *substream,
   215			struct snd_pcm_hw_params *params)
   216	{
   217		struct snd_soc_pcm_runtime *rtd = substream->private_data;
   218		struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
   219		struct snd_soc_card *card = rtd->card;
   220		struct imx_pdm_data *data = snd_soc_card_get_drvdata(card);
   221		unsigned int sample_rate = params_rate(params);
   222		unsigned long mclk_freq;
   223		int ret;
   224	
   225		/* set cpu dai format configuration */
   226		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_PDM |
   227				SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS);
   228		if (ret) {
   229			dev_err(card->dev, "fail to set cpu dai fmt: %d\n", ret);
   230			return ret;
   231		}
   232	
   233		/* Set bitclk ratio */
   234		ret = snd_soc_dai_set_bclk_ratio(cpu_dai, data->decimation);
   235		if (ret) {
   236			dev_err(card->dev, "fail to set cpu sysclk: %d\n", ret);
   237			return ret;
   238		}
   239	
   240		if (data->fixed_mclk) {
 > 241			mclk_freq = (do_div(sample_rate, 8000) ?
   242				data->mclk_11k : data->mclk_8k);
   243		} else {
   244			mclk_freq = imx_pdm_mic_mclk_freq(data->decimation,
   245				sample_rate);
   246		}
   247		/* set mclk freq */
   248		ret = snd_soc_dai_set_sysclk(cpu_dai, FSL_SAI_CLK_MAST1,
   249				mclk_freq, SND_SOC_CLOCK_OUT);
   250		if (ret) {
   251			dev_err(card->dev, "fail to set cpu mclk1 rate: %lu\n",
   252				mclk_freq);
   253			return ret;
   254		}
   255	
   256		dev_dbg(card->dev, "mclk: %lu, bclk ratio: %u\n",
   257				mclk_freq, data->decimation);
   258	
   259		return 0;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
