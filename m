Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B35A297A42
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076779; cv=none; b=J1MzVpWn7GT6NDT/uMoI8XFJJo/jjL1HdwYFd5YEFzcbWqPeSoAB7F6/2wndkTZXqvZ8BqHoztGlDQPg8o3gxV3kpxkvkTjInDyDwvZaSA3tj7GQhoc+7g3SVUt+aEEw6F5RPCUr5oSM/zpH7Fs7EVF/msKhLQIupyIkc+bz/Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076779; c=relaxed/simple;
	bh=UqjIGIkaqS00AwLfEnqGgArqbDkaqFgVmPeo8WzeUF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wl1tmonkcQW6zblfwPRJKqb1u32yM5yQS2B6JjQ0e8GLKcxiBdki554v+J3wp5d2CKrGs6x+cgOVubJLy8IuDlDtALu1uc2ju1ySpbo4Ma6sjvuNgIrc3PZ+6hEYGOHldLM4MT0smc3Z8w8B2hCcYAmqiI2dyPcmMnz9tOFEN2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AzHev9Zr; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AzHev9Zr"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-48b7747f881so60821cf.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747076776; x=1747681576; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlaBIoGCDj2YBbfCjPUIByxs5tgRMLkhs+czsg2KRtk=;
        b=AzHev9ZrGJE6UUT58mfRcy38PTUWPGR69/VKZEhfIOE4kNwA9N0LfdlVLwCxyjKdWM
         VCFoLkZf1VpqphKsKidETNEltiL54yXri8PgpOTXCjZvkQqS2MZCWBT6kqSt80SXjto2
         JyeOQzpmmg1G2OYaQDg0X1Q7NtUxfRG/SH4chQxtDoFf5WrHbS+ufONyKgF0mhArLbG7
         ZW29XaA3dvPCQ7vHr+LYIriRDiah4bqGKcHUuTOBTLjDxnYv2ahVAw5pHFVS0vXftN8s
         1llBjN4UYt8wONDHYJSPZjupdsfj5yUz6SLMmbcatyJdbLqhnSNOFP+zjXsLICaHVVfS
         k1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747076776; x=1747681576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlaBIoGCDj2YBbfCjPUIByxs5tgRMLkhs+czsg2KRtk=;
        b=tgt92FThPWziGsg6r5lONqRkFc3lFXcWOiOni7o5FiXEuLoY6Zzzqb34M95JJXfQma
         67UHzIubov5jT7ZdESODQd0/VmZHeLRIIqThGjM4EyMYL2kBvF14TBNzy9Ro25oXBZGB
         TkKDUdVxUJSHD0nS9iDjWc2zGwpT3aIvsLoYVo2czLbhyHyxzw+EkpnADmVgKaxh2Qoi
         kYZDfYeGahQpMg8UFnaDQkGHsxA1drBdKCocFU7OjMxaGomwsOgQjxow4DsUUeO/Rk+U
         hBnRnc8MFBI3/3N2CqwkLlbDzNWVtCR0LJF9GGrOSLphCDAuwxQulDRFIHuzOnpuImAl
         wpfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXApDo9kYSw494zEObqAKl77G4wonnj5jUK6D7rxyJ1WXpN6gpA1xHJpLHyQbK/rnNw4i7IAqqOcfMatC5q@lists.linux.dev
X-Gm-Message-State: AOJu0YzBEm+sGkWwtfp70R9VWLeG/jkAblWwAGouFxQzfrixa2tHXm1B
	l9ZRRLII9z01ciFX6Wooqgj9QqAzRuRkSuySWQ3cCxhG1X8uyNUOqqG1Ydg872fUz3NbE5y0psX
	874Oab/QudPWgDTJDRNVkofZBiR0reW55VToh
X-Gm-Gg: ASbGnctiyBVZKiZhkcLKYiZdfP5x2wGWVHtnIMbxRkz1g23bfbU3pXhjiGqKTEHoo1+
	6fzrTuiLi8NpSTTDWl9jULtqGFCOCWHDxEn5jGh7Zje6XjTFpdfvwTL4pZ2sT7sr+4gPE9kClXK
	20kOrynf9YZfzLO4J45jT7EZ5qKcTa6Zu91AVDtq2tiff12mpWlPckAgzyVPsMuZ6QOw==
X-Google-Smtp-Source: AGHT+IFBi76c9HCC/BtyKlkS54kVR4sp9uMVllBKhvHfQguku4lD2jIfu3weJnzfKcjV/mhhBSWJ2xr+zru+2lPauaI=
X-Received: by 2002:a05:622a:164e:b0:48a:5b89:473b with SMTP id
 d75a77b69052e-4948828457bmr338911cf.7.1747076775897; Mon, 12 May 2025
 12:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505091548.FuKO4b4v-lkp@intel.com> <CAJDx_rg6QHsLK8=i-6D5=B=OL50-RUPP=e9JZgRiAfE3sgwRMg@mail.gmail.com>
 <aCFKczeBZOp8wiPg@rli9-mobl>
In-Reply-To: <aCFKczeBZOp8wiPg@rli9-mobl>
From: Juan Yescas <jyescas@google.com>
Date: Mon, 12 May 2025 12:06:03 -0700
X-Gm-Features: AX0GCFvQOxojxpWtWcort3iToPLLjrZi4pJYvap4QTgX7RWu9TBjkS13M4u_8O8
Message-ID: <CAJDx_rhLT1yEd4Ln0c6dyOuSY_zvdxy1122S+JaxEXb8urT9uw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 333/334] include/linux/mmzone.h:1816:8:
 warning: left shift count is negative
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 6:10=E2=80=AFPM Philip Li <philip.li@intel.com> wro=
te:
>
> On Fri, May 09, 2025 at 01:43:33PM -0700, Juan Yescas wrote:
> > On Fri, May 9, 2025 at 12:49=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git m=
m-unstable
> > > head:   930c125f685d7e8eef566fcd563390b76a28d824
> > > commit: 16994f2b09a22523885d371caa59f17999686805 [333/334] mm: add CO=
NFIG_PAGE_BLOCK_ORDER to select page block order
> > > config: powerpc64-randconfig-003-20250509 (https://download.01.org/0d=
ay-ci/archive/20250509/202505091548.FuKO4b4v-lkp@intel.com/config)
> > > compiler: powerpc64-linux-gcc (GCC) 10.5.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250509/202505091548.FuKO4b4v-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    In file included from include/vdso/const.h:5,
> > >                     from include/linux/const.h:4,
> > >                     from include/linux/bits.h:5,
> > >                     from include/linux/ratelimit_types.h:5,
> > >                     from include/linux/printk.h:9,
> > >                     from include/asm-generic/bug.h:22,
> > >                     from arch/powerpc/include/asm/bug.h:116,
> > >                     from include/linux/bug.h:5,
> > >                     from include/linux/mmdebug.h:5,
> > >                     from include/linux/mm.h:6,
> > >                     from mm/sparse.c:5:
> > >    mm/sparse.c: In function 'usemap_size':
> > > >> include/linux/mmzone.h:1816:8: warning: left shift count is negati=
ve [-Wshift-count-negative]
> > >     1816 |  ((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGE=
BLOCK_BITS)
> > >          |        ^~
> > >    include/uapi/linux/const.h:51:40: note: in definition of macro '__=
KERNEL_DIV_ROUND_UP'
> > >       51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d)=
)
> > >          |                                        ^
> > >    mm/sparse.c:301:9: note: in expansion of macro 'BITS_TO_LONGS'
> > >      301 |  return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(un=
signed long);
> > >          |         ^~~~~~~~~~~~~
> > >    mm/sparse.c:301:23: note: in expansion of macro 'SECTION_BLOCKFLAG=
S_BITS'
> > >      301 |  return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(un=
signed long);
> > >          |                       ^~~~~~~~~~~~~~~~~~~~~~~
> > >
> > >
> > > vim +1816 include/linux/mmzone.h
> > >
> > > d41dee369bff3b Andy Whitcroft 2005-06-23  1814
> > > 835c134ec4dd75 Mel Gorman     2007-10-16  1815  #define SECTION_BLOCK=
FLAGS_BITS \
> > > d9c2340052278d Mel Gorman     2007-10-16 @1816          ((1UL << (PFN=
_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
> > > 835c134ec4dd75 Mel Gorman     2007-10-16  1817
> > >
> >
> > Thanks for testing,
> >
> > The reason for the warning is because CONFIG_PAGE_BLOCK_ORDER >
> > CONFIG_ARCH_FORCE_MAX_ORDER.
> >
> > This config: powerpc64-randconfig-003-20250509
> > (https://download.01.org/0day-ci/archive/20250509/202505091548.FuKO4b4v=
-lkp@intel.com/config)
> >
> > is not respecting the range config below. Should the test make sure
> > that the ranges are valid?
>
> Thanks for the information, I will check the bot side to resolve the prob=
lem.
>
> Sorry for the false positive.
>
Thanks Philip,

I tried to reproduce the issue in an ARM64 build by modifying the
.config manually

 $ vim .config
 $ cat .config | grep MAX_ORDER
CONFIG_ARCH_FORCE_MAX_ORDER=3D8
 $ cat .config | grep PAGE_BLOCK
CONFIG_PAGE_BLOCK_ORDER=3D10
 $ make -j40 ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-
  CALL    scripts/checksyscalls.sh

However, after I built the kernel, the CONFIG_PAGE_BLOCK_ORDER got
overridden with
a valid value.

 $ cat .config | grep MAX_ORDER
CONFIG_ARCH_FORCE_MAX_ORDER=3D10
 $ cat .config | grep PAGE_BLOCK
CONFIG_PAGE_BLOCK_ORDER=3D10

Is there a parameter or configuration in the test that indicates not
to fix the .config files?


> >
> > config PAGE_BLOCK_ORDER
> > int "Page Block Order"
> > range 1 10 if !ARCH_FORCE_MAX_ORDER
> > default 10 if !ARCH_FORCE_MAX_ORDER
> > range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> > default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> >
> > I can add a check in include/linux/pageblock-flags.h
> >
> > /*
> >  * The PAGE_BLOCK_ORDER, which defines the order for the number of page=
s
> >  * that can have a migrate type, must be less or equal to the MAX_PAGE_=
ORDER,
> >  * which defines the max order of pages to be allocated by the buddy al=
locator.
> >  */
> > BUILD_BUG_ON_MSG(PAGE_BLOCK_ORDER > MAX_PAGE_ORDER,
> >         "MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER");
> >
> > Is there any preference?
> >
> > > :::::: The code at line 1816 was first introduced by commit
> > > :::::: d9c2340052278d8eb2ffb16b0484f8f794def4de Do not depend on MAX_=
ORDER when grouping pages by mobility
> > >
> > > :::::: TO: Mel Gorman <mel@csn.ul.ie>
> > > :::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> >
