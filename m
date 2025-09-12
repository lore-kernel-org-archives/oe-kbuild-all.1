Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2004E175A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757695165; cv=none; b=kjQHeLsTq773AxZMfmp7WpGS275XTyGrK9/s6eQo1brayWqzjMuCuZB1QI5NoW+a8ZomtvnJBaJtFAnQGDc9hhveClhKeQWd/NfVGEHoHVn+L+BFGokPl2rquJrJqPvBPRJI9pwCBZuMRPmFAi1CUBMDcnrGmE/VvKJI70MoxHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757695165; c=relaxed/simple;
	bh=AvqSEBaAbBArARp+0eGtFdXmqKLWCx6yYFkM5Gjmr5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7DtLMdA7k4UEV4aizobHGIRlA+UamRYZlCkT0FAUuzAomVroYQv6Gh+LqCdJF8CEgpro/Rn03rWEnT/kkOB/rj+dDF0FRmIr+PL8+lH1shTpP6pIVM+E4rg50LoukVssvyPk6RB3S71qn3BSOGpFXr6XvJypwjWCzcBo5FAyfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X785cHmk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X785cHmk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso1720793f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757695162; x=1758299962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0xh0UvEoHi2O7LGyNOcCCIeHeMOwroJteEEcZ04c6w=;
        b=X785cHmkdqV5LpopuvtOr2NReCwxEcIYijsp542DhnemMjqW6uyiKhmxukBKLbvLIC
         /NQ9HN4+PfVhnTon9fkEOKHL8JP81wAxT1l+r3QgtxhzcI+o5CFpRImvDVehQXGrEixi
         I9hkSNTjkSb5sumx14iLkpDjdoaTs8m9WbK7P7GXu8mZdRRYxXBrFUa7GRyM8ANACIaM
         er8CtBMlAehYzk4PRTJSkZqukSlKL6xIFPc0IEMUsHZusNqvsx9Kdm6BANZEIjfsQrxn
         HCxE8UauDX+3OBsRzcSk3SteQxa6QpfZeMCni+oWDm2nJHE4WPEg0AX7IQacAADRTJXa
         db+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757695162; x=1758299962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0xh0UvEoHi2O7LGyNOcCCIeHeMOwroJteEEcZ04c6w=;
        b=CR07pyY/Gt/ajjdq8YOMwGN9LbF/QRzy3tB9d9ifdjhXiZdfTkQmr54yJUO2/Llw4w
         jIyquFpO5L//ecV/zSwJhStdXkluFy9K3D/QG+8L4q0uJ5Q+3d26IlwldcQzpd2GMaQ5
         o4sQfBhAMq7HH6bg6UzibtU82ioyoJKTGI4pFaMxIhq78L5gAxjv/y/ckHfAajW5zWNk
         KlNi+39HH0rIUFEzZ3SXex+TjLam0mIVcOiEMxZtmDx8WqryOljefS/AuKXIwTI+NjR1
         GhjY9atp/9EAXdvWRFnfwehtTDumT5zmNSaVGcFXNJeH24bTW8GTzA/hHeEYaU2I17Tt
         XF+A==
X-Forwarded-Encrypted: i=1; AJvYcCW6TCPBopuYM/I6rseepDGU6IQe8jQ4dd6X+VSoI1BMLmY1aRhDwzFje23ivzrcKTJoRgDX54U40FbueyMu@lists.linux.dev
X-Gm-Message-State: AOJu0Ywan6Zy1UzIU6gTtySlCalF4o/UURWMNgWPd72Wxqyoyrp2XeZ0
	Z79gOYBqtJ4xliJlhYxd/7oeD/QR465J0b572B4xyxxARVqveCJ8cT/pnQoBCI6EPsvcvDTgFoy
	+vwGt4SUrtIAf8tAMFcB4TOrwMkKnVL8=
X-Gm-Gg: ASbGncsMxwrRU/gJ6gylMegw4TQZ8SwuDJDoFgFeIASr0RLItPXYGTwyR0zEwH9YA1S
	P3IXhWGWxNjiDM2tdTk+3I0/QvuVtWBVcAyDeyT18GNuiGX/AVi0uFb9yjFFESL8wK4jfBrUyhL
	eJ3k25pOk8wqJb7ijEe3hD8seDvWrDFoP7OXQSRF1eYNSL/XekhLnONsganoj11pALwnszPOej4
	zTjTZZErMRZ8FCawWIklVIz1qt8EQ5RX19X5uLOtdwOmZ8=
X-Google-Smtp-Source: AGHT+IHV1PvlYuf+XFcfwDj68QaEKHStgMJBQQVVA0MAE80vskWQUTNtIwoaXfzpqlGfo4C7abh1Y2609Ap85Dz11Is=
X-Received: by 2002:a05:6000:178e:b0:3e5:25c2:9637 with SMTP id
 ffacd0b85a97d-3e7657986b6mr3795843f8f.17.1757695162195; Fri, 12 Sep 2025
 09:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509121822.aOV6H1ts-lkp@intel.com> <8fe99133-3322-4e39-9b58-80df547b8d1f@suse.cz>
In-Reply-To: <8fe99133-3322-4e39-9b58-80df547b8d1f@suse.cz>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 12 Sep 2025 09:39:11 -0700
X-Gm-Features: AS18NWC-ioE-NKfTIE_NGzGThSkiI0Gn4u0FeGkHnHauTm4TCVRXnQ1WFKRGfSE
Message-ID: <CAADnVQJWXk+Zzsf_oVTaJkpm4nO3iq34bGcUDQRarOVSX+tLbA@mail.gmail.com>
Subject: Re: [vbabka-slab:slab/for-6.18/kmalloc_nolock 14/14]
 mm/slub.c:3866:2: warning: variable 'flags' is used uninitialized whenever
 '&&' condition is false
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>, Alexei Starovoitov <ast@kernel.org>, Harry Yoo <harry.yoo@oracle.com>, 
	clang-built-linux <llvm@lists.linux.dev>, oe-kbuild-all@lists.linux.dev, 
	linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 6:23=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 9/12/25 12:25, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git=
 slab/for-6.18/kmalloc_nolock
> > head:   8014922e0e72dde7684abebeab3404720401679f
> > commit: 8014922e0e72dde7684abebeab3404720401679f [14/14] slab: Introduc=
e kmalloc_nolock() and kfree_nolock().
> > config: x86_64-buildonly-randconfig-004-20250912 (https://download.01.o=
rg/0day-ci/archive/20250912/202509121822.aOV6H1ts-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250912/202509121822.aOV6H1ts-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202509121822.aOV6H1ts-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> mm/slub.c:3866:2: warning: variable 'flags' is used uninitialized whe=
never '&&' condition is false [-Wsometimes-uninitialized]
> >     3866 |         local_lock_cpu_slab(s, flags);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    mm/slub.c:3776:2: note: expanded from macro 'local_lock_cpu_slab'
> >     3776 |         lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab-=
>lock, flags))
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
> >    include/linux/lockdep.h:279:15: note: expanded from macro 'lockdep_a=
ssert'
> >      279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
> >          |                      ^~~~~~~~~~~
> >    include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON=
'
> >      171 |         int __ret_warn_on =3D !!(condition);                =
              \
> >          |                                ^~~~~~~~~
> >    mm/slub.c:3891:27: note: uninitialized use occurs here
> >     3891 |         local_unlock_cpu_slab(s, flags);
> >          |                                  ^~~~~
> >    mm/slub.c:3780:48: note: expanded from macro 'local_unlock_cpu_slab'
> >     3780 |         local_unlock_irqrestore(&(s)->cpu_slab->lock, flags)
> >          |                                                       ^~~~~
> >    include/linux/local_lock.h:52:48: note: expanded from macro 'local_u=
nlock_irqrestore'
> >       52 |         __local_unlock_irqrestore(this_cpu_ptr(lock), flags)
> >          |                                                       ^~~~~
> >    include/linux/local_lock_internal.h:202:21: note: expanded from macr=
o '__local_unlock_irqrestore'
> >      202 |                 local_irq_restore(flags);                   =
    \
> >          |                                   ^~~~~
> >    include/linux/irqflags.h:240:61: note: expanded from macro 'local_ir=
q_restore'
> >      240 | #define local_irq_restore(flags) do { raw_local_irq_restore(=
flags); } while (0)
> >          |                                                             =
^~~~~
> >    include/linux/irqflags.h:179:26: note: expanded from macro 'raw_loca=
l_irq_restore'
> >      179 |                 arch_local_irq_restore(flags);          \
> >          |                                        ^~~~~
> >    mm/slub.c:3866:2: note: remove the '&&' if its condition is always t=
rue
> >     3866 |         local_lock_cpu_slab(s, flags);
> >          |         ^
> >    mm/slub.c:3776:2: note: expanded from macro 'local_lock_cpu_slab'
> >     3776 |         lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab-=
>lock, flags))
> >          |         ^
> >    include/linux/lockdep.h:279:15: note: expanded from macro 'lockdep_a=
ssert'
> >      279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
> >          |                      ^
> >    mm/slub.c:3863:21: note: initialize the variable 'flags' to silence =
this warning
> >     3863 |         unsigned long flags;
> >          |                            ^
> >          |                             =3D 0
> >    1 warning generated.
> >
> >
> > vim +3866 mm/slub.c
>
> >   3852
> >   3853        /*
> >   3854         * Put a slab into a partial slab slot if available.
> >   3855         *
> >   3856         * If we did not find a slot then simply move all the par=
tials to the
> >   3857         * per node partial list.
> >   3858         */
> >   3859        static void put_cpu_partial(struct kmem_cache *s, struct =
slab *slab, int drain)
> >   3860        {
> >   3861                struct slab *oldslab;
> >   3862                struct slab *slab_to_put =3D NULL;
> >   3863                unsigned long flags;
> >   3864                int slabs =3D 0;
> >   3865
> >> 3866         local_lock_cpu_slab(s, flags);
>
> I guess this?
>
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -3772,8 +3772,11 @@ static void deactivate_slab(struct kmem_cache *s, =
struct slab *slab,
>  #define local_lock_cpu_slab(s, flags)  \
>         local_lock_irqsave(&(s)->cpu_slab->lock, flags)
>  #else
> -#define local_lock_cpu_slab(s, flags)  \
> -       lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab->lock, flags)=
)
> +#define gg(s, flags)                                         \
> +       do {                                                             =
      \
> +               bool __l =3D local_trylock_irqsave(&(s)->cpu_slab->lock, =
flags); \
> +               lockdep_assert(__l);

That works, but would raise questions for anyone looking at
these two lines as-is, since it's an implementation
detail of lockdep_assert() and combination of .config flags.

what clang warning suggested is imo cleaner:

diff --git a/mm/slub.c b/mm/slub.c
index 4079abb5d0e1..a6b50cd1d95f 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3865,7 +3865,7 @@ static void put_cpu_partial(struct kmem_cache
*s, struct slab *slab, int drain)
 {
        struct slab *oldslab;
        struct slab *slab_to_put =3D NULL;
-       unsigned long flags;
+       unsigned long flags =3D 0;
        int slabs =3D 0;

Could you fold one of them in?
