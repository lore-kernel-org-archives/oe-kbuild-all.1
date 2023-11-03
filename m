Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E41F10E5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 00:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7b4TCPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698972383; x=1730508383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cl4oe/Q9LZvGatUAIMDSKVunONWgHZmzsNqLTrlOqhU=;
  b=A7b4TCPWSFCQeqI/T9mMyq5Wucb3qE3ZhimePT6aQytHM4ETwK9m1wVB
   yDrkDJpPg0KRVV/GppJ764vKog67KZiJCaxkMsVuD0040/kkF/fvjpuAO
   sQxrbMe+fCtHZOsZ8bo2qb50WZhH3ZXp7epX7IBRpIrINCITl6ZAsY9qX
   DzeUKLIQBlFy0yJrnY3lzea1mCMktVeqD3nf90LqgPpUEL+8AyFdy1Zlu
   rrAkJ9caqiMXxAX3xSZKTwM57g2ZSqkZR/9krZCyj7CJQHvKaBaWavT2Q
   u6immzqEsENkzVK+b0RMcUF53S+QaMx5CM+5qe7o1xUOy9gcdu81WV9qC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="369057685"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="369057685"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="934950085"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="934950085"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Nov 2023 17:46:20 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyiKI-00023m-2O;
	Fri, 03 Nov 2023 00:46:18 +0000
Date: Fri, 3 Nov 2023 08:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:vc4 27/33] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_HDMI_HELPER when selected by
 DRM_KMS_HELPER
Message-ID: <202311030859.qqf4IRRv-lkp@intel.com>
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
config: i386-kismet-CONFIG_DRM_DISPLAY_HDMI_HELPER-CONFIG_DRM_KMS_HELPER-0-0 (https://download.01.org/0day-ci/archive/20231103/202311030859.qqf4IRRv-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030859.qqf4IRRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030859.qqf4IRRv-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER when selected by DRM_KMS_HELPER
   .config:5267:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   .config:13219:warning: symbol value 'ONFIG_NR_CPUS_DEFAUL' invalid for NR_CPUS
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
