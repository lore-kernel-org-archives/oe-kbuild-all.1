Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6609804
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 09:14:34 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-75b14216386so445413485a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jun 2023 02:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685956473; x=1688548473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rE0xssBXcK9nZ+e8wfDpCxReNmG+e30YEh+xZMobuHQ=;
        b=PIAoC/LhkYM27nDo4SJJQNhcXu9rNI7W+He0InIiRvpP6PNh+TDH0z4fD881+7/isH
         KAAjqxuWkn3poO5jCFCS3L5KEZwcXXjiRoXVJ23LmiX2Yf1UljB1Eg5MmjqDHEbTwKRX
         bOhUFeBDWeIqMYjlM18TqumVEaAqWmgh3m1cYt0J3gnVtvDxw0z8LJF0Nhq7+eufHVWv
         B5i7i6eHHyzO5lsRKE1+ILa2n5IaCJW/Sk8vBAdk9v6hcljHeOrHSG7eLoPjelaFNmfb
         YQhfC6xgY/BZaoQKSGTR9bPxSwQqlHbE3hE9zpyX49DjOLUg3O9o+LbxJCCRqs+J96sD
         GUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685956473; x=1688548473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rE0xssBXcK9nZ+e8wfDpCxReNmG+e30YEh+xZMobuHQ=;
        b=F3UkaXeFJOtiq0utrIThBYsyjbK6/sXXCGHS0FTC4wMS40NMOBH+odImytlSnbAKjg
         AohdXevnXW7zC4bHf2N4tvbMWXZbAMrLYfums4XhvEeqFQ2cD/JDvNL9zBAnk9k/LJge
         JpQ/nlMePENZxmbY2Rp/PNdCy+8ZjLzouIzitO1edh4aoPh2W3xPoD3RUf9Y/o12Vj/t
         MSw+cQ8o457vO59Op4D4dVK9M6aZBYSs1hRKijtrHNX4iwfJ+62T1iRuqOHgPP4UA3S0
         6YY6jipqD9v7p7RhcTJ+KDLEtSJjQxn6LXNkw/P3Xy02DYWbhfytFpCOb49uVjoFnGgK
         c75g==
X-Gm-Message-State: AC+VfDz03pq8sqNu1Rct+TIHUgg5Z+nlVFKG/LKND2R+vIFsAYbnMfuL
	GBGrodxk3QJvi+gyDU9P9eHDKTByuD5ylC6kfeo=
X-Google-Smtp-Source: ACHHUZ44ZC3HtizNbif0Pd3vZlP2LsWIeHXWBfYc4IZjIR0M7aQKnZ0bfR9VTq7NXsjtd03zjdTQCpOVOBIRqPK97Yw=
X-Received: by 2002:a05:620a:8b87:b0:75b:23a0:e7a0 with SMTP id
 qx7-20020a05620a8b8700b0075b23a0e7a0mr18512831qkn.1.1685956473319; Mon, 05
 Jun 2023 02:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230605014850.9591-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230605014850.9591-1-jiasheng@iscas.ac.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Jun 2023 12:13:57 +0300
Message-ID: <CAHp75VdZct58EiLDL0ebCvcQBVMzuZxJZ8z=bs8D2UDaCsuo9A@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: Add missing check for platform_get_irq
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 5, 2023 at 4:49=E2=80=AFAM Jiasheng Jiang <jiasheng@iscas.ac.cn=
> wrote:
>
> Add the missing check for platform_get_irq() and return error code
> if it fails.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

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


--=20
With Best Regards,
Andy Shevchenko
