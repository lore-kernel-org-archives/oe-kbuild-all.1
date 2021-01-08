Content-Type: multipart/mixed; boundary="===============1474865096895977125=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 8/8] drm: Upcast struct drm_device.dev to struct pci_device; replace pdev
Date: Fri, 08 Jan 2021 09:25:01 +0800
Message-ID: <7486aeef-9fa4-91cb-8e95-383990cf3567@intel.com>
In-Reply-To: <3c496f96-5efa-41d2-5911-1495619fab68@suse.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1474865096895977125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for the feedback, do you mean the patch was applied to a wrong base?

Best Regards,
Rong Chen

On 1/7/21 6:45 PM, Thomas Zimmermann wrote:
> AFAICT these are false positives. The instances have been fixed already.
>
> Am 07.01.21 um 10:45 schrieb kernel test robot:
>> Hi Thomas,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on drm-tip/drm-tip]
>> [cannot apply to drm-intel/for-linux-next linus/master v5.11-rc2 =

>> next-20210104]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url: =

>> https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-Move-stru=
ct-drm_device-pdev-to-legacy/20210107-161007
>> base:=C2=A0=C2=A0 git://anongit.freedesktop.org/drm/drm-tip drm-tip
>> config: x86_64-randconfig-s021-20210107 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # apt-get install sparse
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # sparse version: v0.6.=
3-208-g46a52ca4-dirty
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =

>> https://github.com/0day-ci/linux/commit/380912f7b62c23322562c40e19efd7ad=
84d57e9c
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add linux-re=
view https://github.com/0day-ci/linux
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-tags lin=
ux-review =

>> Thomas-Zimmermann/drm-Move-struct-drm_device-pdev-to-legacy/20210107-161=
007
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout 380912f7b6=
2c23322562c40e19efd7ad84d57e9c
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .co=
nfig to linux build tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 make W=3D1 C=3D1 CF=3D'=
-fdiagnostic-prefix -D__CHECK_ENDIAN__' =

>> ARCH=3Dx86_64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/gma500/oaktrail_device.c: In function =

>> 'oaktrail_chip_setup':
>>>> drivers/gpu/drm/gma500/oaktrail_device.c:509:26: error: 'struct =

>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 509 |=C2=A0 if (pci_enable_msi(dev->pdev))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> -- =

>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/gma500/oaktrail_lvds.c: In function =

>> 'oaktrail_lvds_set_power':
>>>> drivers/gpu/drm/gma500/oaktrail_lvds.c:63:25: error: 'struct =

>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 63 |=C2=A0=C2=A0 pm_request_idle(&d=
ev->pdev->dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> -- =

>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In functi=
on 'get_clock':
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:69:11: war=
ning: =

>> variable 'tmp' set but not used [-Wunused-but-set-variable]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 69 |=C2=A0 u32 val, tmp;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In functi=
on 'get_data':
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:83:11: war=
ning: =

>> variable 'tmp' set but not used [-Wunused-but-set-variable]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 83 |=C2=A0 u32 val, tmp;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In functi=
on =

>> 'oaktrail_lvds_i2c_init':
>>>> drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:148:35: error: 'struct =

>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 148 |=C2=A0 chan->adapter.dev.parent =3D =
&dev->pdev->dev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> -- =

>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw=
_driver_load':
>>>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:661:22: error: 'struct =

>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 661 |=C2=A0 pci_set_master(dev->pdev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 In file included from drivers/gpu/drm/vmwgfx/vmwgfx_d=
rv.c:31:
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:47: error: 's=
truct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 690 |=C2=A0 dev_priv->io_start =3D pci_re=
source_start(dev->pdev, 0);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0 include/linux/pci.h:1854:40: note: in definition of m=
acro =

>> 'pci_resource_start'
>> =C2=A0=C2=A0=C2=A0=C2=A0 1854 | #define pci_resource_start(dev, bar) =

>> ((dev)->resource[(bar)].start)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:691:49: error: 's=
truct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 691 |=C2=A0 dev_priv->vram_start =3D pci_=
resource_start(dev->pdev, 1);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0 include/linux/pci.h:1854:40: note: in definition of m=
acro =

>> 'pci_resource_start'
>> =C2=A0=C2=A0=C2=A0=C2=A0 1854 | #define pci_resource_start(dev, bar) =

>> ((dev)->resource[(bar)].start)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:692:49: error: 's=
truct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 692 |=C2=A0 dev_priv->mmio_start =3D pci_=
resource_start(dev->pdev, 2);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0 include/linux/pci.h:1854:40: note: in definition of m=
acro =

>> 'pci_resource_start'
>> =C2=A0=C2=A0=C2=A0=C2=A0 1854 | #define pci_resource_start(dev, bar) =

>> ((dev)->resource[(bar)].start)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:842:33: error: 's=
truct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 842 |=C2=A0 ret =3D pci_request_regions(d=
ev->pdev, "vmwgfx probe");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:851:33: error: 's=
truct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 851 |=C2=A0=C2=A0 ret =3D pci_request_reg=
ion(dev->pdev, 2, "vmwgfx stealth =

>> probe");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:859:35: error: 's=
truct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 859 |=C2=A0=C2=A0 ret =3D vmw_irq_install=
(dev, dev->pdev->irq);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1005:27: error: '=
struct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0 1005 |=C2=A0=C2=A0 pci_release_region(dev->pdev=
, 2);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1007:28: error: '=
struct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0 1007 |=C2=A0=C2=A0 pci_release_regions(dev->pde=
v);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~=
~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function =

>> 'vmw_driver_unload':
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1056:27: error: '=
struct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0 1056 |=C2=A0=C2=A0 pci_release_region(dev->pdev=
, 2);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1058:28: error: '=
struct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0 1058 |=C2=A0=C2=A0 pci_release_regions(dev->pde=
v);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~=
~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw=
_probe':
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1522:7: error: 's=
truct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0 1522 |=C2=A0 dev->pdev =3D pdev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dev
>> -- =

>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c: In function 'vmw_=
fb_init':
>>>> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:641:42: error: 'struct =

>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 641 |=C2=A0 struct device *device =3D &vm=
w_priv->dev->pdev->dev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 In file included from drivers/gpu/drm/vmwgfx/vmwgfx_f=
b.c:35:
>> =C2=A0=C2=A0=C2=A0 At top level:
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:256:23: warning: =

>> 'vmw_cursor_plane_formats' defined but not used =

>> [-Wunused-const-variable=3D]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 256 | static const uint32_t vmw_cursor_pl=
ane_formats[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:248:23: warning: =

>> 'vmw_primary_plane_formats' defined but not used =

>> [-Wunused-const-variable=3D]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 248 | static const uint32_t vmw_primary_p=
lane_formats[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> -- =

>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function =

>> 'vmw_cmdbuf_set_pool_size':
>>>> drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1233:48: error: 'struct =

>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0 1233 |=C2=A0 man->map =3D dma_alloc_coherent(&d=
ev_priv->dev->pdev->dev, =

>> size,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function =

>> 'vmw_cmdbuf_man_create':
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1316:28: error=
: 'struct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0 1316 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_priv->dev->pdev->dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~=
~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1325:22: error=
: 'struct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0 1325 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_priv-=
>dev->pdev->dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function =

>> 'vmw_cmdbuf_remove_pool':
>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1390:42: error=
: 'struct =

>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>> =C2=A0=C2=A0=C2=A0=C2=A0 1390 | dma_free_coherent(&man->dev_priv->dev->p=
dev->dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dev
>>
>>
>> vim +509 drivers/gpu/drm/gma500/oaktrail_device.c
>>
>> 1b082ccf5901108 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-03=C2=A0 503
>> 1b22edfd6efd02b Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 504=C2=A0 static int =

>> oaktrail_chip_setup(struct drm_device *dev)
>> aa0c45fdca0cff3 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 505=C2=A0 {
>> 1b22edfd6efd02b Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 506=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct =

>> drm_psb_private *dev_priv =3D dev->dev_private;
>> 1b22edfd6efd02b Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 507=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> 1b22edfd6efd02b Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 508
>> 9c0b6fcdc9faee5 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2012-05-11 @509=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =

>> (pci_enable_msi(dev->pdev))
>> 9c0b6fcdc9faee5 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2012-05-11=C2=A0 510 dev_warn(dev->dev, =

>> "Enabling MSI failed!\n");
>> 9c0b6fcdc9faee5 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2012-05-11=C2=A0 511
>> 8512e0748729a49 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2012-05-11=C2=A0 512 dev_priv->regmap =3D =

>> oaktrail_regmap;
>> 8512e0748729a49 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2012-05-11=C2=A0 513
>> 1b22edfd6efd02b Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 514=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D =

>> mid_chip_setup(dev);
>> aa0c45fdca0cff3 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 515=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> aa0c45fdca0cff3 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 516 return ret;
>> 4086b1e2b19729e Kirill A. Shutemov 2012-05-03=C2=A0 517=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if =

>> (!dev_priv->has_gct) {
>> aa0c45fdca0cff3 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 518=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Now =

>> pull the BIOS data */
>> d839ede47a56ff5 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2012-05-03=C2=A0 519 =

>> psb_intel_opregion_init(dev);
>> aa0c45fdca0cff3 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 520 =

>> psb_intel_init_bios(dev);
>> aa0c45fdca0cff3 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 521=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> 6528c897966c7d5 Patrik Jakobsson=C2=A0=C2=A0 2013-11-07=C2=A0 522 =

>> gma_intel_setup_gmbus(dev);
>> 5f503148efdda26 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2012-05-03=C2=A0 523 =

>> oaktrail_hdmi_setup(dev);
>> aa0c45fdca0cff3 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 524=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> aa0c45fdca0cff3 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 525=C2=A0 }
>> aa0c45fdca0cff3 Alan Cox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2011-11-29=C2=A0 526
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
>
>
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============1474865096895977125==--

