Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15C5380
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680874990; x=1712410990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m2QzmmKQ1fZD24GtFe2JZk1WQNDRlN9ltVzSqSoojA4=;
  b=Vl4+f9mHNC5tLwypv/USAWDMJs4sxF9IVD+QNBBtKxGSnS3/pQ/Vogzc
   z4pv9/CibrzU9qP5Egs1GJoYweZeTDF9lwyNIFWPMZukEToejgT3AAwjU
   BoEuQo0MUyOGTn47hQPbjywuHbkTIhWZfrriKER2sA2d7iim83rzUxHzV
   fglJ6rvvAwOXTur9OxlVrFb8f2OfkHbFVZzyr3MhSBGa3SlbAYZBwPIK2
   WjUC7hI5V8/b8gGbLHEh3qllR2kHpnIJcShOzV4y9cqANpJWnapQtrotr
   w+8mwOVD3VJcQA41/TMPsFrQDxYMUjyH+h/hs4YM2ZcjAmuJpO9A/Nfge
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341738921"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="341738921"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 06:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="831181291"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="831181291"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2023 06:42:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkmMY-000SYL-2i;
	Fri, 07 Apr 2023 13:42:46 +0000
Date: Fri, 7 Apr 2023 21:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: Curtis Malainey <cujomalainey@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [broonie-ci:20230406_pierre_louis_bossart_asoc_sof_add_no_reply_ipc_calls
 387/387] sound/soc/sof/compress.c:238:46: error: 'ipc_params_reply'
 undeclared; did you mean 'sof_ipc_pcm_params_reply'?
Message-ID: <202304072136.gTWdYOPE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20230406_pierre_louis_bossart_asoc_sof_add_no_reply_ipc_calls
head:   1eef7729a8771172e9112e059eaba9cdc32f6a25
commit: 1eef7729a8771172e9112e059eaba9cdc32f6a25 [387/387] ASoC: SOF: Use no_reply calls for TX
config: csky-allyesconfig (https://download.01.org/0day-ci/archive/20230407/202304072136.gTWdYOPE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=1eef7729a8771172e9112e059eaba9cdc32f6a25
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci 20230406_pierre_louis_bossart_asoc_sof_add_no_reply_ipc_calls
        git checkout 1eef7729a8771172e9112e059eaba9cdc32f6a25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072136.gTWdYOPE-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/compress.c: In function 'sof_compr_set_params':
>> sound/soc/sof/compress.c:238:46: error: 'ipc_params_reply' undeclared (first use in this function); did you mean 'sof_ipc_pcm_params_reply'?
     238 |                                              ipc_params_reply.posn_offset);
         |                                              ^~~~~~~~~~~~~~~~
         |                                              sof_ipc_pcm_params_reply
   sound/soc/sof/compress.c:238:46: note: each undeclared identifier is reported only once for each function it appears in


vim +238 sound/soc/sof/compress.c

6324cf901e14c6 Daniel Baluta      2022-01-20  161  
e7c799e76f070b Daniel Baluta      2022-02-11  162  static int sof_compr_set_params(struct snd_soc_component *component,
6324cf901e14c6 Daniel Baluta      2022-01-20  163  				struct snd_compr_stream *cstream, struct snd_compr_params *params)
6324cf901e14c6 Daniel Baluta      2022-01-20  164  {
6324cf901e14c6 Daniel Baluta      2022-01-20  165  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
6324cf901e14c6 Daniel Baluta      2022-01-20  166  	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
6324cf901e14c6 Daniel Baluta      2022-01-20  167  	struct snd_compr_runtime *crtd = cstream->runtime;
246b135fcdba57 Daniel Baluta      2022-07-12  168  	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
246b135fcdba57 Daniel Baluta      2022-07-12  169  	struct sof_ipc_fw_version *v = &ready->version;
e3091f0a3f563a Daniel Baluta      2022-08-17  170  	struct sof_compr_stream *sstream;
d5770daef62d2e Daniel Baluta      2022-07-12  171  	struct sof_ipc_pcm_params *pcm;
6324cf901e14c6 Daniel Baluta      2022-01-20  172  	struct snd_sof_pcm *spcm;
3f70c360d48446 Daniel Baluta      2022-07-12  173  	size_t ext_data_size;
6324cf901e14c6 Daniel Baluta      2022-01-20  174  	int ret;
6324cf901e14c6 Daniel Baluta      2022-01-20  175  
246b135fcdba57 Daniel Baluta      2022-07-12  176  	if (v->abi_version < SOF_ABI_VER(3, 22, 0)) {
246b135fcdba57 Daniel Baluta      2022-07-12  177  		dev_err(component->dev,
246b135fcdba57 Daniel Baluta      2022-07-12  178  			"Compress params not supported with FW ABI version %d:%d:%d\n",
246b135fcdba57 Daniel Baluta      2022-07-12  179  			SOF_ABI_VERSION_MAJOR(v->abi_version),
246b135fcdba57 Daniel Baluta      2022-07-12  180  			SOF_ABI_VERSION_MINOR(v->abi_version),
246b135fcdba57 Daniel Baluta      2022-07-12  181  			SOF_ABI_VERSION_PATCH(v->abi_version));
246b135fcdba57 Daniel Baluta      2022-07-12  182  		return -EINVAL;
246b135fcdba57 Daniel Baluta      2022-07-12  183  	}
246b135fcdba57 Daniel Baluta      2022-07-12  184  
e3091f0a3f563a Daniel Baluta      2022-08-17  185  	sstream = crtd->private_data;
6324cf901e14c6 Daniel Baluta      2022-01-20  186  
6324cf901e14c6 Daniel Baluta      2022-01-20  187  	spcm = snd_sof_find_spcm_dai(component, rtd);
6324cf901e14c6 Daniel Baluta      2022-01-20  188  
6324cf901e14c6 Daniel Baluta      2022-01-20  189  	if (!spcm)
6324cf901e14c6 Daniel Baluta      2022-01-20  190  		return -EINVAL;
6324cf901e14c6 Daniel Baluta      2022-01-20  191  
3f70c360d48446 Daniel Baluta      2022-07-12  192  	ext_data_size = sizeof(params->codec);
3f70c360d48446 Daniel Baluta      2022-07-12  193  
3f70c360d48446 Daniel Baluta      2022-07-12  194  	if (sizeof(*pcm) + ext_data_size > sdev->ipc->max_payload_size)
3f70c360d48446 Daniel Baluta      2022-07-12  195  		return -EINVAL;
3f70c360d48446 Daniel Baluta      2022-07-12  196  
3f70c360d48446 Daniel Baluta      2022-07-12  197  	pcm = kzalloc(sizeof(*pcm) + ext_data_size, GFP_KERNEL);
d5770daef62d2e Daniel Baluta      2022-07-12  198  	if (!pcm)
d5770daef62d2e Daniel Baluta      2022-07-12  199  		return -ENOMEM;
d5770daef62d2e Daniel Baluta      2022-07-12  200  
6324cf901e14c6 Daniel Baluta      2022-01-20  201  	cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
6324cf901e14c6 Daniel Baluta      2022-01-20  202  	cstream->dma_buffer.dev.dev = sdev->dev;
6324cf901e14c6 Daniel Baluta      2022-01-20  203  	ret = snd_compr_malloc_pages(cstream, crtd->buffer_size);
6324cf901e14c6 Daniel Baluta      2022-01-20  204  	if (ret < 0)
d5770daef62d2e Daniel Baluta      2022-07-12  205  		goto out;
6324cf901e14c6 Daniel Baluta      2022-01-20  206  
6324cf901e14c6 Daniel Baluta      2022-01-20  207  	ret = create_page_table(component, cstream, crtd->dma_area, crtd->dma_bytes);
6324cf901e14c6 Daniel Baluta      2022-01-20  208  	if (ret < 0)
d5770daef62d2e Daniel Baluta      2022-07-12  209  		goto out;
d5770daef62d2e Daniel Baluta      2022-07-12  210  
d5770daef62d2e Daniel Baluta      2022-07-12  211  	pcm->params.buffer.pages = PFN_UP(crtd->dma_bytes);
3f70c360d48446 Daniel Baluta      2022-07-12  212  	pcm->hdr.size = sizeof(*pcm) + ext_data_size;
d5770daef62d2e Daniel Baluta      2022-07-12  213  	pcm->hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_PARAMS;
d5770daef62d2e Daniel Baluta      2022-07-12  214  
d5770daef62d2e Daniel Baluta      2022-07-12  215  	pcm->comp_id = spcm->stream[cstream->direction].comp_id;
3f70c360d48446 Daniel Baluta      2022-07-12  216  	pcm->params.hdr.size = sizeof(pcm->params) + ext_data_size;
d5770daef62d2e Daniel Baluta      2022-07-12  217  	pcm->params.buffer.phy_addr = spcm->stream[cstream->direction].page_table.addr;
d5770daef62d2e Daniel Baluta      2022-07-12  218  	pcm->params.buffer.size = crtd->dma_bytes;
d5770daef62d2e Daniel Baluta      2022-07-12  219  	pcm->params.direction = cstream->direction;
d5770daef62d2e Daniel Baluta      2022-07-12  220  	pcm->params.channels = params->codec.ch_out;
d5770daef62d2e Daniel Baluta      2022-07-12  221  	pcm->params.rate = params->codec.sample_rate;
d5770daef62d2e Daniel Baluta      2022-07-12  222  	pcm->params.buffer_fmt = SOF_IPC_BUFFER_INTERLEAVED;
d5770daef62d2e Daniel Baluta      2022-07-12  223  	pcm->params.frame_fmt = SOF_IPC_FRAME_S32_LE;
d5770daef62d2e Daniel Baluta      2022-07-12  224  	pcm->params.sample_container_bytes =
6324cf901e14c6 Daniel Baluta      2022-01-20  225  		snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S32) >> 3;
d5770daef62d2e Daniel Baluta      2022-07-12  226  	pcm->params.host_period_bytes = params->buffer.fragment_size;
3f70c360d48446 Daniel Baluta      2022-07-12  227  	pcm->params.ext_data_length = ext_data_size;
3f70c360d48446 Daniel Baluta      2022-07-12  228  
3f70c360d48446 Daniel Baluta      2022-07-12  229  	memcpy((u8 *)pcm->params.ext_data, &params->codec, ext_data_size);
6324cf901e14c6 Daniel Baluta      2022-01-20  230  
1eef7729a87711 Curtis Malainey    2023-04-06  231  	ret = sof_ipc_tx_message_no_reply(sdev->ipc, pcm, sizeof(*pcm) + ext_data_size);
6324cf901e14c6 Daniel Baluta      2022-01-20  232  	if (ret < 0) {
6324cf901e14c6 Daniel Baluta      2022-01-20  233  		dev_err(component->dev, "error ipc failed\n");
d5770daef62d2e Daniel Baluta      2022-07-12  234  		goto out;
6324cf901e14c6 Daniel Baluta      2022-01-20  235  	}
6324cf901e14c6 Daniel Baluta      2022-01-20  236  
a9737808b3e4e2 Daniel Baluta      2023-01-17  237  	ret = snd_sof_set_stream_data_offset(sdev, &spcm->stream[cstream->direction],
a9737808b3e4e2 Daniel Baluta      2023-01-17 @238  					     ipc_params_reply.posn_offset);
a9737808b3e4e2 Daniel Baluta      2023-01-17  239  	if (ret < 0) {
a9737808b3e4e2 Daniel Baluta      2023-01-17  240  		dev_err(component->dev, "Invalid stream data offset for Compr %d\n",
a9737808b3e4e2 Daniel Baluta      2023-01-17  241  			spcm->pcm.pcm_id);
a9737808b3e4e2 Daniel Baluta      2023-01-17  242  		goto out;
a9737808b3e4e2 Daniel Baluta      2023-01-17  243  	}
a9737808b3e4e2 Daniel Baluta      2023-01-17  244  
e3091f0a3f563a Daniel Baluta      2022-08-17  245  	sstream->sampling_rate = params->codec.sample_rate;
3ccbe688774767 Laurentiu Mihalcea 2022-08-17  246  	sstream->channels = params->codec.ch_out;
3ccbe688774767 Laurentiu Mihalcea 2022-08-17  247  	sstream->sample_container_bytes = pcm->params.sample_container_bytes;
6324cf901e14c6 Daniel Baluta      2022-01-20  248  
6324cf901e14c6 Daniel Baluta      2022-01-20  249  	spcm->prepared[cstream->direction] = true;
6324cf901e14c6 Daniel Baluta      2022-01-20  250  
d5770daef62d2e Daniel Baluta      2022-07-12  251  out:
d5770daef62d2e Daniel Baluta      2022-07-12  252  	kfree(pcm);
d5770daef62d2e Daniel Baluta      2022-07-12  253  
d5770daef62d2e Daniel Baluta      2022-07-12  254  	return ret;
6324cf901e14c6 Daniel Baluta      2022-01-20  255  }
6324cf901e14c6 Daniel Baluta      2022-01-20  256  

:::::: The code at line 238 was first introduced by commit
:::::: a9737808b3e4e2313cc2aab2e807836a06576277 ASoC: SOF: compress: Set compress data offset

:::::: TO: Daniel Baluta <daniel.baluta@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
