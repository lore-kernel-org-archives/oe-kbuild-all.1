Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF627275100
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654517; cv=none; b=fc0MAH3BRMV8J8UhXTpwcZBnalecp9DKHGLcqkCWOuGhbi27caxmqW20HSKnTcyjfw63amJKZQQzZmGikrnqHbG0Eq4I528VcnkwJEEUieLkzUxvQJaybCVCmkRmSBXRl6kGvEkWEs0lahLr14A4VVv5Ds9mUxEDb8PzeW2a4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654517; c=relaxed/simple;
	bh=TOTn8GFmhX74x/VZ2DHWF88Fswebwu1oTEvmpmvzOAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DaxIsZ8mxfKoyqWiizyBiu+QZqOoO0qHenAV+Kf6yZKoFSOG/jX9Dlie07/fNLZWUvEdfUZW5aAG0G8fvmy3toUsOprw9xFSOlmqoVouW4+q+TP35MIYDSayesAwxYk96Jj7PCNYdfJGvAygR1bUfZbS+0aq0juT+ib9KKF9t40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8xtx6HN; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8xtx6HN"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5a88b34a6so461484785a.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 04:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747654514; x=1748259314; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvMGf5g2weozdIFZo63Xax4wmIQw1PPebi0s+41OCrs=;
        b=C8xtx6HNMF9dI8uHd8/lRCMV0skWKlmnMP5HIy8FRWz13Kxxr9bFqHyf3gEVcopgy5
         EjzwR59KpSnTvg/Kkrjy7NmWt3YF/FJwTtWOSu63Ulp9ca0aj5UVDiiRrlUlWbSsXo2H
         h5kGgDRcfpPlG2VEmKkcxMJImzb9pNM1vkvAfdPpd2Huf9rcLEKFZsKGv9t1Dp+yGPqB
         Ycre/NkUYHVfy+4deSxAkeE4/+MdwxGdMyVss320bJ2cGobhZ57tjcN0c1ln0rA46zr1
         q3iBfy/yZotRfnVuuruSHtuiRW3EPP8+zLn+jfaGV6L8HkQD28zyH36kgrZVWyb8Fz+Z
         Jtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654514; x=1748259314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvMGf5g2weozdIFZo63Xax4wmIQw1PPebi0s+41OCrs=;
        b=M5GTA8UKHyni+t0l/V8+sS9FrsC1av25hYjeqxsc5zJmxC/G4VIb4wHXg2Mx4xZDS/
         od5Mrhy7BmhGs5fxIGdzTb4i1iD6lYI/F0Wqlcx1ycPlaEA+YDi9d66/6u7+gGmzQiP5
         2ZnM2ZddpoyIH9nkCeZ8+1pWiwiwK1R1jmC/iR0iwPI5QP4vGIPudODf43qAVtok/LaU
         KrmzVYHb6uVZtC+43BiwMX16x9UoH9XoacRaEfDKtlLEnWXpzajOma/PV28K1nxgU9j3
         pwGA6JjdWgEV5RnnYn3I+4TgklTox4bHp2uaUfbfM6MQ431VQrsvK4X3FdTGmbuFP2Hd
         h2+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf4cO4drdroHVmcT9AX4k3zwG1p/c6R7t/6fe2MjxkhDiPmrZMMmf531YCODr1daWjVCNSlxMhlfjX/yBU@lists.linux.dev
X-Gm-Message-State: AOJu0YzdkqLV1mlTqET5QVELP89dQ6fHG4FbyiKveLlBk4aVfV20orvv
	srHSu4At5jOt1mmwc6lxotqcnSy6bZRBv5tI8WUn5X75iGCAGY1vbSOwmGl1W2G6TKp+cofp0mr
	83mGWCcOUvRx/m1+vYwnNa99DTdULkvbj64g3
X-Gm-Gg: ASbGncvWXqeQRX46wqDwowp5gR55Yd18R/4TbQiPV+VvcJ+N3kIry5rMamcn2HFD4aS
	UDQ2I0ZNIRDs7gGtRBtkU/BttzHU0m0Mlj97OSjSZvGk+04slOJJgMXJiLBGTBsjC/pQaUznQPV
	OpkzJxSg/aGqQnX/B/zE2nwmacZptl7+xEXcBLzhBFaFDN8RY0r3q7n3Atl7g6m2GqM73m/cb3T
	g==
X-Google-Smtp-Source: AGHT+IG8voR8X2h42Gvzm1hYVSaBNVOszaGXju3Wj3QHsFtLKDEveorvqw8YGPS+So3ZB6nWZgvBoo5R7KUB95DaVlk=
X-Received: by 2002:a05:622a:59c3:b0:476:9474:9b73 with SMTP id
 d75a77b69052e-494b0939a78mr192684461cf.42.1747654503905; Mon, 19 May 2025
 04:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com> <202505180911.hDevFA1N-lkp@intel.com>
In-Reply-To: <202505180911.hDevFA1N-lkp@intel.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 19 May 2025 15:34:59 +0400
X-Gm-Features: AX0GCFuiDlrcWsgaEaNmFJ8EIQjE8OcrTnIsT4xwkYdG39zHB1uMjrH0T6Jryxc
Message-ID: <CABjd4YwJgZiq9_jKGa70GaxaW8TT=JuwDioU6jH=J_O=t+QT8w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
To: kernel test robot <lkp@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 5:24=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alexey,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-=
bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
> base:   92a09c47464d040866cf2b4cd052bc60555185fb
> patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3=
-3-2197a1b062bd%40gmail.com
> patch subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare f=
or watchdog functionality
> config: loongarch-randconfig-r123-20250517 (https://download.01.org/0day-=
ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180911=
.hDevFA1N-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505180911.hDevFA1N-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clocksource/timer-vt8500.c:201:51: sparse: sparse: incorrect t=
ype in assignment (different address spaces) @@     expected void *platform=
_data @@     got void [noderef] __iomem *static [assigned] [toplevel] regba=
se @@
>    drivers/clocksource/timer-vt8500.c:201:51: sparse:     expected void *=
platform_data
>    drivers/clocksource/timer-vt8500.c:201:51: sparse:     got void [noder=
ef] __iomem *static [assigned] [toplevel] regbase
>
> vim +201 drivers/clocksource/timer-vt8500.c
>
>    175
>    176  /*
>    177   * This probe gets called after the timer is already up and runni=
ng. This will create
>    178   * the watchdog device as a child since the registers are shared.
>    179   */
>    180  static int vt8500_timer_probe(struct platform_device *pdev)
>    181  {
>    182          struct platform_device *vt8500_watchdog_device;
>    183          struct device *dev =3D &pdev->dev;
>    184          int ret;
>    185
>    186          if (!sys_timer_ch) {
>    187                  dev_info(dev, "Not enabling watchdog: only one ir=
q was given");
>    188                  return 0;
>    189          }
>    190
>    191          if (!regbase)
>    192                  return dev_err_probe(dev, -ENOMEM,
>    193                          "Timer not initialized, cannot create wat=
chdog");
>    194
>    195          vt8500_watchdog_device =3D platform_device_alloc("vt8500-=
wdt", -1);
>    196          if (!vt8500_watchdog_device)
>    197                  return dev_err_probe(dev, -ENOMEM,
>    198                          "Failed to allocate vt8500-wdt");
>    199
>    200          /* Pass the base address as platform data and nothing els=
e */
>  > 201          vt8500_watchdog_device->dev.platform_data =3D regbase;

Frankly, given that this driver only applies to VT8500 (which is ARM
based), the warning appears a bit overzealous. After all, on ARM MMIO
addresses are in the same physical address space as normal memory
addresses, and furthermore this platform_data is never dereferenced
directly anyway.

I could silence the warning either by more aggressive casting or by
wrapping the pointer into some struct, but both of those sound a bit
overreaching. Would appreciate guidance from the list on how to best
approach this.

Best regards,
Alexey
