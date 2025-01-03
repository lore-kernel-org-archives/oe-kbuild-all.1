Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDF61CDA3F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896105; cv=none; b=nkdZ7H8TeJ/tQ5qQU7CsoSN0Cw6CYGCwX2SE7c+7zAXsE06ATvengnz/daTPT8Tza4fyvQN9oLDX27L7Q7kVsWMb9x234v4uRFIujPTjAJt3P3+r+iMz1zrtITIL0WtFb1mUmgnc4h4GxFurOhzFPDYvrgYd0ITC3BKC3NudVvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896105; c=relaxed/simple;
	bh=n/Lb1MC5YXbPQi/MvxoZMw34dEukKFqqg7Z7FZEyaWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+5xPE9zt0WPfVfaT732Bo6nyMvIpDJisHkavQ30eFnvewFcC5gVdvQyhaQWr9rtzjxjld0GrukSRmSt6WH3jwF5fAyhl/L9bIrN5pnHFtfauvXoHecelDw4kKHKjJXJmNJzot+xZA57G9bexD78ymD6S1NLefsUrbSeAx6sSTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5187f0b893dso3911289e0c.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Jan 2025 01:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896098; x=1736500898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Thojfix4iWawRcqBh7qgVLXXAozIA058kz1GrMnIvc=;
        b=cj+bZkjWrasWMF8DfOMSTWo6PuIlO2OUzVQxGqyWmL0ydJ8UBVhEWEk8rPUAP5vQNL
         x1kxsgyU0LK8/MGcnTpz16Q8MjjEXO654p9GX63+f3Pyrg/3iChZwJ7lDsrUuxZtbQhv
         Sq9JohXvt1Lgb4WMzGHMeOcR40hvSORDE8ebnt26OXQOtVKa2dAaDbnCxRg1fR8HY5dA
         LmCWYPvxAuYAHuNOVzAYeCCGy139j03IwXI8p7tbGLiL7GjpFZ8qM5qSTnAwvmeuHod4
         ee9R2m9z3gqGPnBJUb/bMZ/cehD70VYIfWfJNyruG0+MLY0lqm8/hBuJbQyvL+T51A/6
         50fA==
X-Forwarded-Encrypted: i=1; AJvYcCWPSfrcl9EhMZDjtxdHBbfKBC5SYbyqt5hF8ogDTy4wzBD7ZVR8dsWrbZ5N7q0V0W7BMbtjCTYnOAWz82Hy@lists.linux.dev
X-Gm-Message-State: AOJu0YzthJo75/YsI1b5Q15GruqJn3s4qO82M1QysKhHbQaeZENntCUv
	JX/8hCInOCXdQQctTdo1ueJZjQWmLyCAjECJAX/Aa8NTzOsuY0eo5GhxAoAN
X-Gm-Gg: ASbGncvDf6Et+DD+1DJJCp0Grvt4uoQ5zABeQdq/9KsCA4cXeV16REoS1GgUMx4sfJp
	M64N0sWZ74iTYADBTDwGAMtm7XZoEjFfgPRUh7Xv2D9BayR3yLECuatnzksVGrkdRW8a0hk23uc
	o8FpcM4l/WVmv1uig/Kj3DzfMqfOphgsJOZG/KnHkj+A9QYBKqinVjffyR3JbLIpziXabO7D794
	hD5WyrQd4BXF5yUCOuddwmTeo/KsobJaqkqd+VOucWXwHF+k7XAgVA0SPAOR6J0cHQeyT71HDS8
	lwv/vt6xu8Ao9KMKtoAzUYk=
X-Google-Smtp-Source: AGHT+IHqLBp7RZ0urVuhg+CBtreX+sKzdZCF8uJ0ESgOoB5Vlh3CGdisgtUXEVvAoeJ6yMn6T+au2A==
X-Received: by 2002:a05:6122:8c18:b0:516:1bd5:67da with SMTP id 71dfb90a1353d-51b75d384aamr33468383e0c.8.1735896098081;
        Fri, 03 Jan 2025 01:21:38 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bea730sm3265887e0c.29.2025.01.03.01.21.37
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:21:37 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-518957b0533so3877401e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Jan 2025 01:21:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVh7smUTjXDH1f9X22gCLIcp0vRRHogV8ex/q/krKp/b9YyrLD6s4UeOsDRJ3otZHtTZzUXQBRR7Rgngd4+@lists.linux.dev
X-Received: by 2002:a05:6102:6e88:b0:4b2:cca8:88d0 with SMTP id
 ada2fe7eead31-4b2cca889d7mr31721757137.1.1735896097341; Fri, 03 Jan 2025
 01:21:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501030516.uZrwnuQQ-lkp@intel.com>
In-Reply-To: <202501030516.uZrwnuQQ-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 10:21:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
Message-ID: <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
Subject: Re: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
To: kernel test robot <lkp@intel.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, 
	linux-sparse@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kernel test robot,

CC linux-sparse

On Thu, Jan 2, 2025 at 10:40=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.=
git master
> head:   17810b1de0e9e5c1000cf8f5b4787ad930b0353e
> commit: e96424b86d5098f44279399b85551e0f84a1c9e9 [2/2] m68k: Use kernel's=
 generic muldi3 libgcc function
> config: m68k-randconfig-r122-20250101 (https://download.01.org/0day-ci/ar=
chive/20250103/202501030516.uZrwnuQQ-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250103/202501030516=
.uZrwnuQQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501030516.uZrwnuQQ-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
> >> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
> >> lib/muldi3.c:53:28: sparse: sparse: not addressable
> >> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (=
11)
> >> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (=
11)
>
> vim +53 lib/muldi3.c
>
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  48
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  49  long long notrace __muldi3=
(long long u, long long v)
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  50  {
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  51   const DWunion uu =3D {.ll=
 =3D u};
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  52   const DWunion vv =3D {.ll=
 =3D v};
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23 @53   DWunion w =3D {.ll =3D __=
umulsidi3(uu.s.low, vv.s.low)};
>
> :::::: The code at line 53 was first introduced by commit
> :::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of=
 some GCC library routines

Thanks for the report!

Comparing m68k to the other two architectures that use
GENERIC_LIB_MULDI3 (csky and xtensa), and to microblaze (which has
its own arch/microblaze/lib/muldi3.c), that don't trigger this error,
the difference is that m68k uses inline assembler in its umul_ppmm()
implementation. I don't see anything that's wrong with it, though.

Perhaps this is an issue with sparse?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
