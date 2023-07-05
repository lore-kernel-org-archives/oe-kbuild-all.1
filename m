Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08910F0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 05:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688535712; x=1720071712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YalOplbqrAamAEODAwI/tKXi7a8OVnxqRfZbG2iVOBw=;
  b=HQp69tn1FIX1aqH/Xba41USZ0N9lVAG7NfMhVuUl+rqb3ZzLpTiakRk5
   zf/6n2XENkV1K25h3HQxe2ZyCeDo1k24zSpXDO6nCUdMiJj3C6ChHmt3T
   2t4F2/xQwKJxoGlSHuO0zlcdgNfbrIliq6TOreuZ12TrAhl30839GWroh
   edbg1ZvKABJANeliHev2mWAuxxGohOS4K/6pNU3IKvzgshYVyqcxZhWlm
   msoT9se134CKVwiyZqJ6KIMQTdil9WZylrI5SIlQGMTrnnd0SLrdMnrfQ
   LvdJUDf5btRKCpxy8Z+UIgiYpBg2eSJ8AfeghrW4RRkMlN1cIrea7ETHJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="360733051"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="360733051"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 22:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="843161387"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="843161387"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Jul 2023 22:41:50 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGvGv-0000PU-0U;
	Wed, 05 Jul 2023 05:41:49 +0000
Date: Wed, 5 Jul 2023 13:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 34/38]
 drivers/staging/greybus/audio_codec.c:810:26: warning: variable 'card' set
 but not used
Message-ID: <202307051355.BQPsIfxL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   6dd4ae925ae5b90ccfbcb11dce06fd505cc18bc8
commit: 812cf704dac9f2f275d7bc53818fcccde62dcef8 [34/38] staging: greybus: Avoid abusing controls_rwsem
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230705/202307051355.BQPsIfxL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051355.BQPsIfxL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307051355.BQPsIfxL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/greybus/audio_codec.c: In function 'gbaudio_register_module':
>> drivers/staging/greybus/audio_codec.c:810:26: warning: variable 'card' set but not used [-Wunused-but-set-variable]
     810 |         struct snd_card *card;
         |                          ^~~~
   drivers/staging/greybus/audio_codec.c: In function 'gbaudio_unregister_module':
>> drivers/staging/greybus/audio_codec.c:938:26: warning: unused variable 'card' [-Wunused-variable]
     938 |         struct snd_card *card = comp->card->snd_card;
         |                          ^~~~


vim +/card +810 drivers/staging/greybus/audio_codec.c

64a7e2cceb75cca drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  805  
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  806  int gbaudio_register_module(struct gbaudio_module_info *module)
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  807  {
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  808  	int ret;
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  809  	struct snd_soc_component *comp;
2b8c2b51000e3d0 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-04-21 @810  	struct snd_card *card;
ac40b4d1e409971 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  811  	struct gbaudio_jack *jack = NULL;
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  812  
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  813  	if (!gbcodec) {
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  814  		dev_err(module->dev, "GB Codec not yet probed\n");
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  815  		return -EAGAIN;
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  816  	}
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  817  
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  818  	comp = gbcodec->component;
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  819  	card = comp->card->snd_card;
2b8c2b51000e3d0 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-04-21  820  
812cf704dac9f2f drivers/staging/greybus/audio_codec.c Takashi Iwai    2023-07-04  821  	mutex_lock(&gbcodec->register_mutex);
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  822  
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  823  	if (module->num_dais) {
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  824  		dev_err(gbcodec->dev,
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  825  			"%d:DAIs not supported via gbcodec driver\n",
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  826  			module->num_dais);
812cf704dac9f2f drivers/staging/greybus/audio_codec.c Takashi Iwai    2023-07-04  827  		mutex_unlock(&gbcodec->register_mutex);
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  828  		return -EINVAL;
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  829  	}
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  830  
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  831  	ret = gbaudio_init_jack(module, comp->card);
64a7e2cceb75cca drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  832  	if (ret) {
812cf704dac9f2f drivers/staging/greybus/audio_codec.c Takashi Iwai    2023-07-04  833  		mutex_unlock(&gbcodec->register_mutex);
64a7e2cceb75cca drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  834  		return ret;
64a7e2cceb75cca drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  835  	}
64a7e2cceb75cca drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  836  
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  837  	if (module->dapm_widgets)
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  838  		snd_soc_dapm_new_controls(&comp->dapm, module->dapm_widgets,
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  839  					  module->num_dapm_widgets);
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  840  	if (module->controls)
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  841  		snd_soc_add_component_controls(comp, module->controls,
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  842  					       module->num_controls);
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  843  	if (module->dapm_routes)
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  844  		snd_soc_dapm_add_routes(&comp->dapm, module->dapm_routes,
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  845  					module->num_dapm_routes);
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  846  
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  847  	/* card already instantiated, create widgets here only */
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  848  	if (comp->card->instantiated) {
620d28440c10b8f drivers/staging/greybus/audio_codec.c Deepak R Varma  2020-10-22  849  		gbaudio_dapm_link_component_dai_widgets(comp->card, &comp->dapm);
64a7e2cceb75cca drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  850  #ifdef CONFIG_SND_JACK
461ab8077d573d4 drivers/staging/greybus/audio_codec.c Gioh Kim        2017-02-09  851  		/*
461ab8077d573d4 drivers/staging/greybus/audio_codec.c Gioh Kim        2017-02-09  852  		 * register jack devices for this module
461ab8077d573d4 drivers/staging/greybus/audio_codec.c Gioh Kim        2017-02-09  853  		 * from codec->jack_list
461ab8077d573d4 drivers/staging/greybus/audio_codec.c Gioh Kim        2017-02-09  854  		 */
ac40b4d1e409971 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  855  		list_for_each_entry(jack, &module->jack_list, list) {
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  856  			snd_device_register(comp->card->snd_card,
ac40b4d1e409971 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  857  					    jack->jack.jack);
64a7e2cceb75cca drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  858  		}
64a7e2cceb75cca drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  859  #endif
bb9986ef6b311fb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  860  	}
64a7e2cceb75cca drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  861  
c188fdc8176a8cb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  862  	mutex_lock(&gbcodec->lock);
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  863  	list_add(&module->list, &gbcodec->module_list);
c188fdc8176a8cb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  864  	mutex_unlock(&gbcodec->lock);
c188fdc8176a8cb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  865  
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  866  	if (comp->card->instantiated)
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  867  		ret = snd_soc_dapm_new_widgets(comp->card);
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  868  	dev_dbg(comp->dev, "Registered %s module\n", module->name);
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  869  
812cf704dac9f2f drivers/staging/greybus/audio_codec.c Takashi Iwai    2023-07-04  870  	mutex_unlock(&gbcodec->register_mutex);
bb9986ef6b311fb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  871  	return ret;
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  872  }
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  873  EXPORT_SYMBOL(gbaudio_register_module);
d3d2af51f9c2f29 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  874  
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  875  static void gbaudio_codec_clean_data_tx(struct gbaudio_data_connection *data)
25de3491f110648 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-01-13  876  {
79cb2b26f54e883 drivers/staging/greybus/audio_codec.c Chaehyun Lim    2016-09-20  877  	u16 i2s_port, cportid;
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  878  	int ret;
d764212f73cf270 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  879  
d764212f73cf270 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  880  	if (list_is_singular(&gbcodec->module_list)) {
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  881  		ret = gb_audio_apbridgea_stop_tx(data->connection, 0);
5bbe14b7acc2a00 drivers/staging/greybus/audio_codec.c Mark Greer      2016-02-29  882  		if (ret)
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  883  			return;
620d28440c10b8f drivers/staging/greybus/audio_codec.c Deepak R Varma  2020-10-22  884  		ret = gb_audio_apbridgea_shutdown_tx(data->connection, 0);
25de3491f110648 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-01-13  885  		if (ret)
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  886  			return;
d764212f73cf270 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  887  	}
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  888  	i2s_port = 0;	/* fixed for now */
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  889  	cportid = data->connection->hd_cport_id;
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  890  	ret = gb_audio_apbridgea_unregister_cport(data->connection,
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  891  						  i2s_port, cportid,
4a8e519902e73c8 drivers/staging/greybus/audio_codec.c Mark Greer      2016-02-26  892  						  AUDIO_APBRIDGEA_DIRECTION_TX);
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  893  	data->state[0] = GBAUDIO_CODEC_SHUTDOWN;
b19df7b9950cd8c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-02-16  894  }
b19df7b9950cd8c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-02-16  895  
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  896  static void gbaudio_codec_clean_data_rx(struct gbaudio_data_connection *data)
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  897  {
79cb2b26f54e883 drivers/staging/greybus/audio_codec.c Chaehyun Lim    2016-09-20  898  	u16 i2s_port, cportid;
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  899  	int ret;
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  900  
d764212f73cf270 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  901  	if (list_is_singular(&gbcodec->module_list)) {
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  902  		ret = gb_audio_apbridgea_stop_rx(data->connection, 0);
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  903  		if (ret)
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  904  			return;
620d28440c10b8f drivers/staging/greybus/audio_codec.c Deepak R Varma  2020-10-22  905  		ret = gb_audio_apbridgea_shutdown_rx(data->connection, 0);
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  906  		if (ret)
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  907  			return;
d764212f73cf270 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  908  	}
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  909  	i2s_port = 0;	/* fixed for now */
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  910  	cportid = data->connection->hd_cport_id;
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  911  	ret = gb_audio_apbridgea_unregister_cport(data->connection,
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  912  						  i2s_port, cportid,
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  913  						  AUDIO_APBRIDGEA_DIRECTION_RX);
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  914  	data->state[1] = GBAUDIO_CODEC_SHUTDOWN;
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  915  }
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  916  
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  917  static void gbaudio_codec_cleanup(struct gbaudio_module_info *module)
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  918  {
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  919  	struct gbaudio_data_connection *data;
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  920  	int pb_state, cap_state;
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  921  
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  922  	dev_dbg(gbcodec->dev, "%s: removed, cleanup APBridge\n", module->name);
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  923  	list_for_each_entry(data, &module->data_list, list) {
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  924  		pb_state = data->state[0];
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  925  		cap_state = data->state[1];
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  926  
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  927  		if (pb_state > GBAUDIO_CODEC_SHUTDOWN)
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  928  			gbaudio_codec_clean_data_tx(data);
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  929  
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  930  		if (cap_state > GBAUDIO_CODEC_SHUTDOWN)
591c45227a77505 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-04  931  			gbaudio_codec_clean_data_rx(data);
6339d2322c47f4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-01-13  932  	}
6339d2322c47f4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-01-13  933  }
6339d2322c47f4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-01-13  934  
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  935  void gbaudio_unregister_module(struct gbaudio_module_info *module)
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  936  {
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  937  	struct snd_soc_component *comp = gbcodec->component;
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09 @938  	struct snd_card *card = comp->card->snd_card;
ac40b4d1e409971 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  939  	struct gbaudio_jack *jack, *n;
33cc283928249b2 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-08-05  940  	int mask;
b19df7b9950cd8c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-02-16  941  
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  942  	dev_dbg(comp->dev, "Unregister %s module\n", module->name);
b19df7b9950cd8c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-02-16  943  
812cf704dac9f2f drivers/staging/greybus/audio_codec.c Takashi Iwai    2023-07-04  944  	mutex_lock(&gbcodec->register_mutex);
6dd67645f22cfeb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  945  	mutex_lock(&gbcodec->lock);
bb9986ef6b311fb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  946  	gbaudio_codec_cleanup(module);
bb9986ef6b311fb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  947  	list_del(&module->list);
ce7bd8325dc75c8 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  948  	dev_dbg(comp->dev, "Process Unregister %s module\n", module->name);
c188fdc8176a8cb drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  949  	mutex_unlock(&gbcodec->lock);
6339d2322c47f4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-01-13  950  

:::::: The code at line 810 was first introduced by commit
:::::: 2b8c2b51000e3d056f9aa27a64b93feabddf77a4 greybus: audio: Changes in response to ASoC cleanup

:::::: TO: Vaibhav Agarwal <vaibhav.agarwal@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
