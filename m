Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD741D0173
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727876293; cv=none; b=N+n6DuvqP5hVa+63uA4hCsUIRSuo0+j8O8M4N73n5dYgeuFe+CDvYsEwDBgJxgHLyiI2SIUydhPLpiAKFS5F2+HGgTGlq5xAwSy30QKDcmV4oHfoCFUsKosKzUGIxr2GjSI8w9bG3y0vYdI1HXXQJEtpKYuJJD14OsNs3YWLbHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727876293; c=relaxed/simple;
	bh=6yoNHjlamlraeMc3V59paBJJnLoyV3WYUfj3EmI8few=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jT4S3eab+h3FbHY4cghLSyA6WxXmFvuyEzxMu26y5hREG71OW8ZevJLDuOiBXYthyro4+OkKJxJ9JpuIlFnWaqZOo8rFT2slwmTY42hkgBdV8fE69quTFni/dZ/xB/C4vU7KVXqMKDL7iLtusqDOxlvoFM3QwEpf9n9tSY6buaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cpN4d7VG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cpN4d7VG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so4939998e87.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Oct 2024 06:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727876288; x=1728481088; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gx7nBhp6lxVo1pa4k/APyedN4jV9Ivk3rAOgniXY4K8=;
        b=cpN4d7VG30XMlzrLz2UdPFjjfAcW+hgA3ErdHIDhSXRdQs/a+CmI9W88FrsmfDgrbC
         +d3DUG8CAVD4cJVphBHjud1amsIvY/p92KXFsnar2Spz9p7Dlvz2SP0kfCnczJqtqf/X
         MkzYmNlDQGqY6FaLeL5NddNfXFlA0lqxk6hx6XSfQGYiKAI1QDEcSrAp6ru0tC1xxCcR
         mXdM3FurwK65KfEO11+nJSbvGe7Rf/qgC49ECSiIZO5+ZMueRClY7qW67kq2nPPs6IAb
         9FsLRSY6geTJCo9U110Xyj7h5J84+kP9IoCeT5oNoFr/lh0Bc6y76WWXomcE1HHpSmA1
         G8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727876288; x=1728481088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gx7nBhp6lxVo1pa4k/APyedN4jV9Ivk3rAOgniXY4K8=;
        b=RlgOfZNxBk5sKqrNOu8eS7sFOXoU9jQ5j3CO5L3tsRYImdOU+dOcggCxjNrYOnXQYJ
         mfM9dildoLqJd0kjA7bCqvJGctRAoDmMsoU4newLSRJvVLoRCa6lOiNRPlKn/D4AOKKw
         c65ZJ0FKxctX8Ho1S53Q9OOPCYvC89VBWX4yeYQ5LbSJYyx7Y0OEJ3d2MNlMvVvhX3tZ
         97TKSlfSqYVLEQimCQ98Riin6heV8ZWod1CBStA6Flr+MMBbDwTDVoGu1WtRPYUcTKgk
         erE3jeBH+9Kget62Oe23Oz3zEzH8GPAZzVGJLGtWRz87xGjifR+tNm7hVylaQDDZJC5p
         mMhw==
X-Forwarded-Encrypted: i=1; AJvYcCX0qNtEI28o9iob7yEg0dvPIAQiJKKxbgHt4OTprRk8oOJGrnfYSw+S1OWt/xwKAzHUUgSE4Wwty1X/YBAq@lists.linux.dev
X-Gm-Message-State: AOJu0YxmB53VdRH14tjCbjnnH/BJ9zujM4OdmfNbSytorBaa2e3ZJ2dk
	7uoPS641OVTMDHjQ70biTEMLnoe0EtVlvcL0r+JRV2hZkRyu3YihqiMVKy28avafltDJIYegcZq
	DXh2TMpF3yieiDucbBg0Elx8lCZIKQcPLoleDGw==
X-Google-Smtp-Source: AGHT+IFtOBtnoN0143aZXVWAwkEH+oTi/X5tyE2nQpsGUqONGRL4JsQwsp1UDaTLIqpdvcw8O3TsElrFgBjHjgxlEig=
X-Received: by 2002:a05:6512:308b:b0:539:93b2:1373 with SMTP id
 2adb3069b0e04-539a0662b0cmr2044174e87.20.1727876288279; Wed, 02 Oct 2024
 06:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410020735.aBI61ZYn-lkp@intel.com> <Zv0S3wXOzgmyFP3x@google.com>
In-Reply-To: <Zv0S3wXOzgmyFP3x@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:37:56 +0200
Message-ID: <CACRpkdZmKfNWF7ciHJMi4JU+_JnxjWD_kMhfxFOeydQ11Vyc4Q@mail.gmail.com>
Subject: Re: drivers/input/touchscreen/cyttsp_i2c.c:47:18: error: implicit
 declaration of function 'i2c_transfer'
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 11:31=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> >    drivers/input/touchscreen/cyttsp_i2c.c:118:26: warning: 'cyttsp_i2c_=
driver' defined but not used [-Wunused-variable]
> >      118 | static struct i2c_driver cyttsp_i2c_driver =3D {
> >          |                          ^~~~~~~~~~~~~~~~~
> >    cc1: some warnings being treated as errors
> >
>
> This is really weird: cyttsp_i2c.h includes linux/i2c.h, it has
> dependency in Kconfig on I2C and CONFIG_I2C is present in the .config
> referenced above, so all the declarations should be there.

I usually ask Arnd about all kind of Kconfig business when
things get weird.

But could it be one of these awful things:

config TOUCHSCREEN_CYTTSP_I2C
        tristate "support I2C bus connection"
-        depends on TOUCHSCREEN_CYTTSP_CORE && I2C
+       depends on TOUCHSCREEN_CYTTSP_CORE && (I2C=3Dy ||
I2C=3DTOUCHSCREEN_CYTTSP_CORE)

Since I2C is tristate it could be a module and then this touchscreen
has to be a module too.

Yours,
Linus Walleij
