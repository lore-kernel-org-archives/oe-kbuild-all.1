Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490E6FC17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 11:35:17 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-58cd9d9dbf5so5769667b3.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 04:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692185716; x=1692790516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1TXDu+zgSSUXElwM6x2NcHaHgdAL86FtyCcicPVe4Q=;
        b=bb3RsQi3f+tHEodoaDGOkVqKdxuoENBa4v9RI/78DgqyW8+TnvjdERIkfvQR8ApOBp
         wPXvpHdnPdtxH0HMkjNsruaWaPQNrY1IMuH4jLAou27hEB7ZHwJLKUQ0V1Mcppgnt3Aa
         IZCfKWOwC2mXsQ/GDAfZIkVN+GkaABpKpMTtMQsl3PVHLyxFPHNEpGc3gAP3u6hvl3h0
         DyS6jOh09M0wDlmHljMFMLwjJmzM4+MemenGdLk2yyxqO2hz3GGPkAa32RUDfQd4nMwg
         DCPxoVuUCIdMdk9A+McHVZPWS5ejxz0GS/vK2lc7eLirmHHxm1gJfy2OokAIdK31tmgR
         0Zqw==
X-Gm-Message-State: AOJu0YxDiJlVlRtiqp6zAZlRJPfMtO0RBlYZOIGosEps2q+jxlI4Y54I
	VPdyCNsSGMVJdWVkB1NhPZD7+qqTVVU2zA==
X-Google-Smtp-Source: AGHT+IHbc80WQqdi49pMTjUR9G6NpIc/refvuigeIxFwoT6iqc0GaWmqz156EE9rfmqcCIJG+QxPYg==
X-Received: by 2002:a81:7757:0:b0:58c:fc64:c834 with SMTP id s84-20020a817757000000b0058cfc64c834mr1069281ywc.11.1692185715840;
        Wed, 16 Aug 2023 04:35:15 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id x204-20020a817cd5000000b0056dfbc37d9fsm3984126ywc.50.2023.08.16.04.35.14
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 04:35:14 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d67305c80deso6801900276.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 04:35:14 -0700 (PDT)
X-Received: by 2002:a25:abc7:0:b0:d71:99da:49b6 with SMTP id
 v65-20020a25abc7000000b00d7199da49b6mr1971998ybi.29.1692185714245; Wed, 16
 Aug 2023 04:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801105932.3738430-1-arnd@kernel.org> <202308100045.WeVD1ttk-lkp@intel.com>
 <106a93ae-90f1-45fb-ae0a-034eb2d6faea@app.fastmail.com>
In-Reply-To: <106a93ae-90f1-45fb-ae0a-034eb2d6faea@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2023 13:35:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAO=-Qc71YWF2UFBVhbp55Fog-iUAuENNtiEP4xqx5ig@mail.gmail.com>
Message-ID: <CAMuHMdWAO=-Qc71YWF2UFBVhbp55Fog-iUAuENNtiEP4xqx5ig@mail.gmail.com>
Subject: Re: [PATCH] rtc: stm32: remove incorrect #ifdef check
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, oe-kbuild-all@lists.linux.dev, 
	Alessandro Zummo <a.zummo@towertech.it>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Amelie DELAUNAY <amelie.delaunay@foss.st.com>, 
	Christophe Guibout <christophe.guibout@foss.st.com>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Aug 9, 2023 at 8:26=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Aug 9, 2023, at 18:36, kernel test robot wrote:
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202308100045.WeVD1ttk-lkp@intel.c=
om/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/rtc/rtc-stm32.c:903:12: warning: 'stm32_rtc_resume' defined b=
ut not used [-Wunused-function]
> >      903 | static int stm32_rtc_resume(struct device *dev)
> >          |            ^~~~~~~~~~~~~~~~
> >>> drivers/rtc/rtc-stm32.c:893:12: warning: 'stm32_rtc_suspend' defined =
but not used [-Wunused-function]
> >      893 | static int stm32_rtc_suspend(struct device *dev)
> >          |            ^~~~~~~~~~~~~~~~~
>
> This is the warning you get if my patch is applied but the
> fb9a7e5360dc8 ("rtc: stm32: change PM callbacks to "_noirq()"")
> commit is not. If that patch is applied, mine is needed to address
> the other warning.

Although both are now in linux-next, kisskb reported for m68k/allmodconfig:

    drivers/rtc/rtc-stm32.c:904:12: error: =E2=80=98stm32_rtc_resume=E2=80=
=99 defined
but not used [-Werror=3Dunused-function]
      904 | static int stm32_rtc_resume(struct device *dev)
          |            ^~~~~~~~~~~~~~~~
    drivers/rtc/rtc-stm32.c:894:12: error: =E2=80=98stm32_rtc_suspend=E2=80=
=99 defined
but not used [-Werror=3Dunused-function]
      894 | static int stm32_rtc_suspend(struct device *dev)
          |            ^~~~~~~~~~~~~~~~~

Seems like you missed that the driver uses the old
SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() instead of the new
NOIRQ_SYSTEM_SLEEP_PM_OPS().

Patch sent.
https://lore.kernel.org/r/20230816113326.1468435-1-geert@linux-m68k.org

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
