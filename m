Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B84C804
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 09:16:30 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-75b14216386so445516685a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jun 2023 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685956589; x=1688548589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WHls5vQFZx80W/l+gbncXvHnqH5QXt3iJI8lxFm3PY=;
        b=RvdmEXVrXmbQI2SNhDHXQn58R9uc/X1bJV3eGNsZOms4wgvJjzHPAwHnCifgJk/xoM
         LxccJgt+FkYAnCYsOBD4ElnbsfKlVBLcOqM3T9f1xNJ0DuENh2wU6itfZd119Abb3CpB
         Ap95gJxWDBNNgCS6lauQkBG1eCBMUlS6LfD1wUYnzP3/YqKhJc0vo3iaXPmVhtTsWQW6
         4fMjFcnvT1Lx/CJMaztpeFfta4GYC1ThHuDr8ks+tRSJsezRFeGb/w2DChVFkIev976Q
         5imGwEfqpQBCv6Ws0dTkAlL2z46acaBHCM8pc+8oZHq6/iqaRcrs2ds7yT2rUANVJAnG
         5NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685956589; x=1688548589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WHls5vQFZx80W/l+gbncXvHnqH5QXt3iJI8lxFm3PY=;
        b=k+DFj0EAC2UY0lOANjPLKusNBTpOxRIRp1pWz18jUeboC5QDPk1fSynG/4oVkw+pAy
         V2jBkLlz4POSVM3O40MYn7cqiqQY1nUSn5tJtEb57R94yP64tsRo4Pz7/ZEiHdmSCbhy
         kumAA4sWVU8eWMCWgAwhIRkMpXjEpWBzyeVKzc3G9HdJz5wBb/KXrMSVnaklBOb1uc+5
         K6aFYd/uyKhVTjsk0Rc9qVuhEWuIleSbwaKgngO+wxWKuFLXwbeH3AE2VeMMMRDddNRb
         SktO3XxSvrtIyUbw2KGOGncB8OHnD7nA3ziqn+SV2ArXUb+jwOY0c67O1BZgg1R6DlVa
         3w5w==
X-Gm-Message-State: AC+VfDw15sd4mHl5avDDmTNlYF03GXru5hrPT/9REoitcIwYGDqYpdi0
	XtVjYFx9Qk7M0IIMoV6JOT/LQoD25kthnYfJQXQ=
X-Google-Smtp-Source: ACHHUZ5kXZxKvvxXL3/TR98yQ+T0PWRC6NTnlWLGlp/Hz0N7wSOgU/8gUGP9yTCgRo1kncIYrxzV9T5ydQn55sjCmKs=
X-Received: by 2002:a05:620a:2702:b0:75e:c23f:82ee with SMTP id
 b2-20020a05620a270200b0075ec23f82eemr452792qkp.64.1685956589268; Mon, 05 Jun
 2023 02:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230605014850.9591-1-jiasheng@iscas.ac.cn> <CAHp75VdZct58EiLDL0ebCvcQBVMzuZxJZ8z=bs8D2UDaCsuo9A@mail.gmail.com>
In-Reply-To: <CAHp75VdZct58EiLDL0ebCvcQBVMzuZxJZ8z=bs8D2UDaCsuo9A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Jun 2023 12:15:53 +0300
Message-ID: <CAHp75VcO2LRFyZV0nsmMsPRHByStyQ5AzeWSM9S99Qh60=UHvQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: Add missing check for platform_get_irq
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 5, 2023 at 12:13=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jun 5, 2023 at 4:49=E2=80=AFAM Jiasheng Jiang <jiasheng@iscas.ac.=
cn> wrote:
> >
> > Add the missing check for platform_get_irq() and return error code
> > if it fails.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Actually, the change is functional and now the wrong IRQ numbering in
the DT will fail the ->probe(). This needs an additional explanation
in the commit message why it's not a problem.

> > -       for (i =3D 0; i < ngpio; i++)
> > -               chip->irq_number[i] =3D platform_get_irq(pdev, i);
> > +       for (i =3D 0; i < ngpio; i++) {
> > +               ret =3D platform_get_irq(pdev, i);
> > +               if (ret < 0)
> > +                       return ret;
> > +               chip->irq_number[i] =3D ret;
> > +       }

--=20
With Best Regards,
Andy Shevchenko
