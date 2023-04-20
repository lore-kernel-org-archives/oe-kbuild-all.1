Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799C9445
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 20:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682021580; x=1713557580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uyVvxcRZS7I7O+cSxgkIiIVzZH8+9CGJs8SMZtKlIFc=;
  b=L5gwbHVYpPhs4WN462vA8H4MplaJdjSLfZiddSweV98oYXFwZKw+XRNA
   VbNtR2CeAul3HqyzQLODb9rFJASmWyVMIoI+7Il9VY8nMrZv81k+lhb+O
   g6wEhCWP9ouUZVEY54/d/DwQL7X3nrLB5hT5sOXcCR0LMeUHQxX1v4y5w
   Re7xw9K7KIKKesyQPRj+Z+thUZ6nBwPtu8zusNs5e39qRiLPdJ3ogt8fI
   Kmdz+IYA7s4Vqa4ed7PAl0CNpWgERJ01rkgM88Kp9DkTi3R3iGjgDl6GC
   y0fm3u4NHup9SIu0qgTb1Azf24kjM46AViDa93Vulmm4qC7Zeu9J+psDI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432120753"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="432120753"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 13:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816158560"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="816158560"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Apr 2023 13:12:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppaeC-000g3S-1j;
	Thu, 20 Apr 2023 20:12:52 +0000
Date: Fri, 21 Apr 2023 04:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Sean Paul <seanpaul@chromium.org>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
	"Kristian H. Kristensen" <hoegsberg@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 1155/6555]
 drivers/gpu/drm/drm_atomic_uapi.c:1297: Error: unrecognized opcode `csrs
 sstatus,s11'
Message-ID: <202304210445.Jfjf3Y2B-lkp@intel.com>
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
commit: dfdec43d0411076dc70591a0496a0824a8620695 [1155/6555] UPSTREAM: drm: extract drm_atomic_uapi.c
config: riscv-buildonly-randconfig-r006-20230417 (https://download.01.org/0day-ci/archive/20230421/202304210445.Jfjf3Y2B-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/dfdec43d0411076dc70591a0496a0824a8620695
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout dfdec43d0411076dc70591a0496a0824a8620695
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash M=drivers/gpu/drm

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210445.Jfjf3Y2B-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic_uapi.c: In function 'complete_signaling':
   drivers/gpu/drm/drm_atomic_uapi.c:1193:26: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
    1193 |         struct drm_crtc *crtc;
         |                          ^~~~
   drivers/gpu/drm/drm_atomic_uapi.c: Assembler messages:
   drivers/gpu/drm/drm_atomic_uapi.c:1052: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/gpu/drm/drm_atomic_uapi.c:1052: Error: unrecognized opcode `csrc sstatus,a3'
   drivers/gpu/drm/drm_atomic_uapi.c:1230: Error: unrecognized opcode `csrs sstatus,s6'
   drivers/gpu/drm/drm_atomic_uapi.c:1230: Error: unrecognized opcode `csrc sstatus,s6'
   drivers/gpu/drm/drm_atomic_uapi.c:466: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/gpu/drm/drm_atomic_uapi.c:466: Error: unrecognized opcode `csrc sstatus,a3'
   drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode `csrc sstatus,a3'
>> drivers/gpu/drm/drm_atomic_uapi.c:1297: Error: unrecognized opcode `csrs sstatus,s11'
>> drivers/gpu/drm/drm_atomic_uapi.c:1297: Error: unrecognized opcode `csrc sstatus,s11'
   drivers/gpu/drm/drm_atomic_uapi.c:1314: Error: unrecognized opcode `csrs sstatus,s11'
   drivers/gpu/drm/drm_atomic_uapi.c:1314: Error: unrecognized opcode `csrc sstatus,s11'
   drivers/gpu/drm/drm_atomic_uapi.c:1327: Error: unrecognized opcode `csrs sstatus,s11'
   drivers/gpu/drm/drm_atomic_uapi.c:1327: Error: unrecognized opcode `csrc sstatus,s11'


vim +1297 drivers/gpu/drm/drm_atomic_uapi.c

  1236	
  1237	int drm_mode_atomic_ioctl(struct drm_device *dev,
  1238				  void *data, struct drm_file *file_priv)
  1239	{
  1240		struct drm_mode_atomic *arg = data;
  1241		uint32_t __user *objs_ptr = (uint32_t __user *)(unsigned long)(arg->objs_ptr);
  1242		uint32_t __user *count_props_ptr = (uint32_t __user *)(unsigned long)(arg->count_props_ptr);
  1243		uint32_t __user *props_ptr = (uint32_t __user *)(unsigned long)(arg->props_ptr);
  1244		uint64_t __user *prop_values_ptr = (uint64_t __user *)(unsigned long)(arg->prop_values_ptr);
  1245		unsigned int copied_objs, copied_props;
  1246		struct drm_atomic_state *state;
  1247		struct drm_modeset_acquire_ctx ctx;
  1248		struct drm_out_fence_state *fence_state;
  1249		int ret = 0;
  1250		unsigned int i, j, num_fences;
  1251	
  1252		/* disallow for drivers not supporting atomic: */
  1253		if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
  1254			return -EINVAL;
  1255	
  1256		/* disallow for userspace that has not enabled atomic cap (even
  1257		 * though this may be a bit overkill, since legacy userspace
  1258		 * wouldn't know how to call this ioctl)
  1259		 */
  1260		if (!file_priv->atomic)
  1261			return -EINVAL;
  1262	
  1263		if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS)
  1264			return -EINVAL;
  1265	
  1266		if (arg->reserved)
  1267			return -EINVAL;
  1268	
  1269		if ((arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) &&
  1270				!dev->mode_config.async_page_flip)
  1271			return -EINVAL;
  1272	
  1273		/* can't test and expect an event at the same time. */
  1274		if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
  1275				(arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
  1276			return -EINVAL;
  1277	
  1278		drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
  1279	
  1280		state = drm_atomic_state_alloc(dev);
  1281		if (!state)
  1282			return -ENOMEM;
  1283	
  1284		state->acquire_ctx = &ctx;
  1285		state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
  1286	
  1287	retry:
  1288		copied_objs = 0;
  1289		copied_props = 0;
  1290		fence_state = NULL;
  1291		num_fences = 0;
  1292	
  1293		for (i = 0; i < arg->count_objs; i++) {
  1294			uint32_t obj_id, count_props;
  1295			struct drm_mode_object *obj;
  1296	
> 1297			if (get_user(obj_id, objs_ptr + copied_objs)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
