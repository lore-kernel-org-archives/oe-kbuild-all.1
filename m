Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF1A2BE7C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 17:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157552; cv=none; b=EPMkIDLwuhYdsMun3adC6CONsFSasYvh9osvhTHHZPWw1EtUf4IpT8oTBPle/H5xmp3d8DW8Q68a/iVdT0ThNYMbzE3pvS+VWHbXoTCQ1+F8YOmGeS6IOR2BtXNph1BunKe5Q3dFj9Ks+JGTazWykHL0dsKOtRcAb1wKiFNiVMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157552; c=relaxed/simple;
	bh=WEEw3H+WDhvJpFTJ4qQDXt71XI9vO4UTOBjSfohSR6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5fIeghPLoDWp5JIn6ymrZa/2efdWtlPjZKpK3Uv6Ue3j/lafi8ZlJqH5BBKe1UqQdXURqnDiwyMoskoAu96ysximeVfELItp3l1yqgy1XGVeIBAMdRMd6wT/+0JTghK+RhfWAC3O9Tdk692S1wzDEcNlXRUeelM5nqwhJj00qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1HdWUZUH; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1HdWUZUH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47666573242so27081cf.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747157549; x=1747762349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DOowbSxIBNFz77Dq0SWuQaa+felhYyndn2kYV4C73o=;
        b=1HdWUZUH34SD4Dwub31xtWR2BM7WnS82OQK1VZaGQSbR/XsSmiyEo2GLNIze2CUle4
         nAhVtuqQW7fiKod+rh0ShA4twBwqxRwNBpznARIDTVe5WQo/1ZXeKkoaXep1+uFTn0nT
         yUD/Qy9MNL818ckKyQvUm4MgEerUH9UFY+2Rgr4pJoc+K7O0pPXDl/25VdAJG2ikW+Qe
         pEUYoYypNYxRY1sCGLKvrKKXceA5SV9xjxqd/en0aQyFNYnY1taQu5aIaINsEkAekRKK
         LS1c6RPQGPqzO5t95n15SX52e5MFH37A8ofYbIaKZYtHw0j2yMSDQIdDvb1zT9whkKwA
         makw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157549; x=1747762349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DOowbSxIBNFz77Dq0SWuQaa+felhYyndn2kYV4C73o=;
        b=CSP7pVckqN94xC3/xTH22/T3UEoKsuFs2DCVMyXG9pgRsYQv4VXNv2Ub51pQjWuGB1
         9KppUQYZWsC96I9CbupsV7T29lxpVqLgxTzAqWCJAcegW9GngH2uc+FZFQGyZ/5UUU1I
         ig6hKchkttE+PCDRPe7UyX/Xs+rlUDvBPLWk1zGiaiV0BcQWiaKet5MuNqlsprLliGEh
         HbZcAnh7uAwQ+7YpYAl/DYCl9Ii5b5kk/z/57GydlAC00kH7AUkShzOs/ea2TqkTkA3y
         O+Y47lgXOoNjpgQc+YOUbHETVqP9Phby+rpyWrKK4niFOkqlfX9cfJr88b5T6JacRBq6
         fcZg==
X-Forwarded-Encrypted: i=1; AJvYcCV8d1zb7au7TERfzfafaBUa03/tIvr/k1MlO8AnR6TCPcE0sY9qmL1Tt6NHjAnF8ZuiI8q+WM7tdW6z3Hqm@lists.linux.dev
X-Gm-Message-State: AOJu0YzDJ+xGq1CSQD8HuSWjhTVR3/msnCF5V1BbXDjxrtJ0e1dZMMC4
	wmbQGKRWTdAvXrxWpT6us9HnHMOrWR6Fj3TMpwJqDXy9Ou17b8wIRcdv9x4z648Er+TDunRyNP3
	3CA6yr/OHHV8pYfpCVbDBackqCo9kg1S4f+fNHRv3
X-Gm-Gg: ASbGncvIy0rZClb7z4AjVKexQtHrHit2sgXL6Z20Dr19h2Fu917i5MNV5OelhOqJPek
	meEfobKLg6Be9LS3RcxFb4glFC6Ev9JcgF4KYNB+/zn0+0HzPqWVUZKz3baCrCW1beW/0dw1fAy
	b/mt0HXXmlOIAUCEdto1vDPQl//olFF+sSyQ==
X-Google-Smtp-Source: AGHT+IG+8VLEF5LwFCMQ0UHlKUUGTtV36GRRRSd04x5eFCzOeewR4VGbhq+2ryDt5b+wtk8+cDAHA/Jvf+AKp3ItYCg=
X-Received: by 2002:a05:622a:202:b0:471:eab0:ef21 with SMTP id
 d75a77b69052e-494898efbb9mr4851341cf.13.1747157548610; Tue, 13 May 2025
 10:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250510010338.3978696-1-jyescas@google.com> <202505110035.wtOWnL8o-lkp@intel.com>
 <A3E9017A-7282-4BF9-AC60-E2C74EB68980@nvidia.com> <CAJDx_rj2QpiQkLoJM0x-WOD5nJQVLDbsFNm4-xZ9SfAq_f1SBw@mail.gmail.com>
 <2513BE19-5527-45A4-8BE8-A447B53654C0@nvidia.com>
In-Reply-To: <2513BE19-5527-45A4-8BE8-A447B53654C0@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 13 May 2025 10:32:17 -0700
X-Gm-Features: AX0GCFtkFGhhXiBkpciVK_nVdr9uM4M6rZUdEjYlxAZyTsZ4doe_1wm8rW9p5rM
Message-ID: <CAJDx_rgP2vXpFqFD9n_LreOPoDGvNsY6J41mC-ZL7W8vpiLQcw@mail.gmail.com>
Subject: Re: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, tjmercier@google.com, isaacmanjarres@google.com, 
	surenb@google.com, kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 9:47=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 13 May 2025, at 12:41, Juan Yescas wrote:
>
> > On Tue, May 13, 2025 at 8:08=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> >>
> >> On 10 May 2025, at 13:16, kernel test robot wrote:
> >>
> >>> Hi Juan,
> >>>
> >>> kernel test robot noticed the following build errors:
> >>>
> >>> [auto build test ERROR on linus/master]
> >>> [also build test ERROR on v6.15-rc5]
> >>> [cannot apply to akpm-mm/mm-everything next-20250509]
> >>> [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> >>> And when submitting patch, we suggest to use '--base' as documented i=
n
> >>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>>
> >>> url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/mm=
-Add-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250510-090501
> >>> base:   linus/master
> >>> patch link:    https://lore.kernel.org/r/20250510010338.3978696-1-jye=
scas%40google.com
> >>> patch subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select p=
age block order
> >>> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive=
/20250511/202505110035.wtOWnL8o-lkp@intel.com/config)
> >>> compiler: powerpc64-linux-gcc (GCC) 14.2.0
> >>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250511/202505110035.wtOWnL8o-lkp@intel.com/reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505110035.wtOWnL8o=
-lkp@intel.com/
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>    In file included from include/linux/gfp.h:7,
> >>>                     from include/linux/xarray.h:16,
> >>>                     from include/linux/list_lru.h:14,
> >>>                     from include/linux/fs.h:14,
> >>>                     from include/linux/compat.h:17,
> >>>                     from arch/powerpc/kernel/asm-offsets.c:12:
> >>>>> include/linux/mmzone.h:53:2: error: #error MAX_PAGE_ORDER must be >=
=3D PAGE_BLOCK_ORDER
> >>>       53 | #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >>>          |  ^~~~~
> >>>    make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-o=
ffsets.s] Error 1
> >>
> >> In this config, CONFIG_ARCH_FORCE_MAX_ORDER is set to 8, lower than
> >> the default PAGE_BLOCK_ORDER value, 10. I wonder if the error should
> >> be changed to ignore CONFIG_PAGE_BLOCK_ORDER when MAX_PAGE_ORDER is
> >> set by CONFIG_ARCH_FORCE_MAX_ORDER and give a warning instead.
> >
> > In ARMv8, MAX_PAGE_ORDER is set up by CONFIG_ARCH_FORCE_MAX_ORDER
> > and CONFIG_PAGE_BLOCK_ORDER is also set up, so we need to take into acc=
ount
> > CONFIG_PAGE_BLOCK_ORDER. For other architectures, the default will be:
> > CONFIG_ARCH_FORCE_MAX_ORDER =3D CONFIG_PAGE_BLOCK_ORDER.
>
> It seems that the Kconfig =E2=80=9Crange 1 ARCH_FORCE_MAX_ORDER if ARCH_F=
ORCE_MAX_ORDER=E2=80=9D
> is not working. The above powerpc-allmodconfig has CONFIG_ARCH_FORCE_MAX_=
ORDER
> set to 8 and CONFIG_PAGE_BLOCK_ORDER is set to 10, leading to the compila=
tion
> error.
>

Right, Kconfig restriction is being ignored by powerpc, however, it is
respected by ARMv8.

The main difference that I see between arch/arm64/Kconfig and
arch/powerpc/Kconfig
is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig

https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L1637
config ARCH_FORCE_MAX_ORDER
int
default "13" if ARM64_64K_PAGES
default "11" if ARM64_16K_PAGES
default "10"

https://elixir.bootlin.com/linux/v6.14.6/source/arch/powerpc/Kconfig#L918
config ARCH_FORCE_MAX_ORDER
int "Order of maximal physically contiguous allocations"
range 7 8 if PPC64 && PPC_64K_PAGES
default "8" if PPC64 && PPC_64K_PAGES
range 12 12 if PPC64 && !PPC_64K_PAGES
default "12" if PPC64 && !PPC_64K_PAGES
range 8 10 if PPC32 && PPC_16K_PAGES

> >
> > Is there any valid case where the MAX_PAGE_ORDER needs to be smaller th=
an
> > the page block order?
>
> I am not aware of any.
>
> >
> > Thanks
> > Juan
> >>
> >>>    make[3]: Target 'prepare' not remade because of errors.
> >>>    make[2]: *** [Makefile:1275: prepare0] Error 2
> >>>    make[2]: Target 'prepare' not remade because of errors.
> >>>    make[1]: *** [Makefile:248: __sub-make] Error 2
> >>>    make[1]: Target 'prepare' not remade because of errors.
> >>>    make: *** [Makefile:248: __sub-make] Error 2
> >>>    make: Target 'prepare' not remade because of errors.
> >>>
> >>>
> >>> vim +53 include/linux/mmzone.h
> >>>
> >>>     46
> >>>     47        /*
> >>>     48         * The MAX_PAGE_ORDER, which defines the max order of p=
ages to be allocated
> >>>     49         * by the buddy allocator, has to be larger or equal to=
 the PAGE_BLOCK_ORDER,
> >>>     50         * which defines the order for the number of pages that=
 can have a migrate type
> >>>     51         */
> >>>     52        #if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> >>>   > 53        #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >>>     54        #endif
> >>>     55
> >>>
> >>> --
> >>> 0-DAY CI Kernel Test Service
> >>> https://github.com/intel/lkp-tests/wiki
> >>
> >>
> >> Best Regards,
> >> Yan, Zi
>
>
> Best Regards,
> Yan, Zi
