Content-Type: multipart/mixed; boundary="===============1791991693879260119=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2341:52: warning: Uninitialized variable: pw
Date: Wed, 28 Oct 2020 01:06:13 +0800
Message-ID: <202010280108.rT3PmzVv-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1791991693879260119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4525c8781ec0701ce824e8bd379ae1b129e26568
commit: c60b93cd4862d108214a14e655358ea714d7a12a drm/i915: Avoid mixing int=
eger types during batch copies
date:   4 weeks ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2341:52: warning: Uniniti=
alized variable: pw [uninitvar]
    GEM_BUG_ON(overflows_type(eb->batch_start_offset, pw->batch_offset));
                                                      ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2342:43: warning: Uniniti=
alized variable: pw [uninitvar]
    GEM_BUG_ON(overflows_type(eb->batch_len, pw->batch_length));
                                             ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1535:6: warning: Local va=
riable reloc_gpu shadows outer function [shadowFunction]
    int reloc_gpu =3D reloc_entry_gpu(eb, vma, offset, target_addr);
        ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1384:13: note: Shadowed d=
eclaration
   static u32 *reloc_gpu(struct i915_execbuffer *eb,
               ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1535:6: note: Shadow vari=
able
    int reloc_gpu =3D reloc_entry_gpu(eb, vma, offset, target_addr);
        ^

vim +2341 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

  2333	=

  2334	static int eb_parse_pipeline(struct i915_execbuffer *eb,
  2335				     struct i915_vma *shadow,
  2336				     struct i915_vma *trampoline)
  2337	{
  2338		struct eb_parse_work *pw;
  2339		int err;
  2340	=

> 2341		GEM_BUG_ON(overflows_type(eb->batch_start_offset, pw->batch_offset)=
);
  2342		GEM_BUG_ON(overflows_type(eb->batch_len, pw->batch_length));
  2343	=

  2344		pw =3D kzalloc(sizeof(*pw), GFP_KERNEL);
  2345		if (!pw)
  2346			return -ENOMEM;
  2347	=

  2348		err =3D i915_active_acquire(&eb->batch->vma->active);
  2349		if (err)
  2350			goto err_free;
  2351	=

  2352		err =3D i915_active_acquire(&shadow->active);
  2353		if (err)
  2354			goto err_batch;
  2355	=

  2356		if (trampoline) {
  2357			err =3D i915_active_acquire(&trampoline->active);
  2358			if (err)
  2359				goto err_shadow;
  2360		}
  2361	=

  2362		dma_fence_work_init(&pw->base, &eb_parse_ops);
  2363	=

  2364		pw->engine =3D eb->engine;
  2365		pw->batch =3D eb->batch->vma;
  2366		pw->batch_offset =3D eb->batch_start_offset;
  2367		pw->batch_length =3D eb->batch_len;
  2368		pw->shadow =3D shadow;
  2369		pw->trampoline =3D trampoline;
  2370	=

  2371		/* Mark active refs early for this worker, in case we get interrupt=
ed */
  2372		err =3D parser_mark_active(pw, eb->context->timeline);
  2373		if (err)
  2374			goto err_commit;
  2375	=

  2376		err =3D dma_resv_reserve_shared(pw->batch->resv, 1);
  2377		if (err)
  2378			goto err_commit;
  2379	=

  2380		/* Wait for all writes (and relocs) into the batch to complete */
  2381		err =3D i915_sw_fence_await_reservation(&pw->base.chain,
  2382						      pw->batch->resv, NULL, false,
  2383						      0, I915_FENCE_GFP);
  2384		if (err < 0)
  2385			goto err_commit;
  2386	=

  2387		/* Keep the batch alive and unwritten as we parse */
  2388		dma_resv_add_shared_fence(pw->batch->resv, &pw->base.dma);
  2389	=

  2390		/* Force execution to wait for completion of the parser */
  2391		dma_resv_add_excl_fence(shadow->resv, &pw->base.dma);
  2392	=

  2393		dma_fence_work_commit_imm(&pw->base);
  2394		return 0;
  2395	=

  2396	err_commit:
  2397		i915_sw_fence_set_error_once(&pw->base.chain, err);
  2398		dma_fence_work_commit_imm(&pw->base);
  2399		return err;
  2400	=

  2401	err_shadow:
  2402		i915_active_release(&shadow->active);
  2403	err_batch:
  2404		i915_active_release(&eb->batch->vma->active);
  2405	err_free:
  2406		kfree(pw);
  2407		return err;
  2408	}
  2409	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1791991693879260119==--

