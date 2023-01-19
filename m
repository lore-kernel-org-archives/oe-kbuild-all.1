Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F6317CD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 04:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674101737; x=1705637737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fEIn4g2FQOlEtGtaOpKy8U4Y3WemoLOmLjeuJFILB5M=;
  b=UTbHFho4oewbzhelPFg+yjnwV7qYVhg8hsLCPw8u7hCAKdR797y1pkQh
   /n3/F4VlmtPFVzSHvBLcEsvqH+25tvnVvfNd115NipKWyJvrE0FAMQVGt
   P/K6Dcb/hU0/0L0GfBVNnd09OsYeDt7suFHg7CJBS3E8SmaZ+llIKHUvb
   zBhbwFPoP+V9L6MbmOjvCEnkIyhqvADKtfufHLyKfsVbHHwWur5YfC0wW
   PiPIMrLuYDHBMcUhNZNEUmNISoEUtAlx1Hv2qjuD8W3Jql0NBfZtcSSvt
   qFXL4XW0bLsocc+v47R8oZdCci/geqi0wd+Eda7uQotfJysGo60FxEM9v
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305563401"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="305563401"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 20:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="660050738"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="660050738"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2023 20:15:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIMKo-00014Y-35;
	Thu, 19 Jan 2023 04:15:30 +0000
Date: Thu, 19 Jan 2023 12:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Sean Paul <seanpaul@chromium.org>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
	"Kristian H. Kristensen" <hoegsberg@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 1155/6555]
 drivers/gpu/drm/drm_atomic_uapi.c:1230: Error: unrecognized opcode `csrs
 sstatus,s5'
Message-ID: <202301191229.WIgtzbSk-lkp@intel.com>
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
config: riscv-randconfig-r042-20230118 (https://download.01.org/0day-ci/archive/20230119/202301191229.WIgtzbSk-lkp@intel.com/config)
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

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic_uapi.c: In function 'complete_signaling':
   drivers/gpu/drm/drm_atomic_uapi.c:1193:26: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
    1193 |         struct drm_crtc *crtc;
         |                          ^~~~
   drivers/gpu/drm/drm_atomic_uapi.c: Assembler messages:
   drivers/gpu/drm/drm_atomic_uapi.c:1052: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/gpu/drm/drm_atomic_uapi.c:1052: Error: unrecognized opcode `csrc sstatus,a3'
>> drivers/gpu/drm/drm_atomic_uapi.c:1230: Error: unrecognized opcode `csrs sstatus,s5'
>> drivers/gpu/drm/drm_atomic_uapi.c:1230: Error: unrecognized opcode `csrc sstatus,s5'
   drivers/gpu/drm/drm_atomic_uapi.c:466: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/gpu/drm/drm_atomic_uapi.c:466: Error: unrecognized opcode `csrc sstatus,a3'
   drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode `csrs sstatus,a1'
   drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode `csrc sstatus,a1'
>> drivers/gpu/drm/drm_atomic_uapi.c:1297: Error: unrecognized opcode `csrs sstatus,s2'
>> drivers/gpu/drm/drm_atomic_uapi.c:1297: Error: unrecognized opcode `csrc sstatus,s2'
   drivers/gpu/drm/drm_atomic_uapi.c:1314: Error: unrecognized opcode `csrs sstatus,s2'
   drivers/gpu/drm/drm_atomic_uapi.c:1314: Error: unrecognized opcode `csrc sstatus,s2'
   drivers/gpu/drm/drm_atomic_uapi.c:1327: Error: unrecognized opcode `csrs sstatus,s2'
   drivers/gpu/drm/drm_atomic_uapi.c:1327: Error: unrecognized opcode `csrc sstatus,s2'


vim +1230 drivers/gpu/drm/drm_atomic_uapi.c

  1186	
  1187	static void complete_signaling(struct drm_device *dev,
  1188				       struct drm_atomic_state *state,
  1189				       struct drm_out_fence_state *fence_state,
  1190				       unsigned int num_fences,
  1191				       bool install_fds)
  1192	{
  1193		struct drm_crtc *crtc;
  1194		struct drm_crtc_state *crtc_state;
  1195		int i;
  1196	
  1197		if (install_fds) {
  1198			for (i = 0; i < num_fences; i++)
  1199				fd_install(fence_state[i].fd,
  1200					   fence_state[i].sync_file->file);
  1201	
  1202			kfree(fence_state);
  1203			return;
  1204		}
  1205	
  1206		for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
  1207			struct drm_pending_vblank_event *event = crtc_state->event;
  1208			/*
  1209			 * Free the allocated event. drm_atomic_helper_setup_commit
  1210			 * can allocate an event too, so only free it if it's ours
  1211			 * to prevent a double free in drm_atomic_state_clear.
  1212			 */
  1213			if (event && (event->base.fence || event->base.file_priv)) {
  1214				drm_event_cancel_free(dev, &event->base);
  1215				crtc_state->event = NULL;
  1216			}
  1217		}
  1218	
  1219		if (!fence_state)
  1220			return;
  1221	
  1222		for (i = 0; i < num_fences; i++) {
  1223			if (fence_state[i].sync_file)
  1224				fput(fence_state[i].sync_file->file);
  1225			if (fence_state[i].fd >= 0)
  1226				put_unused_fd(fence_state[i].fd);
  1227	
  1228			/* If this fails log error to the user */
  1229			if (fence_state[i].out_fence_ptr &&
> 1230			    put_user(-1, fence_state[i].out_fence_ptr))
  1231				DRM_DEBUG_ATOMIC("Couldn't clear out_fence_ptr\n");
  1232		}
  1233	
  1234		kfree(fence_state);
  1235	}
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
