Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F41E25F8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746823429; cv=none; b=uoBMDYN+ktFS0UUnc49dJ37tUDNaDr9l3PhCrMeJnSBXcZwtcUqf5X9NrQD9bJ+R4HasuNF/jba/fXuooZuMOhcCXvdf3byM2Aoc4hH0nDXBezMcQsEBLbX5QxAFX5b9iRyzV7H4vV0f5gi6pVh+xvbuH4aBFj0nIPTBsvyTWRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746823429; c=relaxed/simple;
	bh=YXS9tLNB+DhcWPnrFXM+k3HHCkUtrnNouI0OvrDKK1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qoVAdvizOfzq758MOQo0Ox7MYu/YeYVORNre3Zj7TO/5lKQFb9xpBolUCiJA2LtI3FWO3mqnWY6p+rbKsFbgn0bKO3lefQ6JmOyKs2iWXsamtNHoFdW0om8D2A0fW7Sbjucp3V2L7GpHXNi9A8LoE0JwYIN7xOkH5PgKw3SVwjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1M/yfmBL; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1M/yfmBL"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47e9fea29easo28031cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 May 2025 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746823426; x=1747428226; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S9NHraWVhA5CGR8FuQ2evTvmLpkENRuPNxBlSnU8Ag=;
        b=1M/yfmBLSFU6iTWVAMx9EYqIqB9j/jUeKJ6wHSZVMiclT4/ImXxEdYpZKyRMdsNoWR
         1fFDhLRpVjRW2EAFuIe/nGhTDL+UvW/hQvizLcewGTPySbT/qNUJqpFeYjQyrJEXUksm
         OdCcqRhu5Nk8SA/+xuK5eTY55FloN3T5zYT3o7Q9ac2FaVx8X5/bM7uKoTI+lgF7dk6d
         /0S1RF2noZbAcakcFKJhRTA7p9CvxHDLzq6R9cXJ+C5RBUWUSNuyczy6CfFu3V8+vbFi
         o9ghiEkHry2esFS7RLO5SxU8c7Fh5hj+AVQ0r4RdWj34f4Dp6BQ5DlxmjtbwD3xDicX/
         /ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746823426; x=1747428226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S9NHraWVhA5CGR8FuQ2evTvmLpkENRuPNxBlSnU8Ag=;
        b=alHY5LoN0PzDbI8YMap8SOwoFKBzSd5kXqwiDykzI3BRagAO+5VeJO+7EmM5wTT5/C
         dSemJgUb1+rBk0Az8n3RhekW9KU6oLoj8FZZk901XfYsrzMX2oPFXNtjKbeNFflEO4X2
         SxTbUrm6MJPsLWmoSXPOQ2L6oj35idN9sNwTQ12kQQwCtRPXNqF57ejY9k508FQ9jRTV
         sm9s3Z5RuleBHU3CH9Sa0uVlLFmy6srk/2UqiU8OM0sbjYNBmC97ulWMw9ffsMEX+Y8S
         W2zzr1/uJMWUWfNfJpM0L9dOyNqjAUdhJn2WpaAZ7xRTCjIRWmC7rNus5glTBlKAYkvy
         gbqw==
X-Gm-Message-State: AOJu0YwbtaicBThLoWhE/pkT2OAskUIOewJ2QDmazXY/Um1XKBud4K8I
	64CfVK8uO4O5kePmkxBgr1cJRcBkU0B0Iv82+g6VwtrSFtBjRJPG/kigu29ZrkFgYCma+qN+qx6
	m8doZYiUMRuHW392jtrXVfTpSUdtwK7RLMgSs
X-Gm-Gg: ASbGncscZTTnk6nUPzOxg38UZ2tG1NZO8Ijj7nj54/2xlI9hlXNQqnTdOYVASQecjBC
	XGwLi8mgzNq/ul02W8vztMIWZVXmsRVOQ4pXcBwGLaTCJFxF3QzhZPJ7Db8OnPcE1H+Xxy+1yZw
	jdSlRCq/ediJjnaQ/a/7q+xHkjpinF0c7TKDLqitsp5DSSQDb8TaFdfUAFI60pekr8VA==
X-Google-Smtp-Source: AGHT+IGHbLxSdgDiRdqpu5IsKbOwcQeghplROXmb1QUUS125WaJgxyS3JDFVGnT0YPtAbyOXi6XdqTtO8JunNw7kVZU=
X-Received: by 2002:a05:622a:142:b0:47b:840:7f5b with SMTP id
 d75a77b69052e-4946140c4a0mr856271cf.29.1746823425828; Fri, 09 May 2025
 13:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505091548.FuKO4b4v-lkp@intel.com>
In-Reply-To: <202505091548.FuKO4b4v-lkp@intel.com>
From: Juan Yescas <jyescas@google.com>
Date: Fri, 9 May 2025 13:43:33 -0700
X-Gm-Features: AX0GCFsZTeKjpGqsZHfpiRvRSlAXTQwTHSA-4izTlST0ai6tD2Yb-XjSBDggkGQ
Message-ID: <CAJDx_rg6QHsLK8=i-6D5=B=OL50-RUPP=e9JZgRiAfE3sgwRMg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 333/334] include/linux/mmzone.h:1816:8:
 warning: left shift count is negative
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 12:49=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   930c125f685d7e8eef566fcd563390b76a28d824
> commit: 16994f2b09a22523885d371caa59f17999686805 [333/334] mm: add CONFIG=
_PAGE_BLOCK_ORDER to select page block order
> config: powerpc64-randconfig-003-20250509 (https://download.01.org/0day-c=
i/archive/20250509/202505091548.FuKO4b4v-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250509/202505091548.FuKO4b4v-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/vdso/const.h:5,
>                     from include/linux/const.h:4,
>                     from include/linux/bits.h:5,
>                     from include/linux/ratelimit_types.h:5,
>                     from include/linux/printk.h:9,
>                     from include/asm-generic/bug.h:22,
>                     from arch/powerpc/include/asm/bug.h:116,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/mm.h:6,
>                     from mm/sparse.c:5:
>    mm/sparse.c: In function 'usemap_size':
> >> include/linux/mmzone.h:1816:8: warning: left shift count is negative [=
-Wshift-count-negative]
>     1816 |  ((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOC=
K_BITS)
>          |        ^~
>    include/uapi/linux/const.h:51:40: note: in definition of macro '__KERN=
EL_DIV_ROUND_UP'
>       51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>          |                                        ^
>    mm/sparse.c:301:9: note: in expansion of macro 'BITS_TO_LONGS'
>      301 |  return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsign=
ed long);
>          |         ^~~~~~~~~~~~~
>    mm/sparse.c:301:23: note: in expansion of macro 'SECTION_BLOCKFLAGS_BI=
TS'
>      301 |  return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsign=
ed long);
>          |                       ^~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +1816 include/linux/mmzone.h
>
> d41dee369bff3b Andy Whitcroft 2005-06-23  1814
> 835c134ec4dd75 Mel Gorman     2007-10-16  1815  #define SECTION_BLOCKFLAG=
S_BITS \
> d9c2340052278d Mel Gorman     2007-10-16 @1816          ((1UL << (PFN_SEC=
TION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
> 835c134ec4dd75 Mel Gorman     2007-10-16  1817
>

Thanks for testing,

The reason for the warning is because CONFIG_PAGE_BLOCK_ORDER >
CONFIG_ARCH_FORCE_MAX_ORDER.

This config: powerpc64-randconfig-003-20250509
(https://download.01.org/0day-ci/archive/20250509/202505091548.FuKO4b4v-lkp=
@intel.com/config)

is not respecting the range config below. Should the test make sure
that the ranges are valid?

config PAGE_BLOCK_ORDER
int "Page Block Order"
range 1 10 if !ARCH_FORCE_MAX_ORDER
default 10 if !ARCH_FORCE_MAX_ORDER
range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER

I can add a check in include/linux/pageblock-flags.h

/*
 * The PAGE_BLOCK_ORDER, which defines the order for the number of pages
 * that can have a migrate type, must be less or equal to the MAX_PAGE_ORDE=
R,
 * which defines the max order of pages to be allocated by the buddy alloca=
tor.
 */
BUILD_BUG_ON_MSG(PAGE_BLOCK_ORDER > MAX_PAGE_ORDER,
        "MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER");

Is there any preference?

> :::::: The code at line 1816 was first introduced by commit
> :::::: d9c2340052278d8eb2ffb16b0484f8f794def4de Do not depend on MAX_ORDE=
R when grouping pages by mobility
>
> :::::: TO: Mel Gorman <mel@csn.ul.ie>
> :::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
