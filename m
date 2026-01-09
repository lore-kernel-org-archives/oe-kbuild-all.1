Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC23733556E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952774; cv=none; b=l/1t97p0LJpX38jXK2C3Os1GySdgCc9fpKtTzmpd45M/+YEuMSHnzwxVtWwzylPYfMpLW71M/pcws6dTJ9XBkWwTVKcPdEvQcVCR2Mpw95Q2KN99x87QsZqjLaERDwAody09lSD7gETW4zJeUXk/44JYlMSl9ItkfUaqzLpI04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952774; c=relaxed/simple;
	bh=LZqrWDWTbIDrSdAD71KA7FejUHmPysfIUvdtncvlfKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSn2ItmPzOO0sDHvuWWQaBUmamJXUo6xu0BgES7IxW8nrINqp0jJxcJwBo3KOJDkJxE8JmsV0cG/d0pucGVeqgO++ZCAQfmUr1HE7bqwqtBvmwMwac+sO3KkEJD8HYYWGS+zY8rA9YMiIz846TLIa3fVqsrBGsyR+aXMwA03eB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kK/pmPuJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kK/pmPuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF13CC19424
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767952773;
	bh=LZqrWDWTbIDrSdAD71KA7FejUHmPysfIUvdtncvlfKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kK/pmPuJrvyyiwbA6vSwLsyYrGo56fLiZDs5EMnjNQIIDnBBtEsvx4J/kkVB46Gl/
	 TknbapiBzHZIHIpnQiNoh7DI3pAgvPcncIEbGXHeOiWY00iY8Tuz4wmOF9PGqq2d1g
	 q60uw1XQ/8zr6h0E5noT7z8IOal7Tl1CGktpDFTFZzZwZ96+5y6f0LXLvfPUW/v+je
	 yX5HlsM23SlB8BMCJP9iOzis9BsyVzvJgHxUK/75m1jaUeZHXYJozKakCjd26iExzi
	 t+/R3E1TpX7u7O46fAsB7/eHzpmVvPeAmPU/m2dAaCUlrXBKP2YsEKhPCmXNUGvf/q
	 ILJFYPmERafaA==
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0f3f74587so33890855ad.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Jan 2026 01:59:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlFZwLMouWXUvSQGK4CqfniHNY0wFSfkDgi5REQqyXz1vodVbubS/TPgFyVzCzsE24lLeXaqmV994t2fl7@lists.linux.dev
X-Gm-Message-State: AOJu0Yw32gt7we/v370jOTEVxilLociBq/mIAJrnSfRRRmLu4FNEwtKj
	zDuZkPWz9xPb5bTROBYnVWi4+chDKTZUyJfa8dyXW0dpTk6V5I5H0Q8Xp/cB09HgFqcbmbtdW9D
	GIH/uYnQLyDKUVYK5siKlpQg74h/Yw10=
X-Google-Smtp-Source: AGHT+IGrbRetguYoybNkQKDlNdppaa9rD7nNlywiwGgjsunAkMECDoUhmYB8SkLaUuN3hyN6tGYVk9Sq/oPFzzfNB5o=
X-Received: by 2002:a17:902:f549:b0:295:195:23b6 with SMTP id
 d9443c01a7336-2a3ee4f39c4mr86961425ad.55.1767952773361; Fri, 09 Jan 2026
 01:59:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601011320.wfOmjyKl-lkp@intel.com> <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
 <CAMj1kXF4kfpvzT+-GzLFBNBb=aTN8Km0tumTm2Kw9zbu4iRuVg@mail.gmail.com>
 <aV+HboykUV1ac4Oo@rli9-mobl> <CAMj1kXH4NysHuvSyeJtyRENLe-6ua3zij-vMcz0Dyw8o3JVjBw@mail.gmail.com>
 <aWDM1OMaaoLKAp9M@xsang-OptiPlex-9020>
In-Reply-To: <aWDM1OMaaoLKAp9M@xsang-OptiPlex-9020>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 9 Jan 2026 10:59:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHdvfcUAf96QLyme9eQ6jw3WjT5JzP+-NngVAkFKaUwsA@mail.gmail.com>
X-Gm-Features: AQt7F2p417HP2DcTInPzGneZG-_NkR0gbFQjARrNnuAR0HaZgMLrcv4gT2V8dTY
Message-ID: <CAMj1kXHdvfcUAf96QLyme9eQ6jw3WjT5JzP+-NngVAkFKaUwsA@mail.gmail.com>
Subject: Re: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation R_X86_64_32S
 against `.rodata.str1.8' can not be used when making a PIE object; recompile
 with -fPIE
To: Oliver Sang <oliver.sang@intel.com>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Jan 2026 at 10:39, Oliver Sang <oliver.sang@intel.com> wrote:
>
> hi, Ard Biesheuvel,
>
> On Thu, Jan 08, 2026 at 11:33:54AM +0100, Ard Biesheuvel wrote:
> > On Thu, 8 Jan 2026 at 11:31, Philip Li <philip.li@intel.com> wrote:
> > >
> > > On Thu, Jan 08, 2026 at 11:25:42AM +0100, Ard Biesheuvel wrote:
> > > > On Thu, 1 Jan 2026 at 17:03, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > >
> > > > > This does not reproduce. Where are the build artifacts?
> > > > >
> > > >
> > > > I kindly ask again: where can I see the build artifacts that produced
> > > > this error?
> > >
> > > Sorry for not responding in time, we just start the investigation. So far,
> > > it found the internal build has set below extra flags for x86_64, which probably
> > > leads to this issue.
> > >
> > >         KBUILD_CFLAGS_KERNEL=" -falign-functions=64"  KBUILD_CFLAGS_MODULE=" -DMODULE -falign-functions=64"
> > >
> >
> > Why would you pass additional C flags and not mention this in the reports?
> >
> >
> > > But we haven't got further root cause.
> > >
> >
> > Thanks, standing by for further updates.
> >
>
> by further check, the issue is reproduced with
> KBUILD_CFLAGS_KERNEL=" -falign-functions=64"
>
> sorry that the reproducer in [1] is not correct. need append the flag.
>
> so below can be used to reproduce with gcc-14:
>
> mkdir build_dir && cp config build_dir/.config
> make KBUILD_CFLAGS_KERNEL=" -falign-functions=64" W=1 O=build_dir ARCH=x86_64 olddefconfig
> make KBUILD_CFLAGS_KERNEL=" -falign-functions=64" W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
>
> but we don't have good idea about the compatibility of this flag with your
> change?
>
> +ldflags-$(CONFIG_RANDOMIZE_BASE)       := --pie -z notext $(ldflags-pie-y)
>
> not sure if you still need vmlinux.o from us which is 300+ M. if so, I will
> upload it. thanks
>

Thanks Oliver!

I think the problem is the use of KBUILD_CFLAGS_KERNEL in general. I
don't think you are supposed to set it from the command line like
that.

As per Documentation/kbuild/kbuild.rst, the environment variable to
use is CFLAGS_KERNEL.
