Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BF88F4B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675185376; x=1706721376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Op6oOPjZa/XKHb2hgme2xZtsHTajm9ixJNwLFc4AhG0=;
  b=WHgCeKXDzqKp/FnOCzhCxzefu6BNlFmA67GGcNH/7ERaT4UXL+uDrGQ7
   5xuOK82/P/HSErV6Yk9Fgi41tgKCJMOTIWHwNckfYb9plRB1BaCm6UcJf
   10DrY04B7evm7vN2J2eB5KogyrEWZKzjOohqv9obURifNxYaLSeb6kxf1
   S1l6rKSx7Je88J5Gs8pcQowm0VLWDAExO6m1bWaRUbvGkBhC+p0VPRRv9
   ZOIMfqXIFDadEUfb+csCt151Wv++iP5V3+PT68c0nmpQttihFcfg2C2Sz
   6dHlceukiRA8TuSJCCu8y9C/z3ml73HMB1Z5wdE3uvs+9pxWeQkiLbuEZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="315862422"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="315862422"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 09:16:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="666562712"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="666562712"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2023 09:16:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMuEm-0004Zq-2Z;
	Tue, 31 Jan 2023 17:16:04 +0000
Date: Wed, 1 Feb 2023 01:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Brian Starkey <brian.starkey@arm.com>,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/6] drm/debugfs: Make drm_device use the struct
 drm_debugfs_files
Message-ID: <202302010102.Zlw3VTYI-lkp@intel.com>
References: <20230130123008.287141-3-mcanal@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130123008.287141-3-mcanal@igalia.com>

Hi Maíra,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip next-20230131]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-debugfs-Introduce-wrapper-for-debugfs-list/20230130-203549
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230130123008.287141-3-mcanal%40igalia.com
patch subject: [PATCH v2 2/6] drm/debugfs: Make drm_device use the struct drm_debugfs_files
config: arc-randconfig-r043-20230129 (https://download.01.org/0day-ci/archive/20230201/202302010102.Zlw3VTYI-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/776660a442d9112d8fbc06b0b8b0b77852b18fca
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ma-ra-Canal/drm-debugfs-Introduce-wrapper-for-debugfs-list/20230130-203549
        git checkout 776660a442d9112d8fbc06b0b8b0b77852b18fca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_drv.c: In function 'drm_dev_init_release':
>> drivers/gpu/drm/drm_drv.c:602:9: error: implicit declaration of function 'drm_debugfs_files_destroy'; did you mean 'drm_debugfs_list_destroy'? [-Werror=implicit-function-declaration]
     602 |         drm_debugfs_files_destroy(dev->debugfs_files);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         drm_debugfs_list_destroy
   drivers/gpu/drm/drm_drv.c: In function 'drm_dev_init':
>> drivers/gpu/drm/drm_drv.c:650:30: error: implicit declaration of function 'drm_debugfs_files_init'; did you mean 'drm_debugfs_list_init'? [-Werror=implicit-function-declaration]
     650 |         dev->debugfs_files = drm_debugfs_files_init();
         |                              ^~~~~~~~~~~~~~~~~~~~~~
         |                              drm_debugfs_list_init
>> drivers/gpu/drm/drm_drv.c:650:28: warning: assignment to 'struct drm_debugfs_files *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     650 |         dev->debugfs_files = drm_debugfs_files_init();
         |                            ^
   cc1: some warnings being treated as errors


vim +602 drivers/gpu/drm/drm_drv.c

   562	
   563	/**
   564	 * DOC: component helper usage recommendations
   565	 *
   566	 * DRM drivers that drive hardware where a logical device consists of a pile of
   567	 * independent hardware blocks are recommended to use the :ref:`component helper
   568	 * library<component>`. For consistency and better options for code reuse the
   569	 * following guidelines apply:
   570	 *
   571	 *  - The entire device initialization procedure should be run from the
   572	 *    &component_master_ops.master_bind callback, starting with
   573	 *    devm_drm_dev_alloc(), then binding all components with
   574	 *    component_bind_all() and finishing with drm_dev_register().
   575	 *
   576	 *  - The opaque pointer passed to all components through component_bind_all()
   577	 *    should point at &struct drm_device of the device instance, not some driver
   578	 *    specific private structure.
   579	 *
   580	 *  - The component helper fills the niche where further standardization of
   581	 *    interfaces is not practical. When there already is, or will be, a
   582	 *    standardized interface like &drm_bridge or &drm_panel, providing its own
   583	 *    functions to find such components at driver load time, like
   584	 *    drm_of_find_panel_or_bridge(), then the component helper should not be
   585	 *    used.
   586	 */
   587	
   588	static void drm_dev_init_release(struct drm_device *dev, void *res)
   589	{
   590		drm_legacy_ctxbitmap_cleanup(dev);
   591		drm_legacy_remove_map_hash(dev);
   592		drm_fs_inode_free(dev->anon_inode);
   593	
   594		put_device(dev->dev);
   595		/* Prevent use-after-free in drm_managed_release when debugging is
   596		 * enabled. Slightly awkward, but can't really be helped. */
   597		dev->dev = NULL;
   598		mutex_destroy(&dev->master_mutex);
   599		mutex_destroy(&dev->clientlist_mutex);
   600		mutex_destroy(&dev->filelist_mutex);
   601		mutex_destroy(&dev->struct_mutex);
 > 602		drm_debugfs_files_destroy(dev->debugfs_files);
   603		drm_legacy_destroy_members(dev);
   604	}
   605	
   606	static int drm_dev_init(struct drm_device *dev,
   607				const struct drm_driver *driver,
   608				struct device *parent)
   609	{
   610		struct inode *inode;
   611		int ret;
   612	
   613		if (!drm_core_init_complete) {
   614			DRM_ERROR("DRM core is not initialized\n");
   615			return -ENODEV;
   616		}
   617	
   618		if (WARN_ON(!parent))
   619			return -EINVAL;
   620	
   621		kref_init(&dev->ref);
   622		dev->dev = get_device(parent);
   623		dev->driver = driver;
   624	
   625		INIT_LIST_HEAD(&dev->managed.resources);
   626		spin_lock_init(&dev->managed.lock);
   627	
   628		/* no per-device feature limits by default */
   629		dev->driver_features = ~0u;
   630	
   631		if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
   632					(drm_core_check_feature(dev, DRIVER_RENDER) ||
   633					drm_core_check_feature(dev, DRIVER_MODESET))) {
   634			DRM_ERROR("DRM driver can't be both a compute acceleration and graphics driver\n");
   635			return -EINVAL;
   636		}
   637	
   638		drm_legacy_init_members(dev);
   639		INIT_LIST_HEAD(&dev->filelist);
   640		INIT_LIST_HEAD(&dev->filelist_internal);
   641		INIT_LIST_HEAD(&dev->clientlist);
   642		INIT_LIST_HEAD(&dev->vblank_event_list);
   643	
   644		spin_lock_init(&dev->event_lock);
   645		mutex_init(&dev->struct_mutex);
   646		mutex_init(&dev->filelist_mutex);
   647		mutex_init(&dev->clientlist_mutex);
   648		mutex_init(&dev->master_mutex);
   649	
 > 650		dev->debugfs_files = drm_debugfs_files_init();
   651	
   652		ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
   653		if (ret)
   654			return ret;
   655	
   656		inode = drm_fs_inode_new();
   657		if (IS_ERR(inode)) {
   658			ret = PTR_ERR(inode);
   659			DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
   660			goto err;
   661		}
   662	
   663		dev->anon_inode = inode;
   664	
   665		if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL)) {
   666			ret = drm_minor_alloc(dev, DRM_MINOR_ACCEL);
   667			if (ret)
   668				goto err;
   669		} else {
   670			if (drm_core_check_feature(dev, DRIVER_RENDER)) {
   671				ret = drm_minor_alloc(dev, DRM_MINOR_RENDER);
   672				if (ret)
   673					goto err;
   674			}
   675	
   676			ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
   677			if (ret)
   678				goto err;
   679		}
   680	
   681		ret = drm_legacy_create_map_hash(dev);
   682		if (ret)
   683			goto err;
   684	
   685		drm_legacy_ctxbitmap_init(dev);
   686	
   687		if (drm_core_check_feature(dev, DRIVER_GEM)) {
   688			ret = drm_gem_init(dev);
   689			if (ret) {
   690				DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
   691				goto err;
   692			}
   693		}
   694	
   695		ret = drm_dev_set_unique(dev, dev_name(parent));
   696		if (ret)
   697			goto err;
   698	
   699		return 0;
   700	
   701	err:
   702		drm_managed_release(dev);
   703	
   704		return ret;
   705	}
   706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
