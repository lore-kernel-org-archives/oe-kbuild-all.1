Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513221B140D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725871538; cv=none; b=n2Fr/EHpblbw+ZIX/or0XKWbabm9OJV9EldVYERBiEQmZS3E9Doj6QHcItnSptMbQiFtyK1samVTg5VraGLTCT9Bt+z4Dpxf7RsCwXj23cWr/qqHMZAYt6FFRQJgqo/IuyV3IH0E4gl5N7uacQwqRzEhmATsTZMBzFkATGJsRuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725871538; c=relaxed/simple;
	bh=Hjz+O50xaShzsCzJW4dtU4OnYeaMBQRxnhVWq8j2+HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCOTmAPnLBnpVV90/llGR8fZqUdaZRNs60yv8Bud5ueAiT02mPXjQWZHGNIJ06gR42bi7QEbd/BUDu/EbCJUTRkwRCHRH9dVrZ0YaXrrvTXj48QaYugAD5Bu2+Q9xf/3QqxW9GnyxA9nRALzQrK1CarYCyEpwJnTWkv1YkiYNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1d0e1bffc8so3746301276.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Sep 2024 01:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871533; x=1726476333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OClx8FdjyQ2dYCnYDOmUx9fSX8zEhQ05R0o7VQeRBrI=;
        b=If6skdoSfo0/ofuncDN/g79DYq6s1zapyE9pkayW4Rm97JFTUGfHk/liro4X9hIQoH
         Phkjdy/fB9HSk/XDVcrFe2w6/i857Rn63kxUBbF4NUV01eu/ZIXt+nmCSa4PeZN72MD5
         eUcBS75HFFzW+uYV6gi8NFbp8HkRmxFBG1n+6SvDJ5eBkXm/9g1F/3vqnM7cqAWK4Av/
         Q+aEYPvMP0S1uZUhw+92ljE7acsxFOI4umdIgObI3dVk/kKxNQZNPHSKiKaP9fEyFTjS
         rKSZg8f9vQ8AnvXbVlOxHQ7h7sPFkwQ8y32eahDtCGDFtqMR01OXbYdpRDnd4x0opUCh
         QCzg==
X-Forwarded-Encrypted: i=1; AJvYcCWmvrY3d/VfVHCz3Pm0WrLbNs2d8YGotusrnZUG7Dv0JQbZVpwUVNokmfX7rxr9okZdSJCp6s71jq7TcKA1@lists.linux.dev
X-Gm-Message-State: AOJu0YzNWemcMTQNvWtFqh4Vvby5TG//xCINVbLLHbTt9lrSdLQOtYqk
	MK8B8/ROmVk4CPt8izzIlf+OdzMcPL7i/8g3pYcSFtvX9OaLr2lZgDupBgI/
X-Google-Smtp-Source: AGHT+IHgRLcw/BPzHA+r30TwmHqAfRF0nMeTCYGRmHC7bplF9S6Kr0KbiojlPk0TMPrgljDtMhpIOg==
X-Received: by 2002:a05:6902:cc1:b0:e13:83fd:cf19 with SMTP id 3f1490d57ef6-e1d34a1e816mr9702139276.49.1725871533174;
        Mon, 09 Sep 2024 01:45:33 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d4b3044e7sm873832276.27.2024.09.09.01.45.31
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 01:45:31 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6d6a3ab427aso30416997b3.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Sep 2024 01:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVItSZQ+NlwMEuRsCZ/YtXpOGT42Mwgr1CjF5y8s0qQAgG/vMU9HXfNU1wK5QZNOrQc3faY9jPdVdmoJR2c@lists.linux.dev
X-Received: by 2002:a05:690c:113:b0:64a:7040:2d8a with SMTP id
 00721157ae682-6db44f10494mr80803477b3.23.1725871531566; Mon, 09 Sep 2024
 01:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3985690b29340982a45314bdcc914c554621e909.1725536870.git.unicorn_wang@outlook.com>
 <202409080100.h6lX5Asm-lkp@intel.com> <MA0P287MB28225ECCF1D263A20917AD5DFE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB28225ECCF1D263A20917AD5DFE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 10:45:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOAmCsdcvdo41qD9f4L=K2uZa6nJN7D5YOTTuCnBHtWA@mail.gmail.com>
Message-ID: <CAMuHMdXOAmCsdcvdo41qD9f4L=K2uZa6nJN7D5YOTTuCnBHtWA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pwm: sophgo: add driver for Sophgo SG2042 PWM
To: Chen Wang <unicorn_wang@outlook.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Chen Wang <unicornxw@gmail.com>, ukleinek@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen,

On Mon, Sep 9, 2024 at 10:26=E2=80=AFAM Chen Wang <unicorn_wang@outlook.com=
> wrote:
> I wonder why CONFIG_PWM_SOPHGO_SG2042 is enabeld for m68k? Please remove
> this.

Because it depends on ARCH_SOPHGO || COMPILE_TEST.
So it can be enabled on all architectures when compile-testing.

> On 2024/9/8 1:58, kernel test robot wrote:
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bin=
dings-pwm-sophgo-add-bindings-for-sg2042/20240905-201303
> > base:   431c1646e1f86b949fa3685efc50b660a364c2b6
> > patch link:    https://lore.kernel.org/r/3985690b29340982a45314bdcc914c=
554621e909.1725536870.git.unicorn_wang%40outlook.com
> > patch subject: [PATCH 2/2] pwm: sophgo: add driver for Sophgo SG2042 PW=
M
> > config: m68k-randconfig-r133-20240907 (https://download.01.org/0day-ci/=
archive/20240908/202409080100.h6lX5Asm-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 14.1.0
> > reproduce: (https://download.01.org/0day-ci/archive/20240908/2024090801=
00.h6lX5Asm-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202409080100.h6lX5Asm-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/pwm/pwm-sophgo-sg2042.c:99:34: warning: 'sg2042_pwm_match' de=
fined but not used [-Wunused-const-variable=3D]
> >        99 | static const struct of_device_id sg2042_pwm_match[] =3D {
> >           |                                  ^~~~~~~~~~~~~~~~
> >
> >
> > vim +/sg2042_pwm_match +99 drivers/pwm/pwm-sophgo-sg2042.c
> >
> >      98
> >    > 99       static const struct of_device_id sg2042_pwm_match[] =3D {
> >     100               { .compatible =3D "sophgo,sg2042-pwm" },
> >     101               { },
> >     102       };
> >     103       MODULE_DEVICE_TABLE(of, sg2042_pwm_match);
> >     104

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
