Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3927224240
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 03:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765338201; cv=none; b=JdCDxfJqV8zeeCTfn3Djbod3EF8mBXcowHZ4YAhcLfdhQremWVQx2ajZRr1HNY7kiGkiptwPIIWaaBnaaMxm8ywJKccBfOXZBuUz34VDNCLXTn1Ebq8cOso4CmGPro3G6Xz+Ojzc7rEa6cwdeRslmiMXQMxxBjhBGKSvg5GRQTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765338201; c=relaxed/simple;
	bh=bYUCH++P4HxeV69jzNwx/v1nYPea46MZd9z6pSBuFjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKjrLzMa7sz/DGI9rQvKooF1ATPFMvXk2WRyVeg1f5YnsLUKCL5k+Hr3m1wU7C+Dx9i+Yksc2KWYI5hkWjDUZJU42NnAO3J611ZXgM3bXxhu0b4xbf7tJnF5vay5ob/oJvxjsUK0zkp2GD5wnvXmzEQVDb3EcLEpPjioA4tf8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0btnr1Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0btnr1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765338200; x=1796874200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYUCH++P4HxeV69jzNwx/v1nYPea46MZd9z6pSBuFjw=;
  b=X0btnr1Zh/1R5PaL/9Kc29i5EPnkTHddhet/k5BpbGnQ0iG5evvMg00a
   2IdaiEn7A+2JKELTsGEZpyvZRg7Otbwayvm/gXaGZxXZ8X/29TNz30VYG
   ff2syBr0kZMPtG664AVpg5Vcb+aFYAbh3/zF2rXJ8ilCHtGYGKyz5OUw8
   WJzMZuq9hzQL6AN9MMiV7q3Kn7XlRp5cZL4AB48topXbQAODxo7TfQq21
   Kq4y03FgiAd6dtAbqlF3FkNaG1tSEB2J40QiLPOyC5mnlWDAS+3HPrH9w
   D8WltCfmwlEMqz6+SbW+3q4wwdvcgRJnKN9YKu6LAF+7mAHjJO7XQx0c+
   A==;
X-CSE-ConnectionGUID: bktz5d41Tz+2pVbxFXW2ZA==
X-CSE-MsgGUID: iKRFcJe4SU2r03pen1SyEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67190680"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="67190680"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 19:43:19 -0800
X-CSE-ConnectionGUID: zAiWG8GtTVGFxR3ubVR5sg==
X-CSE-MsgGUID: ZT90+dOBTbSHbqhKBhs2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196304772"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2025 19:43:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTB6h-000000000UC-3UOV;
	Wed, 10 Dec 2025 03:43:15 +0000
Date: Wed, 10 Dec 2025 04:42:42 +0100
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 AX45MP_L2_CACHE when selected by ARCH_R9A07G043
Message-ID: <202512100411.WxJU2No9-lkp@intel.com>
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
commit: 4d1608d0ab3365d1ef9447bdbc0cb4c0962f1774 cache: Make top level Kconfig menu a boolean dependent on RISCV
date:   3 weeks ago
config: riscv-kismet-CONFIG_AX45MP_L2_CACHE-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20251210/202512100411.WxJU2No9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512100411.WxJU2No9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100411.WxJU2No9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE when selected by ARCH_R9A07G043
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
     Depends on [n]: CACHEMAINT_FOR_DMA [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && !DMA_DIRECT_REMAP [=n] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
