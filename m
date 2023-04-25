Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545BB3C0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 18:15:05 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-54fb9384c2dso72227357b3.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 11:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682446504; x=1685038504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89TnOb+8J19nGch/gfQeLXk1qLE4HzVciatlcIx2XME=;
        b=PSsengh3+qv91hwfIXMnY/qSqL1SOLTc7Lwivaho8qDj/31uIdFSdHqz4TuyvKgLEH
         Dn/BxNxKzstISsr2SYzkm79exghbKSnCSkD7D8R6GCKE4HmbxknYZeiLrcBRFksemdcZ
         oJJVJcothaxwrWlxutQRt/c54+n1akHjdSa6PCq6NZrdDENif3imHBaQbDTLPeZyALMV
         EqZ2oOLFCwGJxVw4nOFYPNK3Ip4FmtwLUpF4ATuj76cOZKyMdOybjwzVkt+lO92tpBn3
         dNnONLNp0LPR/g7jZs/Jqq9idZhxdW/N6G0yr/JaOmsTuKSvAgIB2A5g2CUa61Vt7eXj
         V0jA==
X-Gm-Message-State: AAQBX9fw5LEkfQN6v119RFsAr3qhSv9t+WfEsiLeYkDcQ8vxmlUuCGRs
	nkhG2k/PW0Wk/7TbAdy55P+hEjMZEDc06A==
X-Google-Smtp-Source: AKy350YAFMkELhZIvuEC3CpAOO6IUT78Cr4AmkFox+xVmkdEs31DB2NoxZTcinal3V0lckjLpiyaqA==
X-Received: by 2002:a0d:d905:0:b0:556:10c4:6b1f with SMTP id b5-20020a0dd905000000b0055610c46b1fmr11312986ywe.36.1682446503936;
        Tue, 25 Apr 2023 11:15:03 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id x4-20020a0dee04000000b0054629ed8300sm3665753ywe.80.2023.04.25.11.15.02
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 11:15:03 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54f945a7bddso72297567b3.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 11:15:02 -0700 (PDT)
X-Received: by 2002:a0d:dc46:0:b0:54f:ddb9:95e7 with SMTP id
 f67-20020a0ddc46000000b0054fddb995e7mr10480804ywe.34.1682446502684; Tue, 25
 Apr 2023 11:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304260234.QTHOuoZG-lkp@intel.com>
In-Reply-To: <202304260234.QTHOuoZG-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Apr 2023 20:14:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJqFxtxYvGN9oDXm3H6s6qeVFVAiCm8-my=w0QLB_KLg@mail.gmail.com>
Message-ID: <CAMuHMdWJqFxtxYvGN9oDXm3H6s6qeVFVAiCm8-my=w0QLB_KLg@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:master 32/48] drivers/dma/dw-edma/dw-edma-core.c:231:13:
 error: redefinition of 'dw_edma_device_caps'
To: kernel test robot <lkp@intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 8:10=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git master
> head:   109f3e0b7f96d5fdf923b8002a68961774c25a6e
> commit: 96f65c7bbf0f2e3f2913180b739a926d3b3ddc9c [32/48] Merge remote-tra=
cking branch 'pci/next' into renesas-drivers
> config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/202304=
26/202304260234.QTHOuoZG-lkp@intel.com/config)
> compiler: ia64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
rivers.git/commit/?id=3D96f65c7bbf0f2e3f2913180b739a926d3b3ddc9c
>         git remote add geert-renesas-drivers https://git.kernel.org/pub/s=
cm/linux/kernel/git/geert/renesas-drivers.git
>         git fetch --no-tags geert-renesas-drivers master
>         git checkout 96f65c7bbf0f2e3f2913180b739a926d3b3ddc9c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dia64 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dia64 SHELL=3D/bin/bash drivers/dma/dw-edma/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304260234.QTHOuoZG-lkp@i=
ntel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/dma/dw-edma/dw-edma-core.c:231:13: error: redefinition of 'dw_=
edma_device_caps'
>      231 | static void dw_edma_device_caps(struct dma_chan *dchan,
>          |             ^~~~~~~~~~~~~~~~~~~
>    drivers/dma/dw-edma/dw-edma-core.c:213:13: note: previous definition o=
f 'dw_edma_device_caps' with type 'void(struct dma_chan *, struct dma_slave=
_caps *)'
>      213 | static void dw_edma_device_caps(struct dma_chan *dchan,
>          |             ^~~~~~~~~~~~~~~~~~~
>    drivers/dma/dw-edma/dw-edma-core.c:213:13: warning: 'dw_edma_device_ca=
ps' defined but not used [-Wunused-function]

Thanks, looks like a borked merge conflict on my side.

> vim +/dw_edma_device_caps +231 drivers/dma/dw-edma/dw-edma-core.c
>
> 3883d64449ffe8 Serge Semin 2023-01-13  230
> 6f94141d8662ff Serge Semin 2023-01-13 @231  static void dw_edma_device_ca=
ps(struct dma_chan *dchan,
> 6f94141d8662ff Serge Semin 2023-01-13  232                              s=
truct dma_slave_caps *caps)
> 6f94141d8662ff Serge Semin 2023-01-13  233  {
> 6f94141d8662ff Serge Semin 2023-01-13  234      struct dw_edma_chan *chan=
 =3D dchan2dw_edma_chan(dchan);
> 6f94141d8662ff Serge Semin 2023-01-13  235
> 6f94141d8662ff Serge Semin 2023-01-13  236      if (chan->dw->chip->flags=
 & DW_EDMA_CHIP_LOCAL) {
> 6f94141d8662ff Serge Semin 2023-01-13  237              if (chan->dir =3D=
=3D EDMA_DIR_READ)
> 6f94141d8662ff Serge Semin 2023-01-13  238                      caps->dir=
ections =3D BIT(DMA_DEV_TO_MEM);
> 6f94141d8662ff Serge Semin 2023-01-13  239              else
> 6f94141d8662ff Serge Semin 2023-01-13  240                      caps->dir=
ections =3D BIT(DMA_MEM_TO_DEV);
> 6f94141d8662ff Serge Semin 2023-01-13  241      } else {
> 6f94141d8662ff Serge Semin 2023-01-13  242              if (chan->dir =3D=
=3D EDMA_DIR_WRITE)
> 6f94141d8662ff Serge Semin 2023-01-13  243                      caps->dir=
ections =3D BIT(DMA_DEV_TO_MEM);
> 6f94141d8662ff Serge Semin 2023-01-13  244              else
> 6f94141d8662ff Serge Semin 2023-01-13  245                      caps->dir=
ections =3D BIT(DMA_MEM_TO_DEV);
> 6f94141d8662ff Serge Semin 2023-01-13  246      }
> 6f94141d8662ff Serge Semin 2023-01-13  247  }
> 6f94141d8662ff Serge Semin 2023-01-13  248

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
