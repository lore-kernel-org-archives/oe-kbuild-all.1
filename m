Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75102C1588
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755683; cv=none; b=XQp2DSY79ZLDXe8L8rihAdaaC7wMj59nxJwrH7CN6zKY6WSGG5guB0hy/z0HfcOlixMl143Segf8cCCT1iGGCoZ1a9eCn7IcMksLA7Xw9KbChsYBNz6W90DAi9Wp5VRnME1OQ17U49xC7153r6jNplSOGeVo4HxZ/iIyOJcTv18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755683; c=relaxed/simple;
	bh=bqMgIL8qz7NDwx1DNY9Tvw3jrntHxihU0pi+qqqV4To=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sV8Y7F4it9BH72dI1IbKL/gpijDcwgQq84xaftIgF12sI85FdOAAxQ31kGkqgZr1dRLHdDpX+rnDYyFW6Zj9Msblc5SBroBkfviQ3H+esoS4dxxJug13y58tvD1xs4duev8xlGi245m7BdCs68jGiMUO9cz+wuwEjSjZUclHoTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8hPC4Fk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8hPC4Fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752755681; x=1784291681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bqMgIL8qz7NDwx1DNY9Tvw3jrntHxihU0pi+qqqV4To=;
  b=F8hPC4Fk86Bl30TXlNHSXqWIrY9tC2Z4L1b8e5l2cIdFAVpucxSsDFC/
   30nzibl7M0pFO4bIihWxohBl5SiJq2wMb1FDZKA2W/pw2pXUcGdojCJms
   p8pSK+Ba48Fb7DHK0kteNPIPjm1aDpBW4KDEzo3oy3/5ZwO6m4kcf91aI
   JjMRqsF+84whCH8S9ufXkXF6QkrBCy1c3N0SkpgLObTUx06KqRfJeCyja
   emAARyZbdWyhegxc3ajsfCucO56SBvpuYGP2sKHBvjxPnAq8f98kBucyu
   OHQYaJXYauETygWqJbmd1zpX1CRPGB18Q54BRZpkkbfg4EIeKvxpsOxjd
   g==;
X-CSE-ConnectionGUID: ZxyxpRp/RquQ/z0Tl1Vnmg==
X-CSE-MsgGUID: +vTNKFRSSEGbkgHO/cPkpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65287566"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="65287566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 05:34:40 -0700
X-CSE-ConnectionGUID: l/xemYvMQjeIRpV/RypQQw==
X-CSE-MsgGUID: NADJBzHFQXe+It/n4zP+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="162073880"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2025 05:34:39 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucNop-000DdL-2f;
	Thu, 17 Jul 2025 12:34:35 +0000
Date: Thu, 17 Jul 2025 20:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 28/80]
 sound/soc/sof/ipc4-topology.c:2199 sof_ipc4_prepare_copier_module() warn:
 unsigned 'out_ref_type' is never less than zero.
Message-ID: <202507172047.V2ErHty9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   84ba3254ade22f354b83bfee7465b0b88f002f50
commit: 3337b44b8932fd11edf96aa4ec3b155f5bad4eb7 [28/80] ASoC: SOF: ipc4-topology: Add support for 8-bit formats
config: x86_64-randconfig-161-20250717 (https://download.01.org/0day-ci/archive/20250717/202507172047.V2ErHty9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507172047.V2ErHty9-lkp@intel.com/

smatch warnings:
sound/soc/sof/ipc4-topology.c:2199 sof_ipc4_prepare_copier_module() warn: unsigned 'out_ref_type' is never less than zero.
sound/soc/sof/ipc4-topology.c:2199 sof_ipc4_prepare_copier_module() warn: error code type promoted to positive: 'out_ref_type'

vim +/out_ref_type +2199 sound/soc/sof/ipc4-topology.c

  1994	
  1995	static int
  1996	sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
  1997				       struct snd_pcm_hw_params *fe_params,
  1998				       struct snd_sof_platform_stream_params *platform_params,
  1999				       struct snd_pcm_hw_params *pipeline_params, int dir)
  2000	{
  2001		struct sof_ipc4_available_audio_format *available_fmt;
  2002		struct snd_soc_component *scomp = swidget->scomp;
  2003		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
  2004		struct sof_ipc4_copier_data *copier_data;
  2005		int input_fmt_index, output_fmt_index;
  2006		struct sof_ipc4_copier *ipc4_copier;
  2007		struct snd_pcm_hw_params *ref_params __free(kfree) = NULL;
  2008		struct snd_sof_dai *dai;
  2009		u32 gtw_cfg_config_length;
  2010		u32 dma_config_tlv_size = 0;
  2011		void **ipc_config_data;
  2012		int *ipc_config_size;
  2013		u32 **data;
  2014		int ipc_size, ret, out_ref_valid_bits;
  2015		u32 out_ref_rate, out_ref_channels, out_ref_type;
  2016		u32 deep_buffer_dma_ms = 0;
  2017		bool single_output_bitdepth;
  2018		int i;
  2019	
  2020		switch (swidget->id) {
  2021		case snd_soc_dapm_aif_in:
  2022		case snd_soc_dapm_aif_out:
  2023		{
  2024			struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
  2025			struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
  2026			struct sof_ipc4_gtw_attributes *gtw_attr;
  2027	
  2028			dev_dbg(sdev->dev,
  2029				"Host copier %s, type %d, ChainDMA: %s, stream_tag: %d\n",
  2030				swidget->widget->name, swidget->id,
  2031				str_yes_no(pipeline->use_chain_dma),
  2032				platform_params->stream_tag);
  2033	
  2034			/* parse the deep buffer dma size */
  2035			ret = sof_update_ipc_object(scomp, &deep_buffer_dma_ms,
  2036						    SOF_COPIER_DEEP_BUFFER_TOKENS, swidget->tuples,
  2037						    swidget->num_tuples, sizeof(u32), 1);
  2038			if (ret) {
  2039				dev_err(scomp->dev, "Failed to parse deep buffer dma size for %s\n",
  2040					swidget->widget->name);
  2041				return ret;
  2042			}
  2043	
  2044			ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
  2045			gtw_attr = ipc4_copier->gtw_attr;
  2046			copier_data = &ipc4_copier->data;
  2047			available_fmt = &ipc4_copier->available_fmt;
  2048	
  2049			if (pipeline->use_chain_dma) {
  2050				u32 host_dma_id;
  2051				u32 fifo_size;
  2052	
  2053				host_dma_id = platform_params->stream_tag - 1;
  2054				pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_HOST_ID(host_dma_id);
  2055	
  2056				if (params_format(fe_params) == SNDRV_PCM_FORMAT_S16_LE)
  2057					pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_SCS_MASK;
  2058	
  2059				/* Set SCS bit for 8 and 16 bit formats */
  2060				if (params_physical_width(fe_params) <= 16)
  2061					pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_SCS_MASK;
  2062	
  2063				/*
  2064				 * Despite its name the bitfield 'fifo_size' is used to define DMA buffer
  2065				 * size. The expression calculates 2ms buffer size.
  2066				 */
  2067				fifo_size = DIV_ROUND_UP((SOF_IPC4_CHAIN_DMA_BUF_SIZE_MS *
  2068							  params_rate(fe_params) *
  2069							  params_channels(fe_params) *
  2070							  params_physical_width(fe_params)), 8000);
  2071				pipeline->msg.extension |= SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE(fifo_size);
  2072	
  2073				/*
  2074				 * Chain DMA does not support stream timestamping, but it
  2075				 * can use the host side registers for delay calculation.
  2076				 */
  2077				copier_data->gtw_cfg.node_id = SOF_IPC4_CHAIN_DMA_NODE_ID;
  2078	
  2079				return 0;
  2080			}
  2081	
  2082			/*
  2083			 * Use the input_pin_fmts to match pcm params for playback and the output_pin_fmts
  2084			 * for capture.
  2085			 */
  2086			if (dir == SNDRV_PCM_STREAM_PLAYBACK)
  2087				ref_params = kmemdup(fe_params, sizeof(*ref_params), GFP_KERNEL);
  2088			else
  2089				ref_params = kmemdup(pipeline_params, sizeof(*ref_params), GFP_KERNEL);
  2090			if (!ref_params)
  2091				return -ENOMEM;
  2092	
  2093			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
  2094			copier_data->gtw_cfg.node_id |=
  2095				SOF_IPC4_NODE_INDEX(platform_params->stream_tag - 1);
  2096	
  2097			/* set gateway attributes */
  2098			gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
  2099			break;
  2100		}
  2101		case snd_soc_dapm_dai_in:
  2102		case snd_soc_dapm_dai_out:
  2103		{
  2104			struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
  2105			struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
  2106	
  2107			dev_dbg(sdev->dev, "Dai copier %s, type %d, ChainDMA: %s\n",
  2108				swidget->widget->name, swidget->id,
  2109				str_yes_no(pipeline->use_chain_dma));
  2110	
  2111			if (pipeline->use_chain_dma)
  2112				return 0;
  2113	
  2114			dai = swidget->private;
  2115	
  2116			ipc4_copier = (struct sof_ipc4_copier *)dai->private;
  2117			copier_data = &ipc4_copier->data;
  2118			available_fmt = &ipc4_copier->available_fmt;
  2119	
  2120			/*
  2121			 * Use the fe_params as a base for the copier configuration.
  2122			 * The ref_params might get updated to reflect what format is
  2123			 * supported by the copier on the DAI side.
  2124			 *
  2125			 * In case of capture the ref_params returned will be used to
  2126			 * find the input configuration of the copier.
  2127			 */
  2128			ref_params = kmemdup(fe_params, sizeof(*ref_params), GFP_KERNEL);
  2129			if (!ref_params)
  2130				return -ENOMEM;
  2131	
  2132			ret = sof_ipc4_prepare_dai_copier(sdev, dai, ref_params, dir);
  2133			if (ret < 0)
  2134				return ret;
  2135	
  2136			/*
  2137			 * For playback the pipeline_params needs to be used to find the
  2138			 * input configuration of the copier.
  2139			 */
  2140			if (dir == SNDRV_PCM_STREAM_PLAYBACK)
  2141				memcpy(ref_params, pipeline_params, sizeof(*ref_params));
  2142	
  2143			break;
  2144		}
  2145		case snd_soc_dapm_buffer:
  2146		{
  2147			dev_dbg(sdev->dev, "Module copier %s, type %d\n",
  2148				swidget->widget->name, swidget->id);
  2149	
  2150			ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
  2151			copier_data = &ipc4_copier->data;
  2152			available_fmt = &ipc4_copier->available_fmt;
  2153	
  2154			ref_params = kmemdup(pipeline_params, sizeof(*ref_params), GFP_KERNEL);
  2155			if (!ref_params)
  2156				return -ENOMEM;
  2157	
  2158			break;
  2159		}
  2160		default:
  2161			dev_err(sdev->dev, "unsupported type %d for copier %s",
  2162				swidget->id, swidget->widget->name);
  2163			return -EINVAL;
  2164		}
  2165	
  2166		/* set input and output audio formats */
  2167		input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
  2168								&copier_data->base_config,
  2169								ref_params, available_fmt);
  2170		if (input_fmt_index < 0)
  2171			return input_fmt_index;
  2172	
  2173		/* set the reference params for output format selection */
  2174		single_output_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev,
  2175						available_fmt->output_pin_fmts,
  2176						available_fmt->num_output_formats);
  2177		switch (swidget->id) {
  2178		case snd_soc_dapm_aif_in:
  2179		case snd_soc_dapm_dai_out:
  2180		case snd_soc_dapm_buffer:
  2181		{
  2182			struct sof_ipc4_audio_format *in_fmt;
  2183	
  2184			in_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
  2185			out_ref_rate = in_fmt->sampling_frequency;
  2186			out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
  2187			out_ref_type = sof_ipc4_fmt_cfg_to_type(in_fmt->fmt_cfg);
  2188	
  2189			if (!single_output_bitdepth)
  2190				out_ref_valid_bits =
  2191					SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
  2192			break;
  2193		}
  2194		case snd_soc_dapm_aif_out:
  2195		case snd_soc_dapm_dai_in:
  2196			out_ref_rate = params_rate(fe_params);
  2197			out_ref_channels = params_channels(fe_params);
  2198			out_ref_type = sof_ipc4_get_sample_type(sdev, fe_params);
> 2199			if (out_ref_type < 0)
  2200				return out_ref_type;
  2201	
  2202			if (!single_output_bitdepth) {
  2203				out_ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
  2204				if (out_ref_valid_bits < 0)
  2205					return out_ref_valid_bits;
  2206			}
  2207			break;
  2208		default:
  2209			/*
  2210			 * Unsupported type should be caught by the former switch default
  2211			 * case, this should never happen in reality.
  2212			 */
  2213			return -EINVAL;
  2214		}
  2215	
  2216		/*
  2217		 * if the output format is the same across all available output formats, choose
  2218		 * that as the reference.
  2219		 */
  2220		if (single_output_bitdepth) {
  2221			struct sof_ipc4_audio_format *out_fmt;
  2222	
  2223			out_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
  2224			out_ref_valid_bits =
  2225				SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
  2226			out_ref_type = sof_ipc4_fmt_cfg_to_type(out_fmt->fmt_cfg);
  2227		}
  2228	
  2229		output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
  2230								  &copier_data->base_config,
  2231								  available_fmt, out_ref_rate,
  2232								  out_ref_channels, out_ref_valid_bits,
  2233								  out_ref_type);
  2234		if (output_fmt_index < 0)
  2235			return output_fmt_index;
  2236	
  2237		/*
  2238		 * Set the output format. Current topology defines pin 0 input and output formats in pairs.
  2239		 * This assumes that the pin 0 formats are defined before all other pins.
  2240		 * So pick the output audio format with the same index as the chosen
  2241		 * input format. This logic will need to be updated when the format definitions
  2242		 * in topology change.
  2243		 */
  2244		memcpy(&copier_data->out_format,
  2245		       &available_fmt->output_pin_fmts[output_fmt_index].audio_fmt,
  2246		       sizeof(struct sof_ipc4_audio_format));
  2247	
  2248		switch (swidget->id) {
  2249		case snd_soc_dapm_dai_in:
  2250		case snd_soc_dapm_dai_out:
  2251		{
  2252			/*
  2253			 * Only SOF_DAI_INTEL_ALH needs copier_data to set blob.
  2254			 * That's why only ALH dai's blob is set after sof_ipc4_init_input_audio_fmt
  2255			 */
  2256			if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
  2257				struct sof_ipc4_alh_configuration_blob *blob;
  2258				struct sof_ipc4_dma_config *dma_config;
  2259				struct sof_ipc4_copier_data *alh_data;
  2260				struct sof_ipc4_copier *alh_copier;
  2261				struct snd_sof_widget *w;
  2262				u32 ch_count = 0;
  2263				u32 ch_mask = 0;
  2264				u32 ch_map;
  2265				u32 step;
  2266				u32 mask;
  2267	
  2268				blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
  2269	
  2270				blob->gw_attr.lp_buffer_alloc = 0;
  2271	
  2272				/* Get channel_mask from ch_map */
  2273				ch_map = copier_data->base_config.audio_fmt.ch_map;
  2274				for (i = 0; ch_map; i++) {
  2275					if ((ch_map & 0xf) != 0xf) {
  2276						ch_mask |= BIT(i);
  2277						ch_count++;
  2278					}
  2279					ch_map >>= 4;
  2280				}
  2281	
  2282				step = ch_count / blob->alh_cfg.device_count;
  2283				mask =  GENMASK(step - 1, 0);
  2284				/*
  2285				 * Set each gtw_cfg.node_id to blob->alh_cfg.mapping[]
  2286				 * for all widgets with the same stream name
  2287				 */
  2288				i = 0;
  2289				list_for_each_entry(w, &sdev->widget_list, list) {
  2290					u32 node_type;
  2291	
  2292					if (!WIDGET_IS_DAI(w->id) || !w->widget->sname ||
  2293					    strcmp(w->widget->sname, swidget->widget->sname))
  2294						continue;
  2295	
  2296					dai = w->private;
  2297					if (dai->type != SOF_DAI_INTEL_ALH)
  2298						continue;
  2299					alh_copier = (struct sof_ipc4_copier *)dai->private;
  2300					alh_data = &alh_copier->data;
  2301					node_type = SOF_IPC4_GET_NODE_TYPE(alh_data->gtw_cfg.node_id);
  2302					blob->alh_cfg.mapping[i].device = SOF_IPC4_NODE_TYPE(node_type);
  2303					blob->alh_cfg.mapping[i].device |=
  2304						SOF_IPC4_NODE_INDEX(alh_copier->dai_index);
  2305	
  2306					/*
  2307					 * The mapping[i] device in ALH blob should be the same as the
  2308					 * dma_config_tlv[i] mapping device if a dma_config_tlv is present.
  2309					 * The device id will be used for DMA tlv mapping purposes.
  2310					 */
  2311					if (ipc4_copier->dma_config_tlv[i].length) {
  2312						dma_config = &ipc4_copier->dma_config_tlv[i].dma_config;
  2313						blob->alh_cfg.mapping[i].device =
  2314							dma_config->dma_stream_channel_map.mapping[0].device;
  2315					}
  2316	
  2317					/*
  2318					 * Set the same channel mask for playback as the audio data is
  2319					 * duplicated for all speakers. For capture, split the channels
  2320					 * among the aggregated DAIs. For example, with 4 channels on 2
  2321					 * aggregated DAIs, the channel_mask should be 0x3 and 0xc for the
  2322					 * two DAI's.
  2323					 * The channel masks used depend on the cpu_dais used in the
  2324					 * dailink at the machine driver level, which actually comes from
  2325					 * the tables in soc_acpi files depending on the _ADR and devID
  2326					 * registers for each codec.
  2327					 */
  2328					if (w->id == snd_soc_dapm_dai_in)
  2329						blob->alh_cfg.mapping[i].channel_mask = ch_mask;
  2330					else
  2331						blob->alh_cfg.mapping[i].channel_mask = mask << (step * i);
  2332	
  2333					i++;
  2334				}
  2335				if (blob->alh_cfg.device_count > 1) {
  2336					int group_id;
  2337	
  2338					group_id = ida_alloc_max(&alh_group_ida, ALH_MULTI_GTW_COUNT - 1,
  2339								 GFP_KERNEL);
  2340	
  2341					if (group_id < 0)
  2342						return group_id;
  2343	
  2344					/* add multi-gateway base */
  2345					group_id += ALH_MULTI_GTW_BASE;
  2346					copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
  2347					copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(group_id);
  2348				}
  2349			}
  2350		}
  2351		}
  2352	
  2353		/* modify the input params for the next widget */
  2354		ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
  2355						&copier_data->out_format,
  2356						BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
  2357						BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
  2358						BIT(SNDRV_PCM_HW_PARAM_RATE));
  2359		if (ret)
  2360			return ret;
  2361	
  2362		/*
  2363		 * Set the gateway dma_buffer_size to 2ms buffer size to meet the FW expectation. In the
  2364		 * deep buffer case, set the dma_buffer_size depending on the deep_buffer_dma_ms set
  2365		 * in topology.
  2366		 */
  2367		switch (swidget->id) {
  2368		case snd_soc_dapm_dai_in:
  2369			copier_data->gtw_cfg.dma_buffer_size =
  2370				SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.ibs;
  2371			break;
  2372		case snd_soc_dapm_aif_in:
  2373			copier_data->gtw_cfg.dma_buffer_size =
  2374				max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms) *
  2375					copier_data->base_config.ibs;
  2376			dev_dbg(sdev->dev, "copier %s, dma buffer%s: %u ms (%u bytes)",
  2377				swidget->widget->name,
  2378				deep_buffer_dma_ms ? " (using Deep Buffer)" : "",
  2379				max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms),
  2380				copier_data->gtw_cfg.dma_buffer_size);
  2381			break;
  2382		case snd_soc_dapm_dai_out:
  2383		case snd_soc_dapm_aif_out:
  2384			copier_data->gtw_cfg.dma_buffer_size =
  2385				SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.obs;
  2386			break;
  2387		default:
  2388			break;
  2389		}
  2390	
  2391		data = &ipc4_copier->copier_config;
  2392		ipc_config_size = &ipc4_copier->ipc_config_size;
  2393		ipc_config_data = &ipc4_copier->ipc_config_data;
  2394	
  2395		/* config_length is DWORD based */
  2396		gtw_cfg_config_length = copier_data->gtw_cfg.config_length * 4;
  2397		ipc_size = sizeof(*copier_data) + gtw_cfg_config_length;
  2398	
  2399		dma_config_tlv_size = 0;
  2400		for (i = 0; i < SOF_IPC4_DMA_DEVICE_MAX_COUNT; i++) {
  2401			if (ipc4_copier->dma_config_tlv[i].type != SOF_IPC4_GTW_DMA_CONFIG_ID)
  2402				continue;
  2403			dma_config_tlv_size += ipc4_copier->dma_config_tlv[i].length;
  2404			dma_config_tlv_size +=
  2405				ipc4_copier->dma_config_tlv[i].dma_config.dma_priv_config_size;
  2406			dma_config_tlv_size += (sizeof(ipc4_copier->dma_config_tlv[i]) -
  2407				sizeof(ipc4_copier->dma_config_tlv[i].dma_config));
  2408		}
  2409	
  2410		if (dma_config_tlv_size) {
  2411			ipc_size += dma_config_tlv_size;
  2412	
  2413			/* we also need to increase the size at the gtw level */
  2414			copier_data->gtw_cfg.config_length += dma_config_tlv_size / 4;
  2415		}
  2416	
  2417		dev_dbg(sdev->dev, "copier %s, IPC size is %d", swidget->widget->name, ipc_size);
  2418	
  2419		*ipc_config_data = kzalloc(ipc_size, GFP_KERNEL);
  2420		if (!*ipc_config_data)
  2421			return -ENOMEM;
  2422	
  2423		*ipc_config_size = ipc_size;
  2424	
  2425		sof_ipc4_dbg_module_audio_format(sdev->dev, swidget, available_fmt,
  2426						 input_fmt_index, output_fmt_index);
  2427	
  2428		/* update pipeline memory usage */
  2429		sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
  2430	
  2431		/* copy IPC data */
  2432		memcpy(*ipc_config_data, (void *)copier_data, sizeof(*copier_data));
  2433		if (gtw_cfg_config_length)
  2434			memcpy(*ipc_config_data + sizeof(*copier_data),
  2435			       *data, gtw_cfg_config_length);
  2436	
  2437		/* add DMA Config TLV, if configured */
  2438		if (dma_config_tlv_size)
  2439			memcpy(*ipc_config_data + sizeof(*copier_data) +
  2440			       gtw_cfg_config_length,
  2441			       &ipc4_copier->dma_config_tlv, dma_config_tlv_size);
  2442	
  2443		/*
  2444		 * Restore gateway config length now that IPC payload is prepared. This avoids
  2445		 * counting the DMA CONFIG TLV multiple times
  2446		 */
  2447		copier_data->gtw_cfg.config_length = gtw_cfg_config_length / 4;
  2448	
  2449		return 0;
  2450	}
  2451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
