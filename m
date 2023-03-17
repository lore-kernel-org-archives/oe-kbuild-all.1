Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB179D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 21:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679086882; x=1710622882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpCyoY/kIbcyru2UNBEfqeHBOlEHLJfk3VP6jRDKj8o=;
  b=IIhBibM34aib0AfCLTQ9fnE5hdqztVO2ki/zl+N3GsR+rKpq2eD3m3hJ
   bI6938GGOAh9XtIdxYWwJfwFJRTvYWVRBgoAJr9tAoGG4oHgezRcdRY8Y
   Em/jdhgPDO4XKcPWwQD1bn0t79jtsuRzfrbE9/xZBZaMLq38t79+iJrtj
   5hIXvoN2XvoiWptLQvBFENJ8cRm08k+gtRWdqcqpCeuc1N//p/hT8DbtM
   9wCn+Rlga64T4TSiORKCC91wTft1+dhCMGeSjyjPC0ZBEQr1ln7Eq1heB
   8uy3nvQV335GRtBYB1HPBtSpY8Ai8/72uhiXJCkghgD9BTMndsxtZwwqq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="403231984"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="403231984"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 14:01:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744675768"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="744675768"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2023 14:01:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdHCR-0009Zm-0A;
	Fri, 17 Mar 2023 21:01:19 +0000
Date: Sat, 18 Mar 2023 05:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chris Wilson <chris@chris-wilson.co.uk>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Michel Dnzer <michel.daenzer@amd.com>,
	Sean Paul <seanpaul@chromium.org>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
	"Kristian H. Kristensen" <hoegsberg@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 1190/6555]
 drivers/gpu/drm/drm_lease.c:691: Error: unrecognized opcode `csrs
 sstatus,s7'
Message-ID: <202303180402.qjvNLVlQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 49115f4dc89615a59460c471172b35c5aee241d3 [1190/6555] UPSTREAM: drm: Introduce per-device driver_features
config: riscv-randconfig-r042-20230313 (https://download.01.org/0day-ci/archive/20230318/202303180402.qjvNLVlQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/49115f4dc89615a59460c471172b35c5aee241d3
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout 49115f4dc89615a59460c471172b35c5aee241d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash M=drivers/gpu/drm

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180402.qjvNLVlQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_lease.c: Assembler messages:
   drivers/gpu/drm/drm_lease.c:630: Error: unrecognized opcode `csrs sstatus,s6'
   drivers/gpu/drm/drm_lease.c:630: Error: unrecognized opcode `csrc sstatus,s6'
>> drivers/gpu/drm/drm_lease.c:691: Error: unrecognized opcode `csrs sstatus,s7'
>> drivers/gpu/drm/drm_lease.c:691: Error: unrecognized opcode `csrc sstatus,s7'


vim +691 drivers/gpu/drm/drm_lease.c

62884cd386b876 Keith Packard 2017-03-16  590  
62884cd386b876 Keith Packard 2017-03-16  591  /**
62884cd386b876 Keith Packard 2017-03-16  592   * drm_mode_list_lessees_ioctl - list lessee ids
62884cd386b876 Keith Packard 2017-03-16  593   * @dev: the drm device
62884cd386b876 Keith Packard 2017-03-16  594   * @data: pointer to struct drm_mode_list_lessees
62884cd386b876 Keith Packard 2017-03-16  595   * @lessor_priv: the file being manipulated
62884cd386b876 Keith Packard 2017-03-16  596   *
62884cd386b876 Keith Packard 2017-03-16  597   * Starting from the master associated with the specified file,
62884cd386b876 Keith Packard 2017-03-16  598   * the master with the provided lessee_id is found, and then
62884cd386b876 Keith Packard 2017-03-16  599   * an array of lessee ids associated with leases from that master
62884cd386b876 Keith Packard 2017-03-16  600   * are returned.
62884cd386b876 Keith Packard 2017-03-16  601   */
62884cd386b876 Keith Packard 2017-03-16  602  
62884cd386b876 Keith Packard 2017-03-16  603  int drm_mode_list_lessees_ioctl(struct drm_device *dev,
62884cd386b876 Keith Packard 2017-03-16  604  			       void *data, struct drm_file *lessor_priv)
62884cd386b876 Keith Packard 2017-03-16  605  {
62884cd386b876 Keith Packard 2017-03-16  606  	struct drm_mode_list_lessees *arg = data;
62884cd386b876 Keith Packard 2017-03-16  607  	__u32 __user *lessee_ids = (__u32 __user *) (uintptr_t) (arg->lessees_ptr);
62884cd386b876 Keith Packard 2017-03-16  608  	__u32 count_lessees = arg->count_lessees;
62884cd386b876 Keith Packard 2017-03-16  609  	struct drm_master *lessor = lessor_priv->master, *lessee;
62884cd386b876 Keith Packard 2017-03-16  610  	int count;
62884cd386b876 Keith Packard 2017-03-16  611  	int ret = 0;
62884cd386b876 Keith Packard 2017-03-16  612  
62884cd386b876 Keith Packard 2017-03-16  613  	if (arg->pad)
62884cd386b876 Keith Packard 2017-03-16  614  		return -EINVAL;
62884cd386b876 Keith Packard 2017-03-16  615  
62884cd386b876 Keith Packard 2017-03-16  616  	/* Can't lease without MODESET */
62884cd386b876 Keith Packard 2017-03-16  617  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
62884cd386b876 Keith Packard 2017-03-16  618  		return -EINVAL;
62884cd386b876 Keith Packard 2017-03-16  619  
62884cd386b876 Keith Packard 2017-03-16  620  	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
62884cd386b876 Keith Packard 2017-03-16  621  
62884cd386b876 Keith Packard 2017-03-16  622  	mutex_lock(&dev->mode_config.idr_mutex);
62884cd386b876 Keith Packard 2017-03-16  623  
62884cd386b876 Keith Packard 2017-03-16  624  	count = 0;
62884cd386b876 Keith Packard 2017-03-16  625  	drm_for_each_lessee(lessee, lessor) {
62884cd386b876 Keith Packard 2017-03-16  626  		/* Only list un-revoked leases */
62884cd386b876 Keith Packard 2017-03-16  627  		if (!idr_is_empty(&lessee->leases)) {
62884cd386b876 Keith Packard 2017-03-16  628  			if (count_lessees > count) {
62884cd386b876 Keith Packard 2017-03-16  629  				DRM_DEBUG_LEASE("Add lessee %d\n", lessee->lessee_id);
62884cd386b876 Keith Packard 2017-03-16 @630  				ret = put_user(lessee->lessee_id, lessee_ids + count);
62884cd386b876 Keith Packard 2017-03-16  631  				if (ret)
62884cd386b876 Keith Packard 2017-03-16  632  					break;
62884cd386b876 Keith Packard 2017-03-16  633  			}
62884cd386b876 Keith Packard 2017-03-16  634  			count++;
62884cd386b876 Keith Packard 2017-03-16  635  		}
62884cd386b876 Keith Packard 2017-03-16  636  	}
62884cd386b876 Keith Packard 2017-03-16  637  
62884cd386b876 Keith Packard 2017-03-16  638  	DRM_DEBUG_LEASE("Lessor leases to %d\n", count);
62884cd386b876 Keith Packard 2017-03-16  639  	if (ret == 0)
62884cd386b876 Keith Packard 2017-03-16  640  		arg->count_lessees = count;
62884cd386b876 Keith Packard 2017-03-16  641  
62884cd386b876 Keith Packard 2017-03-16  642  	mutex_unlock(&dev->mode_config.idr_mutex);
62884cd386b876 Keith Packard 2017-03-16  643  
62884cd386b876 Keith Packard 2017-03-16  644  	return ret;
62884cd386b876 Keith Packard 2017-03-16  645  }
62884cd386b876 Keith Packard 2017-03-16  646  
62884cd386b876 Keith Packard 2017-03-16  647  /**
62884cd386b876 Keith Packard 2017-03-16  648   * drm_mode_get_lease_ioctl - list leased objects
62884cd386b876 Keith Packard 2017-03-16  649   * @dev: the drm device
62884cd386b876 Keith Packard 2017-03-16  650   * @data: pointer to struct drm_mode_get_lease
7591844c197cd2 Chris Wilson  2018-02-08  651   * @lessee_priv: the file being manipulated
62884cd386b876 Keith Packard 2017-03-16  652   *
62884cd386b876 Keith Packard 2017-03-16  653   * Return the list of leased objects for the specified lessee
62884cd386b876 Keith Packard 2017-03-16  654   */
62884cd386b876 Keith Packard 2017-03-16  655  
62884cd386b876 Keith Packard 2017-03-16  656  int drm_mode_get_lease_ioctl(struct drm_device *dev,
62884cd386b876 Keith Packard 2017-03-16  657  			     void *data, struct drm_file *lessee_priv)
62884cd386b876 Keith Packard 2017-03-16  658  {
62884cd386b876 Keith Packard 2017-03-16  659  	struct drm_mode_get_lease *arg = data;
62884cd386b876 Keith Packard 2017-03-16  660  	__u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
62884cd386b876 Keith Packard 2017-03-16  661  	__u32 count_objects = arg->count_objects;
62884cd386b876 Keith Packard 2017-03-16  662  	struct drm_master *lessee = lessee_priv->master;
62884cd386b876 Keith Packard 2017-03-16  663  	struct idr *object_idr;
62884cd386b876 Keith Packard 2017-03-16  664  	int count;
62884cd386b876 Keith Packard 2017-03-16  665  	void *entry;
62884cd386b876 Keith Packard 2017-03-16  666  	int object;
62884cd386b876 Keith Packard 2017-03-16  667  	int ret = 0;
62884cd386b876 Keith Packard 2017-03-16  668  
62884cd386b876 Keith Packard 2017-03-16  669  	if (arg->pad)
62884cd386b876 Keith Packard 2017-03-16  670  		return -EINVAL;
62884cd386b876 Keith Packard 2017-03-16  671  
62884cd386b876 Keith Packard 2017-03-16  672  	/* Can't lease without MODESET */
62884cd386b876 Keith Packard 2017-03-16  673  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
62884cd386b876 Keith Packard 2017-03-16  674  		return -EINVAL;
62884cd386b876 Keith Packard 2017-03-16  675  
62884cd386b876 Keith Packard 2017-03-16  676  	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
62884cd386b876 Keith Packard 2017-03-16  677  
62884cd386b876 Keith Packard 2017-03-16  678  	mutex_lock(&dev->mode_config.idr_mutex);
62884cd386b876 Keith Packard 2017-03-16  679  
62884cd386b876 Keith Packard 2017-03-16  680  	if (lessee->lessor == NULL)
62884cd386b876 Keith Packard 2017-03-16  681  		/* owner can use all objects */
62884cd386b876 Keith Packard 2017-03-16  682  		object_idr = &lessee->dev->mode_config.crtc_idr;
62884cd386b876 Keith Packard 2017-03-16  683  	else
62884cd386b876 Keith Packard 2017-03-16  684  		/* lessee can only use allowed object */
62884cd386b876 Keith Packard 2017-03-16  685  		object_idr = &lessee->leases;
62884cd386b876 Keith Packard 2017-03-16  686  
62884cd386b876 Keith Packard 2017-03-16  687  	count = 0;
62884cd386b876 Keith Packard 2017-03-16  688  	idr_for_each_entry(object_idr, entry, object) {
62884cd386b876 Keith Packard 2017-03-16  689  		if (count_objects > count) {
62884cd386b876 Keith Packard 2017-03-16  690  			DRM_DEBUG_LEASE("adding object %d\n", object);
62884cd386b876 Keith Packard 2017-03-16 @691  			ret = put_user(object, object_ids + count);
62884cd386b876 Keith Packard 2017-03-16  692  			if (ret)
62884cd386b876 Keith Packard 2017-03-16  693  				break;
62884cd386b876 Keith Packard 2017-03-16  694  		}
62884cd386b876 Keith Packard 2017-03-16  695  		count++;
62884cd386b876 Keith Packard 2017-03-16  696  	}
62884cd386b876 Keith Packard 2017-03-16  697  
62884cd386b876 Keith Packard 2017-03-16  698  	DRM_DEBUG("lease holds %d objects\n", count);
62884cd386b876 Keith Packard 2017-03-16  699  	if (ret == 0)
62884cd386b876 Keith Packard 2017-03-16  700  		arg->count_objects = count;
62884cd386b876 Keith Packard 2017-03-16  701  
62884cd386b876 Keith Packard 2017-03-16  702  	mutex_unlock(&dev->mode_config.idr_mutex);
62884cd386b876 Keith Packard 2017-03-16  703  
62884cd386b876 Keith Packard 2017-03-16  704  	return ret;
62884cd386b876 Keith Packard 2017-03-16  705  }
62884cd386b876 Keith Packard 2017-03-16  706  

:::::: The code at line 691 was first introduced by commit
:::::: 62884cd386b876638720ef88374b31a84ca7ee5f drm: Add four ioctls for managing drm mode object leases [v7]

:::::: TO: Keith Packard <keithp@keithp.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
