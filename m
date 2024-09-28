Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB64C18595E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727520076; cv=none; b=HEmagj8iD6IkNbM/WrJUO5jHVPFZ9p96JWPVXSSzyJXRtccm7nshRKQpEE4abL5kBlHzQSnnUFHNvxCjKOh72UUoIdLbIKuUm7952s/hf8xEDEhic+I4o78l2FXydxminlihghw1vcR6Bj5aWmramcSKoaWA9uDhUo0+cNRGr+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727520076; c=relaxed/simple;
	bh=MRI2yz+W/qJidNOZFaawXpigOVKhpkmT8ktFZnH7SpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EgzHYD9JUBEqI3MvfrBjwzwf7xXflnRm4oogtvM5rWZSli/sr2/243SUSTnLrYcdlIj+6OCUvVm6kdufHwCiWhQsi2mNCw2x1N94SBnNczNxdLmCHWBpPJl+QbX4qwjan+XJ1okyt23olwkvKBMxjbIFipnB6AS6zUtkPjGwSH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZzKSj8I; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZzKSj8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727520075; x=1759056075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MRI2yz+W/qJidNOZFaawXpigOVKhpkmT8ktFZnH7SpM=;
  b=ZZzKSj8IF5P9svkVvwIooRzlGP3D0tMOkoHDbbQ9akJoGsnnOtDi/uXs
   OtgySkunip8eA6ULjzM9hW6x/qFk1HBe7Rr5tgGnE5moXoVcYri64ArzL
   ZYskUrmX54xIvWTFWxB0hF8AjG3lGLBuavN2fvLzyqABIToSENLIb0y/f
   q1erFmjJV7Bzo6N4JPe3iF5wwQ/2yeElQwQv9TrRHydlwIyOjwIVUTycK
   kRVsvPBFu3ZKQ96F/WsPFmFojQX4DZl5svOn6i/nQaSGacDv4DF/+HfQd
   /OnvJLK+WSVwAygrDnyXMN1rl07rbhkKA597F0TeECAidiiIhXySDCtfQ
   A==;
X-CSE-ConnectionGUID: hVcukh6kTOeBDcPY1PQZYw==
X-CSE-MsgGUID: 98oKde9mReCRE191Bfp+Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26534710"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26534710"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 03:41:13 -0700
X-CSE-ConnectionGUID: 0zIgmZJXT/KflUmgFQdo0A==
X-CSE-MsgGUID: wNmS0hM7Rr+ie2JRnzNbfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77574275"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Sep 2024 03:41:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suUsv-000NB8-1k;
	Sat, 28 Sep 2024 10:41:09 +0000
Date: Sat, 28 Sep 2024 18:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2024-09-26 3/13]
 sound/soc/sof/nocodec.c:59:11: error: member reference type 'struct
 snd_soc_dai_link' is not a pointer; did you mean to use '.'?
Message-ID: <202409281818.4Mk0HA55-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2024-09-26
head:   cb3800adeb6986766b0b964bab095945d71295dc
commit: 88975977f45cbfa257894c9367179ce2bce9d2b7 [3/13] ASoC: sof: remove dpcm_xxx flags
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409281818.4Mk0HA55-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281818.4Mk0HA55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281818.4Mk0HA55-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/nocodec.c:59:11: error: member reference type 'struct snd_soc_dai_link' is not a pointer; did you mean to use '.'?
      59 |                 links[i]->playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
         |                 ~~~~~~~~^~
         |                         .
>> sound/soc/sof/nocodec.c:59:27: error: expression is not assignable
      59 |                 links[i]->playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~ ^
   sound/soc/sof/nocodec.c:60:11: error: member reference type 'struct snd_soc_dai_link' is not a pointer; did you mean to use '.'?
      60 |                 links[i]->capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;
         |                 ~~~~~~~~^~
         |                         .
   sound/soc/sof/nocodec.c:60:27: error: expression is not assignable
      60 |                 links[i]->capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;
         |                 ~~~~~~~~~~~~~~~~~~~~~~  ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +59 sound/soc/sof/nocodec.c

    21	
    22	static int sof_nocodec_bes_setup(struct device *dev,
    23					 struct snd_soc_dai_driver *drv,
    24					 struct snd_soc_dai_link *links,
    25					 int link_num, struct snd_soc_card *card)
    26	{
    27		struct snd_soc_dai_link_component *dlc;
    28		int i;
    29	
    30		if (!drv || !links || !card)
    31			return -EINVAL;
    32	
    33		/* set up BE dai_links */
    34		for (i = 0; i < link_num; i++) {
    35			dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
    36			if (!dlc)
    37				return -ENOMEM;
    38	
    39			links[i].name = devm_kasprintf(dev, GFP_KERNEL,
    40						       "NoCodec-%d", i);
    41			if (!links[i].name)
    42				return -ENOMEM;
    43	
    44			links[i].stream_name = links[i].name;
    45	
    46			links[i].cpus = &dlc[0];
    47			links[i].codecs = &snd_soc_dummy_dlc;
    48			links[i].platforms = &dlc[1];
    49	
    50			links[i].num_cpus = 1;
    51			links[i].num_codecs = 1;
    52			links[i].num_platforms = 1;
    53	
    54			links[i].id = i;
    55			links[i].no_pcm = 1;
    56			links[i].cpus->dai_name = drv[i].name;
    57			links[i].platforms->name = dev_name(dev->parent);
    58	
  > 59			links[i]->playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
    60			links[i]->capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;
    61	
    62			links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
    63		}
    64	
    65		card->dai_link = links;
    66		card->num_links = link_num;
    67	
    68		return 0;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
