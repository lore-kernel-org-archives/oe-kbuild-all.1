Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC27C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 07:49:22 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-54fb89e1666so25667327b3.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 00:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682322561; x=1684914561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhRZsU3OCwHhu2Y4xdvv6Apf1TI1FKu57DbzduNxVh8=;
        b=cNsSWNndnIWB8aXXtY7v1n0XhdvgKyQ2EtynkNZzYfmCM1+mYrL5+X1MXAfKLNoQas
         HLTwMWACR9SS/3l5mSukNUYhNgmlA3YNWjCnMHymQry1S4OmwYDmz5aNgEICejP4XRAD
         0//p0sdSss1tCUuOA+J4+1VJ4ttyePxlBBCYdBmagwQnv72/m+Ayy8H3UEJoC5YSTGQl
         JyjV991f2nH0dBcEFJ+5G0DMAVs10UhKruPNSYCNBNY/Hp92Eu84NwUmjpV0h0Ad1bMu
         HC6PX2vdOIhok87i9RvjIbYk8rzRC+JH/vxZBVFfx05dNVdqiVe5j7v4eBaT2vGN1p5r
         IlrQ==
X-Gm-Message-State: AAQBX9c21veoEsmL1ddAwo2OX8U1jvc/p5NwLaZ1USN65CNRUXqwNolk
	HaIKy/laTFvgVzxq1l5OvMV1Fwf6mvksBA==
X-Google-Smtp-Source: AKy350YdqjdlmtALysgEWvv1uN+q9u89dNhOZL18DCPFkyZ45QCFo0Z/2yj2bvZejT/FNVt4TUcI/g==
X-Received: by 2002:a0d:e888:0:b0:54f:91d:71e9 with SMTP id r130-20020a0de888000000b0054f091d71e9mr8187637ywe.14.1682322560783;
        Mon, 24 Apr 2023 00:49:20 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id u186-20020a8160c3000000b0054f69ac5220sm2805290ywb.133.2023.04.24.00.49.19
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 00:49:20 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54fb9b1a421so25703037b3.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 00:49:19 -0700 (PDT)
X-Received: by 2002:a0d:d98f:0:b0:552:a306:5256 with SMTP id
 b137-20020a0dd98f000000b00552a3065256mr7246793ywe.18.1682322559690; Mon, 24
 Apr 2023 00:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304222120.WcBMaHXo-lkp@intel.com> <20230422135838.3rn67ky2p7jmdk3n@pali>
In-Reply-To: <20230422135838.3rn67ky2p7jmdk3n@pali>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Apr 2023 09:49:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8PP3gH_ctgZgXfV6Psu95eTuCh0MBsEQsRVG_6rEUVg@mail.gmail.com>
Message-ID: <CAMuHMdX8PP3gH_ctgZgXfV6Psu95eTuCh0MBsEQsRVG_6rEUVg@mail.gmail.com>
Subject: Re: {standard input}:924: Error: unrecognized opcode: `eieio'
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pali,

On Sat, Apr 22, 2023 at 4:03=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
> On Saturday 22 April 2023 21:53:23 kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   8e41e0a575664d26bb87e012c39435c4c3914ed9
> > commit: ff7c76f66d8bad4e694c264c789249e1d3a8205d powerpc/boot: Don't al=
ways pass -mcpu=3Dpowerpc when building 32-bit uImage
> > date:   3 months ago
> > config: powerpc-buildonly-randconfig-r006-20230422 (https://download.01=
.org/0day-ci/archive/20230422/202304222120.WcBMaHXo-lkp@intel.com/config)
> > compiler: powerpc-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3Dff7c76f66d8bad4e694c264c789249e1d3a8205d
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kerne=
l/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout ff7c76f66d8bad4e694c264c789249e1d3a8205d
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.c=
ross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.c=
ross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202304222120.WcBMaHXo-lkp=
@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    {standard input}: Assembler messages:
> > >> {standard input}:924: Error: unrecognized opcode: `eieio'
> >    {standard input}:1094: Error: unrecognized opcode: `eieio'
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests
>
> Hello! What is that? In this error report there is no compile log, nor
> any file / line. And "Link:" line from above error report does not work.
>
> Intel, can you look at your robot? This looks some bug in error reporting=
.

Looks fine to me: this is not a compile problem, but an assembler problem.
Presumably this is when building a kernel for a PPC platform that does
not support the eieio instruction?

The Link: works fine for me, sometimes you just have to be a little bit
patient for the archiver to catch up...

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
