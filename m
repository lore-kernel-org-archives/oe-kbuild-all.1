Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAF52459D1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765006853; cv=none; b=UoT3BF4ptqDLlxGOGj/LjZw2ODxjUtb7++126BJ6lMUDX7+VtlYHU5gkINGwXAnfEROJM74FmynrwldAQeueELNqvLCSmN+moS1ts2lW/yqfIrhX98EWoR7U99iDGDU7MQaBbFjjJRQ2KDUKVO3L4WX6q2rOeGU/jcGjQtnYciU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765006853; c=relaxed/simple;
	bh=W11PkRS7/cmcn53Hn8D8OZ+JVw05D0WMxb+YMKhe8aE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=axLUy/LWZv453chdBuye5ag9sURdMimMfoDu2Jx0o8wiUKHHaRwgYiFkBjX/yLyurgAG6CCBCbJ4a2Eg8GTJHGI9aRqJbJhCK13QGdSsObtTK5c7AjPINwxN+BIfM4zod0TsBj9FW/foqi+fyaeEKJprlPPg9y1kxOFuieKr95w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ia3O+YJv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ia3O+YJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765006851; x=1796542851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W11PkRS7/cmcn53Hn8D8OZ+JVw05D0WMxb+YMKhe8aE=;
  b=ia3O+YJv2xITMNfqi/FIUb7b32uT6/FCu28TtHsszMNLeKr2Ixjns/c6
   kHjwhKQUMPrBvVuyx3tEGcfF75RXS0TK4kBuG0iIkNaPKhiyOsJFzXitl
   ve3KQBCEnHhd8APEIa53KX//bloW7FufkSK7dYocvYyhfNv49Yln/mRzt
   ba3XVh2AP42FsfQsuPeCfahXH/g2Bt2x+7hcyLoVqgEpt8wgFtuDTSRCP
   lK5ibE7UmPJF/HdXzgYWdHbjW3jIdNi3QBbu0/QZzdtvInRbZDkiCFW6A
   wdXntq9IVOoUwSb4+WK5cF32/iYHoY3qHriF+2l64m9S8aV7CCd9PAeMO
   Q==;
X-CSE-ConnectionGUID: hB0Mg52rR9yTZ9pMWwTVpw==
X-CSE-MsgGUID: uN+VpZ8PRp6vJ51212hxpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67111697"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="67111697"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 23:40:49 -0800
X-CSE-ConnectionGUID: pMs3XL5UR2e39T6Xlvf+0A==
X-CSE-MsgGUID: EZNrBcUnQxSDWUfkCVjoww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="200624753"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Dec 2025 23:40:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRmuM-00000000Fzv-0HBn;
	Sat, 06 Dec 2025 07:40:46 +0000
Date: Sat, 6 Dec 2025 15:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7]
 sound/soc/amd/acp/acp-sdw-legacy-mach.c:120:10: error: call to undeclared
 function 'get_acp63_cpu_pin_id'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202512061507.xiYfiOV3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vijendar,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   893a821faadd92557e35d840ace1d648fe0a50e6
commit: c3b26788593464218c7aa581133f5070a36f2378 [7/7] FROMGIT: ASoC: amd: acp: add soundwire machine driver for legacy stack
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251206/202512061507.xiYfiOV3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061507.xiYfiOV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061507.xiYfiOV3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/amd/acp/acp-sdw-legacy-mach.c:120:10: error: call to undeclared function 'get_acp63_cpu_pin_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     120 |                         ret = get_acp63_cpu_pin_id(ffs(soc_end->link_mask - 1),
         |                               ^
   1 error generated.


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
