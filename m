Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEA815B6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694191938; x=1725727938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8rc1Bc3v7gIirMU/oazxsTpNWnCzPgf3/VK1ph+xch4=;
  b=N0Ntnl/bIM9mnOnOY2Mj4VxhmjR5sjsr1rUCD744FKqSssgV1h69AU1t
   pEuOgCLliV7G2HTaJp7MhHM4UhTLIvMv/w8kgzrVMO7Jn89vnyz/jdjod
   yE4ji2drDWKuF38Fha3iOI6jL2+4qW3RV7OPuv7imSQ4bivfOa2EXt/ed
   9MjfD3F971KxP/UU3CDRC2122Ayuio2xlHdTx5hqUH3+6AdZVWIvFkanU
   TvgaaAXjgq5jM9y5eWPjrLFsowsAbZ9Fd1qQDRU2wnLiT7XSNJY7uldT7
   qk5YXKDMSxGf3uiGl0qfcWI3RPxb2D7+MX/zd8cN4YOG1WCGMVRRe+MHy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377603352"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="377603352"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 09:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="832720674"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="832720674"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2023 09:52:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeeiL-0002T5-15;
	Fri, 08 Sep 2023 16:52:13 +0000
Date: Sat, 9 Sep 2023 00:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 18/18]
 drivers/gpu/drm/drm_fbdev_generic.c:63:17: error: implicit declaration of
 function 'vfree'; did you mean 'kfree'?
Message-ID: <202309090006.5lw5OBMC-lkp@intel.com>
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
head:   67af1c064b45475c568f5bb42c0c0c180ab6cca1
commit: b12316c4c5d323fad5e687dc992bf1809a882053 [18/18] BACKPORT: drm/fb-helper: Move generic fbdev emulation into separate source file
config: mips-randconfig-r024-20230908 (https://download.01.org/0day-ci/archive/20230909/202309090006.5lw5OBMC-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090006.5lw5OBMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090006.5lw5OBMC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_fbdev_generic.c: In function 'drm_fbdev_cleanup':
>> drivers/gpu/drm/drm_fbdev_generic.c:63:17: error: implicit declaration of function 'vfree'; did you mean 'kfree'? [-Werror=implicit-function-declaration]
      63 |                 vfree(shadow);
         |                 ^~~~~
         |                 kfree
   drivers/gpu/drm/drm_fbdev_generic.c: In function 'drm_fbdev_fb_probe':
>> drivers/gpu/drm/drm_fbdev_generic.c:219:38: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
     219 |                 fbi->screen_buffer = vzalloc(fbi->screen_size);
         |                                      ^~~~~~~
         |                                      kvzalloc
   drivers/gpu/drm/drm_fbdev_generic.c:219:36: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     219 |                 fbi->screen_buffer = vzalloc(fbi->screen_size);
         |                                    ^
   cc1: some warnings being treated as errors


vim +63 drivers/gpu/drm/drm_fbdev_generic.c

5aef5496301440 Thomas Zimmermann 2022-11-03   44  
5aef5496301440 Thomas Zimmermann 2022-11-03   45  static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
5aef5496301440 Thomas Zimmermann 2022-11-03   46  {
5aef5496301440 Thomas Zimmermann 2022-11-03   47  	struct fb_info *fbi = fb_helper->info;
5aef5496301440 Thomas Zimmermann 2022-11-03   48  	void *shadow = NULL;
5aef5496301440 Thomas Zimmermann 2022-11-03   49  
5aef5496301440 Thomas Zimmermann 2022-11-03   50  	if (!fb_helper->dev)
5aef5496301440 Thomas Zimmermann 2022-11-03   51  		return;
5aef5496301440 Thomas Zimmermann 2022-11-03   52  
5aef5496301440 Thomas Zimmermann 2022-11-03   53  	if (fbi) {
5aef5496301440 Thomas Zimmermann 2022-11-03   54  		if (fbi->fbdefio)
5aef5496301440 Thomas Zimmermann 2022-11-03   55  			fb_deferred_io_cleanup(fbi);
5aef5496301440 Thomas Zimmermann 2022-11-03   56  		if (drm_fbdev_use_shadow_fb(fb_helper))
5aef5496301440 Thomas Zimmermann 2022-11-03   57  			shadow = fbi->screen_buffer;
5aef5496301440 Thomas Zimmermann 2022-11-03   58  	}
5aef5496301440 Thomas Zimmermann 2022-11-03   59  
5aef5496301440 Thomas Zimmermann 2022-11-03   60  	drm_fb_helper_fini(fb_helper);
5aef5496301440 Thomas Zimmermann 2022-11-03   61  
5aef5496301440 Thomas Zimmermann 2022-11-03   62  	if (shadow)
5aef5496301440 Thomas Zimmermann 2022-11-03  @63  		vfree(shadow);
5aef5496301440 Thomas Zimmermann 2022-11-03   64  	else if (fb_helper->buffer)
5aef5496301440 Thomas Zimmermann 2022-11-03   65  		drm_client_buffer_vunmap(fb_helper->buffer);
5aef5496301440 Thomas Zimmermann 2022-11-03   66  
5aef5496301440 Thomas Zimmermann 2022-11-03   67  	drm_client_framebuffer_delete(fb_helper->buffer);
5aef5496301440 Thomas Zimmermann 2022-11-03   68  }
5aef5496301440 Thomas Zimmermann 2022-11-03   69  
5aef5496301440 Thomas Zimmermann 2022-11-03   70  static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
5aef5496301440 Thomas Zimmermann 2022-11-03   71  {
5aef5496301440 Thomas Zimmermann 2022-11-03   72  	drm_fbdev_cleanup(fb_helper);
5aef5496301440 Thomas Zimmermann 2022-11-03   73  	drm_client_release(&fb_helper->client);
5aef5496301440 Thomas Zimmermann 2022-11-03   74  	kfree(fb_helper);
5aef5496301440 Thomas Zimmermann 2022-11-03   75  }
5aef5496301440 Thomas Zimmermann 2022-11-03   76  
5aef5496301440 Thomas Zimmermann 2022-11-03   77  /*
5aef5496301440 Thomas Zimmermann 2022-11-03   78   * fb_ops.fb_destroy is called by the last put_fb_info() call at the end of
5aef5496301440 Thomas Zimmermann 2022-11-03   79   * unregister_framebuffer() or fb_release().
5aef5496301440 Thomas Zimmermann 2022-11-03   80   */
5aef5496301440 Thomas Zimmermann 2022-11-03   81  static void drm_fbdev_fb_destroy(struct fb_info *info)
5aef5496301440 Thomas Zimmermann 2022-11-03   82  {
5aef5496301440 Thomas Zimmermann 2022-11-03   83  	drm_fbdev_release(info->par);
5aef5496301440 Thomas Zimmermann 2022-11-03   84  }
5aef5496301440 Thomas Zimmermann 2022-11-03   85  
5aef5496301440 Thomas Zimmermann 2022-11-03   86  static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
5aef5496301440 Thomas Zimmermann 2022-11-03   87  {
5aef5496301440 Thomas Zimmermann 2022-11-03   88  	struct drm_fb_helper *fb_helper = info->par;
5aef5496301440 Thomas Zimmermann 2022-11-03   89  
5aef5496301440 Thomas Zimmermann 2022-11-03   90  	if (drm_fbdev_use_shadow_fb(fb_helper))
5aef5496301440 Thomas Zimmermann 2022-11-03   91  		return fb_deferred_io_mmap(info, vma);
5aef5496301440 Thomas Zimmermann 2022-11-03   92  	else if (fb_helper->dev->driver->gem_prime_mmap)
5aef5496301440 Thomas Zimmermann 2022-11-03   93  		return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
5aef5496301440 Thomas Zimmermann 2022-11-03   94  	else
5aef5496301440 Thomas Zimmermann 2022-11-03   95  		return -ENODEV;
5aef5496301440 Thomas Zimmermann 2022-11-03   96  }
5aef5496301440 Thomas Zimmermann 2022-11-03   97  
5aef5496301440 Thomas Zimmermann 2022-11-03   98  static bool drm_fbdev_use_iomem(struct fb_info *info)
5aef5496301440 Thomas Zimmermann 2022-11-03   99  {
5aef5496301440 Thomas Zimmermann 2022-11-03  100  	struct drm_fb_helper *fb_helper = info->par;
5aef5496301440 Thomas Zimmermann 2022-11-03  101  	struct drm_client_buffer *buffer = fb_helper->buffer;
5aef5496301440 Thomas Zimmermann 2022-11-03  102  
5aef5496301440 Thomas Zimmermann 2022-11-03  103  	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
5aef5496301440 Thomas Zimmermann 2022-11-03  104  }
5aef5496301440 Thomas Zimmermann 2022-11-03  105  
5aef5496301440 Thomas Zimmermann 2022-11-03  106  static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
5aef5496301440 Thomas Zimmermann 2022-11-03  107  				 size_t count, loff_t *ppos)
5aef5496301440 Thomas Zimmermann 2022-11-03  108  {
5aef5496301440 Thomas Zimmermann 2022-11-03  109  	ssize_t ret;
5aef5496301440 Thomas Zimmermann 2022-11-03  110  
5aef5496301440 Thomas Zimmermann 2022-11-03  111  	if (drm_fbdev_use_iomem(info))
5aef5496301440 Thomas Zimmermann 2022-11-03  112  		ret = drm_fb_helper_cfb_read(info, buf, count, ppos);
5aef5496301440 Thomas Zimmermann 2022-11-03  113  	else
5aef5496301440 Thomas Zimmermann 2022-11-03  114  		ret = drm_fb_helper_sys_read(info, buf, count, ppos);
5aef5496301440 Thomas Zimmermann 2022-11-03  115  
5aef5496301440 Thomas Zimmermann 2022-11-03  116  	return ret;
5aef5496301440 Thomas Zimmermann 2022-11-03  117  }
5aef5496301440 Thomas Zimmermann 2022-11-03  118  
5aef5496301440 Thomas Zimmermann 2022-11-03  119  static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
5aef5496301440 Thomas Zimmermann 2022-11-03  120  				  size_t count, loff_t *ppos)
5aef5496301440 Thomas Zimmermann 2022-11-03  121  {
5aef5496301440 Thomas Zimmermann 2022-11-03  122  	ssize_t ret;
5aef5496301440 Thomas Zimmermann 2022-11-03  123  
5aef5496301440 Thomas Zimmermann 2022-11-03  124  	if (drm_fbdev_use_iomem(info))
5aef5496301440 Thomas Zimmermann 2022-11-03  125  		ret = drm_fb_helper_cfb_write(info, buf, count, ppos);
5aef5496301440 Thomas Zimmermann 2022-11-03  126  	else
5aef5496301440 Thomas Zimmermann 2022-11-03  127  		ret = drm_fb_helper_sys_write(info, buf, count, ppos);
5aef5496301440 Thomas Zimmermann 2022-11-03  128  
5aef5496301440 Thomas Zimmermann 2022-11-03  129  	return ret;
5aef5496301440 Thomas Zimmermann 2022-11-03  130  }
5aef5496301440 Thomas Zimmermann 2022-11-03  131  
5aef5496301440 Thomas Zimmermann 2022-11-03  132  static void drm_fbdev_fb_fillrect(struct fb_info *info,
5aef5496301440 Thomas Zimmermann 2022-11-03  133  				  const struct fb_fillrect *rect)
5aef5496301440 Thomas Zimmermann 2022-11-03  134  {
5aef5496301440 Thomas Zimmermann 2022-11-03  135  	if (drm_fbdev_use_iomem(info))
5aef5496301440 Thomas Zimmermann 2022-11-03  136  		drm_fb_helper_cfb_fillrect(info, rect);
5aef5496301440 Thomas Zimmermann 2022-11-03  137  	else
5aef5496301440 Thomas Zimmermann 2022-11-03  138  		drm_fb_helper_sys_fillrect(info, rect);
5aef5496301440 Thomas Zimmermann 2022-11-03  139  }
5aef5496301440 Thomas Zimmermann 2022-11-03  140  
5aef5496301440 Thomas Zimmermann 2022-11-03  141  static void drm_fbdev_fb_copyarea(struct fb_info *info,
5aef5496301440 Thomas Zimmermann 2022-11-03  142  				  const struct fb_copyarea *area)
5aef5496301440 Thomas Zimmermann 2022-11-03  143  {
5aef5496301440 Thomas Zimmermann 2022-11-03  144  	if (drm_fbdev_use_iomem(info))
5aef5496301440 Thomas Zimmermann 2022-11-03  145  		drm_fb_helper_cfb_copyarea(info, area);
5aef5496301440 Thomas Zimmermann 2022-11-03  146  	else
5aef5496301440 Thomas Zimmermann 2022-11-03  147  		drm_fb_helper_sys_copyarea(info, area);
5aef5496301440 Thomas Zimmermann 2022-11-03  148  }
5aef5496301440 Thomas Zimmermann 2022-11-03  149  
5aef5496301440 Thomas Zimmermann 2022-11-03  150  static void drm_fbdev_fb_imageblit(struct fb_info *info,
5aef5496301440 Thomas Zimmermann 2022-11-03  151  				   const struct fb_image *image)
5aef5496301440 Thomas Zimmermann 2022-11-03  152  {
5aef5496301440 Thomas Zimmermann 2022-11-03  153  	if (drm_fbdev_use_iomem(info))
5aef5496301440 Thomas Zimmermann 2022-11-03  154  		drm_fb_helper_cfb_imageblit(info, image);
5aef5496301440 Thomas Zimmermann 2022-11-03  155  	else
5aef5496301440 Thomas Zimmermann 2022-11-03  156  		drm_fb_helper_sys_imageblit(info, image);
5aef5496301440 Thomas Zimmermann 2022-11-03  157  }
5aef5496301440 Thomas Zimmermann 2022-11-03  158  
5aef5496301440 Thomas Zimmermann 2022-11-03  159  static const struct fb_ops drm_fbdev_fb_ops = {
5aef5496301440 Thomas Zimmermann 2022-11-03  160  	.owner		= THIS_MODULE,
5aef5496301440 Thomas Zimmermann 2022-11-03  161  	DRM_FB_HELPER_DEFAULT_OPS,
5aef5496301440 Thomas Zimmermann 2022-11-03  162  	.fb_open	= drm_fbdev_fb_open,
5aef5496301440 Thomas Zimmermann 2022-11-03  163  	.fb_release	= drm_fbdev_fb_release,
5aef5496301440 Thomas Zimmermann 2022-11-03  164  	.fb_destroy	= drm_fbdev_fb_destroy,
5aef5496301440 Thomas Zimmermann 2022-11-03  165  	.fb_mmap	= drm_fbdev_fb_mmap,
5aef5496301440 Thomas Zimmermann 2022-11-03  166  	.fb_read	= drm_fbdev_fb_read,
5aef5496301440 Thomas Zimmermann 2022-11-03  167  	.fb_write	= drm_fbdev_fb_write,
5aef5496301440 Thomas Zimmermann 2022-11-03  168  	.fb_fillrect	= drm_fbdev_fb_fillrect,
5aef5496301440 Thomas Zimmermann 2022-11-03  169  	.fb_copyarea	= drm_fbdev_fb_copyarea,
5aef5496301440 Thomas Zimmermann 2022-11-03  170  	.fb_imageblit	= drm_fbdev_fb_imageblit,
5aef5496301440 Thomas Zimmermann 2022-11-03  171  };
5aef5496301440 Thomas Zimmermann 2022-11-03  172  
b12316c4c5d323 Brandon Pollack   2022-11-03  173  static struct fb_deferred_io drm_fbdev_defio = {
b12316c4c5d323 Brandon Pollack   2022-11-03  174  	.delay		= HZ / 20,
b12316c4c5d323 Brandon Pollack   2022-11-03  175  	.deferred_io	= drm_fb_helper_deferred_io,
b12316c4c5d323 Brandon Pollack   2022-11-03  176  };
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

:::::: The code at line 63 was first introduced by commit
:::::: 5aef5496301440ea6fbe76c77a7e17d6ce3aad77 UPSTREAM: drm/fb-helper: Move generic fbdev emulation into separate source file

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Drew Davenport <ddavenport@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
