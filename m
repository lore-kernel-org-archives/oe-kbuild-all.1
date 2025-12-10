Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22AC1E5205
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 00:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327699; cv=none; b=UmqcmL5h5HqzU+YzHDCslFc38Br0x/zrDQmoRe2lC9D5QT6YVy6JQHoWFaG9zmN6SD7NI9C+xSh63zxBWwBRT19tmzbHrXumqlSvp3OkpXVT9WGtwFW3pBaL48CpvC27aHz3rvyr43ECO84sdNnAku0OQLdduwDZzaqJG9/l73E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327699; c=relaxed/simple;
	bh=sqxDJm5ecXP+GlgrFG/IOZ1TcOXR8SMSXMkIX5Ws4Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bet5RsedJz2i3AyNKCVLcLsyKsVvEZXvYk/eORzVPjc23DezysDP9rGeu2h44LHJg7PBmUGCf66Bhe8jvPFmRp0yaqsYOz7m8cEVbKlpTSUM3VxQQfcSCX1tewBIZwo6LUO/jxj2H0PMzu9p/ItzSlEZa06Wcv78+jCsI9LvLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9BxAKNa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9BxAKNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765327698; x=1796863698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sqxDJm5ecXP+GlgrFG/IOZ1TcOXR8SMSXMkIX5Ws4Qs=;
  b=G9BxAKNaNsh7U117+Z2b8Gw6EnHsx64ls3fFicYa2bUX4ZQIz9brm635
   kcBZaCHgAUWZc44XBdxpGaIclFyvQ+sBb/p6mb34C2ZduRS9GSV2qHGpQ
   ICqDvpTLmfP7URw9809ys8M+c8hty1jsQx/T+m41zK5BcUx7iObQKk/Lx
   xQYn/GgFoH6+2XtoJftY5bCAQvj8tAbPyYfnTxM2jabrlL95Uf12UxTUy
   jlKt3h6mb0uelwOfv3xxnfIvietjJO6CBxxBdnfMjFPxK471NCUvuk8NC
   sG/C7GoEh9p/2wm7Nzhm4RAobMgsctgUeptZJKQfGeiaiJuT1UqGUTnqk
   A==;
X-CSE-ConnectionGUID: GUBIIUBHT9+YHG/8Tmcj1A==
X-CSE-MsgGUID: DfZ2CIheTKae5C1slNh9CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180772"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67180772"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 16:48:18 -0800
X-CSE-ConnectionGUID: qBN3eWI9Samm/7vwEsU0uA==
X-CSE-MsgGUID: tA/BGtbeRV6PxcAXa9Dg7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196422831"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Dec 2025 16:48:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT8NK-000000000Rx-03WN;
	Wed, 10 Dec 2025 00:48:14 +0000
Date: Wed, 10 Dec 2025 01:48:03 +0100
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_WM9712 when selected by SND_MPC52xx_SOC_PCM030
Message-ID: <202512100134.TlxkSHTy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
commit: 5a309875787db47d69610e45f00a727ef9e62aa0 ASoC: Fix SND_SOC_ALL_CODECS imply ac97 fallout
date:   6 years ago
config: powerpc-kismet-CONFIG_SND_SOC_WM9712-CONFIG_SND_MPC52xx_SOC_PCM030-0-0 (https://download.01.org/0day-ci/archive/20251210/202512100134.TlxkSHTy-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512100134.TlxkSHTy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100134.TlxkSHTy-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_WM9712 when selected by SND_MPC52xx_SOC_PCM030
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]
     - SND_MPC52xx_SOC_EFIKA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_EFIKA [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_WM9712
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_STAC9766
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_EFIKA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_EFIKA [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
