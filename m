Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FFF1426E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from i5e861929.versanet.de ([94.134.25.41] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1r1mvF-00013k-0L; Sat, 11 Nov 2023 13:17:09 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Steven Price <steven.price@arm.com>
Subject:
 Re: [mmind-rockchip:dev/panthor 36/41]
 drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previous prototype
 for 'panthor_debugfs_init'
Date: Sat, 11 Nov 2023 13:17:08 +0100
Message-ID: <4217073.OBFZWjSADL@diego>
In-Reply-To: <ZU7dU5TPM3N7Ur4Z@rli9-mobl>
References:
 <202311110058.uP4Vh1gN-lkp@intel.com> <20231110202058.1c05283a@collabora.com>
 <ZU7dU5TPM3N7Ur4Z@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Philip Li,

Am Samstag, 11. November 2023, 02:48:03 CET schrieb Philip Li:
> On Fri, Nov 10, 2023 at 08:20:58PM +0100, Boris Brezillon wrote:
> > On Fri, 10 Nov 2023 18:21:05 +0100
> > Heiko St=FCbner <heiko@sntech.de> wrote:
> >=20
> > > Hi kernel-test-robot,
> > >=20
> > > please don't build-test my github kernel repository.
> > >=20
> > > I've never enabled anything for this, so I don't even know how it mad=
e it
> > > in some build-test-list.
>=20
> Sorry about this Heiko, the bot scans the possible linux repo and add to =
coverage
> to do shift left testing for developers, thus this is added. We will skip=
 the testing
> of this repo.

thanks a lot for changing this.

All my meaningful work lands on my git.kernel.org repo, so the testing
you're doing there is very much appreciated.


It is different for my github stuff where I really only post stuff I'm work=
ing
on and want to show to someone for reference - or similar cases.

So code quality will never be as high and code will change anyway
and going by the fact that your testing still will cost time and energy
to some compile-farm, I just think other repositories are way more
deserving of that energy ;-) .


Thanks
Heiko

> One thing to consult that the robot also supports private report to only
> send mail to repo owner (and only cc oe-kbuild-all@lists.linux.dev for
> archive purpose). Do you like to enable this and continue the build test
> coverage of your repo?
>=20
> Thanks
>=20
> > >=20
> > > This is really only my dumping ground for work-in-progress or test co=
de.
> > > Case in point, I just wanted to play around with the panthor patches,=
 not
> > > cause email messages for Boris.
> >=20
> > No worries. Actually, that's good to know I have a few more things to
> > fix (probably a weird combination of options being enabled/disabled
> > leading to unused functions/variables).
> >=20
> > Not trying to say kernel-test-bot should scan your tree, but those
> > information are useful to me ;-).
> >=20
> > Regards,
> >=20
> > Boris
> >=20
> > >=20
> > >=20
> > > Thanks a lot
> > > Heiko
> > >=20
> > > Am Freitag, 10. November 2023, 18:04:14 CET schrieb kernel test robot:
> > > > Hi Boris,
> > > >=20
> > > > First bad commit (maybe !=3D root cause):
> > > >=20
> > > > tree:   https://github.com/mmind/linux-rockchip dev/panthor
> > > > head:   ef8d76d568fba69012333ce6e9d7cce4aebbb2da
> > > > commit: 86d43fb902f5db2a81e432041864dd7523314c70 [36/41] drm/pantho=
r: Allow driver compilation
> > > > config: sparc-allyesconfig (https://download.01.org/0day-ci/archive=
/20231111/202311110058.uP4Vh1gN-lkp@intel.com/config)
> > > > compiler: sparc64-linux-gcc (GCC) 13.2.0
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20231111/202311110058.uP4Vh1gN-lkp@intel.com/reproduce)
> > > >=20
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202311110058.uP4Vh1=
gN-lkp@intel.com/
> > > >=20
> > > > All warnings (new ones prefixed by >>):
> > > >  =20
> > > > >> drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previo=
us prototype for 'panthor_debugfs_init' [-Wmissing-prototypes] =20
> > > >     1326 | void panthor_debugfs_init(struct drm_minor *minor)
> > > >          |      ^~~~~~~~~~~~~~~~~~~~
> > > > --
> > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_pr=
ocess_fatal_event_locked': =20
> > > > >> drivers/gpu/drm/panthor/panthor_sched.c:1233:37: warning: variab=
le 'csg_iface' set but not used [-Wunused-but-set-variable] =20
> > > >     1233 |         struct panthor_fw_cs_iface *csg_iface;
> > > >          |                                     ^~~~~~~~~
> > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_pr=
ocess_tiler_oom_event_locked': =20
> > > > >> drivers/gpu/drm/panthor/panthor_sched.c:1321:13: warning: variab=
le 'info' set but not used [-Wunused-but-set-variable] =20
> > > >     1321 |         u64 info, heap_address, new_chunk_va;
> > > >          |             ^~~~ =20
> > > > >> drivers/gpu/drm/panthor/panthor_sched.c:1319:13: warning: variab=
le 'fault' set but not used [-Wunused-but-set-variable] =20
> > > >     1319 |         u32 fault, vt_start, vt_end, frag_end;
> > > >          |             ^~~~~ =20
> > > > >> drivers/gpu/drm/panthor/panthor_sched.c:1318:31: warning: variab=
le 'queue' set but not used [-Wunused-but-set-variable] =20
> > > >     1318 |         struct panthor_queue *queue;
> > > >          |                               ^~~~~
> > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'tick_ctx_a=
pply':
> > > >    drivers/gpu/drm/panthor/panthor_sched.c:1983:54: warning: variab=
le 'csg_iface' set but not used [-Wunused-but-set-variable]
> > > >     1983 |                         struct panthor_fw_csg_iface *csg=
_iface;
> > > >          |                                                      ^~~=
~~~~~~
> > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_sc=
hed_suspend': =20
> > > > >> drivers/gpu/drm/panthor/panthor_sched.c:2481:13: warning: variab=
le 'ret' set but not used [-Wunused-but-set-variable] =20
> > > >     2481 |         int ret;
> > > >          |             ^~~
> > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'group_crea=
te_queue':
> > > >    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: error: 'DRM_SCH=
ED_POLICY_SINGLE_ENTITY' undeclared (first use in this function)
> > > >     2927 |                              NULL, "panthor-queue", DRM_=
SCHED_POLICY_SINGLE_ENTITY,
> > > >          |                                                     ^~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: note: each unde=
clared identifier is reported only once for each function it appears in
> > > >    drivers/gpu/drm/panthor/panthor_sched.c:2926:49: warning: passin=
g argument 7 of 'drm_sched_init' makes integer from pointer without a cast =
[-Wint-conversion]
> > > >     2926 |                              group->ptdev->reset.wq,
> > > >          |                              ~~~~~~~~~~~~~~~~~~~^~~
> > > >          |                                                 |
> > > >          |                                                 struct w=
orkqueue_struct *
> > > >    In file included from drivers/gpu/drm/panthor/panthor_sched.c:9:
> > > >    include/drm/gpu_scheduler.h:533:25: note: expected 'long int' bu=
t argument is of type 'struct workqueue_struct *'
> > > >      533 |                    long timeout, struct workqueue_struct=
 *timeout_wq,
> > > >          |                    ~~~~~^~~~~~~
> > > >    drivers/gpu/drm/panthor/panthor_sched.c:2927:36: error: passing =
argument 9 of 'drm_sched_init' from incompatible pointer type [-Werror=3Din=
compatible-pointer-types]
> > > >     2927 |                              NULL, "panthor-queue", DRM_=
SCHED_POLICY_SINGLE_ENTITY,
> > > >          |                                    ^~~~~~~~~~~~~~~
> > > >          |                                    |
> > > >          |                                    char *
> > > >    include/drm/gpu_scheduler.h:534:30: note: expected 'atomic_t *' =
but argument is of type 'char *'
> > > >      534 |                    atomic_t *score, const char *name, st=
ruct device *dev);
> > > >          |                    ~~~~~~~~~~^~~~~
> > > >    cc1: some warnings being treated as errors
> > > > -- =20
> > > > >> drivers/gpu/drm/panthor/panthor_devfreq.c:43: warning: Function =
parameter or member 'lock' not described in 'panthor_devfreq' =20
> > > > -- =20
> > > > >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Function par=
ameter or member 'ddev' not described in 'panthor_gem_create_object'
> > > > >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Excess funct=
ion parameter 'dev' description in 'panthor_gem_create_object' =20
> > > > -- =20
> > > > >> drivers/gpu/drm/panthor/panthor_heap.c:339: warning: Function pa=
rameter or member 'new_chunk_gpu_va' not described in 'panthor_heap_grow' =
=20
> > > > -- =20
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:52: warning: Function para=
meter or member 'product_major' not described in 'panthor_model'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function para=
meter or member '_name' not described in 'GPU_MODEL'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function para=
meter or member '_arch_major' not described in 'GPU_MODEL'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function para=
meter or member '_product_major' not described in 'GPU_MODEL'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:168: warning: Function par=
ameter or member 'ptdev' not described in 'panthor_gpu_unplug'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Function par=
ameter or member 'timeout_us' not described in 'panthor_gpu_block_power_off'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Excess funct=
ion parameter 'timeout_ms' description in 'panthor_gpu_block_power_off'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function par=
ameter or member 'rdy_reg' not described in 'panthor_gpu_block_power_on'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function par=
ameter or member 'timeout_us' not described in 'panthor_gpu_block_power_on'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Excess funct=
ion parameter 'timeout_ms' description in 'panthor_gpu_block_power_on'
> > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:472: warning: Function par=
ameter or member 'ptdev' not described in 'panthor_gpu_resume' =20
> > > > -- =20
> > > > >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Function para=
meter or member 'obj_size' not described in 'panthor_get_uobj_array'
> > > > >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Excess functi=
on parameter 'obj_kernel' description in 'panthor_get_uobj_array'
> > > > >> drivers/gpu/drm/panthor/panthor_drv.c:268: warning: Function par=
ameter or member 'syncops' not described in 'panthor_job_ctx'
> > > > >> drivers/gpu/drm/panthor/panthor_drv.c:732: warning: Function par=
ameter or member 'job_put' not described in 'panthor_submit_ctx_cleanup'
> > > > >> drivers/gpu/drm/panthor/panthor_drv.c:1406: warning: Cannot unde=
rstand  * @cleanup_wq: Workqueue used to cleanup stuff. =20
> > > >     on line 1406 - I thought it was a doc line
> > > > -- =20
> > > > >> drivers/gpu/drm/panthor/panthor_fw.c:293: warning: expecting pro=
totype for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_csg=
_iface() instead
> > > > >> drivers/gpu/drm/panthor/panthor_fw.c:310: warning: expecting pro=
totype for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_cs_=
iface() instead
> > > > >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function para=
meter or member 'input_fw_va' not described in 'panthor_fw_alloc_queue_ifac=
e_mem'
> > > > >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function para=
meter or member 'output_fw_va' not described in 'panthor_fw_alloc_queue_ifa=
ce_mem'
> > > > >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: Function par=
ameter or member 'csg_slot' not described in 'panthor_fw_csg_wait_acks'
> > > > >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: expecting pr=
ototype for panthor_fw_glb_wait_acks(). Prototype was for panthor_fw_csg_wa=
it_acks() instead =20
> > > >=20
> > > >=20
> > > > vim +/panthor_debugfs_init +1326 drivers/gpu/drm/panthor/panthor_dr=
v.c
> > > >=20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1324 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1325  #ifdef CONFIG_DEBU=
G_FS
> > > > 560b6916e77920 Boris Brezillon 2023-08-09 @1326  void panthor_debug=
fs_init(struct drm_minor *minor)
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1327  {
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1328  	panthor_mmu_debug=
fs_init(minor);
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1329  }
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1330  #endif
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1331 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1332  /*
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1333   * PanCSF driver v=
ersion:
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1334   * - 1.0 - initial=
 interface
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1335   */
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1336  static const struc=
t drm_driver panthor_drm_driver =3D {
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1337  	.driver_features =
=3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1338  			   DRIVER_SYNCO=
BJ_TIMELINE | DRIVER_GEM_GPUVA,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1339  	.open =3D panthor=
_open,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1340  	.postclose =3D pa=
nthor_postclose,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1341  	.ioctls =3D panth=
or_drm_driver_ioctls,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1342  	.num_ioctls =3D A=
RRAY_SIZE(panthor_drm_driver_ioctls),
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1343  	.fops =3D &pantho=
r_drm_driver_fops,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1344  	.name =3D "pantho=
r",
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1345  	.desc =3D "Pantho=
r DRM driver",
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1346  	.date =3D "202308=
01",
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1347  	.major =3D 1,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1348  	.minor =3D 0,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1349 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1350  	.gem_create_objec=
t =3D panthor_gem_create_object,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1351  	.gem_prime_import=
_sg_table =3D drm_gem_shmem_prime_import_sg_table,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1352  #ifdef CONFIG_DEBU=
G_FS
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1353  	.debugfs_init =3D=
 panthor_debugfs_init,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1354  #endif
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1355  };
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1356 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1357  static int panthor=
_probe(struct platform_device *pdev)
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1358  {
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1359  	struct panthor_de=
vice *ptdev;
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1360  	int ret;
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1361 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1362  	ptdev =3D devm_dr=
m_dev_alloc(&pdev->dev, &panthor_drm_driver,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1363  				   struct pant=
hor_device, base);
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1364  	if (!ptdev)
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1365  		return -ENOMEM;
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1366 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1367  	platform_set_drvd=
ata(pdev, ptdev);
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1368 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1369  	ret =3D panthor_d=
evice_init(ptdev);
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1370  	if (ret)
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1371  		return ret;
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1372 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1373  	return drm_dev_re=
gister(&ptdev->base, 0);
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1374  }
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1375 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1376  static void pantho=
r_remove(struct platform_device *pdev)
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1377  {
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1378  	struct panthor_de=
vice *ptdev =3D platform_get_drvdata(pdev);
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1379 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1380  	panthor_device_un=
plug(ptdev);
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1381  }
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1382 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1383  static const struc=
t of_device_id dt_match[] =3D {
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1384  	{ .compatible =3D=
 "rockchip,rk3588-mali" },
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1385  	{ .compatible =3D=
 "arm,mali-valhall-csf" },
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1386  	{}
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1387  };
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1388  MODULE_DEVICE_TABL=
E(of, dt_match);
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1389 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1390  static DEFINE_RUNT=
IME_DEV_PM_OPS(panthor_pm_ops,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1391  				 panthor_devic=
e_suspend,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1392  				 panthor_devic=
e_resume,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1393  				 NULL);
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1394 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1395  static struct plat=
form_driver panthor_driver =3D {
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1396  	.probe =3D pantho=
r_probe,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1397  	.remove_new =3D p=
anthor_remove,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1398  	.driver =3D {
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1399  		.name =3D "panth=
or",
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1400  		.pm =3D &panthor=
_pm_ops,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1401  		.of_match_table =
=3D dt_match,
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1402  	},
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1403  };
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1404 =20
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1405  /**
> > > > 560b6916e77920 Boris Brezillon 2023-08-09 @1406   * @cleanup_wq: Wo=
rkqueue used to cleanup stuff.
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1407   *
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1408   * We create a ded=
icated workqueue so we can drain on unplug and
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1409   * make sure all r=
esources are freed before the module is unloaded.
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1410   */
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1411  struct workqueue_s=
truct *panthor_cleanup_wq;
> > > > 560b6916e77920 Boris Brezillon 2023-08-09  1412 =20
> > > >=20
> > > > :::::: The code at line 1326 was first introduced by commit
> > > > :::::: 560b6916e779201356a8db10cec8dc5183d9fe5f drm/panthor: Add th=
e driver frontend block
> > > >=20
> > > > :::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
> > > > :::::: CC: Heiko Stuebner <heiko@sntech.de>
> > > >=20
> > > >  =20
> > >=20
> > >=20
> > >=20
> > >=20
> >=20
> >=20
>=20




