Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7E18661B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433503; cv=none; b=l6k4g+cLdAGLzocQ5bmhJpCWQHRBIgaCWbqgNyiF/nY2E2y7KwIygFGjQlFWEWqjd3xrMdtawG4OUIfUg7ux+VKSXgoFMfocptbNZZfOTlGzjqnzkNaSqhtAtV56Y3oSiw7uXpsTUuZQGUnLL/xXmag6VaD0/5uYgO1BhXH9A0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433503; c=relaxed/simple;
	bh=pmFGygZxPJx6aYGNSW60iGtOM7wgq8ixdqA7QVOwsmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oW/BnMiqtWbUKD3TuBvecSLYCXEis85SzXvX4vma+r8iP7Kf+JVe0XjomnynSYzfc8Bk0B+FMo1kzSMwI79T9hq666eENNzchh8M2ORd4h0Jx2oHs7/xDdanjGXmH0Xos0Oc9CJFOoRRlpWYmSYNs95Zt2w8L99k4QOsohMkoDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=AO6kKomZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AO6kKomZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20551e2f1f8so24260635ad.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727433501; x=1728038301; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqrbFrNE08H46WiKttVLHqe5jR2DtmKYo4FHrvBtyf0=;
        b=AO6kKomZ79Vd4I+Z9UUN1POLDcYKMca6NQj/gIFjEHliCs9FsLvvFRwaxx9zV8YSRM
         1CYALVEO8JmRKIS+VnkCfORzvmYW92g241dvn3Q3j6g5WbWZhg9DNBcEq7RLxkWasQf6
         c/r5fYV5OlgIUsNcKjd18ro4rn8I0MByaKtglYopX8cGvHoGE8SWbQdIZ0HF4WRip5en
         ulzY4I8zN/uWaxyAWxCnoSE2ibzngOaQZ2EpWe4jOnfGPdRJcJd/QbGAWY+xbXO9i7gU
         8FkHAfk0xb+qi21LHFnzwM1F9K1ZSxyrTdZG230fnXBkY6WxsM6ac/I3Wff25yp20l7j
         LqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433501; x=1728038301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqrbFrNE08H46WiKttVLHqe5jR2DtmKYo4FHrvBtyf0=;
        b=bfeswKkMU+dPBcuHjINA1lU0cFeAvX1aBBQloj4MOUINgninyLe5e1z6tvfOa+84n+
         /fNhNgqGQ/s00vM964ZtyKKpyzDqRUmdeT59zPQd26MqpH/JzgmwYcq1c3z5SFevRT9F
         O5VFotXcgnw+L5KiuF77TO0MPZiYmHQmWZBi1UIAZ0+ktxcYVw8sO+sRshwb2PG/LUoD
         Vq+ihAmPV39w8N42aySng7fThRnFYzgUM9l/JgDTMsu0pjqJTYIGZGN/6TJN5L9rOyOZ
         XM6DozY9qHcc3eg1uZfM9Pwx5cX4f5SBOHsSi+lUtN+XQnd/jZBermVmJR/b4I71rBO5
         BJ0w==
X-Forwarded-Encrypted: i=1; AJvYcCVXWmotWhlLUlQPordoHVnLF9AQw33WbKFy0mzWNqExKV/L3eS3hLUfN6+H1v/3RtDwAoeCmsT0IAvvqAUw@lists.linux.dev
X-Gm-Message-State: AOJu0YyaonIgrUX/saL96h2Nv8dO2O728XeSMMI6BUhMHQf5bt7VSkpE
	r3kLK6hi9t+MKBjNOxbRReN/wjWKekBPQnTiRv+vwhtIly5S2w3pgRV0+ZLw+KOcq2bjkY6msiR
	/fTl3FYP569aUz7b3h0yOljlNL/8=
X-Google-Smtp-Source: AGHT+IElrujw1ho77+RmYeFTrDjRjtANTuSZvznuckpa+dCu++SoERn9fwbaf94LuVQfx3xw0AHX1UJXuyrjU4v26KE=
X-Received: by 2002:a17:902:d502:b0:209:de2e:2198 with SMTP id
 d9443c01a7336-20b37be631amr51203895ad.49.1727433501303; Fri, 27 Sep 2024
 03:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409271243.xjYHZS7H-lkp@intel.com> <1j7caxxyqq.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j7caxxyqq.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Sep 2024 12:38:10 +0200
Message-ID: <CAFBinCA+N=Wk4NHA04KwAPUW1+9ffdpHxgxe+xc_HEtjP8Qk=Q@mail.gmail.com>
Subject: Re: [clk-meson:clk-meson-next 11/11] drivers/clk/meson/meson8b.c:3700:23:
 warning: unused variable 'flags'
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 10:54=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> On Fri 27 Sep 2024 at 12:36, kernel test robot <lkp@intel.com> wrote:
>
> > tree:   https://github.com/BayLibre/clk-meson.git clk-meson-next
> > head:   e736da1956cf0880a02ec5023f3487eea7611b5f
> > commit: e736da1956cf0880a02ec5023f3487eea7611b5f [11/11] clk: meson: me=
son8b: remove spinlock
> > config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240=
927/202409271243.xjYHZS7H-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240927/202409271243.xjYHZS7H-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202409271243.xjYHZS7H-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/clk/meson/meson8b.c: In function 'meson8b_clk_reset_update':
> >>> drivers/clk/meson/meson8b.c:3700:23: warning: unused variable 'flags'=
 [-Wunused-variable]
> >     3700 |         unsigned long flags;
> >          |                       ^~~~~
>
> Silly mistake. I'll amend the commit if that's ok with you Martin ?
yes, please amend the removal of this line to the commit
