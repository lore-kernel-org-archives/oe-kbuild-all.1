Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025DA229B36
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758033056; cv=none; b=o6Xeu6ji3L/Xz7mwcPjaesoA3uskWvuAbmA+zabwH//C2/Xsc0PeLi/Voyt+Lu/5HJUE4uSwE7S/awlwBQXlXhZH1Os/ZPGs5h2cgl95giP0rJF7QHs/eTljIGxK2SgKrZOiR9UqV0ue/cPNbGQ4TAwjxq6xak9MdGmoREkE0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758033056; c=relaxed/simple;
	bh=7yYcx+PfwWgDTCyvf4xJyoeS4icmM+bVNdZS7wZmrS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyGZM/J4VYqJt2WKYe4tolE3i+HDwc9HRyEs6oy7pLs66m0UqaeCr9jqxRAjx84Mc4QjJmUcX9+fHMqkBCXq9CmJDlf8F7kO7eX79xlfUuqK2P93HCR+fTl5COL4aQP9Rj6XyQg7kpxiXJlNV7gLug/qyol4EsZ9lOu+Zj4AgFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CnT4AFxv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CnT4AFxv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77b0a93e067so484531b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758033051; x=1758637851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiffAS7cC9zkCAeD5hrwe++ErwkU044VbYitXleZroU=;
        b=CnT4AFxvekpWKFYSSkboLShBMDjWvbMkYx90aaHO97ySbU1CXeBteMLXeFcPdve3m9
         8FZUJYY72aeCYNsZqknG/5cJE/JGZxHDDl12MdFUR6RNwOgmup1jFZ6k5c9XOR3kBjN4
         grvAq5e85/NFRygOGmN+KGuDbpjumx83NrAI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758033051; x=1758637851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiffAS7cC9zkCAeD5hrwe++ErwkU044VbYitXleZroU=;
        b=gT070lEAw5jd+Bi+JQuBsQ9ByY5kHWcU/n0wyV+CejRqr6AnmJ7NeQhuynq9UvemBK
         H9sLC5w9JHFC8gm5P7x5KKL9BP1r4layd1FlWcF6B9q8bY5rsNgCin1bZc4N/3XvPicG
         PPpuy6jyE1VTq8Dw4WyV4mwp6UohlVK/7lgGkN0XKsPGUc4pRtOc0F/bT52Zswk576X7
         U8z9sTqgoSRDSKytywCU7JPakCGAHBHGOcLFaGiW2e8aODXUKnEYJB5yXVPWDovcSZDV
         ZO7bjoWbAVhxkkzcU6FaVEDQ15chJ8MvIIVh1ZxrMGuPKNBQDJzmiu4WKOQbq9wduyYP
         nphQ==
X-Forwarded-Encrypted: i=1; AJvYcCVosUmMqfKbORjFkcGsYcITi2HtGE7CYMs5rQ8Gd0D2TtpZFgvuxqb5RYaGNg5vQn+fMQ0lPBv/JxE1HpO5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4yjMKBtHoVnI1K5GDSwbTQCYj+1YlREQqFN/0aNRO3jQ72Veg
	PXLHAEE3bJ/8PsvmIkyGvO7VgnMCXmPFS+xaVNy6T/8YIomc70NyLVBJ+Z3j08Yep893fg0FAEA
	LsEg=
X-Gm-Gg: ASbGncuFA2Z66zIXzLFEVTTAGjLVRNQHUY1xN+Eg2Hprmt/RatLk+HOXpHLNK9hfDe8
	tvkvE7jIBnSljyXc/gCUZujHCS7HHdd6EIDyB4wtGVbZBlaeM7fCwrcDeU7FkICpg8YyHo2B4E9
	8kJ8MrrSvFzGtCTHoYEdehaS5p1Md6R/UAL4l/LEQPGz2V7TqTkJnyvjH6Aph3ek+oAMxZaMCaF
	KGHDW8V2LgkEAU27WAg1rgmkft6h/NQpAgBJusl2EBTF2fgoYckwYpSnYdXGyFruuSW+Ntmxo+x
	bOpxVVI/Ft9zpnxrKEau4TbhS1qerULgYsYWEH78+bNKoAYiZyrTMK9Wy/P60PqbvU5G9Ky/5/h
	J0hvwz+h7P8o4nR0fNHYWllu7PFcwxTHvZlAKbLgGC6Ojq3LIP6SKlhn0xiD4DnEKLTn8RaO1RJ
	Ng
X-Google-Smtp-Source: AGHT+IERvW7+xQihAbs1Oyux9dODJSKuZrUCeBkaXy+ywe1DMjS75ZetbgFGcy6Fm+wzlaQqJrUUOg==
X-Received: by 2002:a05:6a20:2584:b0:263:28c2:c8cf with SMTP id adf61e73a8af0-26328c2cd8emr13448991637.47.1758033049770;
        Tue, 16 Sep 2025 07:30:49 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a48c19sm16404523b3a.36.2025.09.16.07.30.47
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 07:30:48 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b52047b3f19so3869824a12.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 07:30:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXy6vCXjMpyctwdsD51sLd9Yb/OORXEqnVdUmVNwalcJVtEFttKgFF1sx2LjdhT4RwOGqOq1M5DjkiEZVN@lists.linux.dev
X-Received: by 2002:a17:903:3885:b0:267:fac6:f099 with SMTP id
 d9443c01a7336-267fac6f0bdmr882655ad.38.1758033047184; Tue, 16 Sep 2025
 07:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910183353.2045339-1-john.ripple@keysight.com> <202509161344.FPfsjq01-lkp@intel.com>
In-Reply-To: <202509161344.FPfsjq01-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Sep 2025 07:30:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZ8=o3D4iQ+hMFKup+8LuUh74BOyf7YLX-VHRkcU7TrA@mail.gmail.com>
X-Gm-Features: AS18NWDcO5yWc3JLU6eUzWEdoHiHgHWEJMNFpIAQ3YTFuxgHuOAPRPJlbYq6e8M
Message-ID: <CAD=FV=VZ8=o3D4iQ+hMFKup+8LuUh74BOyf7YLX-VHRkcU7TrA@mail.gmail.com>
Subject: Re: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, John Ripple <john.ripple@keysight.com>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Laurent.pinchart@ideasonboard.com, 
	airlied@gmail.com, andrzej.hajda@intel.com, blake.vermeer@keysight.com, 
	dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	matt_laubhan@keysight.com, mripard@kernel.org, neil.armstrong@linaro.org, 
	rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 15, 2025 at 10:46=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hi John,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20250911-02=
3707/John-Ripple/drm-bridge-ti-sn65dsi86-break-probe-dependency-loop/202508=
20-235209
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250910183353.2045339-1-john.ri=
pple%40keysight.com
> patch subject: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for Displ=
ayPort mode with HPD
> config: x86_64-randconfig-161-20250916 (https://download.01.org/0day-ci/a=
rchive/20250916/202509161344.FPfsjq01-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509161344.FPfsjq01-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1385 ti_sn_bridge_interrupt() error=
: uninitialized symbol 'status'.
>
> vim +/status +1385 drivers/gpu/drm/bridge/ti-sn65dsi86.c
>
> b8670cf7e6a41b John Ripple  2025-09-10  1365  static irqreturn_t ti_sn_br=
idge_interrupt(int irq, void *private)
> b8670cf7e6a41b John Ripple  2025-09-10  1366  {
> b8670cf7e6a41b John Ripple  2025-09-10  1367    struct ti_sn65dsi86 *pdat=
a =3D private;
> b8670cf7e6a41b John Ripple  2025-09-10  1368    struct drm_device *dev =
=3D pdata->bridge.dev;
> b8670cf7e6a41b John Ripple  2025-09-10  1369    u8 status;
> b8670cf7e6a41b John Ripple  2025-09-10  1370    int ret;
> b8670cf7e6a41b John Ripple  2025-09-10  1371    bool hpd_event =3D false;
> b8670cf7e6a41b John Ripple  2025-09-10  1372
> b8670cf7e6a41b John Ripple  2025-09-10  1373    mutex_lock(&pdata->hpd_mu=
tex);
> b8670cf7e6a41b John Ripple  2025-09-10  1374    if (!pdata->hpd_enabled) =
{
> b8670cf7e6a41b John Ripple  2025-09-10  1375            mutex_unlock(&pda=
ta->hpd_mutex);
> b8670cf7e6a41b John Ripple  2025-09-10  1376            return IRQ_HANDLE=
D;
> b8670cf7e6a41b John Ripple  2025-09-10  1377    }
> b8670cf7e6a41b John Ripple  2025-09-10  1378
> b8670cf7e6a41b John Ripple  2025-09-10  1379    ret =3D ti_sn65dsi86_read=
_u8(pdata, SN_IRQ_STATUS_REG, &status);
> b8670cf7e6a41b John Ripple  2025-09-10  1380    if (ret)
> b8670cf7e6a41b John Ripple  2025-09-10  1381            pr_err("Failed to=
 read IRQ status: %d\n", ret);
>
> status isn't initialized on error.
>
> b8670cf7e6a41b John Ripple  2025-09-10  1382    else
> b8670cf7e6a41b John Ripple  2025-09-10  1383            hpd_event =3D sta=
tus & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
> b8670cf7e6a41b John Ripple  2025-09-10  1384
> b8670cf7e6a41b John Ripple  2025-09-10 @1385    if (status) {
>                                                     ^^^^^^
> warning

It looks like the bot reported this on an old version. The newest is
v7 [1] and things should be OK there. Yell if I missed something. :-)

[1] https:/lore.kernel.org/r/20250915174543.2564994-1-john.ripple@keysight.=
com
