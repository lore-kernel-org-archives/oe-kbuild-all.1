Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B925948B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 19:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734031989; cv=none; b=h4h7Kx+wOF9JUGyX08h20q14j9llYS38jgiyGM6rs5TWE4mgtyKzeK3cnv7f0+1BLcpFV0j4Y3lVwaz3UEphrTXDrxcBegSYYE6QZDY3bk/s8IApKIljM1OvYLSROveJzG594kyHuGyj7whH0ffw9CwV+EwnfUfwcIt++ndXc/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734031989; c=relaxed/simple;
	bh=EBdv2AbRMBO/htRiyVW1hw7JU9+S5qYEZXy/9jajwHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WshaQRD8lpOHxx7eA5KgdnoZdSvCI0JuBx038VmdUTuxK2QOwmDXWMWzQWM+CSKMwJ+/htgDM2WpTPYmQ1On4AeZ/fYkvvmG5CKgGtSNmFOT+QXIF3cDYDUcIc51HlvM6Tf6wI4kia1FCbQIASF0ubxJ2Iu02PmYS7xkRemyIMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnrOrWV6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnrOrWV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734031987; x=1765567987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBdv2AbRMBO/htRiyVW1hw7JU9+S5qYEZXy/9jajwHs=;
  b=DnrOrWV6pewp2UFwceFX9ueyCmx5LWGow6Cyk4Qdq+g0orjOck0/EMb3
   vvtXkXt6dGlzGXwYsVgm3AyZ7qcoavQx5h1Tf5TqJcD5Zk1v2cSnwcIl3
   uWxU5Gq6kbkE6+BaabdkfuFALAVctFL6V3MwhrV+FydzlFePfe8dxicgC
   NLrQHsu8PL5mUluYHfbbYZOdwwRLfe3gxTcJ3SVN38+eQbzbAMjfFK/2g
   WBtWKChLZ0h6fUnC4fb0SwYBMdG3fLuyTM487BTE/oifs9eRAcKrNs4T/
   tw7rfVmshXOsHgYO3Gm2tOTsseWhx75Y1zZrw/gqN0+G6BTZHgjCj7xkW
   g==;
X-CSE-ConnectionGUID: rFpYVI3CS9m53/oFm0CDZA==
X-CSE-MsgGUID: unDfJ8uCQKqQRJ0fZwDzZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="33777008"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="33777008"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 11:33:07 -0800
X-CSE-ConnectionGUID: b9KWaiuTSniUmtymwIfTXw==
X-CSE-MsgGUID: lekvmJF6Ti6V1i+PCd2FVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96560884"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Dec 2024 11:33:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLovn-000BFh-1t;
	Thu, 12 Dec 2024 19:33:03 +0000
Date: Fri, 13 Dec 2024 03:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 2469/3502] drivers/gpu/drm/drm_fbdev_shmem.c:62:
 undefined reference to `drm_fb_helper_fini'
Message-ID: <202412130338.eqJd2r3M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3e42dc9229c5950e84b1ed705f94ed75ed208228
commit: efb113fc30e7b805f7375d269b93bb4593d11d97 [2469/3502] drm: rework FB_CORE dependency
config: x86_64-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241213/202412130338.eqJd2r3M-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130338.eqJd2r3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130338.eqJd2r3M-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_driver_fbdev_probe':
   drivers/gpu/drm/drm_fbdev_shmem.c:171: undefined reference to `drm_fb_helper_alloc_info'
   ld: drivers/gpu/drm/drm_fbdev_shmem.c:177: undefined reference to `drm_fb_helper_fill_info'
   ld: drivers/gpu/drm/drm_fbdev_shmem.c:192: undefined reference to `drm_fb_helper_deferred_io'
   ld: drivers/gpu/drm/drm_fbdev_shmem.c:202: undefined reference to `drm_fb_helper_release_info'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_get_page':
   drivers/gpu/drm/drm_fbdev_shmem.c:86: undefined reference to `drm_gem_fb_get_obj'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_fb_destroy':
>> drivers/gpu/drm/drm_fbdev_shmem.c:62: undefined reference to `drm_fb_helper_fini'
   ld: drivers/gpu/drm/drm_fbdev_shmem.c:67: undefined reference to `drm_fb_helper_unprepare'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_fb_mmap':
   drivers/gpu/drm/drm_fbdev_shmem.c:45: undefined reference to `drm_gem_fb_get_obj'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_imageblit':
>> drivers/gpu/drm/drm_fbdev_shmem.c:37: undefined reference to `drm_fb_helper_damage_area'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_copyarea':
>> drivers/gpu/drm/drm_fbdev_shmem.c:37: undefined reference to `drm_fb_helper_damage_area'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_fillrect':
>> drivers/gpu/drm/drm_fbdev_shmem.c:37: undefined reference to `drm_fb_helper_damage_area'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_write':
>> drivers/gpu/drm/drm_fbdev_shmem.c:37: undefined reference to `drm_fb_helper_damage_range'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x488): undefined reference to `drm_fb_helper_check_var'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x490): undefined reference to `drm_fb_helper_set_par'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x4a0): undefined reference to `drm_fb_helper_setcmap'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x4a8): undefined reference to `drm_fb_helper_blank'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x4b0): undefined reference to `drm_fb_helper_pan_display'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x4e0): undefined reference to `drm_fb_helper_ioctl'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x508): undefined reference to `drm_fb_helper_debug_enter'
   ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x510): undefined reference to `drm_fb_helper_debug_leave'


vim +62 drivers/gpu/drm/drm_fbdev_shmem.c

150f431a08317e0 Thomas Zimmermann 2024-04-19   36  
150f431a08317e0 Thomas Zimmermann 2024-04-19  @37  FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(drm_fbdev_shmem,
150f431a08317e0 Thomas Zimmermann 2024-04-19   38  				   drm_fb_helper_damage_range,
150f431a08317e0 Thomas Zimmermann 2024-04-19   39  				   drm_fb_helper_damage_area);
150f431a08317e0 Thomas Zimmermann 2024-04-19   40  
150f431a08317e0 Thomas Zimmermann 2024-04-19   41  static int drm_fbdev_shmem_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
150f431a08317e0 Thomas Zimmermann 2024-04-19   42  {
150f431a08317e0 Thomas Zimmermann 2024-04-19   43  	struct drm_fb_helper *fb_helper = info->par;
150f431a08317e0 Thomas Zimmermann 2024-04-19   44  	struct drm_framebuffer *fb = fb_helper->fb;
150f431a08317e0 Thomas Zimmermann 2024-04-19  @45  	struct drm_gem_object *obj = drm_gem_fb_get_obj(fb, 0);
150f431a08317e0 Thomas Zimmermann 2024-04-19   46  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
150f431a08317e0 Thomas Zimmermann 2024-04-19   47  
150f431a08317e0 Thomas Zimmermann 2024-04-19   48  	if (shmem->map_wc)
150f431a08317e0 Thomas Zimmermann 2024-04-19   49  		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
150f431a08317e0 Thomas Zimmermann 2024-04-19   50  
150f431a08317e0 Thomas Zimmermann 2024-04-19   51  	return fb_deferred_io_mmap(info, vma);
150f431a08317e0 Thomas Zimmermann 2024-04-19   52  }
150f431a08317e0 Thomas Zimmermann 2024-04-19   53  
150f431a08317e0 Thomas Zimmermann 2024-04-19   54  static void drm_fbdev_shmem_fb_destroy(struct fb_info *info)
150f431a08317e0 Thomas Zimmermann 2024-04-19   55  {
150f431a08317e0 Thomas Zimmermann 2024-04-19   56  	struct drm_fb_helper *fb_helper = info->par;
150f431a08317e0 Thomas Zimmermann 2024-04-19   57  
150f431a08317e0 Thomas Zimmermann 2024-04-19   58  	if (!fb_helper->dev)
150f431a08317e0 Thomas Zimmermann 2024-04-19   59  		return;
150f431a08317e0 Thomas Zimmermann 2024-04-19   60  
216afc2c11b7e92 Thomas Zimmermann 2024-05-07   61  	fb_deferred_io_cleanup(info);
150f431a08317e0 Thomas Zimmermann 2024-04-19  @62  	drm_fb_helper_fini(fb_helper);
150f431a08317e0 Thomas Zimmermann 2024-04-19   63  
150f431a08317e0 Thomas Zimmermann 2024-04-19   64  	drm_client_buffer_vunmap(fb_helper->buffer);
150f431a08317e0 Thomas Zimmermann 2024-04-19   65  	drm_client_framebuffer_delete(fb_helper->buffer);
150f431a08317e0 Thomas Zimmermann 2024-04-19   66  	drm_client_release(&fb_helper->client);
150f431a08317e0 Thomas Zimmermann 2024-04-19   67  	drm_fb_helper_unprepare(fb_helper);
150f431a08317e0 Thomas Zimmermann 2024-04-19   68  	kfree(fb_helper);
150f431a08317e0 Thomas Zimmermann 2024-04-19   69  }
150f431a08317e0 Thomas Zimmermann 2024-04-19   70  
150f431a08317e0 Thomas Zimmermann 2024-04-19   71  static const struct fb_ops drm_fbdev_shmem_fb_ops = {
150f431a08317e0 Thomas Zimmermann 2024-04-19   72  	.owner = THIS_MODULE,
150f431a08317e0 Thomas Zimmermann 2024-04-19   73  	.fb_open = drm_fbdev_shmem_fb_open,
150f431a08317e0 Thomas Zimmermann 2024-04-19   74  	.fb_release = drm_fbdev_shmem_fb_release,
150f431a08317e0 Thomas Zimmermann 2024-04-19   75  	__FB_DEFAULT_DEFERRED_OPS_RDWR(drm_fbdev_shmem),
150f431a08317e0 Thomas Zimmermann 2024-04-19   76  	DRM_FB_HELPER_DEFAULT_OPS,
150f431a08317e0 Thomas Zimmermann 2024-04-19   77  	__FB_DEFAULT_DEFERRED_OPS_DRAW(drm_fbdev_shmem),
150f431a08317e0 Thomas Zimmermann 2024-04-19   78  	.fb_mmap = drm_fbdev_shmem_fb_mmap,
150f431a08317e0 Thomas Zimmermann 2024-04-19   79  	.fb_destroy = drm_fbdev_shmem_fb_destroy,
150f431a08317e0 Thomas Zimmermann 2024-04-19   80  };
150f431a08317e0 Thomas Zimmermann 2024-04-19   81  
150f431a08317e0 Thomas Zimmermann 2024-04-19   82  static struct page *drm_fbdev_shmem_get_page(struct fb_info *info, unsigned long offset)
150f431a08317e0 Thomas Zimmermann 2024-04-19   83  {
150f431a08317e0 Thomas Zimmermann 2024-04-19   84  	struct drm_fb_helper *fb_helper = info->par;
150f431a08317e0 Thomas Zimmermann 2024-04-19   85  	struct drm_framebuffer *fb = fb_helper->fb;
150f431a08317e0 Thomas Zimmermann 2024-04-19   86  	struct drm_gem_object *obj = drm_gem_fb_get_obj(fb, 0);
150f431a08317e0 Thomas Zimmermann 2024-04-19   87  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
150f431a08317e0 Thomas Zimmermann 2024-04-19   88  	unsigned int i = offset >> PAGE_SHIFT;
150f431a08317e0 Thomas Zimmermann 2024-04-19   89  	struct page *page;
150f431a08317e0 Thomas Zimmermann 2024-04-19   90  
150f431a08317e0 Thomas Zimmermann 2024-04-19   91  	if (fb_WARN_ON_ONCE(info, offset > obj->size))
150f431a08317e0 Thomas Zimmermann 2024-04-19   92  		return NULL;
150f431a08317e0 Thomas Zimmermann 2024-04-19   93  
150f431a08317e0 Thomas Zimmermann 2024-04-19   94  	page = shmem->pages[i]; // protected by active vmap
150f431a08317e0 Thomas Zimmermann 2024-04-19   95  	if (page)
150f431a08317e0 Thomas Zimmermann 2024-04-19   96  		get_page(page);
150f431a08317e0 Thomas Zimmermann 2024-04-19   97  	fb_WARN_ON_ONCE(info, !page);
150f431a08317e0 Thomas Zimmermann 2024-04-19   98  
150f431a08317e0 Thomas Zimmermann 2024-04-19   99  	return page;
150f431a08317e0 Thomas Zimmermann 2024-04-19  100  }
150f431a08317e0 Thomas Zimmermann 2024-04-19  101  
150f431a08317e0 Thomas Zimmermann 2024-04-19  102  /*
150f431a08317e0 Thomas Zimmermann 2024-04-19  103   * struct drm_fb_helper
150f431a08317e0 Thomas Zimmermann 2024-04-19  104   */
150f431a08317e0 Thomas Zimmermann 2024-04-19  105  
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  106  static int drm_fbdev_shmem_helper_fb_dirty(struct drm_fb_helper *helper,
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  107  					   struct drm_clip_rect *clip)
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  108  {
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  109  	struct drm_device *dev = helper->dev;
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  110  	int ret;
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  111  
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  112  	/* Call damage handlers only if necessary */
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  113  	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  114  		return 0;
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  115  
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  116  	if (helper->fb->funcs->dirty) {
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  117  		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  118  		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  119  			return ret;
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  120  	}
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  121  
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  122  	return 0;
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  123  }
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  124  
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  125  static const struct drm_fb_helper_funcs drm_fbdev_shmem_helper_funcs = {
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  126  	.fb_dirty = drm_fbdev_shmem_helper_fb_dirty,
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  127  };
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  128  
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  129  /*
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  130   * struct drm_driver
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  131   */
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  132  
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  133  int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  134  				       struct drm_fb_helper_surface_size *sizes)
150f431a08317e0 Thomas Zimmermann 2024-04-19  135  {
150f431a08317e0 Thomas Zimmermann 2024-04-19  136  	struct drm_client_dev *client = &fb_helper->client;
150f431a08317e0 Thomas Zimmermann 2024-04-19  137  	struct drm_device *dev = fb_helper->dev;
150f431a08317e0 Thomas Zimmermann 2024-04-19  138  	struct drm_client_buffer *buffer;
150f431a08317e0 Thomas Zimmermann 2024-04-19  139  	struct drm_gem_shmem_object *shmem;
150f431a08317e0 Thomas Zimmermann 2024-04-19  140  	struct drm_framebuffer *fb;
150f431a08317e0 Thomas Zimmermann 2024-04-19  141  	struct fb_info *info;
150f431a08317e0 Thomas Zimmermann 2024-04-19  142  	u32 format;
150f431a08317e0 Thomas Zimmermann 2024-04-19  143  	struct iosys_map map;
150f431a08317e0 Thomas Zimmermann 2024-04-19  144  	int ret;
150f431a08317e0 Thomas Zimmermann 2024-04-19  145  
150f431a08317e0 Thomas Zimmermann 2024-04-19  146  	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
150f431a08317e0 Thomas Zimmermann 2024-04-19  147  		    sizes->surface_width, sizes->surface_height,
150f431a08317e0 Thomas Zimmermann 2024-04-19  148  		    sizes->surface_bpp);
150f431a08317e0 Thomas Zimmermann 2024-04-19  149  
150f431a08317e0 Thomas Zimmermann 2024-04-19  150  	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp, sizes->surface_depth);
150f431a08317e0 Thomas Zimmermann 2024-04-19  151  	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
150f431a08317e0 Thomas Zimmermann 2024-04-19  152  					       sizes->surface_height, format);
150f431a08317e0 Thomas Zimmermann 2024-04-19  153  	if (IS_ERR(buffer))
150f431a08317e0 Thomas Zimmermann 2024-04-19  154  		return PTR_ERR(buffer);
150f431a08317e0 Thomas Zimmermann 2024-04-19  155  	shmem = to_drm_gem_shmem_obj(buffer->gem);
150f431a08317e0 Thomas Zimmermann 2024-04-19  156  
150f431a08317e0 Thomas Zimmermann 2024-04-19  157  	fb = buffer->fb;
150f431a08317e0 Thomas Zimmermann 2024-04-19  158  
150f431a08317e0 Thomas Zimmermann 2024-04-19  159  	ret = drm_client_buffer_vmap(buffer, &map);
150f431a08317e0 Thomas Zimmermann 2024-04-19  160  	if (ret) {
150f431a08317e0 Thomas Zimmermann 2024-04-19  161  		goto err_drm_client_buffer_delete;
150f431a08317e0 Thomas Zimmermann 2024-04-19  162  	} else if (drm_WARN_ON(dev, map.is_iomem)) {
150f431a08317e0 Thomas Zimmermann 2024-04-19  163  		ret = -ENODEV; /* I/O memory not supported; use generic emulation */
150f431a08317e0 Thomas Zimmermann 2024-04-19  164  		goto err_drm_client_buffer_delete;
150f431a08317e0 Thomas Zimmermann 2024-04-19  165  	}
150f431a08317e0 Thomas Zimmermann 2024-04-19  166  
f0f195d1a3aedef Thomas Zimmermann 2024-09-24  167  	fb_helper->funcs = &drm_fbdev_shmem_helper_funcs;
150f431a08317e0 Thomas Zimmermann 2024-04-19  168  	fb_helper->buffer = buffer;
150f431a08317e0 Thomas Zimmermann 2024-04-19  169  	fb_helper->fb = fb;
150f431a08317e0 Thomas Zimmermann 2024-04-19  170  
150f431a08317e0 Thomas Zimmermann 2024-04-19 @171  	info = drm_fb_helper_alloc_info(fb_helper);
150f431a08317e0 Thomas Zimmermann 2024-04-19  172  	if (IS_ERR(info)) {
150f431a08317e0 Thomas Zimmermann 2024-04-19  173  		ret = PTR_ERR(info);
150f431a08317e0 Thomas Zimmermann 2024-04-19  174  		goto err_drm_client_buffer_vunmap;
150f431a08317e0 Thomas Zimmermann 2024-04-19  175  	}
150f431a08317e0 Thomas Zimmermann 2024-04-19  176  
150f431a08317e0 Thomas Zimmermann 2024-04-19  177  	drm_fb_helper_fill_info(info, fb_helper, sizes);
150f431a08317e0 Thomas Zimmermann 2024-04-19  178  
150f431a08317e0 Thomas Zimmermann 2024-04-19  179  	info->fbops = &drm_fbdev_shmem_fb_ops;
150f431a08317e0 Thomas Zimmermann 2024-04-19  180  
150f431a08317e0 Thomas Zimmermann 2024-04-19  181  	/* screen */
150f431a08317e0 Thomas Zimmermann 2024-04-19  182  	info->flags |= FBINFO_VIRTFB; /* system memory */
150f431a08317e0 Thomas Zimmermann 2024-04-19  183  	if (!shmem->map_wc)
150f431a08317e0 Thomas Zimmermann 2024-04-19  184  		info->flags |= FBINFO_READS_FAST; /* signal caching */
150f431a08317e0 Thomas Zimmermann 2024-04-19  185  	info->screen_size = sizes->surface_height * fb->pitches[0];
150f431a08317e0 Thomas Zimmermann 2024-04-19  186  	info->screen_buffer = map.vaddr;
150f431a08317e0 Thomas Zimmermann 2024-04-19  187  	info->fix.smem_len = info->screen_size;
150f431a08317e0 Thomas Zimmermann 2024-04-19  188  
150f431a08317e0 Thomas Zimmermann 2024-04-19  189  	/* deferred I/O */
150f431a08317e0 Thomas Zimmermann 2024-04-19  190  	fb_helper->fbdefio.delay = HZ / 20;
150f431a08317e0 Thomas Zimmermann 2024-04-19  191  	fb_helper->fbdefio.get_page = drm_fbdev_shmem_get_page;
150f431a08317e0 Thomas Zimmermann 2024-04-19  192  	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
150f431a08317e0 Thomas Zimmermann 2024-04-19  193  
150f431a08317e0 Thomas Zimmermann 2024-04-19  194  	info->fbdefio = &fb_helper->fbdefio;
150f431a08317e0 Thomas Zimmermann 2024-04-19  195  	ret = fb_deferred_io_init(info);
150f431a08317e0 Thomas Zimmermann 2024-04-19  196  	if (ret)
150f431a08317e0 Thomas Zimmermann 2024-04-19  197  		goto err_drm_fb_helper_release_info;
150f431a08317e0 Thomas Zimmermann 2024-04-19  198  
150f431a08317e0 Thomas Zimmermann 2024-04-19  199  	return 0;
150f431a08317e0 Thomas Zimmermann 2024-04-19  200  
150f431a08317e0 Thomas Zimmermann 2024-04-19  201  err_drm_fb_helper_release_info:
150f431a08317e0 Thomas Zimmermann 2024-04-19 @202  	drm_fb_helper_release_info(fb_helper);

:::::: The code at line 62 was first introduced by commit
:::::: 150f431a08317e0e0363a7f9147b6246d3b40ba6 drm/fbdev: Add fbdev-shmem

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
