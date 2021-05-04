Content-Type: multipart/mixed; boundary="===============2744995044433634620=="
MIME-Version: 1.0
From: Daniel Vetter <daniel@ffwll.ch>
To: kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 23/27] drm/i915/gem: Don't allow changing the VM on running contexts
Date: Tue, 04 May 2021 23:00:05 +0200
Message-ID: <YJG11YpJQVDK7WQl@phenom.ffwll.local>
In-Reply-To: <202105040213.dxlJPZ0l-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2744995044433634620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 02:52:03AM +0800, kernel test robot wrote:
> Hi Jason,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on drm-intel/for-linux-next]
> [also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next ne=
xt-20210503]
> [cannot apply to tegra-drm/drm/tegra/for-next drm/drm-next v5.12]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Jason-Ekstrand/drm-i915-=
gem-ioctl-clean-ups-v5/20210504-000132
> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> config: i386-randconfig-s002-20210503 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://github.com/0day-ci/linux/commit/6af12f5ca765ecd59075344=
f3be4c4c0b68ef95e
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jason-Ekstrand/drm-i915-gem-ioct=
l-clean-ups-v5/20210504-000132
>         git checkout 6af12f5ca765ecd59075344f3be4c4c0b68ef95e
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=
=3D1 ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Just from staring at this I have no idea, so I guess you have to
reproduce. What sparse does is primarily check these special bit and
pointer values the kernel has, like __rcu and __user, where you need
special functions to access them. But since the code is using
rcu_dereference I have no idea what the complaint is about.
-Daniel

> =

> =

> sparse warnings: (new ones prefixed by >>)
>    drivers/gpu/drm/i915/gt/intel_reset.c:1329:5: sparse: sparse: context =
imbalance in 'intel_gt_reset_trylock' - different lock contexts for basic b=
lock
>    drivers/gpu/drm/i915/gt/intel_reset.c: note: in included file:
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse: sparse: in=
compatible types in comparison expression (different address spaces):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space [noderef] __rcu *
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space *
> --
>    drivers/gpu/drm/i915/gt/intel_execlists_submission.c: note: in include=
d file (through drivers/gpu/drm/i915/selftests/igt_spinner.h, drivers/gpu/d=
rm/i915/gt/selftest_execlists.c):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse: sparse: in=
compatible types in comparison expression (different address spaces):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space [noderef] __rcu *
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space *
> --
>    drivers/gpu/drm/i915/gem/i915_gem_object.c: note: in included file:
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse: sparse: in=
compatible types in comparison expression (different address spaces):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space [noderef] __rcu *
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space *
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse: sparse: in=
compatible types in comparison expression (different address spaces):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space [noderef] __rcu *
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space *
>    drivers/gpu/drm/i915/gem/i915_gem_context.h:154:16: sparse: sparse: in=
compatible types in comparison expression (different address spaces):
>    drivers/gpu/drm/i915/gem/i915_gem_context.h:154:16: sparse:    struct =
i915_address_space [noderef] __rcu *
>    drivers/gpu/drm/i915/gem/i915_gem_context.h:154:16: sparse:    struct =
i915_address_space *
> --
>    drivers/gpu/drm/i915/i915_gem_gtt.c: note: in included file (through d=
rivers/gpu/drm/i915/selftests/i915_gem_gtt.c):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse: sparse: in=
compatible types in comparison expression (different address spaces):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space [noderef] __rcu *
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space *
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse: sparse: in=
compatible types in comparison expression (different address spaces):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space [noderef] __rcu *
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space *
> --
>    drivers/gpu/drm/i915/i915_vma.c: note: in included file:
> >> drivers/gpu/drm/i915/selftests/i915_vma.c:42:24: sparse: sparse: incom=
patible types in comparison expression (different address spaces):
> >> drivers/gpu/drm/i915/selftests/i915_vma.c:42:24: sparse:    struct i91=
5_address_space [noderef] __rcu *
> >> drivers/gpu/drm/i915/selftests/i915_vma.c:42:24: sparse:    struct i91=
5_address_space *
>    drivers/gpu/drm/i915/i915_vma.c: note: in included file (through drive=
rs/gpu/drm/i915/selftests/i915_vma.c):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse: sparse: in=
compatible types in comparison expression (different address spaces):
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space [noderef] __rcu *
> >> drivers/gpu/drm/i915/gem/i915_gem_context.h:163:14: sparse:    struct =
i915_address_space *
> =

> vim +163 drivers/gpu/drm/i915/gem/i915_gem_context.h
> =

> a4e7ccdac38ec8 Chris Wilson 2019-10-04  156  =

> a4e7ccdac38ec8 Chris Wilson 2019-10-04  157  static inline struct i915_ad=
dress_space *
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  158  i915_gem_context_get_vm_rcu(=
struct i915_gem_context *ctx)
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  159  {
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  160  	struct i915_address_space *=
vm;
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  161  =

> a4e7ccdac38ec8 Chris Wilson 2019-10-04  162  	rcu_read_lock();
> a4e7ccdac38ec8 Chris Wilson 2019-10-04 @163  	vm =3D rcu_dereference(ctx-=
>vm);
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  164  	if (!vm)
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  165  		vm =3D &ctx->i915->ggtt.vm;
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  166  	vm =3D i915_vm_get(vm);
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  167  	rcu_read_unlock();
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  168  =

> a4e7ccdac38ec8 Chris Wilson 2019-10-04  169  	return vm;
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  170  }
> a4e7ccdac38ec8 Chris Wilson 2019-10-04  171  =

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx(a)lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--===============2744995044433634620==--

