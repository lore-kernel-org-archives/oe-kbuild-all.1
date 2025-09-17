Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF252FCBF3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758132146; cv=none; b=MzwpheZzphz7hV90C/2VDZL3zaDGcngi7k+B3xMRi6/pmOlsHwQO07f40641H9PaTyp++9T8jSPz94cikri6Nm/hvkiAsVYKok/QmCzO/Kdr2aEi4bdcDKW33W0qQh7uwCsMijWx/+QRjxPkIYIAhZirutSpewYbJgWB3HxAOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758132146; c=relaxed/simple;
	bh=UXFAbdLkx06vhXtJ2G9AYBOhckkAb0k5X9bYRyiDHNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TlQQrHKcO8zhflGCABMXKRPptXNHpj52oOXzA40wZ+KkWPtj+kp9FHL2qUnb9yQPJOJHmM+3M5LVCkLNB8b+XwlYLfcXSJn3vNIxURq+J+DkvoA0ly7QTTdWQhA0s2j3ZoRtXU3QQj/+qqrn/jHG/ldcasXYbkkCChLiGR3SGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=L8ffyIDJ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="L8ffyIDJ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4c1fc383eeso60676a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758132144; x=1758736944; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1onfRQv25gQoZTEI++MVbVbx4XYqJDW3+flsFFULcl0=;
        b=L8ffyIDJc4fWP3RIWZj3UyBZM668yWsseY56xTGz8Q0jd9BVPVmVxykg1lHJk++0Pu
         ttEob+7/yN1YX8DZSY2AwU0V9CzOWT6O0cIkT+NWYkOCEDjW4IuItD3sXerdMQYA5hHb
         FBB8DyYTrYCe0I5XcIhJViEdugpIOAg6IQBB7w9B0SCX7ZpLIZDLXm0Hg0/KzVdvSOLa
         6YHnn2bz1mV2UkRLLgDvj5/pQzz2knhXLP08YmmXSHH5Oo5ZSSmO+oHXViM4umCnlg9b
         /idkkAcIpJx+2acyNyj4wH939T3A1rjfO2UHP6IPhuwCRpfm3wR44eXTPMs8nKoD0C5M
         ZiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758132144; x=1758736944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1onfRQv25gQoZTEI++MVbVbx4XYqJDW3+flsFFULcl0=;
        b=OMQvJCVjrLqkqIViL6Mmy1aW4/XIGOmQGeveKc3ZeKesB/84WepWtqEO4QgdqeqU72
         7GPo9Gismuc9978q5RpIKffE0z+tKifhKjx9/kQX3VOdDeyaxAGj/N3xQ0Vw082rkXth
         tIvgeowbh+YIjjP91KEGTTm1Sd98HTWlZNkwR4nThUjwAQIGWYGT6RLl937oXSOvHFqC
         MG1BPaJMvosWPj9REU5w7X/MZLWiiQDqlN47aM1AQ0d9MsUCb2T2DLMxaf4TFPjTaNFi
         Opk9MR49lGgiiapCKgxLr649izYoUObjiCTmmH9xvJJFIYnOnBZu20rLyk6JdAn3NL9O
         /w3Q==
X-Gm-Message-State: AOJu0YxHm0EHEPt3lt8pkjxKPYQBlHJCa/4LpgCdh5+ut9K2KFz6uaB2
	gdI4DwHWRMM5XCokZc5mcQhoBnqEOXEWrOUkALsOk+chDWYi6FW0RcjnjcMgpH9759S9GYwgGma
	qDZV6/kGUvXqfUiC8OM5oOKPDZ8zc9AWu78gua7W/hhc1Ay/pjpMjXA==
X-Gm-Gg: ASbGncvUP8YjS+UAtcZ+7iMDW/DzyJgx78TFgywHu6CqYxt9tpuDi6hsGccIde0LZbt
	FE1iGXedPzOyVL6cDQMhNIqJxGoGahVB5mqumR3w9d6pTdIOUkl6+jfpLMhwvI2xMJiZ6B6aosC
	s9YUD33jcd9C38ZQjzohELSyaYKT2IlUpwcCShlAzypsrFHlNDtpH9fjnR1bf+haB5WQo8iRdfA
	tmAUZ8=
X-Google-Smtp-Source: AGHT+IH3FzNaRMr6v5HHYKxl6FL79CtPc6dSPmg86pYGY7CWig6xwjAHpbOHtWyEHP67xuH9CqUutSk6OOULuCW5dwE=
X-Received: by 2002:a17:90b:5610:b0:32e:2c90:99a with SMTP id
 98e67ed59e1d1-32ee3f7b2acmr3843173a91.35.1758132143486; Wed, 17 Sep 2025
 11:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509172014.2AWygxKf-lkp@intel.com>
In-Reply-To: <202509172014.2AWygxKf-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Sep 2025 14:02:11 -0400
X-Gm-Features: AS18NWA_y3uwajqyKaoXNoJdoLEqgja1icWNH35vSaHJkBjag0qIhDHgW_Z-m44
Message-ID: <CAHC9VhS+8t_ZhKCmj62+HK8c9pFUF+5MyerykxPR+hvRZz7z-A@mail.gmail.com>
Subject: Re: [pcmoore-lsm:working-lsm_init_rework 9/41] security/lsm_init.c:400:25:
 sparse: sparse: cast removes address space '__rcu' of expression
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>, 
	John Johansen <john.johansen@canonical.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 9:00=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git w=
orking-lsm_init_rework
> head:   8ea7358ca612bb85eef9179ae746edeb5f1dc9ac
> commit: 9cb4dac58e465101fea4aa4f9169f1ea04149da8 [9/41] lsm: split the in=
it code out into lsm_init.c
> config: nios2-randconfig-r133-20250917 (https://download.01.org/0day-ci/a=
rchive/20250917/202509172014.2AWygxKf-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250917/202509172014.2AWygxKf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509172014.2AWygxKf-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> security/lsm_init.c:400:25: sparse: sparse: cast removes address space=
 '__rcu' of expression
>
> vim +/__rcu +400 security/lsm_init.c
>
>    348
>    349  static void __init ordered_lsm_init(void)
>    350  {
>    351          struct lsm_info **lsm;
>    352
>    353          if (chosen_lsm_order) {
>    354                  if (chosen_major_lsm) {
>    355                          pr_warn("security=3D%s is ignored because=
 it is superseded by lsm=3D%s\n",
>    356                                  chosen_major_lsm, chosen_lsm_orde=
r);
>    357                          chosen_major_lsm =3D NULL;
>    358                  }
>    359                  ordered_lsm_parse(chosen_lsm_order, "cmdline");
>    360          } else
>    361                  ordered_lsm_parse(builtin_lsm_order, "builtin");
>    362
>    363          for (lsm =3D ordered_lsms; *lsm; lsm++)
>    364                  prepare_lsm(*lsm);
>    365
>    366          report_lsm_order();
>    367
>    368          init_debug("cred blob size       =3D %d\n", blob_sizes.lb=
s_cred);
>    369          init_debug("file blob size       =3D %d\n", blob_sizes.lb=
s_file);
>    370          init_debug("ib blob size         =3D %d\n", blob_sizes.lb=
s_ib);
>    371          init_debug("inode blob size      =3D %d\n", blob_sizes.lb=
s_inode);
>    372          init_debug("ipc blob size        =3D %d\n", blob_sizes.lb=
s_ipc);
>    373  #ifdef CONFIG_KEYS
>    374          init_debug("key blob size        =3D %d\n", blob_sizes.lb=
s_key);
>    375  #endif /* CONFIG_KEYS */
>    376          init_debug("msg_msg blob size    =3D %d\n", blob_sizes.lb=
s_msg_msg);
>    377          init_debug("sock blob size       =3D %d\n", blob_sizes.lb=
s_sock);
>    378          init_debug("superblock blob size =3D %d\n", blob_sizes.lb=
s_superblock);
>    379          init_debug("perf event blob size =3D %d\n", blob_sizes.lb=
s_perf_event);
>    380          init_debug("task blob size       =3D %d\n", blob_sizes.lb=
s_task);
>    381          init_debug("tun device blob size =3D %d\n", blob_sizes.lb=
s_tun_dev);
>    382          init_debug("xattr slots          =3D %d\n", blob_sizes.lb=
s_xattr_count);
>    383          init_debug("bdev blob size       =3D %d\n", blob_sizes.lb=
s_bdev);
>    384          init_debug("bpf map blob size    =3D %d\n", blob_sizes.lb=
s_bpf_map);
>    385          init_debug("bpf prog blob size   =3D %d\n", blob_sizes.lb=
s_bpf_prog);
>    386          init_debug("bpf token blob size  =3D %d\n", blob_sizes.lb=
s_bpf_token);
>    387
>    388          /*
>    389           * Create any kmem_caches needed for blobs
>    390           */
>    391          if (blob_sizes.lbs_file)
>    392                  lsm_file_cache =3D kmem_cache_create("lsm_file_ca=
che",
>    393                                                     blob_sizes.lbs=
_file, 0,
>    394                                                     SLAB_PANIC, NU=
LL);
>    395          if (blob_sizes.lbs_inode)
>    396                  lsm_inode_cache =3D kmem_cache_create("lsm_inode_=
cache",
>    397                                                      blob_sizes.lb=
s_inode, 0,
>    398                                                      SLAB_PANIC, N=
ULL);
>    399
>  > 400          lsm_early_cred((struct cred *) current->cred);
>    401          lsm_early_task(current);
>    402          for (lsm =3D ordered_lsms; *lsm; lsm++)
>    403                  initialize_lsm(*lsm);
>    404  }
>    405
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Fixed in the lsm/working-lsm_init_rework branch in case anyone wants
to take a look.  However, as the fix really doesn't have anything to
do with the IMA/EVM patch, I'll wait to repost the patchset until Mimi
has a chance to look at the IMA/EVM patch from Roberto.

--=20
paul-moore.com
