Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813E43A275
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-579de633419so15540477b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 11:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697135434; x=1697740234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEHqR4UxkTsP1urr02CWt8lk407VM070mNRCkBflvD4=;
        b=a4wNU/hqvKmcUTAiI/CMWeeJFdkiWtJZVXu0s+Lpyqoro733M+JvMuM+YUUHpzKy1P
         YgpqoAJT9t4njnErLPr05RrsC2V/Uu0lmoYvUF8ZinVFTBBR54BSTJ5FdZ6qQ3q1DkS3
         5p7pnKN64T15od+Sud0L29D+mcxjMhyQ7L8OQAWT6WqEQsdesVyjEwavN+j1GiLVRpr1
         rJKo+0aB9tBtmZwTRe8S/KpIHggcSbZc1RTUhvsxDWQiDRm8E7s/wLmc9h/l3CiexUgJ
         B2SXhMkexBH0puG+qlMhvkDuR8XKT0mQQOX8AHl6/lR4KV4OyVh9ZEwYtgD4jbICtIUE
         jvIQ==
X-Gm-Message-State: AOJu0Yyd0LuH80Seq7fhV/s5VXPJonUiCPa5vT82iNJUf3PQ9hROs/Hx
	RkBghpS+mwFHlW9vsDpFQ1hXmRr4wwU8EQ==
X-Google-Smtp-Source: AGHT+IFoMFMvrVfCN61PvNaXyI8BSMPgBRjuNBAqEGhNh2okxixC2UGPv46WdeQlCwmQ8qn7kV4MKQ==
X-Received: by 2002:a81:4854:0:b0:5a7:bf2b:dc27 with SMTP id v81-20020a814854000000b005a7bf2bdc27mr9600913ywa.14.1697135434173;
        Thu, 12 Oct 2023 11:30:34 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id c141-20020a814e93000000b005a206896d62sm128237ywb.111.2023.10.12.11.30.33
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 11:30:33 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9a518d66a1so1473471276.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 11:30:33 -0700 (PDT)
X-Received: by 2002:a25:9386:0:b0:d9a:d90d:7b42 with SMTP id
 a6-20020a259386000000b00d9ad90d7b42mr1549312ybm.1.1697135433470; Thu, 12 Oct
 2023 11:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309222350.hCUFrIQ1-lkp@intel.com> <CAMuHMdUn1n47=nV_WMe9Yx1aTzYgsDKoj_AuZUPoAH7gJpCuGw@mail.gmail.com>
 <ZSgbAoJ9Cd5f8hjm@yujie-X299>
In-Reply-To: <ZSgbAoJ9Cd5f8hjm@yujie-X299>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 20:30:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3=X7ZRxyDNA3bvTcDXwkhh7K9dVo5YRrv9P4CNt1Vow@mail.gmail.com>
Message-ID: <CAMuHMdV3=X7ZRxyDNA3bvTcDXwkhh7K9dVo5YRrv9P4CNt1Vow@mail.gmail.com>
Subject: Re: {standard input}:1198: Error: value of ffffff6c too large for
 field of 1 byte at 00000533
To: Yujie Liu <yujie.liu@intel.com>
Cc: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yujie,

On Thu, Oct 12, 2023 at 6:18=E2=80=AFPM Yujie Liu <yujie.liu@intel.com> wro=
te:
> On Mon, Sep 25, 2023 at 02:07:07PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Sep 22, 2023 at 5:23=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   27bbf45eae9ca98877a2d52a92a188147cd61b07
> > > commit: 481461f5109919babbb393d6f68002936b8e2493 linux/export.h: make=
 <linux/export.h> independent of CONFIG_MODULES
> > > date:   9 weeks ago
> > > config: m68k-randconfig-r025-20230123 (https://download.01.org/0day-c=
i/archive/20230922/202309222350.hCUFrIQ1-lkp@intel.com/config)
> > > compiler: m68k-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20230922/202309222350.hCUFrIQ1-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202309222350.hCUFrIQ1=
-lkp@intel.com/
> >
> > Thanks for your report!
> >
> > > All errors (new ones prefixed by >>):
> > >
> > >    {standard input}: Assembler messages:
> > >    {standard input}:1198: Error: value -148 out of range
> > > >> {standard input}:1198: Error: value of ffffff6c too large for fiel=
d of 1 byte at 00000533
> >
> > Do you have more context (e.g. which source file is being compiled)?
> > Thanks!
>
> Sorry for our late reply. It is sound/soc/codecs/tas2781-fmwlib.o that
> is being compiled.
>
> {standard input}: Assembler messages:
> {standard input}:1198: Error: value -148 out of range
> {standard input}:1198: Error: value of ffffff6c too large for field of 1 =
byte at 00000533
> make[6]: *** [scripts/Makefile.build:243: sound/soc/codecs/tas2781-fmwlib=
.o] Error 1
>
> We rechecked the bisection process and found that this was a false
> positive report. The error also happens on the parent of this commit.
>
> {standard input}: Assembler messages:
> {standard input}:992: Error: value -148 out of range
> {standard input}:992: Error: value of ffffff6c too large for field of 1 b=
yte at 0000045f
> make[6]: *** [scripts/Makefile.build:243: sound/soc/codecs/tas2781-fmwlib=
.o] Error 1
>
> The error message has some minor changes that our bot didn't recognize
> that it is the same error on both commits. We will fix this soon. Sorry
> for making the noise.

Thanks for the information!

In the mean time, I found out which file was the culprit when someone
posted a patch.

The real issue seems to be a compile bug, though, cfr.
https://lore.kernel.org/all/CAMuHMdXRGxnGpVHiB+Zvxq+G4K-BL8JsJGbG+7CNtJiqGw=
HOsQ@mail.gmail.com
https://lore.kernel.org/all/87v8bn3cae.fsf@igel.home

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
