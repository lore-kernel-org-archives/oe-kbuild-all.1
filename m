Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DFE19F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 09:06:38 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-583d63ca1e9so29375357b3.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 02:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690275997; x=1690880797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ke/nyKRStFvVZneO5nE6RIQDFpH9Z/vnZAMFeZPsEiA=;
        b=U6eKxjaQ9wecWoT4pNTlh8Ilk0YItY0iVFywSI9XuKhWd/6Geq38I4ygqJjEyiLLZ4
         ceifiQoCjuPNqUGYChFbDt+26gcW7UUchQpMcHPkIvr97HOdu2wm5FclSE2ZNQnhrZUZ
         0f4bHv+odNKpsqKtvU7IsnG1H/XE2FMLTLTkkRZkt9KTwMZtFEM8NQIwggtqDIFov2Ya
         1GkARnCt9u1TU4k3Be1vsBGckJogwsG7iSp3rg9TTb7RrZF1PegAKtLiuE4tfBk1/NWQ
         y4GyTkbAg+Ffhavy48xu+s6Z3DyCRYwL9RvRJLjNVhHRwC/zfegeXzx82CClAZPBESg/
         vC2w==
X-Gm-Message-State: ABy/qLbiq/wUr2eq1J9E9FSKSr1lFScbeQoNNYflC6KMRSYcZA+QH4Sq
	tERMYizMbTZvovub1CZrxedO/xAfPA2gxQ==
X-Google-Smtp-Source: APBJJlG/OD8z0yzu/JXhhWRslNAPkvj6oVK3QnEYpFg5igCOS28v1dubcrckrCsj6eFESSzx+7ioxg==
X-Received: by 2002:a0d:ca16:0:b0:583:1bc7:8754 with SMTP id m22-20020a0dca16000000b005831bc78754mr9012931ywd.33.1690275997301;
        Tue, 25 Jul 2023 02:06:37 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id n124-20020a817282000000b00573898fb12bsm1077176ywc.82.2023.07.25.02.06.36
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 02:06:36 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-cf284f4d7afso5867449276.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 02:06:36 -0700 (PDT)
X-Received: by 2002:a25:d06:0:b0:d0d:65cf:bcdd with SMTP id
 6-20020a250d06000000b00d0d65cfbcddmr5201669ybn.51.1690275996395; Tue, 25 Jul
 2023 02:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307251518.4JYwdU5r-lkp@intel.com>
In-Reply-To: <202307251518.4JYwdU5r-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jul 2023 11:06:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj=FLmkazPbYKPevDrcym2_HDb_U7Mb9YE9ovrP0jJfA@mail.gmail.com>
Message-ID: <CAMuHMdWj=FLmkazPbYKPevDrcym2_HDb_U7Mb9YE9ovrP0jJfA@mail.gmail.com>
Subject: Re: drivers/base/regmap/regcache-maple.c:114:23: warning:
 'upper_index' is used uninitialized
To: kernel test robot <lkp@intel.com>
Cc: Mark Brown <broonie@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robot,

On Tue, Jul 25, 2023 at 10:17=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   0b5547c51827e053cc754db47d3ec3e6c2c451d2
> commit: f033c26de5a5734625d2dd1dc196745fae186f1b regmap: Add maple tree b=
ased register cache
> date:   4 months ago
> config: arc-randconfig-r001-20230725 (https://download.01.org/0day-ci/arc=
hive/20230725/202307251518.4JYwdU5r-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251518=
.4JYwdU5r-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307251518.4JYwdU5r-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/base/regmap/regcache-maple.c: In function 'regcache_maple_drop=
':
> >> drivers/base/regmap/regcache-maple.c:114:23: warning: 'upper_index' is=
 used uninitialized [-Wuninitialized]
>      114 |         unsigned long upper_index, upper_last;
>          |                       ^~~~~~~~~~~
> >> drivers/base/regmap/regcache-maple.c:114:36: warning: 'upper_last' is =
used uninitialized [-Wuninitialized]
>      114 |         unsigned long upper_index, upper_last;
>          |                                    ^~~~~~~~~~
>    drivers/base/regmap/regcache-maple.c:113:23: warning: 'lower_index' is=
 used uninitialized [-Wuninitialized]
>      113 |         unsigned long lower_index, lower_last;
>          |                       ^~~~~~~~~~~
>    drivers/base/regmap/regcache-maple.c:113:36: warning: 'lower_last' is =
used uninitialized [-Wuninitialized]
>      113 |         unsigned long lower_index, lower_last;
>          |                                    ^~~~~~~~~~

These are false positives...

>
>
> vim +/upper_index +114 drivers/base/regmap/regcache-maple.c
>
>    106
>    107  static int regcache_maple_drop(struct regmap *map, unsigned int m=
in,
>    108                                 unsigned int max)
>    109  {
>    110          struct maple_tree *mt =3D map->cache;
>    111          MA_STATE(mas, mt, min, max);
>    112          unsigned long *entry, *lower, *upper;
>    113          unsigned long lower_index, lower_last;
>  > 114          unsigned long upper_index, upper_last;
>    115          int ret;
>    116
>    117          lower =3D NULL;
>    118          upper =3D NULL;
>    119
>    120          mas_lock(&mas);
>    121
>    122          mas_for_each(&mas, entry, max) {
>    123                  /*
>    124                   * This is safe because the regmap lock means the
>    125                   * Maple lock is redundant, but we need to take i=
t due
>    126                   * to lockdep asserts in the maple tree code.
>    127                   */
>    128                  mas_unlock(&mas);
>    129
>    130                  /* Do we need to save any of this entry? */
>    131                  if (mas.index < min) {
>    132                          lower_index =3D mas.index;
>    133                          lower_last =3D min -1;
>    134
>    135                          lower =3D kmemdup(entry, ((min - mas.inde=
x) *
>    136                                                  sizeof(unsigned l=
ong)),
>    137                                          GFP_KERNEL);

 lower{,_index,_last} and ...

>    138                          if (!lower) {
>    139                                  ret =3D -ENOMEM;
>    140                                  goto out;
>    141                          }
>    142                  }
>    143
>    144                  if (mas.last > max) {
>    145                          upper_index =3D max + 1;
>    146                          upper_last =3D mas.last;
>    147
>    148                          upper =3D kmemdup(&entry[max + 1],
>    149                                          ((mas.last - max) *
>    150                                           sizeof(unsigned long)),
>    151                                          GFP_KERNEL);

upper{,_index,_last} are always initialized together, ...

>    152                          if (!upper) {
>    153                                  ret =3D -ENOMEM;
>    154                                  goto out;
>    155                          }
>    156                  }
>    157
>    158                  kfree(entry);
>    159                  mas_lock(&mas);
>    160                  mas_erase(&mas);
>    161
>    162                  /* Insert new nodes with the saved data */
>    163                  if (lower) {

but these gatekeepers...

>    164                          mas_set_range(&mas, lower_index, lower_la=
st);
>    165                          ret =3D mas_store_gfp(&mas, lower, GFP_KE=
RNEL);
>    166                          if (ret !=3D 0)
>    167                                  goto out;
>    168                          lower =3D NULL;
>    169                  }
>    170
>    171                  if (upper) {

check only one of them (which are preinitialized at lines 117/118).

>    172                          mas_set_range(&mas, upper_index, upper_la=
st);
>    173                          ret =3D mas_store_gfp(&mas, upper, GFP_KE=
RNEL);
>    174                          if (ret !=3D 0)
>    175                                  goto out;
>    176                          upper =3D NULL;
>    177                  }
>    178          }
>    179
>    180  out:
>    181          mas_unlock(&mas);
>    182          kfree(lower);
>    183          kfree(upper);
>    184
>    185          return ret;
>    186  }
>    187

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
