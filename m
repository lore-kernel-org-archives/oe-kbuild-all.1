Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486B61426C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 20:03:43 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76ad842d12fso391389085a.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 13:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692129821; x=1692734621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL7GvkbRmhDzqM1WmdBRx8TqjTSsEFLCFr1O25FZFqI=;
        b=WmxOZi6eZ8c/RlIvx3pLhGCF4OCkRouyNXAipKD8MDMg1OABC1qt0SdyURyJA/Yf4k
         2Gz0FOvdkcHTdhpfy56+IQXRaXlmYavhkPdN/piitQG+UxR/yn3JH//mLeUnPNfZ8dSx
         kWFpSLXL+Ccx410l1slQsqjWC3AmerAWrz9fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692129821; x=1692734621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VL7GvkbRmhDzqM1WmdBRx8TqjTSsEFLCFr1O25FZFqI=;
        b=X0Q3UB4zgn/Q6ukg9w+S7o2QcSKoOstMRFezgctTBdY7E+gyX7+aHgW0cEpme2bI3F
         Db12rH6O4nx9kxBUP+VB6EPQH8f+J81x3m/2kpu0eSRj/jLPOmZN0Q6m0VVepLTx1jdM
         lG+0jtr461ojIQ9OYY7YaprIv35SLbV6HJT9Ffe1UHou8OHTAI+fLF4vRfFdE1G9Nbw4
         LMd2MaT7lNGT63lIbtOijdcREOjmNGn7u0soss7BBtrTI9WvLhxvdCT0d6VsHEF4mpoD
         hp5VpSFWM8APjQdnhV7DBBcQNTRniwIZfsyqqMmg2n3yI+xhz2+2Ii8CfImZeoPf5T7S
         CYRw==
X-Gm-Message-State: AOJu0YxJrD17w3imBLoLXHmqQQPBdjOEd9biGcZFV1sJxPgiDKCu8+sE
	t5dy+u1VO0QQGFY2ifutJo1rMhnEqXpGmcvfUjrbhRm4
X-Google-Smtp-Source: AGHT+IEMdNcfVK/4gwIMrhEJX5BOgsQlJEwy3n4ridu1arAuxUdmmvtrJlvwAFq4eLWAuCub3ejHaQ==
X-Received: by 2002:a05:620a:1673:b0:76c:e63b:30f8 with SMTP id d19-20020a05620a167300b0076ce63b30f8mr13178105qko.41.1692129820820;
        Tue, 15 Aug 2023 13:03:40 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id o20-20020a05620a111400b00767e2668536sm3977322qkk.17.2023.08.15.13.03.40
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 13:03:40 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-40c72caec5cso82181cf.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 13:03:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1755:b0:405:3a65:b3d6 with SMTP id
 l21-20020a05622a175500b004053a65b3d6mr9248qtk.13.1692129819803; Tue, 15 Aug
 2023 13:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308110003.nNRe30qb-lkp@intel.com>
In-Reply-To: <202308110003.nNRe30qb-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Aug 2023 13:03:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Woz3tpHTaXbqs+4Vx1dCpEsZaH-pYRLAkkJP0-CEKszQ@mail.gmail.com>
Message-ID: <CAD=FV=Woz3tpHTaXbqs+4Vx1dCpEsZaH-pYRLAkkJP0-CEKszQ@mail.gmail.com>
Subject: Re: [linux-next:master 5608/8441] i2c-hid-core.c:undefined reference
 to `drm_panel_remove_follower'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Maxime Ripard <mripard@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 10, 2023 at 9:32=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   21ef7b1e17d039053edaeaf41142423810572741
> commit: 96a37bfd232ae912648c73cd2dc29c13f1c7776a [5608/8441] HID: i2c-hid=
: Support being a panel follower
> config: arc-randconfig-r092-20230809 (https://download.01.org/0day-ci/arc=
hive/20230811/202308110003.nNRe30qb-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110003=
.nNRe30qb-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308110003.nNRe30qb-lkp=
@intel.com/
>
> Note: the linux-next/master HEAD 21ef7b1e17d039053edaeaf41142423810572741=
 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
>    arceb-elf-ld: drivers/hid/i2c-hid/i2c-hid-core.o: in function `i2c_hid=
_core_remove':
> >> i2c-hid-core.c:(.text+0xe52): undefined reference to `drm_panel_remove=
_follower'
> >> arceb-elf-ld: i2c-hid-core.c:(.text+0xe52): undefined reference to `dr=
m_panel_remove_follower'
>    arceb-elf-ld: drivers/hid/i2c-hid/i2c-hid-core.o: in function `i2c_hid=
_core_probe.part.0':
> >> i2c-hid-core.c:(.text+0x113e): undefined reference to `drm_is_panel_fo=
llower'
> >> arceb-elf-ld: i2c-hid-core.c:(.text+0x113e): undefined reference to `d=
rm_is_panel_follower'
> >> arceb-elf-ld: i2c-hid-core.c:(.text+0x11de): undefined reference to `d=
rm_panel_add_follower'
> >> arceb-elf-ld: i2c-hid-core.c:(.text+0x11de): undefined reference to `d=
rm_panel_add_follower'
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for I2C_HID_CORE
>    Depends on [m]: HID_SUPPORT [=3Dy] && I2C_HID [=3Dy] && (DRM [=3Dm] ||=
 !DRM [=3Dm])
>    Selected by [y]:
>    - I2C_HID_OF_GOODIX [=3Dy] && HID_SUPPORT [=3Dy] && I2C_HID [=3Dy] && =
OF [=3Dy]

Breadcrumbs: this should be fixed by:

a0769f25a3a6 HID: i2c-hid: add more DRM dependencies

Which matches the note that "linux-next/master HEAD [...] builds fine."

-Doug
