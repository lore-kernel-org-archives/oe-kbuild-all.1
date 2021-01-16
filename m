Content-Type: multipart/mixed; boundary="===============0239996878482292132=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/i915/gem/i915_gem_region.c:166:27: warning: Uninitialized variable: obj
Date: Sat, 16 Jan 2021 13:36:11 +0800
Message-ID: <202101161308.BZvnDcpd-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0239996878482292132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1d94330a437a573cfdf848f6743b1ed169242c8a
commit: c6d4a099a240a8742173f8e02db0ba08ffd37ef1 drm/i915: reimplement head=
er test feature
date:   1 year ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> drivers/gpu/drm/i915/gem/i915_gem_region.c:166:27: warning: Uninitialize=
d variable: obj [uninitvar]
    if (overflows_type(size, obj->base.size))
                             ^
--

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/i915/display/intel_overlay.c:678:12: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
     flags |=3D DST_KEY_ENABLE;
              ^

vim +166 drivers/gpu/drm/i915/gem/i915_gem_region.c

232a6ebae41919 Matthew Auld 2019-10-08  132  =

232a6ebae41919 Matthew Auld 2019-10-08  133  struct drm_i915_gem_object *
232a6ebae41919 Matthew Auld 2019-10-08  134  i915_gem_object_create_region(=
struct intel_memory_region *mem,
232a6ebae41919 Matthew Auld 2019-10-08  135  			      resource_size_t size,
232a6ebae41919 Matthew Auld 2019-10-08  136  			      unsigned int flags)
232a6ebae41919 Matthew Auld 2019-10-08  137  {
232a6ebae41919 Matthew Auld 2019-10-08  138  	struct drm_i915_gem_object *o=
bj;
232a6ebae41919 Matthew Auld 2019-10-08  139  =

232a6ebae41919 Matthew Auld 2019-10-08  140  	/*
232a6ebae41919 Matthew Auld 2019-10-08  141  	 * NB: Our use of resource_si=
ze_t for the size stems from using struct
232a6ebae41919 Matthew Auld 2019-10-08  142  	 * resource for the mem->regi=
on. We might need to revisit this in the
232a6ebae41919 Matthew Auld 2019-10-08  143  	 * future.
232a6ebae41919 Matthew Auld 2019-10-08  144  	 */
232a6ebae41919 Matthew Auld 2019-10-08  145  =

2f0b97ca021186 Matthew Auld 2019-10-08  146  	GEM_BUG_ON(flags & ~I915_BO_A=
LLOC_FLAGS);
2f0b97ca021186 Matthew Auld 2019-10-08  147  =

232a6ebae41919 Matthew Auld 2019-10-08  148  	if (!mem)
232a6ebae41919 Matthew Auld 2019-10-08  149  		return ERR_PTR(-ENODEV);
232a6ebae41919 Matthew Auld 2019-10-08  150  =

232a6ebae41919 Matthew Auld 2019-10-08  151  	size =3D round_up(size, mem->=
min_page_size);
232a6ebae41919 Matthew Auld 2019-10-08  152  =

232a6ebae41919 Matthew Auld 2019-10-08  153  	GEM_BUG_ON(!size);
232a6ebae41919 Matthew Auld 2019-10-08  154  	GEM_BUG_ON(!IS_ALIGNED(size, =
I915_GTT_MIN_ALIGNMENT));
232a6ebae41919 Matthew Auld 2019-10-08  155  =

232a6ebae41919 Matthew Auld 2019-10-08  156  	/*
232a6ebae41919 Matthew Auld 2019-10-08  157  	 * XXX: There is a prevalence=
 of the assumption that we fit the
232a6ebae41919 Matthew Auld 2019-10-08  158  	 * object's page count inside=
 a 32bit _signed_ variable. Let's document
232a6ebae41919 Matthew Auld 2019-10-08  159  	 * this and catch if we ever =
need to fix it. In the meantime, if you do
232a6ebae41919 Matthew Auld 2019-10-08  160  	 * spot such a local variable=
, please consider fixing!
232a6ebae41919 Matthew Auld 2019-10-08  161  	 */
232a6ebae41919 Matthew Auld 2019-10-08  162  =

232a6ebae41919 Matthew Auld 2019-10-08  163  	if (size >> PAGE_SHIFT > INT_=
MAX)
232a6ebae41919 Matthew Auld 2019-10-08  164  		return ERR_PTR(-E2BIG);
232a6ebae41919 Matthew Auld 2019-10-08  165  =

232a6ebae41919 Matthew Auld 2019-10-08 @166  	if (overflows_type(size, obj-=
>base.size))

:::::: The code at line 166 was first introduced by commit
:::::: 232a6ebae419193f5b8da4fa869ae5089ab105c2 drm/i915: introduce intel_m=
emory_region

:::::: TO: Matthew Auld <matthew.auld@intel.com>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0239996878482292132==--

