Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25476A23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 02:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676083981; x=1707619981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uDyFV8tOt8OJYn7EQC2D6/lt7cmmA32oR9vGb4SjozY=;
  b=NrZhBf4WwoLALkIgLovYJUPEbmVpbfr/OYsHKbvwZrBckOU1uCEsQ5tt
   z9SSJ/K2nEuwVagNr2rS62p1QbwT+tdsgh24WKmKNm19Ll/6Kga4j02Tj
   vd5BhUqDlSp5n3jx34BYeWryeugG1W4zPfiy7yXVr0BQ1mDRxTQ7DMYnm
   JRYjCaB5AofiV9lcMxMn2m7JxncRhAlThNk0XSMj9h18njAWb55A3Ieuw
   jLRKImzoYIOJ08UFposR5+epIOPQPlqrYMl+RRwwFaIiC3VOBgSGtzLnl
   hOrmRvxQnw3vSWGlyRhdZm4DEogFdXEhy0Fgo5o0GFnrH9yaMuJYcPRZ6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="330584220"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="330584220"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 18:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="618083366"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="618083366"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Feb 2023 18:52:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQg0T-0006Bv-0x;
	Sat, 11 Feb 2023 02:52:53 +0000
Date: Sat, 11 Feb 2023 10:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:drm/compile-test 7/8] drivers/gpu/drm/tegra/fb.c:276:29:
 error: implicit declaration of function 'vmap'; did you mean 'kmap'?
Message-ID: <202302111036.9s9rupNN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git drm/compile-test
head:   e9b1e0aab902e12144886205d2400360a71ae4a6
commit: badc181ae6eabc3d6399b6b1bd4142c4914b5597 [7/8] drm/tegra: Enable COMPILE_TEST on all architectures
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230211/202302111036.9s9rupNN-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?id=badc181ae6eabc3d6399b6b1bd4142c4914b5597
        git remote add pinchartl https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git
        git fetch --no-tags pinchartl drm/compile-test
        git checkout badc181ae6eabc3d6399b6b1bd4142c4914b5597
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/tegra/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111036.9s9rupNN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tegra/fb.c: In function 'tegra_fbdev_probe':
>> drivers/gpu/drm/tegra/fb.c:276:29: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     276 |                 bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
         |                             ^~~~
         |                             kmap
>> drivers/gpu/drm/tegra/fb.c:276:60: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
     276 |                 bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
         |                                                            ^~~~~~
         |                                                            VM_MTE
   drivers/gpu/drm/tegra/fb.c:276:60: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/tegra/fb.c: In function 'tegra_fbdev_exit':
>> drivers/gpu/drm/tegra/fb.c:358:25: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     358 |                         vunmap(bo->vaddr);
         |                         ^~~~~~
         |                         kunmap
   cc1: some warnings being treated as errors


vim +276 drivers/gpu/drm/tegra/fb.c

de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  216  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  217  static int tegra_fbdev_probe(struct drm_fb_helper *helper,
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  218  			     struct drm_fb_helper_surface_size *sizes)
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  219  {
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  220  	struct tegra_fbdev *fbdev = to_tegra_fbdev(helper);
d1f3e1e0b38d49 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-07-11  221  	struct tegra_drm *tegra = helper->dev->dev_private;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  222  	struct drm_device *drm = helper->dev;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  223  	struct drm_mode_fb_cmd2 cmd = { 0 };
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  224  	unsigned int bytes_per_pixel;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  225  	struct drm_framebuffer *fb;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  226  	unsigned long offset;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  227  	struct fb_info *info;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  228  	struct tegra_bo *bo;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  229  	size_t size;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  230  	int err;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  231  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  232  	bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  233  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  234  	cmd.width = sizes->surface_width;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  235  	cmd.height = sizes->surface_height;
d1f3e1e0b38d49 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-07-11  236  	cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
d1f3e1e0b38d49 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-07-11  237  				  tegra->pitch_align);
71835caa00e8a6 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2017-11-14  238  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  239  	cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  240  						     sizes->surface_depth);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  241  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  242  	size = cmd.pitches[0] * cmd.height;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  243  
773af77fc479fd drivers/gpu/drm/tegra/fb.c  Thierry Reding    2013-10-04  244  	bo = tegra_bo_create(drm, size, 0);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  245  	if (IS_ERR(bo))
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  246  		return PTR_ERR(bo);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  247  
7fd50bc39d126d drivers/gpu/drm/tegra/fb.c  Thomas Zimmermann 2022-11-03  248  	info = drm_fb_helper_alloc_info(helper);
0f7d9052fb705e drivers/gpu/drm/tegra/fb.c  Archit Taneja     2015-07-22  249  	if (IS_ERR(info)) {
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  250  		dev_err(drm->dev, "failed to allocate framebuffer info\n");
b8912e29506386 drivers/gpu/drm/tegra/fb.c  Emil Velikov      2020-05-15  251  		drm_gem_object_put(&bo->gem);
0f7d9052fb705e drivers/gpu/drm/tegra/fb.c  Archit Taneja     2015-07-22  252  		return PTR_ERR(info);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  253  	}
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  254  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  255  	fbdev->fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  256  	if (IS_ERR(fbdev->fb)) {
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  257  		err = PTR_ERR(fbdev->fb);
cb10c81fdf8c77 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  258  		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
cb10c81fdf8c77 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  259  			err);
b8912e29506386 drivers/gpu/drm/tegra/fb.c  Emil Velikov      2020-05-15  260  		drm_gem_object_put(&bo->gem);
da7bdda2afdf1a drivers/gpu/drm/tegra/fb.c  Daniel Vetter     2017-02-07  261  		return PTR_ERR(fbdev->fb);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  262  	}
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  263  
dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  264  	fb = fbdev->fb;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  265  	helper->fb = fb;
9877d8f6bc3749 drivers/gpu/drm/tegra/fb.c  Thomas Zimmermann 2022-11-03  266  	helper->info = info;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  267  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  268  	info->fbops = &tegra_fb_ops;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  269  
4a536934e6c977 drivers/gpu/drm/tegra/fb.c  Daniel Vetter     2019-03-26  270  	drm_fb_helper_fill_info(info, helper, sizes);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  271  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  272  	offset = info->var.xoffset * bytes_per_pixel +
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  273  		 info->var.yoffset * fb->pitches[0];
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  274  
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26  275  	if (bo->pages) {
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26 @276  		bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26  277  				 pgprot_writecombine(PAGE_KERNEL));
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26  278  		if (!bo->vaddr) {
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26  279  			dev_err(drm->dev, "failed to vmap() framebuffer\n");
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26  280  			err = -ENOMEM;
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26  281  			goto destroy;
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26  282  		}
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26  283  	}
df06b759f2cf46 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-26  284  
9ab34151a9aab9 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2013-11-08  285  	info->screen_base = (void __iomem *)bo->vaddr + offset;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  286  	info->screen_size = size;
7e3c53a096a9e7 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2018-06-04  287  	info->fix.smem_start = (unsigned long)(bo->iova + offset);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  288  	info->fix.smem_len = size;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  289  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  290  	return 0;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  291  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  292  destroy:
3e7d2fddba5a3e drivers/gpu/drm/tegra/fb.c  Daniel Vetter     2016-12-27  293  	drm_framebuffer_remove(fb);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  294  	return err;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  295  }
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  296  
3a4938799dec32 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  297  static const struct drm_fb_helper_funcs tegra_fb_helper_funcs = {
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  298  	.fb_probe = tegra_fbdev_probe,
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  299  };
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  300  
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  301  static struct tegra_fbdev *tegra_fbdev_create(struct drm_device *drm)
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  302  {
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  303  	struct tegra_fbdev *fbdev;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  304  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  305  	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  306  	if (!fbdev) {
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  307  		dev_err(drm->dev, "failed to allocate DRM fbdev\n");
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  308  		return ERR_PTR(-ENOMEM);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  309  	}
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  310  
6c80a93be62d39 drivers/gpu/drm/tegra/fb.c  Thomas Zimmermann 2023-01-25  311  	drm_fb_helper_prepare(drm, &fbdev->base, 32, &tegra_fb_helper_funcs);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  312  
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  313  	return fbdev;
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  314  }
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  315  
1d1e6fe9b5cd9e drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  316  static void tegra_fbdev_free(struct tegra_fbdev *fbdev)
1d1e6fe9b5cd9e drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  317  {
1d1e6fe9b5cd9e drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  318  	kfree(fbdev);
1d1e6fe9b5cd9e drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  319  }
1d1e6fe9b5cd9e drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  320  
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  321  static int tegra_fbdev_init(struct tegra_fbdev *fbdev,
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  322  			    unsigned int num_crtc,
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  323  			    unsigned int max_connectors)
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  324  {
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  325  	struct drm_device *drm = fbdev->base.dev;
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  326  	int err;
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  327  
2dea2d1182179e drivers/gpu/drm/tegra/fb.c  Pankaj Bharadiya  2020-03-05  328  	err = drm_fb_helper_init(drm, &fbdev->base);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  329  	if (err < 0) {
cb10c81fdf8c77 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  330  		dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
cb10c81fdf8c77 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  331  			err);
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  332  		return err;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  333  	}
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  334  
6c80a93be62d39 drivers/gpu/drm/tegra/fb.c  Thomas Zimmermann 2023-01-25  335  	err = drm_fb_helper_initial_config(&fbdev->base);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  336  	if (err < 0) {
cb10c81fdf8c77 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  337  		dev_err(drm->dev, "failed to set initial configuration: %d\n",
cb10c81fdf8c77 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  338  			err);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  339  		goto fini;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  340  	}
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  341  
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  342  	return 0;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  343  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  344  fini:
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  345  	drm_fb_helper_fini(&fbdev->base);
e2215321ff180f drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-06-27  346  	return err;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  347  }
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  348  
1d1e6fe9b5cd9e drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  349  static void tegra_fbdev_exit(struct tegra_fbdev *fbdev)
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  350  {
afb0ff78c13c51 drivers/gpu/drm/tegra/fb.c  Thomas Zimmermann 2022-11-03  351  	drm_fb_helper_unregister_info(&fbdev->base);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  352  
c34a997d033df6 drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  353  	if (fbdev->fb) {
c34a997d033df6 drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  354  		struct tegra_bo *bo = tegra_fb_get_plane(fbdev->fb, 0);
c34a997d033df6 drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  355  
c34a997d033df6 drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  356  		/* Undo the special mapping we made in fbdev probe. */
c34a997d033df6 drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  357  		if (bo && bo->pages) {
c34a997d033df6 drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30 @358  			vunmap(bo->vaddr);
53f1e0620b9b67 drivers/gpu/drm/tegra/fb.c  Souptick Joarder  2018-08-01  359  			bo->vaddr = NULL;
c34a997d033df6 drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  360  		}
c34a997d033df6 drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  361  
dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  362  		drm_framebuffer_remove(fbdev->fb);
c34a997d033df6 drivers/gpu/drm/tegra/fb.c  Daniel Stone      2018-03-30  363  	}
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  364  
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  365  	drm_fb_helper_fini(&fbdev->base);
1d1e6fe9b5cd9e drivers/gpu/drm/tegra/fb.c  Thierry Reding    2014-11-06  366  	tegra_fbdev_free(fbdev);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen   2013-03-22  367  }
60c2f709d9b411 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2013-10-31  368  #endif
d8f4a9eda00678 drivers/gpu/drm/tegra/fb.c  Thierry Reding    2012-11-15  369  

:::::: The code at line 276 was first introduced by commit
:::::: df06b759f2cf4690fa9991edb1504ba39932b2bb drm/tegra: Add IOMMU support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
