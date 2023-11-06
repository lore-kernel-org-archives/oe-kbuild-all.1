Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E72940A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 16:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVDGulZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699287989; x=1730823989;
  h=date:from:cc:subject:message-id:mime-version;
  bh=iqR5nxJ+6Pl5b4A9TuzakloXvpJGNA93UhhaR1LiBxI=;
  b=JVDGulZ0qUMQ0EGc1QOCxalQyRL6I6bHKIPlgihnhrALhImTVcSqOyus
   Fb4R8NBDFAj4McV6MzVlPftGA5PXpYj+ry4zHOXowdXLYy/Y24LP3bkSM
   PofrcehA3/YST7H6627XKyuglu98BWEKnTAARTysTWvhKEOl8n65IejMZ
   UOuNrKtAbpnAEaWM+5mpYOq4UTv/RJDE1qQNOAu4HphvtD0TMSHz3x2y+
   PHtZNBaBW04L38yNvYz1mZY2UjGd1BTtyfsuraYB3JiuAET7yrpYHOW7B
   04cPje3qAInePzBeqJPs/+FAG9WKrBYfBssEZCsiafebVDjWLBqciP8LQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="2229546"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="2229546"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 08:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791501049"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="791501049"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Nov 2023 08:26:25 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r02Qh-0006Y7-1G;
	Mon, 06 Nov 2023 16:26:23 +0000
Date: Tue, 7 Nov 2023 00:25:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:morimoto/m-n-update 37/45]
 sound/soc/generic/audio-graph-card2.c:555:53: error: 'struct
 snd_soc_dai_link_ch_map' has no member named 'connected_node'
Message-ID: <202311070016.dFCFO8Za-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound morimoto/m-n-update
head:   7019e7e052887590bd79afe4ec6ee1455ac73dc9
commit: d84cf8bef671f1a52d62607d8540056950066102 [37/45] ASoC: audio-graph-card2: add CPU:Codec = N:M support
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231107/202311070016.dFCFO8Za-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311070016.dFCFO8Za-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070016.dFCFO8Za-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/generic/audio-graph-card2.c: In function 'graph_parse_node':
>> sound/soc/generic/audio-graph-card2.c:555:53: error: 'struct snd_soc_dai_link_ch_map' has no member named 'connected_node'
     555 |                                 dai_link->ch_maps[i].connected_node = temp[i];
         |                                                     ^


vim +555 sound/soc/generic/audio-graph-card2.c

   506	
   507	static int graph_parse_node(struct simple_util_priv *priv,
   508				    enum graph_type gtype,
   509				    struct device_node *port,
   510				    struct link_info *li, int is_cpu)
   511	{
   512		struct device_node *ep;
   513		int ret = 0;
   514	
   515		if (graph_lnk_is_multi(port)) {
   516			struct device_node *ports = of_get_parent(port);
   517			int idx;
   518			int num;
   519			char *props = "ch-maps";
   520	
   521			of_node_get(port);
   522	
   523			for (idx = 0;; idx++) {
   524				ep = graph_get_next_multi_ep(&port);
   525				if (!ep)
   526					break;
   527	
   528				ret = __graph_parse_node(priv, gtype, ep,
   529							 li, is_cpu, idx);
   530				of_node_put(ep);
   531				if (ret < 0)
   532					break;
   533			}
   534	
   535			/* read "ch-maps" property if exist */
   536			num = of_property_count_elems_of_size(ports, props, sizeof(u32));
   537			if (num > 0) {
   538				struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
   539				struct device *dev = simple_priv_to_dev(priv);
   540				struct snd_soc_dai_link_ch_map *ch_maps = devm_kcalloc(dev, num, sizeof(*ch_maps), GFP_KERNEL);
   541				int *temp = devm_kcalloc(dev, num, sizeof(int), GFP_KERNEL);
   542				int i;
   543	
   544				if (!ch_maps || !temp) {
   545					ret = -ENOMEM;
   546					goto multi_end;
   547				}
   548	
   549				ret = of_property_read_u32_array(ports, props, temp, num);
   550				if (ret < 0)
   551					goto multi_end;
   552	
   553				dai_link->ch_maps = ch_maps;
   554				for (i = 0; i < num; i++)
 > 555					dai_link->ch_maps[i].connected_node = temp[i];
   556	multi_end:
   557				devm_kfree(dev, temp);
   558			}
   559			of_node_put(ports);
   560		} else {
   561			/* Single CPU / Codec */
   562			ep = port_to_endpoint(port);
   563			ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
   564			of_node_put(ep);
   565		}
   566	
   567		return ret;
   568	}
   569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
