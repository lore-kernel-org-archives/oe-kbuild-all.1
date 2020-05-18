Content-Type: multipart/mixed; boundary="===============6936682659142207110=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/iommu/exynos-iommu.c:673:54: error: 'struct dev_archdata' has no member named 'iommu'
Date: Mon, 18 May 2020 14:16:19 +0800
Message-ID: <202005181412.frC4juFy%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6936682659142207110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
commit: e93a1695d7fb551376b1c1220a267d032b6ad159 iommu: Enable compile test=
ing for some of drivers
date:   3 months ago
config: ia64-randconfig-s001-20200518 (attached as .config)
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout e93a1695d7fb551376b1c1220a267d032b6ad159
        # save the attached .config to linux build tree
        make C=3D1 ARCH=3Dia64 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/iommu/exynos-iommu.c: In function 'exynos_sysmmu_suspend':
>> drivers/iommu/exynos-iommu.c:673:54: error: 'struct dev_archdata' has no=
 member named 'iommu'
673 |   struct exynos_iommu_owner *owner =3D master->archdata.iommu;
|                                                      ^
drivers/iommu/exynos-iommu.c: In function 'exynos_sysmmu_resume':
drivers/iommu/exynos-iommu.c:691:54: error: 'struct dev_archdata' has no me=
mber named 'iommu'
691 |   struct exynos_iommu_owner *owner =3D master->archdata.iommu;
|                                                      ^
drivers/iommu/exynos-iommu.c: In function 'exynos_iommu_detach_device':
drivers/iommu/exynos-iommu.c:840:50: error: 'struct dev_archdata' has no me=
mber named 'iommu'
840 |  struct exynos_iommu_owner *owner =3D dev->archdata.iommu;
|                                                  ^
drivers/iommu/exynos-iommu.c:176:40: error: 'struct dev_archdata' has no me=
mber named 'iommu'
176 | #define has_sysmmu(dev)  (dev->archdata.iommu !=3D NULL)
|                                        ^
>> drivers/iommu/exynos-iommu.c:846:7: note: in expansion of macro 'has_sys=
mmu'
846 |  if (!has_sysmmu(dev) || owner->domain !=3D iommu_domain)
|       ^~~~~~~~~~
drivers/iommu/exynos-iommu.c: In function 'exynos_iommu_attach_device':
drivers/iommu/exynos-iommu.c:878:50: error: 'struct dev_archdata' has no me=
mber named 'iommu'
878 |  struct exynos_iommu_owner *owner =3D dev->archdata.iommu;
|                                                  ^
drivers/iommu/exynos-iommu.c:176:40: error: 'struct dev_archdata' has no me=
mber named 'iommu'
176 | #define has_sysmmu(dev)  (dev->archdata.iommu !=3D NULL)
|                                        ^
drivers/iommu/exynos-iommu.c:884:7: note: in expansion of macro 'has_sysmmu'
884 |  if (!has_sysmmu(dev))
|       ^~~~~~~~~~
drivers/iommu/exynos-iommu.c: In function 'exynos_iommu_add_device':
drivers/iommu/exynos-iommu.c:1240:50: error: 'struct dev_archdata' has no m=
ember named 'iommu'
1240 |  struct exynos_iommu_owner *owner =3D dev->archdata.iommu;
|                                                  ^
drivers/iommu/exynos-iommu.c:176:40: error: 'struct dev_archdata' has no me=
mber named 'iommu'
176 | #define has_sysmmu(dev)  (dev->archdata.iommu !=3D NULL)
|                                        ^
drivers/iommu/exynos-iommu.c:1244:7: note: in expansion of macro 'has_sysmm=
u'
1244 |  if (!has_sysmmu(dev))
|       ^~~~~~~~~~
drivers/iommu/exynos-iommu.c: In function 'exynos_iommu_remove_device':
drivers/iommu/exynos-iommu.c:1269:50: error: 'struct dev_archdata' has no m=
ember named 'iommu'
1269 |  struct exynos_iommu_owner *owner =3D dev->archdata.iommu;
|                                                  ^
drivers/iommu/exynos-iommu.c:176:40: error: 'struct dev_archdata' has no me=
mber named 'iommu'
176 | #define has_sysmmu(dev)  (dev->archdata.iommu !=3D NULL)
|                                        ^
drivers/iommu/exynos-iommu.c:1272:7: note: in expansion of macro 'has_sysmm=
u'
1272 |  if (!has_sysmmu(dev))
|       ^~~~~~~~~~
drivers/iommu/exynos-iommu.c: In function 'exynos_iommu_of_xlate':
drivers/iommu/exynos-iommu.c:1294:50: error: 'struct dev_archdata' has no m=
ember named 'iommu'
1294 |  struct exynos_iommu_owner *owner =3D dev->archdata.iommu;
|                                                  ^
drivers/iommu/exynos-iommu.c:1312:16: error: 'struct dev_archdata' has no m=
ember named 'iommu'
1312 |   dev->archdata.iommu =3D owner;
|                ^

sparse warnings: (new ones prefixed by >>)

   drivers/iommu/exynos-iommu.c:673:68: sparse: sparse: using member 'iommu=
' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:691:68: sparse: sparse: using member 'iommu=
' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:840:57: sparse: sparse: using member 'iommu=
' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:846:14: sparse: sparse: using member 'iommu=
' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:878:57: sparse: sparse: using member 'iommu=
' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:884:14: sparse: sparse: using member 'iommu=
' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:1240:57: sparse: sparse: using member 'iomm=
u' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:1244:14: sparse: sparse: using member 'iomm=
u' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:1269:57: sparse: sparse: using member 'iomm=
u' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:1272:14: sparse: sparse: using member 'iomm=
u' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:1294:57: sparse: sparse: using member 'iomm=
u' in incomplete struct dev_archdata
   drivers/iommu/exynos-iommu.c:1312:30: sparse: sparse: using member 'iomm=
u' in incomplete struct dev_archdata
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@    expected unsigned int [usertype] value @=
@    got restrunsigned int [usertype] value @@
   include/asm-generic/io.h:225:22: sparse:    expected unsigned int [usert=
ype] value
   include/asm-generic/io.h:225:22: sparse:    got restricted __le32 [usert=
ype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse: sparse: incorrect type in a=
ssignment (different base types) @@    expected unsigned int [usertype] @@ =
   got restrunsigned int [usertype] @@
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    expected unsigned int [u=
sertype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    got restricted __le32 [u=
sertype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse: sparse: incorrect type in a=
ssignment (different base types) @@    expected unsigned int [usertype] @@ =
   got restrunsigned int [usertype] @@
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    expected unsigned int [u=
sertype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    got restricted __le32 [u=
sertype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse: sparse: incorrect type in a=
ssignment (different base types) @@    expected unsigned int [usertype] @@ =
   got restrunsigned int [usertype] @@
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    expected unsigned int [u=
sertype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    got restricted __le32 [u=
sertype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse: sparse: incorrect type in a=
ssignment (different base types) @@    expected unsigned int [usertype] @@ =
   got restrunsigned int [usertype] @@
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    expected unsigned int [u=
sertype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    got restricted __le32 [u=
sertype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse: sparse: incorrect type in a=
ssignment (different base types) @@    expected unsigned int [usertype] @@ =
   got restrunsigned int [usertype] @@
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    expected unsigned int [u=
sertype]
>> drivers/iommu/exynos-iommu.c:728:14: sparse:    got restricted __le32 [u=
sertype]

vim +673 drivers/iommu/exynos-iommu.c

2a96536e77b43c KyongHo Cho      2012-05-12  666  =

9b265536c27116 Marek Szyprowski 2016-11-14  667  static int __maybe_unused =
exynos_sysmmu_suspend(struct device *dev)
622015e407b082 Marek Szyprowski 2015-05-19  668  {
622015e407b082 Marek Szyprowski 2015-05-19  669  	struct sysmmu_drvdata *da=
ta =3D dev_get_drvdata(dev);
47a574fffca102 Marek Szyprowski 2016-11-14  670  	struct device *master =3D=
 data->master;
622015e407b082 Marek Szyprowski 2015-05-19  671  =

47a574fffca102 Marek Szyprowski 2016-11-14  672  	if (master) {
9b265536c27116 Marek Szyprowski 2016-11-14 @673  		struct exynos_iommu_owne=
r *owner =3D master->archdata.iommu;
9b265536c27116 Marek Szyprowski 2016-11-14  674  =

9b265536c27116 Marek Szyprowski 2016-11-14  675  		mutex_lock(&owner->rpm_l=
ock);
92798b4566b1ad Marek Szyprowski 2016-11-14  676  		if (data->domain) {
92798b4566b1ad Marek Szyprowski 2016-11-14  677  			dev_dbg(data->sysmmu, "=
saving state\n");
92798b4566b1ad Marek Szyprowski 2016-11-14  678  			__sysmmu_disable(data);
92798b4566b1ad Marek Szyprowski 2016-11-14  679  		}
9b265536c27116 Marek Szyprowski 2016-11-14  680  		mutex_unlock(&owner->rpm=
_lock);
622015e407b082 Marek Szyprowski 2015-05-19  681  	}
622015e407b082 Marek Szyprowski 2015-05-19  682  	return 0;
622015e407b082 Marek Szyprowski 2015-05-19  683  }
622015e407b082 Marek Szyprowski 2015-05-19  684  =

9b265536c27116 Marek Szyprowski 2016-11-14  685  static int __maybe_unused =
exynos_sysmmu_resume(struct device *dev)
622015e407b082 Marek Szyprowski 2015-05-19  686  {
622015e407b082 Marek Szyprowski 2015-05-19  687  	struct sysmmu_drvdata *da=
ta =3D dev_get_drvdata(dev);
47a574fffca102 Marek Szyprowski 2016-11-14  688  	struct device *master =3D=
 data->master;
622015e407b082 Marek Szyprowski 2015-05-19  689  =

47a574fffca102 Marek Szyprowski 2016-11-14  690  	if (master) {
9b265536c27116 Marek Szyprowski 2016-11-14  691  		struct exynos_iommu_owne=
r *owner =3D master->archdata.iommu;
9b265536c27116 Marek Szyprowski 2016-11-14  692  =

9b265536c27116 Marek Szyprowski 2016-11-14  693  		mutex_lock(&owner->rpm_l=
ock);
92798b4566b1ad Marek Szyprowski 2016-11-14  694  		if (data->domain) {
92798b4566b1ad Marek Szyprowski 2016-11-14  695  			dev_dbg(data->sysmmu, "=
restoring state\n");
47a574fffca102 Marek Szyprowski 2016-11-14  696  			__sysmmu_enable(data);
622015e407b082 Marek Szyprowski 2015-05-19  697  		}
9b265536c27116 Marek Szyprowski 2016-11-14  698  		mutex_unlock(&owner->rpm=
_lock);
92798b4566b1ad Marek Szyprowski 2016-11-14  699  	}
622015e407b082 Marek Szyprowski 2015-05-19  700  	return 0;
622015e407b082 Marek Szyprowski 2015-05-19  701  }
622015e407b082 Marek Szyprowski 2015-05-19  702  =

622015e407b082 Marek Szyprowski 2015-05-19  703  static const struct dev_pm=
_ops sysmmu_pm_ops =3D {
9b265536c27116 Marek Szyprowski 2016-11-14  704  	SET_RUNTIME_PM_OPS(exynos=
_sysmmu_suspend, exynos_sysmmu_resume, NULL)
2f5f44f205cc95 Marek Szyprowski 2016-11-14  705  	SET_SYSTEM_SLEEP_PM_OPS(p=
m_runtime_force_suspend,
9b265536c27116 Marek Szyprowski 2016-11-14  706  				pm_runtime_force_resum=
e)
622015e407b082 Marek Szyprowski 2015-05-19  707  };
622015e407b082 Marek Szyprowski 2015-05-19  708  =

9d25e3cc83d731 Marek Szyprowski 2017-10-09  709  static const struct of_dev=
ice_id sysmmu_of_match[] =3D {
6b21a5db36427d Cho KyongHo      2014-05-12  710  	{ .compatible	=3D "samsun=
g,exynos-sysmmu", },
6b21a5db36427d Cho KyongHo      2014-05-12  711  	{ },
6b21a5db36427d Cho KyongHo      2014-05-12  712  };
6b21a5db36427d Cho KyongHo      2014-05-12  713  =

6b21a5db36427d Cho KyongHo      2014-05-12  714  static struct platform_dri=
ver exynos_sysmmu_driver __refdata =3D {
2a96536e77b43c KyongHo Cho      2012-05-12  715  	.probe	=3D exynos_sysmmu_=
probe,
2a96536e77b43c KyongHo Cho      2012-05-12  716  	.driver	=3D {
2a96536e77b43c KyongHo Cho      2012-05-12  717  		.name		=3D "exynos-sysmm=
u",
6b21a5db36427d Cho KyongHo      2014-05-12  718  		.of_match_table	=3D sysm=
mu_of_match,
622015e407b082 Marek Szyprowski 2015-05-19  719  		.pm		=3D &sysmmu_pm_ops,
b54b874fbaf5e0 Marek Szyprowski 2016-05-20  720  		.suppress_bind_attrs =3D=
 true,
2a96536e77b43c KyongHo Cho      2012-05-12  721  	}
2a96536e77b43c KyongHo Cho      2012-05-12  722  };
2a96536e77b43c KyongHo Cho      2012-05-12  723  =

5e3435eb7e1d8c Marek Szyprowski 2016-02-18  724  static inline void update_=
pte(sysmmu_pte_t *ent, sysmmu_pte_t val)
2a96536e77b43c KyongHo Cho      2012-05-12  725  {
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  726  	dma_sync_single_for_cpu(d=
ma_dev, virt_to_phys(ent), sizeof(*ent),
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  727  				DMA_TO_DEVICE);
6ae5343c26f9cb Ben Dooks        2016-06-08 @728  	*ent =3D cpu_to_le32(val);
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  729  	dma_sync_single_for_devic=
e(dma_dev, virt_to_phys(ent), sizeof(*ent),
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  730  				   DMA_TO_DEVICE);
2a96536e77b43c KyongHo Cho      2012-05-12  731  }
2a96536e77b43c KyongHo Cho      2012-05-12  732  =

e1fd1eaa3323b3 Joerg Roedel     2015-03-26  733  static struct iommu_domain=
 *exynos_iommu_domain_alloc(unsigned type)
2a96536e77b43c KyongHo Cho      2012-05-12  734  {
bfa004893c55ea Marek Szyprowski 2015-05-19  735  	struct exynos_iommu_domai=
n *domain;
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  736  	dma_addr_t handle;
66a7ed84b345d6 Cho KyongHo      2014-05-12  737  	int i;
2a96536e77b43c KyongHo Cho      2012-05-12  738  =

740a01eee9ada9 Marek Szyprowski 2016-02-18  739  	/* Check if correct PTE o=
ffsets are initialized */
740a01eee9ada9 Marek Szyprowski 2016-02-18  740  	BUG_ON(PG_ENT_SHIFT < 0 |=
| !dma_dev);
e1fd1eaa3323b3 Joerg Roedel     2015-03-26  741  =

bfa004893c55ea Marek Szyprowski 2015-05-19  742  	domain =3D kzalloc(sizeof=
(*domain), GFP_KERNEL);
bfa004893c55ea Marek Szyprowski 2015-05-19  743  	if (!domain)
e1fd1eaa3323b3 Joerg Roedel     2015-03-26  744  		return NULL;
2a96536e77b43c KyongHo Cho      2012-05-12  745  =

58c6f6a3dc97ed Marek Szyprowski 2016-02-18  746  	if (type =3D=3D IOMMU_DOM=
AIN_DMA) {
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  747  		if (iommu_get_dma_cookie=
(&domain->domain) !=3D 0)
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  748  			goto err_pgtable;
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  749  	} else if (type !=3D IOMM=
U_DOMAIN_UNMANAGED) {
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  750  		goto err_pgtable;
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  751  	}
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  752  =

bfa004893c55ea Marek Szyprowski 2015-05-19  753  	domain->pgtable =3D (sysm=
mu_pte_t *)__get_free_pages(GFP_KERNEL, 2);
bfa004893c55ea Marek Szyprowski 2015-05-19  754  	if (!domain->pgtable)
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  755  		goto err_dma_cookie;
2a96536e77b43c KyongHo Cho      2012-05-12  756  =

bfa004893c55ea Marek Szyprowski 2015-05-19  757  	domain->lv2entcnt =3D (sh=
ort *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 1);
bfa004893c55ea Marek Szyprowski 2015-05-19  758  	if (!domain->lv2entcnt)
2a96536e77b43c KyongHo Cho      2012-05-12  759  		goto err_counter;
2a96536e77b43c KyongHo Cho      2012-05-12  760  =

f171abab8f1a75 Sachin Kamat     2014-08-04  761  	/* Workaround for System =
MMU v3.3 to prevent caching 1MiB mapping */
e75276638c1423 Marek Szyprowski 2017-03-24  762  	for (i =3D 0; i < NUM_LV1=
ENTRIES; i++)
e75276638c1423 Marek Szyprowski 2017-03-24  763  		domain->pgtable[i] =3D Z=
ERO_LV2LINK;
66a7ed84b345d6 Cho KyongHo      2014-05-12  764  =

5e3435eb7e1d8c Marek Szyprowski 2016-02-18  765  	handle =3D dma_map_single=
(dma_dev, domain->pgtable, LV1TABLE_SIZE,
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  766  				DMA_TO_DEVICE);
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  767  	/* For mapping page table=
 entries we rely on dma =3D=3D phys */
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  768  	BUG_ON(handle !=3D virt_t=
o_phys(domain->pgtable));
0d6d3da46ac594 Marek Szyprowski 2017-01-09  769  	if (dma_mapping_error(dma=
_dev, handle))
0d6d3da46ac594 Marek Szyprowski 2017-01-09  770  		goto err_lv2ent;
2a96536e77b43c KyongHo Cho      2012-05-12  771  =

bfa004893c55ea Marek Szyprowski 2015-05-19  772  	spin_lock_init(&domain->l=
ock);
bfa004893c55ea Marek Szyprowski 2015-05-19  773  	spin_lock_init(&domain->p=
gtablelock);
bfa004893c55ea Marek Szyprowski 2015-05-19  774  	INIT_LIST_HEAD(&domain->c=
lients);
2a96536e77b43c KyongHo Cho      2012-05-12  775  =

bfa004893c55ea Marek Szyprowski 2015-05-19  776  	domain->domain.geometry.a=
perture_start =3D 0;
bfa004893c55ea Marek Szyprowski 2015-05-19  777  	domain->domain.geometry.a=
perture_end   =3D ~0UL;
bfa004893c55ea Marek Szyprowski 2015-05-19  778  	domain->domain.geometry.f=
orce_aperture =3D true;
3177bb76a8c510 Joerg Roedel     2012-07-11  779  =

bfa004893c55ea Marek Szyprowski 2015-05-19  780  	return &domain->domain;
2a96536e77b43c KyongHo Cho      2012-05-12  781  =

0d6d3da46ac594 Marek Szyprowski 2017-01-09  782  err_lv2ent:
0d6d3da46ac594 Marek Szyprowski 2017-01-09  783  	free_pages((unsigned long=
)domain->lv2entcnt, 1);
2a96536e77b43c KyongHo Cho      2012-05-12  784  err_counter:
bfa004893c55ea Marek Szyprowski 2015-05-19  785  	free_pages((unsigned long=
)domain->pgtable, 2);
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  786  err_dma_cookie:
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  787  	if (type =3D=3D IOMMU_DOM=
AIN_DMA)
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  788  		iommu_put_dma_cookie(&do=
main->domain);
2a96536e77b43c KyongHo Cho      2012-05-12  789  err_pgtable:
bfa004893c55ea Marek Szyprowski 2015-05-19  790  	kfree(domain);
e1fd1eaa3323b3 Joerg Roedel     2015-03-26  791  	return NULL;
2a96536e77b43c KyongHo Cho      2012-05-12  792  }
2a96536e77b43c KyongHo Cho      2012-05-12  793  =

bfa004893c55ea Marek Szyprowski 2015-05-19  794  static void exynos_iommu_d=
omain_free(struct iommu_domain *iommu_domain)
2a96536e77b43c KyongHo Cho      2012-05-12  795  {
bfa004893c55ea Marek Szyprowski 2015-05-19  796  	struct exynos_iommu_domai=
n *domain =3D to_exynos_domain(iommu_domain);
469acebe4a6890 Marek Szyprowski 2015-05-19  797  	struct sysmmu_drvdata *da=
ta, *next;
2a96536e77b43c KyongHo Cho      2012-05-12  798  	unsigned long flags;
2a96536e77b43c KyongHo Cho      2012-05-12  799  	int i;
2a96536e77b43c KyongHo Cho      2012-05-12  800  =

bfa004893c55ea Marek Szyprowski 2015-05-19  801  	WARN_ON(!list_empty(&doma=
in->clients));
2a96536e77b43c KyongHo Cho      2012-05-12  802  =

bfa004893c55ea Marek Szyprowski 2015-05-19  803  	spin_lock_irqsave(&domain=
->lock, flags);
2a96536e77b43c KyongHo Cho      2012-05-12  804  =

bfa004893c55ea Marek Szyprowski 2015-05-19  805  	list_for_each_entry_safe(=
data, next, &domain->clients, domain_node) {
e11723000f1641 Marek Szyprowski 2016-11-14  806  		spin_lock(&data->lock);
b0d4c861a99d00 Marek Szyprowski 2016-11-14  807  		__sysmmu_disable(data);
47a574fffca102 Marek Szyprowski 2016-11-14  808  		data->pgtable =3D 0;
47a574fffca102 Marek Szyprowski 2016-11-14  809  		data->domain =3D NULL;
469acebe4a6890 Marek Szyprowski 2015-05-19  810  		list_del_init(&data->dom=
ain_node);
e11723000f1641 Marek Szyprowski 2016-11-14  811  		spin_unlock(&data->lock);
2a96536e77b43c KyongHo Cho      2012-05-12  812  	}
2a96536e77b43c KyongHo Cho      2012-05-12  813  =

bfa004893c55ea Marek Szyprowski 2015-05-19  814  	spin_unlock_irqrestore(&d=
omain->lock, flags);
2a96536e77b43c KyongHo Cho      2012-05-12  815  =

58c6f6a3dc97ed Marek Szyprowski 2016-02-18  816  	if (iommu_domain->type =
=3D=3D IOMMU_DOMAIN_DMA)
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  817  		iommu_put_dma_cookie(iom=
mu_domain);
58c6f6a3dc97ed Marek Szyprowski 2016-02-18  818  =

5e3435eb7e1d8c Marek Szyprowski 2016-02-18  819  	dma_unmap_single(dma_dev,=
 virt_to_phys(domain->pgtable), LV1TABLE_SIZE,
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  820  			 DMA_TO_DEVICE);
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  821  =

2a96536e77b43c KyongHo Cho      2012-05-12  822  	for (i =3D 0; i < NUM_LV1=
ENTRIES; i++)
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  823  		if (lv1ent_page(domain->=
pgtable + i)) {
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  824  			phys_addr_t base =3D lv=
2table_base(domain->pgtable + i);
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  825  =

5e3435eb7e1d8c Marek Szyprowski 2016-02-18  826  			dma_unmap_single(dma_de=
v, base, LV2TABLE_SIZE,
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  827  					 DMA_TO_DEVICE);
734c3c732ca91a Cho KyongHo      2014-05-12  828  			kmem_cache_free(lv2tabl=
e_kmem_cache,
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  829  					phys_to_virt(base));
5e3435eb7e1d8c Marek Szyprowski 2016-02-18  830  		}
2a96536e77b43c KyongHo Cho      2012-05-12  831  =

bfa004893c55ea Marek Szyprowski 2015-05-19  832  	free_pages((unsigned long=
)domain->pgtable, 2);
bfa004893c55ea Marek Szyprowski 2015-05-19  833  	free_pages((unsigned long=
)domain->lv2entcnt, 1);
bfa004893c55ea Marek Szyprowski 2015-05-19  834  	kfree(domain);
2a96536e77b43c KyongHo Cho      2012-05-12  835  }
2a96536e77b43c KyongHo Cho      2012-05-12  836  =

5fa61cbff16224 Marek Szyprowski 2016-02-18  837  static void exynos_iommu_d=
etach_device(struct iommu_domain *iommu_domain,
5fa61cbff16224 Marek Szyprowski 2016-02-18  838  				    struct device *dev)
5fa61cbff16224 Marek Szyprowski 2016-02-18  839  {
5fa61cbff16224 Marek Szyprowski 2016-02-18  840  	struct exynos_iommu_owner=
 *owner =3D dev->archdata.iommu;
5fa61cbff16224 Marek Szyprowski 2016-02-18  841  	struct exynos_iommu_domai=
n *domain =3D to_exynos_domain(iommu_domain);
5fa61cbff16224 Marek Szyprowski 2016-02-18  842  	phys_addr_t pagetable =3D=
 virt_to_phys(domain->pgtable);
5fa61cbff16224 Marek Szyprowski 2016-02-18  843  	struct sysmmu_drvdata *da=
ta, *next;
5fa61cbff16224 Marek Szyprowski 2016-02-18  844  	unsigned long flags;
5fa61cbff16224 Marek Szyprowski 2016-02-18  845  =

5fa61cbff16224 Marek Szyprowski 2016-02-18 @846  	if (!has_sysmmu(dev) || o=
wner->domain !=3D iommu_domain)
5fa61cbff16224 Marek Szyprowski 2016-02-18  847  		return;
5fa61cbff16224 Marek Szyprowski 2016-02-18  848  =

9b265536c27116 Marek Szyprowski 2016-11-14  849  	mutex_lock(&owner->rpm_lo=
ck);
9b265536c27116 Marek Szyprowski 2016-11-14  850  =

9b265536c27116 Marek Szyprowski 2016-11-14  851  	list_for_each_entry(data,=
 &owner->controllers, owner_node) {
9b265536c27116 Marek Szyprowski 2016-11-14  852  		pm_runtime_get_noresume(=
data->sysmmu);
9b265536c27116 Marek Szyprowski 2016-11-14  853  		if (pm_runtime_active(da=
ta->sysmmu))
e11723000f1641 Marek Szyprowski 2016-11-14  854  			__sysmmu_disable(data);
e11723000f1641 Marek Szyprowski 2016-11-14  855  		pm_runtime_put(data->sys=
mmu);
e11723000f1641 Marek Szyprowski 2016-11-14  856  	}
e11723000f1641 Marek Szyprowski 2016-11-14  857  =

5fa61cbff16224 Marek Szyprowski 2016-02-18  858  	spin_lock_irqsave(&domain=
->lock, flags);
5fa61cbff16224 Marek Szyprowski 2016-02-18  859  	list_for_each_entry_safe(=
data, next, &domain->clients, domain_node) {
e11723000f1641 Marek Szyprowski 2016-11-14  860  		spin_lock(&data->lock);
47a574fffca102 Marek Szyprowski 2016-11-14  861  		data->pgtable =3D 0;
47a574fffca102 Marek Szyprowski 2016-11-14  862  		data->domain =3D NULL;
5fa61cbff16224 Marek Szyprowski 2016-02-18  863  		list_del_init(&data->dom=
ain_node);
e11723000f1641 Marek Szyprowski 2016-11-14  864  		spin_unlock(&data->lock);
5fa61cbff16224 Marek Szyprowski 2016-02-18  865  	}
e11723000f1641 Marek Szyprowski 2016-11-14  866  	owner->domain =3D NULL;
5fa61cbff16224 Marek Szyprowski 2016-02-18  867  	spin_unlock_irqrestore(&d=
omain->lock, flags);
5fa61cbff16224 Marek Szyprowski 2016-02-18  868  =

9b265536c27116 Marek Szyprowski 2016-11-14  869  	mutex_unlock(&owner->rpm_=
lock);
5fa61cbff16224 Marek Szyprowski 2016-02-18  870  =

b0d4c861a99d00 Marek Szyprowski 2016-11-14  871  	dev_dbg(dev, "%s: Detache=
d IOMMU with pgtable %pa\n", __func__,
b0d4c861a99d00 Marek Szyprowski 2016-11-14  872  		&pagetable);
5fa61cbff16224 Marek Szyprowski 2016-02-18  873  }
5fa61cbff16224 Marek Szyprowski 2016-02-18  874  =


:::::: The code at line 673 was first introduced by commit
:::::: 9b265536c271163ec4acc140ca0a40a732971cbf iommu/exynos: Add runtime p=
m support

:::::: TO: Marek Szyprowski <m.szyprowski@samsung.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6936682659142207110==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6936682659142207110==--

