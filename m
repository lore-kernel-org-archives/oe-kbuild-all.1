Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8617811C96
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688996419; x=1720532419;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bppY2Q74QFFX1fAPJuJlt7DNwQrYcoe4DlD6YB2Bjfo=;
  b=l53jD1rGTwjiTZHQx2ig7AfDdVz7jWH1rdneGmdIbUJoGGjvk/x8GiWu
   N6z5XWTf/6f3kwRxCzw4nsEDRWvVvGgl0mNCPQk8qnJ/ovqEa0hzCcjAV
   CXc1GAZlBwtOQs6lmOVnk0Sd0GH7SHBnt5vAUmhZIhkB/+la476wl1ID9
   CPshGvl8ihALoH5PSQ+2nm6WAKWlv9wy2Ln97w85lPwpIUIMcWojFRK+N
   JkK2vcsYiY8H+Mk1TRrNA3LXzax2TWU7EQpAph52SQ1j538vJ0mSreIZF
   /b31bUB83X0OMwmlead0AtrVPKonSBvmSIfBsSVMOqNKh94vfpxGBpZ3m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450701919"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="450701919"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 06:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="894775439"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="894775439"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Jul 2023 06:40:16 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIr7f-0003jA-21;
	Mon, 10 Jul 2023 13:40:15 +0000
Date: Mon, 10 Jul 2023 21:39:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/asahi-base-6.5 1/2]
 sound/soc/mediatek/mt8188/mt8188-mt6359.c:1014:27: error: initialization of
 'int (*)(struct snd_soc_card *)' from incompatible pointer type 'void
 (*)(struct snd_soc_card *)'
Message-ID: <202307102148.3PvYu9xZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/asahi-base-6.5
head:   e3df40097445878321c27aaeb4177dfe22ccc568
commit: 3181a21c5289c9b913dd3402a80704e4140d9d43 [1/2] Merge tag 'v6.5-rc1' into kvm-arm64/asahi-base-6.5
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230710/202307102148.3PvYu9xZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307102148.3PvYu9xZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307102148.3PvYu9xZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8188/mt8188-mt6359.c:1014:27: error: initialization of 'int (*)(struct snd_soc_card *)' from incompatible pointer type 'void (*)(struct snd_soc_card *)' [-Werror=incompatible-pointer-types]
    1014 |         .fixup_controls = mt8188_fixup_controls,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1014:27: note: (near initialization for 'mt8188_mt6359_soc_card.fixup_controls')
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SM_GCC_8350
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_VIDEOCC_8350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8450
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8550
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]


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
