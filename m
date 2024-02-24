Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C577F2563
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708761455; cv=none; b=m9vtJlmkvCO8z9+ux9NLpCWNPdnZPJe8VkUKCBWCfyUe6aKifvgosOumHXKrmEZz2Mw6tiI96B58gGGU6GRkI/40zhuYFV5BqXZlzVfOZ4XxjSnNs0CsWtZjkmPPVSZI20XoS2FNxvaD5N55YUcJR10mKBqKRdvtz51B93/s5yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708761455; c=relaxed/simple;
	bh=YcIa3eIXHGNCMMhf5Hd6OV1BE453D3ARtfnzc9zDq+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cIA98VihU3JEPAgiuJB4VR/O63TvjnncVOdYNnodNEx0Ua18VWtBd6F3wv0oqM6Zr0mF+e5Fg4psiDBDC1YcAsJxLInfhtZPVcnuPGwFSSboHVduIhXLSrHnMdTDdwPdnCoYgCv6obV1u+xWce7ockGlfhKelr6tPqmBlv4Rblo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/iX4nUl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/iX4nUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708761452; x=1740297452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YcIa3eIXHGNCMMhf5Hd6OV1BE453D3ARtfnzc9zDq+0=;
  b=U/iX4nUl/EzWfziBwmIBaKBYPkXN+wtfCsxjuRcjYF3yZe+2pw1QhiMh
   1W37wHa2NCkBkq+H0nfwE2YKf5SDvhSaJeAxkQUzpVCpbXeUyXPGhJ/tn
   RpffwACv0ywn9/EM0V0aTF6qz54q38mQ6Ba1NsYQHyB4NrnY5ixU7jAyr
   raRPkVHNbCuR6oSBvHSi1KWm9/XSsigbd8CMbsLT6RUoykaA8EVM84tpG
   UstsZlKC7qGQvRTKPCVDdGcjalsjldK2nBno1zafVx/XR/IoFpvajUxT1
   avDSQvQ8zDDhxTbgDt8YmJxzYV/Jyy3uh1ZHKTV0rVbiiUBNXJnhBEbSb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3013412"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3013412"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 23:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="43605348"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Feb 2024 23:57:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdmuV-0008M0-35;
	Sat, 24 Feb 2024 07:57:27 +0000
Date: Sat, 24 Feb 2024 15:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andreas Larsson <andreas@gaisler.com>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [alarsson-sparc:for-next 2/7] kismet: WARNING: unmet direct
 dependencies detected for FONT_SUN8x16 when selected by EARLYFB
Message-ID: <202402241539.epQT43nI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git for-next
head:   626db6ee8ee1edac206610db407114aa83b53fd3
commit: 0f1991949d9bd5cf6d4e1c490b7e9ba2d2d56d7f [2/7] sparc: Use shared font data
config: sparc64-kismet-CONFIG_FONT_SUN8x16-CONFIG_EARLYFB-0-0 (https://download.01.org/0day-ci/archive/20240224/202402241539.epQT43nI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240224/202402241539.epQT43nI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241539.epQT43nI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FONT_SUN8x16 when selected by EARLYFB
   
   WARNING: unmet direct dependencies detected for FONT_SUN8x16
     Depends on [n]: FONT_SUPPORT [=y] && (FRAMEBUFFER_CONSOLE [=n] && (FONTS [=n] || SPARC [=y]) || BOOTX_TEXT)
     Selected by [y]:
     - EARLYFB [=y] && SPARC64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
