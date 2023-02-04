Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817C3217
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675539117; x=1707075117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UaRA8+BZE3qKr+TMa90/CDBfnGJflDQO53K3ZB7ItfQ=;
  b=IuoklSLd/xIFETs9djeBmREARWq/qvjZvb2KwtuSHceE72S2kaSgxz/Q
   H2UdwFu55Lf+UtDnLfoGFN1ZLZFNi5k2Tw/ElIuu24RcCNqDjkmgtnJQb
   3XiEUAtkZPN9s0I0kIayqqCPazjLkxm/7WpVVqfgw5clGVC46ug7Soi4y
   rb1FzwcNlQEG8OeYceJk2AmRp0f6FzHsIYZe1cw/1hBWbQYiAS+AO/4Ky
   8f3Euiaq1cYgvTa3kjy+91jr8pWOxpbAznIcieGNTzQbZ+DbLOmMtLiNB
   O1kcRJCCdSDePOQF2QvE+kiwruJdZhXjoOfPR/xnKpPjArlZUKVQWfQZ5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="327610468"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="327610468"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 11:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698428491"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="698428491"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2023 11:31:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOOGQ-0001V2-17;
	Sat, 04 Feb 2023 19:31:54 +0000
Date: Sun, 5 Feb 2023 03:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 256/20209]
 sound/soc/sof/compress.c:91:5: warning: no previous prototype for
 'sof_compr_open'
Message-ID: <202302050313.dHxpaOmQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 9d5a6e760c0053b3a3d61fd4c6b95b313e9ffa60 [256/20209] ASoC: SOF: compr: Add compress ops implementation
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302050313.dHxpaOmQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/9d5a6e760c0053b3a3d61fd4c6b95b313e9ffa60
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 9d5a6e760c0053b3a3d61fd4c6b95b313e9ffa60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/backlight/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/sof/compress.c:91:5: warning: no previous prototype for 'sof_compr_open' [-Wmissing-prototypes]
      91 | int sof_compr_open(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~
>> sound/soc/sof/compress.c:122:5: warning: no previous prototype for 'sof_compr_free' [-Wmissing-prototypes]
     122 | int sof_compr_free(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~
>> sound/soc/sof/compress.c:140:5: warning: no previous prototype for 'sof_compr_set_params' [-Wmissing-prototypes]
     140 | int sof_compr_set_params(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/compress.c:194:5: warning: no previous prototype for 'sof_compr_get_params' [-Wmissing-prototypes]
     194 | int sof_compr_get_params(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/compress.c:200:5: warning: no previous prototype for 'sof_compr_trigger' [-Wmissing-prototypes]
     200 | int sof_compr_trigger(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~
>> sound/soc/sof/compress.c:234:5: warning: no previous prototype for 'sof_compr_copy' [-Wmissing-prototypes]
     234 | int sof_compr_copy(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
