Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E7B171B7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCsvk9ZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699016645; x=1730552645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+ecrcxyK2uAwnz4/Jm/KliNffBYkXKzULjnfKfP2OM=;
  b=fCsvk9ZDii5p72FgKrJQzyXglH4GPYsntBtaB+2FIg8/cBEA4v07CT8y
   WFxNiyluoejjIJhXDPXWsRjvG04Xra4V7WAS1dFWxUdtf/gBfZwZimvGY
   tYS7H4EmwdlGb+UA+hDIHgWPmtFzAq45kKwcoifwoYAvEcTlkqZk5Zc/r
   XfDGqse8qMHKUGWScGCYcbKwigWwJTuG6Jmb4xfoTkK07IWHBMRxUd2wd
   rVraMWIKpoCtgAkPldPlkMng0SML+wV2C/wL7Fu1zpRBBpjc0afTsYn7k
   UP8Er4Gcai1l4zszxfV7vPDL7WrQw/azo/6HqNjmHjlLn/mLizG0SCyPP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="373979189"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="373979189"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 06:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9716939"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 06:03:38 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qytpo-0002WY-1y;
	Fri, 03 Nov 2023 13:03:36 +0000
Date: Fri, 3 Nov 2023 21:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:vc4 27/33] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_HDMI_HELPER when selected by
 DRM_KMS_HELPER
Message-ID: <202311032033.XUY3Aqw6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vc4
head:   814eee0fb2a10f00039cef7db9679ae37117e486
commit: 0540ce5dd4512ae1a6570d92343bfd3ca218e8ae [27/33] drm/connector: hdmi: Add Infoframes generation
config: i386-kismet-CONFIG_DRM_DISPLAY_HDMI_HELPER-CONFIG_DRM_KMS_HELPER-0-0 (https://download.01.org/0day-ci/archive/20231103/202311032033.XUY3Aqw6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311032033.XUY3Aqw6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032033.XUY3Aqw6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER when selected by DRM_KMS_HELPER
   .config:5311:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
