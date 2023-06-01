Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788A523DF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 20:21:19 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-62613b2c8b7so12774746d6.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Jun 2023 13:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685650878; x=1688242878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/NSeCOlTDExo4zcaSAqJrFjHD08QpEBcHkkE7zzxDQ=;
        b=SorOR2XOiQjrKzC5bhxHX+nqnc4dr6TlCm/pwq9bzgNx2blML/gFUZviTGv11U3kVu
         K4hJmG7yaZ/KjutZyHaJLkC85NccnPRayMsNMXrjy98HfVWvhKYOMCv9oGxci1/94KeI
         JXDueucFnCKdNsOVrEpmorKhKIJvC+9UtI9Ii1fIK5P9/npVYQiKgpv791cp8evHqObp
         DuCYbFQvTgUylTlUinDXwFcvJES8rC2B2nTE+y1rOp95O5crqTj4SPxY/wCvbslTmPeJ
         8MpWNiPTCeo7OQPzgmj7kfLLnDw3k4Hswdo73l68FmlHICHC7pRcTv9F3jm3CUqoDHkN
         S5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685650878; x=1688242878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/NSeCOlTDExo4zcaSAqJrFjHD08QpEBcHkkE7zzxDQ=;
        b=eo8afH3e+SjOAN5Eep6D7/0SW5OjhDB3pIwH240/STkmGPpco4uYnNDrfsGgSFnKnn
         J+vcb/Uv47E6imthyJTBNfSz/WKy32KwC9DiCf1m3Bj+TllGTLmY6rMaoJI5QBrgfWRR
         /FhnNBcQW/TIRIBDNZbYBkrwF1VBctEH/F8XARna1BDxRMtx/uQF1MOQCh6se8IlqvA4
         HrVXBOHhGyu3VnL7LIoBcprXNGHyOLhubEkEkA6avxVJm3Fv3dJFPks28n661+VmU162
         gEcjzMy8IgerT+a6o6tPsHu0c0g12QUrS+Uj+Op+8E96HlPEVuapzeD0OaqV5HpKq/hA
         7WjA==
X-Gm-Message-State: AC+VfDwEutppKe99bBisEJicc6U/5YvkHWJAT8SI1gXgrbt3ZPbwwKXt
	3eHmiHyDVD+yAeBszAmXhXQCfr0lsEFblu4J+OBlpA==
X-Google-Smtp-Source: ACHHUZ7f7n3S8qrpy3XzePkS7Ff+dUptThKF5cmS4t5oOS2RXdJhWOKhEoltevZqB3H5j+4urRuTK+GYD3EV3Q1439A=
X-Received: by 2002:a05:6214:1310:b0:626:1b8f:4940 with SMTP id
 pn16-20020a056214131000b006261b8f4940mr13380674qvb.23.1685650878100; Thu, 01
 Jun 2023 13:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306011435.2BxsHFUE-lkp@intel.com> <20230601131949.e6ff7f41ac3fec6875b16e8c@linux-foundation.org>
In-Reply-To: <20230601131949.e6ff7f41ac3fec6875b16e8c@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 1 Jun 2023 13:21:07 -0700
Message-ID: <CAKwvOd=eefnzgvgaihuuE_ii9VP8MWQ=XdOkWY8mJvzYxs4+JQ@mail.gmail.com>
Subject: Re: [linux-next:master 5938/6538] mm/zswap.c:1183:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is true
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Nhat Pham <nphamcs@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 1:19=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Thu, 1 Jun 2023 14:29:13 +0800 kernel test robot <lkp@intel.com> wrote=
:
>
> >            if (objcg && !obj_cgroup_may_zswap(objcg))
> >                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    mm/zswap.c:1327:9: note: uninitialized use occurs here
> >            return ret;
> >                   ^~~
> >    mm/zswap.c:1183:2: note: remove the 'if' if its condition is always =
false
> >            if (objcg && !obj_cgroup_may_zswap(objcg))
> >            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    mm/zswap.c:1158:9: note: initialize the variable 'ret' to silence th=
is warning
> >            int ret;
> >                   ^
>
> Thanks.  I did the below.  Maybe ENOMEM would be more appropriate...

https://lore.kernel.org/llvm/20230601-zswap-cgroup-wsometimes-uninitialized=
-v2-1-84912684ac35@kernel.org/

>
> --- a/mm/zswap.c~zswap-do-not-shrink-if-cgroup-may-not-zswap-fix
> +++ a/mm/zswap.c
> @@ -1180,8 +1180,10 @@ static int zswap_frontswap_store(unsigne
>          * local cgroup limits.
>          */
>         objcg =3D get_obj_cgroup_from_page(page);
> -       if (objcg && !obj_cgroup_may_zswap(objcg))
> +       if (objcg && !obj_cgroup_may_zswap(objcg)) {
> +               ret =3D -ENOSPC;
>                 goto reject;
> +       }
>
>         /* reclaim space if needed */
>         if (zswap_is_full()) {
> _
>
>


--=20
Thanks,
~Nick Desaulniers
