Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944091E520C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 05:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753766279; cv=none; b=ilRz71rpjgE1EDemkTjsNpe+gjbNk9kPqM48RJK+cVJHaQa8sM0DI/XyrWxnx/mkEQZvLXitjBwLilpqJV7ZD5YFfJ9vR+65P725xnYD9Wa21Jmjkj743/RLMnX5Mbr7zPIK96ZA4oM2K7yAyXaIaaGN9L9AyWNUwgvosXClxY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753766279; c=relaxed/simple;
	bh=2gSif4Ol1hRx/eCIuAePTZVU183EK+rILuvdarsNlr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8N0CcaoNHKxx1ycnw7NAS4kkNL56ZeQgJlnXcB9GYP7S27UYDGm9qFFNUYbzohf3gGIdP/pXZ9QmTGNK+N9R3lznzwWFsu7S3RbFP9+qhHH7ij8b3ThpBc6hAU/jdMSI4UT3qhXBFIgIvr8cbFaT5QLipSzdLDWWNlDrUxYcL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lsrz60X5; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lsrz60X5"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31ecd1f0e71so2250374a91.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 22:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753766276; x=1754371076; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UWn8kN4Zswuo3r3NmW934i71f3n23BKXr6ubPDUeJDo=;
        b=Lsrz60X5DejbryazcKDd/RPxazgqjRuHFkeSX7oItPy0wxBPZ1j5jiSc9dZKSVlXCN
         rOAJx9q+ICX0RVgqLmMevIPQZKMtbOY6wCwc/MRbxDq/7j9y33vwzCxbMotB2YZwXSuh
         lkCvnpIOYJ3Wa1lhQf85O/2TGEbOn3qXxiKg8hKfa/yJRkH/fXvQE7zfjP/e/AzbhJ+E
         8NcOfRzk71CMU/71tZru8iF698IgMXzbyjtPjEkk4LeJAeb3eCq8b31G6RXBkFFh777W
         2bBkougBiNQx5Z1715LI6Te413ibw6nZA5Y8M4ec7KDJZOrDYOcYG3el/DBigkua9NW8
         iazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753766276; x=1754371076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWn8kN4Zswuo3r3NmW934i71f3n23BKXr6ubPDUeJDo=;
        b=MO6S4vj6ISM6+1qV7XB8WDCbKGfg+cczzVNZXb+aIajK/PrGf3vKshP/1BaEPCQCPa
         nbBVbZigXxjZWqjzJuuADOqnYrvzQ/hSRBHcR86IIoVswaJlli9Nev7iUyHO0PnKVmDg
         IxFy6IQLlpvl1E0YHTkKilNdQcc/tfdRwCNSPXe1VY7Ls+3VmuUU85rLdKxYher5UBnx
         cX76wm6YTJth+BanI1XumN7OS9rOkvBDBb+mJro/lneDSt0HTyH+9zR9CPYEUIJVKN/f
         mgKawnUZLPm+qPdXVbjheuuV+3I7wm0sxt1ur6syygo1HqxHsrcw6nCGeVoV6nfcnwcG
         aB4A==
X-Forwarded-Encrypted: i=1; AJvYcCUfSavTnBMBMPwsYPr8sznds/WieC6oycSbjlrW0q5ehUxM8+yZKli2hVRV9es/LvwGxyQYeVx9Ew8Pfnxh@lists.linux.dev
X-Gm-Message-State: AOJu0YzPKNcrgpHDPzKO8DhjlfF4AQcTkpjKwAkj1DEhEt5wRw1d/dMK
	WROPiJMJYkh1zUZWfC5a7VJVqJwhcsFXjifYwmVov85KcKaSPaYJYHCs/FUz1nQZI1UlzzHPocP
	Ml/4kdDP21cD4VNuLrUnSVibAUCyIQq0=
X-Gm-Gg: ASbGncvzCRbU7OY2a2ldFsunh9lRd1TMsSB9fk7H2LrpTdGXpzELwKakfSKcSdr5QUr
	3SzCZlpx+6HcT1wiJ6bKGNpEQcMlm8K2LV0W3q0RL05EI+InN0C6EB0R7H1tIYQRKzuwPyiGIdu
	JGpq8rVSgQ+RuYvXV5fpsY4eWKOHm+qhCgO95nlOC1YtTTIA6edkbwqGDSGL6cH7Zv3C5hFQT2O
	2dAbfA2+1pa2W022EMLHG5Ap1ZOArUVEbetbVZu
X-Google-Smtp-Source: AGHT+IG0ir+iZbV5U27/sNzPDiI4p0oJqO69g1+EIiXJLI9UM1BlvxSeepQq8Tl08j/2CW7RHRLTgvtiAwrTmDR7Zfw=
X-Received: by 2002:a17:90b:5623:b0:311:c1ec:7d12 with SMTP id
 98e67ed59e1d1-31e77afe58fmr19429769a91.23.1753766275330; Mon, 28 Jul 2025
 22:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250728104327.48469-1-jogidishank503@gmail.com> <202507290502.vaOga5pZ-lkp@intel.com>
In-Reply-To: <202507290502.vaOga5pZ-lkp@intel.com>
From: Jogi Dishank <jogidishank503@gmail.com>
Date: Tue, 29 Jul 2025 10:47:45 +0530
X-Gm-Features: Ac12FXzuOlVn_e5uHuOChCKXIpMYTtiVdEcNzTbMzngjtcgM8K1QtQdZI6n47W0
Message-ID: <CADorM-_PZd-_2g9EWy4V4RCLS7xp9MOZs0k5GNrbB7FOwSB+tA@mail.gmail.com>
Subject: Re: [PATCH] kcsan: clean up redundant empty macro arguments in atomic ops.
To: kernel test robot <lkp@intel.com>
Cc: elver@google.com, oe-kbuild-all@lists.linux.dev, dvyukov@google.com, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	rathod.darshan.0896@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

Please disregard this patch. I would like to formally withdraw this patch

Sorry for the noise.

Thanks.
Dishank Jogi

On Tue, 29 Jul 2025 at 03:14, kernel test robot <lkp@intel.com> wrote:
>
> Hi Dishank,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.16 next-20250728]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Dishank-Jogi/kcsan-clean-up-redundant-empty-macro-arguments-in-atomic-ops/20250728-184659
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250728104327.48469-1-jogidishank503%40gmail.com
> patch subject: [PATCH] kcsan: clean up redundant empty macro arguments in atomic ops.
> config: x86_64-buildonly-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507290502.vaOga5pZ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507290502.vaOga5pZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507290502.vaOga5pZ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1260:9: warning: data definition has no type or storage class
>     1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> kernel/kcsan/core.c:1260:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1261:9: warning: data definition has no type or storage class
>     1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1261:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1262:9: warning: data definition has no type or storage class
>     1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1262:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1263:9: warning: data definition has no type or storage class
>     1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1263:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1264:9: warning: data definition has no type or storage class
>     1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1264:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1265:9: warning: data definition has no type or storage class
>     1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1265:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1270 | DEFINE_TSAN_ATOMIC_OPS(8);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1260:9: warning: data definition has no type or storage class
>     1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> kernel/kcsan/core.c:1260:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1261:9: warning: data definition has no type or storage class
>     1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1261:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1262:9: warning: data definition has no type or storage class
>     1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1262:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1263:9: warning: data definition has no type or storage class
>     1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1263:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1264:9: warning: data definition has no type or storage class
>     1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1264:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1265:9: warning: data definition has no type or storage class
>     1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1265:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1271 | DEFINE_TSAN_ATOMIC_OPS(16);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1260:9: warning: data definition has no type or storage class
>     1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> kernel/kcsan/core.c:1260:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1261:9: warning: data definition has no type or storage class
>     1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1261:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1262:9: warning: data definition has no type or storage class
>     1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1262:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1263:9: warning: data definition has no type or storage class
>     1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1263:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1264:9: warning: data definition has no type or storage class
>     1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1264:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1265:9: warning: data definition has no type or storage class
>     1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1265:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1272 | DEFINE_TSAN_ATOMIC_OPS(32);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1260:9: warning: data definition has no type or storage class
>     1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> kernel/kcsan/core.c:1260:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1261:9: warning: data definition has no type or storage class
>     1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1261:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1262:9: warning: data definition has no type or storage class
>     1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1262:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1263:9: warning: data definition has no type or storage class
>     1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1263:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1264:9: warning: data definition has no type or storage class
>     1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1264:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
>     1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
>          |
>    kernel/kcsan/core.c:1265:9: warning: data definition has no type or storage class
>     1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1265:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
>     1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
>     1274 | DEFINE_TSAN_ATOMIC_OPS(64);
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>
>
> vim +/DEFINE_TSAN_ATOMIC_RMW +1270 kernel/kcsan/core.c
>
> 0b8b0830ac1419 Marco Elver      2021-11-30  1169
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1170  #define DEFINE_TSAN_ATOMIC_LOAD_STORE(bits)                                                        \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1171        u##bits __tsan_atomic##bits##_load(const u##bits *ptr, int memorder);                      \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1172        u##bits __tsan_atomic##bits##_load(const u##bits *ptr, int memorder)                       \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1173        {                                                                                          \
> 0b8b0830ac1419 Marco Elver      2021-11-30  1174                kcsan_atomic_builtin_memorder(memorder);                                           \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1175                if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
> 55a55fec5015b3 Marco Elver      2021-08-09  1176                        check_access(ptr, bits / BITS_PER_BYTE, KCSAN_ACCESS_ATOMIC, _RET_IP_);    \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1177                }                                                                                  \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1178                return __atomic_load_n(ptr, memorder);                                             \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1179        }                                                                                          \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1180        EXPORT_SYMBOL(__tsan_atomic##bits##_load);                                                 \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1181        void __tsan_atomic##bits##_store(u##bits *ptr, u##bits v, int memorder);                   \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1182        void __tsan_atomic##bits##_store(u##bits *ptr, u##bits v, int memorder)                    \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1183        {                                                                                          \
> 0b8b0830ac1419 Marco Elver      2021-11-30  1184                kcsan_atomic_builtin_memorder(memorder);                                           \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1185                if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1186                        check_access(ptr, bits / BITS_PER_BYTE,                                    \
> 55a55fec5015b3 Marco Elver      2021-08-09  1187                                     KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC, _RET_IP_);          \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1188                }                                                                                  \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1189                __atomic_store_n(ptr, v, memorder);                                                \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1190        }                                                                                          \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1191        EXPORT_SYMBOL(__tsan_atomic##bits##_store)
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1192
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1193  #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1194        u##bits __tsan_atomic##bits##_##op(u##bits *ptr, u##bits v, int memorder);                 \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1195        u##bits __tsan_atomic##bits##_##op(u##bits *ptr, u##bits v, int memorder)                  \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1196        {                                                                                          \
> 0b8b0830ac1419 Marco Elver      2021-11-30  1197                kcsan_atomic_builtin_memorder(memorder);                                           \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1198                if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
> 14e2ac8de0f91f Marco Elver      2020-07-24  1199                        check_access(ptr, bits / BITS_PER_BYTE,                                    \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1200                                     KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE |                  \
> 55a55fec5015b3 Marco Elver      2021-08-09  1201                                             KCSAN_ACCESS_ATOMIC, _RET_IP_);                       \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1202                }                                                                                  \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1203                return __atomic_##op##suffix(ptr, v, memorder);                                    \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1204        }                                                                                          \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1205        EXPORT_SYMBOL(__tsan_atomic##bits##_##op)
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1206
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1207  /*
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1208   * Note: CAS operations are always classified as write, even in case they
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1209   * fail. We cannot perform check_access() after a write, as it might lead to
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1210   * false positives, in cases such as:
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1211   *
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1212   *    T0: __atomic_compare_exchange_n(&p->flag, &old, 1, ...)
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1213   *
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1214   *    T1: if (__atomic_load_n(&p->flag, ...)) {
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1215   *            modify *p;
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1216   *            p->flag = 0;
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1217   *        }
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1218   *
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1219   * The only downside is that, if there are 3 threads, with one CAS that
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1220   * succeeds, another CAS that fails, and an unmarked racing operation, we may
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1221   * point at the wrong CAS as the source of the race. However, if we assume that
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1222   * all CAS can succeed in some other execution, the data race is still valid.
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1223   */
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1224  #define DEFINE_TSAN_ATOMIC_CMPXCHG(bits, strength, weak)                                           \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1225        int __tsan_atomic##bits##_compare_exchange_##strength(u##bits *ptr, u##bits *exp,          \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1226                                                              u##bits val, int mo, int fail_mo);   \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1227        int __tsan_atomic##bits##_compare_exchange_##strength(u##bits *ptr, u##bits *exp,          \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1228                                                              u##bits val, int mo, int fail_mo)    \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1229        {                                                                                          \
> 0b8b0830ac1419 Marco Elver      2021-11-30  1230                kcsan_atomic_builtin_memorder(mo);                                                 \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1231                if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
> 14e2ac8de0f91f Marco Elver      2020-07-24  1232                        check_access(ptr, bits / BITS_PER_BYTE,                                    \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1233                                     KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE |                  \
> 55a55fec5015b3 Marco Elver      2021-08-09  1234                                             KCSAN_ACCESS_ATOMIC, _RET_IP_);                       \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1235                }                                                                                  \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1236                return __atomic_compare_exchange_n(ptr, exp, val, weak, mo, fail_mo);              \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1237        }                                                                                          \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1238        EXPORT_SYMBOL(__tsan_atomic##bits##_compare_exchange_##strength)
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1239
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1240  #define DEFINE_TSAN_ATOMIC_CMPXCHG_VAL(bits)                                                       \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1241        u##bits __tsan_atomic##bits##_compare_exchange_val(u##bits *ptr, u##bits exp, u##bits val, \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1242                                                           int mo, int fail_mo);                   \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1243        u##bits __tsan_atomic##bits##_compare_exchange_val(u##bits *ptr, u##bits exp, u##bits val, \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1244                                                           int mo, int fail_mo)                    \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1245        {                                                                                          \
> 0b8b0830ac1419 Marco Elver      2021-11-30  1246                kcsan_atomic_builtin_memorder(mo);                                                 \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1247                if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
> 14e2ac8de0f91f Marco Elver      2020-07-24  1248                        check_access(ptr, bits / BITS_PER_BYTE,                                    \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1249                                     KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE |                  \
> 55a55fec5015b3 Marco Elver      2021-08-09  1250                                             KCSAN_ACCESS_ATOMIC, _RET_IP_);                       \
> 9d1335cc1e97cc Marco Elver      2020-07-24  1251                }                                                                                  \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1252                __atomic_compare_exchange_n(ptr, &exp, val, 0, mo, fail_mo);                       \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1253                return exp;                                                                        \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1254        }                                                                                          \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1255        EXPORT_SYMBOL(__tsan_atomic##bits##_compare_exchange_val)
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1256
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1257  #define DEFINE_TSAN_ATOMIC_OPS(bits)                                                               \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1258        DEFINE_TSAN_ATOMIC_LOAD_STORE(bits);                                                       \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1259        DEFINE_TSAN_ATOMIC_RMW(exchange, bits, _n);                                                \
> c843b93f690ae6 Dishank Jogi     2025-07-28 @1260        DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
> c843b93f690ae6 Dishank Jogi     2025-07-28  1261        DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
> c843b93f690ae6 Dishank Jogi     2025-07-28  1262        DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
> c843b93f690ae6 Dishank Jogi     2025-07-28  1263        DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
> c843b93f690ae6 Dishank Jogi     2025-07-28  1264        DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
> c843b93f690ae6 Dishank Jogi     2025-07-28  1265        DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1266        DEFINE_TSAN_ATOMIC_CMPXCHG(bits, strong, 0);                                               \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1267        DEFINE_TSAN_ATOMIC_CMPXCHG(bits, weak, 1);                                                 \
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1268        DEFINE_TSAN_ATOMIC_CMPXCHG_VAL(bits)
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1269
> 0f8ad5f2e93425 Marco Elver      2020-07-03 @1270  DEFINE_TSAN_ATOMIC_OPS(8);
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1271  DEFINE_TSAN_ATOMIC_OPS(16);
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1272  DEFINE_TSAN_ATOMIC_OPS(32);
> 353e7300a1db92 Christophe Leroy 2023-05-12  1273  #ifdef CONFIG_64BIT
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1274  DEFINE_TSAN_ATOMIC_OPS(64);
> 353e7300a1db92 Christophe Leroy 2023-05-12  1275  #endif
> 0f8ad5f2e93425 Marco Elver      2020-07-03  1276
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
