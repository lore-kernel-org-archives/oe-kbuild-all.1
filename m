Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385A5321A4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 16:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qSRaD8Ht"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-672096e0e89so37354036d6.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 08:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699374878; x=1699979678; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w06lyDe6FRUqEZy0wKhzujIf+G9hzUJIKZxKL1OYVBE=;
        b=qSRaD8HtPnG9mFj8/xK4RZR7KlAM3yJ4BnHBuoYzhQ5v8BH3Z/naqx3TWWVQM7gyzO
         UGEdefGkwCzQl3bpmTFJgCll21LpIQp4FA6fxNoTzwER4X32I3VUWNNaSw2ZbiuJujhD
         5pnftPL5FqypHi6s7woCGylnGmgzhTormhUvGLiHDq4+w3qtVJtWpbOW0rxgltQvghhz
         BG6ycaRHDmCKnuL4aUKuFAJAG0uLhqa7Ru+yCaeEz4gtakyQG1CmA+qk0UZP+ZKm0E41
         mPvEN0PlEdRAiaVn89DzFWQMqX85zAGzYlTK72fE8nfKwyMTzNEwTyR1ibjCylaUy+sZ
         lRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699374878; x=1699979678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w06lyDe6FRUqEZy0wKhzujIf+G9hzUJIKZxKL1OYVBE=;
        b=ODjZimlfsfttb69Mzk5izalEVeCFS42aLkZjdQTtP8XWwPDGli/Tcq1JpkX5StYTAw
         AMxYrvOlGIxFvEmIpJ5mUv5Ttm6zXdJNXAbsmpxHP+nIMesoA64KurmqyAY4Vk0430VP
         6XkfhexIKEwjYrnhj03fofJBy90TP8FTbc7NXprd73QwLk+uVEkbayT4vpDH7q+10R70
         zZ+bBfObWWD6IpKzurGunQGO0WgNNp3y8paWRr7bvuIn++ENhy5Rkxe90e8zEpYEHcVS
         1meIYEJXTZR89KwO80f+evzK8FUbh2tBpipuOQMCXGwueORH3sn26NU6bqItmn+ZSuSU
         WTgw==
X-Gm-Message-State: AOJu0YwIheiPQgjguG9U6oBDVgxHtNKLyZM8Lplfr2fK4dRz/9vaw8M3
	vxEX4Kio9RYwU7Q+YoJaQCFrjvTTYUeIAzuFiK6Dng==
X-Google-Smtp-Source: AGHT+IFK0kWZ26eo1pcAnj94JOyclSPQI1IoZydFC0YpkOnGjdOwwfvZz8lU/TRnwBA8gFCRirwUDeY7VPaiK6/YRp0=
X-Received: by 2002:a05:6214:d06:b0:670:710f:203a with SMTP id
 6-20020a0562140d0600b00670710f203amr32230386qvh.59.1699374877902; Tue, 07 Nov
 2023 08:34:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310170708.fJzLlgDM-lkp@intel.com> <bd7fe929-c6fc-42be-9d2f-3f53ec21fd10@intel.com>
 <ZUkvOCxyiin_77qd@smile.fi.intel.com> <0a29df6b-bc27-43e9-a97d-57ecabb29a9e@intel.com>
In-Reply-To: <0a29df6b-bc27-43e9-a97d-57ecabb29a9e@intel.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 7 Nov 2023 17:33:56 +0100
Message-ID: <CAG_fn=VtA6e3oGm4WVnxmy9yMBab780-U_4VoHSqm4tcd2UTzQ@mail.gmail.com>
Subject: Re: [alobakin:pfcp 11/19] include/linux/bitmap.h:642:17: warning:
 array subscript [1, 1024] is outside array bounds of 'long unsigned int[1]'
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Yury Norov <yury.norov@gmail.com>, 
	Syed Nayyar Waris <syednwaris@gmail.com>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 2:23=E2=80=AFPM Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
>
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date: Mon, 6 Nov 2023 20:23:52 +0200
>
> > On Mon, Nov 06, 2023 at 05:31:34PM +0100, Alexander Lobakin wrote:
> >
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202310170708.fJzLlgDM=
-lkp@intel.com/
> >
> >> Not sure how to approach this :z It was also captured on the version y=
ou
> >> sent 2 weeks ago, so this could've been resolved already.
> >
> > Is it in the repository already? if so, we should revert it.
> > Otherwise you have time to think and fix.
>
> Nah, neither Alex' series nor mine. And I'd say this should rather be
> resolved in the functions Alex introduce.
>
> Thanks,
> Olek

Sorry, I couldn't reproduce the problem using the instructions at
https://download.01.org/0day-ci/archive/20231017/202310170708.fJzLlgDM-lkp@=
intel.com/reproduce
locally, maybe that's because I only have gcc-11 and higher.

But if I'm understanding correctly what's going on, then GCC will be
reporting the same issue in the following code:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
#include <stddef.h>
#include <stdbool.h>

#define BITS_PER_LONG 64
#define unlikely(x) x
#define UL(x) (x##UL)
#define GENMASK(h, l) \
        (((~UL(0)) - (UL(1) << (l)) + 1) & \
         (~UL(0) >> (BITS_PER_LONG - 1 - (h))))

#define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - =
1)))
#define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - =
1)))

inline void bitmap_write(unsigned long *map,
                                unsigned long value,
                                unsigned long start, unsigned long nbits)
{
        size_t index;
        unsigned long offset;
        unsigned long space;
        unsigned long mask;
        bool fit;

        if (unlikely(!nbits))
                return;

        mask =3D BITMAP_LAST_WORD_MASK(nbits);
        value &=3D mask;
        offset =3D start % BITS_PER_LONG;
        space =3D BITS_PER_LONG - offset;
        fit =3D space >=3D nbits;
        index =3D BIT_WORD(start);

        map[index] &=3D (fit ? (~(mask << offset)) :
~BITMAP_FIRST_WORD_MASK(start));
        map[index] |=3D value << offset;
        if (fit)
                return;

        map[index + 1] &=3D BITMAP_FIRST_WORD_MASK(start + nbits);
        map[index + 1] |=3D (value >> space);
}

unsigned long foo(unsigned int n) {
    unsigned long bm[1] =3D {0};
    bitmap_write(bm, 1, n, 2);
    return bm[0];
}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
(see also https://godbolt.org/z/GfGfYje53)

If so, the problem is not specific to GCC 9, trunk GCC also barks on this c=
ode:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
In function 'bitmap_write',
    inlined from 'bitmap_write' at <source>:15:13,
    inlined from 'foo' at <source>:47:7:
<source>:40:12: warning: array subscript 1 is outside array bounds of
'long unsigned int[1]' [-Warray-bounds=3D]
   40 |         map[index + 1] &=3D BITMAP_FIRST_WORD_MASK(start + nbits);
      |         ~~~^~~~~~~~~~~
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

If this is true for the code in drivers/gpio/gpio-pca953x.c,
suppressing the report for GCC 9 won't help for other versions.
Given that this report is isolated in a single file, we probably need
to give the compiler some hints about the range of values passed to
bitmap_write() rather than suppressing the optimizations.

--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
