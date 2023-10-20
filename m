Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4D2115
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 16:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJf21xJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697820444; x=1729356444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oajG0JzsZSR61vglkpHmyteZ0Ve9MhyoiYvBgBkLiGY=;
  b=cJf21xJ+alVfp71kbTWQnDfUJdvPQQmAm9I7rBasu9/O5PZfjkFTC/jl
   vRXWslN+26dIkHVC3e6mS6C5FajHygYR5z2WhaOPgjX+xCGL7nntJNBo0
   nk4w54knr2GkHm2btst/FPJ+RB9cKdB3aSElUPbqywCPVk0/HixCzkUnF
   VDGvFvgqoB9g/jfAwDhq95BGBUXnelyZPAYLFfmFYZoZCDHrVm59tPHin
   E5uvKiG6Fyvf0cTsFSlSRUXsxEHvBUfZ9iEsu7QVDN/Xr4g2bq+aLvteb
   ws5oD+H/N7b8tbK05eY41GUFE2EW4zCOfRC9L9oz41kF1VRDlMTEoCH7U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371603928"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="371603928"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 09:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="931054050"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="931054050"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Oct 2023 09:47:20 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtsec-0003n4-11;
	Fri, 20 Oct 2023 16:47:18 +0000
Date: Sat, 21 Oct 2023 00:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>, Jai Luthra <j-luthra@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 7945/13906] cdns-csi2rx.c:undefined reference to
 `phy_mipi_dphy_get_default_config_for_hsclk'
Message-ID: <202310210044.tVcimtJy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2030579113a1b1b5bfd7ff24c0852847836d8fd1
commit: a91d06f46bf725f97d2bf344294c54bc57686889 [7945/13906] media: cadence: csi2rx: Configure DPHY using link freq
config: arc-randconfig-s051-20230426 (https://download.01.org/0day-ci/archive/20231021/202310210044.tVcimtJy-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210044.tVcimtJy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210044.tVcimtJy-lkp@intel.com/

Note: the linux-next/master HEAD 2030579113a1b1b5bfd7ff24c0852847836d8fd1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arceb-elf-ld: drivers/media/platform/cadence/cdns-csi2rx.o: in function `csi2rx_configure_ext_dphy':
>> cdns-csi2rx.c:(.text+0x480): undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'
>> arceb-elf-ld: cdns-csi2rx.c:(.text+0x480): undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
