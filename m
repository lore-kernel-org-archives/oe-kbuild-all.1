Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E651AE051
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 06:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723011536; cv=none; b=VtcWpxFSqoHrlaSNuYPiAo9ef5vdJqgnTaSW8fnxwIs5UpkIt/ucx6peI0OmrWoMhrs8RQBEJu17aRv3qcKeR7m72PZHn0UC/NQYgjfm3fkc4EnWNlSb2BKPe3GagG8Z3XStpkSCw3XdJmTBo3SpJa72ZyEFAhvCyq0Xv82pS+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723011536; c=relaxed/simple;
	bh=NtZrm1fQVMXmWlOwUsmzG6g4RO6GGfFlo9jMy/SjZWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVpUqfifLZurtu1c3sCe+bNQnq6zoP9DEuBL+jh1940KXJga+WvSNhMLpWZz4M2TtUspy9+sedO05ZIEraaQIpA1w4yRggAu+3ucLXr+Y4EJgmfz8i2ie9U8YbTVbDKUT3AciSLapPj8dc+z9wFQnL/Z+CO2dzoMpM2a/7SQr+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSr+/wJ4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSr+/wJ4"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f149845fbaso15632151fa.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 06 Aug 2024 23:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723011531; x=1723616331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11W8XCIKUTItle+vJWHmjRT9iJpXXyIiCYmqekVt1Ck=;
        b=SSr+/wJ4yLpTgG+gqA/u7lZSs5InLSY1W3XoKZR+88t5MQixJIAWLd6pUcm1V3qhz2
         at3l13eN1790zH0WLg7+z7lgY7/Us/LzDq/4SZDBCTqS9Q1vLMRUUp7cnX4Tq9PPRxn9
         of376XSmROgcsrGDmKzD8qBcoKrLYkJnPGTpfbtJRJmJYwUPkJJNwi5IWq7APWEw4via
         6vYrN2H/QaN449xBXIWgonVTHuuEi/eMR1bsbS4T2s5AI5nlOsamw9ahwEDuct9uK/+B
         R7gduobpa23wERzkihnuqbECyaB2gZlGZ9uiQpF1G9lKZjVSE3KlT9EpslGXTheZqvkk
         GQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723011531; x=1723616331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11W8XCIKUTItle+vJWHmjRT9iJpXXyIiCYmqekVt1Ck=;
        b=Yp8/LCanYKOoc5MBy4t3edOcvRliUeAggCen9vUzgfVc2UxIO8wmxItywqtqc8Rf6u
         tSCXV6BaKM8Sg+ON/uWl/r3gE+HtLHqDKH9rg3HQzXJwnlW4fa2znS3qr0jlDNgrbOgi
         Nce6QC+l5C8lebXEXrk56Xk9BYh1X/4sju7F0T+gF528Y8Ldvy6ZtR3vvNIsf25jopzK
         x6FcGokUWD1R0IStfk7DsvAvUn5kkP8ayhwe70DP4GuC5p+pos3yykBrXJVCdK+HFNqy
         LF+nkOZqY0fX489NIQCrj6eBgm8/2HYfAr/rRxLxmioJgZEaNCS2toF4xjVt6x/08NTt
         a6vQ==
X-Gm-Message-State: AOJu0YyUqZ+ihXPHWvF/mLxUDw6yeHJs517i52ayGtcXPXVOEpW3EQad
	j1QGIb2+iyhi46wnithoacrnLhB9j9vP+AML5qWL6dp5x+5yxxx5s6kXs6/mYhANS/mYs0eAMwQ
	hDfC/GW4frcgSN0mvgQ7TfxFggMjDi185Nd0=
X-Google-Smtp-Source: AGHT+IE3oohHonfAksb8pQnG+K7tmUvBrbQ+YA1JCiEQ4T7/wzWI+EwL4Le+I+Td/RxQqlPaxRXmb+TNA04xBdJbi3Y=
X-Received: by 2002:a2e:b1c8:0:b0:2ef:564c:9b6b with SMTP id
 38308e7fff4ca-2f15aaa848bmr131135191fa.23.1723011530887; Tue, 06 Aug 2024
 23:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240805184012.358023-4-ubizjak@gmail.com> <202408071315.cTqH5CME-lkp@intel.com>
In-Reply-To: <202408071315.cTqH5CME-lkp@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 7 Aug 2024 08:18:39 +0200
Message-ID: <CAFULd4Yx0HFz1HKnrJMS_u1AHfgATAuyb0F1CUNBw0Ht-1b81g@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] percpu/x86: [RFH] Enable strict percpu checks via
 named AS qualifiers
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 7:55=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Uros,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on driver-core/driver-core-testing]
> [also build test ERROR on driver-core/driver-core-next driver-core/driver=
-core-linus perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-t=
ools tj-wq/for-next linus/master v6.11-rc2 next-20240806]
> [cannot apply to tip/locking/core tip/x86/core dennis-percpu/for-next acm=
e/perf/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/percpu=
-Define-__pcpu_typeof/20240806-024253
> base:   driver-core/driver-core-testing
> patch link:    https://lore.kernel.org/r/20240805184012.358023-4-ubizjak%=
40gmail.com
> patch subject: [RFC PATCH 3/3] percpu/x86: [RFH] Enable strict percpu che=
cks via named AS qualifiers
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/202=
40807/202408071315.cTqH5CME-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240807/202408071315.cTqH5CME-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408071315.cTqH5CME-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):

Dear LKP team,

yes, the patch in this state of RFC will fail for non-x86 arches due
to undefined  __percpu_qual macro. Also, please note that the
preceding [2/3] patch only fixes issues for defconfig x86_64 build,
mainly to not clutter the [2/3] patch with even mode "assorted percpu
fixes". OTOH, I have fixed a bunch of existing issues with x86_64
allyesconfig, uncovered by the patch (and posted relevant patches), to
lower the number of build errors that are now triggered by the patch.

Please also note that a single missing cast can result in dozens of
lines of errors/warnings. Just try to compile bcachefs that needs
__percpu_typeof in its util.h ;) .

Thanks,
Uros.

>
>    In file included from include/linux/percpu.h:5,
>                     from include/linux/percpu_counter.h:14,
>                     from include/linux/sched/user.h:7,
>                     from include/linux/cred.h:18,
>                     from include/linux/sched/signal.h:10,
>                     from include/linux/ptrace.h:7,
>                     from arch/openrisc/kernel/asm-offsets.c:28:
> >> include/linux/alloc_tag.h:30:49: error: expected ':', ',', ';', '}' or=
 '__attribute__' before '*' token
>       30 |         struct alloc_tag_counters __percpu      *counters;
>          |                                                 ^
> >> include/linux/percpu.h:136:22: error: expected '=3D', ',', ';', 'asm' =
or '__attribute__' before '*' token
>      136 | extern void __percpu *pcpu_alloc_noprof(size_t size, size_t al=
ign, bool reserved,
>          |                      ^
> >> include/linux/percpu.h:138:45: error: expected ';', ',' or ')' before =
'*' token
>      138 | extern size_t pcpu_alloc_size(void __percpu *__pdata);
>          |                                             ^
>    include/linux/percpu.h:157:39: error: expected ';', ',' or ')' before =
'*' token
>      157 | extern void free_percpu(void __percpu *__pdata);
>          |                                       ^
>    In file included from include/linux/irqflags.h:17,
>                     from arch/openrisc/include/asm/bitops.h:24,
>                     from include/linux/bitops.h:68,
>                     from include/linux/signal.h:61,
>                     from arch/openrisc/kernel/asm-offsets.c:22:
>    include/linux/percpu.h: In function '__free_free_percpu':
>    include/linux/percpu.h:159:40: error: expected '=3D', ',', ';', 'asm' =
or '__attribute__' before '*' token
>      159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
>          |                                        ^
>    include/linux/cleanup.h:62:54: note: in definition of macro 'DEFINE_FR=
EE'
>       62 |         static inline void __free_##_name(void *p) { _type _T =
=3D *(_type *)p; _free; }
>          |                                                      ^~~~~
> >> include/linux/cleanup.h:62:60: error: '_T' undeclared (first use in th=
is function)
>       62 |         static inline void __free_##_name(void *p) { _type _T =
=3D *(_type *)p; _free; }
>          |                                                            ^~
>    include/linux/percpu.h:159:1: note: in expansion of macro 'DEFINE_FREE=
'
>      159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
>          | ^~~~~~~~~~~
>    include/linux/cleanup.h:62:60: note: each undeclared identifier is rep=
orted only once for each function it appears in
>       62 |         static inline void __free_##_name(void *p) { _type _T =
=3D *(_type *)p; _free; }
>          |                                                            ^~
>    include/linux/percpu.h:159:1: note: in expansion of macro 'DEFINE_FREE=
'
>      159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
>          | ^~~~~~~~~~~
> >> include/linux/compiler_types.h:60:25: error: expected ')' before '__pe=
rcpu_qual'
>       60 | # define __percpu       __percpu_qual BTF_TYPE_TAG(percpu)
>          |                         ^~~~~~~~~~~~~
>    include/linux/cleanup.h:62:67: note: in definition of macro 'DEFINE_FR=
EE'
>       62 |         static inline void __free_##_name(void *p) { _type _T =
=3D *(_type *)p; _free; }
>          |                                                               =
    ^~~~~
>    include/linux/percpu.h:159:31: note: in expansion of macro '__percpu'
>      159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
>          |                               ^~~~~~~~
>    include/linux/cleanup.h:62:66: note: to match this '('
>       62 |         static inline void __free_##_name(void *p) { _type _T =
=3D *(_type *)p; _free; }
>          |                                                               =
   ^
>    include/linux/percpu.h:159:1: note: in expansion of macro 'DEFINE_FREE=
'
>      159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
>          | ^~~~~~~~~~~
> >> include/linux/cleanup.h:62:66: error: void value not ignored as it oug=
ht to be
>       62 |         static inline void __free_##_name(void *p) { _type _T =
=3D *(_type *)p; _free; }
>          |                                                               =
   ^~~~~~~~~~
>    include/linux/percpu.h:159:1: note: in expansion of macro 'DEFINE_FREE=
'
>      159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
>          | ^~~~~~~~~~~
> >> include/linux/percpu.h:159:43: error: implicit declaration of function=
 'free_percpu'; did you mean 'kfree_rcu'? [-Wimplicit-function-declaration]
>      159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
>          |                                           ^~~~~~~~~~~
>    include/linux/cleanup.h:62:78: note: in definition of macro 'DEFINE_FR=
EE'
>       62 |         static inline void __free_##_name(void *p) { _type _T =
=3D *(_type *)p; _free; }
>          |                                                               =
               ^~~~~
>    In file included from <command-line>:
>    include/linux/hrtimer.h: At top level:
> >> include/linux/compiler_types.h:60:25: error: type defaults to 'int' in=
 declaration of '__percpu_qual' [-Wimplicit-int]
>       60 | # define __percpu       __percpu_qual BTF_TYPE_TAG(percpu)
>          |                         ^~~~~~~~~~~~~
>    include/linux/percpu-defs.h:50:9: note: in expansion of macro '__percp=
u'
>       50 |         __percpu __attribute__((section(PER_CPU_BASE_SECTION s=
ec)))     \
>          |         ^~~~~~~~
>    include/linux/percpu-defs.h:101:16: note: in expansion of macro '__PCP=
U_ATTRS'
>      101 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
>          |                ^~~~~~~~~~~~
>    include/linux/percpu-defs.h:112:9: note: in expansion of macro 'DECLAR=
E_PER_CPU_SECTION'
>      112 |         DECLARE_PER_CPU_SECTION(type, name, "")
>          |         ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/hrtimer.h:215:1: note: in expansion of macro 'DECLARE_PE=
R_CPU'
>      215 | DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
>          | ^~~~~~~~~~~~~~~
>    In file included from include/asm-generic/percpu.h:7,
>                     from ./arch/openrisc/include/generated/asm/percpu.h:1=
,
>                     from include/linux/irqflags.h:19:
> >> include/linux/percpu-defs.h:101:34: error: expected ',' or ';' before =
'__typeof__'
>      101 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
>          |                                  ^~~~~~~~~~
>    include/linux/percpu-defs.h:112:9: note: in expansion of macro 'DECLAR=
E_PER_CPU_SECTION'
>      112 |         DECLARE_PER_CPU_SECTION(type, name, "")
>          |         ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/hrtimer.h:215:1: note: in expansion of macro 'DECLARE_PE=
R_CPU'
>      215 | DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
>          | ^~~~~~~~~~~~~~~
>    In file included from include/linux/random.h:153,
>                     from include/linux/nodemask.h:98,
>                     from include/linux/mmzone.h:18,
>                     from include/linux/gfp.h:7,
>                     from include/linux/mm.h:7,
>                     from include/linux/pid_namespace.h:7,
>                     from include/linux/ptrace.h:10:
> >> include/linux/prandom.h:22:56: error: expected ';', ',' or ')' before =
'*' token
>       22 | void prandom_seed_full_state(struct rnd_state __percpu *pcpu_s=
tate);
>          |                                                        ^
> >> include/linux/local_lock.h:54:47: error: expected '=3D', ',', ';', 'as=
m' or '__attribute__' before '*' token
>       54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
>          |                                               ^
>    include/linux/cleanup.h:108:9: note: in definition of macro 'DEFINE_CL=
ASS'
>      108 | typedef _type class_##_name##_t;                              =
          \
>          |         ^~~~~
>    include/linux/local_lock.h:54:1: note: in expansion of macro 'DEFINE_G=
UARD'
>       54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
>          | ^~~~~~~~~~~~
> >> include/linux/local_lock.h:54:47: error: expected ';', ',' or ')' befo=
re '*' token
>       54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
>          |                                               ^
>    include/linux/cleanup.h:109:47: note: in definition of macro 'DEFINE_C=
LASS'
>      109 | static inline void class_##_name##_destructor(_type *p)       =
          \
>          |                                               ^~~~~
>    include/linux/local_lock.h:54:1: note: in expansion of macro 'DEFINE_G=
UARD'
>       54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
>          | ^~~~~~~~~~~~
> >> include/linux/local_lock.h:54:47: error: expected '=3D', ',', ';', 'as=
m' or '__attribute__' before '*' token
>       54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
>          |                                               ^
>    include/linux/cleanup.h:111:15: note: in definition of macro 'DEFINE_C=
LASS'
>      111 | static inline _type class_##_name##_constructor(_init_args)   =
          \
>          |               ^~~~~
>    include/linux/local_lock.h:54:1: note: in expansion of macro 'DEFINE_G=
UARD'
>       54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
>          | ^~~~~~~~~~~~
> >> include/linux/cleanup.h:156:55: error: unknown type name 'class_local_=
lock_t'; did you mean 'class_read_lock_t'?
>      156 |         static inline void * class_##_name##_lock_ptr(class_##=
_name##_t *_T) \
>          |                                                       ^~~~~~
>    include/linux/local_lock.h:54:1: note: in expansion of macro 'DEFINE_G=
UARD'
>       54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
>          | ^~~~~~~~~~~~
>    include/linux/local_lock.h:57:51: error: expected '=3D', ',', ';', 'as=
m' or '__attribute__' before '*' token
>       57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
>          |                                                   ^
>    include/linux/cleanup.h:108:9: note: in definition of macro 'DEFINE_CL=
ASS'
>      108 | typedef _type class_##_name##_t;                              =
          \
>          |         ^~~~~
>    include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_G=
UARD'
>       57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
>          | ^~~~~~~~~~~~
>    include/linux/local_lock.h:57:51: error: expected ';', ',' or ')' befo=
re '*' token
>       57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
>          |                                                   ^
>    include/linux/cleanup.h:109:47: note: in definition of macro 'DEFINE_C=
LASS'
>      109 | static inline void class_##_name##_destructor(_type *p)       =
          \
>          |                                               ^~~~~
>    include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_G=
UARD'
>       57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
>          | ^~~~~~~~~~~~
>    include/linux/local_lock.h:57:51: error: expected '=3D', ',', ';', 'as=
m' or '__attribute__' before '*' token
>       57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
>          |                                                   ^
>    include/linux/cleanup.h:111:15: note: in definition of macro 'DEFINE_C=
LASS'
>      111 | static inline _type class_##_name##_constructor(_init_args)   =
          \
>          |               ^~~~~
>    include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_G=
UARD'
>       57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
>          | ^~~~~~~~~~~~
> >> include/linux/cleanup.h:156:55: error: unknown type name 'class_local_=
lock_irq_t'; did you mean 'class_read_lock_irq_t'?
>      156 |         static inline void * class_##_name##_lock_ptr(class_##=
_name##_t *_T) \
>          |                                                       ^~~~~~
>    include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_G=
UARD'
>       57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
>          | ^~~~~~~~~~~~
> >> include/linux/cleanup.h:203:15: error: expected ':', ',', ';', '}' or =
'__attribute__' before '*' token
>      203 |         _type *lock;                                          =
          \
>          |               ^
>    include/linux/cleanup.h:236:1: note: in expansion of macro '__DEFINE_U=
NLOCK_GUARD'
>      236 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)     =
          \
>          | ^~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_L=
OCK_GUARD_1'
>       60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
>          | ^~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h: In function 'class_local_lock_irqsave_dest=
ructor':
> >> include/linux/cleanup.h:209:15: error: 'class_local_lock_irqsave_t' ha=
s no member named 'lock'
>      209 |         if (_T->lock) { _unlock; }                            =
          \
>          |               ^~
>    include/linux/cleanup.h:236:1: note: in expansion of macro '__DEFINE_U=
NLOCK_GUARD'
>      236 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)     =
          \
>          | ^~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_L=
OCK_GUARD_1'
>       60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
>          | ^~~~~~~~~~~~~~~~~~~
> >> include/linux/percpu-defs.h:219:29: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before '*' token
>      219 |         const void __percpu *__vpp_verify =3D (typeof((ptr) + =
0))NULL;    \
>          |                             ^
>    include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE=
_UNLOCK_GUARD'
>      209 |         if (_T->lock) { _unlock; }                            =
          \
>          |                         ^~~~~~~
>    include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_L=
OCK_GUARD_1'
>       60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
>          | ^~~~~~~~~~~~~~~~~~~
>    include/linux/percpu-defs.h:284:9: note: in expansion of macro '__veri=
fy_pcpu_ptr'
>      284 |         __verify_pcpu_ptr(ptr);                               =
          \
>          |         ^~~~~~~~~~~~~~~~~
>    include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_c=
pu_ptr'
>      289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
>          |                                 ^~~~~~~~~~~
>    include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_c=
pu_ptr'
>      290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
>          |                                 ^~~~~~~~~~~
>    include/linux/local_lock_internal.h:108:36: note: in expansion of macr=
o 'this_cpu_ptr'
>      108 |                 local_lock_release(this_cpu_ptr(lock));       =
  \
>          |                                    ^~~~~~~~~~~~
>    include/linux/local_lock.h:52:9: note: in expansion of macro '__local_=
unlock_irqrestore'
>       52 |         __local_unlock_irqrestore(lock, flags)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:62:21: note: in expansion of macro 'local_u=
nlock_irqrestore'
>       62 |                     local_unlock_irqrestore(_T->lock, _T->flag=
s),
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~
> >> include/linux/percpu-defs.h:219:30: error: '__vpp_verify' undeclared (=
first use in this function)
>      219 |         const void __percpu *__vpp_verify =3D (typeof((ptr) + =
0))NULL;    \
>          |                              ^~~~~~~~~~~~
>    include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE=
_UNLOCK_GUARD'
>      209 |         if (_T->lock) { _unlock; }                            =
          \
>          |                         ^~~~~~~
>    include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_L=
OCK_GUARD_1'
>       60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
>          | ^~~~~~~~~~~~~~~~~~~
>    include/linux/percpu-defs.h:284:9: note: in expansion of macro '__veri=
fy_pcpu_ptr'
>      284 |         __verify_pcpu_ptr(ptr);                               =
          \
>          |         ^~~~~~~~~~~~~~~~~
>    include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_c=
pu_ptr'
>      289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
>          |                                 ^~~~~~~~~~~
>    include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_c=
pu_ptr'
>      290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
>          |                                 ^~~~~~~~~~~
>    include/linux/local_lock_internal.h:108:36: note: in expansion of macr=
o 'this_cpu_ptr'
>      108 |                 local_lock_release(this_cpu_ptr(lock));       =
  \
>          |                                    ^~~~~~~~~~~~
>    include/linux/local_lock.h:52:9: note: in expansion of macro '__local_=
unlock_irqrestore'
>       52 |         __local_unlock_irqrestore(lock, flags)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:62:21: note: in expansion of macro 'local_u=
nlock_irqrestore'
>       62 |                     local_unlock_irqrestore(_T->lock, _T->flag=
s),
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~
> >> include/linux/local_lock.h:62:47: error: 'class_local_lock_irqsave_t' =
has no member named 'lock'
>       62 |                     local_unlock_irqrestore(_T->lock, _T->flag=
s),
>          |                                               ^~
>    include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE=
_UNLOCK_GUARD'
>      209 |         if (_T->lock) { _unlock; }                            =
          \
>          |                         ^~~~~~~
>    include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_L=
OCK_GUARD_1'
>       60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
>          | ^~~~~~~~~~~~~~~~~~~
>    include/linux/percpu-defs.h:284:9: note: in expansion of macro '__veri=
fy_pcpu_ptr'
>      284 |         __verify_pcpu_ptr(ptr);                               =
          \
>          |         ^~~~~~~~~~~~~~~~~
>    include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_c=
pu_ptr'
>      289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
>          |                                 ^~~~~~~~~~~
>    include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_c=
pu_ptr'
>      290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
>          |                                 ^~~~~~~~~~~
>    include/linux/local_lock_internal.h:108:36: note: in expansion of macr=
o 'this_cpu_ptr'
>      108 |                 local_lock_release(this_cpu_ptr(lock));       =
  \
>          |                                    ^~~~~~~~~~~~
>    include/linux/local_lock.h:52:9: note: in expansion of macro '__local_=
unlock_irqrestore'
>       52 |         __local_unlock_irqrestore(lock, flags)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:62:21: note: in expansion of macro 'local_u=
nlock_irqrestore'
>       62 |                     local_unlock_irqrestore(_T->lock, _T->flag=
s),
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:62:47: error: 'class_local_lock_irqsave_t' =
has no member named 'lock'
>       62 |                     local_unlock_irqrestore(_T->lock, _T->flag=
s),
>          |                                               ^~
>    include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE=
_UNLOCK_GUARD'
>      209 |         if (_T->lock) { _unlock; }                            =
          \
>          |                         ^~~~~~~
>    include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_L=
OCK_GUARD_1'
>       60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
>          | ^~~~~~~~~~~~~~~~~~~
>    include/linux/percpu-defs.h:286:9: note: in expansion of macro 'PERCPU=
_PTR'
>      286 |         PERCPU_PTR(ptr);                                      =
          \
>          |         ^~~~~~~~~~
>    include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_c=
pu_ptr'
>      289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
>          |                                 ^~~~~~~~~~~
>    include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_c=
pu_ptr'
>      290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
>          |                                 ^~~~~~~~~~~
>    include/linux/local_lock_internal.h:108:36: note: in expansion of macr=
o 'this_cpu_ptr'
>      108 |                 local_lock_release(this_cpu_ptr(lock));       =
  \
>          |                                    ^~~~~~~~~~~~
>    include/linux/local_lock.h:52:9: note: in expansion of macro '__local_=
unlock_irqrestore'
>       52 |         __local_unlock_irqrestore(lock, flags)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:62:21: note: in expansion of macro 'local_u=
nlock_irqrestore'
>       62 |                     local_unlock_irqrestore(_T->lock, _T->flag=
s),
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:62:47: error: 'class_local_lock_irqsave_t' =
has no member named 'lock'
>       62 |                     local_unlock_irqrestore(_T->lock, _T->flag=
s),
>          |                                               ^~
>    include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE=
_UNLOCK_GUARD'
>      209 |         if (_T->lock) { _unlock; }                            =
          \
>          |                         ^~~~~~~
>    include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_L=
OCK_GUARD_1'
>       60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
>          | ^~~~~~~~~~~~~~~~~~~
>    include/linux/percpu-defs.h:279:10: note: in expansion of macro '__pcp=
u_typeof'
>      279 |         (__pcpu_typeof(*(__p)) __kernel __force *)(ptr__);    =
          \
>          |          ^~~~~~~~~~~~~
>    include/linux/percpu-defs.h:286:9: note: in expansion of macro 'PERCPU=
_PTR'
>      286 |         PERCPU_PTR(ptr);                                      =
          \
>          |         ^~~~~~~~~~
>    include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_c=
pu_ptr'
>      289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
>          |                                 ^~~~~~~~~~~
>    include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_c=
pu_ptr'
>      290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
>          |                                 ^~~~~~~~~~~
>    include/linux/local_lock_internal.h:108:36: note: in expansion of macr=
o 'this_cpu_ptr'
>      108 |                 local_lock_release(this_cpu_ptr(lock));       =
  \
>          |                                    ^~~~~~~~~~~~
>    include/linux/local_lock.h:52:9: note: in expansion of macro '__local_=
unlock_irqrestore'
>       52 |         __local_unlock_irqrestore(lock, flags)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:62:21: note: in expansion of macro 'local_u=
nlock_irqrestore'
>       62 |                     local_unlock_irqrestore(_T->lock, _T->flag=
s),
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock.h:62:57: error: 'class_local_lock_irqsave_t' =
has no member named 'flags'
>       62 |                     local_unlock_irqrestore(_T->lock, _T->flag=
s),
>          |                                                         ^~
>    include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE=
_UNLOCK_GUARD'
>      209 |         if (_T->lock) { _unlock; }                            =
          \
>          |                         ^~~~~~~
>    include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_L=
OCK_GUARD_1'
>       60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
>          | ^~~~~~~~~~~~~~~~~~~
>    include/linux/irqflags.h:171:17: note: in expansion of macro 'typechec=
k'
>      171 |                 typecheck(unsigned long, flags);        \
>          |                 ^~~~~~~~~
>    include/linux/irqflags.h:234:39: note: in expansion of macro 'raw_loca=
l_irq_restore'
>      234 | #define local_irq_restore(flags) do { raw_local_irq_restore(fl=
ags); } while (0)
>          |                                       ^~~~~~~~~~~~~~~~~~~~~
>    include/linux/local_lock_internal.h:109:17: note: in expansion of macr=
o 'local_irq_restore'
>      109 |                 local_irq_restore(flags);                     =
  \
>
>
> vim +136 include/linux/percpu.h
>
> e74e396204bfcb Tejun Heo          2009-03-30  135
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21 @136  extern void __percpu *=
pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  137                        =
          gfp_t gfp) __alloc_size(1);
> b460bc8302f222 Hou Tao            2023-10-20 @138  extern size_t pcpu_all=
oc_size(void __percpu *__pdata);
> 54da6a0924311c Peter Zijlstra     2023-05-26  139
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  140  #define __alloc_percpu=
_gfp(_size, _align, _gfp)                              \
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  141       alloc_hooks(pcpu_=
alloc_noprof(_size, _align, false, _gfp))
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  142  #define __alloc_percpu=
(_size, _align)                                        \
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  143       alloc_hooks(pcpu_=
alloc_noprof(_size, _align, false, GFP_KERNEL))
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  144  #define __alloc_reserv=
ed_percpu(_size, _align)                               \
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  145       alloc_hooks(pcpu_=
alloc_noprof(_size, _align, true, GFP_KERNEL))
> de380b55f92986 Tejun Heo          2010-03-24  146
> 5835d96e9ce4ef Tejun Heo          2014-09-02  147  #define alloc_percpu_g=
fp(type, gfp)                                  \
> 5835d96e9ce4ef Tejun Heo          2014-09-02  148       (typeof(type) __p=
ercpu *)__alloc_percpu_gfp(sizeof(type),       \
> 5835d96e9ce4ef Tejun Heo          2014-09-02  149                        =
                       __alignof__(type), gfp)
> 64ef291f46d795 Tejun Heo          2009-10-29  150  #define alloc_percpu(t=
ype)                                           \
> 5835d96e9ce4ef Tejun Heo          2014-09-02  151       (typeof(type) __p=
ercpu *)__alloc_percpu(sizeof(type),           \
> 5835d96e9ce4ef Tejun Heo          2014-09-02  152                        =
                       __alignof__(type))
> 2c321f3f70bc28 Suren Baghdasaryan 2024-04-14  153  #define alloc_percpu_n=
oprof(type)                                    \
> 2c321f3f70bc28 Suren Baghdasaryan 2024-04-14  154       ((typeof(type) __=
percpu *)pcpu_alloc_noprof(sizeof(type),       \
> 2c321f3f70bc28 Suren Baghdasaryan 2024-04-14  155                        =
               __alignof__(type), false, GFP_KERNEL))
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  156
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  157  extern void free_percp=
u(void __percpu *__pdata);
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  158
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21 @159  DEFINE_FREE(free_percp=
u, void __percpu *, free_percpu(_T))
> 24e44cc22aa311 Suren Baghdasaryan 2024-03-21  160
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
