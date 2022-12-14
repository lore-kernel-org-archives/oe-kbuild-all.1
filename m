Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523E2A48E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Dec 2022 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671034393; x=1702570393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrWkykWnxBYf3ssbAE65vfy2okXM+9xqs8OzuzWhEW8=;
  b=N7xCc4qe/Cip6dQHQ2ewubs8x54QbfhoRBWnpG8jKFOkXNxMt8X5WUyt
   ASoSby7Kj+PrTosBtf4SKlKOBPYgKqYh/uygiJJGB7GTiGz15kX5qCH5Z
   TclukQUGcetPbMo3FvFc+PZcS2vU0pKDE/X8Ih2FTVde+7Z5g9s5gTwQL
   hjaCDDWsXaZYzF/tWG+/3z4n4r7QInAi6a2aMgNfu8rDxK30LXBRJABjD
   haa0yPhoOH8qBwNcUeSuBpsMSjFlwkBSHYpR+GQD+4IixkxC2sYdXru5/
   lF2CQJ2XaQd8esVqaLp9JAMm/f8R8/9ThnwO1QEZhqpsBNb5qyablKFsm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="301858564"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="301858564"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 08:13:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="649081212"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="649081212"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Dec 2022 08:13:11 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5UNb-0005by-0o;
	Wed, 14 Dec 2022 16:13:11 +0000
Date: Thu, 15 Dec 2022 00:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.2 123/172]
 drivers/gpu/drm/panel/Kconfig:2:error: recursive dependency detected!
Message-ID: <202212150016.Z3DXZOdm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.2
head:   9c766cd7157605954941a0ef23f586711e0401b9
commit: d75f3499c8d86677f401a3778e7f2ba81f94cac5 [123/172] Revert "drm/mipi-dbi: select CONFIG_DRM_KMS_HELPER"
config: powerpc-allmodconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=d75f3499c8d86677f401a3778e7f2ba81f94cac5
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-6.2
        git checkout d75f3499c8d86677f401a3778e7f2ba81f94cac5
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 ARCH=powerpc 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the arnd-playground/randconfig-6.2 HEAD 9c766cd7157605954941a0ef23f586711e0401b9 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/Kconfig:2:error: recursive dependency detected!
   drivers/gpu/drm/panel/Kconfig:2:	symbol DRM_PANEL is selected by DRM_PANEL_BRIDGE
   drivers/gpu/drm/bridge/Kconfig:8:	symbol DRM_PANEL_BRIDGE depends on DRM_KMS_HELPER
   drivers/gpu/drm/Kconfig:88:	symbol DRM_KMS_HELPER is selected by DRM_MIPI_DBI
   drivers/gpu/drm/Kconfig:31:	symbol DRM_MIPI_DBI is selected by DRM_PANEL_ILITEK_ILI9341
   drivers/gpu/drm/panel/Kconfig:165:	symbol DRM_PANEL_ILITEK_ILI9341 depends on DRM_PANEL
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +2 drivers/gpu/drm/panel/Kconfig

aead40ea0b53a0 Thierry Reding 2013-08-30 @2  config DRM_PANEL
aead40ea0b53a0 Thierry Reding 2013-08-30  3  	bool
aead40ea0b53a0 Thierry Reding 2013-08-30  4  	depends on DRM
aead40ea0b53a0 Thierry Reding 2013-08-30  5  	help
aead40ea0b53a0 Thierry Reding 2013-08-30  6  	  Panel registration and lookup framework.
280921de7241ee Thierry Reding 2013-08-30  7  

:::::: The code at line 2 was first introduced by commit
:::::: aead40ea0b53a0e28d34adf7bb923ecb2968c04a drm: Add panel support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
