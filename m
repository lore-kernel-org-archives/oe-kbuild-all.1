Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614BA6AB1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 19:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694026987; x=1725562987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RVZnpad6q5RsnkR+yD67L43bjmD0ZLkbI+7S12AClfw=;
  b=ESBw81sNw76i3n0Awb7eWPNnHZP1UlkeQvu5ITsWnp2Q+SjYwIiOR6/x
   IQjOmFxSq09Jy1ypQUaGjTnCOz1zI2nRF8RzPpgptFOpMAmT5lSozYdlS
   /Lzj+iMBWA/5A2UCGxkhjItfe54GKgawvR7LxXVbKKBmexZzN6Or0IIl8
   +Kvw/NsMFb/tPNZdQXgAXSlA+5kPOAlMQo6R2cZTBMJqhdaQVn5o/PrG0
   a4O30onwxEq3X1B/8bAV9iXayCCiH+xjSld1UlGj46/AMOow8stp0kxxc
   yUA4cFcjy+8Aej569somAMvQrx4zJKhIfUdec2HwJ5x4gslOvoNYCz0N6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356638243"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="356638243"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 12:02:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856579481"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="856579481"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 12:02:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdxne-0000Vl-29;
	Wed, 06 Sep 2023 19:02:50 +0000
Date: Thu, 7 Sep 2023 03:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 256/24606]
 sound/soc/sof/compress.c:91:5: warning: no previous prototype for function
 'sof_compr_open'
Message-ID: <202309070259.q4eQn3Yt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: 9d5a6e760c0053b3a3d61fd4c6b95b313e9ffa60 [256/24606] ASoC: SOF: compr: Add compress ops implementation
config: mips-randconfig-r033-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070259.q4eQn3Yt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070259.q4eQn3Yt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070259.q4eQn3Yt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/compress.c:91:5: warning: no previous prototype for function 'sof_compr_open' [-Wmissing-prototypes]
   int sof_compr_open(struct snd_soc_component *component,
       ^
   sound/soc/sof/compress.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sof_compr_open(struct snd_soc_component *component,
   ^
   static 
>> sound/soc/sof/compress.c:122:5: warning: no previous prototype for function 'sof_compr_free' [-Wmissing-prototypes]
   int sof_compr_free(struct snd_soc_component *component,
       ^
   sound/soc/sof/compress.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sof_compr_free(struct snd_soc_component *component,
   ^
   static 
>> sound/soc/sof/compress.c:140:5: warning: no previous prototype for function 'sof_compr_set_params' [-Wmissing-prototypes]
   int sof_compr_set_params(struct snd_soc_component *component,
       ^
   sound/soc/sof/compress.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sof_compr_set_params(struct snd_soc_component *component,
   ^
   static 
>> sound/soc/sof/compress.c:194:5: warning: no previous prototype for function 'sof_compr_get_params' [-Wmissing-prototypes]
   int sof_compr_get_params(struct snd_soc_component *component,
       ^
   sound/soc/sof/compress.c:194:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sof_compr_get_params(struct snd_soc_component *component,
   ^
   static 
>> sound/soc/sof/compress.c:200:5: warning: no previous prototype for function 'sof_compr_trigger' [-Wmissing-prototypes]
   int sof_compr_trigger(struct snd_soc_component *component,
       ^
   sound/soc/sof/compress.c:200:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sof_compr_trigger(struct snd_soc_component *component,
   ^
   static 
>> sound/soc/sof/compress.c:234:5: warning: no previous prototype for function 'sof_compr_copy' [-Wmissing-prototypes]
   int sof_compr_copy(struct snd_soc_component *component,
       ^
   sound/soc/sof/compress.c:234:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sof_compr_copy(struct snd_soc_component *component,
   ^
   static 
   6 warnings generated.


vim +/sof_compr_open +91 sound/soc/sof/compress.c

    90	
  > 91	int sof_compr_open(struct snd_soc_component *component,
    92			   struct snd_compr_stream *cstream)
    93	{
    94		struct snd_soc_pcm_runtime *rtd = cstream->private_data;
    95		struct snd_compr_runtime *runtime = cstream->runtime;
    96		struct sof_compr_stream *sstream;
    97		struct snd_sof_pcm *spcm;
    98		int dir;
    99	
   100		sstream = kzalloc(sizeof(*sstream), GFP_KERNEL);
   101		if (!sstream)
   102			return -ENOMEM;
   103	
   104		spcm = snd_sof_find_spcm_dai(component, rtd);
   105		if (!spcm) {
   106			kfree(sstream);
   107			return -EINVAL;
   108		}
   109	
   110		dir = cstream->direction;
   111	
   112		spcm->stream[dir].posn.host_posn = 0;
   113		spcm->stream[dir].posn.dai_posn = 0;
   114		spcm->stream[dir].cstream = cstream;
   115		spcm->prepared[dir] = false;
   116	
   117		runtime->private_data = sstream;
   118	
   119		return 0;
   120	}
   121	
 > 122	int sof_compr_free(struct snd_soc_component *component,
   123			   struct snd_compr_stream *cstream)
   124	{
   125		struct snd_soc_pcm_runtime *rtd = cstream->private_data;
   126		struct snd_compr_runtime *runtime = cstream->runtime;
   127		struct sof_compr_stream *sstream = runtime->private_data;
   128		struct snd_sof_pcm *spcm;
   129	
   130		spcm = snd_sof_find_spcm_dai(component, rtd);
   131		if (!spcm)
   132			return -EINVAL;
   133	
   134		cancel_work_sync(&spcm->stream[cstream->direction].period_elapsed_work);
   135		kfree(sstream);
   136	
   137		return 0;
   138	}
   139	
 > 140	int sof_compr_set_params(struct snd_soc_component *component,
   141				 struct snd_compr_stream *cstream, struct snd_compr_params *params)
   142	{
   143		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
   144		struct snd_soc_pcm_runtime *rtd_pcm = cstream->private_data;
   145		struct snd_compr_runtime *rtd = cstream->runtime;
   146		struct sof_compr_stream *sstream = rtd->private_data;
   147		struct sof_ipc_pcm_params_reply ipc_params_reply;
   148		struct sof_ipc_pcm_params pcm;
   149		struct snd_sof_pcm *spcm;
   150		int ret;
   151	
   152		spcm = snd_sof_find_spcm_dai(component, rtd_pcm);
   153		if (!spcm)
   154			return -EINVAL;
   155	
   156		cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
   157		cstream->dma_buffer.dev.dev = sdev->dev;
   158		ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
   159		if (ret < 0)
   160			return ret;
   161	
   162		create_page_table(component, cstream, rtd->dma_area, rtd->dma_bytes);
   163	
   164		pcm.params.buffer.pages = PFN_UP(rtd->dma_bytes);
   165		pcm.hdr.size = sizeof(pcm);
   166		pcm.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_PARAMS;
   167	
   168		pcm.comp_id = spcm->stream[cstream->direction].comp_id;
   169		pcm.params.hdr.size = sizeof(pcm.params);
   170		pcm.params.buffer.phy_addr = spcm->stream[cstream->direction].page_table.addr;
   171		pcm.params.buffer.size = rtd->dma_bytes;
   172		pcm.params.direction = cstream->direction;
   173		pcm.params.channels = params->codec.ch_out;
   174		pcm.params.rate = params->codec.sample_rate;
   175		pcm.params.buffer_fmt = SOF_IPC_BUFFER_INTERLEAVED;
   176		pcm.params.frame_fmt = SOF_IPC_FRAME_S32_LE;
   177		pcm.params.sample_container_bytes =
   178			snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S32) >> 3;
   179		pcm.params.host_period_bytes = params->buffer.fragment_size;
   180	
   181		ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
   182					 &ipc_params_reply, sizeof(ipc_params_reply));
   183		if (ret < 0) {
   184			dev_err(component->dev, "error ipc failed\n");
   185			return ret;
   186		}
   187	
   188		sstream->sample_rate = params->codec.sample_rate;
   189		spcm->prepared[cstream->direction] = true;
   190	
   191		return 0;
   192	}
   193	
 > 194	int sof_compr_get_params(struct snd_soc_component *component,
   195				 struct snd_compr_stream *cstream, struct snd_codec *params)
   196	{
   197		return 0;
   198	}
   199	
 > 200	int sof_compr_trigger(struct snd_soc_component *component,
   201			      struct snd_compr_stream *cstream, int cmd)
   202	{
   203		struct sof_ipc_stream stream;
   204		struct sof_ipc_reply reply;
   205		struct snd_soc_pcm_runtime *rtd = cstream->private_data;
   206		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
   207		struct snd_sof_pcm *spcm;
   208	
   209		spcm = snd_sof_find_spcm_dai(component, rtd);
   210		if (!spcm)
   211			return -EINVAL;
   212	
   213		stream.hdr.size = sizeof(stream);
   214		stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG;
   215		stream.comp_id = spcm->stream[cstream->direction].comp_id;
   216	
   217		switch (cmd) {
   218		case SNDRV_PCM_TRIGGER_START:
   219			stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_START;
   220			break;
   221		case SNDRV_PCM_TRIGGER_STOP:
   222			stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
   223			break;
   224		default:
   225			dev_err(component->dev, "error: unhandled trigger cmd %d\n", cmd);
   226			break;
   227		}
   228	
   229		return sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd,
   230					  &stream, sizeof(stream),
   231					  &reply, sizeof(reply));
   232	}
   233	
 > 234	int sof_compr_copy(struct snd_soc_component *component,
   235			   struct snd_compr_stream *cstream,
   236			   char __user *buf, size_t count)
   237	{
   238		struct snd_compr_runtime *rtd = cstream->runtime;
   239		unsigned int offset, n;
   240		void *ptr;
   241		int ret;
   242	
   243		if (count > rtd->buffer_size)
   244			count = rtd->buffer_size;
   245	
   246		div_u64_rem(rtd->total_bytes_available, rtd->buffer_size, &offset);
   247		ptr = rtd->dma_area + offset;
   248		n = rtd->buffer_size - offset;
   249	
   250		if (count < n) {
   251			ret = copy_from_user(ptr, buf, count);
   252		} else {
   253			ret = copy_from_user(ptr, buf, n);
   254			ret += copy_from_user(rtd->dma_area, buf + n, count - n);
   255		}
   256	
   257		return count - ret;
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
