Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901D2279DCC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751870410; cv=none; b=ssg4MklXBwkD6Tm4hi7QXOn//xMFpYuNHIEUco4VKW2abm3iYFeJyhvwpJtAoQb1LrTelpMII+WegU+IWxCoVIOZm3ANYAmxkn+YpdgmseKIaEntgS2SP+ZLX14HBZmx4yoWVEB764UQwwikFEwtLulQwzprm2lAjQXAvCUSHo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751870410; c=relaxed/simple;
	bh=h5qe5wP5akorexOjbomxqoKsYJPNUhpTj+jDDh/DP5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHNQHeIttojKjKlhFdkhF4uZkJwmkJuVhStzVGtcdim9buS3FUB8LcudA7N8biZyfDlXZkXwZZsLFS8MYaVgmjLF08mG2BTp8dluHO+DvjnscxZH/XlTgYpg9M3bAZucrp07M4vZpnFkjhh5Yyx5fzu2MRb1zjddJhjLTPfF/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DPGN8uDr; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DPGN8uDr"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso2187609a91.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 06 Jul 2025 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751870408; x=1752475208; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QJhAGJ9tmMlIKcB16GBcz6X9yl3DYiY3sfL1qtRWK70=;
        b=DPGN8uDrUjBJk3uco84DnjaxkGS9TzuEtFgvKaSyzcBcTqhibZ61RuSavmwUohTImR
         mfNr/eOdxEvuNOP4qIrOkwfuICn/qm8OD4ma3TRL+/IT6DndVcDMFII236BtD5IL/5OY
         ED1bhfMHuNpNaTQuZ8xSjg/h7OMWF5lcQQOxxzxDe/0vIdUIC+ViDGlchO8UNdK9VHnx
         JF0vhUG6ekl5qr2+8gIUz36m6bk/Le3WfexpPIAsswgLJ1dlMv4/Gy8SzvL+bWprZ1IC
         TupJYMM5FZ4WgY8SQpEXWMayWKuyGa+zPMa0aJn0Iauh3Zn+QdY2yBeeas329G7y258n
         izjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751870408; x=1752475208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJhAGJ9tmMlIKcB16GBcz6X9yl3DYiY3sfL1qtRWK70=;
        b=ovBd8eLNiCt8uw3X8ulO6Vx+KmCbjL0urSfAamc7D8xUOJ8QVa8OT4MfE7kq/Pp6Zh
         0LkIunLsPLr0DTaPDzI3sG72A4fhIi+de749vg0IxeeTJgGOznzyuvXI0gBES8JBIawD
         HEJ4pbS84DEL6RVENy/ocRb7EW+JR8/E6tJD0/rl2qyMIWTvt1jH/MX8hhVy0dKv7AY4
         lsxFtH+XmftBFMIzH3/cyW6o4U7vcCB6C5hmTZo3Ot6WVfuWKpnexP0H8OlMjXaMxyTV
         NrvFdukezs5GnUpLQe1ELiydTKqPzcxwLBWnVLvs5BZx2L34O0HO8StzMfJ3UnnP5/YI
         w7eg==
X-Forwarded-Encrypted: i=1; AJvYcCUyA8RPkoz20xjA7yTaO4phjhRBi64ujhcYLW9IoGht0La6l21eF33QZtLY/DgK3JHtkKQSLch+HdsVTKoH@lists.linux.dev
X-Gm-Message-State: AOJu0YyB0fRnQFpTz88Dyz+X4W0rEJTOWc68OIzyjYaAtm/Giu/9Ltmo
	Eu8reIHKPMoD41kM/XRCz9Stt/CxrtKG7nOI+M0WtM71ScQ1jhgj/PpjLq95YjG7Qi820gRp1Lm
	nKTiyS0H0PHRve8y5DLSb36Uzarf6XUA6eYMh4cJZ
X-Gm-Gg: ASbGncssamYoYZLaEoVBwrgdHErkS1g3dmPOnQoys9akSK4E01hfERgrF03xMIPnHHe
	eRUQNuRgsWk7C9uBzapv9w8g+KxmNXbd1IZnhQnBlhtoy8CPDpSajELn6RSQzK4RMXjbaSBIOFF
	Hs5OzYX9nkt5NQ/g4ByDdGqFx6qiMir9tTaIHmtLeOc1Ts5TOArpX0pGQt0hOmsrTfyR2hjE1L7
	0qDT64yNvkT
X-Google-Smtp-Source: AGHT+IH2JrxplFpTRlsOFUQX9GNs+cq+uKVtxro6hLk8JyoR/xG6hab4OA8rIVs7DpqX2HYTroPSbhWqeS49OTgpLTk=
X-Received: by 2002:a17:90b:3fcd:b0:311:df4b:4b82 with SMTP id
 98e67ed59e1d1-31aadcf7c3amr15462676a91.4.1751870407541; Sun, 06 Jul 2025
 23:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704120604.2688934-1-matt@readmodwrite.com> <202507051300.E0JSHxu1-lkp@intel.com>
In-Reply-To: <202507051300.E0JSHxu1-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Mon, 7 Jul 2025 08:39:30 +0200
X-Gm-Features: Ac12FXz542X-7N20muK4y55Qaq43ij6l3VZo-CTwD1D1GBG89fL4Qb0H3409Eco
Message-ID: <CANpmjNMU26CGN2zYvCYC9eFwfsgHW4U=DQs4sA8TTPte7RTrSg@mail.gmail.com>
Subject: Re: [PATCH v2] stackdepot: Make max number of pools build-time configurable
To: kernel test robot <lkp@intel.com>
Cc: Matt Fleming <matt@readmodwrite.com>, Andrew Morton <akpm@linux-foundation.org>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Jul 2025 at 08:01, kernel test robot <lkp@intel.com> wrote:
>
> Hi Matt,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-nonmm-unstable]
> [also build test ERROR on linus/master v6.16-rc4 next-20250704]
> [cannot apply to akpm-mm/mm-everything]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Fleming/stackdepot-Make-max-number-of-pools-build-time-configurable/20250704-200804
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> patch link:    https://lore.kernel.org/r/20250704120604.2688934-1-matt%40readmodwrite.com
> patch subject: [PATCH v2] stackdepot: Make max number of pools build-time configurable
> config: arm64-randconfig-001-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051300.E0JSHxu1-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051300.E0JSHxu1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507051300.E0JSHxu1-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/init.h:5,
>                     from include/linux/printk.h:6,
>                     from include/asm-generic/bug.h:22,
>                     from arch/arm64/include/asm/bug.h:26,
>                     from include/linux/bug.h:5,
>                     from include/linux/vfsdebug.h:5,
>                     from include/linux/fs.h:5,
>                     from include/linux/debugfs.h:15,
>                     from lib/stackdepot.c:17:
> >> include/linux/build_bug.h:78:41: error: static assertion failed: "DEPOT_MAX_POOLS <= (1LL << (DEPOT_POOL_INDEX_BITS)) - 1"
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>          |                                         ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    lib/stackdepot.c:42:1: note: in expansion of macro 'static_assert'
>       42 | static_assert(DEPOT_MAX_POOLS <= (1LL << (DEPOT_POOL_INDEX_BITS)) - 1);
>          | ^~~~~~~~~~~~~

This is odd. The randconfig here uses the default:

> CONFIG_STACKDEPOT_MAX_POOLS=8192
