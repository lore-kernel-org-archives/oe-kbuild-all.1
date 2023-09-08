Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F77C4C7B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694174165; x=1725710165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8P6llo6IKeCSAWYVpkkmE33pX7ieXEvaL3OvCI3ZiQ=;
  b=nCm2oJQQHJhG89HtOfQQa4NFENM/M+2flCwDCfv7bGfH5zMQ8CWehi1v
   ZXsfGFKTMfSvDA5d7l++HRHl7XdNM8Uo0EdZvGp8EwYwfQ/tIV5IAHz+J
   1GdUqVurATaKpxKGo8R2WyXfOwUDky/3KTSuBBmOeyTntz7EEIax40E3H
   XqBMyt8VDwq4Kh2kXaYm3QK0vek2pFZMr0olZrERGH2eV7U8o22RIdIpo
   PglIm0lYOWyGr0b/gY9+I2poQh0ghJlZ8zrYA6a5f+Boacn6KgSKgoubr
   /HGvuQBezliXQajzDQEdAAt2+BFP9K4ZGv/3WVzTkvqxZ11wVIhE/uQdg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="444066781"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="444066781"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 04:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="812544419"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="812544419"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Sep 2023 04:56:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qea5h-0002E3-08;
	Fri, 08 Sep 2023 11:56:01 +0000
Date: Fri, 8 Sep 2023 19:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 18/18]
 drivers/gpu/drm/drm_fbdev_generic.c:219:36: warning: assignment to 'char *'
 from 'int' makes pointer from integer without a cast
Message-ID: <202309081948.i2Sa7vdH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brandon,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   b151ce2fd12edbdc60b1f0faf99d587a555ebd34
commit: b12316c4c5d323fad5e687dc992bf1809a882053 [18/18] BACKPORT: drm/fb-helper: Move generic fbdev emulation into separate source file
config: mips-randconfig-r024-20230908 (https://download.01.org/0day-ci/archive/20230908/202309081948.i2Sa7vdH-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081948.i2Sa7vdH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081948.i2Sa7vdH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_fbdev_generic.c: In function 'drm_fbdev_cleanup':
   drivers/gpu/drm/drm_fbdev_generic.c:63:17: error: implicit declaration of function 'vfree'; did you mean 'kfree'? [-Werror=implicit-function-declaration]
      63 |                 vfree(shadow);
         |                 ^~~~~
         |                 kfree
   drivers/gpu/drm/drm_fbdev_generic.c: In function 'drm_fbdev_fb_probe':
   drivers/gpu/drm/drm_fbdev_generic.c:219:38: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
     219 |                 fbi->screen_buffer = vzalloc(fbi->screen_size);
         |                                      ^~~~~~~
         |                                      kvzalloc
>> drivers/gpu/drm/drm_fbdev_generic.c:219:36: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     219 |                 fbi->screen_buffer = vzalloc(fbi->screen_size);
         |                                    ^
   cc1: some warnings being treated as errors


vim +219 drivers/gpu/drm/drm_fbdev_generic.c

b12316c4c5d323 Brandon Pollack   2022-11-03  177  
5aef5496301440 Thomas Zimmermann 2022-11-03  178  /*
5aef5496301440 Thomas Zimmermann 2022-11-03  179   * This function uses the client API to create a framebuffer backed by a dumb buffer.
5aef5496301440 Thomas Zimmermann 2022-11-03  180   */
5aef5496301440 Thomas Zimmermann 2022-11-03  181  static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
5aef5496301440 Thomas Zimmermann 2022-11-03  182  			      struct drm_fb_helper_surface_size *sizes)
5aef5496301440 Thomas Zimmermann 2022-11-03  183  {
5aef5496301440 Thomas Zimmermann 2022-11-03  184  	struct drm_client_dev *client = &fb_helper->client;
5aef5496301440 Thomas Zimmermann 2022-11-03  185  	struct drm_device *dev = fb_helper->dev;
5aef5496301440 Thomas Zimmermann 2022-11-03  186  	struct drm_client_buffer *buffer;
5aef5496301440 Thomas Zimmermann 2022-11-03  187  	struct drm_framebuffer *fb;
5aef5496301440 Thomas Zimmermann 2022-11-03  188  	struct fb_info *fbi;
5aef5496301440 Thomas Zimmermann 2022-11-03  189  	u32 format;
5aef5496301440 Thomas Zimmermann 2022-11-03  190  	struct iosys_map map;
5aef5496301440 Thomas Zimmermann 2022-11-03  191  	int ret;
5aef5496301440 Thomas Zimmermann 2022-11-03  192  
5aef5496301440 Thomas Zimmermann 2022-11-03  193  	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
5aef5496301440 Thomas Zimmermann 2022-11-03  194  		    sizes->surface_width, sizes->surface_height,
5aef5496301440 Thomas Zimmermann 2022-11-03  195  		    sizes->surface_bpp);
5aef5496301440 Thomas Zimmermann 2022-11-03  196  
5aef5496301440 Thomas Zimmermann 2022-11-03  197  	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
5aef5496301440 Thomas Zimmermann 2022-11-03  198  	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
5aef5496301440 Thomas Zimmermann 2022-11-03  199  					       sizes->surface_height, format);
5aef5496301440 Thomas Zimmermann 2022-11-03  200  	if (IS_ERR(buffer))
5aef5496301440 Thomas Zimmermann 2022-11-03  201  		return PTR_ERR(buffer);
5aef5496301440 Thomas Zimmermann 2022-11-03  202  
5aef5496301440 Thomas Zimmermann 2022-11-03  203  	fb_helper->buffer = buffer;
5aef5496301440 Thomas Zimmermann 2022-11-03  204  	fb_helper->fb = buffer->fb;
5aef5496301440 Thomas Zimmermann 2022-11-03  205  	fb = buffer->fb;
5aef5496301440 Thomas Zimmermann 2022-11-03  206  
5aef5496301440 Thomas Zimmermann 2022-11-03  207  	fbi = drm_fb_helper_alloc_info(fb_helper);
5aef5496301440 Thomas Zimmermann 2022-11-03  208  	if (IS_ERR(fbi))
5aef5496301440 Thomas Zimmermann 2022-11-03  209  		return PTR_ERR(fbi);
5aef5496301440 Thomas Zimmermann 2022-11-03  210  
5aef5496301440 Thomas Zimmermann 2022-11-03  211  	fbi->fbops = &drm_fbdev_fb_ops;
5aef5496301440 Thomas Zimmermann 2022-11-03  212  	fbi->screen_size = sizes->surface_height * fb->pitches[0];
5aef5496301440 Thomas Zimmermann 2022-11-03  213  	fbi->fix.smem_len = fbi->screen_size;
5aef5496301440 Thomas Zimmermann 2022-11-03  214  	fbi->flags = FBINFO_DEFAULT;
5aef5496301440 Thomas Zimmermann 2022-11-03  215  
5aef5496301440 Thomas Zimmermann 2022-11-03  216  	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
5aef5496301440 Thomas Zimmermann 2022-11-03  217  
5aef5496301440 Thomas Zimmermann 2022-11-03  218  	if (drm_fbdev_use_shadow_fb(fb_helper)) {
5aef5496301440 Thomas Zimmermann 2022-11-03 @219  		fbi->screen_buffer = vzalloc(fbi->screen_size);
5aef5496301440 Thomas Zimmermann 2022-11-03  220  		if (!fbi->screen_buffer)
5aef5496301440 Thomas Zimmermann 2022-11-03  221  			return -ENOMEM;
5aef5496301440 Thomas Zimmermann 2022-11-03  222  		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
5aef5496301440 Thomas Zimmermann 2022-11-03  223  
b12316c4c5d323 Brandon Pollack   2022-11-03  224  		fbi->fbdefio = &drm_fbdev_defio;
b12316c4c5d323 Brandon Pollack   2022-11-03  225  		fb_deferred_io_init(fbi);
5aef5496301440 Thomas Zimmermann 2022-11-03  226  	} else {
5aef5496301440 Thomas Zimmermann 2022-11-03  227  		/* buffer is mapped for HW framebuffer */
5aef5496301440 Thomas Zimmermann 2022-11-03  228  		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
5aef5496301440 Thomas Zimmermann 2022-11-03  229  		if (ret)
5aef5496301440 Thomas Zimmermann 2022-11-03  230  			return ret;
5aef5496301440 Thomas Zimmermann 2022-11-03  231  		if (map.is_iomem) {
5aef5496301440 Thomas Zimmermann 2022-11-03  232  			fbi->screen_base = map.vaddr_iomem;
5aef5496301440 Thomas Zimmermann 2022-11-03  233  		} else {
5aef5496301440 Thomas Zimmermann 2022-11-03  234  			fbi->screen_buffer = map.vaddr;
5aef5496301440 Thomas Zimmermann 2022-11-03  235  			fbi->flags |= FBINFO_VIRTFB;
5aef5496301440 Thomas Zimmermann 2022-11-03  236  		}
5aef5496301440 Thomas Zimmermann 2022-11-03  237  
5aef5496301440 Thomas Zimmermann 2022-11-03  238  		/*
5aef5496301440 Thomas Zimmermann 2022-11-03  239  		 * Shamelessly leak the physical address to user-space. As
5aef5496301440 Thomas Zimmermann 2022-11-03  240  		 * page_to_phys() is undefined for I/O memory, warn in this
5aef5496301440 Thomas Zimmermann 2022-11-03  241  		 * case.
5aef5496301440 Thomas Zimmermann 2022-11-03  242  		 */
5aef5496301440 Thomas Zimmermann 2022-11-03  243  #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
5aef5496301440 Thomas Zimmermann 2022-11-03  244  		if (fb_helper->hint_leak_smem_start && fbi->fix.smem_start == 0 &&
5aef5496301440 Thomas Zimmermann 2022-11-03  245  		    !drm_WARN_ON_ONCE(dev, map.is_iomem))
5aef5496301440 Thomas Zimmermann 2022-11-03  246  			fbi->fix.smem_start =
5aef5496301440 Thomas Zimmermann 2022-11-03  247  				page_to_phys(virt_to_page(fbi->screen_buffer));
5aef5496301440 Thomas Zimmermann 2022-11-03  248  #endif
5aef5496301440 Thomas Zimmermann 2022-11-03  249  	}
5aef5496301440 Thomas Zimmermann 2022-11-03  250  
5aef5496301440 Thomas Zimmermann 2022-11-03  251  	return 0;
5aef5496301440 Thomas Zimmermann 2022-11-03  252  }
5aef5496301440 Thomas Zimmermann 2022-11-03  253  

:::::: The code at line 219 was first introduced by commit
:::::: 5aef5496301440ea6fbe76c77a7e17d6ce3aad77 UPSTREAM: drm/fb-helper: Move generic fbdev emulation into separate source file

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Drew Davenport <ddavenport@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
