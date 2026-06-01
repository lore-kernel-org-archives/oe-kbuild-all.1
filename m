Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB36370D70
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 19:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780342395; cv=none; b=brLpI0Kcrr3Z0rhj1NG2TTnQ8mZcHKVw6qYHOBpo3+stREV5dGaoKPZ7uP6IKt8jbat023zCcjx2cewUBwltopRqo8l5/f4LMY3yM9bPInlUGGnw0/cj3CaDOpk1ABXNyVmio0fhn1Xb5wcpbPr0ILNL2jY1AARY8IuHFNXMKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780342395; c=relaxed/simple;
	bh=583+aEYtC6Jm9sjDrtakoQ64FQ7IKi/clbXL1YOhU8o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AFTcz6VxUYN52hn897JlqcjaEJbp0B1zNWpQ6H0odjdosHJ2hf/R6PjU0RfEIvsWqe1ccOIUjCd4gDhIEDBI/mK4GL/7D3yaTpoOizJtf6GHRZXN8zDcC7bxIYkkzKVnByQX3M2uLmvVo9EKbxPvNYinkE37OLM6Wgmb02plqCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsW0+heU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsW0+heU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780342393; x=1811878393;
  h=date:from:to:cc:subject:message-id;
  bh=583+aEYtC6Jm9sjDrtakoQ64FQ7IKi/clbXL1YOhU8o=;
  b=FsW0+heUM7DGUFVlDnjl2306N/PV4zVOzxVXntA7l9OsrUHwT0rtb0rJ
   FdI2bQqpQQkbMouE+pHOrcQZ2YMVyoawRkAkzsodH5FXb6F6jzNsmbR39
   2zxDpQie8gu9pUgC72BG93y1F6W2hrHjPVOxpweg8+wvZAXvi+bGuG3xn
   s5urRdAZyiDFdN5W5393Gc3tJDrpXeUwWyHcZaQuwZv79ZrsA1swgeGd5
   5bWXfaDu4DwywKvVCKUQEqekW/+oVrmY8DpLx1cbwzwzS39mVSEe1WUyk
   /8Oo+eoUegXnVPG4N7cbpk9qeSzRvJI4f4UAW1eG+nNwipXyd/0B2fjYN
   w==;
X-CSE-ConnectionGUID: NG/ki02SRvypROjlUOXK4w==
X-CSE-MsgGUID: 1igKZAN4Tgya4jTML6kroQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81084215"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81084215"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:33:13 -0700
X-CSE-ConnectionGUID: N1RpnvDVTWe33tIQcheW9w==
X-CSE-MsgGUID: UOYQNp0tQCa0gwjy9nTgqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="273945930"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2026 12:33:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU8Np-00000000B0Z-0ovf;
	Mon, 01 Jun 2026 19:33:09 +0000
Date: Tue, 02 Jun 2026 03:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/common/mtk-soundcard-driver.c:206:31: error: dereferencing
 pointer to incomplete type 'struct snd_soc_card_platform'
Message-ID: <202606020340.7vPjnoLa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: cc97e5ee4f734c20e86677cf9ed8ac4c87277f2a [290/290] ASoC: mediatek: common: use snd_soc_card_register()
config: arm64-randconfig-002-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020340.7vPjnoLa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020340.7vPjnoLa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020340.7vPjnoLa-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/common/mtk-soundcard-driver.c: In function 'mtk_soundcard_common_probe':
>> sound/soc/mediatek/common/mtk-soundcard-driver.c:206:31: error: dereferencing pointer to incomplete type 'struct snd_soc_card_platform'
     orig_dai_link = card_platform->driver.dai_link;
                                  ^~
   sound/soc/mediatek/common/mtk-soundcard-driver.c:217:9: error: too many arguments to function 'devm_snd_soc_card_alloc'
     card = devm_snd_soc_card_alloc(&pdev->dev, card_platform->owner,
            ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/sound/soc.h:1318,
                    from sound/soc/mediatek/common/mtk-soundcard-driver.c:12:
   include/sound/soc-card.h:90:22: note: declared here
    struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
                         ^~~~~~~~~~~~~~~~~~~~~~~


vim +206 sound/soc/mediatek/common/mtk-soundcard-driver.c

   184	
   185	int mtk_soundcard_common_probe(struct platform_device *pdev)
   186	{
   187		struct device_node *platform_node, *adsp_node, *accdet_node;
   188		struct snd_soc_component *accdet_comp;
   189		struct platform_device *accdet_pdev;
   190		const struct mtk_soundcard_pdata *pdata;
   191		struct mtk_soc_card_data *soc_card_data;
   192		struct snd_soc_dai_link *orig_dai_link, *dai_link;
   193		struct snd_soc_jack *jacks;
   194		struct snd_soc_card_platform *card_platform;
   195		struct snd_soc_card *card;
   196		const char *card_name;
   197		int i, orig_num_links, ret;
   198		bool needs_legacy_probe;
   199	
   200		pdata = device_get_match_data(&pdev->dev);
   201		if (!pdata)
   202			return -EINVAL;
   203	
   204		card_platform =  pdata->card_data->card_platform;
   205	
 > 206		orig_dai_link = card_platform->driver.dai_link;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
