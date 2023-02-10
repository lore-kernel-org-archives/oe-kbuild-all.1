Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABF12F5E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676038601; x=1707574601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pNP7A/aMQvccKjCBmnIuaNQuNiKYV+cjS1xQiua8XY8=;
  b=K9dgarF3Y4wSxmtl3uDYHmYGmlar59RWvF73Gs+Ec3XKlnHkLVKwXxoY
   h9kT2KZ+NbuoaaEj/9sQsAfF1CMVwAav9LVQKAhkw6pIzozYd3+BEpUI6
   T4yZGowFnx+DlVRTzYdMJNC+n0IEwkfRxWHp6hSyZUYc8CAWfUlf3g2tI
   tmWf5SHtwJEvgMWEzXNeVFo64nMR9p1munDzZUbyZgMpl4m8QGDf4MgNx
   zZt7hLfwqk95Sk87KEg8aDcsfUBvbVA/sXM5GZliG0mvHIItdk9qft5U8
   1UTjI9aT34tWcJz8VYBOfPkLFf8VOxzagBh7UtF5wb8QQ5ieHXdLLyb3K
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="395034705"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="395034705"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 06:16:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="996965265"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="996965265"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Feb 2023 06:16:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQUCa-0005pn-1j;
	Fri, 10 Feb 2023 14:16:36 +0000
Date: Fri, 10 Feb 2023 22:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Sean Paul <seanpaul@chromium.org>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
	"Kristian H. Kristensen" <hoegsberg@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 1155/6555]
 drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202302102253.GsWFPBEE-lkp@intel.com>
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
config: sh-randconfig-s041-20221225 (https://download.01.org/0day-ci/archive/20230210/202302102253.GsWFPBEE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/dfdec43d0411076dc70591a0496a0824a8620695
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout dfdec43d0411076dc70591a0496a0824a8620695
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh SHELL=/bin/bash drivers/gpu/drm/ drivers/scsi/pcmcia/ drivers/usb/host/ fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302102253.GsWFPBEE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse:     expected unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
>> drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int const *__gu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse:     got unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse:     expected unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int const *__gu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse:     got unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse:     expected unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int const *__gu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse:     got unsigned int const *__gu_addr
   In file included from include/linux/gfp.h:6,
                    from include/linux/idr.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:16,
                    from include/linux/i2c.h:30,
                    from include/drm/drm_crtc.h:28,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/drm_atomic_uapi.c:30:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c: In function 'complete_signaling':
   drivers/gpu/drm/drm_atomic_uapi.c:1193:26: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
    1193 |         struct drm_crtc *crtc;
         |                          ^~~~

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
