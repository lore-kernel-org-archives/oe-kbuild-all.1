Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E311803
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 08:31:22 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id s12so1152711qtq.11
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Mar 2023 00:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQQwihoQm8uXBBR2hgaSel12EpXi6e7mZu3C3LVlcZg=;
        b=erQ31ocm2DQMdP9TQ/NqQFXTYxLI3841u6RasCa3TbkXus5wPFhvb6QvRzkGmPiwbk
         +7Dq0IqnWnDn1TJolvKFaCN9qrJA8v1k3W0Rd/R0RXJTYRggWCsrPPhLgDGru+pZdEoJ
         5cC2mGho6v4VoGqUwwxSo95FOaS4PzyefM4YafrAqWMlrwbcRaT+bui5tdXVrWObCSHh
         R/EOb0jfRPoABbVqLKyu/f9M4iCeT+gFd/hnel9H0fb8xFb+ZniK9QVp3DPGwkg2BNJl
         7RjIrpuK/3U7+rLa/9xWTL8L8xbkwUMmt7ZAwNouFC5/j5F3O1tCLVuWhTTtqe4eyaM1
         /LVg==
X-Gm-Message-State: AO0yUKWQaadCmwFWwMFtuLlEPRMwMZE/99zRPXT50t4vwhfbNgL48qFZ
	4inMUKUU7JoqPBciT79/7OD0AfqLlE2KBIbm
X-Google-Smtp-Source: AK7set/JeAvdsxN3vuH5GEwtg80xMjH7S+wLd6OFxpqd8A9s6FIYtz3Ens4ETeDuyBuHlwmQo+6OPw==
X-Received: by 2002:a05:622a:18e:b0:3bb:88e2:7625 with SMTP id s14-20020a05622a018e00b003bb88e27625mr35023477qtw.24.1678350681076;
        Thu, 09 Mar 2023 00:31:21 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id x14-20020ac86b4e000000b003bfeb30c24dsm13004086qts.39.2023.03.09.00.31.20
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:31:20 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 82so1107062ybn.6
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Mar 2023 00:31:20 -0800 (PST)
X-Received: by 2002:a05:6902:4d4:b0:a03:da3f:3e68 with SMTP id
 v20-20020a05690204d400b00a03da3f3e68mr13049236ybs.12.1678350680338; Thu, 09
 Mar 2023 00:31:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert+renesas@glider.be>
 <202303091612.UKr8Fhos-lkp@intel.com>
In-Reply-To: <202303091612.UKr8Fhos-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Mar 2023 09:31:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQXw-+_PSnmWTVSgHYftoyN2=O7cKWrsaNOaSwuhx3pQ@mail.gmail.com>
Message-ID: <CAMuHMdWQXw-+_PSnmWTVSgHYftoyN2=O7cKWrsaNOaSwuhx3pQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] pinctrl: renesas: Add support for 1.8V/2.5V I/O
 voltage levels
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robot,

On Thu, Mar 9, 2023 at 9:29=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
> [also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next li=
nus/master v6.3-rc1 next-20230309]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven=
/pinctrl-renesas-r8a77995-Retain-POCCTRL0-register-across-suspend-resume/20=
230308-212328
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git renesas-pinctrl
> patch link:    https://lore.kernel.org/r/0c04925457bf3f7e78e7e3851528d9a4=
c29246da.1678271030.git.geert%2Brenesas%40glider.be
> patch subject: [PATCH 3/8] pinctrl: renesas: Add support for 1.8V/2.5V I/=
O voltage levels
> config: nios2-randconfig-r004-20230309 (https://download.01.org/0day-ci/a=
rchive/20230309/202303091612.UKr8Fhos-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/513932515f943c598=
7c5a214520f6875cd507c3e
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renes=
as-r8a77995-Retain-POCCTRL0-register-across-suspend-resume/20230308-212328
>         git checkout 513932515f943c5987c5a214520f6875cd507c3e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dnios2 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dnios2 SHELL=3D/bin/bash drivers/pinctrl/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303091612.UKr8Fhos-lkp@i=
ntel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/pinctrl/renesas/pfc-r8a77950.c:11:
> >> drivers/pinctrl/renesas/pfc-r8a77950.c:19:48: error: 'SH_PFC_PIN_CFG_I=
O_VOLTAGE' undeclared here (not in a function); did you mean 'SH_PFC_PIN_CF=
G_IO_VOLTAGE_MASK'?
>       19 |         PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_=
IO_VOLTAGE),      \
>          |                                                ^~~~~~~~~~~~~~~=
~~~~~~~~~~

This driver is scheduled for removal, hence was not updated.

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
