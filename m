Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992263F4DD7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494612; cv=none; b=rfK4FZ0fnT0U3GPu3xw38EjPnD+27nj+X2/p5RqAyy9DOqIVWk+aj2NxC0Zi6u4HcjIjFC/f4deL1yfGb3JGRSQ2dBJoc8x2ekItxYkE0rDc+POF/c3fzC48bBzgMFFsoX9lNvptGpg+LxQi1fD819ZvtDud/NjGanVA0Aw3YSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494612; c=relaxed/simple;
	bh=8MKyyhmKrmWvc2vUtF/5i88REsOADRsR8gXaztE8TVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ITjLGKfbGT8NccbEnYs8aYxjX7Or1pEUO7Zla4h+ipeNPPtKv+XjaI48FDS+o1h+0lEnxo64inKOjKSFcERAuM+kK+67P52Z8BRiCp1CWqjpXU46jpsBny+JK2qSCCHsfZDL/quy17aMmiCZe9W5iu75Rz0y2RD5ceXAjcffsD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WulO7eXU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WulO7eXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783494606; x=1815030606;
  h=date:from:to:cc:subject:message-id;
  bh=8MKyyhmKrmWvc2vUtF/5i88REsOADRsR8gXaztE8TVU=;
  b=WulO7eXUNW0uhxqzcHuaTeOT+B43gTr6G50ZaL6bTDJRaiqw68hfgPAX
   hriy/YTE5efDbMstETFwEG6QBX38ecm/k4K26adCwOhQZl8up9J3nm1vo
   2f7/SjpxCjkAHEiTgDQHkvOOHVzHQ8XW0q6htEjzZSm+dgb3tZiMh+f8f
   yQ49W2mdGh5EN+LXZDnwXBi5mqvoEL5ctdiXOH8DZoVAoMuXUvnqDc/NB
   +zDmN4NwsKJTJH90/0Oa7LNJBM3S6ZPMWsn6E2LdV5QeB9Caqt8VQbxa+
   eHAZz+h3AAcSmojuTvbzptxoh6jnOh6gAqDa3CSwT0taGcB+GZ7RCQ3PV
   A==;
X-CSE-ConnectionGUID: BsF0Lev0TxiHjhjJyJp2tQ==
X-CSE-MsgGUID: khVpZ8+uSY+Tq7+jrvwiVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="71668349"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71668349"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 00:09:41 -0700
X-CSE-ConnectionGUID: RNC+wC0bTMaQulKXt1+Njw==
X-CSE-MsgGUID: omWK81XAQOOASiPm7g5rwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254853861"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Jul 2026 00:09:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whMPZ-00000000G7N-25oa;
	Wed, 08 Jul 2026 07:09:37 +0000
Date: Wed, 08 Jul 2026 15:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-07 158/300]
 sound/soc/generic/audio-graph-card2.c:1310:3: error: cannot jump from this
 goto statement to its label
Message-ID: <202607081555.uDHLS6wN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-07
head:   53881e04e4c2435124d288fa73fd6b94994f667d
commit: 8f3b76210b0666f7368950bdb7f7ef2a238c365b [158/300] ASoC: generic: use snd_soc_card_register()
config: arm64-randconfig-r071-20260708 (https://download.01.org/0day-ci/archive/20260708/202607081555.uDHLS6wN-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081555.uDHLS6wN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081555.uDHLS6wN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/generic/audio-graph-card2.c:1310:3: error: cannot jump from this goto statement to its label
    1310 |                 goto end;
         |                 ^
   sound/soc/generic/audio-graph-card2.c:1313:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1313 |         struct link_info *li __free(kfree) = kzalloc_obj(*li);
         |                           ^
   1 error generated.


vim +1310 sound/soc/generic/audio-graph-card2.c

  1301	
  1302	int audio_graph2_parse_of(struct simple_util_priv *priv, struct graph2_custom_hooks *hooks)
  1303	{
  1304		struct snd_soc_card_driver *card_driver = simple_priv_to_card_driver(priv);
  1305		struct device *dev = simple_priv_to_dev(priv);
  1306		struct snd_soc_card *card;
  1307		int ret = -EINVAL;
  1308	
  1309		if (!dev)
> 1310			goto end;
  1311	
  1312		ret = -EINVAL;
  1313		struct link_info *li __free(kfree) = kzalloc_obj(*li);
  1314		if (!li)
  1315			goto end;
  1316	
  1317		if ((hooks) && (hooks)->hook_pre) {
  1318			ret = (hooks)->hook_pre(priv);
  1319			if (ret < 0)
  1320				goto end;
  1321		}
  1322	
  1323		ret = graph_for_each_link(priv, hooks, li, graph_count);
  1324		if (!li->link)
  1325			ret = -EINVAL;
  1326		if (ret < 0)
  1327			goto end;
  1328	
  1329		ret = simple_util_init_priv(priv, li);
  1330		if (ret < 0)
  1331			goto end;
  1332	
  1333		priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
  1334		if (IS_ERR(priv->pa_gpio)) {
  1335			ret = PTR_ERR(priv->pa_gpio);
  1336			dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
  1337			goto end;
  1338		}
  1339	
  1340		ret = simple_util_parse_widgets(priv, NULL);
  1341		if (ret < 0)
  1342			goto end;
  1343	
  1344		ret = simple_util_parse_routing(priv, NULL);
  1345		if (ret < 0)
  1346			goto end;
  1347	
  1348		ret = simple_util_parse_card_name(priv, NULL);
  1349		if (ret < 0)
  1350			goto err;
  1351	
  1352		ret = simple_util_parse_aux_devs(priv, NULL);
  1353		if (ret < 0)
  1354			goto err;
  1355	
  1356		memset(li, 0, sizeof(*li));
  1357		ret = graph_for_each_link(priv, hooks, li, graph_link);
  1358		if (ret < 0)
  1359			goto err;
  1360	
  1361		if ((hooks) && (hooks)->hook_post) {
  1362			ret = (hooks)->hook_post(priv);
  1363			if (ret < 0)
  1364				goto err;
  1365		}
  1366	
  1367		simple_util_debug_info(priv);
  1368	
  1369		card = devm_snd_soc_card_register(dev, card_driver, priv);
  1370		if (!card)
  1371			ret = -EINVAL;
  1372	err:
  1373		if (ret < 0) {
  1374			simple_util_clean_reference(priv);
  1375			return dev_err_probe(dev, ret, "parse error\n");
  1376		}
  1377	end:
  1378		return graph_ret(priv, ret);
  1379	}
  1380	EXPORT_SYMBOL_GPL(audio_graph2_parse_of);
  1381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
