Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F82831E828
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 01:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786583004; cv=none; b=LepQtio+huCET6utFNzcpSaCr38Pt0KBiF0KC8LWEm0h1Dr4fvrFp6ithWuoGX15DpvxHSjsBY6KbGU+/z0g0mWLwxdkdwzHuZuggdlgBQISdCm98rZi1FO05shCcNO2AxU6+JnOoAuIMwurRIEwTBvhjgPgXZbHA5P5xwtVUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786583004; c=relaxed/simple;
	bh=hVoc1736MXw6xTfwja2XBcFKFRO9BS6PESFIlT5dfjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lr2nCRo7eMkUrydRrziw14ptIlkznBv/QPGY1EZAKNIf3ZgBb5P3Ygq/1aMyo4OZP2rFAjvg7pJVrf+/8JZDbGKTGLrz0pcr/6mmqI6v8tLd/AC856UoEQ70CxBWeDOs4QPZUlc918eOSJu69i+9cLx7oDxjIS/SFXk/7+m86sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTd7+iz3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTd7+iz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786583002; x=1818119002;
  h=date:from:to:cc:subject:message-id;
  bh=hVoc1736MXw6xTfwja2XBcFKFRO9BS6PESFIlT5dfjk=;
  b=eTd7+iz3s2cT1oYPnWonoQUNT/ucK4WNNV4sul/Jv8M0FV9xL8t+rLQC
   VJIyEJluXT4ThuaSEovjw7WE4o7rN1T11D5wbJd7V98ul2o0i73A/3IgV
   kagXV2s//nfleipqFMWqWaOOTNv4p3YNZIRJ5KovZA8yZlLTUd1p6dCEI
   N8BZTF9JrDcMsaQB2khuaqvHMsksNFqYYG57KC1kmHhPnztlHEhEDLfTg
   kuUHaFWB1yi3ZSc+fF+fWXCHoGFIusyH/aQC6UrO0ivh+n1vmke8P3eAg
   Epd8nd/Msfdllilxl9DmD22jkljyZgtFQncEomUhGMAZ+0UeVg6jBr9RO
   w==;
X-CSE-ConnectionGUID: TTeZKXL6TsW5vKmjX4Vy4g==
X-CSE-MsgGUID: bq0FrUJZSsC9KdlWqVVOfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97815984"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97815984"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:03:18 -0700
X-CSE-ConnectionGUID: 5BdXBtuMT3uaYFb/k6M4lg==
X-CSE-MsgGUID: cPnnbo9sTqeMoQ4XZSwKyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="262490033"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2026 18:03:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuJql-00000000SLI-0FXY;
	Thu, 13 Aug 2026 01:03:15 +0000
Date: Thu, 13 Aug 2026 09:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 sound/soc/amd/acp/acp-sdw-legacy-mach.c:120:31: error: implicit declaration
 of function 'get_acp63_cpu_pin_id'
Message-ID: <202608130854.yeeKh0XJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vijendar,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: c3b26788593464218c7aa581133f5070a36f2378 [1/1] FROMGIT: ASoC: amd: acp: add soundwire machine driver for legacy stack
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130854.yeeKh0XJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130854.yeeKh0XJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130854.yeeKh0XJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/amd/acp/acp-sdw-legacy-mach.c: In function 'create_sdw_dailink':
>> sound/soc/amd/acp/acp-sdw-legacy-mach.c:120:31: error: implicit declaration of function 'get_acp63_cpu_pin_id' [-Wimplicit-function-declaration]
     120 |                         ret = get_acp63_cpu_pin_id(ffs(soc_end->link_mask - 1),
         |                               ^~~~~~~~~~~~~~~~~~~~


vim +/get_acp63_cpu_pin_id +120 sound/soc/amd/acp/acp-sdw-legacy-mach.c

    61	
    62	static int create_sdw_dailink(struct snd_soc_card *card,
    63				      struct asoc_sdw_dailink *soc_dai,
    64				      struct snd_soc_dai_link **dai_links,
    65				      int *be_id, struct snd_soc_codec_conf **codec_conf,
    66				      struct snd_soc_dai_link_component *sdw_platform_component)
    67	{
    68		struct device *dev = card->dev;
    69		struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
    70		struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
    71		struct asoc_sdw_endpoint *soc_end;
    72		int cpu_pin_id;
    73		int stream;
    74		int ret;
    75	
    76		list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
    77			if (soc_end->name_prefix) {
    78				(*codec_conf)->dlc.name = soc_end->codec_name;
    79				(*codec_conf)->name_prefix = soc_end->name_prefix;
    80				(*codec_conf)++;
    81			}
    82	
    83			if (soc_end->include_sidecar) {
    84				ret = soc_end->codec_info->add_sidecar(card, dai_links, codec_conf);
    85				if (ret)
    86					return ret;
    87			}
    88		}
    89	
    90		for_each_pcm_streams(stream) {
    91			static const char * const sdw_stream_name[] = {
    92				"SDW%d-PIN%d-PLAYBACK",
    93				"SDW%d-PIN%d-CAPTURE",
    94				"SDW%d-PIN%d-PLAYBACK-%s",
    95				"SDW%d-PIN%d-CAPTURE-%s",
    96			};
    97			struct snd_soc_dai_link_ch_map *codec_maps;
    98			struct snd_soc_dai_link_component *codecs;
    99			struct snd_soc_dai_link_component *cpus;
   100			int num_cpus = hweight32(soc_dai->link_mask[stream]);
   101			int num_codecs = soc_dai->num_devs[stream];
   102			int playback, capture;
   103			int j = 0;
   104			char *name;
   105	
   106			if (!soc_dai->num_devs[stream])
   107				continue;
   108	
   109			soc_end = list_first_entry(&soc_dai->endpoints,
   110						   struct asoc_sdw_endpoint, list);
   111	
   112			*be_id = soc_end->dai_info->dailink[stream];
   113			if (*be_id < 0) {
   114				dev_err(dev, "Invalid dailink id %d\n", *be_id);
   115				return -EINVAL;
   116			}
   117	
   118			switch (amd_ctx->acp_rev) {
   119			case ACP63_PCI_REV:
 > 120				ret = get_acp63_cpu_pin_id(ffs(soc_end->link_mask - 1),
   121							   *be_id, &cpu_pin_id, dev);
   122				if (ret)
   123					return ret;
   124				break;
   125			default:
   126				return -EINVAL;
   127			}
   128			/* create stream name according to first link id */
   129			if (ctx->append_dai_type) {
   130				name = devm_kasprintf(dev, GFP_KERNEL,
   131						      sdw_stream_name[stream + 2],
   132						      ffs(soc_end->link_mask) - 1,
   133						      cpu_pin_id,
   134						      type_strings[soc_end->dai_info->dai_type]);
   135			} else {
   136				name = devm_kasprintf(dev, GFP_KERNEL,
   137						      sdw_stream_name[stream],
   138						      ffs(soc_end->link_mask) - 1,
   139						      cpu_pin_id);
   140			}
   141			if (!name)
   142				return -ENOMEM;
   143	
   144			cpus = devm_kcalloc(dev, num_cpus, sizeof(*cpus), GFP_KERNEL);
   145			if (!cpus)
   146				return -ENOMEM;
   147	
   148			codecs = devm_kcalloc(dev, num_codecs, sizeof(*codecs), GFP_KERNEL);
   149			if (!codecs)
   150				return -ENOMEM;
   151	
   152			codec_maps = devm_kcalloc(dev, num_codecs, sizeof(*codec_maps), GFP_KERNEL);
   153			if (!codec_maps)
   154				return -ENOMEM;
   155	
   156			list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
   157				if (!soc_end->dai_info->direction[stream])
   158					continue;
   159	
   160				int link_num = ffs(soc_end->link_mask) - 1;
   161	
   162				cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
   163								"SDW%d Pin%d",
   164								link_num, cpu_pin_id);
   165				dev_dbg(dev, "cpu->dai_name:%s\n", cpus->dai_name);
   166				if (!cpus->dai_name)
   167					return -ENOMEM;
   168	
   169				codec_maps[j].cpu = 0;
   170				codec_maps[j].codec = j;
   171	
   172				codecs[j].name = soc_end->codec_name;
   173				codecs[j].dai_name = soc_end->dai_info->dai_name;
   174				j++;
   175			}
   176	
   177			WARN_ON(j != num_codecs);
   178	
   179			playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
   180			capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
   181	
   182			asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
   183					       cpus, num_cpus, sdw_platform_component,
   184					       1, codecs, num_codecs,
   185					       0, asoc_sdw_rtd_init, &sdw_ops);
   186			/*
   187			 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
   188			 * based on wait_for_completion(), tag them as 'nonatomic'.
   189			 */
   190			(*dai_links)->nonatomic = true;
   191			(*dai_links)->ch_maps = codec_maps;
   192	
   193			list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
   194				if (soc_end->dai_info->init)
   195					soc_end->dai_info->init(card, *dai_links,
   196								soc_end->codec_info,
   197								playback);
   198			}
   199	
   200			(*dai_links)++;
   201		}
   202	
   203		return 0;
   204	}
   205	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
