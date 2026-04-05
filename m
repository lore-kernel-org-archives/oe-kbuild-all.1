Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6DF28AB0B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Apr 2026 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775410576; cv=none; b=qooW/5u2Or0HUoWVyh46Y9YIrnDbt5jDdpLp91/1rFxoRLQTzGaapE2u3DNYWdh0hVXUPZ3kz8O1FjtNQLti3Z3e14g8y08Co9jZknlkyIwmKhzICIbaxbJ4yl9hW9YSOq0WheMx1q/0ucgR3Yp5NkLvYlPDaAwvkMr1tmgGZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775410576; c=relaxed/simple;
	bh=I8A6l3XnoPXrv8CnrJ2xbgzCX7pHZvWiNoWYFbr9xEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4M7TM8De1ibQnfExEQov9FpE2yb9kF3UwCVVY39oGiWH92LPtmSDIM/09GRmOWC+M25U+I2NGwtsYtjldnUUcnO4JSj5JEjtgkUuAL8Dk+vVBypBEUGOhcFU8u9llt1VKUL8ro5eXBoT03o7Iyw38RQ34jyfwtAyw5uPIpY/6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BR5rbsUo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BR5rbsUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86F2C2BC9E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Apr 2026 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775410575;
	bh=I8A6l3XnoPXrv8CnrJ2xbgzCX7pHZvWiNoWYFbr9xEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BR5rbsUogK+PjtFnzjKhA5uVMKeLsih7xwOWf70gP3FPBk842oVNCbBkUj1px6uWt
	 qRtWGYE+5p08T8XFBp/VOl78m3n88myxsQam7h40+fDKE3kGqx5DmLPWlAwthUyHRd
	 +DokUqEyxxD4nnLYiZk32DK+JmIsbig8HjKZxkDe37pFrADwyfx33x4rq5iNbRYEke
	 GjXE/rMitP5ElTayLkGjybj6H0z9a7akpZdWVv5BcvUFV7Q1ApOrfA0AIXLjaIlGJ9
	 VhrS/S94hx12lK5Y3O/umzjV46jqX/td4gu3w5KlE2BEn/dqJUWB6sU9Lye0u70i2C
	 jtbsUlc+imILQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38a43f1f978so33157621fa.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 05 Apr 2026 10:36:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYnEHAhoBbh5UoOZDkfsuIsityLHT4P/lLnq107JlHlX8htegSvcOZ+jcS/IYy98ML0yGPJvP2VyR/O2f0@lists.linux.dev
X-Gm-Message-State: AOJu0Yxke3G8HrlFCKMMJn1MrK0gwQf+JihWv88cKKeivgdCaux6N5Uq
	UMGv/kQWbGI2jUKK8txloPIce2Vyw3n0zG7kRv37giEASgjCXM/KIUnrS3EkAKHpMo61Yz/AJR8
	tTFowCpfVQzzdP1EJho0STeowVkW9QPM=
X-Received: by 2002:a2e:9a11:0:b0:38b:fd3e:c445 with SMTP id
 38308e7fff4ca-38d8d34c11bmr27247901fa.3.1775410574517; Sun, 05 Apr 2026
 10:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604030636.NqjaJvYp-lkp@intel.com> <CAJ-ks9m+ZtqbiM5qo0+htjkuyiVu9xfTmGNzBqaa--rGfPpT7A@mail.gmail.com>
 <adFouCDpj72fdUcK@ashevche-desk.local>
In-Reply-To: <adFouCDpj72fdUcK@ashevche-desk.local>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 5 Apr 2026 13:35:38 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kzRovO9TtEoZzEEXDtzrb-1BOJPtoHmUuzY-9fbVaEbw@mail.gmail.com>
X-Gm-Features: AQROBzBMIJbrWS62s1uHxhvAKG-LknS3KrCcMQ2o5IRnlzZoE1tUdd9VUhy_fOg
Message-ID: <CAJ-ks9kzRovO9TtEoZzEEXDtzrb-1BOJPtoHmUuzY-9fbVaEbw@mail.gmail.com>
Subject: Re: include/linux/compiler_types.h:617:38: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: IS_ERR(PTR)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 3:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Apr 04, 2026 at 12:04:02PM -0400, Tamir Duberstein wrote:
> > On Fri, Apr 3, 2026 at 4:45=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
> > > commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 printf: convert test=
_hashed into macro
> > > date:   9 weeks ago
>
> ...
>
> > I used an LLM to investigate this, including bisecting GCC. Here's
> > what we found:
>
> Have you talked to Max Filippov who is arch maintainer in kernel?
>
> ...
>
> > > So I see two possible mitigations:
> > >
> > > 1. Work around this in the test by avoiding IS_ERR() in that
> > >    BUILD_BUG_ON(), e.g. use the raw MAX_ERRNO range check instead:
> > >
> > >    BUILD_BUG_ON((unsigned long)PTR >=3D (unsigned long)-MAX_ERRNO);
> > >
> > >    That keeps the same build-time check but avoids routing a constant
> > >    expression through unlikely() under branch profiling, so GCC 8.5 n=
o
> > >    longer trips over it.
>
> I believe it's close to "not an option" as it's a non-scalable change.
> If in the future IS_ERR() becomes something else (but still covers
> the same check) this will be in unsync and might trigger in a wrong
> circumstances (while I don't believe it will happen IRL).
>
> > > 2. Stop running xtensa randconfig with GCC versions older than the
> > >    ipa-split fix above, i.e. use GCC >=3D 12.1 for xtensa in LKP.
>
> This is also close to that "not an option" as we have Linux kernel wide
> minimum GCC requirement.
>
> Yes, theoretically any of the above is possible, but I dunno from where
> the pushback may come.
>
> > > I had a quick look at lkp-tests, but I don't see an xtensa-specific
> > > compiler selection policy there; make.cross appears to consume an
> > > already-chosen COMPILER value. So if the preferred mitigation is
> > > toolchain-side, that policy likely lives in the 0day/LKP scheduler or
> > > job-generation layer outside lkp-tests.
> > >
> > > One caveat on the reporting side: if other architectures are already
> > > using newer GCC, or if 0day suppresses duplicate reports after the fi=
rst
> > > failing instance, that would explain why this only showed up as an
> > > xtensa GCC 8.5 report even though the underlying compiler bug is not
> > > xtensa-specific in principle.
> >
> > Human again.
> >
> > Petr, Andy: Would you like me to send a patch with the workaround?
> >
> > LKP folks: Is GCC 8.5 only used for xtensa, or are old compiler
> > versions also exercised by other architectures, and was this just the
> > first one to hit this condition? If the former, is it possible to bump
> > xtensa to GCC 12.1 or later?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

I sent https://lore.kernel.org/all/20260405-printf-test-old-gcc-v1-1-76d24d=
9bb60e@kernel.org/
with what I think is a reasonable workaround.
