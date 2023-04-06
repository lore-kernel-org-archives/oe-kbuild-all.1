Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D191F7ED
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 00:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680742594; x=1712278594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dihREUUsYEVTxehysp7n6fpC7ROUEBVDRewdiTDn71Y=;
  b=ef24ly6PHTrzP9Mktk0mxDviN0BITT9tYDvJbVwjukHqMDIPBigjBxwR
   wUcYvcC26fExTEURfr1V6yIlatL4iX0tdynOWgWlcl5SBEoyqPWDmUL6O
   gHwLvqw/ITQhCFUx5GkhxTkZWjJBk4/1NiejM2dTQ811coBPxeSeHEJwN
   SBhOlTnZJybAnwW4sNXPg/N2GUdI3yT+23S+Lr2rSdNJtRbHHRQ+m5KsF
   6k6mtuS5PfbqqY5PY87i3htk4oNc/mKDnKKB5TBA9qouvzUDBbq9tZNNs
   MfFh13NBYSOsNh+xRDibqq1cgXoogpjyCdrfkDXUBOAMbXvfpyeSHRTl5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="340099797"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="340099797"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 17:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="686933953"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="686933953"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Apr 2023 17:56:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkDvT-000QwU-14;
	Thu, 06 Apr 2023 00:56:31 +0000
Date: Thu, 6 Apr 2023 08:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [drm-tegra:for-next 30/32] drivers/gpu/drm/tegra/fbdev.c:103:29:
 error: implicit declaration of function 'vmap'; did you mean 'kmap'?
Message-ID: <202304060835.oYBkVjMC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/drm/tegra for-next
head:   e064bf8eeedb78439bed33990f93c7213294e005
commit: 914cfac73e230064656a42047a6f5546ee69a14f [30/32] drm/tegra: Hide fbdev support behind config option
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230406/202304060835.oYBkVjMC-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-tegra https://gitlab.freedesktop.org/drm/tegra
        git fetch --no-tags drm-tegra for-next
        git checkout 914cfac73e230064656a42047a6f5546ee69a14f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/tegra/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060835.oYBkVjMC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tegra/fbdev.c: In function 'tegra_fbdev_probe':
>> drivers/gpu/drm/tegra/fbdev.c:103:29: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     103 |                 bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
         |                             ^~~~
         |                             kmap
>> drivers/gpu/drm/tegra/fbdev.c:103:60: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
     103 |                 bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
         |                                                            ^~~~~~
         |                                                            VM_MTE
   drivers/gpu/drm/tegra/fbdev.c:103:60: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/tegra/fbdev.c: In function 'tegra_fbdev_exit':
>> drivers/gpu/drm/tegra/fbdev.c:186:25: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     186 |                         vunmap(bo->vaddr);
         |                         ^~~~~~
         |                         kunmap
   cc1: some warnings being treated as errors


vim +103 drivers/gpu/drm/tegra/fbdev.c

    45	
    46	static int tegra_fbdev_probe(struct drm_fb_helper *helper,
    47				     struct drm_fb_helper_surface_size *sizes)
    48	{
    49		struct tegra_drm *tegra = helper->dev->dev_private;
    50		struct drm_device *drm = helper->dev;
    51		struct drm_mode_fb_cmd2 cmd = { 0 };
    52		unsigned int bytes_per_pixel;
    53		struct drm_framebuffer *fb;
    54		unsigned long offset;
    55		struct fb_info *info;
    56		struct tegra_bo *bo;
    57		size_t size;
    58		int err;
    59	
    60		bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
    61	
    62		cmd.width = sizes->surface_width;
    63		cmd.height = sizes->surface_height;
    64		cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
    65					  tegra->pitch_align);
    66	
    67		cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
    68							     sizes->surface_depth);
    69	
    70		size = cmd.pitches[0] * cmd.height;
    71	
    72		bo = tegra_bo_create(drm, size, 0);
    73		if (IS_ERR(bo))
    74			return PTR_ERR(bo);
    75	
    76		info = drm_fb_helper_alloc_info(helper);
    77		if (IS_ERR(info)) {
    78			dev_err(drm->dev, "failed to allocate framebuffer info\n");
    79			drm_gem_object_put(&bo->gem);
    80			return PTR_ERR(info);
    81		}
    82	
    83		fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
    84		if (IS_ERR(fb)) {
    85			err = PTR_ERR(fb);
    86			dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
    87				err);
    88			drm_gem_object_put(&bo->gem);
    89			return PTR_ERR(fb);
    90		}
    91	
    92		helper->fb = fb;
    93		helper->info = info;
    94	
    95		info->fbops = &tegra_fb_ops;
    96	
    97		drm_fb_helper_fill_info(info, helper, sizes);
    98	
    99		offset = info->var.xoffset * bytes_per_pixel +
   100			 info->var.yoffset * fb->pitches[0];
   101	
   102		if (bo->pages) {
 > 103			bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
   104					 pgprot_writecombine(PAGE_KERNEL));
   105			if (!bo->vaddr) {
   106				dev_err(drm->dev, "failed to vmap() framebuffer\n");
   107				err = -ENOMEM;
   108				goto destroy;
   109			}
   110		}
   111	
   112		info->screen_base = (void __iomem *)bo->vaddr + offset;
   113		info->screen_size = size;
   114		info->fix.smem_start = (unsigned long)(bo->iova + offset);
   115		info->fix.smem_len = size;
   116	
   117		return 0;
   118	
   119	destroy:
   120		drm_framebuffer_remove(fb);
   121		return err;
   122	}
   123	
   124	static const struct drm_fb_helper_funcs tegra_fb_helper_funcs = {
   125		.fb_probe = tegra_fbdev_probe,
   126	};
   127	
   128	static struct drm_fb_helper *tegra_fbdev_create(struct drm_device *drm)
   129	{
   130		struct drm_fb_helper *helper;
   131	
   132		helper = kzalloc(sizeof(*helper), GFP_KERNEL);
   133		if (!helper)
   134			return ERR_PTR(-ENOMEM);
   135	
   136		drm_fb_helper_prepare(drm, helper, 32, &tegra_fb_helper_funcs);
   137	
   138		return helper;
   139	}
   140	
   141	static void tegra_fbdev_free(struct drm_fb_helper *helper)
   142	{
   143		drm_fb_helper_unprepare(helper);
   144		kfree(helper);
   145	}
   146	
   147	static int tegra_fbdev_init(struct drm_fb_helper *helper,
   148				    unsigned int num_crtc,
   149				    unsigned int max_connectors)
   150	{
   151		struct drm_device *drm = helper->dev;
   152		int err;
   153	
   154		err = drm_fb_helper_init(drm, helper);
   155		if (err < 0) {
   156			dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
   157				err);
   158			return err;
   159		}
   160	
   161		err = drm_fb_helper_initial_config(helper);
   162		if (err < 0) {
   163			dev_err(drm->dev, "failed to set initial configuration: %d\n",
   164				err);
   165			goto fini;
   166		}
   167	
   168		return 0;
   169	
   170	fini:
   171		drm_fb_helper_fini(helper);
   172		return err;
   173	}
   174	
   175	static void tegra_fbdev_exit(struct drm_fb_helper *helper)
   176	{
   177		struct drm_framebuffer *fb = helper->fb;
   178	
   179		drm_fb_helper_unregister_info(helper);
   180	
   181		if (fb) {
   182			struct tegra_bo *bo = tegra_fb_get_plane(fb, 0);
   183	
   184			/* Undo the special mapping we made in fbdev probe. */
   185			if (bo && bo->pages) {
 > 186				vunmap(bo->vaddr);
   187				bo->vaddr = NULL;
   188			}
   189	
   190			drm_framebuffer_remove(fb);
   191		}
   192	
   193		drm_fb_helper_fini(helper);
   194		tegra_fbdev_free(helper);
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
