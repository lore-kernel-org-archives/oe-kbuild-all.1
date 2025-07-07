Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5986191499
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889961; cv=none; b=ACBKP5F4AAp5ZWb+q7d9Db/cSiIYeFN6JsecXVZvd9QfcOTdMpF1xtakT0HyV/g0nJm6j6J0yL/SKvO2+8Tje/SGqGHKv4PF4vkq5UEBUlV2VoGRyrc7bl9r9M/XsFPRv66Fi+Iyck9zEhaGVH6w/7lk+EMde+vPSze8APwTSEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889961; c=relaxed/simple;
	bh=tZ801LLNKdS+VNXgUpZHe/YDCfJy/le/GNWNddLIspE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgIg4H4xP/7R3k089qgpJjdLH2E9s/VUuKkg05NFVZ0SE8BAySAjk8jeVaVA7G7KA0OcANPxphzn6ONY81WDMyKUQ5Vb3TDeQWVKfZQ7NB5yq6Bs8DaIX3N24PcMuFjzIgH/HuXHJ4Gfq/UyY1Krb+/TxaBGfQtjxMtICxexPOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=F7rG38aC; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="F7rG38aC"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-313f68bc519so2266207a91.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Jul 2025 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1751889959; x=1752494759; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbRTOhGVmvoLFbv7787UbxqrHjCa5AmcSlfrkYU6bVo=;
        b=F7rG38aCJGoAy/2t3kHmfjpu9E9Iwa5/1yYIq4/zuA7hOJmkNJLaVJsrX2Z14RcF0p
         69EP2pYmzH4LjSJaeXPQax+8T+15qsbveyYdHoKvWxKT55Bxw8nDcjZv9QCnDA/9jeJx
         k0Ph8PbdMK5ABc2njH8E7xN6eLkcYx7JP7FZzYvbex9QBN4oG4XcU2YRRyc4fozTsyZ9
         GJeLC3L0P+gD5q209sKfz5C8hd6G/Z0dfNSV8tSDB3i2Qqsz0NdYH/ODQEIspXZwltv8
         /jqyKCPZDbo0agFM9ZPaZ7zYiUv3ouHcOXme7WE0lT7vlw5QXU1QqBDEC58nYpQU48LO
         H8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751889959; x=1752494759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbRTOhGVmvoLFbv7787UbxqrHjCa5AmcSlfrkYU6bVo=;
        b=UBCU75mp7HU0gxHONVySTWyWjkPHJBiscVoBhyYDBqyQ2zB+6/UC8Ygy5Up0kxqg3c
         nSV/CO7B6MV3WqXi+5xOjXKm5RMsIHCBoZ3E2TFNacBf4vJNuSENI49IZMtwHHGNQvJx
         cf4ccoal/XKCyTTDkv4is1jXgQU3sxPkvdmk1IvqGDw2U/tjvGiTAM+CVtF6l0f1VSu5
         YGiN4MwOliXJdCFXr7m3SdU1lyJ2F4e+YgBeB93gCVKgFWFdFoXxc/9nSlbYydq6hOl5
         8ujwscvhR3PoaazI4lRnDaqoMttuoeQPPi0SGC+QDRVq8xmcJMG13iP9D2QGUV3wwX4H
         +JbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZyDzdK5DjgPvjmfa531l31LK5baZ9gGVg/lrzRwfB1Q4qf5tnRrU86cKWzKXp4iakPY5ecQaNmIq7qS9A@lists.linux.dev
X-Gm-Message-State: AOJu0YxrteBNwwVVk+AcP/Ti2ACC0i2nu8CyGCo0+3a3Of28b4dPO6q6
	+I72lj5shDF5XJ7z0SoiMiwoEs0xAzpe1u9RDA6eDTZRKiGN1c77LHuw38cX6gRU+aZGyZAxZ0V
	yA/n4xwlNphYVQUKhjAvaRUTIZ72yyZ+lwG+NXNWtRw==
X-Gm-Gg: ASbGncsfFrNkIcvp6oipkghI/kno42cMKa1NMjV70N4b70Y7ITtxN5QeEvQkk31/NhU
	GhJBeNdBEyc5rbUbEYSAn3wAU5Nt7+3HehxBdMb4s3wWUrvGJVBHzYXLqQoosp3OaU58UmwgBWw
	RHimhOs/EL0AOyEJTdy22nswqnHNbUciqq3Qi6FWrly/s3+Fk6n5UUw93XCmNO
X-Google-Smtp-Source: AGHT+IGUdt3KMjfnarURaNeP6WlX5nDMccMisIpvVAtRfZIXRm1ihWFRYUMZ6WRww+XZ0TQLt/UUU5X1wU/E7Un8bGY=
X-Received: by 2002:a17:90b:2ecd:b0:311:ef19:824d with SMTP id
 98e67ed59e1d1-31aadcb0f0emr20626562a91.2.1751889959009; Mon, 07 Jul 2025
 05:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704120604.2688934-1-matt@readmodwrite.com>
 <202507051300.E0JSHxu1-lkp@intel.com> <CANpmjNMU26CGN2zYvCYC9eFwfsgHW4U=DQs4sA8TTPte7RTrSg@mail.gmail.com>
In-Reply-To: <CANpmjNMU26CGN2zYvCYC9eFwfsgHW4U=DQs4sA8TTPte7RTrSg@mail.gmail.com>
From: Matt Fleming <matt@readmodwrite.com>
Date: Mon, 7 Jul 2025 13:05:47 +0100
X-Gm-Features: Ac12FXzyYmYk7YR7M3ps6gHcAJL7EYFN2ugE_j8ajeQSisU5-HpmQRqbIHrcaFw
Message-ID: <CAENh_STpgcdkwZiB2Zd-10QmnadnUBiMjOQPPFqaEVpYjrU4Zg@mail.gmail.com>
Subject: Re: [PATCH v2] stackdepot: Make max number of pools build-time configurable
To: Marco Elver <elver@google.com>
Cc: kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 7:40=E2=80=AFAM Marco Elver <elver@google.com> wrote=
:
>
> On Sat, 5 Jul 2025 at 08:01, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Matt,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on akpm-mm/mm-nonmm-unstable]
> > [also build test ERROR on linus/master v6.16-rc4 next-20250704]
> > [cannot apply to akpm-mm/mm-everything]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Fleming/sta=
ckdepot-Make-max-number-of-pools-build-time-configurable/20250704-200804
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
nonmm-unstable
> > patch link:    https://lore.kernel.org/r/20250704120604.2688934-1-matt%=
40readmodwrite.com
> > patch subject: [PATCH v2] stackdepot: Make max number of pools build-ti=
me configurable
> > config: arm64-randconfig-001-20250705 (https://download.01.org/0day-ci/=
archive/20250705/202507051300.E0JSHxu1-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 10.5.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250705/202507051300.E0JSHxu1-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507051300.E0JSHxu1-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/linux/init.h:5,
> >                     from include/linux/printk.h:6,
> >                     from include/asm-generic/bug.h:22,
> >                     from arch/arm64/include/asm/bug.h:26,
> >                     from include/linux/bug.h:5,
> >                     from include/linux/vfsdebug.h:5,
> >                     from include/linux/fs.h:5,
> >                     from include/linux/debugfs.h:15,
> >                     from lib/stackdepot.c:17:
> > >> include/linux/build_bug.h:78:41: error: static assertion failed: "DE=
POT_MAX_POOLS <=3D (1LL << (DEPOT_POOL_INDEX_BITS)) - 1"
> >       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr,=
 msg)
> >          |                                         ^~~~~~~~~~~~~~
> >    include/linux/build_bug.h:77:34: note: in expansion of macro '__stat=
ic_assert'
> >       77 | #define static_assert(expr, ...) __static_assert(expr, ##__V=
A_ARGS__, #expr)
> >          |                                  ^~~~~~~~~~~~~~~
> >    lib/stackdepot.c:42:1: note: in expansion of macro 'static_assert'
> >       42 | static_assert(DEPOT_MAX_POOLS <=3D (1LL << (DEPOT_POOL_INDEX=
_BITS)) - 1);
> >          | ^~~~~~~~~~~~~
>
> This is odd. The randconfig here uses the default:
>
> > CONFIG_STACKDEPOT_MAX_POOLS=3D8192

Ugh, I see what's happened here. For this config, the expression evaluates =
to

  static_assert(8192 <=3D 8191);

So the default needs to be 8191.
