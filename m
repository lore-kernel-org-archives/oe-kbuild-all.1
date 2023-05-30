Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788DB125BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 09:03:11 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-565c9109167so26179027b3.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 02:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685437390; x=1688029390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jltyANNk0K1fvjo+smvqDLimsWHFFV2WMW5ttZVPjPA=;
        b=inT3qm/ZhTXvwzzScMwSt//utruUpLmOckGvRPGpjbHmkz7Qvzi/5m+yz7eRwhlNeq
         pOgpkfUS9XtOIgnTtsggki3zh6DJkc0on/k98V9e8Mt1QOdPopRspFP4gIIGi0UIGdG+
         q4/yRY7nA9uIN5gJJNM8uZ/MwekyipM+i38CfPkt4axTFvY1VYS4qI+WpdRGbPnEOzRY
         MBq9v5s+OxG1Mn+matJC3MRkGtPCOmVAKFvpiClp9WfT4Yqp7zquXDRhxMIK0LIvxzkS
         yUpBYHz1ga+KszfPWx+wPIrkU9Iik18lhODuAlmzMek47v6BhZhZk4i1jdOBzujUL8Fc
         EZKA==
X-Gm-Message-State: AC+VfDxwW24I0grYiXco31b6FmCbQHE8AXZ3A1mOHnIsHg6J6Klk9bXc
	jel9oyn6KMWTEjio/cSd97kQ6mMeM10DIw==
X-Google-Smtp-Source: ACHHUZ4ZNck8eNBD7AevXMdEZ/b8gefdpEI5qQKs7PsCMue37uXSsRu2M/oqY/DPwjQOJkdF8irodg==
X-Received: by 2002:a81:69c6:0:b0:561:b8a1:e7ef with SMTP id e189-20020a8169c6000000b00561b8a1e7efmr1761991ywc.41.1685437390202;
        Tue, 30 May 2023 02:03:10 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id o185-20020a8173c2000000b00545a08184edsm4301118ywc.125.2023.05.30.02.03.09
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:03:09 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-565ca65e7ffso25453107b3.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 02:03:09 -0700 (PDT)
X-Received: by 2002:a81:a242:0:b0:568:928a:f482 with SMTP id
 z2-20020a81a242000000b00568928af482mr1598735ywg.24.1685437389317; Tue, 30 May
 2023 02:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305301407.z33zOjcG-lkp@intel.com>
In-Reply-To: <202305301407.z33zOjcG-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 May 2023 11:02:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVM1UoJ=s0TvPVcwzvDe1dHxJehL90WacE8ieirNPNwYA@mail.gmail.com>
Message-ID: <CAMuHMdVM1UoJ=s0TvPVcwzvDe1dHxJehL90WacE8ieirNPNwYA@mail.gmail.com>
Subject: Re: [linux-stable-rc:queue/5.15 17/69] m68k-linux-ld: section .rodata
 VMA [00001000,0024925f] overlaps section .text VMA [00000400,00439aff]
To: kernel test robot <lkp@intel.com>
Cc: Finn Thain <fthain@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, Michael Schmitz <schmitzmic@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robot,

Thanks for your report!

On Tue, May 30, 2023 at 8:09=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git queue/5.15
> head:   45d082d2c0daa97f3ea394c47e705afdd1c621e0
> commit: 43f232d748d57057e2e9dd041907c55177c50cf2 [17/69] m68k: Move signa=
l frame following exception on 68020/030
> config: m68k-randconfig-r035-20230530 (https://download.01.org/0day-ci/ar=
chive/20230530/202305301407.z33zOjcG-lkp@intel.com/config)

FTR, this is a CONFIG_M68000/CONFIG_M68EZ328 config.

> compiler: m68k-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git/commit/?id=3D43f232d748d57057e2e9dd041907c55177c50cf2
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/lin=
ux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc queue/5.15
>         git checkout 43f232d748d57057e2e9dd041907c55177c50cf2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Dm68k olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Dm68k SHELL=3D/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305301407.z33zOjcG-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> m68k-linux-ld: section .rodata VMA [00001000,0024925f] overlaps sectio=
n .text VMA [00000400,00439aff]

This is not a regression introduced by the aforementioned commit.
The same issue is present in 5.1.113, 5.1, and v6.4-rc4.

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
