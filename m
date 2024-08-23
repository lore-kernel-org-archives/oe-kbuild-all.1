Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA8E44C6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724390248; cv=none; b=eW4F44x04to8D4Ypa5ctfpCu5AWuV6tdX98aoHNf37REOPg9JZNC6Hu9Bs0C51VzxcVkoCH7ck6Y2TkDm3yLbV3kFtBioHeguRI4msogFZYCSw6FUfTysB7boSFugENMzhHHHyCPzQs70gNDF3omeu8seXws/P0wyuhFoX4g0d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724390248; c=relaxed/simple;
	bh=vqKNcjOLpwhAb7ThlFrelJiMIxSzmf9SQDrMUp/XDMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DCXSEncA8iVghtgCpsxJfnFQUyHQzaE9M/tMU097NnQGbonySa6CJA8uOnIaEtZdANSFuSJ3c0dMvUgpzbmRyP6iLuxctvlkb3Hgzs9RDC98cr2g5davc2T57vrU6HauE0UHFGMg7I6SBWMw37wZC3xYs6NaqXyR7UEf+PLKj4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkmULzqO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkmULzqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724390245; x=1755926245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vqKNcjOLpwhAb7ThlFrelJiMIxSzmf9SQDrMUp/XDMY=;
  b=jkmULzqOfxH0HbYjd1NkenZd5pOsbNxSnyEz1lwhqUjUIkT76ej9i4PJ
   yitQLUSps5Pzbdznw2bWaw8TuYwLKMY7dtiPqHCDYUBghqShoj4cwLV4U
   3QKlO8Wfuxc/CS/PAssLKUjyww2nyJ/ssoAL71IFy0HhqnfXLxxBdWdhb
   kHZMmcDn5YyBjRXjqmM18t78c8+X4pnby28br9ueSIH8rlS+qizHZyTWS
   5WDQz64Qq7794idZ0RD99Co0M8G4u8bNMWnuAFkxXvL0SKnoDUE+byPgZ
   0fiOmXmhxEfIHeR6rrpA2spdHZpBounpp9K4MacMr07dddcu9RnQ+S1CU
   g==;
X-CSE-ConnectionGUID: AoA7D0ffSM+fqUErKsDfXA==
X-CSE-MsgGUID: FtbkPHL3RkGEH373W3HAJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26594563"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="26594563"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 22:17:19 -0700
X-CSE-ConnectionGUID: dsoAW1VTRFeb7vfFhqfWiQ==
X-CSE-MsgGUID: NjGryADQTO64v82ji0tZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="61363168"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2024 22:17:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shMfk-000DW8-1e;
	Fri, 23 Aug 2024 05:17:16 +0000
Date: Fri, 23 Aug 2024 13:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 42/120]
 sound/soc/apple/macaudio.c:251:42-43: Unneeded semicolon
Message-ID: <202408231319.0tbLmvyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   8bb0ee8e8fd75aa60a4bb4efe074711f2c35ca5c
commit: 08208b2e29fd46abe33f1cc85ca41fd5d2958a24 [42/120] ASoC: macaudio: Tune DT parsing error messages
config: sh-randconfig-r062-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231319.0tbLmvyk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231319.0tbLmvyk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/apple/macaudio.c:251:42-43: Unneeded semicolon

vim +251 sound/soc/apple/macaudio.c

   222	
   223	static int macaudio_parse_of(struct macaudio_snd_data *ma)
   224	{
   225		struct device_node *codec = NULL;
   226		struct device_node *cpu = NULL;
   227		struct device_node *np = NULL;
   228		struct device_node *platform = NULL;
   229		struct snd_soc_dai_link *link = NULL;
   230		struct snd_soc_card *card = &ma->card;
   231		struct device *dev = card->dev;
   232		struct macaudio_link_props *link_props;
   233		int ret, num_links, i;
   234	
   235		ret = snd_soc_of_parse_card_name(card, "model");
   236		if (ret) {
   237			dev_err_probe(dev, ret, "parsing card name\n");
   238			return ret;
   239		}
   240	
   241		/* Populate links, start with the fixed number of FE links */
   242		num_links = ARRAY_SIZE(macaudio_fe_links);
   243	
   244		/* Now add together the (dynamic) number of BE links */
   245		for_each_available_child_of_node(dev->of_node, np) {
   246			int num_cpus;
   247	
   248			cpu = of_get_child_by_name(np, "cpu");
   249			if (!cpu) {
   250				ret = dev_err_probe(dev, -EINVAL,
 > 251					"missing CPU DAI node at %pOF\n", np);;
   252				goto err_free;
   253			}
   254	
   255			num_cpus = of_count_phandle_with_args(cpu, "sound-dai",
   256							"#sound-dai-cells");
   257	
   258			if (num_cpus <= 0) {
   259				ret = dev_err_probe(card->dev, -EINVAL,
   260					"missing sound-dai property at %pOF\n", cpu);
   261				goto err_free;
   262			}
   263			of_node_put(cpu);
   264			cpu = NULL;
   265	
   266			/* Each CPU specified counts as one BE link */
   267			num_links += num_cpus;
   268		}
   269	
   270		/* Allocate the DAI link array */
   271		card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
   272		ma->link_props = devm_kcalloc(dev, num_links, sizeof(*ma->link_props), GFP_KERNEL);
   273		if (!card->dai_link || !ma->link_props)
   274			return -ENOMEM;
   275	
   276		card->num_links = num_links;
   277		link = card->dai_link;
   278		link_props = ma->link_props;
   279	
   280		for (i = 0; i < ARRAY_SIZE(macaudio_fe_links); i++) {
   281			ret = macaudio_copy_link(dev, link, &macaudio_fe_links[i]);
   282			if (ret)
   283				goto err_free;
   284	
   285			memcpy(link_props, &macaudio_fe_link_props[i], sizeof(struct macaudio_link_props));
   286			link++; link_props++;
   287		}
   288	
   289		for (i = 0; i < num_links; i++)
   290			card->dai_link[i].id = i;
   291	
   292		/* Fill in the BEs */
   293		for_each_available_child_of_node(dev->of_node, np) {
   294			const char *link_name;
   295			bool speakers;
   296			int be_index, num_codecs, num_bes, ncodecs_per_cpu, nchannels;
   297			unsigned int left_mask, right_mask;
   298	
   299			ret = of_property_read_string(np, "link-name", &link_name);
   300			if (ret) {
   301				dev_err_probe(card->dev, ret, "missing link name\n");
   302				goto err_free;
   303			}
   304	
   305			dev_dbg(ma->card.dev, "parsing link '%s'\n", link_name);
   306	
   307			speakers = !strcmp(link_name, "Speaker")
   308				   || !strcmp(link_name, "Speakers");
   309			if (speakers)
   310				ma->has_speakers = 1;
   311	
   312			cpu = of_get_child_by_name(np, "cpu");
   313			codec = of_get_child_by_name(np, "codec");
   314	
   315			if (!codec || !cpu) {
   316				ret = dev_err_probe(dev, -EINVAL,
   317					"missing DAI specifications for '%s'\n", link_name);
   318				goto err_free;
   319			}
   320	
   321			num_bes = of_count_phandle_with_args(cpu, "sound-dai",
   322							     "#sound-dai-cells");
   323			if (num_bes <= 0) {
   324				ret = dev_err_probe(card->dev, -EINVAL,
   325					"missing sound-dai property at %pOF\n", cpu);
   326				goto err_free;
   327			}
   328	
   329			num_codecs = of_count_phandle_with_args(codec, "sound-dai",
   330								"#sound-dai-cells");
   331			if (num_codecs <= 0) {
   332				ret = dev_err_probe(card->dev, -EINVAL,
   333					"missing sound-dai property at %pOF\n", codec);
   334				goto err_free;
   335			}
   336	
   337			dev_dbg(ma->card.dev, "link '%s': %d CPUs %d CODECs\n",
   338				link_name, num_bes, num_codecs);
   339	
   340			if (num_codecs % num_bes != 0) {
   341				ret = dev_err_probe(card->dev, -EINVAL,
   342					"bad combination of CODEC (%d) and CPU (%d) number at %pOF\n",
   343					num_codecs, num_bes, np);
   344				goto err_free;
   345			}
   346	
   347			/*
   348			 * Now parse the cpu/codec lists into a number of DPCM backend links.
   349			 * In each link there will be one DAI from the cpu list paired with
   350			 * an evenly distributed number of DAIs from the codec list. (As is
   351			 * the binding semantics.)
   352			 */
   353			ncodecs_per_cpu = num_codecs / num_bes;
   354			nchannels = num_codecs * (speakers ? 1 : 2);
   355	
   356			/* Save the max number of channels on the platform */
   357			if (nchannels > ma->max_channels)
   358				ma->max_channels = nchannels;
   359	
   360			/*
   361			 * If there is a single speaker, assign two channels to it, because
   362			 * it can do downmix.
   363			 */
   364			if (nchannels < 2)
   365				nchannels = 2;
   366	
   367			left_mask = 0;
   368			for (i = 0; i < nchannels; i += 2)
   369				left_mask = left_mask << 2 | 1;
   370			right_mask = left_mask << 1;
   371	
   372			for (be_index = 0; be_index < num_bes; be_index++) {
   373				/*
   374				 * Set initial link name to be overwritten by a BE-specific
   375				 * name later so that we can use at least use the provisional
   376				 * name in error messages.
   377				 */
   378				link->name = link_name;
   379	
   380				ret = macaudio_parse_of_be_dai_link(ma, link, be_index,
   381								    ncodecs_per_cpu, cpu, codec);
   382				if (ret)
   383					goto err_free;
   384	
   385				link_props->is_speakers = speakers;
   386				link_props->is_headphones = !speakers;
   387	
   388				if (num_bes == 2)
   389					/* This sound peripheral is split between left and right BE */
   390					link_props->tdm_mask = be_index ? right_mask : left_mask;
   391				else
   392					/* One BE covers all of the peripheral */
   393					link_props->tdm_mask = left_mask | right_mask;
   394	
   395				/* Steal platform OF reference for use in FE links later */
   396				platform = link->cpus->of_node;
   397	
   398				link++; link_props++;
   399			}
   400	
   401			of_node_put(codec);
   402			of_node_put(cpu);
   403			cpu = codec = NULL;
   404		}
   405	
   406		for (i = 0; i < ARRAY_SIZE(macaudio_fe_links); i++)
   407			card->dai_link[i].platforms->of_node = platform;
   408	
   409		return 0;
   410	
   411	err_free:
   412		of_node_put(codec);
   413		of_node_put(cpu);
   414		of_node_put(np);
   415	
   416		if (!card->dai_link)
   417			return ret;
   418	
   419		for (i = 0; i < num_links; i++) {
   420			/*
   421			 * TODO: If we don't go through this path are the references
   422			 * freed inside ASoC?
   423			 */
   424			snd_soc_of_put_dai_link_codecs(&card->dai_link[i]);
   425			snd_soc_of_put_dai_link_cpus(&card->dai_link[i]);
   426		}
   427	
   428		return ret;
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
