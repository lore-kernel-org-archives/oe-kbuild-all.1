Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA683FB1B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735465183; cv=none; b=dd9b3w9BcBS+JRnApHgr3l9ym1gtHSmVqAbhPK8+97vZ67iRBuGbwiSw//m6OzWXqhIjI45LiWvGg1ZyQkd2XWbbQThD7YH3RbqrPskVXrp4y/ZmlEAst4pypBFwDdyl/12Jxcw01yco97aq2lcATeqr/JZJQ1KWGeOIbBWuQ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735465183; c=relaxed/simple;
	bh=m8LxhO9WAInf/aI+G2NA0DTO7a5I5/LDBZQet65PiIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUlNW2/5Jfi8OCuR/rmiYXI64m+3NikavRlcuE0StJ8Ayj+eoLYOu2DtMC0Mb6Paw4Zy4QTZWbjUXWmrPl0N1zWc1W62sQB+zjyFleq+5q03NntEleHqC2yVOxsV396o3oBncmgP/4SIhcRrLJdl/8I5PgB1UQ+QKgwZiMoP+Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTP4jeWR; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTP4jeWR"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so9063973e87.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 01:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735465179; x=1736069979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ByclJej6tiTkFqfwf3E6bBwACXyMUPlUOXu0en/5xs=;
        b=hTP4jeWRBn61O7SnOXe/9fbI5gFw18nwvgcI3HKyhPqw4d/nHJ2ODgsUGhDH5yz2zq
         074x33VXZQSMlvtI5u5lMrpqnPiVW15P7e7gB0J7FniwX6Do4M32wCjxUZNj7pGVBEAA
         tB8WY1ztR77R5DorKOZmvyTWEZrzV0+shRX1C/FlZacnYzBkXZf4hwZMXARZhR5+2XsS
         eQSVegaXvYxZBYQwuj0vjPLY03aSzCNqIf+239nD840ujLj2422U04TDIxnLgzya4I8a
         8fVBpQSOYabY9SL9QcvwNQbOjRQ8GCwehFtpjSMt+C1aI55cdZXOicPQphleHNMtltro
         KIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735465179; x=1736069979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ByclJej6tiTkFqfwf3E6bBwACXyMUPlUOXu0en/5xs=;
        b=hbGkID7YuSRMqz5QRaJRvZQRX064qkmC94P8ags4G21FLShnxxbsa8PJIvm2edl0Fb
         EXXXO/CH5ULRlvChmpk3Oykpsa3zX17QcF0VWwbRliqLxfVvlEuw9OLHyPMqMEhNqXFJ
         0Njc3y1O6c3HGjJ8ByDuQWAki72KemPgqhLkLRE7HsKy+ewnQw6cymR/NW4Z/I9HkHDp
         Esq0JPqGBhLBr6r/sPGd9XBzqxglVSLfqiIk+J6k9GO9TzZG8nsf9kT41K1Dnzv/3TJp
         NFVZ06mzAslshLkLzvBOTnBWi4UaqtcBcMoMheRvB8X1GwAkurGfl+mTLXH0EQkFeueo
         7g8Q==
X-Gm-Message-State: AOJu0YykBHfiRNF2Zog5uU/dPyOgxioflzRZcZFZDaEdPf4XpBTB/CCU
	adSPlmtOR49/NuG1lgIW3dICeF2A73PAN2iZnY6ozYbN0yma179uEU6pdGASMuIg8At5zwnVvR0
	m/45FhbGtyDmsxdiIUv6LRG36wSw=
X-Gm-Gg: ASbGncvUmD9+Fp11w/2J0HhBrWCpIN9jE2hQRkIQS+67Ew24F1U2fS80D4nzAHdMiSZ
	1tn8o4gy8zsWyUZ8yHxRP3YWXOEU9YKTHVejZGg==
X-Google-Smtp-Source: AGHT+IFsjhnymwQbGvN+OYy63Em+Rfsjv2d1+Sgi6DWnNjon3HrRVstGD8dUioYipOlEy7mKzZDzuUw1qFSbZ3zcuSY=
X-Received: by 2002:a05:6512:2288:b0:542:2999:2f1a with SMTP id
 2adb3069b0e04-54229992f31mr10063927e87.6.1735465179246; Sun, 29 Dec 2024
 01:39:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412290924.UTP7GH2Z-lkp@intel.com>
In-Reply-To: <202412290924.UTP7GH2Z-lkp@intel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 29 Dec 2024 17:39:22 +0800
Message-ID: <CAMgjq7DvR2uXi+nMenAFSttrnbeZotM_8V+AgfSzWbJjo6g=qw@mail.gmail.com>
Subject: Re: mm/list_lru.c:514:3-8: WARNING: NULL check before some freeing
 functions is not needed.
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2024 at 10:00=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
> commit: 28e98022b31efdb8f1ba310d938cd9b97ededfe4 mm/list_lru: simplify re=
parenting and initial allocation
> date:   7 weeks ago
> config: i386-randconfig-054-20241229 (https://download.01.org/0day-ci/arc=
hive/20241229/202412290924.UTP7GH2Z-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412290924.UTP7GH2Z-lkp=
@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> mm/list_lru.c:514:3-8: WARNING: NULL check before some freeing functio=
ns is not needed.
>
> vim +514 mm/list_lru.c
>
>    470
>    471  int memcg_list_lru_alloc(struct mem_cgroup *memcg, struct list_lr=
u *lru,
>    472                           gfp_t gfp)
>    473  {
>    474          unsigned long flags;
>    475          struct list_lru_memcg *mlru;
>    476          struct mem_cgroup *pos, *parent;
>    477          XA_STATE(xas, &lru->xa, 0);
>    478
>    479          if (!list_lru_memcg_aware(lru) || memcg_list_lru_allocate=
d(memcg, lru))
>    480                  return 0;
>    481
>    482          gfp &=3D GFP_RECLAIM_MASK;
>    483          /*
>    484           * Because the list_lru can be reparented to the parent c=
group's
>    485           * list_lru, we should make sure that this cgroup and all=
 its
>    486           * ancestors have allocated list_lru_memcg.
>    487           */
>    488          do {
>    489                  /*
>    490                   * Keep finding the farest parent that wasn't pop=
ulated
>    491                   * until found memcg itself.
>    492                   */
>    493                  pos =3D memcg;
>    494                  parent =3D parent_mem_cgroup(pos);
>    495                  while (!memcg_list_lru_allocated(parent, lru)) {
>    496                          pos =3D parent;
>    497                          parent =3D parent_mem_cgroup(pos);
>    498                  }
>    499
>    500                  mlru =3D memcg_init_list_lru_one(gfp);
>    501                  if (!mlru)
>    502                          return -ENOMEM;
>    503                  xas_set(&xas, pos->kmemcg_id);
>    504                  do {
>    505                          xas_lock_irqsave(&xas, flags);
>    506                          if (!xas_load(&xas) && !css_is_dying(&pos=
->css)) {
>    507                                  xas_store(&xas, mlru);
>    508                                  if (!xas_error(&xas))
>    509                                          mlru =3D NULL;
>    510                          }
>    511                          xas_unlock_irqrestore(&xas, flags);
>    512                  } while (xas_nomem(&xas, gfp));
>    513                  if (mlru)
>  > 514                          kfree(mlru);

Hmm, does it need a fix? mlru here is most likely always NULL, so in
most cases this should save a function call, a really micro
optimization.

Perhaps a "if (unlikely(mlru))" is better, and silence the bot?

>    515          } while (pos !=3D memcg && !css_is_dying(&pos->css));
>    516
>    517          return xas_error(&xas);
>    518  }
>    519  #else
>    520  static inline void memcg_init_list_lru(struct list_lru *lru, bool=
 memcg_aware)
>    521  {
>    522  }
>    523
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
