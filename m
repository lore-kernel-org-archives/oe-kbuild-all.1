Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773617FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 05:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737696956; cv=none; b=OzejFx+xSVVSEItLXBpN7mK8JnVcyBmv+SL6D/8c+V4zU6261yBjuRx7QY7gBS+4T/xGkj23hqrOak/ej7PJqYMS2pmLhgsnt34mOY2NTFoQnUk1sDUT3v/GF864xgeKJhxoHNV+KlJEDFcm54HLIgqV1Cx92OUB+KLVXJrXcQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737696956; c=relaxed/simple;
	bh=t6N8eDjc5uFhf6PIW/oDEESioxD5w7DR4BjNa8s7fu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+LRkGQHhoGeLDZvvu8/GbjliUewI+WIboERzvUetBSVJ1LGEfZcqFlc6UCXPnSAh464J42NE5R/Lcj9x68MEN0PSj2xr5YagvtFPpKCZ7NSvG5lHKRZY/6o9wN5r5Lf3DPbaWtPUFXQbCntMibimzWV73TJ3daA0Ym0GyQrfB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxP56MlW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxP56MlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737696954; x=1769232954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6N8eDjc5uFhf6PIW/oDEESioxD5w7DR4BjNa8s7fu8=;
  b=lxP56MlWaXEzXnWzLBDaqqKgu/GgMeVPh+56s61yxtOsCm1NrpfvWEux
   LwifSRiG6/qEtGh+qmHcfbNteh4KUIxq/nCiAfOvP6VNd8vZO7b2Aedjw
   ZvIjybKzxXmY21ZdWr5b5FK1HO0zDx4IWr9Ojx3aMQuQKKiIB6uZHNdyg
   Y1W50pqdATq98SN9WyEb7S1bRCSxeRBTb6fOIZLaBS8Z1nRpdTer+fXrH
   arTamzVrT38BEBQ6Vbww6eSTCVaVNjysuM8RKAFK6DNdjTHUoPVJDO7Lh
   kmdM9x8G20S3WBRVgV7tWKxj1Xwd4kGHt60l+4larBWU63+jWrM2lkk1I
   w==;
X-CSE-ConnectionGUID: 98z1EHJAQqeOXiUpD9BOoA==
X-CSE-MsgGUID: Xz0k722RTs23YYdRM9dacw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49214892"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="49214892"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 21:35:53 -0800
X-CSE-ConnectionGUID: GNjRitRGS2OjKjsmjNcN/Q==
X-CSE-MsgGUID: TECN9zo/TB+bOu4IHBZccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144916976"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2025 21:35:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbCM9-000cDv-0x;
	Fri, 24 Jan 2025 05:35:49 +0000
Date: Fri, 24 Jan 2025 13:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_STAC9766 when selected by SND_MPC52xx_SOC_EFIKA
Message-ID: <202501241340.OOg8O1vx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc8198dc7ebc492ec3e9fa1617dcdfbe98e73b17
commit: d8dd3f92a6ba11f9046df48765e6f12ad70a3946 ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout
date:   4 years, 11 months ago
config: powerpc-kismet-CONFIG_SND_SOC_STAC9766-CONFIG_SND_MPC52xx_SOC_EFIKA-0-0 (https://download.01.org/0day-ci/archive/20250124/202501241340.OOg8O1vx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241340.OOg8O1vx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241340.OOg8O1vx-lkp@intel.com/

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
