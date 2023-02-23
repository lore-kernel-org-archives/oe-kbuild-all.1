Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1F77E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677180199; x=1708716199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TcSKtnSmpVPLRb9cnLenktQFNSwR+Zw81nlzKZOXx9g=;
  b=f3C9YSFmiVskiVt+I0vV5pCQCZjcEujJRJRo/lmyYbyDGRsSVDsMqXj0
   A/nG7YHhPToneP7XkTbk8Hh9fHALSEsIivMgFeEBQ2MpBUY/vEU5GhDzY
   ePml/iF2lSAivPtTTi7rkYWZPpo+a/R/R3VE9l32RiRpiL1hUGl/Yx11L
   5BOuvmD1D0wj2z20Q2Lx9gqp2ZfO2fPoqc63e75JaMMpLuoR8pWkwuFSg
   yGMc7M69NKsCO9ADvKvz1PnaH3mDg3BBLVgsda7wjNllDhH6VdryQa+BB
   x13T39Lts+x87Wxf3eOx90hcS56SMGiF5wge8YSJmHWlGupjKR5cyqKXE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="333310093"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="333310093"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 11:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782027210"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="782027210"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2023 11:23:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVHBT-0001fP-2e;
	Thu, 23 Feb 2023 19:23:15 +0000
Date: Fri, 24 Feb 2023 03:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, patrik.r.jakobsson@gmail.com,
	airlied@gmail.com, daniel@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
Message-ID: <202302240327.EvR0Gx5N-lkp@intel.com>
References: <20230223121733.12549-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223121733.12549-7-tzimmermann@suse.de>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to drm-misc/drm-misc-next v6.2 v6.2-rc8 v6.2-rc7 next-20230223 v6.2 next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-gma500-Remove-unnecessary-include-statements/20230223-202205
patch link:    https://lore.kernel.org/r/20230223121733.12549-7-tzimmermann%40suse.de
patch subject: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230224/202302240327.EvR0Gx5N-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d1c984af29e0c5219d353a4772527d233d1c1bcc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-gma500-Remove-unnecessary-include-statements/20230223-202205
        git checkout d1c984af29e0c5219d353a4772527d233d1c1bcc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240327.EvR0Gx5N-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   ld: drivers/gpu/drm/gma500/cdv_device.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_crt.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_display.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_dp.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_hdmi.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_lvds.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/framebuffer.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/framebuffer.c:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/gem.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/gma_device.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/gma_device.c:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/gma_display.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/gtt.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/intel_bios.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/intel_gmbus.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/intel_i2c.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/mid_bios.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/mmu.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_device.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_crtc.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_hdmi.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_lvds.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_lvds_i2c.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/power.o: in function `psb_fbdev_setup':
   power.c:(.text+0x40): multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_device.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_drv.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_intel_display.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_intel_lvds.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_intel_sdvo.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_lid.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_irq.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/opregion.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
--
   In file included from drivers/gpu/drm/gma500/backlight.c:14:
>> drivers/gpu/drm/gma500/psb_drv.h:620:6: warning: no previous prototype for 'psb_fbdev_setup' [-Wmissing-prototypes]
     620 | void psb_fbdev_setup(struct drm_psb_private *dev_priv)
         |      ^~~~~~~~~~~~~~~


vim +621 drivers/gpu/drm/gma500/psb_drv.h

b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  610  
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  611  /* framebuffer */
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  612  extern struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  613  						      const struct drm_mode_fb_cmd2 *mode_cmd,
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  614  						      struct drm_gem_object *obj);
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  615  
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  616  /* fbdev */
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  617  #if defined(CONFIG_DRM_FBDEV_EMULATION)
d1c984af29e0c5 Thomas Zimmermann 2023-02-23  618  void psb_fbdev_setup(struct drm_psb_private *dev_priv);
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  619  #else
d1c984af29e0c5 Thomas Zimmermann 2023-02-23 @620  void psb_fbdev_setup(struct drm_psb_private *dev_priv)
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23 @621  { }
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  622  #endif
5c49fd3aa0ab02 Alan Cox          2011-11-03  623  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
