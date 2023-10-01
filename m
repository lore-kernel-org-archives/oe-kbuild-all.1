Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83054361
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 03:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696130493; x=1727666493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MAzDr/PAd9PjmA8o8q0jfbYm/Nzu+WQtJNlovd1GTvA=;
  b=A6DBzAEluuyyVPlD+SEQHfVj+fDuCsIznX3O9dKcY483G5ge8keM23bz
   doDfcWYc6L5oGt8sqQgyugH8dwdSBBhMtlod7Q2V/b6eXwO5VoP6vg0n4
   DJidlXgayOSb1VuoeQgxataKH4/MpUH4v8MSOJ+V2HiDl00+300dNBhO7
   2NkRA69EiHNG1F3RsoMqF7AaCL8yV87NkCnK+v4SFEBmrjvC/Q92YxUD5
   h4+SGpAsf8snPBkKYU53k3EvMS0v7ZN0Op21JeRjXnQGc4NfgpXe/yVze
   i0XXNqKZOd77O6WkeAtlEBMOK5UiEqYclxz6bQlpBuAdx1S8JYIyeDvPf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="4065196"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="4065196"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 20:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="743802554"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="743802554"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Sep 2023 20:21:30 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmn1M-0004i3-1W;
	Sun, 01 Oct 2023 03:21:28 +0000
Date: Sun, 1 Oct 2023 11:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 9/38]
 sound/soc/mediatek/mt8188/mt8188-mt6359.c:1014:27: error: initialization of
 'int (*)(struct snd_soc_card *)' from incompatible pointer type 'void
 (*)(struct snd_soc_card *)'
Message-ID: <202310011140.2LAnbrJQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   84126be72ac9e0b38c992e806417952deb3cd540
commit: 25fb334d4b27e01a34b91dce341df1bd2827de91 [9/38] ASoC: card: Let 'fixup_controls' return errors
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231001/202310011140.2LAnbrJQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011140.2LAnbrJQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011140.2LAnbrJQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8188/mt8188-mt6359.c:1014:27: error: initialization of 'int (*)(struct snd_soc_card *)' from incompatible pointer type 'void (*)(struct snd_soc_card *)' [-Werror=incompatible-pointer-types]
    1014 |         .fixup_controls = mt8188_fixup_controls,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1014:27: note: (near initialization for 'mt8188_mt6359_soc_card.fixup_controls')
   cc1: some warnings being treated as errors


vim +1014 sound/soc/mediatek/mt8188/mt8188-mt6359.c

9f08dcbddeb307 Trevor Wu 2023-05-26  1005  
96035d46d4b452 Trevor Wu 2023-01-16  1006  static struct snd_soc_card mt8188_mt6359_soc_card = {
96035d46d4b452 Trevor Wu 2023-01-16  1007  	.owner = THIS_MODULE,
96035d46d4b452 Trevor Wu 2023-01-16  1008  	.dai_link = mt8188_mt6359_dai_links,
96035d46d4b452 Trevor Wu 2023-01-16  1009  	.num_links = ARRAY_SIZE(mt8188_mt6359_dai_links),
96035d46d4b452 Trevor Wu 2023-01-16  1010  	.dapm_widgets = mt8188_mt6359_widgets,
96035d46d4b452 Trevor Wu 2023-01-16  1011  	.num_dapm_widgets = ARRAY_SIZE(mt8188_mt6359_widgets),
96035d46d4b452 Trevor Wu 2023-01-16  1012  	.controls = mt8188_mt6359_controls,
96035d46d4b452 Trevor Wu 2023-01-16  1013  	.num_controls = ARRAY_SIZE(mt8188_mt6359_controls),
9f08dcbddeb307 Trevor Wu 2023-05-26 @1014  	.fixup_controls = mt8188_fixup_controls,
96035d46d4b452 Trevor Wu 2023-01-16  1015  };
96035d46d4b452 Trevor Wu 2023-01-16  1016  

:::::: The code at line 1014 was first introduced by commit
:::::: 9f08dcbddeb307793bbfff036db213d2cdf03a50 ASoC: mediatek: mt8188-mt6359: support new board with nau88255

:::::: TO: Trevor Wu <trevor.wu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
