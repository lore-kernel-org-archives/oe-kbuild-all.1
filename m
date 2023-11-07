Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA46D2F85F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2dZ3vyR"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7a93df91813so226495239f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 14:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699394546; x=1699999346; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9GMN59KG9vz4YUQQehaTwQYKj13ptJRqtnV+YMinhk=;
        b=b2dZ3vyRw/DvNr23B8gaF7w6cX4H9jGGhhwjeJXzQfCbBQ3o4WqH2Rkn/kSCJSBSiD
         fy6e6UpQEo1PWbZh4X5H3o01P/JvtI+BXAfcvmli19SCTIv3RANfcw/H1TMmTDOr8000
         1GL1DgYhKyWSFjpwaGDXHFNoIfUYFrzq1OrNdqcaCghZk6/BYIgI/s9jbyA6xUuNF8+F
         3cKzme0zGXkKuMT6PWc9reVhdVDgShIapfKVMWDbkxaobpq7Ieuwz5EcneePINLpT1oE
         ObR15eySlNg4Dl6GYIN3Unq2pX+Lg6z3Q6/wWYl2EcDT4t5XFXXFmcvKFbMoFwCgrzjA
         EP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699394546; x=1699999346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9GMN59KG9vz4YUQQehaTwQYKj13ptJRqtnV+YMinhk=;
        b=rtjv5PSWLN2m7S1u1pRd6Qh09SNDhiiDIaB/FoNraUvPhn4skx827L6VnUDO9lpnyl
         817JwkSx98myl64Y0nXzB5ZeHcvknL3upZjT4HtvBatfHJRjARTqSO6HElCuxd34Q0YG
         BDAX0kpnaa0RLpnEd9qCzsWav8C69dK3UrwAhArBPnUirozD2wGya5hR1s4daahU5NH0
         vhBImUGkpe0z5NKwLPzX/o24uw78yyty8SBMreLhJA9Ya96zj1138U35Bk+9koQw8ti6
         qgGEStQXRVEMZMfh66LIe40+NUwBfqriKjFQ8VpIckUS9Eo/gZJGPDKaupJy4aIpht1n
         fKAA==
X-Gm-Message-State: AOJu0YzCP+K2+joyTbaBSCkxA08RmsBY4SkCkPK2OXhrli9/4gvzLktM
	lyRzRxgD3p1C9Aq7tnboNNGF7kJXnj1zDwOcOcs=
X-Google-Smtp-Source: AGHT+IEXEJb5mp/ZFOCjoV7fb92ReUAqfJH6RHtIx7OQj90gjipcbZuQmyjA/E0uRMirYr3XKgvS/ti/YIQFA/QMwXc=
X-Received: by 2002:a5d:8c87:0:b0:7a9:a9c6:d6b2 with SMTP id
 g7-20020a5d8c87000000b007a9a9c6d6b2mr152870ion.16.1699394545675; Tue, 07 Nov
 2023 14:02:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311080014.GABRIG2T-lkp@intel.com>
In-Reply-To: <202311080014.GABRIG2T-lkp@intel.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 7 Nov 2023 14:02:14 -0800
Message-ID: <CAKEwX=OBONGNw0omoEVNW29akLJ7WgvTjiOBqF0Bq8xmB7gbaA@mail.gmail.com>
Subject: Re: mm/filemap.c:4249:1: sparse: sparse: Using plain integer as NULL pointer
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 8:30=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
> commit: cf264e1329fb0307e044f7675849f9f38b44c11a cachestat: implement cac=
hestat syscall
> date:   5 months ago
> config: s390-randconfig-r123-20231107 (https://download.01.org/0day-ci/ar=
chive/20231108/202311080014.GABRIG2T-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080014=
.GABRIG2T-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311080014.GABRIG2T-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    mm/filemap.c:1416:17: sparse: sparse: context imbalance in 'migration_=
entry_wait_on_locked' - unexpected unlock
> >> mm/filemap.c:4249:1: sparse: sparse: Using plain integer as NULL point=
er
> >> mm/filemap.c:4249:1: sparse: sparse: Using plain integer as NULL point=
er
> >> mm/filemap.c:4249:1: sparse: sparse: Using plain integer as NULL point=
er
> >> mm/filemap.c:4249:1: sparse: sparse: Using plain integer as NULL point=
er
>
> vim +4249 mm/filemap.c
>
>   4214
>   4215  /*
>   4216   * The cachestat(2) system call.
>   4217   *
>   4218   * cachestat() returns the page cache statistics of a file in the
>   4219   * bytes range specified by `off` and `len`: number of cached pag=
es,
>   4220   * number of dirty pages, number of pages marked for writeback,
>   4221   * number of evicted pages, and number of recently evicted pages.
>   4222   *
>   4223   * An evicted page is a page that is previously in the page cache
>   4224   * but has been evicted since. A page is recently evicted if its =
last
>   4225   * eviction was recent enough that its reentry to the cache would
>   4226   * indicate that it is actively being used by the system, and tha=
t
>   4227   * there is memory pressure on the system.
>   4228   *
>   4229   * `off` and `len` must be non-negative integers. If `len` > 0,
>   4230   * the queried range is [`off`, `off` + `len`]. If `len` =3D=3D 0=
,
>   4231   * we will query in the range from `off` to the end of the file.
>   4232   *
>   4233   * The `flags` argument is unused for now, but is included for fu=
ture
>   4234   * extensibility. User should pass 0 (i.e no flag specified).
>   4235   *
>   4236   * Currently, hugetlbfs is not supported.
>   4237   *
>   4238   * Because the status of a page can change after cachestat() chec=
ks it
>   4239   * but before it returns to the application, the returned values =
may
>   4240   * contain stale information.
>   4241   *
>   4242   * return values:
>   4243   *  zero        - success
>   4244   *  -EFAULT     - cstat or cstat_range points to an illegal addre=
ss
>   4245   *  -EINVAL     - invalid flags
>   4246   *  -EBADF      - invalid file descriptor
>   4247   *  -EOPNOTSUPP - file descriptor is of a hugetlbfs file
>   4248   */
> > 4249  SYSCALL_DEFINE4(cachestat, unsigned int, fd,
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is a known false positive with s390. See this thread:
https://lore.kernel.org/linux-mm/202305070840.X0G3ofjl-lkp@intel.com/
