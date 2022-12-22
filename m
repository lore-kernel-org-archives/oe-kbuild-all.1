Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746EC23AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Dec 2022 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671696146; x=1703232146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ccGCwG2uCf5QUSamSIy4oRsMH+rwlZ8XF/jieXVJ4k=;
  b=CkfOSX53eYUfk+5ug5pSvmltBPYcJZzrWV218t7gPqz5rr4K1kLba+6M
   DDzA6kCwtrlPhD5KN5SwQE3kU8IJicMX6ervwj8HcOcCqW05MB/lICh8p
   syfgmTNu0VY8VLgsn8PXkll7qItm7YowizsbNkp5t3Y8In2GnoEnEz9gC
   OziiT0eY46p5Kifge7bf45aMRw3z1S/ulPBE4zrlLAIk36CNgdttNOHg8
   6sBFsWG5MX2+yg4lIwUhNn+paEl0z8TeV+5pRZi53rNE87wFKAXf2oI5M
   i9wsdompiopzVwwDwEFtnilHvHwKos0/qJ0gIboQZkdjlqoBlvtWOV3qd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="303502044"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="303502044"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 00:02:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="645120696"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="645120696"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Dec 2022 00:02:09 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8GWm-000BNm-2i;
	Thu, 22 Dec 2022 08:02:08 +0000
Date: Thu, 22 Dec 2022 16:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.2 123/172]
 drivers/gpu/drm/Kconfig:88:error: recursive dependency detected!
Message-ID: <202212221542.rqoFxR53-lkp@intel.com>
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
config: x86_64-rhel-8.3-func (attached as .config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=d75f3499c8d86677f401a3778e7f2ba81f94cac5
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-6.2
        git checkout d75f3499c8d86677f401a3778e7f2ba81f94cac5
        # save the config file
        make W=1 ARCH=x86_64 olddefconfig
        make W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the arnd-playground/randconfig-6.2 HEAD 9c766cd7157605954941a0ef23f586711e0401b9 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/Kconfig:88:error: recursive dependency detected!
   drivers/gpu/drm/Kconfig:88:	symbol DRM_KMS_HELPER is selected by DRM_MIPI_DBI
   drivers/gpu/drm/Kconfig:31:	symbol DRM_MIPI_DBI is selected by DRM_PANEL_ILITEK_ILI9341
   drivers/gpu/drm/panel/Kconfig:165:	symbol DRM_PANEL_ILITEK_ILI9341 depends on DRM_PANEL
   drivers/gpu/drm/panel/Kconfig:2:	symbol DRM_PANEL is selected by DRM_PANEL_BRIDGE
   drivers/gpu/drm/bridge/Kconfig:8:	symbol DRM_PANEL_BRIDGE depends on DRM_KMS_HELPER
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +88 drivers/gpu/drm/Kconfig

6fcefd56f5060c Dave Airlie   2009-09-08 @88  config DRM_KMS_HELPER
13a8195b148615 Dave Airlie   2009-09-07  89  	tristate
13a8195b148615 Dave Airlie   2009-09-07  90  	depends on DRM
92b6f89f6b85f4 Daniel Vetter 2013-10-08  91  	help
92b6f89f6b85f4 Daniel Vetter 2013-10-08  92  	  CRTC helpers for KMS drivers.
92b6f89f6b85f4 Daniel Vetter 2013-10-08  93  

:::::: The code at line 88 was first introduced by commit
:::::: 6fcefd56f5060ca99ab03c9f2ad1f17c3a543ca1 drm/kms: fix kms helper license + Kconfig

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
