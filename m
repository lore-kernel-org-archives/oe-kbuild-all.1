Content-Type: multipart/mixed; boundary="===============4996933883914288018=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 8/8] drm: Upcast struct drm_device.dev to struct pci_device; replace pdev
Date: Thu, 07 Jan 2021 11:45:22 +0100
Message-ID: <3c496f96-5efa-41d2-5911-1495619fab68@suse.de>
In-Reply-To: <202101071706.J19283ri-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4996933883914288018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

AFAICT these are false positives. The instances have been fixed already.

Am 07.01.21 um 10:45 schrieb kernel test robot:
> Hi Thomas,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on drm-tip/drm-tip]
> [cannot apply to drm-intel/for-linux-next linus/master v5.11-rc2 next-202=
10104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-Mo=
ve-struct-drm_device-pdev-to-legacy/20210107-161007
> base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> config: x86_64-randconfig-s021-20210107 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce:
>          # apt-get install sparse
>          # sparse version: v0.6.3-208-g46a52ca4-dirty
>          # https://github.com/0day-ci/linux/commit/380912f7b62c23322562c4=
0e19efd7ad84d57e9c
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Thomas-Zimmermann/drm-Move-stru=
ct-drm_device-pdev-to-legacy/20210107-161007
>          git checkout 380912f7b62c23322562c40e19efd7ad84d57e9c
>          # save the attached .config to linux build tree
>          make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' A=
RCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>     drivers/gpu/drm/gma500/oaktrail_device.c: In function 'oaktrail_chip_=
setup':
>>> drivers/gpu/drm/gma500/oaktrail_device.c:509:26: error: 'struct drm_dev=
ice' has no member named 'pdev'; did you mean 'dev'?
>       509 |  if (pci_enable_msi(dev->pdev))
>           |                          ^~~~
>           |                          dev
> --
>     drivers/gpu/drm/gma500/oaktrail_lvds.c: In function 'oaktrail_lvds_se=
t_power':
>>> drivers/gpu/drm/gma500/oaktrail_lvds.c:63:25: error: 'struct drm_device=
' has no member named 'pdev'; did you mean 'dev'?
>        63 |   pm_request_idle(&dev->pdev->dev);
>           |                         ^~~~
>           |                         dev
> --
>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function 'get_clock':
>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:69:11: warning: variable '=
tmp' set but not used [-Wunused-but-set-variable]
>        69 |  u32 val, tmp;
>           |           ^~~
>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function 'get_data':
>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:83:11: warning: variable '=
tmp' set but not used [-Wunused-but-set-variable]
>        83 |  u32 val, tmp;
>           |           ^~~
>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function 'oaktrail_lvd=
s_i2c_init':
>>> drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:148:35: error: 'struct drm_d=
evice' has no member named 'pdev'; did you mean 'dev'?
>       148 |  chan->adapter.dev.parent =3D &dev->pdev->dev;
>           |                                   ^~~~
>           |                                   dev
> --
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_driver_load':
>>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:661:22: error: 'struct drm_device' =
has no member named 'pdev'; did you mean 'dev'?
>       661 |  pci_set_master(dev->pdev);
>           |                      ^~~~
>           |                      dev
>     In file included from drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:31:
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:47: error: 'struct drm_device=
' has no member named 'pdev'; did you mean 'dev'?
>       690 |  dev_priv->io_start =3D pci_resource_start(dev->pdev, 0);
>           |                                               ^~~~
>     include/linux/pci.h:1854:40: note: in definition of macro 'pci_resour=
ce_start'
>      1854 | #define pci_resource_start(dev, bar) ((dev)->resource[(bar)].=
start)
>           |                                        ^~~
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:691:49: error: 'struct drm_device=
' has no member named 'pdev'; did you mean 'dev'?
>       691 |  dev_priv->vram_start =3D pci_resource_start(dev->pdev, 1);
>           |                                                 ^~~~
>     include/linux/pci.h:1854:40: note: in definition of macro 'pci_resour=
ce_start'
>      1854 | #define pci_resource_start(dev, bar) ((dev)->resource[(bar)].=
start)
>           |                                        ^~~
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:692:49: error: 'struct drm_device=
' has no member named 'pdev'; did you mean 'dev'?
>       692 |  dev_priv->mmio_start =3D pci_resource_start(dev->pdev, 2);
>           |                                                 ^~~~
>     include/linux/pci.h:1854:40: note: in definition of macro 'pci_resour=
ce_start'
>      1854 | #define pci_resource_start(dev, bar) ((dev)->resource[(bar)].=
start)
>           |                                        ^~~
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:842:33: error: 'struct drm_device=
' has no member named 'pdev'; did you mean 'dev'?
>       842 |  ret =3D pci_request_regions(dev->pdev, "vmwgfx probe");
>           |                                 ^~~~
>           |                                 dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:851:33: error: 'struct drm_device=
' has no member named 'pdev'; did you mean 'dev'?
>       851 |   ret =3D pci_request_region(dev->pdev, 2, "vmwgfx stealth pr=
obe");
>           |                                 ^~~~
>           |                                 dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:859:35: error: 'struct drm_device=
' has no member named 'pdev'; did you mean 'dev'?
>       859 |   ret =3D vmw_irq_install(dev, dev->pdev->irq);
>           |                                   ^~~~
>           |                                   dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1005:27: error: 'struct drm_devic=
e' has no member named 'pdev'; did you mean 'dev'?
>      1005 |   pci_release_region(dev->pdev, 2);
>           |                           ^~~~
>           |                           dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1007:28: error: 'struct drm_devic=
e' has no member named 'pdev'; did you mean 'dev'?
>      1007 |   pci_release_regions(dev->pdev);
>           |                            ^~~~
>           |                            dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_driver_unload':
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1056:27: error: 'struct drm_devic=
e' has no member named 'pdev'; did you mean 'dev'?
>      1056 |   pci_release_region(dev->pdev, 2);
>           |                           ^~~~
>           |                           dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1058:28: error: 'struct drm_devic=
e' has no member named 'pdev'; did you mean 'dev'?
>      1058 |   pci_release_regions(dev->pdev);
>           |                            ^~~~
>           |                            dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_probe':
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1522:7: error: 'struct drm_device=
' has no member named 'pdev'; did you mean 'dev'?
>      1522 |  dev->pdev =3D pdev;
>           |       ^~~~
>           |       dev
> --
>     drivers/gpu/drm/vmwgfx/vmwgfx_fb.c: In function 'vmw_fb_init':
>>> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:641:42: error: 'struct drm_device' h=
as no member named 'pdev'; did you mean 'dev'?
>       641 |  struct device *device =3D &vmw_priv->dev->pdev->dev;
>           |                                          ^~~~
>           |                                          dev
>     In file included from drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:35:
>     At top level:
>     drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:256:23: warning: 'vmw_cursor_plan=
e_formats' defined but not used [-Wunused-const-variable=3D]
>       256 | static const uint32_t vmw_cursor_plane_formats[] =3D {
>           |                       ^~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:248:23: warning: 'vmw_primary_pla=
ne_formats' defined but not used [-Wunused-const-variable=3D]
>       248 | static const uint32_t vmw_primary_plane_formats[] =3D {
>           |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
> --
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function 'vmw_cmdbuf_set_p=
ool_size':
>>> drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1233:48: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
>      1233 |  man->map =3D dma_alloc_coherent(&dev_priv->dev->pdev->dev, s=
ize,
>           |                                                ^~~~
>           |                                                dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function 'vmw_cmdbuf_man_c=
reate':
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1316:28: error: 'struct drm_de=
vice' has no member named 'pdev'; did you mean 'dev'?
>      1316 |            &dev_priv->dev->pdev->dev,
>           |                            ^~~~
>           |                            dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1325:22: error: 'struct drm_de=
vice' has no member named 'pdev'; did you mean 'dev'?
>      1325 |      &dev_priv->dev->pdev->dev,
>           |                      ^~~~
>           |                      dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function 'vmw_cmdbuf_remov=
e_pool':
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1390:42: error: 'struct drm_de=
vice' has no member named 'pdev'; did you mean 'dev'?
>      1390 |   dma_free_coherent(&man->dev_priv->dev->pdev->dev,
>           |                                          ^~~~
>           |                                          dev
> =

> =

> vim +509 drivers/gpu/drm/gma500/oaktrail_device.c
> =

> 1b082ccf5901108 Alan Cox           2011-11-03  503
> 1b22edfd6efd02b Alan Cox           2011-11-29  504  static int oaktrail_c=
hip_setup(struct drm_device *dev)
> aa0c45fdca0cff3 Alan Cox           2011-11-29  505  {
> 1b22edfd6efd02b Alan Cox           2011-11-29  506  	struct drm_psb_priva=
te *dev_priv =3D dev->dev_private;
> 1b22edfd6efd02b Alan Cox           2011-11-29  507  	int ret;
> 1b22edfd6efd02b Alan Cox           2011-11-29  508  	=

> 9c0b6fcdc9faee5 Alan Cox           2012-05-11 @509  	if (pci_enable_msi(d=
ev->pdev))
> 9c0b6fcdc9faee5 Alan Cox           2012-05-11  510  		dev_warn(dev->dev, =
"Enabling MSI failed!\n");
> 9c0b6fcdc9faee5 Alan Cox           2012-05-11  511
> 8512e0748729a49 Alan Cox           2012-05-11  512  	dev_priv->regmap =3D=
 oaktrail_regmap;
> 8512e0748729a49 Alan Cox           2012-05-11  513
> 1b22edfd6efd02b Alan Cox           2011-11-29  514  	ret =3D mid_chip_set=
up(dev);
> aa0c45fdca0cff3 Alan Cox           2011-11-29  515  	if (ret < 0)
> aa0c45fdca0cff3 Alan Cox           2011-11-29  516  		return ret;
> 4086b1e2b19729e Kirill A. Shutemov 2012-05-03  517  	if (!dev_priv->has_g=
ct) {
> aa0c45fdca0cff3 Alan Cox           2011-11-29  518  		/* Now pull the BIO=
S data */
> d839ede47a56ff5 Alan Cox           2012-05-03  519  		psb_intel_opregion_=
init(dev);
> aa0c45fdca0cff3 Alan Cox           2011-11-29  520  		psb_intel_init_bios=
(dev);
> aa0c45fdca0cff3 Alan Cox           2011-11-29  521  	}
> 6528c897966c7d5 Patrik Jakobsson   2013-11-07  522  	gma_intel_setup_gmbu=
s(dev);
> 5f503148efdda26 Alan Cox           2012-05-03  523  	oaktrail_hdmi_setup(=
dev);
> aa0c45fdca0cff3 Alan Cox           2011-11-29  524  	return 0;
> aa0c45fdca0cff3 Alan Cox           2011-11-29  525  }
> aa0c45fdca0cff3 Alan Cox           2011-11-29  526
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--===============4996933883914288018==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="OpenPGP_signature.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCndzRjVCQUFCQ0FBakZpRUV4bmRtL2ZwdU1V
ZHdZRkZvbGgvRTNFUW92K0FGQWwvMjVrSUZBd0FBQUFBQUNna1FsaC9FM0VRb3YrQXgKWmhBQWxr
Nlloa09RZ2owRGtYa1I2SW1qUVEwVjZla0NEdDgwUzVKZHZNZmtPYTdsOTFlUWtlamZMSUkwc21w
V2tlamFCT0ZzL2p2bApaczYvRWgxcXdWRXM5emR1bTBlZU1lSzNCV0tWeVB3N3hIVm11SWFwT0lS
VkZ3WE02czFvTm9IYzA4OUZBS2ttVmlBcUVQYkg1WlVJCkwzM3loVHphcE8rbllmSExpYlJVeDJP
bHAxY3h5dUIyN2FLTFNsUS9TQVYvNWF4Vm1nVmZZSFFWMitFVHNOeWZaRm1ibHdOanVzOGIKL3I5
T3Z3dGNNOWlOekU0d0xNYkhLWlNUVURnbTZjNXFHRGdnKzAzaUw5MWFxN3NNeDJ2MmtBYm1pN3pV
bjBHKzBUOFh3MzNBeEJjVApyNkN3MG1jdFJqVTY0RkdiY3YvMUF6VU1sT3JkaVJlcWFRdCtEUzRG
SkdyNEhCUHVsbFgrS3dLTHVSNm5KM0kvTU1KUE5iQXFPR2tyCi9KM3VldGtscVBGQjYzNXVvWUYw
TEZWRkFxc0lnamVxY01TdmJ5N1ExbktwZWxZK05jZ2U5cXQwa2dZc1hhSGFmdjFwL1pnT2IzSGsK
c0I4eGM2NjgwdVNTQUF6UlBKcUduK1J6ajNDYjMyK3MvTUlSL2pQY0hic21TVmovOCtENXdFMzk0
QXg4elBBZlZzL1FjTTRmQmlCZwpndHdySG0wNlQxMUg5ckpCZTY1NXBzUmplak1TdXo3R29ZcnZy
dDdwaWVxZkZ4QUJ1UFNqOTNYaHdmb3RUNHFkZXp6bHFQZjFhYUk4CkRYSnpSVkdnYXpWcFFXYkFh
bmhXb0gwVit6bXJodUhCcUJTbktEdHprUkl4S3JGSnpvT0IxQXhmbi9CblNzOEpWdVZvSnh5TXFk
dzAKVDJFPQo9eHc1TAotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4996933883914288018==--

