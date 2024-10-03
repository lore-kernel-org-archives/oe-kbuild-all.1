Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142C18858A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727965270; cv=none; b=AnH/SRixn1b8y/rATinq0A+ko7YOwZjzYvVnC31ZVrNHO6QsC+H5GKg9pyx4MLdSm6Rbcl8HK+NrBkJTrBkb5pqm5Xpe9zzY/nEn81msIVSne3QbO7fpUVZiwXhMmJQ1yCybcM6xtd/PsFbEA6PctrffCiLDUWXEdEew2V9+6Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727965270; c=relaxed/simple;
	bh=476ImO6OCFxdTzcjdPBg5DCCYjfCpnail5AkiuIHIiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vtlmwl0uGa0lxp0C0yo4LPIZGFV8dOmbDexhF4Skl7Sze+Ozue7pBnUnO3MoICodGN25GjYahfOSz7UDhdAup4PFXSBncDpo38cI53Z7LdPlXv2JCcKYjV4uNbgoD5DMoJ/q/Ya7eStIpTmN//4sJj5k+RacN92Rv4zIzboFDEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TlMWOYe/; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TlMWOYe/"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fac275471dso11161501fa.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 03 Oct 2024 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727965266; x=1728570066; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+PbIVzPmTFgo+wem8zP/ILMMROawRmR6s8VsxpDs5g=;
        b=TlMWOYe/0D/J1fc4+w8j144dyol9wX5UwW6VcF7HPcGfTtxCMCWJ5BzJrMj40Hg+eT
         Gt8D0EMNpZcyL80xmlcGDy3sSoBzCiUzu8IAJTgDGIjmdnFEia+Nvti1DIIDvahJsFx9
         ZgWYYfHiXVk4Mu44MysxaEoxbsVWRw7t/PW4qZTcywHtByM28JNidejgkoth3hZePil/
         VSpZkRg+8a0PLSOJ6RmNYXK0tbDFx1ZTOMkZaQdKqES4ipjyc95MoDy27vxOzQ37IPUH
         vEfkGSX+WT5A2D3swotMgz7jYk2KkHB12rHv2ryY+ZpdJ49s/JO7HRHrtYKHybgFgnmv
         HyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965266; x=1728570066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+PbIVzPmTFgo+wem8zP/ILMMROawRmR6s8VsxpDs5g=;
        b=mBy9nAIn4upI9371IL7DXF93vgZKA0FZXZjiumAoQYHX+ivZRgTHKacdk/+ngUrkZt
         fW9qtUTRNFGzKiF3ysBtkA7NC7eyFg4MM/DKdzZ047V2RW7i1iWoQa0KgDqOW8jpK6nw
         hGNWY9zo2kWS0jBYAJBPQ3c/LZ7d1B7G+tmJj/90wtN+CkBoqkUB9il3YX3DMORLlAMZ
         /BX+qunegYL+Jl3F8owwHRJKkvVwJza//RfqoZBjDiIccR+vGe1rmWVP5baRvwRXOr4T
         vNR8wWKnH19Nt/mLtQWOaH2Yc+s9XhFxtEnz9AdKViNBUcrGXqQGEt3Mty7E0WdyKqLE
         r0zg==
X-Forwarded-Encrypted: i=1; AJvYcCWJZlpMw4FcybqnsQIe5hnB6kQ0Zu8+/LujvYkank+amz+p20xxIKZyXgD91pUyxnTY20a00iH0knKo+5Bu@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp3CJ0qw/LBJfC1MLCT1WK7q0nqcRuevNFrDHPve1YE5lK6Cdl
	zxYESawjEFwxMMvH1xqrkfnUCrnGKJaX21unneVP5N74GGMkgWGSKgDEVQtbiO9B3UmDf9ILBV0
	UGmI9sq5rySZrJkAEmvNHVrovtvEyg0rvg/RTBw==
X-Google-Smtp-Source: AGHT+IE3TeGGZwQsdoDdBAe93x0WsfMkV6m4NMdQ1UVnCLUym3gG0AImGTyOg4Hvw8XHR/yI1atm6MbsKMmVLOEKeck=
X-Received: by 2002:a05:651c:1508:b0:2fa:d464:32d3 with SMTP id
 38308e7fff4ca-2faea267974mr11541841fa.20.1727965266490; Thu, 03 Oct 2024
 07:21:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410020735.aBI61ZYn-lkp@intel.com> <Zv0S3wXOzgmyFP3x@google.com>
 <CACRpkdZmKfNWF7ciHJMi4JU+_JnxjWD_kMhfxFOeydQ11Vyc4Q@mail.gmail.com> <Zv6EwdDybm_I0QSh@google.com>
In-Reply-To: <Zv6EwdDybm_I0QSh@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Oct 2024 16:20:54 +0200
Message-ID: <CACRpkdbtNdE2-dvSgfy+nwHommLUVxn7gjpS9pkvSABMupkh-w@mail.gmail.com>
Subject: Re: drivers/input/touchscreen/cyttsp_i2c.c:47:18: error: implicit
 declaration of function 'i2c_transfer'
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 1:49=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Wed, Oct 02, 2024 at 03:37:56PM +0200, Linus Walleij wrote:
> > On Wed, Oct 2, 2024 at 11:31=E2=80=AFAM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >
> > > >    drivers/input/touchscreen/cyttsp_i2c.c:118:26: warning: 'cyttsp_=
i2c_driver' defined but not used [-Wunused-variable]
> > > >      118 | static struct i2c_driver cyttsp_i2c_driver =3D {
> > > >          |                          ^~~~~~~~~~~~~~~~~
> > > >    cc1: some warnings being treated as errors
> > > >
> > >
> > > This is really weird: cyttsp_i2c.h includes linux/i2c.h, it has
> > > dependency in Kconfig on I2C and CONFIG_I2C is present in the .config
> > > referenced above, so all the declarations should be there.
> >
> > I usually ask Arnd about all kind of Kconfig business when
> > things get weird.
> >
> > But could it be one of these awful things:
> >
> > config TOUCHSCREEN_CYTTSP_I2C
> >         tristate "support I2C bus connection"
> > -        depends on TOUCHSCREEN_CYTTSP_CORE && I2C
> > +       depends on TOUCHSCREEN_CYTTSP_CORE && (I2C=3Dy ||
> > I2C=3DTOUCHSCREEN_CYTTSP_CORE)
> >
> > Since I2C is tristate it could be a module and then this touchscreen
> > has to be a module too.
>
> "depends" should handle this and force touchscreen be a module if I2C is
> a module. Also in the provided config I2C is built-in...

Hm yeah I'm lost too :/

Linus
