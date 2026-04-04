Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB6361DA9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Apr 2026 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775318680; cv=none; b=P4pXrQavY/dzFdJr6MQmOppSyxe4jPNJC1N/plTWv8PhVNBs9MulxsbK4RRZ9OM9T7irh8BcUqR7P1fnwwAh3RSWn2aYP3LLtcZQKVJFjHcc8BWtvrFGlHWn/03YuD6cJ8RojMYtPCRJo3RUfRcQwuTfUMJO+SigjiaIJteNa+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775318680; c=relaxed/simple;
	bh=xyVgCng/WyCf+sxgQxLelPdwlu8UF74Ne6rhLa8SZk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+M3dHA5lpQgqRrjtPvJdR/KR9iVArH0Ro6SA3Nww9Dj6dPyslsaVFw0R3hi1I8c8vBKOFOUAQOPVz5oziG9hEzy/eOvwDeK5PPOqQR2Ogl0ri5V+gZnqATTX5LScCN/+uML+2XcvFSiuNzOeJzc+d7rwvT/OFpUXGxG1i8tHP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCzkRXEQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCzkRXEQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595D3C19421
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Apr 2026 16:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775318680;
	bh=xyVgCng/WyCf+sxgQxLelPdwlu8UF74Ne6rhLa8SZk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VCzkRXEQ7nk7ya4yaWz4fcUd93N7aYO7wE8cFzjSYnChNq5cOOhMJCvscOKry5jsy
	 aNuCFHApc8cdxJI2IWBJ/KN2s6sOMVRsunY6pgV4rdVWJ71ETNn5a4eoiUBAdo8uEK
	 9C5ONyjl28716AfTY22LQ94wj6GClm1zpH+HRoYgCmNGXWND82bbazBxRfRNCLMVGT
	 FjaG+ejSBtV47Zmgzw8h0iCTUxZXPzUQo92e0SeyGooSG3KsHg2BhDkBztAgwBqEN5
	 0VHsUePFSZjovpRho4Sl4gQ/8Ceam2bQW+rOVFPKdueLzux5H1Wuiamx/ObtkG8abb
	 n99IYjoNNhTtw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso22658021fa.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 04 Apr 2026 09:04:40 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy+vsdEUC0dSDUOOIMDugpfUCQTQwW30BRt+DcmcxInw51WVdTn
	S/hSM9/hsdg7w8WDwC/Kgx7aFo66Apf8q5O39oWfchjqDspCk3uKSsF+gMFzBs3SEeUsPIW+Nw7
	lWIu6uaSHoNZ/jZaZFVetzVC5C55U1/4=
X-Received: by 2002:a2e:a105:0:b0:38c:13c8:a4b2 with SMTP id
 38308e7fff4ca-38d91c196e0mr23454361fa.17.1775318678916; Sat, 04 Apr 2026
 09:04:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604030636.NqjaJvYp-lkp@intel.com>
In-Reply-To: <202604030636.NqjaJvYp-lkp@intel.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 4 Apr 2026 12:04:02 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9m+ZtqbiM5qo0+htjkuyiVu9xfTmGNzBqaa--rGfPpT7A@mail.gmail.com>
X-Gm-Features: AQROBzDHKRDpu-hwGQZrXy7JsQmBkAO-zGfQi_yO5RywFXOBu2LFiKoiCQ1j7ak
Message-ID: <CAJ-ks9m+ZtqbiM5qo0+htjkuyiVu9xfTmGNzBqaa--rGfPpT7A@mail.gmail.com>
Subject: Re: include/linux/compiler_types.h:617:38: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: IS_ERR(PTR)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Petr Mladek <pmladek@suse.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 4:45=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Tamir,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
> commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 printf: convert test_has=
hed into macro
> date:   9 weeks ago
> config: xtensa-randconfig-002-20260403 (https://download.01.org/0day-ci/a=
rchive/20260403/202604030636.NqjaJvYp-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260403/202604030636.NqjaJvYp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: 9bfa52dac27a ("printf: convert test_hashed into macro")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604030636.NqjaJvYp-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from <command-line>:
>    lib/tests/printf_kunit.c: In function 'errptr.part.2':
> >> include/linux/compiler_types.h:617:38: error: call to '__compiletime_a=
ssert_304' declared with attribute error: BUILD_BUG_ON failed: IS_ERR(PTR)
>      _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER=
__)
>                                          ^
>    include/linux/compiler_types.h:598:4: note: in definition of macro '__=
compiletime_assert'
>        prefix ## suffix();    \
>        ^~~~~~
>    include/linux/compiler_types.h:617:2: note: in expansion of macro '_co=
mpiletime_assert'
>      _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER=
__)
>      ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compilet=
ime_assert'
>     #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                         ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG=
_ON_MSG'
>      BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>      ^~~~~~~~~~~~~~~~
>    lib/tests/printf_kunit.c:758:2: note: in expansion of macro 'BUILD_BUG=
_ON'
>      BUILD_BUG_ON(IS_ERR(PTR));
>      ^~~~~~~~~~~~
>
>
> vim +/__compiletime_assert_304 +617 include/linux/compiler_types.h
>
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  603
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  604  #define _compiletime_assert(=
condition, msg, prefix, suffix) \
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  605     __compiletime_assert(cond=
ition, msg, prefix, suffix)
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  606
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  607  /**
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  608   * compiletime_assert - brea=
k build and emit msg if condition is false
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  609   * @condition: a compile-tim=
e constant condition to check
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  610   * @msg:       a message to =
emit if condition is false
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  611   *
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  612   * In tradition of POSIX ass=
ert, this macro will break the build if the
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  613   * supplied condition is *fa=
lse*, emitting the supplied error message if the
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  614   * compiler has support to d=
o so.
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  615   */
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  616  #define compiletime_assert(c=
ondition, msg) \
> eb5c2d4b45e3d2d Will Deacon 2020-07-21 @617     _compiletime_assert(condi=
tion, msg, __compiletime_assert_, __COUNTER__)
> eb5c2d4b45e3d2d Will Deacon 2020-07-21  618
>
> :::::: The code at line 617 was first introduced by commit
> :::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compilet=
ime_assert() macros into compiler_types.h
>
> :::::: TO: Will Deacon <will@kernel.org>
> :::::: CC: Will Deacon <will@kernel.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I used an LLM to investigate this, including bisecting GCC. Here's
what we found:

> I think this is a pre-existing GCC bug, and commit 9bfa52dac27a
> ("printf: convert test_hashed into macro") is only the trigger.
>
> What changed in that commit is that test_hashed() became a macro, so
> errptr() now contains the local char buf[64] and the
> plain_hash_to_buffer() / test() logic directly instead of calling an
> out-of-line helper. With the reported xtensa randconfig, that changes
> GCC's IPA inlining/splitting decisions enough to expose a compiler bug.
>
> The actual failure mode is:
>
> BUILD_BUG_ON(IS_ERR(PTR));
>
> in lib/tests/printf_kunit.c. PTR is not an ERR_PTR on xtensa 32-bit, so
> the assertion is logically false. But with CONFIG_TRACE_BRANCH_PROFILING=
=3Dy
> and CONFIG_PROFILE_ALL_BRANCHES=3Dy, IS_ERR()'s unlikely() and the
> BUILD_BUG_ON() condition expand into branch-profiling counter updates.
> GCC 8.5 then IPA-splits errptr(), outlines the cold assert arm into
> errptr.part.*, and leaves that clone with an unconditional call to
> _compiletime_assert(), so the build fails even though the path is
> unreachable.
>
> I confirmed that -fno-partial-inlining or -DDISABLE_BRANCH_PROFILING
> makes the failure go away.
>
> I also bisected GCC with a reproducer that forces
> --param=3Dmax-inline-insns-auto=3D30 so the bug is not hidden by unrelate=
d
> inlining heuristic changes. GCC 11.5.0 still reproduces, GCC 12.1.0
> does not, and the first real fix appears to be:
>
> 76fe494230477a69f8fa8c8ca2d493acaf343eb1
> Fix tree-optimization/101941: IPA splitting out function with error attri=
bute

Human note: That change was motivated by exactly this kind of
compilation failure in the kernel [0].

[0] https://github.com/gcc-mirror/gcc/commit/76fe494230477a69f8fa8c8ca2d493=
acaf343eb1

>
> That commit teaches ipa-split not to split basic blocks containing calls
> to functions with attribute((error)) or attribute((warning)),
> which is exactly what goes wrong here.
>
> So I see two possible mitigations:
>
> 1. Work around this in the test by avoiding IS_ERR() in that
>    BUILD_BUG_ON(), e.g. use the raw MAX_ERRNO range check instead:
>
>    BUILD_BUG_ON((unsigned long)PTR >=3D (unsigned long)-MAX_ERRNO);
>
>    That keeps the same build-time check but avoids routing a constant
>    expression through unlikely() under branch profiling, so GCC 8.5 no
>    longer trips over it.
> 2. Stop running xtensa randconfig with GCC versions older than the
>    ipa-split fix above, i.e. use GCC >=3D 12.1 for xtensa in LKP.
>
> I had a quick look at lkp-tests, but I don't see an xtensa-specific
> compiler selection policy there; make.cross appears to consume an
> already-chosen COMPILER value. So if the preferred mitigation is
> toolchain-side, that policy likely lives in the 0day/LKP scheduler or
> job-generation layer outside lkp-tests.
>
> One caveat on the reporting side: if other architectures are already
> using newer GCC, or if 0day suppresses duplicate reports after the first
> failing instance, that would explain why this only showed up as an
> xtensa GCC 8.5 report even though the underlying compiler bug is not
> xtensa-specific in principle.

Human again.

Petr, Andy: Would you like me to send a patch with the workaround?

LKP folks: Is GCC 8.5 only used for xtensa, or are old compiler
versions also exercised by other architectures, and was this just the
first one to hit this condition? If the former, is it possible to bump
xtensa to GCC 12.1 or later?

Cheers.

Tamir
