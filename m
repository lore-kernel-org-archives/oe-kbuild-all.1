Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FB228C03E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755533010; cv=none; b=iM2Au9mdoEGVjcY9j27lB3n0I3Hk4XxqoVptYScpHoKCWVXxkjhE0s4lZERCVNh32zTVpxmUEGobSYoWfbkVftI/mZ9lSfFQtX2Nt5OskL2jSIjSsqldqAzPVlOH2yGP0pi0XVN/Av5QGKTep6m2Js0DVPt8wl7VpfHC6Ys4v8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755533010; c=relaxed/simple;
	bh=C5r0WHOtFObLFpKCMhNyDDNdrXKyoewOu/87RMDqYBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfPtEkJQjRr1Kftm6Jp5PA4oBQz13KN7EHLAniLw10GwSvkPvsJGhuzAnTd2ZRemQr7fKZsYyy8Hdcs2+UyLRZ5cFzVsdP42H+AvDDrPbf8CTM/+NMVlC7iPN1nYCN9BYj3R43p0Vbpzr2n9QKvrbqhn1Fy8wiXwcn/uqlbqig0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k8oTzmfY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k8oTzmfY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-242d1e947feso387525ad.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755533009; x=1756137809; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vy6Ekik4wtxdU/sGrdmJ5Z/mbLCDvKAO6pGEYg8MRYc=;
        b=k8oTzmfYaSNlIufJwz3nNu4KFb2wecoFyJI5pYMjgqEzHrFybBcRtEYGS3I0UhN4DJ
         mqDAK0C4S4UiiQrXuKKCsHFgPVvqYFwxNM9eHd4Fo0ZPUNAMI51/6odyrTfuykYKvd3J
         LTQGl9+xtNzQKrrZw6AC0TfCvptGGMt9I/NH4M8mL6I1oAlv4bGGjjh7eOYFJNL8VRpi
         ZwJ0K9KjlaeRpwxllX5pK5RKMOajxugG85PYUuRtfF81qD1TAmL70/DOQmkVtMZZu5ka
         KSw5bm7iEnGk8FN9qpDCejPSCFxmx/cP69U2WWl7W7pNso/+p/4OfZXOCy/DHobxig61
         nJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755533009; x=1756137809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vy6Ekik4wtxdU/sGrdmJ5Z/mbLCDvKAO6pGEYg8MRYc=;
        b=jtf9TYlQ2bmw/tuExXNNqgvhhTEbIAyAyu4fgtfK6wIEAMeAUlcb60dXgDPykKIDjN
         mx+C9M813iMaK+KtuPc8DsnaPKkLDUpkPmKKdv9lHDpEqsQd8C2U3jvzXEAsbrfKOkZJ
         hhLZkwa1TQX2qldAjlEslOQzoBIKfegM1OeUm+9hqIWCb3R7HFFvPz+155xRO+HVU9vI
         zI3tpLikP0ILZNVJVqLUQFiLI1fLgZxUsPs2ib+areEcAFIrVJF/HA/8C1E2NbyOelGz
         kLfnMOFAF9nb2tetcvxEhqdOOKRehe/7SQzgQNN9dj1hsnY2rAzJJ1877qCX9Zm3toLd
         Fiwg==
X-Forwarded-Encrypted: i=1; AJvYcCUmIcnsyNZpR6yKr0jAAR6SS8kpM1IcRGQDOdvXhi3/VCOtOLjIFoMaIq101HQPhFSOHfuZlLkTJdqs1eqq@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/r1rIpc6siPu8lgrybxl7jZFchp4D0gD6hwlT5EQPWSOZjQxf
	aWBJGzWfdNLSm0cI2TsGU5Jqx+sXiWfPRNkx+OnlY4icTyh+z24d8VsAzZMsTbmynDSy9Us8CDe
	TjE8VfudL0z2IrEkWBxs5r/tRYYeUDk53ZbFm9Bxp
X-Gm-Gg: ASbGncsH8Nv8MUB5WFALHhyLyiTK4OMT3qzBxfbxMGeTP8rtP9hCBXugiDK3wcLE+33
	7c0TNKF+yOYug42GgSERHzYLtcPg7z8AHZnsfoZAsuxS+7lABtC07l/r1P6rIrs13tNMujwi2WP
	sD7hW95F5hq3wg+NQxLRenXqUJ9IuV8a0Mnjgpd41ZMWl9ALGNF6TpqiBsKI554h+55q1X7rxlH
	8ARnJpkpzk7krdgp6i6RbkSzapnLMZsQDs9454KAYKTB/Y=
X-Google-Smtp-Source: AGHT+IFveFdgcbnAa0xdAeel5El0U/UpEV28fWYRdt1wjZXR/9I3EHWlOUiuyZoLjhTOw+/kwb0Rj4OlzWrWcdRxPtw=
X-Received: by 2002:a17:903:2302:b0:231:f6bc:5c84 with SMTP id
 d9443c01a7336-24478e4ace3mr6846525ad.8.1755533007752; Mon, 18 Aug 2025
 09:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626054826.433453-2-irogers@google.com> <202507050736.b4hX0Xks-lkp@intel.com>
 <87o6tcrzh2.ffs@tglx> <CAP-5=fWbmo3ejmeWbweSk5waPtS2VTc1obtaWiibZC3cVmvVvg@mail.gmail.com>
 <CAP-5=fWeK4RnL8=BQm3o3u0KoONYEptwEYFBC5_DkJTbgpbx9g@mail.gmail.com>
In-Reply-To: <CAP-5=fWeK4RnL8=BQm3o3u0KoONYEptwEYFBC5_DkJTbgpbx9g@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 18 Aug 2025 09:03:16 -0700
X-Gm-Features: Ac12FXzxrkQN2qF-Ga-gtgg0Fff-w28PrY7z1q2GVj_JWSudKFY9dllqpgV61kk
Message-ID: <CAP-5=fW=tWLwLoozZfVHQ7QgKS3ACf0_LxztGcs5mhpAO23sww@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] vdso: Switch get/put unaligned from packed struct
 to memcpy
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, Eric Biggers <ebiggers@google.com>, Yuzhuo Jing <yuzhuo@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 10:00=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> On Tue, Jul 22, 2025 at 9:44=E2=80=AFAM Ian Rogers <irogers@google.com> w=
rote:
> >
> > On Tue, Jul 22, 2025 at 8:56=E2=80=AFAM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> > >
> > > Ian!
> > >
> > > On Sat, Jul 05 2025 at 08:05, kernel test robot wrote:
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > [auto build test WARNING on linus/master]
> > > > [also build test WARNING on tip/timers/vdso v6.16-rc4 next-20250704=
]
> > > > [cannot apply to acme/perf/core]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a n=
ote.
> > > > And when submitting patch, we suggest to use '--base' as documented=
 in
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/v=
dso-Switch-get-put-unaligned-from-packed-struct-to-memcpy/20250626-135005
> > > > base:   linus/master
> > > > patch link:    https://lore.kernel.org/r/20250626054826.433453-2-ir=
ogers%40google.com
> > > > patch subject: [PATCH v3 1/3] vdso: Switch get/put unaligned from p=
acked struct to memcpy
> > > > config: s390-randconfig-002-20250705 (https://download.01.org/0day-=
ci/archive/20250705/202507050736.b4hX0Xks-lkp@intel.com/config)
> > > > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-pro=
ject 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20250705/202507050736.b4hX0Xks-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202507050736.b4hX0X=
ks-lkp@intel.com/
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > >    In file included from arch/s390/boot/decompressor.c:48:
> > > >    In file included from arch/s390/include/uapi/../../../../lib/dec=
ompress_unlz4.c:10:
> > > >    In file included from arch/s390/include/uapi/../../../../lib/lz4=
/lz4_decompress.c:36:
> > > >>> arch/s390/include/uapi/../../../../lib/lz4/lz4defs.h:109:9: warni=
ng: default initialization of an object of type 'typeof (*((const U16 *)ptr=
))' (aka 'const unsigned short') leaves the object uninitialized [-Wdefault=
-const-init-var-unsafe]
> > > >      109 |         return get_unaligned((const U16 *)ptr);
> > > >          |                ^
> > >
> > > Any update on this one?

Hi Thomas,

I sent out a v4 patch set:
https://lore.kernel.org/lkml/20250722215754.672330-1-irogers@google.com/
which has no bot complaints but also no reviews. It side stepped some
of the challenges by always operating on pointer types. If people
could PTAL it would be appreciated as then we can pick up the changes
in tools and drop:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/commit/tools/perf/Makefile.config?h=3Dperf-tools-next&id=3D55a18d2f3ff79c=
9082225f44e0abbaea6286bf99

Thanks,
Ian
