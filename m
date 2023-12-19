Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEEE3A268
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 21:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3yl4cll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703020584; x=1734556584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nsnl5/BdX6tsnFvTvvIIM5hqq+n8pwnxfqWceGAxH8M=;
  b=Q3yl4cll5M2DiEMSEHkJcyxocYRn5u3NX+mBePlOw1CSLbTIiFd8Dlac
   U6efJg2wYMiowU/wObFUAtLHmIE1YgqSxeaYLFdC8xa7mR/vfG1bShVS3
   1VkgKZGKE2VLYIfNitfxpd0wMRhM1+3SMG460yicWeFuavf1rwOu6cXh3
   Hu1Q3Spf7H75oh2zGfBHYDC3tTkmTSGWkTEdDDctEWlzpJBwC6O1+/rGX
   zkeNjyH2AC5/kpgROIs4JwJJon1MnVjomuzs6Fwx0nKaXQU3s3b+Ah6om
   6+CQPAAelZMmXxdsF5n9RsEfduNhazAyQQyGCBtJfjYwuZMH6v45oAdQk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="426865587"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="426865587"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 13:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="17728154"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Dec 2023 13:16:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFhRs-0005xQ-03;
	Tue, 19 Dec 2023 21:16:20 +0000
Date: Wed, 20 Dec 2023 05:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil Vaghela <sunil.vaghela@softnautics.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: xilinx: Embed IEC958 sample rate val to channel
 status register
Message-ID: <202312200545.YajuIObO-lkp@intel.com>
References: <20231219122955.104696-1-sunil.vaghela@softnautics.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219122955.104696-1-sunil.vaghela@softnautics.com>

Hi Sunil,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on broonie-spi/for-next linus/master v6.7-rc6 next-20231219]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunil-Vaghela/ASoC-xilinx-Embed-IEC958-sample-rate-val-to-channel-status-register/20231219-203257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231219122955.104696-1-sunil.vaghela%40softnautics.com
patch subject: [PATCH] ASoC: xilinx: Embed IEC958 sample rate val to channel status register
config: arm-randconfig-001-20231220 (https://download.01.org/0day-ci/archive/20231220/202312200545.YajuIObO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312200545.YajuIObO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312200545.YajuIObO-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/xilinx/xlnx_formatter_pcm.c: In function 'xlnx_formatter_pcm_hw_params':
>> sound/soc/xilinx/xlnx_formatter_pcm.c:572:26: error: 'struct xlnx_pcm_drv_data' has no member named 'nodes'
     572 |         if ((strstr(adata->nodes[XLNX_PLAYBACK]->name, "hdmi")) ||
         |                          ^~
>> sound/soc/xilinx/xlnx_formatter_pcm.c:572:34: error: 'XLNX_PLAYBACK' undeclared (first use in this function)
     572 |         if ((strstr(adata->nodes[XLNX_PLAYBACK]->name, "hdmi")) ||
         |                                  ^~~~~~~~~~~~~
   sound/soc/xilinx/xlnx_formatter_pcm.c:572:34: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/xilinx/xlnx_formatter_pcm.c:573:26: error: 'struct xlnx_pcm_drv_data' has no member named 'nodes'
     573 |             (strstr(adata->nodes[XLNX_PLAYBACK]->name, "dp"))) {
         |                          ^~


vim +572 sound/soc/xilinx/xlnx_formatter_pcm.c

   488	
   489	static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
   490						struct snd_pcm_substream *substream,
   491						struct snd_pcm_hw_params *params)
   492	{
   493		void __iomem *reg;
   494		u32 low, high, active_ch, val, bytes_per_ch, bits_per_sample;
   495		u32 aes_reg1_val, aes_reg2_val, sample_rate, ch_sts;
   496		u64 size;
   497		struct snd_pcm_runtime *runtime = substream->runtime;
   498		struct xlnx_pcm_stream_param *stream_data = runtime->private_data;
   499		struct xlnx_pcm_drv_data *adata = dev_get_drvdata(component->dev);
   500	
   501		active_ch = params_channels(params);
   502		if (active_ch > stream_data->ch_limit)
   503			return -EINVAL;
   504	
   505		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
   506		    adata->sysclk) {
   507			unsigned int mclk_fs = adata->sysclk / params_rate(params);
   508	
   509			if (adata->sysclk % params_rate(params) != 0) {
   510				dev_warn(component->dev, "sysclk %u not divisible by rate %u\n",
   511					 adata->sysclk, params_rate(params));
   512				return -EINVAL;
   513			}
   514	
   515			writel(mclk_fs, stream_data->mmio + XLNX_AUD_FS_MULTIPLIER);
   516		}
   517	
   518		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
   519		    stream_data->xfer_mode == AES_TO_PCM) {
   520			val = readl(stream_data->mmio + XLNX_AUD_STS);
   521			if (val & AUD_STS_CH_STS_MASK) {
   522				aes_reg1_val = readl(stream_data->mmio +
   523						     XLNX_AUD_CH_STS_START);
   524				aes_reg2_val = readl(stream_data->mmio +
   525						     XLNX_AUD_CH_STS_START + 0x4);
   526	
   527				xlnx_parse_aes_params(aes_reg1_val, aes_reg2_val,
   528						      component->dev);
   529			}
   530		}
   531	
   532		size = params_buffer_bytes(params);
   533	
   534		stream_data->buffer_size = size;
   535	
   536		low = lower_32_bits(runtime->dma_addr);
   537		high = upper_32_bits(runtime->dma_addr);
   538		writel(low, stream_data->mmio + XLNX_AUD_BUFF_ADDR_LSB);
   539		writel(high, stream_data->mmio + XLNX_AUD_BUFF_ADDR_MSB);
   540	
   541		val = readl(stream_data->mmio + XLNX_AUD_CTRL);
   542		bits_per_sample = params_width(params);
   543		switch (bits_per_sample) {
   544		case 8:
   545			val |= (BIT_DEPTH_8 << AUD_CTRL_DATA_WIDTH_SHIFT);
   546			break;
   547		case 16:
   548			val |= (BIT_DEPTH_16 << AUD_CTRL_DATA_WIDTH_SHIFT);
   549			break;
   550		case 20:
   551			val |= (BIT_DEPTH_20 << AUD_CTRL_DATA_WIDTH_SHIFT);
   552			break;
   553		case 24:
   554			val |= (BIT_DEPTH_24 << AUD_CTRL_DATA_WIDTH_SHIFT);
   555			break;
   556		case 32:
   557			val |= (BIT_DEPTH_32 << AUD_CTRL_DATA_WIDTH_SHIFT);
   558			break;
   559		default:
   560			return -EINVAL;
   561		}
   562	
   563		val |= active_ch << AUD_CTRL_ACTIVE_CH_SHIFT;
   564		writel(val, stream_data->mmio + XLNX_AUD_CTRL);
   565	
   566		val = (params_periods(params) << PERIOD_CFG_PERIODS_SHIFT)
   567			| params_period_bytes(params);
   568		writel(val, stream_data->mmio + XLNX_AUD_PERIOD_CONFIG);
   569		bytes_per_ch = DIV_ROUND_UP(params_period_bytes(params), active_ch);
   570		writel(bytes_per_ch, stream_data->mmio + XLNX_BYTES_PER_CH);
   571	
 > 572		if ((strstr(adata->nodes[XLNX_PLAYBACK]->name, "hdmi")) ||
   573		    (strstr(adata->nodes[XLNX_PLAYBACK]->name, "dp"))) {
   574			sample_rate = params_rate(params);
   575			dev_info(component->dev, "%s: sample_rate=%d\n", __func__, sample_rate);
   576	
   577			/* As per IEC 60958 standards, whenever transmitting a valid audio
   578			 * stream, HDMI/DP Sources shall always include valid and correct
   579			 * information in Channel Status bits 24 through 27. For L-PCM audio,
   580			 * these bits shall indicate the audio sample frequency. For
   581			 * compressed audio formats, these bits shall indicate the IEC 60958
   582			 * frame-rate.
   583			 *
   584			 * Channel Status Bit Number     Sample Frequency or Frame Rate
   585			 *   24    25     26    27
   586			 *   -----------------------     ------------------------------
   587			 *    1     1      0     0                    32 kHz
   588			 *    0     0      0     0                    44.1 kHz
   589			 *    0     0      0     1                    88.2 kHz
   590			 *    0     0      1     1                    176.4 kHz
   591			 *    0     1      0     0                    48 kHz
   592			 *    0     1      0     1                    96 kHz
   593			 *    0     1      1     1                    192 kHz
   594			 *    1     0      0     1                    768 kHz
   595			 */
   596	
   597			ch_sts = xlnx_formatter_get_iec958_ch_status(sample_rate);
   598			dev_info(component->dev, "%s: iec60958 channel status bits 24 to 27 value for sample rate %dHz = 0x%08x\n",
   599				 __func__, sample_rate, ch_sts);
   600			ch_sts <<= 24;
   601			reg = adata->mmio + XLNX_MM2S_OFFSET + XLNX_AUD_CH_STS_START;
   602			aes_reg1_val = ioread32(reg);
   603			aes_reg1_val |= ch_sts;
   604			dev_info(component->dev, "%s: MM2S: AES Encode channel status register value 0x%08x\n",
   605				 __func__, aes_reg1_val);
   606			iowrite32(aes_reg1_val, reg);
   607		}
   608		return 0;
   609	}
   610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
