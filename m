Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDEC1CD23
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713198838; cv=none; b=HfMuIJxb0liQhD7QCyYo8ISHQqNq19G7K/m6Vmn6Hgc+1N/Z+ls2Ew1CxsqE4NyD8qFLITao45VteKxUefG8kckoVouQApwSS2mTpkR6U5kdaP48dDABrJ6aNkflfX0iCN5iQGvCxGTlI5hDZqWwk/aH1mi3oePr5YipyoRIjQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713198838; c=relaxed/simple;
	bh=b/TxYfmsgRqLyc3+pne9uGog8iUUs8CLn2gTlgEEGPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt6k/zWCiNIE3rMQVhSKusAR8YgO+yGUbvWvGF0jn5nxPAKgsHlX5fOK4VptLMj0Ces+Na2ot+sO0gbRfOtZWJHPpVubZT/XgWXJl7OaemyMAlyuxUQ6VG0XvHf22w52mNnlhEVQiFgvyrHsSwiddSNdnvfF87L76/HqjaBnnps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmEeLsdC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmEeLsdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713198836; x=1744734836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b/TxYfmsgRqLyc3+pne9uGog8iUUs8CLn2gTlgEEGPw=;
  b=cmEeLsdCg1P5TgAWpJuF2DkgD6tYZXhn1BpSl2r6K1OqRgLGRDquzcM2
   lSN1pO19/MMzB7CHuhtB3iKkW+9bzP1pgi08D4G526c1TLLcJwiVZJS/G
   PYvi0H+53OXNjLiqo6AncDLt5S8b2gIQAEoZC6ssnvXLvghR9PgzuSfpX
   YzyC5QX1k9UxlAg3lgMM8Gvz/slc3Yy2Grzljnb5P+jlmXacS4wB1fi+/
   HCvRrVPD3tG/6rnYtGDwmpc/vDF4yc4/1XA6LQ91ODalCQl/52IlqVpWr
   1nYhDurX5r09ewRVEXPS59H4Zd0kDD+43oi03UITG04Gn65Auxlczi4j5
   A==;
X-CSE-ConnectionGUID: BjA/J+G6QJ+UdQoWgaNL0g==
X-CSE-MsgGUID: rgK5xg4zTDeQZVQIAipHuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26114661"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26114661"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 09:33:53 -0700
X-CSE-ConnectionGUID: p1+12zBFRmCebjU7hQ7K3A==
X-CSE-MsgGUID: 0pSiFw7USXyrAKGON3hbNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26748936"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2024 09:33:53 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwPHB-0004PA-2k;
	Mon, 15 Apr 2024 16:33:49 +0000
Date: Tue, 16 Apr 2024 00:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 08/18] ASoC: mediatek: mt8195: Migrate to the common
 mtk_soundcard_startup
Message-ID: <202404160030.7UmbflCf-lkp@intel.com>
References: <20240409113310.303261-9-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409113310.303261-9-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on robh/for-next broonie-spi/for-next linus/master v6.9-rc4 next-20240415]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/ASoC-mediatek-Add-common-machine-soundcard-driver-probe-mechanism/20240409-194124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240409113310.303261-9-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v4 08/18] ASoC: mediatek: mt8195: Migrate to the common mtk_soundcard_startup
config: i386-buildonly-randconfig-004-20240415 (https://download.01.org/0day-ci/archive/20240416/202404160030.7UmbflCf-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160030.7UmbflCf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160030.7UmbflCf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1451:12: error: initializer element is not constant
      .rates = mt8195_rate_constraint,
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1451:12: note: (near initialization for 'mt8195_pcm_constraints[0].rates')
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1458:12: error: initializer element is not constant
      .rates = mt8195_rate_constraint,
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1458:12: note: (near initialization for 'mt8195_pcm_constraints[1].rates')
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1465:12: error: initializer element is not constant
      .rates = mt8195_rate_constraint,
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1465:12: note: (near initialization for 'mt8195_pcm_constraints[2].rates')


vim +1451 sound/soc/mediatek/mt8195/mt8195-mt6359.c

  1444	
  1445	static const struct mtk_pcm_constraints_data mt8195_pcm_constraints[MTK_CONSTRAINT_HDMIDP + 1] = {
  1446		[MTK_CONSTRAINT_PLAYBACK] = {
  1447			.channels = {
  1448				.list = mt8195_pcm_playback_channels,
  1449				.count = ARRAY_SIZE(mt8195_pcm_playback_channels)
  1450			},
> 1451			.rates = mt8195_rate_constraint,
  1452		},
  1453		[MTK_CONSTRAINT_CAPTURE] = {
  1454			.channels = {
  1455				.list = mt8195_pcm_capture_channels,
  1456				.count = ARRAY_SIZE(mt8195_pcm_capture_channels)
  1457			},
  1458			.rates = mt8195_rate_constraint,
  1459		},
  1460		[MTK_CONSTRAINT_HDMIDP] = {
  1461			.channels = {
  1462				.list = mt8195_pcm_hdmidp_channels,
  1463				.count = ARRAY_SIZE(mt8195_pcm_hdmidp_channels)
  1464			},
  1465			.rates = mt8195_rate_constraint,
  1466		},
  1467	};
  1468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
