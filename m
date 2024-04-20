Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B20205E27
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 01:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713577701; cv=none; b=n6hEqfGDfZuTe8767WacnRUIl7cIF0ijlaQvqy22b1Wh/fRg6ZgJ0FtlPYTDBTRSSPrOIS4qwSpEuU4wSSILaCrJZmWzVdl7pfBgbYnpCz6MN2k90taIu3ZaJB7h1zn/mOuNOoLSASnkAU5kzcUiA38bGJpfFrGURzPk279nvr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713577701; c=relaxed/simple;
	bh=RyQJOZBavdn5gi0uuUDNLV0VigEF1YmDx0Wodv7deZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djFuHhoNLVJ3QcKM62Uh4NY/Tk64QuPu6Fo+hHRTlwUXKiNduy4+9IE8HidR8u7I/t92MqFhVhitlPuczl3aG0je18yFuznEBOkH9rMECTnOfj2eok08a7w56QIKJSe/qrLHQUoHY2NqTvQh6dFIESHgdShs0M86Knq4TAVuHFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A52TeCqO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A52TeCqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713577700; x=1745113700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RyQJOZBavdn5gi0uuUDNLV0VigEF1YmDx0Wodv7deZg=;
  b=A52TeCqOI7Pxwykra364+9OrG3FHnQxf9lHu2tVmYnUXZUwhCP3pS8vq
   2xz6VT2ElLIsheyOzGn5fKo8eQ5iiOHQA1lr1oIqpn6O3uB5yZgvwSa1S
   RuWeL8r34rQPA3eM37e6yOqcwU5Ge3qutf5reoLWdInxl4L3/RDpR7XmP
   3gqWqDL2KoC4zI8t3n9+wZoHX1RTiXq1PERDdCO/5MqEWwpMcZUKocO5w
   1DmZhvAEyuFBrZLjL28dVwKPHPHx5JIXPD7traK1SVZDuIqvG0NoAEYSk
   zR4rl2+DaQzn7n+qrRJTusyuNQgTRk/MIZkf0R8pHiXRFQIMRGNk/jLRS
   Q==;
X-CSE-ConnectionGUID: adIHnsgqRpi46HJkD65zXQ==
X-CSE-MsgGUID: HzTVPRJ0TXCpR0BYPZd7EA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="13037701"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="13037701"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 18:48:19 -0700
X-CSE-ConnectionGUID: prpTCoSZROGnGuIDHwrpMA==
X-CSE-MsgGUID: TtrTVKTBQkKjZrBB7apgzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="46787214"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Apr 2024 18:48:17 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxzpv-000AdB-0L;
	Sat, 20 Apr 2024 01:48:15 +0000
Date: Sat, 20 Apr 2024 09:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 132/18115]
 sound/soc/fsl/imx-pcm512x.c:189:7: error: incompatible pointer types passing
 'unsigned int *' to parameter of type 'uint64_t *' (aka 'unsigned long long
 *')
Message-ID: <202404200915.G2VGkS6Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: a876adc3ae12aec519af4b9cbb6ed25f542f6fb9 [132/18115] MLK-24930-1: sound: soc: fsl: imx pcm512x: iqaudio dac
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240420/202404200915.G2VGkS6Z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200915.G2VGkS6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200915.G2VGkS6Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/fsl/imx-pcm512x.c:18:
   In file included from include/linux/of_gpio.h:14:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/fsl/imx-pcm512x.c:18:
   In file included from include/linux/of_gpio.h:14:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/fsl/imx-pcm512x.c:18:
   In file included from include/linux/of_gpio.h:14:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/soc/fsl/imx-pcm512x.c:20:
   In file included from include/sound/soc.h:23:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:1748:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   sound/soc/fsl/imx-pcm512x.c:140:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     140 |         default:
         |         ^
   sound/soc/fsl/imx-pcm512x.c:140:2: note: insert 'break;' to avoid fall-through
     140 |         default:
         |         ^
         |         break; 
   sound/soc/fsl/imx-pcm512x.c:189:7: warning: comparison of distinct pointer types ('typeof ((rate)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     189 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> sound/soc/fsl/imx-pcm512x.c:189:7: error: incompatible pointer types passing 'unsigned int *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     189 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   sound/soc/fsl/imx-pcm512x.c:193:5: error: use of undeclared identifier 'PCM512x_SYSCLK_MCLK1'
     193 |                                 PCM512x_SYSCLK_MCLK1, mclk_freq, SND_SOC_CLOCK_IN);
         |                                 ^
   sound/soc/fsl/imx-pcm512x.c:198:5: error: use of undeclared identifier 'PCM512x_SYSCLK_MCLK2'
     198 |                                 PCM512x_SYSCLK_MCLK2, mclk_freq, SND_SOC_CLOCK_IN);
         |                                 ^
   sound/soc/fsl/imx-pcm512x.c:189:7: warning: shift count >= width of type [-Wshift-count-overflow]
     189 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   10 warnings and 3 errors generated.


vim +189 sound/soc/fsl/imx-pcm512x.c

   171	
   172	static int imx_pcm512x_hw_params(struct snd_pcm_substream *substream,
   173					struct snd_pcm_hw_params *params)
   174	{
   175		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
   176		struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
   177		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
   178		struct snd_soc_component *comp = codec_dai->component;
   179		struct snd_soc_card *card = rtd->card;
   180		struct imx_pcm512x_data *data = snd_soc_card_get_drvdata(card);
   181		unsigned int rate = params_rate(params);
   182		unsigned int channels = params_channels(params);
   183		unsigned int width = params_width(params);
   184		unsigned long mclk_freq;
   185		int ret, i;
   186	
   187		/* set MCLK freq */
   188		if (data->dac_pluspro && data->dac_sclk) {
 > 189			if (do_div(rate, 8000)) {
   190				mclk_freq = DAC_CLK_EXT_44K;
   191				imx_pcm512x_select_ext_clk(comp, DAC_CLK_EXT_44EN);
   192				ret = snd_soc_dai_set_sysclk(codec_dai,
   193					PCM512x_SYSCLK_MCLK1, mclk_freq, SND_SOC_CLOCK_IN);
   194			} else {
   195				mclk_freq = DAC_CLK_EXT_48K;
   196				imx_pcm512x_select_ext_clk(comp, DAC_CLK_EXT_48EN);
   197				ret = snd_soc_dai_set_sysclk(codec_dai,
   198					PCM512x_SYSCLK_MCLK2, mclk_freq, SND_SOC_CLOCK_IN);
   199			}
   200			if (ret < 0)
   201				dev_err(card->dev, "failed to set cpu dai mclk rate (%lu): %d\n",
   202					mclk_freq, ret);
   203		} else {
   204			mclk_freq = pcm512x_get_mclk_rate(substream, params);
   205			ret = snd_soc_dai_set_sysclk(cpu_dai, FSL_SAI_CLK_MAST1,
   206						     mclk_freq, SND_SOC_CLOCK_OUT);
   207			if (ret < 0)
   208				dev_err(card->dev, "failed to set cpu dai mclk1 rate (%lu): %d\n",
   209					mclk_freq, ret);
   210		}
   211	
   212		for_each_rtd_codec_dais(rtd, i, codec_dai) {
   213			ret = snd_soc_dai_set_bclk_ratio(codec_dai, (channels * width));
   214			if (ret) {
   215				dev_err(card->dev, "failed to set codec dai bclk ratio\n");
   216				return ret;
   217			}
   218		}
   219	
   220		dev_dbg(card->dev, "mclk_freq: %lu, bclk ratio: %u\n",
   221			mclk_freq, (channels * width));
   222	
   223		return 0;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
