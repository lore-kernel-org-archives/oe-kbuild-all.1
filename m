Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6C912B87
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 17:39:25 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-41095b84d8eso23050581cf.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693244364; x=1693849164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kSj31rwVKrv076e7Abpj9cwjTTMUao8+EwyDbp8qq8=;
        b=GQKIrcb8OBlUQDD3GVtasxZaTtfA/DYTJ8I0GMi6A3oZum2rOHaMl1SXRC+wThSTeJ
         tL/wSFYzC2x0sLbpBLmt+rUWcRh0OF3lNIfZZWkxQmvcwQ7DH1jw/6Tbdjmqi8wDd2pm
         Ga7QbmvwABhYFw2ldHtcdmYGUSe+7s34iQXePqdGzgYQExskUJ9sUYsAURfhSy1ajRPh
         GShFdZEDqLJbWF2v/4DwptdOeRHxBEKdJK//4y0D91N0GwMh6I43z8rxi81jEUACF1dJ
         vJIJpqAejfFBJnrwVvOYetFvRYuG+7EjTPlov6WSlbGcTJP7HMIyx1lnT1Ub+MFXUguF
         Q9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693244364; x=1693849164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kSj31rwVKrv076e7Abpj9cwjTTMUao8+EwyDbp8qq8=;
        b=YOyzC8Z46mUHxTjGXVWCvIWPNMHqP6Az7+3yTeMNvWxjS3WblsqNcF2IIa+oTRVAyY
         9FPIWpGjKsNAvuHYKjtwbiVeJ2juKEuaIBfNz8uKwVpa4qxtY44YB07VFf6wOglbEjf7
         tVvt+jwIkXauuh8YNWPvvlNT2WqvH9FmxINSXWbv/EWOvcuv2OOJ5StpYNjSVBchKnPa
         JcRloEY7IPXZaoCVjgqTKcHvhTYPsk2W1p5Szd6VybH6d3C4GrAPHM1i8zBX3QnUmUko
         S5koufsvfRgK0GB9TqMDSJx4OsD4qffWA/6OeJdZMqvfm1PadJIci/zyfSwvrUdhwUvp
         VwEQ==
X-Gm-Message-State: AOJu0YyC97QvE25WiE4xC7T4E6vfhVPSJLZuOkjIRVinNOSI6A5fqoVC
	LwLIEeeykWvqf9suAXFsFAa1H0KyzOdF872xB6tpkA==
X-Google-Smtp-Source: AGHT+IG+LS5Bjz3EggMJ4+V1bAB6E9iFY/UDWQjOtOB4bcGyGb5qQZgjcn492MEBEDuBWqejyiTWQZWKWfqhcN0b20Y=
X-Received: by 2002:a0c:9782:0:b0:64f:460f:bd1c with SMTP id
 l2-20020a0c9782000000b0064f460fbd1cmr23972114qvd.15.1693244363853; Mon, 28
 Aug 2023 10:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308260344.Vc4Giuk7-lkp@intel.com> <CAKwvOdk=UvBxv7a2cV-Z_zK0CwzPSjBnQ0SQHaVAEUodA=hfQQ@mail.gmail.com>
 <874jkkvhzj.fsf@mail.lhotse>
In-Reply-To: <874jkkvhzj.fsf@mail.lhotse>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Aug 2023 10:39:13 -0700
Message-ID: <CAKwvOdkO77jDijPwqkQJz6bGhjm5-3xWkTXbaxtXL8eZsqTi3g@mail.gmail.com>
Subject: Re: [linuxppc:next-test 85/129] arch/powerpc/xmon/xmon.c:489:12:
 error: stack frame size (2160) exceeds limit (2048) in 'xmon_core'
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2023 at 4:32=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Nick Desaulniers <ndesaulniers@google.com> writes:
> > On Fri, Aug 25, 2023 at 12:17=E2=80=AFPM kernel test robot <lkp@intel.c=
om> wrote:
> >>
> >> tree:   https://github.com/linuxppc/linux next-test
> >> head:   c37b6908f7b2bd24dcaaf14a180e28c9132b9c58
> >> commit: 7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb [85/129] Revert "powe=
rpc/xmon: Relax frame size for clang"
> >> config: powerpc64-randconfig-r006-20230825 (https://download.01.org/0d=
ay-ci/archive/20230826/202308260344.Vc4Giuk7-lkp@intel.com/config)
> >> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.g=
it f28c006a5895fc0e329fe15fead81e37457cb1d1)
> >
> > Hi Michael,
> > Given this report and
> > https://github.com/ClangBuiltLinux/linux/issues/252#issuecomment-169037=
1256,
> > it seems that it's still possible to trigger this warning (and build
> > failure with CONFIG_WERROR). Is it possible to drop my patch at this
> > point?
>
> It's too late to drop it, so we'd need to do a revert.

Np. Sent: https://lore.kernel.org/llvm/20230828-ppc_rerevert-v1-1-74f55b818=
907@google.com/

>
> But rather than just a straight revert maybe we can do something that's
> more tightly focused, ie. just to specific Clang versions?

Seeing as the bot found a randconfig, I'm not confident that a version
check would be enough at this point.

Also, quite a few fires this Monday morning. I'd rather back this out
entirely and revisit it another day.  I thought it would be a simple
revert; obviously not!

>
> > I'll need to go back to the drawing board with these configs +
> > specific versions of clang to better understand what's going wrong
> > here.  Sorry for the trouble.
>
> No worries.
>
> cheers



--=20
Thanks,
~Nick Desaulniers
