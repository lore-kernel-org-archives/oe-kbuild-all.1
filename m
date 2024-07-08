Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988E148FEE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720461299; cv=none; b=ug67dAg/3FuLKxUiFoHEtZWPz3aqi237gp1eitnQbC91r4TpboaQ0Zoa+11aQLN17LSPNbNtyro0hltpjc5EgsLhOFfhAz5s+okkNm9A1mUKiOFlbxMntrdEPtYeXdJ3rrmKRV9ws3cDH2aljeM0t0UcNNqBn1brDOpZPBzs2pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720461299; c=relaxed/simple;
	bh=VsRbpkHXh35QTCvvMw6HcLrDLL7F93VydYFlcaJ99c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUPprj+M68NJGcwAgAt8zN5y6QGBy9V3f20/BhJm8NopJj2756qxCK9LtUUp67nJevoC+ir+HKiEs0F9lhwhrbs4UVSYYz9XFG3mb/P5vOpKByJuq7n1i80HRwCoZeXJYxcpTqMvUlixMjizH+r5AGfmm15hU4qH86Tp2tMLaYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HZzgL6Hp; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HZzgL6Hp"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b5f46191b5so19922806d6.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Jul 2024 10:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720461295; x=1721066095; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUxVyXvmH2ZHRP4WWiJD1IGEJI8jwRuhGplxULpfTlQ=;
        b=HZzgL6HpSjdRR08YnyqenZlDuK5oxTf1JcjIox1m2AxwkGdixrDk2MmCWjpLkYiVJA
         XuRb47BRG+NMptPnk/DT75Cw/vfPNvFXfnikk6dQnWV0LGfrjC2lKqj2pIcruK40Igyy
         r1XBoy0EvgGCLe/3P9NxMwWam2isi/ipxabV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720461295; x=1721066095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUxVyXvmH2ZHRP4WWiJD1IGEJI8jwRuhGplxULpfTlQ=;
        b=Q/LFepS46Di1b/BgUEe89ew7s4wMwfxCYknt/KlkHDVroGtZ6++P3zGI8ir/YfPoLU
         Kro2ZFszFyBJfHuHtoWUrsuugVoaBxVBchk5byMacl7GU3t61skLPcTYP5ML3AKCmxnQ
         7BwuYMMzJebw8t2aG/T91pEp4TtZKnthFoJ1VBU5j12GIDPVuk8B56c7XWVlTfj/E4Vd
         9lkRlMDjM4ZDktTlJl8SQTgpnvhm5aKBiWd75fGoUa3yAlRZ+nEIKmg4IcLRxbcpI8Ul
         n6tWQMBo9atQIGSlJM3ci7WPzcvG6YDH/PzBqioQabl14Gp5LkdKPNVlXw4QrEuTT+/6
         hZrg==
X-Forwarded-Encrypted: i=1; AJvYcCUSc8koSx1eAi3hPk4C45dJgV2l1FOWlRZJaNoUO3wXWxI5397q+FmwT3XgFPu3t/7Azz8XVaVTwoSgg/mfs4oOFaMYqIc6mmBKCSKOYg==
X-Gm-Message-State: AOJu0YyJxtLy8IN30p6e22+72UbpUgGFwG+U6ok3tB29kfxmWAOPIy0J
	q6akqnN8dTjyGM7zJgm/ZlMFt7327kK6Mg1rc2tf43rMypEOsVlE3n5VVcQW4I9zuoZSAeiXKUo
	=
X-Google-Smtp-Source: AGHT+IE7HItky7Phr7Vn5X/fGTFA7dhRo8UY+K/GK+eU0mm/enTP6TWYcfTm+Oidfov4GXpJjzFOjQ==
X-Received: by 2002:a05:6214:2389:b0:6b5:3bc:388f with SMTP id 6a1803df08f44-6b61bd12a29mr5296696d6.32.1720461295225;
        Mon, 08 Jul 2024 10:54:55 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61b9ef23csm1528376d6.48.2024.07.08.10.54.54
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 10:54:54 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-44664ad946eso21661cf.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Jul 2024 10:54:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOleRiByJV1lDYZMYUHqy5/lhU89PDpqhfck12Km/W/kCFFELZxPGDKPele5pH1K83geW4OwRgIAhKNKDD1+LoxjaojfyuIMTVSYlEZA==
X-Received: by 2002:ac8:5158:0:b0:447:e393:fed1 with SMTP id
 d75a77b69052e-447fc292838mr25411cf.7.1720461293738; Mon, 08 Jul 2024 10:54:53
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <137ec596-b946-4076-a0c4-30f3b3285e36@suswa.mountain>
In-Reply-To: <137ec596-b946-4076-a0c4-30f3b3285e36@suswa.mountain>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2024 10:54:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVO-B-LQanadhV+n-jSywoEYGMb0Wyo1hCgiAbodeWxA@mail.gmail.com>
Message-ID: <CAD=FV=VVO-B-LQanadhV+n-jSywoEYGMb0Wyo1hCgiAbodeWxA@mail.gmail.com>
Subject: Re: [linux-next:master 4298/8232] drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c:366
 sharp_panel_remove() error: we previously assumed 'sharp' could be null (see
 line 365)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 1, 2024 at 8:45=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> commit: d7d473d8464e7b9931c0b19f68ea0df807e01b4c [4298/8232] drm/panel: s=
harp-lq101r1sx01: Don't call disable at shutdown/remove
> config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/a=
rchive/20240626/202406261525.SkhtM3ZV-lkp@intel.com/config)
> compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406261525.SkhtM3ZV-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c:366 sharp_panel_remove() =
error: we previously assumed 'sharp' could be null (see line 365)
>
> vim +/sharp +366 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
>
> 79abca2b399009 Uwe Kleine-K=C3=B6nig 2022-07-08  355  static void sharp_p=
anel_remove(struct mipi_dsi_device *dsi)
> 1976dbca047ed7 Thierry Reding   2014-08-01  356  {
> 1976dbca047ed7 Thierry Reding   2014-08-01  357         struct sharp_pane=
l *sharp =3D mipi_dsi_get_drvdata(dsi);
> 1976dbca047ed7 Thierry Reding   2014-08-01  358         int err;
> 1976dbca047ed7 Thierry Reding   2014-08-01  359
> 1976dbca047ed7 Thierry Reding   2014-08-01  360         err =3D mipi_dsi_=
detach(dsi);
> 1976dbca047ed7 Thierry Reding   2014-08-01  361         if (err < 0)
> 1976dbca047ed7 Thierry Reding   2014-08-01  362                 dev_err(&=
dsi->dev, "failed to detach from DSI host: %d\n", err);
> 1976dbca047ed7 Thierry Reding   2014-08-01  363
> d7d473d8464e7b Douglas Anderson 2024-06-04  364         /* only detach fr=
om host for the DSI-LINK2 interface */
> 1976dbca047ed7 Thierry Reding   2014-08-01 @365         if (!sharp)
>
> Reversed if statement?
>
> d7d473d8464e7b Douglas Anderson 2024-06-04 @366                 sharp_pan=
el_del(sharp);
> 1976dbca047ed7 Thierry Reding   2014-08-01  367  }

Indeed. Thanks for the catch. Fix posted at:

https://lore.kernel.org/r/20240708105221.1.I576751c661c7edb6b804dda405d10e2=
e71153e32@changeid
