Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C3C1E522
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 17:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from i53875a73.versanet.de ([83.135.90.115] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1r1VBq-0000Hj-9U; Fri, 10 Nov 2023 18:21:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: kernel test robot <lkp@intel.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Steven Price <steven.price@arm.com>
Subject:
 Re: [mmind-rockchip:dev/panthor 36/41]
 drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previous prototype
 for 'panthor_debugfs_init'
Date: Fri, 10 Nov 2023 18:21:05 +0100
Message-ID: <3931875.atdPhlSkOF@diego>
In-Reply-To: <202311110058.uP4Vh1gN-lkp@intel.com>
References: <202311110058.uP4Vh1gN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi kernel-test-robot,

please don't build-test my github kernel repository.

I've never enabled anything for this, so I don't even know how it made it
in some build-test-list.

This is really only my dumping ground for work-in-progress or test code.
Case in point, I just wanted to play around with the panthor patches, not
cause email messages for Boris.


Thanks a lot
Heiko

Am Freitag, 10. November 2023, 18:04:14 CET schrieb kernel test robot:
> Hi Boris,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://github.com/mmind/linux-rockchip dev/panthor
> head:   ef8d76d568fba69012333ce6e9d7cce4aebbb2da
> commit: 86d43fb902f5db2a81e432041864dd7523314c70 [36/41] drm/panthor: Allow driver compilation
> config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110058.uP4Vh1gN-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110058.uP4Vh1gN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311110058.uP4Vh1gN-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previous prototype for 'panthor_debugfs_init' [-Wmissing-prototypes]
>     1326 | void panthor_debugfs_init(struct drm_minor *minor)
>          |      ^~~~~~~~~~~~~~~~~~~~
> --
>    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_process_fatal_event_locked':
> >> drivers/gpu/drm/panthor/panthor_sched.c:1233:37: warning: variable 'csg_iface' set but not used [-Wunused-but-set-variable]
>     1233 |         struct panthor_fw_cs_iface *csg_iface;
>          |                                     ^~~~~~~~~
>    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_process_tiler_oom_event_locked':
> >> drivers/gpu/drm/panthor/panthor_sched.c:1321:13: warning: variable 'info' set but not used [-Wunused-but-set-variable]
>     1321 |         u64 info, heap_address, new_chunk_va;
>          |             ^~~~
> >> drivers/gpu/drm/panthor/panthor_sched.c:1319:13: warning: variable 'fault' set but not used [-Wunused-but-set-variable]
>     1319 |         u32 fault, vt_start, vt_end, frag_end;
>          |             ^~~~~
> >> drivers/gpu/drm/panthor/panthor_sched.c:1318:31: warning: variable 'queue' set but not used [-Wunused-but-set-variable]
>     1318 |         struct panthor_queue *queue;
>          |                               ^~~~~
>    drivers/gpu/drm/panthor/panthor_sched.c: In function 'tick_ctx_apply':
>    drivers/gpu/drm/panthor/panthor_sched.c:1983:54: warning: variable 'csg_iface' set but not used [-Wunused-but-set-variable]
>     1983 |                         struct panthor_fw_csg_iface *csg_iface;
>          |                                                      ^~~~~~~~~
>    drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_sched_suspend':
> >> drivers/gpu/drm/panthor/panthor_sched.c:2481:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
>     2481 |         int ret;
>          |             ^~~
>    drivers/gpu/drm/panthor/panthor_sched.c: In function 'group_create_queue':
>    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: error: 'DRM_SCHED_POLICY_SINGLE_ENTITY' undeclared (first use in this function)
>     2927 |                              NULL, "panthor-queue", DRM_SCHED_POLICY_SINGLE_ENTITY,
>          |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: note: each undeclared identifier is reported only once for each function it appears in
>    drivers/gpu/drm/panthor/panthor_sched.c:2926:49: warning: passing argument 7 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>     2926 |                              group->ptdev->reset.wq,
>          |                              ~~~~~~~~~~~~~~~~~~~^~~
>          |                                                 |
>          |                                                 struct workqueue_struct *
>    In file included from drivers/gpu/drm/panthor/panthor_sched.c:9:
>    include/drm/gpu_scheduler.h:533:25: note: expected 'long int' but argument is of type 'struct workqueue_struct *'
>      533 |                    long timeout, struct workqueue_struct *timeout_wq,
>          |                    ~~~~~^~~~~~~
>    drivers/gpu/drm/panthor/panthor_sched.c:2927:36: error: passing argument 9 of 'drm_sched_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
>     2927 |                              NULL, "panthor-queue", DRM_SCHED_POLICY_SINGLE_ENTITY,
>          |                                    ^~~~~~~~~~~~~~~
>          |                                    |
>          |                                    char *
>    include/drm/gpu_scheduler.h:534:30: note: expected 'atomic_t *' but argument is of type 'char *'
>      534 |                    atomic_t *score, const char *name, struct device *dev);
>          |                    ~~~~~~~~~~^~~~~
>    cc1: some warnings being treated as errors
> --
> >> drivers/gpu/drm/panthor/panthor_devfreq.c:43: warning: Function parameter or member 'lock' not described in 'panthor_devfreq'
> --
> >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Function parameter or member 'ddev' not described in 'panthor_gem_create_object'
> >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Excess function parameter 'dev' description in 'panthor_gem_create_object'
> --
> >> drivers/gpu/drm/panthor/panthor_heap.c:339: warning: Function parameter or member 'new_chunk_gpu_va' not described in 'panthor_heap_grow'
> --
> >> drivers/gpu/drm/panthor/panthor_gpu.c:52: warning: Function parameter or member 'product_major' not described in 'panthor_model'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function parameter or member '_name' not described in 'GPU_MODEL'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function parameter or member '_arch_major' not described in 'GPU_MODEL'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function parameter or member '_product_major' not described in 'GPU_MODEL'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:168: warning: Function parameter or member 'ptdev' not described in 'panthor_gpu_unplug'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Function parameter or member 'timeout_us' not described in 'panthor_gpu_block_power_off'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Excess function parameter 'timeout_ms' description in 'panthor_gpu_block_power_off'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function parameter or member 'rdy_reg' not described in 'panthor_gpu_block_power_on'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function parameter or member 'timeout_us' not described in 'panthor_gpu_block_power_on'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Excess function parameter 'timeout_ms' description in 'panthor_gpu_block_power_on'
> >> drivers/gpu/drm/panthor/panthor_gpu.c:472: warning: Function parameter or member 'ptdev' not described in 'panthor_gpu_resume'
> --
> >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Function parameter or member 'obj_size' not described in 'panthor_get_uobj_array'
> >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Excess function parameter 'obj_kernel' description in 'panthor_get_uobj_array'
> >> drivers/gpu/drm/panthor/panthor_drv.c:268: warning: Function parameter or member 'syncops' not described in 'panthor_job_ctx'
> >> drivers/gpu/drm/panthor/panthor_drv.c:732: warning: Function parameter or member 'job_put' not described in 'panthor_submit_ctx_cleanup'
> >> drivers/gpu/drm/panthor/panthor_drv.c:1406: warning: Cannot understand  * @cleanup_wq: Workqueue used to cleanup stuff.
>     on line 1406 - I thought it was a doc line
> --
> >> drivers/gpu/drm/panthor/panthor_fw.c:293: warning: expecting prototype for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_csg_iface() instead
> >> drivers/gpu/drm/panthor/panthor_fw.c:310: warning: expecting prototype for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_cs_iface() instead
> >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function parameter or member 'input_fw_va' not described in 'panthor_fw_alloc_queue_iface_mem'
> >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function parameter or member 'output_fw_va' not described in 'panthor_fw_alloc_queue_iface_mem'
> >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: Function parameter or member 'csg_slot' not described in 'panthor_fw_csg_wait_acks'
> >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: expecting prototype for panthor_fw_glb_wait_acks(). Prototype was for panthor_fw_csg_wait_acks() instead
> 
> 
> vim +/panthor_debugfs_init +1326 drivers/gpu/drm/panthor/panthor_drv.c
> 
> 560b6916e77920 Boris Brezillon 2023-08-09  1324  
> 560b6916e77920 Boris Brezillon 2023-08-09  1325  #ifdef CONFIG_DEBUG_FS
> 560b6916e77920 Boris Brezillon 2023-08-09 @1326  void panthor_debugfs_init(struct drm_minor *minor)
> 560b6916e77920 Boris Brezillon 2023-08-09  1327  {
> 560b6916e77920 Boris Brezillon 2023-08-09  1328  	panthor_mmu_debugfs_init(minor);
> 560b6916e77920 Boris Brezillon 2023-08-09  1329  }
> 560b6916e77920 Boris Brezillon 2023-08-09  1330  #endif
> 560b6916e77920 Boris Brezillon 2023-08-09  1331  
> 560b6916e77920 Boris Brezillon 2023-08-09  1332  /*
> 560b6916e77920 Boris Brezillon 2023-08-09  1333   * PanCSF driver version:
> 560b6916e77920 Boris Brezillon 2023-08-09  1334   * - 1.0 - initial interface
> 560b6916e77920 Boris Brezillon 2023-08-09  1335   */
> 560b6916e77920 Boris Brezillon 2023-08-09  1336  static const struct drm_driver panthor_drm_driver = {
> 560b6916e77920 Boris Brezillon 2023-08-09  1337  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> 560b6916e77920 Boris Brezillon 2023-08-09  1338  			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> 560b6916e77920 Boris Brezillon 2023-08-09  1339  	.open = panthor_open,
> 560b6916e77920 Boris Brezillon 2023-08-09  1340  	.postclose = panthor_postclose,
> 560b6916e77920 Boris Brezillon 2023-08-09  1341  	.ioctls = panthor_drm_driver_ioctls,
> 560b6916e77920 Boris Brezillon 2023-08-09  1342  	.num_ioctls = ARRAY_SIZE(panthor_drm_driver_ioctls),
> 560b6916e77920 Boris Brezillon 2023-08-09  1343  	.fops = &panthor_drm_driver_fops,
> 560b6916e77920 Boris Brezillon 2023-08-09  1344  	.name = "panthor",
> 560b6916e77920 Boris Brezillon 2023-08-09  1345  	.desc = "Panthor DRM driver",
> 560b6916e77920 Boris Brezillon 2023-08-09  1346  	.date = "20230801",
> 560b6916e77920 Boris Brezillon 2023-08-09  1347  	.major = 1,
> 560b6916e77920 Boris Brezillon 2023-08-09  1348  	.minor = 0,
> 560b6916e77920 Boris Brezillon 2023-08-09  1349  
> 560b6916e77920 Boris Brezillon 2023-08-09  1350  	.gem_create_object = panthor_gem_create_object,
> 560b6916e77920 Boris Brezillon 2023-08-09  1351  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> 560b6916e77920 Boris Brezillon 2023-08-09  1352  #ifdef CONFIG_DEBUG_FS
> 560b6916e77920 Boris Brezillon 2023-08-09  1353  	.debugfs_init = panthor_debugfs_init,
> 560b6916e77920 Boris Brezillon 2023-08-09  1354  #endif
> 560b6916e77920 Boris Brezillon 2023-08-09  1355  };
> 560b6916e77920 Boris Brezillon 2023-08-09  1356  
> 560b6916e77920 Boris Brezillon 2023-08-09  1357  static int panthor_probe(struct platform_device *pdev)
> 560b6916e77920 Boris Brezillon 2023-08-09  1358  {
> 560b6916e77920 Boris Brezillon 2023-08-09  1359  	struct panthor_device *ptdev;
> 560b6916e77920 Boris Brezillon 2023-08-09  1360  	int ret;
> 560b6916e77920 Boris Brezillon 2023-08-09  1361  
> 560b6916e77920 Boris Brezillon 2023-08-09  1362  	ptdev = devm_drm_dev_alloc(&pdev->dev, &panthor_drm_driver,
> 560b6916e77920 Boris Brezillon 2023-08-09  1363  				   struct panthor_device, base);
> 560b6916e77920 Boris Brezillon 2023-08-09  1364  	if (!ptdev)
> 560b6916e77920 Boris Brezillon 2023-08-09  1365  		return -ENOMEM;
> 560b6916e77920 Boris Brezillon 2023-08-09  1366  
> 560b6916e77920 Boris Brezillon 2023-08-09  1367  	platform_set_drvdata(pdev, ptdev);
> 560b6916e77920 Boris Brezillon 2023-08-09  1368  
> 560b6916e77920 Boris Brezillon 2023-08-09  1369  	ret = panthor_device_init(ptdev);
> 560b6916e77920 Boris Brezillon 2023-08-09  1370  	if (ret)
> 560b6916e77920 Boris Brezillon 2023-08-09  1371  		return ret;
> 560b6916e77920 Boris Brezillon 2023-08-09  1372  
> 560b6916e77920 Boris Brezillon 2023-08-09  1373  	return drm_dev_register(&ptdev->base, 0);
> 560b6916e77920 Boris Brezillon 2023-08-09  1374  }
> 560b6916e77920 Boris Brezillon 2023-08-09  1375  
> 560b6916e77920 Boris Brezillon 2023-08-09  1376  static void panthor_remove(struct platform_device *pdev)
> 560b6916e77920 Boris Brezillon 2023-08-09  1377  {
> 560b6916e77920 Boris Brezillon 2023-08-09  1378  	struct panthor_device *ptdev = platform_get_drvdata(pdev);
> 560b6916e77920 Boris Brezillon 2023-08-09  1379  
> 560b6916e77920 Boris Brezillon 2023-08-09  1380  	panthor_device_unplug(ptdev);
> 560b6916e77920 Boris Brezillon 2023-08-09  1381  }
> 560b6916e77920 Boris Brezillon 2023-08-09  1382  
> 560b6916e77920 Boris Brezillon 2023-08-09  1383  static const struct of_device_id dt_match[] = {
> 560b6916e77920 Boris Brezillon 2023-08-09  1384  	{ .compatible = "rockchip,rk3588-mali" },
> 560b6916e77920 Boris Brezillon 2023-08-09  1385  	{ .compatible = "arm,mali-valhall-csf" },
> 560b6916e77920 Boris Brezillon 2023-08-09  1386  	{}
> 560b6916e77920 Boris Brezillon 2023-08-09  1387  };
> 560b6916e77920 Boris Brezillon 2023-08-09  1388  MODULE_DEVICE_TABLE(of, dt_match);
> 560b6916e77920 Boris Brezillon 2023-08-09  1389  
> 560b6916e77920 Boris Brezillon 2023-08-09  1390  static DEFINE_RUNTIME_DEV_PM_OPS(panthor_pm_ops,
> 560b6916e77920 Boris Brezillon 2023-08-09  1391  				 panthor_device_suspend,
> 560b6916e77920 Boris Brezillon 2023-08-09  1392  				 panthor_device_resume,
> 560b6916e77920 Boris Brezillon 2023-08-09  1393  				 NULL);
> 560b6916e77920 Boris Brezillon 2023-08-09  1394  
> 560b6916e77920 Boris Brezillon 2023-08-09  1395  static struct platform_driver panthor_driver = {
> 560b6916e77920 Boris Brezillon 2023-08-09  1396  	.probe = panthor_probe,
> 560b6916e77920 Boris Brezillon 2023-08-09  1397  	.remove_new = panthor_remove,
> 560b6916e77920 Boris Brezillon 2023-08-09  1398  	.driver = {
> 560b6916e77920 Boris Brezillon 2023-08-09  1399  		.name = "panthor",
> 560b6916e77920 Boris Brezillon 2023-08-09  1400  		.pm = &panthor_pm_ops,
> 560b6916e77920 Boris Brezillon 2023-08-09  1401  		.of_match_table = dt_match,
> 560b6916e77920 Boris Brezillon 2023-08-09  1402  	},
> 560b6916e77920 Boris Brezillon 2023-08-09  1403  };
> 560b6916e77920 Boris Brezillon 2023-08-09  1404  
> 560b6916e77920 Boris Brezillon 2023-08-09  1405  /**
> 560b6916e77920 Boris Brezillon 2023-08-09 @1406   * @cleanup_wq: Workqueue used to cleanup stuff.
> 560b6916e77920 Boris Brezillon 2023-08-09  1407   *
> 560b6916e77920 Boris Brezillon 2023-08-09  1408   * We create a dedicated workqueue so we can drain on unplug and
> 560b6916e77920 Boris Brezillon 2023-08-09  1409   * make sure all resources are freed before the module is unloaded.
> 560b6916e77920 Boris Brezillon 2023-08-09  1410   */
> 560b6916e77920 Boris Brezillon 2023-08-09  1411  struct workqueue_struct *panthor_cleanup_wq;
> 560b6916e77920 Boris Brezillon 2023-08-09  1412  
> 
> :::::: The code at line 1326 was first introduced by commit
> :::::: 560b6916e779201356a8db10cec8dc5183d9fe5f drm/panthor: Add the driver frontend block
> 
> :::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
> :::::: CC: Heiko Stuebner <heiko@sntech.de>
> 
> 




