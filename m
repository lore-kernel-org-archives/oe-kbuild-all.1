Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B5186A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 09:53:32 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-54ee0b73e08so394231067b3.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 02:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681638812; x=1684230812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vy0goH1eR4IHNE8qypyyzP1OUcgfs+Sxeg1e6E0IW/k=;
        b=cjBpGD48bHqgMzoDDmWdJ25ZupYaBxo0zRcSvyIqfHrpHZ1oXxqm2y32pUK5O6yPX3
         EedsLmFExMuZnbA+ySYrqUlCPn7b3htId4qvI5fewmjUlLp2LTRLWtJ+JyMrDR/XxHYF
         /hK9oNlDHQVtP3xTNMRRAd2/tF+L/QHppsP46RNnyGF76ERgdFLSDL1tnBfYkxqgEPfn
         OlDC13ZXR/NWWZvab6hTcNu3KWQ1uOgmNOXMH2IQU9MuHllq9sjAhePITqhKTuVdxhzw
         A/2W5MfhxzPPGPIvjfp0T5ZanYG/j/N/kvDUwiSACpY/X7+MV4Mzi+NTvCeG2s5gG8n0
         wV4A==
X-Gm-Message-State: AAQBX9cBWDDVHcU3nTg5O4YAjjNPCsiQY5D2wVfzTCUoeMmqtJBhYBqf
	VXfni7oGh+jgs3+rVASVXz02qTBVp62czw==
X-Google-Smtp-Source: AKy350YkIQU81lo04qS+DG+fvIIYHoaPwJIqsduQOr51cjdfDikEVAZXacNC09fgHvwNKEJlmMquZw==
X-Received: by 2002:a81:92c6:0:b0:545:1cb8:a1cb with SMTP id j189-20020a8192c6000000b005451cb8a1cbmr12474957ywg.44.1681638811689;
        Sun, 16 Apr 2023 02:53:31 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id a6-20020a814d06000000b0054ee8426468sm2398653ywb.21.2023.04.16.02.53.29
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 02:53:29 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-54fe82d8bf5so77642927b3.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 02:53:29 -0700 (PDT)
X-Received: by 2002:a81:e54b:0:b0:552:d6aa:80d9 with SMTP id
 c11-20020a81e54b000000b00552d6aa80d9mr275295ywm.4.1681638809536; Sun, 16 Apr
 2023 02:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304150025.K0hczLR4-lkp@intel.com> <20230415125705.180426-1-akinobu.mita@gmail.com>
In-Reply-To: <20230415125705.180426-1-akinobu.mita@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Apr 2023 11:53:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNQRgXzaEsb1M=SGm683dTOU2gLyjD2UuoD8qy+Ex74Q@mail.gmail.com>
Message-ID: <CAMuHMdWNQRgXzaEsb1M=SGm683dTOU2gLyjD2UuoD8qy+Ex74Q@mail.gmail.com>
Subject: Re: [PATCH -block] fault-inject: fix build error when
 FAULT_INJECTION_CONFIGFS=y and CONFIGFS_FS=m
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: lkp@intel.com, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	axboe@kernel.dk, oe-kbuild-all@lists.linux.dev, shinichiro.kawasaki@wdc.com, 
	chaitanyak@nvidia.com, akpm@linux-foundation.org, hch@infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mita-san,

On Sat, Apr 15, 2023 at 3:09=E2=80=AFPM Akinobu Mita <akinobu.mita@gmail.co=
m> wrote:
> This fixes a build error when CONFIG_FAULT_INJECTION_CONFIGFS=3Dy and
> CONFIG_CONFIGFS_FS=3Dm.
>
> Since the fault-injection library cannot built as a module, avoid buildin=
g
> configfs as a module.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304150025.K0hczLR4-lkp@int=
el.com/
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

Thanks for your patch!

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1979,7 +1979,8 @@ config FAIL_SUNRPC
>
>  config FAULT_INJECTION_CONFIGFS
>         bool "Configfs interface for fault-injection capabilities"
> -       depends on FAULT_INJECTION && CONFIGFS_FS
> +       depends on FAULT_INJECTION
> +       select CONFIGFS_FS

My first thought was "please do not select CONFIGFS_FS", but
apparently this is what most users do, so I guess it's OK.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

The alternative would be to do:

-       depends on FAULT_INJECTION && CONFIGFS_FS
+       depends on FAULT_INJECTION && (CONFIGFS_FS=3Dy ||
CONFIGFS_FS=3DFAULT_INJECTION)

>         help
>           This option allows configfs-based drivers to dynamically config=
ure
>           fault-injection via configfs.  Each parameter for driver-specif=
ic

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
