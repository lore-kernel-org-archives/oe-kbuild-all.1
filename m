Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E01118F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jan 2024 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq5aRHSH"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6810751e1fdso1408916d6.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 07 Jan 2024 11:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704656821; x=1705261621; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bgw6P5LZhwAlCIvVPfp2eYZqWEaTiqAWQo/dlHlVaXI=;
        b=Fq5aRHSHdbAHSHpEy6CmxC3c7IS7Y7d2CCBiQ0wOmP9phEWX2iBKVYWwY/XBkvU6JG
         EmhTNEZVmEnvG2mCSJtM1rnJZdyD1+RX3iVciy6l241LVocI0IkiuP48IdFn/zCqdPOf
         6IOaMuxtuwcmABEx+qMh8MQZcmTCQF57YNkCCBgTR2yQAPFlu6LSOMlWtxBprhM6c+W6
         +xLdAjuKErdxBR/eYiBun0D9apycyk/o6uTQYFsV6bEeCindq55RcCdTTyVkw26ad2Ja
         JtAv0fuJcn9uXoCFtzptUi2XIsnLA1ykF6XTNe3sdFf12ugrbgovyW4Xy5qEr37gc2Ic
         Rcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704656821; x=1705261621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bgw6P5LZhwAlCIvVPfp2eYZqWEaTiqAWQo/dlHlVaXI=;
        b=dFSTDpyuGLnFk9l+gVu2OoIspzhUX2QG579+YUjc0BnyNO1b+eBc4UESCx444BygIh
         M4H1WJPUK3qgqOYkNqOE1DUjEWOXF5BA1OFx2F6CCKU/mnBnQv0myYTAzzLm7bVEmPaM
         xG5KlMhdIz77TSe63UURMgAlCA4tZF3A/RQkL+GkYY/E/iC07MrwKs+R8NRd9I9AWntF
         XzBFAxxtv7UHOqq/ZTa9ZpbGBBZr75olVvIJAvq/UxFq1ToAlc4mj6ujlllv492nfv02
         RpwqvpA6cRY4QsfoV93ZiwwHKro8HaaJI7kCMUP6YPNIPVUafB25g0IZ3ZQVuUY4kify
         EFSg==
X-Gm-Message-State: AOJu0Yy0KaOlHgvgomxSE0CBG6RmMOCkw+DDGScKWc6jsA9jr34CVdyB
	wS0UwT9etMzgX8/mphvgBvJ9t/T6FzZ6T1nAbTY=
X-Google-Smtp-Source: AGHT+IGcTlPUiVIo4ImmPte03fF77QlSaouekvVBUc7VviYy4OCu8x8Y2c+1mJTb0YRoNxHun78P8T2uiOmCPPq6Uig=
X-Received: by 2002:a05:6214:2a8e:b0:67f:3991:ef38 with SMTP id
 jr14-20020a0562142a8e00b0067f3991ef38mr4009781qvb.122.1704656821115; Sun, 07
 Jan 2024 11:47:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401070901.68H00NFa-lkp@intel.com> <CAGb2v64zGvceVXy_F7pVTrFYY7-eLQktoWZB4Xcb1MQtFu=1Ww@mail.gmail.com>
In-Reply-To: <CAGb2v64zGvceVXy_F7pVTrFYY7-eLQktoWZB4Xcb1MQtFu=1Ww@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 7 Jan 2024 21:46:24 +0200
Message-ID: <CAHp75VfiTCCa+Rjn4JavxvSziNmjBTXEgUq-UT+PHkD8__5dhw@mail.gmail.com>
Subject: Re: drivers/iio/adc/axp20x_adc.c:572:26: sparse: sparse: dubious: x & !y
To: wens@csie.org
Cc: kernel test robot <lkp@intel.com>, Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 7, 2024 at 7:37=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:
> On Sun, Jan 7, 2024 at 9:30=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:

...

> > sparse warnings: (new ones prefixed by >>)
> > >> drivers/iio/adc/axp20x_adc.c:572:26: sparse: sparse: dubious: x & !y
> >    drivers/iio/adc/axp20x_adc.c:577:26: sparse: sparse: dubious: x & !y
>
> This looks like a false positive. The code is doing exactly what we want:
> val =3D val ? 1 : 0, but in a shorter format.

Yes, but the problem is that FIELD_PREP() is a macro.
You can replace these by ternary (here and in other cases) to satisfy
sparse. Compiler will optimize that anyway, so no branch is expected
in the generated code.

--=20
With Best Regards,
Andy Shevchenko
