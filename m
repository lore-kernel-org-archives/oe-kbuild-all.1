Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399631CD3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732295853; cv=none; b=bHwcAc+PFnsnnTcmeJEGaLJy9yuGZkihp6ggpoEa6/At1HGDQQFFF81Vw+skaSaEkwSHzaU3yvhBXgvUUEO4mmZuQ32mJCekViFXfBjpJGT/5rCHTYw57zwdMR1eASSFbV8vy10E+me6ILCqMYWwLGPTu7JbzI5lE9pTQyAtrFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732295853; c=relaxed/simple;
	bh=xMbwWOUve+Hsq0NTesm2YZwxyiQuN1pcAjd7OABb4Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuLUxVQAQO3JEpDzyLNfP0JuPHoEMruLhEboF9h+TEl9+OV1x61Y2F0C7O74CsmiNj+dghHTqhEv2lEjl3uGBZEWjahwiYx3DKioD8+FgHORcuuEN8L89pjCrkJV0MHnhmR2P9dGLtSTlBy4ukpoGFtCp/tzQSCp5zC6Plk/juk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LiBHqFCN; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LiBHqFCN"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4608dddaa35so381771cf.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 09:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732295850; x=1732900650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=te/M/AFwMT5N3FBm5gG4e67qh7zWlbPrWJ4Mh8Jd78U=;
        b=LiBHqFCNufIdLepkqPGKQkf4cPOEUHWe5mHnFP+2lAtdUaieU2JKsu0N65qKe7Dhsw
         V97CeBWTwUcRcZHoxqWekwHUxoyGkmQQqxiF6SB2FIsI7J1Qq/ZirTtPuiN+qhpJhPXo
         wsu6Wyp1e8FXR+3NP0DG2Qf54AvDqjy7HMgMYtwLyFYVRumS6dA7jpwM+lmjzzg0IRqH
         qHrZYf62T22H2MV1CwDu+JouDlswchgzMN2Tqo+LaTndzAfpFrMzBOwJOV70azRwi3Ym
         /0Lc+3DIEBCAtJ85dlGZd9wDYZEQuA/qCHjC+MhCNW/dRgbsTrRTgXvv73C2QaDEGUos
         hXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295850; x=1732900650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=te/M/AFwMT5N3FBm5gG4e67qh7zWlbPrWJ4Mh8Jd78U=;
        b=C4KEHoN7Zmgulamn0AgUx/8CoczTWVnirgdqzOGE4TgBegZPrJxw+qQENdcDqlmcOi
         kiO57HN6iD/BrM8Id7+YIEBtEytZHaNtAKNA4LcfzbtnF5an2nBE3ffGiOjF/urkR8mS
         QVgdR51V7c9VFSMULw8sAzrzNSX/4GHTk8WsIVuGy8zQ/GuXKwkYsJ/o0m4054InDM+z
         9t81gfUA294z1FWkk7woqHBIaD/IUVpcqkVzPCUKtlWz24tNbNSP2LUVFt9iwm5M6qgb
         i4DErQkUtT2d4HBXR2hrXA3Enm0YcDZOzrSaNHmggEfXS8veHnT9+YFH0sFpvNpHiF8S
         Vo7w==
X-Gm-Message-State: AOJu0YyLSJLG7LwA1EdKUNqT55to7Cu7R6odyrcTcj9ZbLlF1Vh/X1jm
	9ZJgIgWWpFTMtrDKYLhANJRck9VZtZm/pRJdhU5kdyx1+V+t9fIXZiS7j+Ddj3nJg77Swq7JmcK
	9fLw6rhTubT1WD9exFCfAleIMzuIis0t2JTOH
X-Gm-Gg: ASbGncs5MbZA23pWHgZNM27o2x03+wIDPVUGJ8j8j6oYLBzll32v68K79V0Hl3Ntjqk
	2f6vSfmWhby56UwSTbR9J0yQiOqDBn8RcPi4O5g7MEcD04CKYf3HrKOCgJAUmrQ==
X-Google-Smtp-Source: AGHT+IF0+yFxKbZz/PiNd4wowDR0+5UMWmOU5NKeO14PanEM9vUGIN7T2yz/v9ly/4Z0JBTf3CU1bQFPdAqBgzliijA=
X-Received: by 2002:ac8:444f:0:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-465c590efa5mr2755491cf.9.1732295849802; Fri, 22 Nov 2024
 09:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121162826.987947-2-surenb@google.com> <202411230014.xk4U56vk-lkp@intel.com>
In-Reply-To: <202411230014.xk4U56vk-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 22 Nov 2024 09:17:18 -0800
Message-ID: <CAJuCfpFWVJa_qBRYBAytyMcaf79Wbeo+kNa+Pyg4u5ynwX_3Rw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mm: convert mm_lock_seq to a proper seqcount
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 8:52=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/mm-convert-mm_lock_seq-to-a-proper-seqcount/20241122-003050
> base:   43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
> patch link:    https://lore.kernel.org/r/20241121162826.987947-2-surenb%4=
0google.com
> patch subject: [PATCH v2 2/3] mm: convert mm_lock_seq to a proper seqcoun=
t
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241123=
/202411230014.xk4U56vk-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241123/202411230014.xk4U56vk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411230014.xk4U56vk-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/asm-generic/rwonce.h:27,
>                     from ./arch/sh/include/generated/asm/rwonce.h:1,
>                     from include/linux/compiler.h:317,
>                     from include/linux/export.h:5,
>                     from include/linux/linkage.h:7,
>                     from arch/sh/include/asm/bug.h:5,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/mm.h:6,
>                     from arch/sh/kernel/asm-offsets.c:14:
>    include/linux/mmap_lock.h: In function 'vma_end_write_all':
> >> include/linux/mmap_lock.h:140:35: error: 'struct mm_struct' has no mem=
ber named 'mm_lock_seq'
>      140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
>          |                                   ^~

Oh, this is due to CONFIG_PER_VMA_LOCK=3Dn. Trivial fix is to move
ASSERT_EXCLUSIVE_WRITER() into appropriate mm_lock_seqcount_end().
Will re-post with the fix shortly.


>
>    include/linux/kcsan-checks.h:371:32: note: in definition of macro 'ASS=
ERT_EXCLUSIVE_WRITER'
>      371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS=
_ASSERT)
>          |                                ^~~
> >> include/linux/mmap_lock.h:140:35: error: 'struct mm_struct' has no mem=
ber named 'mm_lock_seq'
>      140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
>          |                                   ^~
>    include/linux/kcsan-checks.h:371:45: note: in definition of macro 'ASS=
ERT_EXCLUSIVE_WRITER'
>      371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS=
_ASSERT)
>          |                                             ^~~
>    make[3]: *** [scripts/Makefile.build:102: arch/sh/kernel/asm-offsets.s=
] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1203: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:224: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:224: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
>
>
> vim +140 include/linux/mmap_lock.h
>
>    128
>    129  /*
>    130   * Drop all currently-held per-VMA locks.
>    131   * This is called from the mmap_lock implementation directly befo=
re releasing
>    132   * a write-locked mmap_lock (or downgrading it to read-locked).
>    133   * This should normally NOT be called manually from other places.
>    134   * If you want to call this manually anyway, keep in mind that th=
is will release
>    135   * *all* VMA write locks, including ones from further up the stac=
k.
>    136   */
>    137  static inline void vma_end_write_all(struct mm_struct *mm)
>    138  {
>    139          mmap_assert_write_locked(mm);
>  > 140          ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
>    141          mm_lock_seqcount_end(mm);
>    142  }
>    143
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
