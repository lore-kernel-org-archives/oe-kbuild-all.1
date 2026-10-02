Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC192AEEB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935850; cv=none; b=h8V0BxTYRbWlQjUzsBex8LG8ZlwRASa8PgFZNvaUhlqvBvyzdEWlyGE7cPL0Fk921bRErpJTMDN+Adv/luLtXzrw+0yHwL3oHw0k2A+Kkg3rbhIPzgok108k9+an6zovHQuDkVy7q8UW5egcCfsnY1B7Cu7Ft5I8LfMPmXnhuJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935850; c=relaxed/simple;
	bh=NLLh+WkV5jjovoiGzOK8Znjh4cNiZ2LYOv1QtIsZ/CI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lBohe91MnkJfBiCcEc7xW5SkYD0GMzba915c+vHXB+uxxOQblA5O1FFsc7HuLFOdcQEmr5BL0WrDZsUPyGWKalmW7Oix0e7PjF1IF/TFqxOQwm6fwNNpXwF1v2QdzXKNFx6KcSwYIfz1VHKrB33MwtzsHem4bGsLIWTa6ospugM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfC+D+8w; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfC+D+8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790935841; x=1822471841;
  h=date:from:to:cc:subject:message-id;
  bh=NLLh+WkV5jjovoiGzOK8Znjh4cNiZ2LYOv1QtIsZ/CI=;
  b=gfC+D+8wTKfrucLm6IJ4kHVgMfRr+PDuWEt4S7Pgx7uZZbWEoTOw9lw9
   jP/vPyntfCDnpw96bfiImISmV/ONipbm6tqBjv89PicDW8ZvOgsvMN+we
   01W9g8mIx8TJcggX+FuFXMHajggSHUtaSU1ttdaH0HzH+5/sn2UENgxRD
   wLi3MuSREk46puz+uC7KSx+CgpIt7kdAl51KxjBDOOFpxzZyZFvKmvzg0
   SSq0F4ssurmyxNyh7ufujLSu/FaV+DjnpCuAhacSWxtGx44bw4bWSDSVY
   zJYoGVbBqipu7azRvAAXOHepJLl4pBHxAOXV3fDlN9Fys82TWR36A8VPa
   g==;
X-CSE-ConnectionGUID: xlGETzGGQS297kFWywIZ9w==
X-CSE-MsgGUID: pVQE7R3qTzCrLUmhPdKoQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90469522"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90469522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:10:39 -0700
X-CSE-ConnectionGUID: IDevn+s/RqWqfo8NKj0pWQ==
X-CSE-MsgGUID: XkQ/vnvaRR6LewWCB1bc3A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 02 Oct 2026 03:10:37 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCaDq-000000000Uh-3wGc;
	Fri, 02 Oct 2026 10:10:34 +0000
Date: Fri, 02 Oct 2026 12:10:16 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-02 326/332]
 sound/soc/soc-card.c:1510:3: error: cannot jump from this goto statement to
 its label
Message-ID: <202610021215.ybvK2FC8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-02
head:   f081696132aafae20dd9ebf62abbf292789b89f9
commit: 722885057668af3840164699ad758a7f7ec540a4 [326/332] ASoC: soc-card: use missing soc_card_ret()
config: x86_64-randconfig-2200-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021215.ybvK2FC8-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021215.ybvK2FC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021215.ybvK2FC8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-card.c:1510:3: error: cannot jump from this goto statement to its label
    1510 |                 goto err;
         |                 ^
   sound/soc/soc-card.c:1528:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1528 |         guard(mutex)(&client_mutex);
         |         ^
   include/linux/cleanup.h:423:2: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:303:3: note: expanded from macro 'CLASS'
     303 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:35:1: note: expanded from here
      35 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:41:1: note: expanded from here
      41 | __UNIQUE_ID_unlock_357
         | ^
   sound/soc/soc-card.c:1528:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:423:15: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:165:2: note: expanded from macro '__UNIQUE_ID'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:29:1: note: expanded from here
      29 | __UNIQUE_ID_guard_356
         | ^
   1 error generated.


vim +1510 sound/soc/soc-card.c

  1493	
  1494	int snd_soc_card_register_c(struct snd_soc_card *card, struct snd_soc_card_driver *driver)
  1495	{
  1496		int ret;
  1497	
  1498		if (!card->name)
  1499			snd_soc_card_set_name(card, driver->default_name);
  1500		if (!card->long_name)
  1501			snd_soc_card_set_long_name(card, driver->default_long_name);
  1502		if (!card->components)
  1503			snd_soc_card_set_components(card, driver->default_components);
  1504	
  1505		card->driver		= driver;
  1506		card->instantiated	= 0;
  1507		card->dapm		= snd_soc_dapm_alloc(card->dev);
  1508		if (!card->dapm) {
  1509			ret = -ENOMEM;
> 1510			goto err;
  1511		}
  1512	
  1513		dev_set_drvdata(card->dev, card);
  1514	
  1515		INIT_LIST_HEAD(&card->widget_list_head);
  1516		INIT_LIST_HEAD(&card->path_list_head);
  1517		INIT_LIST_HEAD(&card->dapm_list_head);
  1518		INIT_LIST_HEAD(&card->dapm_dirty_list_head);
  1519		INIT_LIST_HEAD(&card->aux_list_head);
  1520		INIT_LIST_HEAD(&card->component_list_head);
  1521		INIT_LIST_HEAD(&card->unbind_list);
  1522		INIT_LIST_HEAD(&card->rtd_list_head);
  1523	
  1524		mutex_init(&card->mutex);
  1525		mutex_init(&card->dapm_mutex);
  1526		mutex_init(&card->pcm_mutex);
  1527	
  1528		guard(mutex)(&client_mutex);
  1529	
  1530		ret = snd_soc_card_bind_call(card);
  1531	err:
  1532		return soc_card_ret(card, ret);
  1533	}
  1534	EXPORT_SYMBOL_GPL(snd_soc_card_register_c);
  1535	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
