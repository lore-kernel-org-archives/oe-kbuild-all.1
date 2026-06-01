Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A261A6835
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331626; cv=none; b=iVogVL91RvUUyQaSdOAv+NXnQkNssPxt3gO7djW11JDIUPrDqawTAph8+zwRjuLIXDZzvS0v1bXHOzU8nYkPuG2w2Ztz5QsM925FHoCVe0nqgizbKnRTUwlpvMGEk0wuqAxn9gaEDcbsO0j6dBrNe75vGIyx8sowdh2r4NeRbpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331626; c=relaxed/simple;
	bh=VcFyqnwz9lEcHDTXMi5UhJ2XhtlVswE3U/D/sKCTKzM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fPYN3PUYlLFHmusyYkpayh4Rr+mKu5oh3bbucXFbRZ3+1gUxkxOKZY9SurltNjrCBePS91sOorVPh6u4h8c+ce7k9QM4Nm//g4w7NqQE6FtS6xhNhqKhAlLvYhWsaINUGEgglRaqwrDbiAbbqDoNM0D+b8M4Ps4elYILIFa9CBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVuJcgSv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVuJcgSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780331624; x=1811867624;
  h=date:from:to:cc:subject:message-id;
  bh=VcFyqnwz9lEcHDTXMi5UhJ2XhtlVswE3U/D/sKCTKzM=;
  b=QVuJcgSvh4wMn27G6PB0ZuaX9S4D08Rd4CeRnNWBDSnoWFfGY6Z638Qe
   Lo7Vv6NKawydGbb+9SzLgClUXLqEc8lJ5Gr0M+ZNtURj504F5NgVPov0D
   /yqQMgh6SzIWgMYmww9fF+v4sYznQUHC4bJZwLcFzY7J2QBG/b3fQAebu
   LoJZcK7DizHlPZlVpkJpNOfhLFdsdzqTXuPMrD7XC7TUYtdv6f7Hu/GHj
   k0bwfUDe0x+R15RMjEb9zceXrgrK8Dq049YtEkfhakW58MWMIUOVllOVH
   xQ+VpoIU+zEkmcrMPOYzEy98ulvDmeCnR8jT5Yh/csk6y1na3jpKzVGQ+
   g==;
X-CSE-ConnectionGUID: qk1g5HN4SDq6u51dTV+DLg==
X-CSE-MsgGUID: MrQbsf/gTVuB0wD6g2lTJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81069829"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81069829"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:33:44 -0700
X-CSE-ConnectionGUID: Mrat32FEQoyEgu+YVA+ilQ==
X-CSE-MsgGUID: FmOGBdu9Que/06HJnK1Nug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243450521"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jun 2026 09:33:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU5a8-00000000AoE-0Ssv;
	Mon, 01 Jun 2026 16:33:40 +0000
Date: Tue, 02 Jun 2026 00:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/fsl/imx-es8328.c:168:16: error: too many arguments to function
 'devm_snd_soc_card_alloc'
Message-ID: <202606020051.C0x9jmBg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 96152fea95db604513be69582e07cab8587750e8 [290/290] ASoC: fsl: imx-es8328: use snd_soc_card_register()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020051.C0x9jmBg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020051.C0x9jmBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020051.C0x9jmBg-lkp@intel.com/

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
                    from sound/soc/fsl/imx-es8328.c:7:
   sound/soc/fsl/imx-es8328.c: In function 'imx_es8328_probe':
   include/linux/init.h:174:22: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     174 | #define THIS_MODULE (&__this_module)
         |                     ~^~~~~~~~~~~~~~~
         |                      |
         |                      struct module *
   sound/soc/fsl/imx-es8328.c:168:45: note: in expansion of macro 'THIS_MODULE'
     168 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &data->card_driver,
         |                                             ^~~~~~~~~~~
   In file included from include/sound/soc.h:1318,
                    from sound/soc/fsl/imx-es8328.c:11:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> sound/soc/fsl/imx-es8328.c:168:16: error: too many arguments to function 'devm_snd_soc_card_alloc'
     168 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &data->card_driver,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/sound/soc.h:1318,
                    from sound/soc/fsl/imx-es8328.c:11:
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/devm_snd_soc_card_alloc +168 sound/soc/fsl/imx-es8328.c

    85	
    86	static int imx_es8328_probe(struct platform_device *pdev)
    87	{
    88		struct device_node *np = pdev->dev.of_node;
    89		struct device_node *ssi_np = NULL, *codec_np = NULL;
    90		struct platform_device *ssi_pdev;
    91		struct imx_es8328_data *data;
    92		struct snd_soc_dai_link_component *comp;
    93		struct snd_soc_card *card;
    94		u32 int_port, ext_port;
    95		int ret;
    96		struct device *dev = &pdev->dev;
    97	
    98		ret = of_property_read_u32(np, "mux-int-port", &int_port);
    99		if (ret) {
   100			dev_err(dev, "mux-int-port missing or invalid\n");
   101			goto fail;
   102		}
   103		if (int_port > MUX_PORT_MAX || int_port == 0) {
   104			dev_err(dev, "mux-int-port: hardware only has %d mux ports\n",
   105				MUX_PORT_MAX);
   106			ret = -EINVAL;
   107			goto fail;
   108		}
   109	
   110		ret = of_property_read_u32(np, "mux-ext-port", &ext_port);
   111		if (ret) {
   112			dev_err(dev, "mux-ext-port missing or invalid\n");
   113			goto fail;
   114		}
   115		if (ext_port > MUX_PORT_MAX || ext_port == 0) {
   116			dev_err(dev, "mux-ext-port: hardware only has %d mux ports\n",
   117				MUX_PORT_MAX);
   118			ret = -EINVAL;
   119			goto fail;
   120		}
   121	
   122		/*
   123		 * The port numbering in the hardware manual starts at 1, while
   124		 * the audmux API expects it starts at 0.
   125		 */
   126		int_port--;
   127		ext_port--;
   128		ret = imx_audmux_v2_configure_port(int_port,
   129				IMX_AUDMUX_V2_PTCR_SYN |
   130				IMX_AUDMUX_V2_PTCR_TFSEL(ext_port) |
   131				IMX_AUDMUX_V2_PTCR_TCSEL(ext_port) |
   132				IMX_AUDMUX_V2_PTCR_TFSDIR |
   133				IMX_AUDMUX_V2_PTCR_TCLKDIR,
   134				IMX_AUDMUX_V2_PDCR_RXDSEL(ext_port));
   135		if (ret) {
   136			dev_err(dev, "audmux internal port setup failed\n");
   137			return ret;
   138		}
   139		ret = imx_audmux_v2_configure_port(ext_port,
   140				IMX_AUDMUX_V2_PTCR_SYN,
   141				IMX_AUDMUX_V2_PDCR_RXDSEL(int_port));
   142		if (ret) {
   143			dev_err(dev, "audmux external port setup failed\n");
   144			return ret;
   145		}
   146	
   147		ssi_np = of_parse_phandle(pdev->dev.of_node, "ssi-controller", 0);
   148		codec_np = of_parse_phandle(pdev->dev.of_node, "audio-codec", 0);
   149		if (!ssi_np || !codec_np) {
   150			dev_err(dev, "phandle missing or invalid\n");
   151			ret = -EINVAL;
   152			goto fail;
   153		}
   154	
   155		ssi_pdev = of_find_device_by_node(ssi_np);
   156		if (!ssi_pdev) {
   157			dev_err(dev, "failed to find SSI platform device\n");
   158			ret = -EINVAL;
   159			goto fail;
   160		}
   161	
   162		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   163		if (!data) {
   164			ret = -ENOMEM;
   165			goto put_device;
   166		}
   167	
 > 168		card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &data->card_driver,
   169					       NULL, NULL, NULL);
   170		if (!card) {
   171			ret = -ENOMEM;
   172			goto put_device;
   173		}
   174	
   175		comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
   176		if (!comp) {
   177			ret = -ENOMEM;
   178			goto put_device;
   179		}
   180	
   181		data->dev = dev;
   182	
   183		data->jack_gpiod = devm_gpiod_get_optional(dev, "jack", GPIOD_IN);
   184		if (IS_ERR(data->jack_gpiod)) {
   185			ret = PTR_ERR(data->jack_gpiod);
   186			goto put_device;
   187		}
   188	
   189		/*
   190		 * CPU == Platform
   191		 * platform is using soc-generic-dmaengine-pcm
   192		 */
   193		data->dai.cpus		=
   194		data->dai.platforms	= &comp[0];
   195		data->dai.codecs	= &comp[1];
   196	
   197		data->dai.num_cpus	= 1;
   198		data->dai.num_codecs	= 1;
   199		data->dai.num_platforms	= 1;
   200	
   201		data->dai.name = "hifi";
   202		data->dai.stream_name = "hifi";
   203		data->dai.codecs->dai_name = "es8328-hifi-analog";
   204		data->dai.codecs->of_node = codec_np;
   205		data->dai.cpus->of_node = ssi_np;
   206		data->dai.init = &imx_es8328_dai_init;
   207		data->dai.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
   208				    SND_SOC_DAIFMT_CBP_CFP;
   209	
   210		data->card_driver.dapm_widgets = imx_es8328_dapm_widgets;
   211		data->card_driver.num_dapm_widgets = ARRAY_SIZE(imx_es8328_dapm_widgets);
   212		data->card_driver.controls = imx_es8328_controls;
   213		data->card_driver.num_controls = ARRAY_SIZE(imx_es8328_controls);
   214		ret = snd_soc_card_of_parse_name(card, "model");
   215		if (ret) {
   216			dev_err(dev, "Unable to parse card name\n");
   217			goto put_device;
   218		}
   219		ret = snd_soc_card_of_parse_audio_routing(card, "audio-routing");
   220		if (ret) {
   221			dev_err(dev, "Unable to parse routing: %d\n", ret);
   222			goto put_device;
   223		}
   224		data->card_driver.num_links = 1;
   225		data->card_driver.dai_link = &data->dai;
   226	
   227		ret = devm_snd_soc_card_register(card);
   228		if (ret) {
   229			dev_err(dev, "Unable to register: %d\n", ret);
   230			goto put_device;
   231		}
   232	
   233		platform_set_drvdata(pdev, data);
   234	put_device:
   235		put_device(&ssi_pdev->dev);
   236	fail:
   237		of_node_put(ssi_np);
   238		of_node_put(codec_np);
   239	
   240		return ret;
   241	}
   242	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
