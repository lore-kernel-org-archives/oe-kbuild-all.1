Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E206B18B16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 May 2023 13:48:38 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-561bcd35117so7961417b3.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 May 2023 06:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1684331318; x=1686923318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qen4NzyYSwUvBTn53Q3ZSIlNULvDmGe0dSmKsYdoj2o=;
        b=D8rWFqa6FLhwuACF80JJS6kNCFwXCVmR7Nq1uyGV4JKuCtNJKy4NN5XJ5P/5vm55bT
         pmjjcjfzuXSHW692VNg65IHxkhgXiMAPUgx8e4YzRnKs9nz5dBFP/BFTkbKJpM5o1hsI
         diDnE3CD3nJozCI+bEa5ZNow9Oqk/qznlz0rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684331318; x=1686923318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qen4NzyYSwUvBTn53Q3ZSIlNULvDmGe0dSmKsYdoj2o=;
        b=INOvXRYyPo6D3p8KKH91NKCjnvptVZVxlHAjdYSG0rHz2K13H7yUD4iPLaan5nCjD5
         lC0BHXoz8kW87i77XJo71CdX3kl+BsnibCpatGfTNmCbFtOQv5KZGpM0XyBjIn1/n5Nz
         +nEUfOoGuFTXLBg6QUsW1BZ2WGfy72RxR+t88bRn6WjlcFkrSrSWSika87o30kt7iu0t
         sMGmy1z2zSEu9Y8b5F/owRI2lOU8G9UWdBccLqVpIYyhPRfVdw5MW+gGjpKp8Jga9SeF
         HSMwzhJMsWQa9c372PZaT4LeRTUDbutfHfvLVwNRA8e8OuiVUWtU8ESwrH0xTmXh0cF2
         aAkA==
X-Gm-Message-State: AC+VfDw6gdEtP/zLh3wprMruu/cehJ3JVAC4FrfEGOcD8/htQKtZm0ve
	vH71shDOVhI39I/AaKLgO4hHIjhtrO4QcsuI8gNuyg==
X-Google-Smtp-Source: ACHHUZ5feHmaW3tO0gy3xW/+BrKZqYha6hvsqDGlOmjX/Wduc93igtxQTu6O8ZcgA4VUWc4IoLHyrhKYp167Xh2pBiY=
X-Received: by 2002:a0d:f281:0:b0:560:beeb:6fc1 with SMTP id
 b123-20020a0df281000000b00560beeb6fc1mr25014343ywf.16.1684331317745; Wed, 17
 May 2023 06:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305172130.eGGEUhpi-lkp@intel.com> <20230517-blighted-scowling-352ffbea5190-mkl@pengutronix.de>
In-Reply-To: <20230517-blighted-scowling-352ffbea5190-mkl@pengutronix.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 17 May 2023 15:48:26 +0200
Message-ID: <CABGWkvrhXqpx=gKMcGcUUNhA+rUPRfYHJ6LXjFgwBWwsJnjakg@mail.gmail.com>
Subject: Re: [netdev-net:main 50/55] Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21
 syntax error
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On Wed, May 17, 2023 at 3:36=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> Good Bot!
>
> On 17.05.2023 21:21:58, kernel test robot wrote:
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git ma=
in
> > head:   6ad85ed0ebf7ece0f376950a6b3b3c6048093d35
> > commit: 0920ccdf41e3078a4dd2567eb905ea154bc826e6 [50/55] ARM: dts: stm3=
2: add CAN support on stm32f746
> > config: arm-randconfig-r034-20230517
> > compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.gi=
t/commit/?id=3D0920ccdf41e3078a4dd2567eb905ea154bc826e6
> >         git remote add netdev-net git://git.kernel.org/pub/scm/linux/ke=
rnel/git/netdev/net.git
> >         git fetch --no-tags netdev-net main
> >         git checkout 0920ccdf41e3078a4dd2567eb905ea154bc826e6
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.c=
ross W=3D1 O=3Dbuild_dir ARCH=3Darm olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.c=
ross W=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202305172130.eGGEUhpi-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> > >> FATAL ERROR: Unable to parse input tree
>
> Doh!
>
> The stm32f7-rcc.h is missing the definition for CAN3.
>
> |               can3: can@40003400 {
> |                       compatible =3D "st,stm32f4-bxcan";
> |                       reg =3D <0x40003400 0x200>;
> |                       interrupts =3D <104>, <105>, <106>, <107>;
> |                       interrupt-names =3D "tx", "rx0", "rx1", "sce";
> |                       resets =3D <&rcc STM32F7_APB1_RESET(CAN3)>;
> |                       clocks =3D <&rcc 0 STM32F7_APB1_CLOCK(CAN3)>;
> |                       st,gcan =3D <&gcan3>;
> |                       status =3D "disabled";
> |               };
> |
> |               gcan3: gcan@40003600 {
> |                       compatible =3D "st,stm32f4-gcan", "syscon";
> |                       reg =3D <0x40003600 0x200>;
> |                       clocks =3D <&rcc 0 STM32F7_APB1_CLOCK(CAN3)>;
> |               };
> |
>
> | $ git grep CAN include/dt-bindings/mfd/stm32f7-rcc.h
> | include/dt-bindings/mfd/stm32f7-rcc.h:78:#define STM32F7_RCC_APB1_CAN1 =
          25
> | include/dt-bindings/mfd/stm32f7-rcc.h:79:#define STM32F7_RCC_APB1_CAN2 =
          26
>
> Dario, do you have a fix at hand?

in version 1,  the patch "dt-bindings: mfd: stm32f7: add binding
definition for CAN3"
was accepted by Lee Jones
(https://lore.kernel.org/lkml/20230424090229.GB8035@google.com/#t)
So I removed it in version 2 as I described in its cover letter:
https://marc.info/?l=3Dlinux-arm-kernel&m=3D168262836731935&w=3D2
Can we ensure that the patch is merged before this series?

Thanks and regards,
Dario


>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
