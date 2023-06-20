Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913BF182BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 20:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687292028; x=1718828028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yPSuLUZGBrAkUwOVKap/qjBnMC2qd+ZFNZ39KAY/1hk=;
  b=iceC2gQypOjV1gUfXiQVAX3R5EU0nn7NW4OgiyBNXMRU2rrdM4J4VZJV
   QPs9Mnf8EDDPUoOj629c6T1DHNxchX0g2vCmMleS9svBl9+I9+RUEbQ5W
   MQK4Nrvzlkwgq9ayF2NzujtdOvOQvtD2LvwnDYn+GFkKabNaBXrEWJ5ZZ
   gvwbtMsxQmmFNette8Ms84L8EV3hACI52lbbPjPJQG5PeTsoD1vcnCKpD
   KvjmMV0ovlTo8okvJfSMciRzYt4vG52Pj7aEMdY/Dy7dmnLGl6ko0Ca6T
   FM3ks7EnQPDSPVCT36C+f5pupBfKnJo9Vs8zsrSKfgq/skH7IEZJFg8xe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349705410"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="349705410"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 13:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="804075994"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="804075994"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2023 13:13:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBhjN-0006EA-2D;
	Tue, 20 Jun 2023 20:13:37 +0000
Date: Wed, 21 Jun 2023 04:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Brent Lu <brent.lu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [intel-lts:5.10/yocto 7/27]
 sound/soc/intel/boards/sof_ssp_amp.c:97:6: warning: variable 'i' set but not
 used
Message-ID: <202306210459.h4ddIjTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   a60790fda7b098895a79befe8d7c941712259ba4
commit: a41f0aabc1bf541c508a0dcea04f5fef66ea2f0b [7/27] ASoC: Intel: sof_ssp_amp: rename driver and support cs35l41 amplifier
config: i386-randconfig-i012-20230621 (https://download.01.org/0day-ci/archive/20230621/202306210459.h4ddIjTJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210459.h4ddIjTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210459.h4ddIjTJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/intel/boards/sof_ssp_amp.c:97:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]
           int i = 0;
               ^
   1 warning generated.


vim +/i +97 sound/soc/intel/boards/sof_ssp_amp.c

    89	
    90	static int sof_card_late_probe(struct snd_soc_card *card)
    91	{
    92		struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
    93		struct snd_soc_component *component = NULL;
    94		char jack_name[NAME_SIZE];
    95		struct sof_hdmi_pcm *pcm;
    96		int err;
  > 97		int i = 0;
    98	
    99		if (!(sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT))
   100			return 0;
   101	
   102		/* HDMI is not supported by SOF on Baytrail/CherryTrail */
   103		if (!ctx->idisp_codec)
   104			return 0;
   105	
   106		if (list_empty(&ctx->hdmi_pcm_list))
   107			return -EINVAL;
   108	
   109		if (ctx->common_hdmi_codec_drv) {
   110			pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm,
   111					       head);
   112			component = pcm->codec_dai->component;
   113			return hda_dsp_hdmi_build_controls(card, component);
   114		}
   115	
   116		list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
   117			component = pcm->codec_dai->component;
   118			snprintf(jack_name, sizeof(jack_name),
   119				 "HDMI/DP, pcm=%d Jack", pcm->device);
   120			err = snd_soc_card_jack_new(card, jack_name,
   121						    SND_JACK_AVOUT, &pcm->sof_hdmi,
   122						    NULL, 0);
   123	
   124			if (err)
   125				return err;
   126	
   127			err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
   128						  &pcm->sof_hdmi);
   129			if (err < 0)
   130				return err;
   131	
   132			i++;
   133		}
   134	
   135		return hdac_hdmi_jack_port_init(component, &card->dapm);
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
