Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD135B39
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 14:22:53 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-784f7f7deddso431897241.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686666173; x=1689258173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gWIF6WfXGGLV7wV95q+Bs7ONpfkMQ74yIFAAdWgckU=;
        b=a/BBVjmaMQ4W6Uh57UzU2yX7l6o8M8VmaUrobFylrp2Lj1e8Zk4i1JsD2rhJGFOGj7
         LxDaeAiMscWxru8mlDYV+lxikYRK9FwFcFn8f+TTir+jo+Qie32VNdKSUx8pDD+ZKUb8
         dN9/VheT2T5upyliDSFeUcOABFpv242h0NutbQBIyyfuyYPSvqSpQgxvPcMU6lWLbkL9
         gBJ9VH0NT1H8dBe5UP+rm7EakoA5vVCJ1Xf5GshvGP3rnuzEPcWtoKxMkwvpNOtmvYMR
         oosmUI7srWEIx77rEfNqbHTwIl6ltzIjWmI1kK4Yj7PZAgT01zkcszpmUt76ZeuVqzr7
         qY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686666173; x=1689258173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gWIF6WfXGGLV7wV95q+Bs7ONpfkMQ74yIFAAdWgckU=;
        b=TZ2Mq3n5dWG2kiVPUov7/xTELVNkZWlWjdXItjE4iokXkt7ruiZcHhFTuJQn+rZrEg
         dR8cnKOq+fSsUQiXFJuhdvA4dzE9TQnEtocz66ENmVrg687qc5m7qIS9pVuLhhd7xYhr
         1fSTO30NQUbL1rFVSSRbxSwG2oupRQFgN1xPs0Z0YxudXKK/nGNk/5gfbHpwPs2oLNWU
         L4Jv3bUmZWETKtizRsIhb8h5NUFCWQUabTIjZ/NmJHyXJivQ/z7BNRUmnHqNJlLdF5fZ
         mXS/ka9geLFBUxZ0oZfDSzqJv8A9o8u5xPWRa6TUCKZcLCNlTNm+xnE9B0WuoGAtWfwT
         ebzw==
X-Gm-Message-State: AC+VfDzDbMCbrYlgt83dMIxfH3mkV9BPZxfVR8aUmyCkHg9d3wC82l1M
	g2bggfKcX88kEjQeUdWfmFe6tMCc5I4ub7utl9v+JQ==
X-Google-Smtp-Source: ACHHUZ5vP+V+IYfx+6K3RQdpyB8TtZRAxKeKOoDh1dO34vqqR5jmKqETRZ2YfFdpKic4CFmIUYOgjxbDQldWhsZkLD8=
X-Received: by 2002:a05:6102:408:b0:430:e0:ac2e with SMTP id
 d8-20020a056102040800b0043000e0ac2emr5618052vsq.15.1686666172953; Tue, 13 Jun
 2023 07:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230606031159.38246-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230606031159.38246-1-jiasheng@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Jun 2023 16:22:42 +0200
Message-ID: <CAMRc=McoDu4jsy4pWnu=T1+q_FfnYa8bfqWb39ZZXM_YmaGpXw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: Add missing check for platform_get_irq
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: andy.shevchenko@gmail.com, oe-kbuild-all@lists.linux.dev, 
	linus.walleij@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 5:12=E2=80=AFAM Jiasheng Jiang <jiasheng@iscas.ac.cn=
> wrote:
>
> Add the missing check for platform_get_irq() and return error code
> if it fails.
> The returned error code will be dealed with in
> builtin_platform_driver(sifive_gpio_driver) and the driver will not
> be registered.
>
> Fixes: f52d6d8b43e5 ("gpio: sifive: To get gpio irq offset from device tr=
ee data")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
>
> v2 -> v3:
>
> 1. Check before assigning values.
>
> v1 -> v2:
>
> 1. Return "girq->parents[0]" instead of "-ENODEV".
> ---
>  drivers/gpio/gpio-sifive.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 98939cd4a71e..745e5f67254e 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -221,8 +221,12 @@ static int sifive_gpio_probe(struct platform_device =
*pdev)
>                 return -ENODEV;
>         }
>
> -       for (i =3D 0; i < ngpio; i++)
> -               chip->irq_number[i] =3D platform_get_irq(pdev, i);
> +       for (i =3D 0; i < ngpio; i++) {
> +               ret =3D platform_get_irq(pdev, i);
> +               if (ret < 0)
> +                       return ret;
> +               chip->irq_number[i] =3D ret;
> +       }
>
>         ret =3D bgpio_init(&chip->gc, dev, 4,
>                          chip->base + SIFIVE_GPIO_INPUT_VAL,
> --
> 2.25.1
>

Applied, thanks!

Bart
