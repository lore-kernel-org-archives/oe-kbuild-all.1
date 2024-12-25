Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13C7189905
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735131859; cv=none; b=cMwjKTZrcKNT8pBTzSLV2Cj1FgVl7Hkp+ixHwOv2v0P/58PbbLzTmvZEyKy9tmZVsOqZGZfDy8sbXRRNr3ViX5O1ZVmWyu3MBjAkI0z+nw8CWbM0wzMKPlRU0/TUVbP0S8Y0geE7VuAE3KlzlM6luOIIKZiCc6N7bCOSHFpHLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735131859; c=relaxed/simple;
	bh=oWjbWuaaVq7VXuJrtiAQFAEs2l1pt1Akiu5/FJkuQdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WxuDUa2Vytadit/XvgFLh1bve61cAGhlMNLL0m16Y7ZryhktmBPMTv277jUTNOEcsenIqKDSPT7LyDKajMkqec1YP9NULQqBdw7exbfHH4WrtnGTq+99aMDaEhDYS4pHUx0zpDkOHQoi1+c2KYICsm8ygjzatN2pSliJS5FDw78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BE/s/y/6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BE/s/y/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735131858; x=1766667858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWjbWuaaVq7VXuJrtiAQFAEs2l1pt1Akiu5/FJkuQdA=;
  b=BE/s/y/6MsIL++7QBJiQJBbY4sihDfDzMDfyBfQdtlIkJXKGcw8ILVX2
   S5f6et8kVtBs7aVBxv3E0F3Nt+HC/TsCikEbyjfhUPfS5RCMkds8upvnY
   X+Qvbhq7yoOJpJyOodoz2TF6C2mzg/a+rBzVEtJI6s7mC7Jn+EvC5cZim
   iMlB2Y/31EHQfCyNUF9HEa8zogU+dpt19to5LpjihPriizFOlOxAWsZGz
   iNDrEzCXw+isCvOKayWECjyET2lOIsamfP6G4bAd1+Bu9qbZnqqYhVHzi
   BmM1zeSCn2O8HQtvL5c2lLGQgUs+tSl/psg9U19fYjBUB2bEdfnQHJKGB
   A==;
X-CSE-ConnectionGUID: BF3v6o99QdqH3VPhlT+x3w==
X-CSE-MsgGUID: CaBm7kLtRhOVy1Vx5S4MwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35468152"
X-IronPort-AV: E=Sophos;i="6.12,263,1728975600"; 
   d="scan'208";a="35468152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 05:04:18 -0800
X-CSE-ConnectionGUID: vEYCmvx2Sa2biudEF07JgA==
X-CSE-MsgGUID: vRLxiUBeQqC1w19ezgKVew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137043537"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2024 05:04:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQR3d-0001qi-1q;
	Wed, 25 Dec 2024 13:04:13 +0000
Date: Wed, 25 Dec 2024 21:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [phy:fixes 12/12] kismet: WARNING: unmet direct dependencies
 detected for PHY_MTK_HDMI when selected by DRM_MEDIATEK_HDMI
Message-ID: <202412252129.Sp44aQeF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git fixes
head:   17194c2998d39ab366a2ecbc4d1f3281e00d6a05
commit: 17194c2998d39ab366a2ecbc4d1f3281e00d6a05 [12/12] phy: mediatek: phy-mtk-hdmi: add regulator dependency
config: nios2-kismet-CONFIG_PHY_MTK_HDMI-CONFIG_DRM_MEDIATEK_HDMI-0-0 (https://download.01.org/0day-ci/archive/20241225/202412252129.Sp44aQeF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241225/202412252129.Sp44aQeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412252129.Sp44aQeF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_MTK_HDMI when selected by DRM_MEDIATEK_HDMI
   WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
     Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK [=y] && OF [=y] && REGULATOR [=n]
     Selected by [y]:
     - DRM_MEDIATEK_HDMI [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_MEDIATEK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
