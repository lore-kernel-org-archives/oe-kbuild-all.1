Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2967431960A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776269909; cv=none; b=gaqMGdgFZKbcldP+u86mr87OvmfSGTuqnvK9TOKGWEHU1nMTXmg2c40d7/0ZHzdPQsoXE41GVPHYiLf/dvrJKmb0b62crk1isyCMQmSiQ8bdvGEDSwiFpPACllKKfXFYoPdssaVdF3niyjA9In6F3PU4O2mW0JeCmkCmSptRAZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776269909; c=relaxed/simple;
	bh=EVPkfwiBpookY0PPuW5dSFee3nY+Inh9ouzmq34Er9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOmkR398kGW+0Ow/svqqdNJO0c3Ht+qpCg8X4gs0HVzsJXD1761EpgJGZL3q5D0bmFonaZJCRKr5fmxsooVGUqO4tOk/ehX/HeJ+agnjuyVw4U6mtu0htDM54W6vrwkehICEIqaJKZdcyA3ngAMHtQCNzAMonC88y4g09NeKHq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPFcxXHd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPFcxXHd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD544C19424
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776269908;
	bh=EVPkfwiBpookY0PPuW5dSFee3nY+Inh9ouzmq34Er9E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PPFcxXHdTiR2Pz3MFJcIbtVKD6+MYOmlymXcj+ghZCjzUxzrZT4WhmkP20YpCQxsw
	 JHIG+rBKv3GzjTQtglZrk8fqLrudWwiZr2R51P5/weJnm8EKI1vKMFUUVVAz/z6wX8
	 ZvnD9qBgS+MA6WQEeM43Wf4BrvC3kgM0ODgMU+8zmhb0LIxN44/lYjoQiaJJtSSdOI
	 TxKlCK6hq7EVi+4115YhQk6vUvW85WHElEhhiNiM6Mcy6vzedKEMZgvzGMvEbVwQxR
	 YSq7MnNql9EiYtuuMlMrT+MQKL8wZ892ev05L16G1KJnpKDnh9/fSnGlFYKrvVX9fd
	 r49xHZOlzq2cA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e4a04f059so6701507e87.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 09:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ZRjeslSEtsXX9AF5W/VayI/yEjwc1ONURrwZO0gVVYwlT9UcFT+kZMmCAsFwJrrQ7bMnjzCWcXfkENXq2@lists.linux.dev
X-Gm-Message-State: AOJu0YzRU+M8/W5fadraNM+NOOkNczrBc/HO2cCCsBuaS8H4dWQg7NDP
	/1bwAV/Mtql36eda1fQXiF/lpTlamubElMibwPQ0p4TcFyHm8bg7i+YBIuyfsMcluBBIxkuTvf4
	9cHErchfUM22rrKZD9sPA8tyGII51Y64=
X-Received: by 2002:a05:6512:3049:b0:5a1:3da4:e92f with SMTP id
 2adb3069b0e04-5a3efe8e5a0mr6046875e87.43.1776269907441; Wed, 15 Apr 2026
 09:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202602110708.x7AYvCN7-lkp@intel.com> <aYxi3KG0gHBBbqox@smile.fi.intel.com>
 <aYxomlXamlNiNa8G@smile.fi.intel.com> <aYyKYa36G-X-ScN2@smile.fi.intel.com>
 <933de445-c15d-49f6-a5f9-026eff6e4e06@gmx.de> <aY2i0vuq1TG-yEhn@pathway.suse.cz>
In-Reply-To: <aY2i0vuq1TG-yEhn@pathway.suse.cz>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 15 Apr 2026 12:17:50 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kv0Xm02_3ZYNmL98=OpriF8G_Qa+X1szshPps4mECeoA@mail.gmail.com>
X-Gm-Features: AQROBzCrOWdymBQQVmRcjKggDrrNGBqkTESKzL3C0qt42_6XK0qPnC64ysgI0C0
Message-ID: <CAJ-ks9kv0Xm02_3ZYNmL98=OpriF8G_Qa+X1szshPps4mECeoA@mail.gmail.com>
Subject: Re: [linux-next:master 9199/12313] include/linux/compiler_types.h:617:38:
 error: call to '__compiletime_assert_304' declared with attribute error:
 BUILD_BUG_ON failed: IS_ERR(PTR)
To: Petr Mladek <pmladek@suse.com>
Cc: Helge Deller <deller@gmx.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 4:52=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Wed 2026-02-11 17:27:47, Helge Deller wrote:
> > On 2/11/26 14:55, Andy Shevchenko wrote:
> > > +Helge, do you have any insights on this?
> > >
> > > The original mail is here:
> > > https://lore.kernel.org/r/202602110708.x7AYvCN7-lkp@intel.com
> > >
> > > On Wed, Feb 11, 2026 at 01:31:41PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Feb 11, 2026 at 01:07:12PM +0200, Andy Shevchenko wrote:
> > > > > On Wed, Feb 11, 2026 at 07:15:01AM +0800, kernel test robot wrote=
:
> > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/li=
nux-next.git master
> > > > > > head:   fd9678829d6dd0c10fde080b536abf4b1121c346
> > > > > > commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 [9199/12313] p=
rintf: convert test_hashed into macro
> > > > > > config: parisc-randconfig-r122-20260211 (https://download.01.or=
g/0day-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/config)
> > > > > > compiler: hppa-linux-gcc (GCC) 8.5.0
>
> I guess that the test bot is using GCC 8.5 because 8.1 should be the mini=
mal
> supported version, see Documentation/process/changes.rst.
>
> > > > > > reproduce (this is a W=3D1 build): (https://download.01.org/0da=
y-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/reproduce)
> > > > > >
> > > > > > If you fix the issue in a separate patch/commit (i.e. not just =
a new version of
> > > > > > the same patch/commit), kindly add following tags
> > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202602110708.x7=
AYvCN7-lkp@intel.com/
> > > > > >
> > > > > > All errors (new ones prefixed by >>):
> > > > >
> > > > > Very interesting case. My theory is that this is a compiler bug o=
r
> > > > > a rare corner case. When test_hashed was converted to a macro it
> > > > > affects the scope of PTR in errptr(). And compiler most likely
> > > > > mistakenly drops it's value to 0.
> > > > >
> > > > > OTOH, I do not believe that it's a problem of IS_ERR_VALUE() impl=
ementation
> > > > > since that it is so low level C standard integer promotion rules =
and should
> > > > > be covered very well by compiler tests, etc.
> > > > >
> > > > > However, it might be possible (but very unlikely) that the 32-bit
> > > > > value is considered smaller than (unsigned long)-MAX_ERRNO. If
> > > > > this a case, why only now? The change was introduces in 2019 to
> > > > > have this BUILD_BUG_ON()?
> > > > >
> > > > > TL;DR: Changing a compiler version might help, I think?
> >
> > I think so too.
> >
> > > > So, PTR was used in two places in errptr():
> > > >
> > > >          BUILD_BUG_ON(IS_ERR(PTR));
> > > >          test_hashed(kunittest, "%pe", PTR);
> > > >
> > > > The compiler has seen that PTR is always used (it was static inline=
).
> > > > When it was converted to a macro, the stage that does some pass now
> > > > probably thinks that PTR may be eliminated even if it has non-0 val=
ue!
>
> Honestly, I have no idea what is going on here and why inlining would
> mater. But google pointed me to a discussion where the inlining was
> mentioned:
>
> <paste>
> Oh! This function is defined inline and not __always_inline, so that's
> the problem. BUILD_BUG_ON will always fail if the values used in
> the condition are not compile-time constants. So you can comment out
> the BUILD_BUG_ON or change inline to __always_inline if you want
> to get going asap. I can probably reproduce it by setting the max
> inline insns to a low value and I'm guessing that's why it's occurring
> for you -- your compiler may have a different default max inline insns
> value than mine, so it just exposed this bug. In fact, it would make
> sense for Debian to patch their gcc like that, it likely results in
> slightly smaller executables.
> </paste>
>
> , see
> https://github.com/daniel-santos/mcp2210-linux/issues/7#js-repo-pjax-cont=
ainer
>
> I have no idea if this was similar scenario or a completely different
> one. But it seems that inlining affect how complilers handle
> BUILD_BUG_ON()...
>
> > > > But again, my knowledge in all this is close to 0, especially for P=
A-RISC.
> > > > I'm purely speculating here based on my experience, intuition, and =
current
> > > > code base of the Linux kernel.
> >
> > I tried to reproduce, but my cross-compiler does not trigger:
> > hppa-linux-gnu-gcc (GCC) 15.2.1 20250808 (Red Hat Cross 15.2.1-1)
> >
> > Preprocessed source is:
> >
> > # 76 "/home/cvs/parisc/git-kernel/linus-linux-2.6/include/linux/err.h"
> > static inline __attribute__((__gnu_inline__)) __attribute__((__unused__=
)) __attribute__((__no_instrument_function__)) bool __attribute__((__warn_u=
nused_result__)) IS_ERR( const void *ptr)
> > {
> >  return __builtin_expect(!!((unsigned long)(void *)((unsigned long)ptr)=
 >=3D (unsigned long)-4095), 0);
> > }
> > ...
> > static void errptr(struct kunit *kunittest) {
> > ...
> >  do { __attribute__((__noreturn__)) extern void __compiletime_assert_30=
5(void) __attribute__((__error__("BUILD_BUG_ON failed: " "IS_ERR(PTR)"))); =
if (!(!(IS_ERR(((void *)0x456789ab))))) __compiletime_assert_305(); } while=
 (0);
> >
> > I will try to check again, but I believe upgrading the compiler should =
fix it.
>
> Hmm, I am not sure if upgrading the compiler is an option here.
> I guess that they use the old version on purpose.
>
> I think about reverting the commit 9bfa52dac27a20b43 ("printf: convert
> test_hashed into macro") if we can't find a better solution.
>
> I am sorry. I do not have time to play with this.
>
> Best Regards,
> Petr

This was fixed by
https://lore.kernel.org/all/ad5gJAX9f6dSQluz@pathway.suse.cz/ after an
identical report on the same compiler version.
