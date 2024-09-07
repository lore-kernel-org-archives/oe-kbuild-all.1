Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161362E634
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 18:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725732515; cv=none; b=OcP6x1KN+ZxVH3JFiFbeEXO0x4SOtxOhsZEKLw89/mcmk9tAvhc0lHxoSw8QHT16VCQ40SUd3aHeuAhWrZy/w3lbWl/66e3PhWoq63NBBXwslRyDr1mTxxyiuwnYMe+BWTJ+kaWqT1wCPvpzqYxmZ5K/vySjvMRMjFXwEdWgLCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725732515; c=relaxed/simple;
	bh=bSssqU8hRA8Xp569RnIe4v2HFu3n/oClBhAIrX+W9ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtJFMbZqFJvmGjzGs5S4vIo/J5yNh+/+PfDjljLy/+zweqDW3e10KTTdEA5IHCUM0D2qwfKOwFfve8Utm1gnXwtJDTx8ZXgB+J6I9X1qEDWCfZPSpBnMY24D95042E34Q7IlO++5G4XxPHZpuV7T3ehiSN6hVTp0fFWwGSMM2+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZpFZ9G9p; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZpFZ9G9p"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f761cfa5d8so1266831fa.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 07 Sep 2024 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725732512; x=1726337312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR1R1SW0Q1t+dKgEa9wUl4Z4VxRv8lTW2dHgKzL1NU8=;
        b=ZpFZ9G9pixwJ3akhgL3oR4rQKwWnxQAs8D5BUkfoLnS6lPAYG3NjHUu5N2C8yD+oPq
         0vDUmW9QOU6uDOWr7ASys9SUmDwywsfla7pG9CKO4acLiMI6tjiWBJPF2qBPeNlnWxIn
         c7GNBcWgG+MI0yYXSAxXcv/qX8wAadWuGKrg80PDXuqF3w+2uNcQg61gSsq670gXZGIi
         0p/uXdiYa3cIrvn/JJT+bJepmTB+XsWqqFOIN6DmVPQtBr2kgTmDShJP8+hOKiGsPle9
         XT8SB9HxFf8WbQX9CF7s3ByaS8R3uOYtSiDBXx78pLlMB4vryRu01VOTeuCuQoXbw2pJ
         LpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725732512; x=1726337312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NR1R1SW0Q1t+dKgEa9wUl4Z4VxRv8lTW2dHgKzL1NU8=;
        b=uSHNJ1jsPDk7FCwzbn6uEYYjs4dVnkiY20jI9cnTior+T5R8LATi6b34Z8NtqrfNDj
         P8ilFxj7hlGp4HuYliFKT++wry3QgFJyRVo5YRikIxCdzmsg/T9Og9zsXB8//KSMeT67
         Jj9lVOuXwiXZmQcTJ88HafuzLi01JNX3eBswUpurCISakpjxn+E5GwChdpgDtd0JEQ3o
         ljfpwqJkQdYOG1BtSU1GtPwxyOS5yzj7eKB/9f5OPpXLpu4qHDVwHF8wZoqnOolmTOXH
         YIGLUYRlDtSfvsQIyBzq6ebjbWXlppyCgjQ3WqqdWY/SDKPf/n18zjk7bTO1RmpVfTf2
         Wfhg==
X-Forwarded-Encrypted: i=1; AJvYcCW7spq6UktuS7a5OXq2SA9hSPsBAnb7KIv54h/XgLMR4uEqJB7LCSG6Wvd3U8EAlOBNnkwuaCtWnJTNn9GU@lists.linux.dev
X-Gm-Message-State: AOJu0YxF/jFMFvPmEfRILvHy2kYGcV8XUvfLSXkVk+LfVKV2fq7RnTK3
	hSyOJWyf0LMo1xOQVsIQ09y0w72S5aORHJR7Us20l2HesLiNcDcIEUGKVcu3Ot+skm5bchg0qsG
	paKdKnmsxUZxYTr4l2O1gcc+k+hAxmJ9i+5Wp
X-Google-Smtp-Source: AGHT+IFlR+1Qb+YTXq4EPxW+1FiKjp0zNBiV9mnQiZoTet9W71LwaLzLvilcxnkCmHKxZxs6hT+FaV7+A8NNXe0Kr8g=
X-Received: by 2002:a05:6512:39ce:b0:536:54df:bff2 with SMTP id
 2adb3069b0e04-53658812f84mr4351889e87.54.1725732511471; Sat, 07 Sep 2024
 11:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409080151.fMmh2yu4-lkp@intel.com>
In-Reply-To: <202409080151.fMmh2yu4-lkp@intel.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Sat, 7 Sep 2024 11:07:55 -0700
Message-ID: <CAJD7tkZy6dwq9-EdVUyJqmbKncrp84wPzxddjWUBAx_x37RhKA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 149/155] kismet: WARNING: unmet direct
 dependencies detected for Z3FOLD when selected by ZSWAP_ZPOOL_DEFAULT_Z3FOLD
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 10:27=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   e8d9739d326fade1f58bc90726d2f9ebe35ae708
> commit: 4f6a358be27cd25e5e808031cc1715c2b6a0ef6f [149/155] mm: z3fold: de=
precate CONFIG_Z3FOLD
> config: x86_64-kismet-CONFIG_Z3FOLD-CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD-0-0=
 (https://download.01.org/0day-ci/archive/20240908/202409080151.fMmh2yu4-lk=
p@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20240908/202409080151=
.fMmh2yu4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409080151.fMmh2yu4-lkp=
@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for Z3FOLD when se=
lected by ZSWAP_ZPOOL_DEFAULT_Z3FOLD
>    WARNING: unmet direct dependencies detected for Z3FOLD
>      Depends on [n]: Z3FOLD_DEPRECATED [=3Dn]
>      Selected by [y]:
>      - ZSWAP_ZPOOL_DEFAULT_Z3FOLD [=3Dy] && ZSWAP [=3Dy]

This seems to be working as intended, we cannot enable CONFIG_
ZSWAP_ZPOOL_DEFAULT_Z3FOLD unless CONFIG_ Z3FOLD_DEPRECATED is
explicitly enabled. Maybe this isn't the correct way to do it? Should
I make CONFIG_ ZSWAP_ZPOOL_DEFAULT_Z3FOLD depend on CONFIG_Z3FOLD
instead of selecting it?

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
