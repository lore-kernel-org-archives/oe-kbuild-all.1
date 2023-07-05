Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB1D23D7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688548617; x=1720084617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4IJVnSc3dT9a9TI+HnDZIoQ3fCjPEXWlKfBtgPfUS8=;
  b=k7z1tuwyz0sCeNL4X0DdjfhZU4UEVA+vTgf1hulVVogksiYv67EM20mH
   jtVKz4gB0z0aU7D6zqXxhZ0zBERsz6iE3RXoRJhXYf1m4fZtm3zsf8prQ
   5mtlwGkYfOH8CcCwOxLYKHkGdwwhofmHJp3f9Pfd/OzRe7PMzMytvfAYj
   Kaxu6OCg+BA/OUATED60gF79NFRUnnzBfjfEBZnupVvQLamBSNfJu3hYj
   wRsCTy1dsQRWQOzrlIjZm1okem+fNvlQ6BVrElzKm/93T/xzQzP7Ls0cX
   rOYX8RBj8QI0R7t/El8PtjOA8SB7D7Osxc57EWI96hyGr2qEJhlXPQjpl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="348079547"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="348079547"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 02:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="784467617"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="784467617"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jul 2023 02:16:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGyd4-0000Xe-05;
	Wed, 05 Jul 2023 09:16:54 +0000
Date: Wed, 5 Jul 2023 17:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 31/38]
 sound/soc/mediatek/mt8188/mt8188-mt6359.c:1000:25: error: implicit
 declaration of function 'snd_ctl_remove'; did you mean 'snd_ctl_rename'?
Message-ID: <202307051751.ewoQ5wky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   1daeb793bc0d3c3ad9a66718852a4be0584b700c
commit: 664c9b8fd2f9e61cbe85d8015fc1962ed10d8a2a [31/38] ALSA: control: Drop snd_ctl_remove()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230705/202307051751.ewoQ5wky-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051751.ewoQ5wky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307051751.ewoQ5wky-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8188/mt8188-mt6359.c: In function 'mt8188_fixup_controls':
>> sound/soc/mediatek/mt8188/mt8188-mt6359.c:1000:25: error: implicit declaration of function 'snd_ctl_remove'; did you mean 'snd_ctl_rename'? [-Werror=implicit-function-declaration]
    1000 |                         snd_ctl_remove(card->snd_card, kctl);
         |                         ^~~~~~~~~~~~~~
         |                         snd_ctl_rename
   cc1: some warnings being treated as errors


vim +1000 sound/soc/mediatek/mt8188/mt8188-mt6359.c

9f08dcbddeb307 Trevor Wu 2023-05-26   981  
9f08dcbddeb307 Trevor Wu 2023-05-26   982  static void mt8188_fixup_controls(struct snd_soc_card *card)
9f08dcbddeb307 Trevor Wu 2023-05-26   983  {
9f08dcbddeb307 Trevor Wu 2023-05-26   984  	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(card);
9f08dcbddeb307 Trevor Wu 2023-05-26   985  	struct mt8188_card_data *card_data = (struct mt8188_card_data *)priv->private_data;
9f08dcbddeb307 Trevor Wu 2023-05-26   986  	struct snd_kcontrol *kctl;
9f08dcbddeb307 Trevor Wu 2023-05-26   987  
9f08dcbddeb307 Trevor Wu 2023-05-26   988  	if (card_data->quirk & NAU8825_HS_PRESENT) {
9f08dcbddeb307 Trevor Wu 2023-05-26   989  		struct snd_soc_dapm_widget *w, *next_w;
9f08dcbddeb307 Trevor Wu 2023-05-26   990  
9f08dcbddeb307 Trevor Wu 2023-05-26   991  		for_each_card_widgets_safe(card, w, next_w) {
9f08dcbddeb307 Trevor Wu 2023-05-26   992  			if (strcmp(w->name, "Headphone"))
9f08dcbddeb307 Trevor Wu 2023-05-26   993  				continue;
9f08dcbddeb307 Trevor Wu 2023-05-26   994  
9f08dcbddeb307 Trevor Wu 2023-05-26   995  			snd_soc_dapm_free_widget(w);
9f08dcbddeb307 Trevor Wu 2023-05-26   996  		}
9f08dcbddeb307 Trevor Wu 2023-05-26   997  
9f08dcbddeb307 Trevor Wu 2023-05-26   998  		kctl = ctl_find(card->snd_card, "Headphone Switch");
9f08dcbddeb307 Trevor Wu 2023-05-26   999  		if (kctl)
9f08dcbddeb307 Trevor Wu 2023-05-26 @1000  			snd_ctl_remove(card->snd_card, kctl);
9f08dcbddeb307 Trevor Wu 2023-05-26  1001  		else
9f08dcbddeb307 Trevor Wu 2023-05-26  1002  			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
9f08dcbddeb307 Trevor Wu 2023-05-26  1003  	}
9f08dcbddeb307 Trevor Wu 2023-05-26  1004  }
9f08dcbddeb307 Trevor Wu 2023-05-26  1005  

:::::: The code at line 1000 was first introduced by commit
:::::: 9f08dcbddeb307793bbfff036db213d2cdf03a50 ASoC: mediatek: mt8188-mt6359: support new board with nau88255

:::::: TO: Trevor Wu <trevor.wu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
