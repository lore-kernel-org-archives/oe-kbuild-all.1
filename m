Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A215DF60
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692194278; x=1723730278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kRCi8FQp4fHk+Roi0e89Lo6dwN9d2Nt4NhR0OB6Nr+w=;
  b=DL2g/JuFD5jIqRryJNMP0riSyg+iM7DTnRI3KgvFtQYK9IkFCypK1yGG
   pO3XuaUJYoUoFhr1y89Lml0I7UyD8iuCOy02NF6fPmATZWS9neojG/J0b
   1iw9LUQzli2DvFtQ0i4eMAlEh5rVRHz4BGuY8REHNuyYRWPykvPke3X7q
   eOmCTbbnCTO+5l/Y9SLYzmGkpaugGJSscR7CYShMa4QqdUqx62FyD6/G2
   yy5qjaUw7SHaxsM37oIW0hyyJiNb821pcglCkLZwwWI93N7+9KwqpZBwB
   jkyES1hrSOoLU4C29uEo26v5GqJJKlN5LxJaCY1eC6nNSJXALqNNS7QCh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352863209"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="352863209"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 06:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857828272"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="857828272"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Aug 2023 06:57:56 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWH23-0000M9-1G;
	Wed, 16 Aug 2023 13:57:55 +0000
Date: Wed, 16 Aug 2023 21:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:fix/lnl-alh-chain-dma 2/3]
 sound/soc/sof/ipc4-topology.c:521:52: warning: overlapping comparisons
 always evaluate to true
Message-ID: <202308162138.gOCkU415-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound fix/lnl-alh-chain-dma
head:   8810cc35dcd82df1c3629059af43ed1be2bb7dd9
commit: 2093851a730f1ced418a2ad0f135554c6ee7942e [2/3] [HACK] ASoC: SOF: ipc4-topology: allow chain_dma for ALH as well
config: i386-randconfig-i012-20230816 (https://download.01.org/0day-ci/archive/20230816/202308162138.gOCkU415-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308162138.gOCkU415-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308162138.gOCkU415-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/ipc4-topology.c:521:52: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
               ((ipc4_copier->dai_type != SOF_DAI_INTEL_HDA) ||
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   1 warning generated.


vim +521 sound/soc/sof/ipc4-topology.c

   472	
   473	static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
   474	{
   475		struct sof_ipc4_available_audio_format *available_fmt;
   476		struct snd_soc_component *scomp = swidget->scomp;
   477		struct snd_sof_dai *dai = swidget->private;
   478		struct sof_ipc4_copier *ipc4_copier;
   479		struct snd_sof_widget *pipe_widget;
   480		struct sof_ipc4_pipeline *pipeline;
   481		int node_type = 0;
   482		int ret;
   483	
   484		ipc4_copier = kzalloc(sizeof(*ipc4_copier), GFP_KERNEL);
   485		if (!ipc4_copier)
   486			return -ENOMEM;
   487	
   488		available_fmt = &ipc4_copier->available_fmt;
   489	
   490		dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
   491	
   492		ret = sof_ipc4_get_audio_fmt(scomp, swidget, available_fmt,
   493					     &ipc4_copier->data.base_config);
   494		if (ret)
   495			goto free_copier;
   496	
   497		ret = sof_update_ipc_object(scomp, &node_type,
   498					    SOF_COPIER_TOKENS, swidget->tuples,
   499					    swidget->num_tuples, sizeof(node_type), 1);
   500		if (ret) {
   501			dev_err(scomp->dev, "parse dai node type failed %d\n", ret);
   502			goto free_available_fmt;
   503		}
   504	
   505		ret = sof_update_ipc_object(scomp, ipc4_copier,
   506					    SOF_DAI_TOKENS, swidget->tuples,
   507					    swidget->num_tuples, sizeof(u32), 1);
   508		if (ret) {
   509			dev_err(scomp->dev, "parse dai copier node token failed %d\n", ret);
   510			goto free_available_fmt;
   511		}
   512	
   513		dev_dbg(scomp->dev, "dai %s node_type %u dai_type %u dai_index %d\n", swidget->widget->name,
   514			node_type, ipc4_copier->dai_type, ipc4_copier->dai_index);
   515	
   516		ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_NODE_TYPE(node_type);
   517	
   518		pipe_widget = swidget->spipe->pipe_widget;
   519		pipeline = pipe_widget->private;
   520		if (pipeline->use_chain_dma &&
 > 521		    ((ipc4_copier->dai_type != SOF_DAI_INTEL_HDA) ||
   522		     (ipc4_copier->dai_type != SOF_DAI_INTEL_ALH))) {
   523			dev_err(scomp->dev,
   524				"Bad DAI type '%d', Chained DMA is only supported by HDA/ALH DAIs (%d %d).\n",
   525				ipc4_copier->dai_type, SOF_DAI_INTEL_HDA, SOF_DAI_INTEL_ALH);
   526			ret = -ENODEV;
   527			goto free_available_fmt;
   528		}
   529	
   530		switch (ipc4_copier->dai_type) {
   531		case SOF_DAI_INTEL_ALH:
   532		{
   533			struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
   534			struct sof_ipc4_alh_configuration_blob *blob;
   535			struct snd_soc_dapm_path *p;
   536			struct snd_sof_widget *w;
   537			int src_num = 0;
   538	
   539			snd_soc_dapm_widget_for_each_source_path(swidget->widget, p)
   540				src_num++;
   541	
   542			if (swidget->id == snd_soc_dapm_dai_in && src_num == 0) {
   543				/*
   544				 * The blob will not be used if the ALH copier is playback direction
   545				 * and doesn't connect to any source.
   546				 * It is fine to call kfree(ipc4_copier->copier_config) since
   547				 * ipc4_copier->copier_config is null.
   548				 */
   549				ret = 0;
   550				break;
   551			}
   552	
   553			blob = kzalloc(sizeof(*blob), GFP_KERNEL);
   554			if (!blob) {
   555				ret = -ENOMEM;
   556				goto free_available_fmt;
   557			}
   558	
   559			list_for_each_entry(w, &sdev->widget_list, list) {
   560				if (w->widget->sname &&
   561				    strcmp(w->widget->sname, swidget->widget->sname))
   562					continue;
   563	
   564				blob->alh_cfg.device_count++;
   565			}
   566	
   567			ipc4_copier->copier_config = (uint32_t *)blob;
   568			ipc4_copier->data.gtw_cfg.config_length = sizeof(*blob) >> 2;
   569			break;
   570		}
   571		case SOF_DAI_INTEL_SSP:
   572			/* set SSP DAI index as the node_id */
   573			ipc4_copier->data.gtw_cfg.node_id |=
   574				SOF_IPC4_NODE_INDEX_INTEL_SSP(ipc4_copier->dai_index);
   575			break;
   576		case SOF_DAI_INTEL_DMIC:
   577			/* set DMIC DAI index as the node_id */
   578			ipc4_copier->data.gtw_cfg.node_id |=
   579				SOF_IPC4_NODE_INDEX_INTEL_DMIC(ipc4_copier->dai_index);
   580			break;
   581		default:
   582			ipc4_copier->gtw_attr = kzalloc(sizeof(*ipc4_copier->gtw_attr), GFP_KERNEL);
   583			if (!ipc4_copier->gtw_attr) {
   584				ret = -ENOMEM;
   585				goto free_available_fmt;
   586			}
   587	
   588			ipc4_copier->copier_config = (uint32_t *)ipc4_copier->gtw_attr;
   589			ipc4_copier->data.gtw_cfg.config_length =
   590				sizeof(struct sof_ipc4_gtw_attributes) >> 2;
   591			break;
   592		}
   593	
   594		dai->scomp = scomp;
   595		dai->private = ipc4_copier;
   596	
   597		/* set up module info and message header */
   598		ret = sof_ipc4_widget_setup_msg(swidget, &ipc4_copier->msg);
   599		if (ret)
   600			goto free_copier_config;
   601	
   602		return 0;
   603	
   604	free_copier_config:
   605		kfree(ipc4_copier->copier_config);
   606	free_available_fmt:
   607		sof_ipc4_free_audio_fmt(available_fmt);
   608	free_copier:
   609		kfree(ipc4_copier);
   610		dai->private = NULL;
   611		dai->scomp = NULL;
   612		return ret;
   613	}
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
