Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED661E5724
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 22:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765318636; cv=none; b=AJ+0CSJCzNCtB5b4ohh/x24ra+C6YRQE29yD5RQuJ8/ElRDkWA9IBDHyav01dBLYVpHsZDalkvgkHyeggXP4qdBjf9cvUej1LmS+otXwZ7gDEJ7+B3IBF/aswEI5l7iXNDo2EPwVpB4ygIHhP+FT5a8TOZVC3sP7Y4AusApyQPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765318636; c=relaxed/simple;
	bh=DWIu/ngCJTOcrUegOap+voh2y4vEWagNQqUO/zD3RaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FK4+kcwI0u+EiepA57gYRcgheSxSbTdsaJwxuTR31Q6Skv65yC3xJP2sp1/Q8l97FTwYzGVSukjI7ZvGHZcwl6vaR4ZQB+LDYXy0Ij2zB8PniI9Xc/ZAEL8Hto1ST5I+bvypQFVxEknU5xBnThQiZk65KzA2NtgOjsDlxdxp49M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Np/e5671; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Np/e5671"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765318636; x=1796854636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWIu/ngCJTOcrUegOap+voh2y4vEWagNQqUO/zD3RaI=;
  b=Np/e5671ndvRQIrmCheZ+hiKO/CxT1TOAE2YhjUEtNde17V+wgnNaEPL
   pv3jjKEDK39vSdqm5TtrRu2vtiYefWWDmzErMD9pE+XvrjXibIR/jIqqW
   vIHupFppNKPoKzUch52eBouyTmWwwnobmpLQYTWt8zUItYWvzZs/1Ic3A
   gxSkju4xb6QeoZmUbYNFcE1YnhhcHDygnKdxuKBb5o9v4pnREpgBMgydv
   CBt9Z73IzO4RQHGwJbGiyplWZEhENwCpGePWPsa3UMbzF/XyXUn4l/haL
   54vAEmn9UA0oupfOgQMRUa6mU3nINg2vsVdDh3r+WI2m41ct7onXZG7yg
   w==;
X-CSE-ConnectionGUID: cyMrHezjTLuc7trPNNrA6Q==
X-CSE-MsgGUID: BWL26TJxSguVFX3A0C/8Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67337562"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67337562"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:17:15 -0800
X-CSE-ConnectionGUID: XjlxcnC9QnaxpXGRDCCDDA==
X-CSE-MsgGUID: frJPRu56TNihV5WRXI5igQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="233745865"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Dec 2025 14:17:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT618-000000000O5-1StS;
	Tue, 09 Dec 2025 22:17:10 +0000
Date: Tue, 9 Dec 2025 23:16:29 +0100
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_STAC9766 when selected by SND_MPC52xx_SOC_EFIKA
Message-ID: <202512092301.grdsBZAE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a3984bbd69055898add0fe22445f99435f33450
commit: d8dd3f92a6ba11f9046df48765e6f12ad70a3946 ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout
date:   6 years ago
config: powerpc-kismet-CONFIG_SND_SOC_STAC9766-CONFIG_SND_MPC52xx_SOC_EFIKA-0-0 (https://download.01.org/0day-ci/archive/20251209/202512092301.grdsBZAE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092301.grdsBZAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092301.grdsBZAE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_STAC9766 when selected by SND_MPC52xx_SOC_EFIKA
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_EFIKA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_EFIKA [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_STAC9766
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_EFIKA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_EFIKA [=y]
   
   WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
     Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
     Selected by [y]:
     - TOUCHSCREEN_ADC [=y] && !UML && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && IIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
