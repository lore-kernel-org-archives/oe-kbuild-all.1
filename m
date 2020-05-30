Content-Type: multipart/mixed; boundary="===============7679085230509215317=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 06/12] dma-buf: Proxy fence, an unsignaled fence placeholder
Date: Sat, 30 May 2020 13:53:32 +0800
Message-ID: <202005301318.3mRNJxfp%lkp@intel.com>
In-Reply-To: <20200525075347.582-6-chris@chris-wilson.co.uk>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7679085230509215317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chris,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next linus/master v5.7-rc7 next-202005=
29]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Chris-Wilson/drm-i915-gt-S=
top-cross-polluting-PIN_GLOBAL-with-PIN_USER-with-no-ppgtt/20200525-160038
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/dma-buf/st-dma-fence-proxy.c:127:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:109:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:127:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:146:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:136:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:146:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:175:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:155:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:175:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:217:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:185:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:217:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:254:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:238:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:254:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:293:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:265:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:293:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:321:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:303:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:321:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:348:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:331:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:348:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:377:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:358:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:377:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:404:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:387:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:404:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:435:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:414:0: note: Variable 'err' is reas=
signed a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/dma-buf/st-dma-fence-proxy.c:435:6: note: Variable 'err' is reas=
signed a value before the old one has been used.
    err =3D 0;
        ^
   drivers/dma-buf/st-dma-fence-proxy.c:466:6: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;

vim +/err +127 drivers/dma-buf/st-dma-fence-proxy.c

   105	=

   106	static int wrap_target(void *arg)
   107	{
   108		struct fences f;
   109		int err =3D -EINVAL;
   110	=

   111		if (create_fences(&f, false))
   112			return -ENOMEM;
   113	=

   114		if (dma_fence_proxy_get_real(f.proxy) !=3D f.proxy) {
   115			pr_err("Unwrapped proxy fenced reported a target fence!\n");
   116			goto err_free;
   117		}
   118	=

   119		dma_fence_proxy_set_real(f.proxy, f.real);
   120		rcu_assign_pointer(f.slot, dma_fence_get(f.real)); /* free_fences()=
 */
   121	=

   122		if (dma_fence_proxy_get_real(f.proxy) !=3D f.real) {
   123			pr_err("Wrapped proxy fenced did not report the target fence!\n");
   124			goto err_free;
   125		}
   126	=

 > 127		err =3D 0;
   128	err_free:
   129		free_fences(&f);
   130		return err;
   131	}
   132	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7679085230509215317==--

