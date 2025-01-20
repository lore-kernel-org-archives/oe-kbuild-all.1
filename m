Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC8D1A8F63
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364676; cv=none; b=NKsHAHdKDshn9hMLrodzSALkXEiIeF9k4fIJteO3gYaJbKu4y9dmcrsDuvxlDOtgPQz6qFQ+psI9uNSXchgMZx4dMYBR+5pd/fo0EdjVQHQsFOjezy+kEjpGm34bvBlFxHiEkCkL0DxEqaFgJOCbrPAcYh0Xl2Y9uo976hJkmWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364676; c=relaxed/simple;
	bh=MFAt3nRPEEDvLMi3xhx5qxNHiq/uMXZUK9TTyWKUbb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2UIN9y+CjhxBryiaUeapQCf59bOKetq83qh2Iv2UYbxv6NQSZz/x11l749zyM1TT//wITRRto7gpD34rUMXC73cAb4cQN1SloI1pNNnrHmw1Oo4yF12st1yj38oH8QAJK1FvWYfOYy0mUlEc8U6oh1pkeBD8fDRkBcDOe+sLfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EN+aPV9Y; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EN+aPV9Y"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3eb7ecc3c54so2472760b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 01:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737364673; x=1737969473; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrJaaExN/Lm4FjffTDRV2Jar/5Ogh6zVj0G2o09/raE=;
        b=EN+aPV9Y7vOSlDefTX5Etr2X2CEA+cUZMPO8mmQAdeUkmT2pfbX+zjaNDpRcA/Vidh
         1ngAc6y8TLOvVgsCqFNT7UbYyXu5RV+1O4xS58uebo0KXcLXXxV47gBhcHmFFLEmnSQ4
         58nt7hNA+eEyle6v7VdChnLPIUjY87m/lq/sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364673; x=1737969473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrJaaExN/Lm4FjffTDRV2Jar/5Ogh6zVj0G2o09/raE=;
        b=XKBTUF4EhLPSQI79xmffFcwwa7oPQhpLirXPBNKH5cwWyYcBzRkClqYqUklNvK5EXC
         IK8T/bvXDuFbhGmsbzqq9s1UlBxJYTfdGP9qHgJGXg5mdDBqXqtcir7I3JGBP1mGGiie
         bLOFAKRnmdaEepEScu5cu1IX98zQ1OnNnFnZ4H6pgJrEoXIFSJ2gCg1ZsQp1XhEzfdDa
         A34b+A13wdJvCJDMWACAogbU2ng9QF3TRytHpXXH6jsNUEKAeZgtO8ImsUBtPVmsjGFy
         23EbzHevsZqT9WW9tGNRNvUyXoVYuq9o7MjC6+DF4pkF9nsvvvscseeo7A+qVOAGrooM
         y2/w==
X-Forwarded-Encrypted: i=1; AJvYcCXkIHX2qj1E5PE2Q2UkSnuP+ClQ+HciBB7EUhrpRWNtX+F8hq5sy1zsvCgkRCLEpnvxb0heXuZ1OU0ROsmS@lists.linux.dev
X-Gm-Message-State: AOJu0YxMnzPOd4yt1JSZ22HZfdQNXFYQpqUdJ2izHcXwcSASi3hxtI/H
	SmiXx5dbP4xqfoP5OROyoCZoYP2/TIeoOVECFvagJGbXbvzgncTt8rBC4uJlqGP9BqAPVhufUpc
	yyD6xcmlqoPRSdP8bUdhtplvNqmLURZl/eGF7
X-Gm-Gg: ASbGncvebYyOW1OMI/4SZh2gz43dAdmkOOiP+VjyDO8QTm4iE/YZECHQ1AV+lnyV4p9
	fdeWtIy5+E9qToqLO/9tBrYVOF+rLmn1vXK97CXfKJD0JxMco+yRP/hL+u9r9oQltYMLbFBaBIW
	8J5KY=
X-Google-Smtp-Source: AGHT+IGMAh+w1Gz6p28RK3/Kth8ILRYRgo6m2nDhbUzgQugav48TFGXg/Z1zHoQ5cs13BAumkleX3RdAp09lzIwOHiA=
X-Received: by 2002:a05:6808:8411:b0:3ec:d34f:4c73 with SMTP id
 5614622812f47-3f19fd30cd9mr5906073b6e.27.1737364673207; Mon, 20 Jan 2025
 01:17:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7c24973-cebe-44e0-a5f4-9c2497dd3206@stanley.mountain>
In-Reply-To: <a7c24973-cebe-44e0-a5f4-9c2497dd3206@stanley.mountain>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 20 Jan 2025 17:17:41 +0800
X-Gm-Features: AbW1kvZuCneYxJkeQaxYr8XfSXJr6ATKtRBfmL8qC2BoM4TKAMF1yczgSehDjTA
Message-ID: <CAEXTbpfcBtBRDcMcDuaOPQeYJLrd0qkP5P1hOmsgky0BOZkFfQ@mail.gmail.com>
Subject: Re: [wens:mtk-wip 24/48] drivers/gpu/drm/bridge/analogix/anx7625.c:2658
 anx7625_typec_mux_set() error: 'port' dereferencing possible ERR_PTR()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Mon, Jan 20, 2025 at 1:36=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mt=
k-wip
> head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
> commit: d62036e150e84eff425756d90cf8f060d86beb17 [24/48] drm/bridge: anx7=
625: Register Type C mode switches
> config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/arc=
hive/20250118/202501180409.LUg1bFSN-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202501180409.LUg1bFSN-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/bridge/analogix/anx7625.c:2658 anx7625_typec_mux_set() er=
ror: 'port' dereferencing possible ERR_PTR()
>
> vim +/port +2658 drivers/gpu/drm/bridge/analogix/anx7625.c
>
> d62036e150e84e Pin-yen Lin 2023-03-31  2654  static int anx7625_typec_mux=
_set(struct typec_mux_dev *mux,
> d62036e150e84e Pin-yen Lin 2023-03-31  2655                              =
struct typec_mux_state *state)
> d62036e150e84e Pin-yen Lin 2023-03-31  2656  {
> d62036e150e84e Pin-yen Lin 2023-03-31  2657     struct drm_dp_typec_port_=
data *port =3D typec_mux_get_drvdata(mux);
>                                                                          =
             ^^^^^^^^^^^^^^^^^^^^^^^^^^
> typec_mux_get_drvdata() this returns ERR_PTR(-EOPNOTSUPP) if CONFIG_TYPEC
> is disabled.  I assumed that the Kconfig specified that CONFIG_TYPEC had
> to be enabled unless COMPILE_TEST was enabled but I didn't find that in
> the KConfig when I looked.

This is a callback that is only registered through
`typec_mux_register()`, which also returns ERR_PTR(-EOPNOTSUPP) when
CONFIG_TYPEC is disabled.

So, anx7625_typec_mux_set() should never be called when CONFIG_TYPEC
is disabled.
>
> Does the Kconfig have a depend/select/imply on CONFIG_TYPEC that I missed=
?

The Kconfig around this is "depends on TYPEC || TYPEC=3Dn", though this
is not directly related to the warning here.

>
> d62036e150e84e Pin-yen Lin 2023-03-31 @2658     struct anx7625_data *ctx =
=3D port->data;
> d62036e150e84e Pin-yen Lin 2023-03-31  2659     struct device *dev =3D ct=
x->dev;
> d62036e150e84e Pin-yen Lin 2023-03-31  2660     struct drm_dp_typec_switc=
h_desc switch_desc =3D ctx->switch_desc;
> d62036e150e84e Pin-yen Lin 2023-03-31  2661     bool new_dp_connected, ol=
d_dp_connected;
> d62036e150e84e Pin-yen Lin 2023-03-31  2662
> d62036e150e84e Pin-yen Lin 2023-03-31  2663     if (switch_desc.num_typec=
_switches =3D=3D 1)
> d62036e150e84e Pin-yen Lin 2023-03-31  2664             return 0;
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

Regards,
Pin-yen
