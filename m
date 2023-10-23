Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7AC79F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bW0p45/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698046783; x=1729582783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3KzCNJMYoOaiHwa16bbgjru9Az1At4IZu3EItaUyIXs=;
  b=bW0p45/zMCLWv2Mtgpo5Qz5OZnPFhIhlAIHqgedmWTbZoPTUZUEoqyYJ
   rposXOtqTvVGcaLqlfagFV9wZrWl/9DL6bx2YfDcEMwnQXrjKXBP/uV5J
   U5h9KdB51mW8RD3AU9824TLZ+mY11uSnxxSNKjZ7qw47MUcCJdRJ+FRZD
   VEwPVorAvnNSz5gRnH8PAxVZIow0CjCEXzM0HvK3wVk8DR6bu7YvSCSUh
   YIdPe+7TdgOdm5aCEjQbOew3Cpd7zlmCjTBANdZKEfjJ18VxXtB/Ihdzt
   +8LMTphlBI2AYOJpF0QxfltslBNrEn6iyzZiGkNl6wBD6/uHZSom2s8Ak
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="473000434"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="473000434"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 00:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="848716020"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="848716020"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Oct 2023 00:39:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qupXH-0006hF-0t;
	Mon, 23 Oct 2023 07:39:39 +0000
Date: Mon, 23 Oct 2023 15:39:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 1/5] ASoC: makes CPU/Codec channel connection map more
 generic
Message-ID: <202310231510.72ksmNgV-lkp@intel.com>
References: <8734y1lx3m.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734y1lx3m.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20231020]
[cannot apply to linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-makes-CPU-Codec-channel-connection-map-more-generic/20231023-133933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/8734y1lx3m.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH v5 1/5] ASoC: makes CPU/Codec channel connection map more generic
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231023/202310231510.72ksmNgV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310231510.72ksmNgV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310231510.72ksmNgV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-core.c: In function 'snd_soc_compensate_channel_connection_map':
>> sound/soc/soc-core.c:1050:16: warning: variable 'max' set but not used [-Wunused-but-set-variable]
    1050 |         int i, max;
         |                ^~~


vim +/max +1050 sound/soc/soc-core.c

  1017	
  1018	#define MAX_DEFAULT_CH_MAP_SIZE 7
  1019	static struct snd_soc_dai_link_ch_map default_ch_map_sync[MAX_DEFAULT_CH_MAP_SIZE] = {
  1020		{ .cpu = 0, .codec = 0 },
  1021		{ .cpu = 1, .codec = 1 },
  1022		{ .cpu = 2, .codec = 2 },
  1023		{ .cpu = 3, .codec = 3 },
  1024		{ .cpu = 4, .codec = 4 },
  1025		{ .cpu = 5, .codec = 5 },
  1026		{ .cpu = 6, .codec = 6 },
  1027	};
  1028	static struct snd_soc_dai_link_ch_map default_ch_map_1cpu[MAX_DEFAULT_CH_MAP_SIZE] = {
  1029		{ .cpu = 0, .codec = 0 },
  1030		{ .cpu = 0, .codec = 1 },
  1031		{ .cpu = 0, .codec = 2 },
  1032		{ .cpu = 0, .codec = 3 },
  1033		{ .cpu = 0, .codec = 4 },
  1034		{ .cpu = 0, .codec = 5 },
  1035		{ .cpu = 0, .codec = 6 },
  1036	};
  1037	static struct snd_soc_dai_link_ch_map default_ch_map_1codec[MAX_DEFAULT_CH_MAP_SIZE] = {
  1038		{ .cpu = 0, .codec = 0 },
  1039		{ .cpu = 1, .codec = 0 },
  1040		{ .cpu = 2, .codec = 0 },
  1041		{ .cpu = 3, .codec = 0 },
  1042		{ .cpu = 4, .codec = 0 },
  1043		{ .cpu = 5, .codec = 0 },
  1044		{ .cpu = 6, .codec = 0 },
  1045	};
  1046	static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
  1047							     struct snd_soc_dai_link *dai_link)
  1048	{
  1049		struct snd_soc_dai_link_ch_map *ch_maps;
> 1050		int i, max;
  1051	
  1052		/*
  1053		 * dai_link->ch_maps indicates how CPU/Codec are connected.
  1054		 * It will be a map seen from a larger number of DAI.
  1055		 * see
  1056		 *	soc.h :: [dai_link->ch_maps Image sample]
  1057		 */
  1058	
  1059		/* it should have ch_maps if connection was N:M */
  1060		if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
  1061		    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
  1062			dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
  1063				dai_link->name);
  1064			return -EINVAL;
  1065		}
  1066	
  1067		/* do nothing if it has own maps */
  1068		if (dai_link->ch_maps)
  1069			goto sanity_check;
  1070	
  1071		/* check default map size */
  1072		if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
  1073		    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
  1074			dev_err(card->dev, "soc-core.c needs update default_connection_maps");
  1075			return -EINVAL;
  1076		}
  1077	
  1078		/* Compensate missing map for ... */
  1079		if (dai_link->num_cpus == dai_link->num_codecs)
  1080			dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
  1081		else if (dai_link->num_cpus <  dai_link->num_codecs)
  1082			dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
  1083		else
  1084			dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
  1085	
  1086	sanity_check:
  1087		max = min(dai_link->num_cpus, dai_link->num_codecs);
  1088	
  1089		dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
  1090		for_each_link_ch_maps(dai_link, i, ch_maps) {
  1091			if ((ch_maps->cpu   >= dai_link->num_cpus) ||
  1092			    (ch_maps->codec >= dai_link->num_codecs)) {
  1093				dev_err(card->dev,
  1094					"unexpected dai_link->ch_maps[%d] index (cpu(%d/%d) codec(%d/%d))",
  1095					i,
  1096					ch_maps->cpu,	dai_link->num_cpus,
  1097					ch_maps->codec,	dai_link->num_codecs);
  1098				return -EINVAL;
  1099			}
  1100	
  1101			dev_dbg(card->dev, "  [%d] cpu%d <-> codec%d\n",
  1102				i, ch_maps->cpu, ch_maps->codec);
  1103		}
  1104	
  1105		return 0;
  1106	}
  1107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
