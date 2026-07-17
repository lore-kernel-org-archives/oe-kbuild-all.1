Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A5438B7BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 18:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784313626; cv=none; b=n+U/o0QTRezZ6XBCoLJkmuqcfbPqpgfpZrLiwdCXrpgUKIxnen+eSXN04pISODsuLahxwLpNFvuVKXKMlf6ESjZOHrpsNqthdJQfI68x5xH7aYoJfiZQO/AUUwTMym0owyjwVnMv23JC6JHuCcsAVuc9KDgUXeSpnWj3Ye63DIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784313626; c=relaxed/simple;
	bh=FGIDbdOxOMn6Hs+8PxPxDNHezRxA48wqdRXwVavPfJY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nn5Rz8MlA5RHt0/EpSyvNOU+dH9dd3ctK4Bpn+TE2vVLuqiMLrmhrVhYGgy6kNiS1H2GzxOyswXtA/HpzWgZBjzP94onTCKoYmwAksHJ/qu1n/RmvRwBfkoMFCupheDN7p/oS94HSVSMQ5yWqUKPLUnWq1+OmCatDKScoirTE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4CFM0jI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4CFM0jI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784313619; x=1815849619;
  h=date:from:to:cc:subject:message-id;
  bh=FGIDbdOxOMn6Hs+8PxPxDNHezRxA48wqdRXwVavPfJY=;
  b=U4CFM0jI0t7y5nOvZ7dQnhkbCspQGwkxAxulMLnAjImgS0STVjxboioR
   ARKKRWlQF2QZbNzbEYHomTCPfq7aL83JqVidik3V5h7aSeYlL/5AWeYg4
   h42AzNlMu5L90bU6sqDTDXa2gasJODYyO9Yedk9IpvcTUOKz9NXP9s7Bx
   ANkE9GnVn6s7fgu4OjWxLR5hA184rKYcSMm4JGwPMfjAcHc1eUuEKZ2de
   cN4ac9oIyrRqE8GyNwuDLSw53AidPrjllj/DinOQIx6EI7/QPOjvZjRIN
   pZhlhNsmCee46Q1LjvNpZoRuD1u1EtISqP/LWz/Lo2uthY8M3azsCu9ZI
   A==;
X-CSE-ConnectionGUID: jRM9GHFpRX+SRs3ApbmHPw==
X-CSE-MsgGUID: +UuUptQqQbWv6D+br/qzFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="87535357"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="87535357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 11:40:13 -0700
X-CSE-ConnectionGUID: CTSqXluAREmcOv5gA9Xrnw==
X-CSE-MsgGUID: 65+6NsNVQsGCUDOflgJvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="256302720"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2026 11:40:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wknTk-00000000T1q-2UFN;
	Fri, 17 Jul 2026 18:40:08 +0000
Date: Sat, 18 Jul 2026 02:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 sound/soc/generic/simple-card-utils.c:23:1: warning: control reaches end of
 non-void function
Message-ID: <202607180238.00mImDdb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e51d2e02d8d4c974132f00eec9d2215a476084f0 [311/311] ASoC: move struct snd_soc_card/snd_soc_card_driver to soc-card.[hc]
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607180238.00mImDdb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180238.00mImDdb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180238.00mImDdb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/generic/simple-card-utils.c:16:
   sound/soc/generic/simple-card-utils.c: In function '_simple_ret':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card-utils.c:22:28: note: in expansion of macro 'simple_priv_to_dev'
      22 |         return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
         |                            ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card-utils.c: In function 'simple_util_parse_tdm_width_map':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card-utils.c:146:30: note: in expansion of macro 'simple_priv_to_dev'
     146 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card-utils.c: In function 'simple_util_set_dailink_name':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card-utils.c:199:30: note: in expansion of macro 'simple_priv_to_dev'
     199 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card-utils.c: In function 'simple_util_parse_property':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card-utils.c:226:30: note: in expansion of macro 'simple_priv_to_dev'
     226 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card-utils.c: In function 'simple_util_parse_card_name':
   sound/soc/generic/simple-card-utils.c:254:15: error: implicit declaration of function 'snd_soc_of_parse_card_name'; did you mean 'snd_soc_of_get_dai_name'? [-Werror=implicit-function-declaration]
     254 |         ret = snd_soc_of_parse_card_name(card, "label");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |               snd_soc_of_get_dai_name
   In file included from sound/soc/generic/simple-card-utils.c:16:
   sound/soc/generic/simple-card-utils.c: In function 'simple_set_clk_rate':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card-utils.c:431:30: note: in expansion of macro 'simple_priv_to_dev'
     431 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card-utils.c: In function 'simple_util_init_priv':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card-utils.c:892:30: note: in expansion of macro 'simple_priv_to_dev'
     892 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card-utils.c: In function 'graph_util_parse_dai':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card-utils.c:1107:30: note: in expansion of macro 'simple_priv_to_dev'
    1107 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card-utils.c: In function '__graph_util_parse_trigger_order':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card-utils.c:1195:38: note: in expansion of macro 'simple_priv_to_dev'
    1195 |                 struct device *dev = simple_priv_to_dev(priv);
         |                                      ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card-utils.c: In function '_simple_ret':
>> sound/soc/generic/simple-card-utils.c:23:1: warning: control reaches end of non-void function [-Wreturn-type]
      23 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from sound/soc/generic/simple-card.c:16:
   sound/soc/generic/simple-card.c: In function '_simple_ret':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:36:28: note: in expansion of macro 'simple_priv_to_dev'
      36 |         return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
         |                            ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function 'simple_parse_dai':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:70:30: note: in expansion of macro 'simple_priv_to_dev'
      70 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function 'simple_parse_node':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:147:30: note: in expansion of macro 'simple_priv_to_dev'
     147 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/simple-card.c:148:45: note: in expansion of macro 'simple_priv_to_link'
     148 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function 'simple_link_init':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:181:30: note: in expansion of macro 'simple_priv_to_dev'
     181 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/simple-card.c:183:45: note: in expansion of macro 'simple_priv_to_link'
     183 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function 'simple_dai_link_of_dpcm':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:235:30: note: in expansion of macro 'simple_priv_to_dev'
     235 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/simple-card.c:236:45: note: in expansion of macro 'simple_priv_to_link'
     236 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function 'simple_dai_link_of':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:312:30: note: in expansion of macro 'simple_priv_to_dev'
     312 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/simple-card.c:313:45: note: in expansion of macro 'simple_priv_to_link'
     313 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function '__simple_for_each_link':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:372:30: note: in expansion of macro 'simple_priv_to_dev'
     372 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function 'simple_depopulate_aux':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:499:32: note: in expansion of macro 'simple_priv_to_dev'
     499 |         of_platform_depopulate(simple_priv_to_dev(priv));
         |                                ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function 'simple_populate_aux':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:504:30: note: in expansion of macro 'simple_priv_to_dev'
     504 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function 'simple_get_dais_count':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/simple-card.c:588:30: note: in expansion of macro 'simple_priv_to_dev'
     588 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c: In function '_simple_ret':
>> sound/soc/generic/simple-card.c:37:1: warning: control reaches end of non-void function [-Wreturn-type]
      37 | }
         | ^
--
   In file included from include/sound/graph_card.h:10,
                    from sound/soc/generic/audio-graph-card.c:19:
   sound/soc/generic/audio-graph-card.c: In function '_graph_ret':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:27:28: note: in expansion of macro 'simple_priv_to_dev'
      27 |         return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
         |                            ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card.c: In function 'graph_parse_node':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:109:30: note: in expansion of macro 'simple_priv_to_dev'
     109 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:110:45: note: in expansion of macro 'simple_priv_to_link'
     110 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card.c: In function 'graph_link_init':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:143:30: note: in expansion of macro 'simple_priv_to_dev'
     143 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:145:45: note: in expansion of macro 'simple_priv_to_link'
     145 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card.c: In function 'graph_dai_link_of_dpcm':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:204:30: note: in expansion of macro 'simple_priv_to_dev'
     204 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:205:45: note: in expansion of macro 'simple_priv_to_link'
     205 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card.c: In function 'graph_dai_link_of':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:289:30: note: in expansion of macro 'simple_priv_to_dev'
     289 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:290:45: note: in expansion of macro 'simple_priv_to_link'
     290 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card.c: In function '__graph_for_each_link':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:356:30: note: in expansion of macro 'simple_priv_to_dev'
     356 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card.c: In function 'graph_count_noml':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:443:30: note: in expansion of macro 'simple_priv_to_dev'
     443 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card.c: In function 'graph_count_dpcm':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card.c:472:30: note: in expansion of macro 'simple_priv_to_dev'
     472 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card.c: In function '_graph_ret':
>> sound/soc/generic/audio-graph-card.c:28:1: warning: control reaches end of non-void function [-Wreturn-type]
      28 | }
         | ^
--
   In file included from include/sound/graph_card.h:10,
                    from sound/soc/generic/audio-graph-card2.c:17:
   sound/soc/generic/audio-graph-card2.c: In function '_graph_ret':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:241:28: note: in expansion of macro 'simple_priv_to_dev'
     241 |         return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
         |                            ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card2.c: In function '__graph_parse_node':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:404:30: note: in expansion of macro 'simple_priv_to_dev'
     404 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:405:45: note: in expansion of macro 'simple_priv_to_link'
     405 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card2.c: In function 'graph_parse_node_multi':
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:598:45: note: in expansion of macro 'simple_priv_to_link'
     598 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:599:30: note: in expansion of macro 'simple_priv_to_dev'
     599 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card2.c: In function 'graph_link_init':
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:741:45: note: in expansion of macro 'simple_priv_to_link'
     741 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card2.c: In function 'audio_graph2_link_dpcm':
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:880:45: note: in expansion of macro 'simple_priv_to_link'
     880 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card2.c: In function 'audio_graph2_link_c2c':
   include/sound/simple_card_utils.h:91:67: error: invalid use of undefined type 'struct snd_soc_card'
      91 | #define simple_priv_to_link(priv, i)    (simple_priv_to_card(priv)->dai_link + (i))
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:969:45: note: in expansion of macro 'simple_priv_to_link'
     969 |         struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
         |                                             ^~~~~~~~~~~~~~~~~~~
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:1003:38: note: in expansion of macro 'simple_priv_to_dev'
    1003 |                 struct device *dev = simple_priv_to_dev(priv);
         |                                      ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card2.c: In function 'graph_link':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:1060:30: note: in expansion of macro 'simple_priv_to_dev'
    1060 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card2.c: In function 'graph_count':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:1235:30: note: in expansion of macro 'simple_priv_to_dev'
    1235 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card2.c: In function 'graph_for_each_link':
   include/sound/simple_card_utils.h:90:67: error: invalid use of undefined type 'struct snd_soc_card'
      90 | #define simple_priv_to_dev(priv)        (simple_priv_to_card(priv)->dev)
         |                                                                   ^~
   sound/soc/generic/audio-graph-card2.c:1282:30: note: in expansion of macro 'simple_priv_to_dev'
    1282 |         struct device *dev = simple_priv_to_dev(priv);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/generic/audio-graph-card2.c: In function '_graph_ret':
>> sound/soc/generic/audio-graph-card2.c:242:1: warning: control reaches end of non-void function [-Wreturn-type]
     242 | }
         | ^


vim +23 sound/soc/generic/simple-card-utils.c

abd3147e69481c Kuninori Morimoto 2016-05-31  17  
2d7395b23dbf4c Kuninori Morimoto 2025-02-05  18  #define simple_ret(priv, ret) _simple_ret(priv, __func__, ret)
2d7395b23dbf4c Kuninori Morimoto 2025-02-05  19  static inline int _simple_ret(struct simple_util_priv *priv,
2d7395b23dbf4c Kuninori Morimoto 2025-02-05  20  			      const char *func, int ret)
2d7395b23dbf4c Kuninori Morimoto 2025-02-05  21  {
2d7395b23dbf4c Kuninori Morimoto 2025-02-05  22  	return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
2d7395b23dbf4c Kuninori Morimoto 2025-02-05 @23  }
2d7395b23dbf4c Kuninori Morimoto 2025-02-05  24  

:::::: The code at line 23 was first introduced by commit
:::::: 2d7395b23dbf4c2d60be49b73e4c4705fc446662 ASoC: simple-card-utils: use snd_soc_ret()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
