Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C079CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 12:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685191565; x=1716727565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DYA9Q4r8NxNLW+TQrFdL+zw4LjmMFm2kbZAGTy0uLNQ=;
  b=cp4KmczfYFqcVtZnVHY52GFGy3d2pe+gAqZHiWMORo1VGEYdB2+WvBxp
   BVKzl27E5XCZCpizsBt5/4uRGTE0IvGBpXJbYqyPfPUb+V0u6ft4Np1Bk
   byKOr1U7wZDv0uRNexNkMH75mXQad0jyUYG3zlWkLr9gFiVFmflh2Z8xd
   KjQoecaoRLlLMKTaFmZPKPtcTfVpszu6S/zfUg4fSNikup4CyIB7WZqsc
   1sn96dSRtZu3EqyVomFf2tte/M74ivJKuhG2cTMPXcLD5HDTFToPINIqz
   4uruhtELwRjQl5w5PDO2bfzwPjVTK9jW54t7Mf2a9jY+ddtzNE3RF1HWi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="420151873"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="420151873"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 05:46:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="738570071"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="738570071"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 May 2023 05:46:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2tJ4-000Jxy-16;
	Sat, 27 May 2023 12:46:02 +0000
Date: Sat, 27 May 2023 20:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:sdw/mtl-12.288 4/11]
 sound/soc/sof/ipc4-topology.c:1819:10: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202305272056.3H6z458A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/mtl-12.288
head:   fecf0719682c29881a28d0ba07c7450fc4d70e00
commit: 53afe5ec67890a5746047005ba7f9446db59392a [4/11] fixup! ASoC: SOF: ipc4-topology: Fix the output reference params for SRC
config: i386-randconfig-r025-20230526 (https://download.01.org/0day-ci/archive/20230527/202305272056.3H6z458A-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/plbossart/sound/commit/53afe5ec67890a5746047005ba7f9446db59392a
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound sdw/mtl-12.288
        git checkout 53afe5ec67890a5746047005ba7f9446db59392a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305272056.3H6z458A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/ipc4-topology.c:1819:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return ret;
                          ^~~
   sound/soc/sof/ipc4-topology.c:1814:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +1819 sound/soc/sof/ipc4-topology.c

b3562fe1dff136 Ranjani Sridharan 2022-02-13  1800  
197b852a0891d9 Rander Wang       2022-06-13  1801  static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
197b852a0891d9 Rander Wang       2022-06-13  1802  				       struct snd_pcm_hw_params *fe_params,
197b852a0891d9 Rander Wang       2022-06-13  1803  				       struct snd_sof_platform_stream_params *platform_params,
197b852a0891d9 Rander Wang       2022-06-13  1804  				       struct snd_pcm_hw_params *pipeline_params, int dir)
197b852a0891d9 Rander Wang       2022-06-13  1805  {
197b852a0891d9 Rander Wang       2022-06-13  1806  	struct snd_soc_component *scomp = swidget->scomp;
197b852a0891d9 Rander Wang       2022-06-13  1807  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
197b852a0891d9 Rander Wang       2022-06-13  1808  	struct sof_ipc4_src *src = swidget->private;
8f3fc5d0cfdee6 Ranjani Sridharan 2023-01-30  1809  	struct sof_ipc4_available_audio_format *available_fmt = &src->available_fmt;
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1810  	struct sof_ipc4_audio_format *out_audio_fmt;
53afe5ec67890a Ranjani Sridharan 2023-05-22  1811  	struct sof_ipc4_audio_format *in_audio_fmt;
4d63163dfc7d38 Ranjani Sridharan 2023-04-19  1812  	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
53afe5ec67890a Ranjani Sridharan 2023-05-22  1813  	int output_format_index, input_format_index;
53afe5ec67890a Ranjani Sridharan 2023-05-22  1814  	int ret;
197b852a0891d9 Rander Wang       2022-06-13  1815  
53afe5ec67890a Ranjani Sridharan 2023-05-22  1816  	input_format_index = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->base_config,
dbfb4a73357a8f Ranjani Sridharan 2023-04-19  1817  							   pipeline_params, available_fmt);
53afe5ec67890a Ranjani Sridharan 2023-05-22  1818  	if (input_format_index < 0)
197b852a0891d9 Rander Wang       2022-06-13 @1819  		return ret;
197b852a0891d9 Rander Wang       2022-06-13  1820  
63340761bba2ff Ranjani Sridharan 2023-04-28  1821  	/*
63340761bba2ff Ranjani Sridharan 2023-04-28  1822  	 * For playback, the SRC sink rate will be configured based on the requested output
63340761bba2ff Ranjani Sridharan 2023-04-28  1823  	 * format, which is restricted to only deal with DAI's with a single format for now.
63340761bba2ff Ranjani Sridharan 2023-04-28  1824  	 */
63340761bba2ff Ranjani Sridharan 2023-04-28  1825  	if (dir == SNDRV_PCM_STREAM_PLAYBACK && available_fmt->num_output_formats > 1) {
63340761bba2ff Ranjani Sridharan 2023-04-28  1826  		dev_err(sdev->dev, "Invalid number of output formats: %d for SRC %s\n",
63340761bba2ff Ranjani Sridharan 2023-04-28  1827  			available_fmt->num_output_formats, swidget->widget->name);
63340761bba2ff Ranjani Sridharan 2023-04-28  1828  		return -EINVAL;
63340761bba2ff Ranjani Sridharan 2023-04-28  1829  	}
63340761bba2ff Ranjani Sridharan 2023-04-28  1830  
53afe5ec67890a Ranjani Sridharan 2023-05-22  1831  	/*
53afe5ec67890a Ranjani Sridharan 2023-05-22  1832  	 * SRC does not perform format conversion, so the output channels and valid bit depth must
53afe5ec67890a Ranjani Sridharan 2023-05-22  1833  	 * be the same as that of the input.
53afe5ec67890a Ranjani Sridharan 2023-05-22  1834  	 */
53afe5ec67890a Ranjani Sridharan 2023-05-22  1835  	in_audio_fmt = &available_fmt->input_pin_fmts[input_format_index].audio_fmt;
53afe5ec67890a Ranjani Sridharan 2023-05-22  1836  	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_audio_fmt->fmt_cfg);
53afe5ec67890a Ranjani Sridharan 2023-05-22  1837  	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_audio_fmt->fmt_cfg);
53afe5ec67890a Ranjani Sridharan 2023-05-22  1838  
63340761bba2ff Ranjani Sridharan 2023-04-28  1839  	/*
63340761bba2ff Ranjani Sridharan 2023-04-28  1840  	 * For capture, the SRC module should convert the rate to match the rate requested by the
63340761bba2ff Ranjani Sridharan 2023-04-28  1841  	 * PCM hw_params. Set the reference params based on the fe_params unconditionally as it
63340761bba2ff Ranjani Sridharan 2023-04-28  1842  	 * will be ignored for playback anyway.
63340761bba2ff Ranjani Sridharan 2023-04-28  1843  	 */
63340761bba2ff Ranjani Sridharan 2023-04-28  1844  	out_ref_rate = params_rate(fe_params);
4d63163dfc7d38 Ranjani Sridharan 2023-04-19  1845  
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1846  	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, &src->base_config,
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1847  							     available_fmt, out_ref_rate,
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1848  							     out_ref_channels, out_ref_valid_bits);
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1849  	if (output_format_index < 0) {
4d63163dfc7d38 Ranjani Sridharan 2023-04-19  1850  		dev_err(sdev->dev, "Failed to initialize output format for %s",
4d63163dfc7d38 Ranjani Sridharan 2023-04-19  1851  			swidget->widget->name);
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1852  		return output_format_index;
13e5b53cae9a86 Ranjani Sridharan 2023-04-19  1853  	}
0ab59723f90693 Ranjani Sridharan 2023-04-19  1854  
197b852a0891d9 Rander Wang       2022-06-13  1855  	/* update pipeline memory usage */
3f1e22fd066885 Peter Ujfalusi    2023-04-26  1856  	sof_ipc4_update_resource_usage(sdev, swidget, &src->base_config);
197b852a0891d9 Rander Wang       2022-06-13  1857  
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1858  	out_audio_fmt = &available_fmt->output_pin_fmts[output_format_index].audio_fmt;
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1859  	src->sink_rate = out_audio_fmt->sampling_frequency;
197b852a0891d9 Rander Wang       2022-06-13  1860  
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1861  	/* update pipeline_params for sink widgets */
0eb3a5e122d42f Ranjani Sridharan 2023-04-28  1862  	return sof_ipc4_update_hw_params(sdev, pipeline_params, out_audio_fmt);
197b852a0891d9 Rander Wang       2022-06-13  1863  }
197b852a0891d9 Rander Wang       2022-06-13  1864  

:::::: The code at line 1819 was first introduced by commit
:::::: 197b852a0891d9b21ca0698d27513cd0c98c845e ASoC: SOF: add ipc4 SRC module support

:::::: TO: Rander Wang <rander.wang@intel.com>
:::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
