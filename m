Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7D134BB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 09:21:33 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-75d50f25cc9so123271485a.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jun 2023 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685956892; x=1688548892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+IJZ8YoQCXr6cLHC0VkJnXD5EBJfWNAYm1Nc1zlsBI=;
        b=BTAYJMXUpakeg2wqR2PbJdrM4ec6OtJ5U/1HJr19o0pEUWQEIP4Tv9L7fzJ5J2Sudb
         9bwDPc3+2BUEiGIPhTG9l4ryfz25gJzpN6I2JMcki+0bbIlCk0S7oKheXY4islm/qE+O
         QBAOWXiLmNGgnSj+I65n1hkHspWeIm45BF4jnuud6bV5lnELybaYnAKFEc8NdPxy6p+c
         nofG8DkpV4DD1k6nt1VEkrDO1qARjqFGkelf+K+rcoQlUn54rqnVhaeoYXJdLy/hcxL+
         3izKcS1Ze8rlZs4xiVDKhvXCwLhS2bsGc6Sco54x1HD6qlrHlzkSTXXhanJbk7zAPhsW
         x+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685956892; x=1688548892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+IJZ8YoQCXr6cLHC0VkJnXD5EBJfWNAYm1Nc1zlsBI=;
        b=Py/4Arlr74Xzp5VnpqdFQD4sHtEjKP4+rwOQkJyYqw0BVsZyZI/K+iLQYpHbJEg6Ao
         DJXurPwMIRR6Ok+Wz0MiOiNYBVZzJ2DkjyTj1V+FtHTnNZjeQpc7pYjKUn7oeKjcusK4
         erS09wywzw9tjv9Pi2dA3OdWHfD87AW0515GbgeFUCRXndn2lyOARSiI/oeh7cP/0Ej6
         2BQvm/3Q8CGwhgw88sIP0ysP+2XoMLnJ+I9CqXiEAYs9Ouuy38l/7Z5puP0GYj3rcQvK
         D4TQOK7knFj+LWIMJtc0XTLYdwhNosfsiIxtOlmCBQo0leKd8Xu/wshwbInzZSDvDMrb
         SUeQ==
X-Gm-Message-State: AC+VfDx4Ha73UnWM+ozY95alJqISB72dyBM1pqn7crCYU4wcsM8ESq+s
	5hjRYpgWweBs+teRB5Q53R9Z7/53kJwqJVrSsI8=
X-Google-Smtp-Source: ACHHUZ5XhYNabc7t/Kamr9I4cIi8AJZ+CaRkBphgjejYHYhW/hMp4t/5rc+FdwjyETN6kk9ZiCkTConA+aceidP6icY=
X-Received: by 2002:a05:620a:46ac:b0:75b:23a1:8e64 with SMTP id
 bq44-20020a05620a46ac00b0075b23a18e64mr22218316qkb.53.1685956891974; Mon, 05
 Jun 2023 02:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230605015345.12801-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230605015345.12801-1-jiasheng@iscas.ac.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Jun 2023 12:20:56 +0300
Message-ID: <CAHp75VcCMf9B6Cf6PTKSxbhv7_eYVNrG7CFNXi2nN-tJ2AjdNQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: ath79: Add missing check for platform_get_irq
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 5, 2023 at 4:53=E2=80=AFAM Jiasheng Jiang <jiasheng@iscas.ac.cn=
> wrote:
>
> Add the missing check for platform_get_irq() and return error
> if it fails.

Here it seems better, but still needs an explanation why returning an
error is not a problem (assuming DT might have a wrong number). I.o.w.
you need to prove that with current code this fails in that case
further. Otherwise you will need to prove that there may not be DT
with a wrong number.

--=20
With Best Regards,
Andy Shevchenko
