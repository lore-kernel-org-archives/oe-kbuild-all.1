Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF4D11CB6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPBtoXUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699102852; x=1730638852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ewbo2wi6GDKVYinQskwXrcZuUFka4ZJkUJM/nB3BPOA=;
  b=mPBtoXUCFsbLQOXNjve0DryM0X7mKgN0mEJc9kkKRsGIBhOZ9yo6y6gE
   bVIICx024RugRuFAwDlblpD0ZAYHI5zr6ZE1ig6Eo2iobqZyf7/a6cFse
   foYWqlEl+5Np8Hi+gQuIM0LUlaVf6rhSkfN5br38pOTSSEXtvbCCq3Z9+
   z7y+23coCTmqet+0tr0ZYr/sPGMCw6qy3GVwY1Ju6Eks8J0GmfJ9VvaER
   in9YYuE/R5IwHK9KnbswnXIWn5jHRH1uSbbrNMt0N0jenmdfGuNC96yJI
   G5By8Gwc+tZZQAB/Ry0kIvItr65uVJNKxghJc3DPJ/AghwBGb/wP4VrMq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420199786"
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="420199786"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 06:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765523152"
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="765523152"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2023 06:00:49 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzGGd-0004Ps-2l;
	Sat, 04 Nov 2023 13:00:47 +0000
Date: Sat, 4 Nov 2023 21:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:vc4 2/33] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_PCM512x_I2C when selected by
 SND_BCM2708_SOC_HIFIBERRY_DACPLUSADC
Message-ID: <202311042014.kE80z49J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vc4
head:   814eee0fb2a10f00039cef7db9679ae37117e486
commit: 6213708f949443dd8f9efa3f65d7dcf0718d7475 [2/33] hifiberry_dacplusadc: add support for the Hifiberry DAC+ ADC
config: i386-kismet-CONFIG_SND_SOC_PCM512x_I2C-CONFIG_SND_BCM2708_SOC_HIFIBERRY_DACPLUSADC-0-0 (https://download.01.org/0day-ci/archive/20231104/202311042014.kE80z49J-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311042014.kE80z49J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311042014.kE80z49J-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_PCM512x_I2C when selected by SND_BCM2708_SOC_HIFIBERRY_DACPLUSADC
   .config:5212:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for SND_SOC_PCM512x_I2C
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_BCM2708_SOC_HIFIBERRY_DACPLUSADC [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=y]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
