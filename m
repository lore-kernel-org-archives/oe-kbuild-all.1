Content-Type: multipart/mixed; boundary="===============6195095188698609706=="
MIME-Version: 1.0
From: Daniel Vetter <daniel@ffwll.ch>
To: kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 22/27] drm/i915/gem: Delay context creation
Date: Tue, 04 May 2021 22:53:53 +0200
Message-ID: <YJG0YYs7LwerNThG@phenom.ffwll.local>
In-Reply-To: <202105040338.LIgGSDM8-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6195095188698609706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 03:38:06AM +0800, kernel test robot wrote:
> Hi Jason,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on drm-intel/for-linux-next]
> [also build test ERROR on drm-tip/drm-tip drm-exynos/exynos-drm-next next=
-20210503]
> [cannot apply to tegra-drm/drm/tegra/for-next v5.12]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Jason-Ekstrand/drm-i915-=
gem-ioctl-clean-ups-v5/20210504-000132
> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> config: i386-randconfig-r013-20210503 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/0day-ci/linux/commit/66ce6ce447515a302711a65=
f731d1e6f66abdcdc
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jason-Ekstrand/drm-i915-gem-ioct=
l-clean-ups-v5/20210504-000132
>         git checkout 66ce6ce447515a302711a65f731d1e6f66abdcdc
>         # save the attached .config to linux build tree
>         make W=3D1 W=3D1 ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> >> drivers/gpu/drm/i915/gem/i915_gem_context.c:2543:1: error: no previous=
 prototype for 'lazy_create_context_locked' [-Werror=3Dmissing-prototypes]
>     2543 | lazy_create_context_locked(struct drm_i915_file_private *file_=
priv,
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors

Ah you missed the static, and I missed that in review. That one should be
fixed :-)
-Daniel

> =

> =

> vim +/lazy_create_context_locked +2543 drivers/gpu/drm/i915/gem/i915_gem_=
context.c
> =

>   2541	=

>   2542	struct i915_gem_context *
> > 2543	lazy_create_context_locked(struct drm_i915_file_private *file_priv,
>   2544				   struct i915_gem_proto_context *pc, u32 id)
>   2545	{
>   2546		struct i915_gem_context *ctx;
>   2547		void *old;
>   2548	=

>   2549		lockdep_assert_held(&file_priv->proto_context_lock);
>   2550	=

>   2551		ctx =3D i915_gem_create_context(file_priv->dev_priv, pc);
>   2552		if (IS_ERR(ctx))
>   2553			return ctx;
>   2554	=

>   2555		gem_context_register(ctx, file_priv, id);
>   2556	=

>   2557		old =3D xa_erase(&file_priv->proto_context_xa, id);
>   2558		GEM_BUG_ON(old !=3D pc);
>   2559		proto_context_close(pc);
>   2560	=

>   2561		/* One for the xarray and one for the caller */
>   2562		return i915_gem_context_get(ctx);
>   2563	}
>   2564	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


> _______________________________________________
> dri-devel mailing list
> dri-devel(a)lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--===============6195095188698609706==--

