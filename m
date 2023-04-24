Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B6B33FA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 19:43:00 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54f9d6eccf3so57369387b3.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 12:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682365379; x=1684957379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzv9DDy8KqR5toIcVytBQed/LqPBtxIbLra1+3vX+mg=;
        b=fNbCcY+KwVEnCxJlB4Q6X9d444yXoiqvy8B5jWyr4Zq8mNri+wZDWGl55+8yc2aGab
         L6BPY6xL+K4Qxce3WL2EtdWiA7sn5VhTT5PZbr25F73g6kjczsoPgQvQl96HcA12sCfi
         Nqt29qbSrTt4v2obuKosW6wmkKtp4IaWlHTuwnPMzOIa3CtFPx85RncrZNlgVRUm0OYH
         kdRsFI5B4rhAPTL25KOfQq+C2PbfKghRz/N3poF9HD/SJRTOeTw9i2dhzVNQQwQzbHHd
         hCbyHS3e5yv0aZAPj86wcC+9sVkmjy4dYDtctK3PaBYsUE7CB5orqJ9VtNZcdj/28f0L
         u4SA==
X-Gm-Message-State: AAQBX9fw4sON5QhOq5uNgScaT3nMDmEpwhwRC8EaVof2zpxqQVQU+4Av
	ASkNhYzzE/F4k5BoRr10r6MqGYNFyZzV9g==
X-Google-Smtp-Source: AKy350ZlOwiSZ2O6jMurp8NROx/k4Tg2JH4PXQJI2hzDH/20GO839RHZ7hszpO3Q2RVdKNVrXr1yog==
X-Received: by 2002:a0d:dd0c:0:b0:551:9b0a:4dc0 with SMTP id g12-20020a0ddd0c000000b005519b0a4dc0mr9439910ywe.1.1682365378567;
        Mon, 24 Apr 2023 12:42:58 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id j5-20020a816e05000000b00555d0a539f7sm3132969ywc.116.2023.04.24.12.42.57
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 12:42:57 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-b99dae893c0so902457276.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 12:42:57 -0700 (PDT)
X-Received: by 2002:a81:5f83:0:b0:556:300c:d653 with SMTP id
 t125-20020a815f83000000b00556300cd653mr6938761ywb.40.1682365377354; Mon, 24
 Apr 2023 12:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304222120.WcBMaHXo-lkp@intel.com> <20230422135838.3rn67ky2p7jmdk3n@pali>
 <CAMuHMdX8PP3gH_ctgZgXfV6Psu95eTuCh0MBsEQsRVG_6rEUVg@mail.gmail.com> <20230424184941.44no7rkxjadnyojm@pali>
In-Reply-To: <20230424184941.44no7rkxjadnyojm@pali>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Apr 2023 21:42:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWG5uzQCA6TA9n8sNn=WYOyO++AgThADVbLD5z9AiSL5w@mail.gmail.com>
Message-ID: <CAMuHMdWG5uzQCA6TA9n8sNn=WYOyO++AgThADVbLD5z9AiSL5w@mail.gmail.com>
Subject: Re: {standard input}:924: Error: unrecognized opcode: `eieio'
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pali,

On Mon, Apr 24, 2023 at 8:49=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
> On Monday 24 April 2023 09:49:07 Geert Uytterhoeven wrote:
> > On Sat, Apr 22, 2023 at 4:03=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.or=
g> wrote:
> > > On Saturday 22 April 2023 21:53:23 kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
> > > > head:   8e41e0a575664d26bb87e012c39435c4c3914ed9
> > > > commit: ff7c76f66d8bad4e694c264c789249e1d3a8205d powerpc/boot: Don'=
t always pass -mcpu=3Dpowerpc when building 32-bit uImage
> > > > date:   3 months ago
> > > > config: powerpc-buildonly-randconfig-r006-20230422 (https://downloa=
d.01.org/0day-ci/archive/20230422/202304222120.WcBMaHXo-lkp@intel.com/confi=
g)
> > > > compiler: powerpc-linux-gcc (GCC) 12.1.0
> > > > reproduce (this is a W=3D1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/mast=
er/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/commit/?id=3Dff7c76f66d8bad4e694c264c789249e1d3a8205d
> > > >         git remote add linus https://git.kernel.org/pub/scm/linux/k=
ernel/git/torvalds/linux.git
> > > >         git fetch --no-tags linus master
> > > >         git checkout ff7c76f66d8bad4e694c264c789249e1d3a8205d
> > > >         # save the config file
> > > >         mkdir build_dir && cp config build_dir/.config
> > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc olddefconfig
> > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash
> > > >
> > > > If you fix the issue, kindly add following tag where applicable
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Link: https://lore.kernel.org/oe-kbuild-all/202304222120.WcBMaHXo=
-lkp@intel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > >    {standard input}: Assembler messages:
> > > > >> {standard input}:924: Error: unrecognized opcode: `eieio'
> > > >    {standard input}:1094: Error: unrecognized opcode: `eieio'
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://github.com/intel/lkp-tests
> > >
> > > Hello! What is that? In this error report there is no compile log, no=
r
> > > any file / line. And "Link:" line from above error report does not wo=
rk.
> > >
> > > Intel, can you look at your robot? This looks some bug in error repor=
ting.
> >
> > Looks fine to me: this is not a compile problem, but an assembler probl=
em.
> > Presumably this is when building a kernel for a PPC platform that does
> > not support the eieio instruction?
>
> What is fine on this report? There is completely missing command which
> generated this error; whole error message; input files which caused them

The file name is indeed missing.

> and also change or commit.

That is mentioned, and looks like a valid possible introducer.

> And what presumably happened? I'm really not going to spend more time on
> guessing what reporter could probably might wanted to write into the
> report and start looking into crystal ball what could be an issue.
>
> I can say that this issue presumably happened when email operator of
> this robot pushed incorrect button and instead of the real report, it
> sent test report with content of some random error line from the random
> log file.
>
> Are we on the technical discussion about exactness? Or are going to
> discuss what who think that what could happened?

It's randconfig, and the config is provided, incl. steps to reproduce.

> > The Link: works fine for me, sometimes you just have to be a little bit
> > patient for the archiver to catch up...
>
> Sorry, I do not have time to wait undefined amount of time to access
> additional resources which are based on reported details required for
> debugging.

The Link is just a reference to the email you received in your mailbox,
and to all follow-ups.

> Intel, could you please react on this issue? If not, I'm going to add
> your robot to my black list. It is not first time when I received such
> useless report from you and nobody reacted on it.

Well, you are the one who authored the offending commit, and at
first glance, it looks like a reasonable culprit that could introduce the
failure mentioned ;-)

Presumably you forgot to cater for a very specific combination of
config option values?

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
