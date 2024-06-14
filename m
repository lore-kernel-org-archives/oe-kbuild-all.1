Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A24B193081
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 23:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718406364; cv=none; b=r9yhKIxifd006JjftEKxdv9C4cqOQ3g97h/rXr2lPN8U56mjbZ6kwXACXXkp6A6pv1zkplzKJQDhFqGo0DPDS7ei+5s/5uiDWy2sf+S8JU61p3sF99sn0cetSnvmHzK7IIGpTVJknZuqq+izD0KNjMNe06z4CSwIE7FBE6n4Sw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718406364; c=relaxed/simple;
	bh=SUmAkBYRvWardrvGS/2qu3Kc80nAvgHvjxcH/UvOh0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n88g8Juk0NHrldJ++x/o9uNbkQRNyRn4Ij60VTf1pSZQHzWrWCsxm1LGik0yx6/uzp5oCp57OscHBvjI7wTf/wAQdBXOEBggfdfp9OIadsDshPbDXDuU+JWMoeQKgXgCI3EjXq2yqfsC+i7aYQvG3Bp0z8cNeMd7V0oA9Kh2CJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+PEfmRq; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+PEfmRq"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df4d5d0b8d0so2821361276.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 16:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718406352; x=1719011152; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/QAnEvW2whZ66fPncRxn+rv2tKS9JXM0zAtMuT5AFU=;
        b=v+PEfmRqmo5i1MlQaSAJ/oL4LUw/Z1gr8k6BDPlEDNqYw2ODi2lq32nY1XWIwHKYW5
         /OIuZkeVpJgDKg/f/qvvLH64cc5RFqawNnGdqjg5VMN8ChcBOEMfm53F05/tNskSvlkF
         PzIxkerfmnQfV2ZLqC+O/EPq6bculmpW5rCyw1ZIAHNZHizL50CmKUP2mA/TomM1iswa
         DMlDfsmXC97Cl25kbDWOyb3zczwns3Ao7LsAREgMPCCXhb9qTLl34DkfU+xMeU0C8n3O
         5ZdiplGlwOyEd+JKTnCXQRWdfEliu5tdAz2hyC6YJEE5mHg+iBz7z1MmCv0D6Yc9ZfLi
         2gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718406352; x=1719011152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/QAnEvW2whZ66fPncRxn+rv2tKS9JXM0zAtMuT5AFU=;
        b=XVpfunPsTSTFekc/5C7Rrgp+Uje45y/LEx1pqboxfMghC7bekpVQNRPJXsX/AZWqmB
         aosNbdN5pOA1SyQMy7O8PfmxkHggYl/FL39hC45+8k19kt8G/uYLEKRsi3HuXXo5KuL4
         jSRUSlFqBxlnCuNrU1gK2Nm4FyK3CIQAXcwG3t4tG9LVPXoPIkQ/rTHRus6TIUHQOnaI
         YgOHALXKspnqTEfS/Yjj5tsGsvpdOYuryhmN9bTrMoykIZM4Xvnsz8CmJNND1TT/r4Cd
         3ckOcgcXqYj+GOmwJpf1j8F4F8lR/JfHDUcqPK5tltyw3dSZXarQwMOtThTHpmqkMfFZ
         jvIw==
X-Gm-Message-State: AOJu0YztrVb8RC7T6lM98WlQ7BePjN+RN/c+FkzLaAvlIhQl5fFfZIXZ
	wS9PZVm9s4FY4smMlRhVYI4krQSCOU2NHgT45NLAc4gRGQ2GwiwdVhiekE1TVljm/OpZEZ+l+fQ
	xTYwTNDNs3s2Kh9TqyExR9rwYIhH8ZBqBWWWK
X-Google-Smtp-Source: AGHT+IHCaCta4WByzbs5R68RzffwsD0q1bj7gVftUYqLyEqw/d8B0d1+6/PnRmben5rYhFeps5g0or05LZhfZU7eYME=
X-Received: by 2002:a25:d850:0:b0:dfb:6df:bf8b with SMTP id
 3f1490d57ef6-dff150d631emr4005522276.0.1718406351999; Fri, 14 Jun 2024
 16:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406150444.F6neSaiy-lkp@intel.com>
In-Reply-To: <202406150444.F6neSaiy-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 14 Jun 2024 16:05:41 -0700
Message-ID: <CAJuCfpHfE3d2Uf-MAZ1_nhioWhjaG2ywX82K_GePGZYN=eLTYg@mail.gmail.com>
Subject: Re: mm/slub.c:3905:29: error: variable 'obj_exts' set but not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Kees Cook <keescook@chromium.org>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 2:09=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   c286c21ff94252f778515b21b6bebe749454a852
> commit: 4b8736964640fe160724e7135dc62883bddcdace mm/slab: add allocation =
accounting into slab allocation and free paths
> date:   7 weeks ago
> config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org=
/0day-ci/archive/20240615/202406150444.F6neSaiy-lkp@intel.com/config)
> compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240615/202406150444.F6neSaiy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406150444.F6neSaiy-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    mm/slub.c: In function 'slab_post_alloc_hook':
> >> mm/slub.c:3905:29: error: variable 'obj_exts' set but not used [-Werro=
r=3Dunused-but-set-variable]
>     3905 |         struct slabobj_ext *obj_exts;
>          |                             ^~~~~~~~
>    cc1: all warnings being treated as errors

Fix is posted at
https://lore.kernel.org/all/20240614225951.3845577-1-surenb@google.com/

>
>
> vim +/obj_exts +3905 mm/slub.c
>
>   3898
>   3899  static __fastpath_inline
>   3900  void slab_post_alloc_hook(struct kmem_cache *s, struct obj_cgroup=
 *objcg,
>   3901                            gfp_t flags, size_t size, void **p, boo=
l init,
>   3902                            unsigned int orig_size)
>   3903  {
>   3904          unsigned int zero_size =3D s->object_size;
> > 3905          struct slabobj_ext *obj_exts;
>   3906          bool kasan_init =3D init;
>   3907          size_t i;
>   3908          gfp_t init_flags =3D flags & gfp_allowed_mask;
>   3909
>   3910          /*
>   3911           * For kmalloc object, the allocated memory size(object_s=
ize) is likely
>   3912           * larger than the requested size(orig_size). If redzone =
check is
>   3913           * enabled for the extra space, don't zero it, as it will=
 be redzoned
>   3914           * soon. The redzone operation for this extra space could=
 be seen as a
>   3915           * replacement of current poisoning under certain debug o=
ption, and
>   3916           * won't break other sanity checks.
>   3917           */
>   3918          if (kmem_cache_debug_flags(s, SLAB_STORE_USER | SLAB_RED_=
ZONE) &&
>   3919              (s->flags & SLAB_KMALLOC))
>   3920                  zero_size =3D orig_size;
>   3921
>   3922          /*
>   3923           * When slab_debug is enabled, avoid memory initializatio=
n integrated
>   3924           * into KASAN and instead zero out the memory via the mem=
set below with
>   3925           * the proper size. Otherwise, KASAN might overwrite SLUB=
 redzones and
>   3926           * cause false-positive reports. This does not lead to a =
performance
>   3927           * penalty on production builds, as slab_debug is not int=
ended to be
>   3928           * enabled there.
>   3929           */
>   3930          if (__slub_debug_enabled())
>   3931                  kasan_init =3D false;
>   3932
>   3933          /*
>   3934           * As memory initialization might be integrated into KASA=
N,
>   3935           * kasan_slab_alloc and initialization memset must be
>   3936           * kept together to avoid discrepancies in behavior.
>   3937           *
>   3938           * As p[i] might get tagged, memset and kmemleak hook com=
e after KASAN.
>   3939           */
>   3940          for (i =3D 0; i < size; i++) {
>   3941                  p[i] =3D kasan_slab_alloc(s, p[i], init_flags, ka=
san_init);
>   3942                  if (p[i] && init && (!kasan_init ||
>   3943                                       !kasan_has_integrated_init()=
))
>   3944                          memset(p[i], 0, zero_size);
>   3945                  kmemleak_alloc_recursive(p[i], s->object_size, 1,
>   3946                                           s->flags, init_flags);
>   3947                  kmsan_slab_alloc(s, p[i], init_flags);
>   3948                  if (need_slab_obj_ext()) {
>   3949                          obj_exts =3D prepare_slab_obj_exts_hook(s=
, flags, p[i]);
>   3950  #ifdef CONFIG_MEM_ALLOC_PROFILING
>   3951                          /*
>   3952                           * Currently obj_exts is used only for al=
location profiling.
>   3953                           * If other users appear then mem_alloc_p=
rofiling_enabled()
>   3954                           * check should be added before alloc_tag=
_add().
>   3955                           */
>   3956                          if (likely(obj_exts))
>   3957                                  alloc_tag_add(&obj_exts->ref, cur=
rent->alloc_tag, s->size);
>   3958  #endif
>   3959                  }
>   3960          }
>   3961
>   3962          memcg_slab_post_alloc_hook(s, objcg, flags, size, p);
>   3963  }
>   3964
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
