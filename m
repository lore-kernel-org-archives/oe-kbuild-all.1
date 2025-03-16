Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CB940C03
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151847; cv=none; b=SijdFfbgtT+b9qy+hvD17rlr2oCoQW8/SYlGPbWUMuRailHYX70Uu+xSQAGbliqeuY9yvbxss9aB90KxbdjX9uqhYPE5ce82cVXpYWQZwV2/V01a8AMlLf54k9CIbX00yTRIqnnB9GPSVj4Cs4F2ZPVDJUxbM4YAUnOia6UwG4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151847; c=relaxed/simple;
	bh=4KxkaYTu/2lRzjlwiXdtwQGylVF22noTXVF93Z81Enc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kLOgUV4MoHMp6aK4xjVjRJR8ItMBi7n5mUqCqhJgReKUJ/umBdw9f70qEs1bw4QCwkv5qoDXU6jw8tzdBD4VSnLDScvi2JmX8ZElN/96L6oeFUujABhlf75GFGw5SRQJfFtP8/SAaAmuw6AFbXVAha5fE8ZQVnt6Yx+d7d/g0GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ebv3RHl0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ebv3RHl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742151846; x=1773687846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4KxkaYTu/2lRzjlwiXdtwQGylVF22noTXVF93Z81Enc=;
  b=Ebv3RHl0e8dOHCwnuU+gr31AIXNBD/ULUTzjmHPNwmqzq4Yt2nqI2wk2
   msu68Tysxn71urQUWXnNsZ2YkGWy50lio20UkUTS5SC1LvKJNsJvJhkwX
   wYspKuC2InATtExNoXmXCofaoqWYn/vAi8aiQxwtThen20YFktMuDx01A
   CRoGnr3mz41BrIom0PwnUdBwm96RAF6gG+t8J2qixmpcaw9rsD6yGRuKv
   BBbAKGtmpwgOIgINzMuaRdXXXwVELBHhkP02WRZdeS01eM6t6n0oPisyr
   mG3lZ0Ywv1116x1wKofvWnfoDnMYuU/JFFErZvMyrSCHmZyXlKpjqYYUI
   w==;
X-CSE-ConnectionGUID: FEu5LU4dQ7GGJngLLk4Vfg==
X-CSE-MsgGUID: +0h24MpzTbuR284B6zKTMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43115383"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="43115383"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 12:04:05 -0700
X-CSE-ConnectionGUID: GP31aedlQwKNiIL1Te3d4A==
X-CSE-MsgGUID: FeqxGX/oR6e76kp/mrThww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="121466339"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Mar 2025 12:04:03 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tttHE-000CBX-2x;
	Sun, 16 Mar 2025 19:04:00 +0000
Date: Mon, 17 Mar 2025 03:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [linux-next:master 8849/11207]
 sound/soc/sof/intel/hda-sdw-bpt.c:127: undefined reference to
 `snd_hdac_ext_stream_reset'
Message-ID: <202503170249.iPSBJSf5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: 3394e2b125043aeede344d28fc73b3c0d2a5c21f [8849/11207] ASoC: SOF: Intel: hda-sdw-bpt: add CHAIN_DMA support
config: x86_64-randconfig-073-20250316 (https://download.01.org/0day-ci/archive/20250317/202503170249.iPSBJSf5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503170249.iPSBJSf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503170249.iPSBJSf5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `hda_sdw_bpt_dma_prepare':
>> sound/soc/sof/intel/hda-sdw-bpt.c:127: undefined reference to `snd_hdac_ext_stream_reset'
>> ld: sound/soc/sof/intel/hda-sdw-bpt.c:129: undefined reference to `snd_hdac_ext_stream_setup'
>> ld: sound/soc/sof/intel/hda-sdw-bpt.c:140: undefined reference to `snd_hdac_ext_bus_link_set_stream_id'
   ld: vmlinux.o: in function `hda_sdw_bpt_dma_deprepare':
   sound/soc/sof/intel/hda-sdw-bpt.c:168: undefined reference to `snd_hdac_ext_bus_link_clear_stream_id'
   ld: vmlinux.o: in function `hda_sdw_bpt_dma_enable':
>> sound/soc/sof/intel/hda-sdw-bpt.c:210: undefined reference to `snd_hdac_ext_stream_start'
   ld: vmlinux.o: in function `hda_sdw_bpt_dma_disable':
>> sound/soc/sof/intel/hda-sdw-bpt.c:222: undefined reference to `snd_hdac_ext_stream_clear'


vim +127 sound/soc/sof/intel/hda-sdw-bpt.c

    91	
    92	static int hda_sdw_bpt_dma_prepare(struct device *dev, struct hdac_ext_stream **sdw_bpt_stream,
    93					   struct snd_dma_buffer *dmab_bdl, u32 bpt_num_bytes,
    94					   unsigned int num_channels, int direction)
    95	{
    96		struct snd_sof_dev *sdev = dev_get_drvdata(dev);
    97		struct hdac_ext_stream *bpt_stream;
    98		unsigned int format = HDA_CL_STREAM_FORMAT;
    99	
   100		/*
   101		 * the baseline format needs to be adjusted to
   102		 * bandwidth requirements
   103		 */
   104		format |= (num_channels - 1);
   105		format |= BPT_MULTIPLIER << AC_FMT_MULT_SHIFT;
   106	
   107		dev_dbg(dev, "direction %d format_val %#x\n", direction, format);
   108	
   109		bpt_stream = hda_cl_prepare(dev, format, bpt_num_bytes, dmab_bdl, false, direction, false);
   110		if (IS_ERR(bpt_stream)) {
   111			dev_err(sdev->dev, "%s: SDW BPT DMA prepare failed: dir %d\n",
   112				__func__, direction);
   113			return PTR_ERR(bpt_stream);
   114		}
   115		*sdw_bpt_stream = bpt_stream;
   116	
   117		if (!sdev->dspless_mode_selected) {
   118			struct hdac_stream *hstream;
   119			u32 mask;
   120	
   121			/* decouple host and link DMA if the DSP is used */
   122			hstream = &bpt_stream->hstream;
   123			mask = BIT(hstream->index);
   124	
   125			snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL, mask, mask);
   126	
 > 127			snd_hdac_ext_stream_reset(bpt_stream);
   128	
 > 129			snd_hdac_ext_stream_setup(bpt_stream, format);
   130		}
   131	
   132		if (hdac_stream(bpt_stream)->direction == SNDRV_PCM_STREAM_PLAYBACK) {
   133			struct hdac_bus *bus = sof_to_bus(sdev);
   134			struct hdac_ext_link *hlink;
   135			int stream_tag;
   136	
   137			stream_tag = hdac_stream(bpt_stream)->stream_tag;
   138			hlink = hdac_bus_eml_sdw_get_hlink(bus);
   139	
 > 140			snd_hdac_ext_bus_link_set_stream_id(hlink, stream_tag);
   141		}
   142		return 0;
   143	}
   144	
   145	static int hda_sdw_bpt_dma_deprepare(struct device *dev, struct hdac_ext_stream *sdw_bpt_stream,
   146					     struct snd_dma_buffer *dmab_bdl)
   147	{
   148		struct snd_sof_dev *sdev = dev_get_drvdata(dev);
   149		struct hdac_stream *hstream;
   150		u32 mask;
   151		int ret;
   152	
   153		ret = hda_cl_cleanup(sdev->dev, dmab_bdl, true, sdw_bpt_stream);
   154		if (ret < 0) {
   155			dev_err(sdev->dev, "%s: SDW BPT DMA cleanup failed\n",
   156				__func__);
   157			return ret;
   158		}
   159	
   160		if (hdac_stream(sdw_bpt_stream)->direction == SNDRV_PCM_STREAM_PLAYBACK) {
   161			struct hdac_bus *bus = sof_to_bus(sdev);
   162			struct hdac_ext_link *hlink;
   163			int stream_tag;
   164	
   165			stream_tag = hdac_stream(sdw_bpt_stream)->stream_tag;
   166			hlink = hdac_bus_eml_sdw_get_hlink(bus);
   167	
   168			snd_hdac_ext_bus_link_clear_stream_id(hlink, stream_tag);
   169		}
   170	
   171		if (!sdev->dspless_mode_selected) {
   172			/* Release CHAIN_DMA resources */
   173			ret = chain_dma_trigger(sdev, hdac_stream(sdw_bpt_stream)->stream_tag,
   174						hdac_stream(sdw_bpt_stream)->direction,
   175						SOF_IPC4_PIPE_RESET);
   176			if (ret < 0)
   177				dev_err(sdev->dev, "%s: chain_dma_trigger PIPE_RESET failed: %d\n",
   178					__func__, ret);
   179	
   180			/* couple host and link DMA */
   181			hstream = &sdw_bpt_stream->hstream;
   182			mask = BIT(hstream->index);
   183	
   184			snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL, mask, 0);
   185		}
   186	
   187		return 0;
   188	}
   189	
   190	static int hda_sdw_bpt_dma_enable(struct device *dev, struct hdac_ext_stream *sdw_bpt_stream)
   191	{
   192		struct snd_sof_dev *sdev = dev_get_drvdata(dev);
   193		int ret;
   194	
   195		ret = hda_cl_trigger(sdev->dev, sdw_bpt_stream, SNDRV_PCM_TRIGGER_START);
   196		if (ret < 0)
   197			dev_err(sdev->dev, "%s: SDW BPT DMA trigger start failed\n", __func__);
   198	
   199		if (!sdev->dspless_mode_selected) {
   200			/* the chain DMA needs to be programmed before the DMAs */
   201			ret = chain_dma_trigger(sdev, hdac_stream(sdw_bpt_stream)->stream_tag,
   202						hdac_stream(sdw_bpt_stream)->direction,
   203						SOF_IPC4_PIPE_RUNNING);
   204			if (ret < 0) {
   205				dev_err(sdev->dev, "%s: chain_dma_trigger failed: %d\n",
   206					__func__, ret);
   207				hda_cl_trigger(sdev->dev, sdw_bpt_stream, SNDRV_PCM_TRIGGER_STOP);
   208				return ret;
   209			}
 > 210			snd_hdac_ext_stream_start(sdw_bpt_stream);
   211		}
   212	
   213		return ret;
   214	}
   215	
   216	static int hda_sdw_bpt_dma_disable(struct device *dev, struct hdac_ext_stream *sdw_bpt_stream)
   217	{
   218		struct snd_sof_dev *sdev = dev_get_drvdata(dev);
   219		int ret;
   220	
   221		if (!sdev->dspless_mode_selected) {
 > 222			snd_hdac_ext_stream_clear(sdw_bpt_stream);
   223	
   224			ret = chain_dma_trigger(sdev, hdac_stream(sdw_bpt_stream)->stream_tag,
   225						hdac_stream(sdw_bpt_stream)->direction,
   226						SOF_IPC4_PIPE_PAUSED);
   227			if (ret < 0)
   228				dev_err(sdev->dev, "%s: chain_dma_trigger PIPE_PAUSED failed: %d\n",
   229					__func__, ret);
   230		}
   231	
   232		ret = hda_cl_trigger(sdev->dev, sdw_bpt_stream, SNDRV_PCM_TRIGGER_STOP);
   233		if (ret < 0)
   234			dev_err(sdev->dev, "%s: SDW BPT DMA trigger stop failed\n", __func__);
   235	
   236		return ret;
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
