Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A6148821
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 21:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712611511; cv=none; b=qPR96me7mMvM2UX0TC7iHyh1w9rYRwnho/mc5TBkG9hZdY9n0llQoGhIEWVbzOGVtFduoQQtlsxnXU3LXDWD5NwprMdcOeh5DEjd9E9b+Bcz2Q3GGZix4jZQ+tLyzjwXdN7grvf3LQ6aBfrzvRRTzofRpwop8I744e04uoivjlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712611511; c=relaxed/simple;
	bh=Cq3DsQlqiV7ail5ix0XUsou1KwHuNKNIe9gx3ewKcIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jn2GubQKiYUr02aRp+oBKaZs8oqMXR0W1KJEdCVhoPxoNHe/gk4FSmuR/FmVbjDaPyXSL5KBvdzL8tqrcXkrYz/PSGA1SvIJhq0tVd8ce7L1yOzpenyy828BX/+VtY0DPX4AFAV52Gpq2v5IComuYfIC+2wc/vh0iL3B3jxDdcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLB1QrB3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLB1QrB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712611509; x=1744147509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cq3DsQlqiV7ail5ix0XUsou1KwHuNKNIe9gx3ewKcIg=;
  b=kLB1QrB3jDkz7ynVFvyADZlHxnR+hwkX647YEQ5LhH9Ja8WsvYFZkuzD
   dWwKLx7Kh1vRXTgTbAp7/+Xv6FmBwWYABXoBpW95YCxvjVxxYrM5lj4Fa
   KrRh2kYgT6hwr3Re+W383H5UYzegPAXGOaPjXsWq4THsSvVwB/PsbVpfr
   HytU/EwlWX89zcIjbX1hR2lF1CIFYcDFDOYlceIXPGIQ6GC058FE5rMhl
   LzCcMuYvuLwb3n28Jw6XkRhABk3FCCQ8b2H40fLhYFk2iQ6HFJ4xZUfy9
   XM0Rxu7WJWDjKx/oZXBUcM/67RcQfIbxyKaNt9eHqIXtSWAGPCWvZHGTm
   w==;
X-CSE-ConnectionGUID: 4EgEheSESAieFQ113MTcxg==
X-CSE-MsgGUID: TSz7ja/HRsGXMCnAcxbkbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7777039"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7777039"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 14:25:06 -0700
X-CSE-ConnectionGUID: rx0GHVBCTt+TDmIf4tTpFg==
X-CSE-MsgGUID: snlLtfdoSHKM6YuRWS5zaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="20446909"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2024 14:25:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtwU9-0005VE-2m;
	Mon, 08 Apr 2024 21:25:01 +0000
Date: Tue, 9 Apr 2024 05:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Algea Cao <algea.cao@rock-chips.com>
Subject: phy-rockchip-samsung-hdptx.c:undefined reference to
 `rational_best_approximation'
Message-ID: <202404090540.2l1TEkDF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fec50db7033ea478773b159e0e2efb135270e3b7
commit: 553be2830c5f33308483e8118de748a2c69fe593 phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver
date:   8 weeks ago
config: sh-randconfig-002-20240409 (https://download.01.org/0day-ci/archive/20240409/202404090540.2l1TEkDF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090540.2l1TEkDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090540.2l1TEkDF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/phy/rockchip/phy-rockchip-samsung-hdptx.o: in function `rk_hdptx_ropll_tmds_cmn_config':
>> phy-rockchip-samsung-hdptx.c:(.text+0x950): undefined reference to `rational_best_approximation'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
