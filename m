Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AA12BD01
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n/XFfBWv"
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BEBED6607322;
	Fri, 10 Nov 2023 19:21:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699644062;
	bh=1EAckw132PlIWds/3iTqNZePwLPzgYhcw596NAFPej4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n/XFfBWvCo1Jc7H1C1TvlBWjrYlPKyJKRMKYXTzuUmYqZR9KEqXhzWS2KbZCQzZQy
	 AdqXQ3XZbuKf99w27YgwP1A3TapHn4ZI/tBqvSq6wEB11X0e1rQTyGXvMFtrRjxeLK
	 AXdZhfigzDybYpHW1fsN9DUBrIfOIX765zM/v6DnF9B6D9NR70arxo6G4qlKK+nG26
	 0Xoznb9aktv4NsSurZ+J46cHrWac+lwV/FukOKUCKRDoDpd5iWgKbLrvl+E99crE5t
	 xxoroJivFc+bmp3f5l2IOb7bf9dhazx34/B6V+uXhtE73KcInKBpeZy03xdBATOoBE
	 yd/dtfZDJQtYw==
Date: Fri, 10 Nov 2023 20:20:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: kernel test robot <lkp@intel.com>, Boris Brezillon
 <bbrezillon@kernel.org>, oe-kbuild-all@lists.linux.dev, Steven Price
 <steven.price@arm.com>
Subject: Re: [mmind-rockchip:dev/panthor 36/41]
 drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previous
 prototype for 'panthor_debugfs_init'
Message-ID: <20231110202058.1c05283a@collabora.com>
In-Reply-To: <3931875.atdPhlSkOF@diego>
References: <202311110058.uP4Vh1gN-lkp@intel.com>
	<3931875.atdPhlSkOF@diego>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Nov 2023 18:21:05 +0100
Heiko St=C3=BCbner <heiko@sntech.de> wrote:

> Hi kernel-test-robot,
>=20
> please don't build-test my github kernel repository.
>=20
> I've never enabled anything for this, so I don't even know how it made it
> in some build-test-list.
>=20
> This is really only my dumping ground for work-in-progress or test code.
> Case in point, I just wanted to play around with the panthor patches, not
> cause email messages for Boris.

No worries. Actually, that's good to know I have a few more things to
fix (probably a weird combination of options being enabled/disabled
leading to unused functions/variables).

Not trying to say kernel-test-bot should scan your tree, but those
information are useful to me ;-).

Regards,

Boris

>=20
>=20
> Thanks a lot
> Heiko
>=20
> Am Freitag, 10. November 2023, 18:04:14 CET schrieb kernel test robot:
> > Hi Boris,
> >=20
> > First bad commit (maybe !=3D root cause):
> >=20
> > tree:   https://github.com/mmind/linux-rockchip dev/panthor
> > head:   ef8d76d568fba69012333ce6e9d7cce4aebbb2da
> > commit: 86d43fb902f5db2a81e432041864dd7523314c70 [36/41] drm/panthor: A=
llow driver compilation
> > config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/202=
31111/202311110058.uP4Vh1gN-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20231111/202311110058.uP4Vh1gN-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202311110058.uP4Vh1gN-l=
kp@intel.com/
> >=20
> > All warnings (new ones prefixed by >>):
> >  =20
> > >> drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previous p=
rototype for 'panthor_debugfs_init' [-Wmissing-prototypes] =20
> >     1326 | void panthor_debugfs_init(struct drm_minor *minor)
> >          |      ^~~~~~~~~~~~~~~~~~~~
> > --
> >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_proces=
s_fatal_event_locked': =20
> > >> drivers/gpu/drm/panthor/panthor_sched.c:1233:37: warning: variable '=
csg_iface' set but not used [-Wunused-but-set-variable] =20
> >     1233 |         struct panthor_fw_cs_iface *csg_iface;
> >          |                                     ^~~~~~~~~
> >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_proces=
s_tiler_oom_event_locked': =20
> > >> drivers/gpu/drm/panthor/panthor_sched.c:1321:13: warning: variable '=
info' set but not used [-Wunused-but-set-variable] =20
> >     1321 |         u64 info, heap_address, new_chunk_va;
> >          |             ^~~~ =20
> > >> drivers/gpu/drm/panthor/panthor_sched.c:1319:13: warning: variable '=
fault' set but not used [-Wunused-but-set-variable] =20
> >     1319 |         u32 fault, vt_start, vt_end, frag_end;
> >          |             ^~~~~ =20
> > >> drivers/gpu/drm/panthor/panthor_sched.c:1318:31: warning: variable '=
queue' set but not used [-Wunused-but-set-variable] =20
> >     1318 |         struct panthor_queue *queue;
> >          |                               ^~~~~
> >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'tick_ctx_apply=
':
> >    drivers/gpu/drm/panthor/panthor_sched.c:1983:54: warning: variable '=
csg_iface' set but not used [-Wunused-but-set-variable]
> >     1983 |                         struct panthor_fw_csg_iface *csg_ifa=
ce;
> >          |                                                      ^~~~~~~=
~~
> >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_sched_=
suspend': =20
> > >> drivers/gpu/drm/panthor/panthor_sched.c:2481:13: warning: variable '=
ret' set but not used [-Wunused-but-set-variable] =20
> >     2481 |         int ret;
> >          |             ^~~
> >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'group_create_q=
ueue':
> >    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: error: 'DRM_SCHED_P=
OLICY_SINGLE_ENTITY' undeclared (first use in this function)
> >     2927 |                              NULL, "panthor-queue", DRM_SCHE=
D_POLICY_SINGLE_ENTITY,
> >          |                                                     ^~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: note: each undeclar=
ed identifier is reported only once for each function it appears in
> >    drivers/gpu/drm/panthor/panthor_sched.c:2926:49: warning: passing ar=
gument 7 of 'drm_sched_init' makes integer from pointer without a cast [-Wi=
nt-conversion]
> >     2926 |                              group->ptdev->reset.wq,
> >          |                              ~~~~~~~~~~~~~~~~~~~^~~
> >          |                                                 |
> >          |                                                 struct workq=
ueue_struct *
> >    In file included from drivers/gpu/drm/panthor/panthor_sched.c:9:
> >    include/drm/gpu_scheduler.h:533:25: note: expected 'long int' but ar=
gument is of type 'struct workqueue_struct *'
> >      533 |                    long timeout, struct workqueue_struct *ti=
meout_wq,
> >          |                    ~~~~~^~~~~~~
> >    drivers/gpu/drm/panthor/panthor_sched.c:2927:36: error: passing argu=
ment 9 of 'drm_sched_init' from incompatible pointer type [-Werror=3Dincomp=
atible-pointer-types]
> >     2927 |                              NULL, "panthor-queue", DRM_SCHE=
D_POLICY_SINGLE_ENTITY,
> >          |                                    ^~~~~~~~~~~~~~~
> >          |                                    |
> >          |                                    char *
> >    include/drm/gpu_scheduler.h:534:30: note: expected 'atomic_t *' but =
argument is of type 'char *'
> >      534 |                    atomic_t *score, const char *name, struct=
 device *dev);
> >          |                    ~~~~~~~~~~^~~~~
> >    cc1: some warnings being treated as errors
> > -- =20
> > >> drivers/gpu/drm/panthor/panthor_devfreq.c:43: warning: Function para=
meter or member 'lock' not described in 'panthor_devfreq' =20
> > -- =20
> > >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Function paramet=
er or member 'ddev' not described in 'panthor_gem_create_object'
> > >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Excess function =
parameter 'dev' description in 'panthor_gem_create_object' =20
> > -- =20
> > >> drivers/gpu/drm/panthor/panthor_heap.c:339: warning: Function parame=
ter or member 'new_chunk_gpu_va' not described in 'panthor_heap_grow' =20
> > -- =20
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:52: warning: Function paramete=
r or member 'product_major' not described in 'panthor_model'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function paramete=
r or member '_name' not described in 'GPU_MODEL'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function paramete=
r or member '_arch_major' not described in 'GPU_MODEL'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function paramete=
r or member '_product_major' not described in 'GPU_MODEL'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:168: warning: Function paramet=
er or member 'ptdev' not described in 'panthor_gpu_unplug'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Function paramet=
er or member 'timeout_us' not described in 'panthor_gpu_block_power_off'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Excess function =
parameter 'timeout_ms' description in 'panthor_gpu_block_power_off'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function paramet=
er or member 'rdy_reg' not described in 'panthor_gpu_block_power_on'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function paramet=
er or member 'timeout_us' not described in 'panthor_gpu_block_power_on'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Excess function =
parameter 'timeout_ms' description in 'panthor_gpu_block_power_on'
> > >> drivers/gpu/drm/panthor/panthor_gpu.c:472: warning: Function paramet=
er or member 'ptdev' not described in 'panthor_gpu_resume' =20
> > -- =20
> > >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Function paramete=
r or member 'obj_size' not described in 'panthor_get_uobj_array'
> > >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Excess function p=
arameter 'obj_kernel' description in 'panthor_get_uobj_array'
> > >> drivers/gpu/drm/panthor/panthor_drv.c:268: warning: Function paramet=
er or member 'syncops' not described in 'panthor_job_ctx'
> > >> drivers/gpu/drm/panthor/panthor_drv.c:732: warning: Function paramet=
er or member 'job_put' not described in 'panthor_submit_ctx_cleanup'
> > >> drivers/gpu/drm/panthor/panthor_drv.c:1406: warning: Cannot understa=
nd  * @cleanup_wq: Workqueue used to cleanup stuff. =20
> >     on line 1406 - I thought it was a doc line
> > -- =20
> > >> drivers/gpu/drm/panthor/panthor_fw.c:293: warning: expecting prototy=
pe for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_csg_ifa=
ce() instead
> > >> drivers/gpu/drm/panthor/panthor_fw.c:310: warning: expecting prototy=
pe for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_cs_ifac=
e() instead
> > >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function paramete=
r or member 'input_fw_va' not described in 'panthor_fw_alloc_queue_iface_me=
m'
> > >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function paramete=
r or member 'output_fw_va' not described in 'panthor_fw_alloc_queue_iface_m=
em'
> > >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: Function paramet=
er or member 'csg_slot' not described in 'panthor_fw_csg_wait_acks'
> > >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: expecting protot=
ype for panthor_fw_glb_wait_acks(). Prototype was for panthor_fw_csg_wait_a=
cks() instead =20
> >=20
> >=20
> > vim +/panthor_debugfs_init +1326 drivers/gpu/drm/panthor/panthor_drv.c
> >=20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1324 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1325  #ifdef CONFIG_DEBUG_FS
> > 560b6916e77920 Boris Brezillon 2023-08-09 @1326  void panthor_debugfs_i=
nit(struct drm_minor *minor)
> > 560b6916e77920 Boris Brezillon 2023-08-09  1327  {
> > 560b6916e77920 Boris Brezillon 2023-08-09  1328  	panthor_mmu_debugfs_i=
nit(minor);
> > 560b6916e77920 Boris Brezillon 2023-08-09  1329  }
> > 560b6916e77920 Boris Brezillon 2023-08-09  1330  #endif
> > 560b6916e77920 Boris Brezillon 2023-08-09  1331 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1332  /*
> > 560b6916e77920 Boris Brezillon 2023-08-09  1333   * PanCSF driver versi=
on:
> > 560b6916e77920 Boris Brezillon 2023-08-09  1334   * - 1.0 - initial int=
erface
> > 560b6916e77920 Boris Brezillon 2023-08-09  1335   */
> > 560b6916e77920 Boris Brezillon 2023-08-09  1336  static const struct dr=
m_driver panthor_drm_driver =3D {
> > 560b6916e77920 Boris Brezillon 2023-08-09  1337  	.driver_features =3D =
DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> > 560b6916e77920 Boris Brezillon 2023-08-09  1338  			   DRIVER_SYNCOBJ_T=
IMELINE | DRIVER_GEM_GPUVA,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1339  	.open =3D panthor_ope=
n,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1340  	.postclose =3D pantho=
r_postclose,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1341  	.ioctls =3D panthor_d=
rm_driver_ioctls,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1342  	.num_ioctls =3D ARRAY=
_SIZE(panthor_drm_driver_ioctls),
> > 560b6916e77920 Boris Brezillon 2023-08-09  1343  	.fops =3D &panthor_dr=
m_driver_fops,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1344  	.name =3D "panthor",
> > 560b6916e77920 Boris Brezillon 2023-08-09  1345  	.desc =3D "Panthor DR=
M driver",
> > 560b6916e77920 Boris Brezillon 2023-08-09  1346  	.date =3D "20230801",
> > 560b6916e77920 Boris Brezillon 2023-08-09  1347  	.major =3D 1,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1348  	.minor =3D 0,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1349 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1350  	.gem_create_object =
=3D panthor_gem_create_object,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1351  	.gem_prime_import_sg_=
table =3D drm_gem_shmem_prime_import_sg_table,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1352  #ifdef CONFIG_DEBUG_FS
> > 560b6916e77920 Boris Brezillon 2023-08-09  1353  	.debugfs_init =3D pan=
thor_debugfs_init,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1354  #endif
> > 560b6916e77920 Boris Brezillon 2023-08-09  1355  };
> > 560b6916e77920 Boris Brezillon 2023-08-09  1356 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1357  static int panthor_pro=
be(struct platform_device *pdev)
> > 560b6916e77920 Boris Brezillon 2023-08-09  1358  {
> > 560b6916e77920 Boris Brezillon 2023-08-09  1359  	struct panthor_device=
 *ptdev;
> > 560b6916e77920 Boris Brezillon 2023-08-09  1360  	int ret;
> > 560b6916e77920 Boris Brezillon 2023-08-09  1361 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1362  	ptdev =3D devm_drm_de=
v_alloc(&pdev->dev, &panthor_drm_driver,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1363  				   struct panthor_=
device, base);
> > 560b6916e77920 Boris Brezillon 2023-08-09  1364  	if (!ptdev)
> > 560b6916e77920 Boris Brezillon 2023-08-09  1365  		return -ENOMEM;
> > 560b6916e77920 Boris Brezillon 2023-08-09  1366 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1367  	platform_set_drvdata(=
pdev, ptdev);
> > 560b6916e77920 Boris Brezillon 2023-08-09  1368 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1369  	ret =3D panthor_devic=
e_init(ptdev);
> > 560b6916e77920 Boris Brezillon 2023-08-09  1370  	if (ret)
> > 560b6916e77920 Boris Brezillon 2023-08-09  1371  		return ret;
> > 560b6916e77920 Boris Brezillon 2023-08-09  1372 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1373  	return drm_dev_regist=
er(&ptdev->base, 0);
> > 560b6916e77920 Boris Brezillon 2023-08-09  1374  }
> > 560b6916e77920 Boris Brezillon 2023-08-09  1375 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1376  static void panthor_re=
move(struct platform_device *pdev)
> > 560b6916e77920 Boris Brezillon 2023-08-09  1377  {
> > 560b6916e77920 Boris Brezillon 2023-08-09  1378  	struct panthor_device=
 *ptdev =3D platform_get_drvdata(pdev);
> > 560b6916e77920 Boris Brezillon 2023-08-09  1379 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1380  	panthor_device_unplug=
(ptdev);
> > 560b6916e77920 Boris Brezillon 2023-08-09  1381  }
> > 560b6916e77920 Boris Brezillon 2023-08-09  1382 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1383  static const struct of=
_device_id dt_match[] =3D {
> > 560b6916e77920 Boris Brezillon 2023-08-09  1384  	{ .compatible =3D "ro=
ckchip,rk3588-mali" },
> > 560b6916e77920 Boris Brezillon 2023-08-09  1385  	{ .compatible =3D "ar=
m,mali-valhall-csf" },
> > 560b6916e77920 Boris Brezillon 2023-08-09  1386  	{}
> > 560b6916e77920 Boris Brezillon 2023-08-09  1387  };
> > 560b6916e77920 Boris Brezillon 2023-08-09  1388  MODULE_DEVICE_TABLE(of=
, dt_match);
> > 560b6916e77920 Boris Brezillon 2023-08-09  1389 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1390  static DEFINE_RUNTIME_=
DEV_PM_OPS(panthor_pm_ops,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1391  				 panthor_device_su=
spend,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1392  				 panthor_device_re=
sume,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1393  				 NULL);
> > 560b6916e77920 Boris Brezillon 2023-08-09  1394 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1395  static struct platform=
_driver panthor_driver =3D {
> > 560b6916e77920 Boris Brezillon 2023-08-09  1396  	.probe =3D panthor_pr=
obe,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1397  	.remove_new =3D panth=
or_remove,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1398  	.driver =3D {
> > 560b6916e77920 Boris Brezillon 2023-08-09  1399  		.name =3D "panthor",
> > 560b6916e77920 Boris Brezillon 2023-08-09  1400  		.pm =3D &panthor_pm_=
ops,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1401  		.of_match_table =3D =
dt_match,
> > 560b6916e77920 Boris Brezillon 2023-08-09  1402  	},
> > 560b6916e77920 Boris Brezillon 2023-08-09  1403  };
> > 560b6916e77920 Boris Brezillon 2023-08-09  1404 =20
> > 560b6916e77920 Boris Brezillon 2023-08-09  1405  /**
> > 560b6916e77920 Boris Brezillon 2023-08-09 @1406   * @cleanup_wq: Workqu=
eue used to cleanup stuff.
> > 560b6916e77920 Boris Brezillon 2023-08-09  1407   *
> > 560b6916e77920 Boris Brezillon 2023-08-09  1408   * We create a dedicat=
ed workqueue so we can drain on unplug and
> > 560b6916e77920 Boris Brezillon 2023-08-09  1409   * make sure all resou=
rces are freed before the module is unloaded.
> > 560b6916e77920 Boris Brezillon 2023-08-09  1410   */
> > 560b6916e77920 Boris Brezillon 2023-08-09  1411  struct workqueue_struc=
t *panthor_cleanup_wq;
> > 560b6916e77920 Boris Brezillon 2023-08-09  1412 =20
> >=20
> > :::::: The code at line 1326 was first introduced by commit
> > :::::: 560b6916e779201356a8db10cec8dc5183d9fe5f drm/panthor: Add the dr=
iver frontend block
> >=20
> > :::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
> > :::::: CC: Heiko Stuebner <heiko@sntech.de>
> >=20
> >  =20
>=20
>=20
>=20
>=20

