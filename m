Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562FF370D56
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337058; cv=none; b=omdoVDPFkESDeECV06lN1N7fQCTqMHBPcUExNkfCNn3HZaD+Clw4407tsutfSINuJFz7u2ECwVtdRhL3+fcOsJMeoIPC4yFcm1EJykVyNttFjSEqRUoJnhj3zLabeOyHqAX2AK3lIfZw/72vXKK9pTR+VfuE9Yl9WNcrChOQS/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337058; c=relaxed/simple;
	bh=YM2HuFwyCoLpuI4ddHMpNcJo6NrnxbP4njGrBLqdZR0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HS0wP2+OYv2MXF+V7SiFTjW1iXUS7dRPGIGOloftqafyMOh8wQB71wwJ+Bu5P2aOdYop18XAXS9/JXDqjeoIsJ2Slg+UNa5YOx5du37XMbH5pGblUq4oaU9uCkRBf7RRWyovtHgXiHf98ZqeJB2/ot0ZNP1NvmUZV9VYv0C8xAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9l9AyJt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9l9AyJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780337056; x=1811873056;
  h=date:from:to:cc:subject:message-id;
  bh=YM2HuFwyCoLpuI4ddHMpNcJo6NrnxbP4njGrBLqdZR0=;
  b=a9l9AyJtO0hxssHqa5xz02++XBw31Cw+DTbKHEE4CwQpb88nY5KCFzOL
   H4Ew3dMYh1GjEj1V59dLJaaX7aYJOoRRo5I918M/ju3kPvDc04XD15iDs
   EBxfkAzzyALTtgVIaIwMsgDgOsyCJGjK5nTtMWgIyTPHXM5ROCulA7Fm2
   UJy7pNB64cYtlLXTDRUN0a9eYR5ilbrDdMepajb6P3hZNo9hjNo8CAxOc
   dIjmz0T0nFi3s4dKKR4EEvBJ+zWbu3cha/u1etjaZb9l1aK15r9Pp2It2
   daVt7XJukuU57lWFZiM1XZpIbk+11m7pbJMlwn4/WmJ0LS0aP+4EQwpH7
   A==;
X-CSE-ConnectionGUID: 8io2BUfJSxG2NmKJNgfGAQ==
X-CSE-MsgGUID: TZasVM8cQg2qiqLIRPczkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80133029"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80133029"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 11:04:16 -0700
X-CSE-ConnectionGUID: iTB0t13WSEypuF291kXS5w==
X-CSE-MsgGUID: kZ3Q6JsmSPW5hyjlCQhyVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="239231653"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2026 11:04:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU6zk-00000000Auo-23wV;
	Mon, 01 Jun 2026 18:04:12 +0000
Date: Tue, 02 Jun 2026 02:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/fsl/imx-hdmi.c:126:16: error: too many arguments to function
 'devm_snd_soc_card_alloc'
Message-ID: <202606020131.bEJrevtH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 77a43a25a5d98318e0a6c80e4f4d9e62bed0f3e6 [290/290] ASoC: fsl: imx-hdmi: use snd_soc_card_register()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020131.bEJrevtH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020131.bEJrevtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020131.bEJrevtH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from include/asm-generic/bitops.h:31,
                    from ./arch/nios2/include/generated/asm/bitops.h:1,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/nios2/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from sound/soc/fsl/imx-hdmi.c:4:
   sound/soc/fsl/imx-hdmi.c: In function 'imx_hdmi_probe':
   include/linux/init.h:174:22: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     174 | #define THIS_MODULE (&__this_module)
         |                     ~^~~~~~~~~~~~~~~
         |                      |
         |                      struct module *
   sound/soc/fsl/imx-hdmi.c:126:52: note: in expansion of macro 'THIS_MODULE'
     126 |         card = devm_snd_soc_card_alloc(&pdev->dev, THIS_MODULE, &data->card_driver,
         |                                                    ^~~~~~~~~~~
   In file included from include/sound/soc.h:1318,
                    from include/sound/hdmi-codec.h:16,
                    from sound/soc/fsl/imx-hdmi.c:8:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> sound/soc/fsl/imx-hdmi.c:126:16: error: too many arguments to function 'devm_snd_soc_card_alloc'
     126 |         card = devm_snd_soc_card_alloc(&pdev->dev, THIS_MODULE, &data->card_driver,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/sound/soc.h:1318,
                    from include/sound/hdmi-codec.h:16,
                    from sound/soc/fsl/imx-hdmi.c:8:
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/devm_snd_soc_card_alloc +126 sound/soc/fsl/imx-hdmi.c

    97	
    98	static int imx_hdmi_probe(struct platform_device *pdev)
    99	{
   100		struct device_node *np = pdev->dev.of_node;
   101		bool hdmi_out = of_property_read_bool(np, "hdmi-out");
   102		bool hdmi_in = of_property_read_bool(np, "hdmi-in");
   103		struct snd_soc_dai_link_component *dlc;
   104		struct snd_soc_card *card;
   105		struct device_node *cpu_np;
   106		struct imx_hdmi_data *data;
   107		int ret;
   108	
   109		dlc = devm_kzalloc(&pdev->dev, 3 * sizeof(*dlc), GFP_KERNEL);
   110		if (!dlc)
   111			return -ENOMEM;
   112	
   113		cpu_np = of_parse_phandle(np, "audio-cpu", 0);
   114		if (!cpu_np) {
   115			dev_err(&pdev->dev, "cpu dai phandle missing or invalid\n");
   116			ret = -EINVAL;
   117			goto fail;
   118		}
   119	
   120		data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
   121		if (!data) {
   122			ret = -ENOMEM;
   123			goto fail;
   124		}
   125	
 > 126		card = devm_snd_soc_card_alloc(&pdev->dev, THIS_MODULE, &data->card_driver,
   127					       NULL, NULL, NULL);
   128		if (!card) {
   129			ret = -ENOMEM;
   130			goto fail;
   131		}
   132	
   133		data->dai.cpus = &dlc[0];
   134		data->dai.num_cpus = 1;
   135		data->dai.platforms = &dlc[1];
   136		data->dai.num_platforms = 1;
   137		data->dai.codecs = &dlc[2];
   138		data->dai.num_codecs = 1;
   139	
   140		data->dai.name = "i.MX HDMI";
   141		data->dai.stream_name = "i.MX HDMI";
   142		data->dai.cpus->of_node = cpu_np;
   143		data->dai.platforms->of_node = cpu_np;
   144		data->dai.ops = &imx_hdmi_ops;
   145		data->dai.playback_only = true;
   146		data->dai.capture_only = false;
   147		data->dai.init = imx_hdmi_init;
   148	
   149		if (of_node_name_eq(cpu_np, "sai")) {
   150			data->cpu_priv.sysclk_id[1] = FSL_SAI_CLK_MAST1;
   151			data->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
   152		}
   153	
   154		if (of_device_is_compatible(np, "fsl,imx-audio-sii902x")) {
   155			data->dai_fmt = SND_SOC_DAIFMT_LEFT_J;
   156			data->cpu_priv.slot_width = 24;
   157		} else {
   158			data->dai_fmt = SND_SOC_DAIFMT_I2S;
   159			data->cpu_priv.slot_width = 32;
   160		}
   161	
   162		if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
   163			dev_err(&pdev->dev, "Invalid HDMI DAI link\n");
   164			ret = -EINVAL;
   165			goto fail;
   166		}
   167	
   168		if (hdmi_out) {
   169			data->dai.playback_only = true;
   170			data->dai.capture_only = false;
   171			data->dai.codecs->dai_name = "i2s-hifi";
   172			data->dai.codecs->name = "hdmi-audio-codec.1";
   173			data->dai.dai_fmt = data->dai_fmt |
   174					    SND_SOC_DAIFMT_NB_NF |
   175					    SND_SOC_DAIFMT_CBC_CFC;
   176		}
   177	
   178		if (hdmi_in) {
   179			data->dai.playback_only = false;
   180			data->dai.capture_only = true;
   181			data->dai.codecs->dai_name = "i2s-hifi";
   182			data->dai.codecs->name = "hdmi-audio-codec.2";
   183			data->dai.dai_fmt = data->dai_fmt |
   184					    SND_SOC_DAIFMT_NB_NF |
   185					    SND_SOC_DAIFMT_CBP_CFP;
   186		}
   187	
   188		data->card_driver.dapm_widgets = imx_hdmi_widgets;
   189		data->card_driver.num_dapm_widgets = ARRAY_SIZE(imx_hdmi_widgets);
   190		ret = snd_soc_card_of_parse_name(card, "model");
   191		if (ret)
   192			goto fail;
   193	
   194		data->card_driver.num_links = 1;
   195		data->card_driver.dai_link = &data->dai;
   196	
   197		snd_soc_card_attach_priv(card, data);
   198		ret = devm_snd_soc_card_register(card);
   199		if (ret) {
   200			dev_err_probe(&pdev->dev, ret, "snd_soc_card_register failed\n");
   201			goto fail;
   202		}
   203	
   204	fail:
   205		of_node_put(cpu_np);
   206	
   207		return ret;
   208	}
   209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
