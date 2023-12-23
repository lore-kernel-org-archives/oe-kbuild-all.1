Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6815171A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Dec 2023 22:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwNuK4+K"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-20305c66f60so1726338fac.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Dec 2023 14:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703369942; x=1703974742; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuX0pyeta/efwKHKSu3U/wEG3JMK1+kJ2PCoBewIuNE=;
        b=EwNuK4+K5QXp0VHZldiv1u/EQKe5sxQiZoIhEEmBafGLLbemTBF6eSdkw1S1PXgWuv
         BO4h42NEZ8W17+VE6W9pS0rrBh1sf3pMilaKqX6tNOML+mWEDX9UbU+y4/RFGUNB9MS6
         bkPsFhlOBELv3wZKdDSDBiCuRWSaS2DEctmggbCOILPaKiiRUffYX55Qul0/ETOdVVuS
         AhkzOhfzgt5eZ/WMVqBHPGXMDbHBu4OKYWUm44JR3sPR0EW6r77XJUJYx3D0qpkgYqeM
         LynBNLCLC8YnUiuEF4N++CLGTvTLRq9ommRAWsQTMSXo9hdhBS8xlEn1kNR8mmW99fF5
         npcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703369942; x=1703974742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuX0pyeta/efwKHKSu3U/wEG3JMK1+kJ2PCoBewIuNE=;
        b=Lp6LzLkBnIIhGP4Kiz+4UB2CuFARjdkd0frVlb1FGHpwrpuf0LRvOgsokleInt6InJ
         zxTnggXGYOFSOTQNqnJVqtaDaK5H5tgehos+yPk0g5PaG3/NX2cVi79UNCu1/loDQgZQ
         AFI87HQnb42jYn3zCNdYToxN06JbluI4yCHaSgGozLnRjzSqT9TnaJ5j8AhuF8kdZhDR
         5XnSymcj2/Co3EflcTABIOF+151jROvOBVcJRlLzSm0aF6TH54iK0LzIwSM6lQrh8Qxz
         6SHN0RdQ4OVnO6PEC30CARm5O0vXTC1m23BHkuqpNjZqZEU5DVOeu7p8WUKt9PjBRofR
         bmsA==
X-Gm-Message-State: AOJu0YwvfQETy1pt1LcnJu1EyuOOoZNNGCuyMRyp74MVE+cmzgtGLbMX
	hr4zpdcTLQWxKGdid4/+qzou9MgL7haxIamnJRo=
X-Google-Smtp-Source: AGHT+IHNKMmPzMXot38poTF8Vvr8C4pDJtSJBgCwzLFKX3f4l+vgGfZXC3wpAzQhKpK8WbxiISxTfAuvoLALy4cK6s8=
X-Received: by 2002:a05:6871:8a97:b0:203:824f:a343 with SMTP id
 tm23-20020a0568718a9700b00203824fa343mr1453320oab.0.1703369942512; Sat, 23
 Dec 2023 14:19:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920192300.3772199-1-goldstein.w.n@gmail.com>
 <202309231130.ZI5MdlDc-lkp@intel.com> <CAFUsyfKDRiX9kKOhHcA4PLqqT6Q5faHF0eRGiKN+9NSbvrUfDw@mail.gmail.com>
 <d02bd4f823534a00ae4915ead3d92773@AcuMS.aculab.com> <CAFUsyfL0M5P4+4s_b1kvJ_fE-ax8YBK0ammbKfoy7yKs1obzrA@mail.gmail.com>
In-Reply-To: <CAFUsyfL0M5P4+4s_b1kvJ_fE-ax8YBK0ammbKfoy7yKs1obzrA@mail.gmail.com>
From: Noah Goldstein <goldstein.w.n@gmail.com>
Date: Sat, 23 Dec 2023 14:18:50 -0800
Message-ID: <CAFUsyfJduB29c6=BNmTtgoWcHAWA1AZ-sdbhyp02JVhvA6Gp0w@mail.gmail.com>
Subject: Re: x86/csum: Remove unnecessary odd handling
To: David Laight <David.Laight@aculab.com>
Cc: kernel test robot <lkp@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "edumazet@google.com" <edumazet@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, 
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 7:35=E2=80=AFAM Noah Goldstein <goldstein.w.n@gmail=
.com> wrote:
>
> On Sat, Sep 23, 2023 at 4:13=E2=80=AFPM David Laight <David.Laight@aculab=
.com> wrote:
> >
> > From: Noah Goldstein
> > > Sent: 23 September 2023 15:05
> > >
> > > On Fri, Sep 22, 2023 at 10:25=E2=80=AFPM kernel test robot <lkp@intel=
.com> wrote:
> > > >
> > > > Hi Noah,
> > > >
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > [auto build test WARNING on tip/x86/core]
> > > > [also build test WARNING on tip/master tip/auto-latest linus/master=
 v6.6-rc2 next-20230921]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a n=
ote.
> > > > And when submitting patch, we suggest to use '--base' as documented=
 in
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Noah-Goldste=
in/x86-csum-Remove-unnecessary-
> > > odd-handling/20230921-032450
> > > > base:   tip/x86/core
> > > > patch link:    https://lore.kernel.org/r/20230920192300.3772199-1-g=
oldstein.w.n%40gmail.com
> > > > patch subject: x86/csum: Remove unnecessary odd handling
> > > > config: x86_64-randconfig-121-20230921 (https://download.01.org/0da=
y-
> > > ci/archive/20230923/202309231130.ZI5MdlDc-lkp@intel.com/config)
> > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> > > ci/archive/20230923/202309231130.ZI5MdlDc-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202309231130.ZI5Mdl=
Dc-lkp@intel.com/
> > > >
> > > > sparse warnings: (new ones prefixed by >>)
> > > > >> arch/x86/lib/csum-partial_64.c:16:45: sparse: sparse: incorrect =
type in return expression
> > > (different base types) @@     expected restricted __wsum @@     got u=
nsigned long long @@
> > > >    arch/x86/lib/csum-partial_64.c:16:45: sparse:     expected restr=
icted __wsum
> > > >    arch/x86/lib/csum-partial_64.c:16:45: sparse:     got unsigned l=
ong long
> > > > >> arch/x86/lib/csum-partial_64.c:16:45: sparse: sparse: incorrect =
type in return expression
> > > (different base types) @@     expected restricted __wsum @@     got u=
nsigned long long @@
> > > >    arch/x86/lib/csum-partial_64.c:16:45: sparse:     expected restr=
icted __wsum
> > > >    arch/x86/lib/csum-partial_64.c:16:45: sparse:     got unsigned l=
ong long
> > > >
> > > > vim +16 arch/x86/lib/csum-partial_64.c
> > > >
> > > >     13
> > > >     14  static inline __wsum csum_finalize_sum(u64 temp64)
> > > >     15  {
> > > >   > 16          return (temp64 + ror64(temp64, 32)) >> 32;
> > > >     17  }
> > > >     18
> > >
> > > Just needs a `(__wsum)` cast. Should I post a new patch?
> >
> > It'll need to be a (__force __wsum) cast.
> >
> > I think new patches are expected...
> >
> Thank you, posted V4 that should fix the warning.
> >         David
> >
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, M=
K1 1PT, UK
> > Registration No: 1397386 (Wales)

ping.
