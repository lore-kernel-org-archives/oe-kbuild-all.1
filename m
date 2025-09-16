Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B546330C61A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 12:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758026380; cv=none; b=axw31qJkhyXJO7K+LtQ2XCApRis0jtPgwgJlBEDiIsmBzQq8jukQz5bO68/mBY8Ssi4kpKhN6E0HDBUr0SF/uPgiHln+BU35Kd8QcRQ17hEURm3m6LscRvKLi9N9l19pB3vqQ7EGq1WheNnBlF3wqCPtm1i7RKe4s0coJbjIIpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758026380; c=relaxed/simple;
	bh=/nr/RV4+6Ya3JsPeMQRmLlubUZrACV5W6+rHLSzZCV8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=tCGZqmVhA/7u5Iv1GaPPx0rHheTZ5FoF/U0GvRjIGuw0/diFEj47ZvKokqXMBQl+TkQWZQT6Bc23qrFR8rzk90KYayfsxeN7DmsDLBfRwsziaIW1mzPq7f+bjYmpVoHGDE1jw02+wCw7OdbM3APnowrT3yaiK5tS6wMe+PyDdjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFcgkVlZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFcgkVlZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso39891935e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758026377; x=1758631177; darn=lists.linux.dev;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gt0ZwE2fkLuC8Rptt0cI2XAd8Dj/MEqvhQxNXmrCN3E=;
        b=mFcgkVlZEJBgeLStIr0uoeNxm7T4N804Sxkx+Wz2DCp0uKwLRu45EAbZ3AOEcfsNtN
         Fnhqze2NBcnzKZsmpyDbHhkRxndz2L0ZgcjaMRiLf20AcEYu3o5Tfq3W5FUX7ccp27uV
         HsyTscGQc3yOpM4JnbbpUrGv9gvSJuJ4MWbEMnFBRz7KGat44fy8MjGb4dJjPP7h091K
         4yHcyuMbez7M0djfvbPVzU5mb3mk+JzdVlh+L+Gk4lyB0UsliIMtHgUTLRo+2KrQwyUG
         sS2dWYcenXT3WWZq2v+2bcAYfzJJNaY7P4TTjGeh3v3NRqFiQ+93cR0xo+zQ1Y9KaByP
         PJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758026377; x=1758631177;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt0ZwE2fkLuC8Rptt0cI2XAd8Dj/MEqvhQxNXmrCN3E=;
        b=LQQhHQsqoz7ec/k/KvlFMiA8bgR1eyqrARHZ7IPLXp5LGNiMFO19ywjZU0yC9/v3yg
         gufh2s4Om7eptr66s73lo5CISMu4o9V7kPDRSdj7Dnjq+LuSF2xvJeRT3xI3bUCLn2IC
         lfQWGMQSp9xI/sZGjwsQN1CVjd/ThRKeCVT72ChoiuemFUeQi47k6lM2pKAAolWOpLex
         I2kipMI1Gq732CKFvCUlvcW81/jY7cq/4ROoU7yauBRL6PzkHkuLdhZGot8oLM29xDHr
         iLQ0Re+gIX9Q6zIcW2nRbW5HtJs5fTm1NrOUoYr4NX4aS6VoLO/9bpNODA6lKqq8F1WZ
         zprA==
X-Forwarded-Encrypted: i=1; AJvYcCVA3U4wLTV/XCHHsI66gPMWZNwqcIXKXjWD5nQV61eJlM5RTXDBxAm3xu6EHDlN4bY4tbFQRy/keTCoHkP4@lists.linux.dev
X-Gm-Message-State: AOJu0YzbsUAjTsYJctMrJrzH+oNjZJUw4uRnmKoOG9Mi4cvL9C2eWadw
	HQNOsgCZ78DHMTvV15mlT2uf+Q3KbP9+EPGH43vQ94/8aEP52ZLgkJqh
X-Gm-Gg: ASbGncs5k6Ka1GKmbJK2aHvTgCcUiZNmoHqNb3XfCE6ZbXBZIYkaqbl99YiGmhxFcS7
	AO6nbM/Gi6G/a3D0I4LI8E/LZ5fvKu+58o11CyKeYKzwR6+F2XCMIsC3eIdMWgb/L8qF442GW4E
	9JO0FxYn3kkFlLXant6z/OY8Pwn+eA7g1fu2uN7J8ECQ2avkegbO4KJT8FvHKoyMmPqT5sOYlLI
	XQ+PPHakVca08nOkvtYVNW1m3Awe7PmE78xa0JWMEwvvUnD8qkb4MDNAYy5IegmD3PMvCF/Atzo
	7N/1ddO4f/2szm0n0J7x6rl5JPXuN6i+IOK7zj2Nne/DXZ/f4V6PvtVJ8KR8jfFE6zQqTmC/rEh
	XSxr42OdcH6oJiYQIqNQWC0A6Sy8=
X-Google-Smtp-Source: AGHT+IEDyzCIO/ZrWzZXXRqUqdpxBC3NkftkP3PMQ8QxO7unshVAe8c94K1S3RCZ/wnrdlM3sihzmg==
X-Received: by 2002:a05:600c:a4b:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-45f211c856dmr165318615e9.5.1758026376551;
        Tue, 16 Sep 2025 05:39:36 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e81dbf9acdsm14817927f8f.55.2025.09.16.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 05:39:35 -0700 (PDT)
Message-ID: <68c95a87.050a0220.362e95.5aa5@mx.google.com>
X-Google-Original-Message-ID: <877bxylgft.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-riscv@lists.infradead.org,  oe-kbuild-all@lists.linux.dev,
  linux-kernel@vger.kernel.org,  pjw@kernel.org,  palmer@dabbelt.com,
  alex@ghiti.fr,  wangyuli@uniontech.com,  chenhuacai@kernel.org
Subject: Re: [PATCH] riscv: kgdb: Prefer strscpy instead of strcpy
In-Reply-To: <202509161619.eJeLbfU0-lkp@intel.com> (kernel test robot's
	message of "Tue, 16 Sep 2025 17:10:50 +0800")
References: <20250915200644.200498-1-mikisabate@gmail.com>
	<202509161619.eJeLbfU0-lkp@intel.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 16 Sep 2025 14:39:34 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Hello,

kernel test robot @ 2025-09-16 17:10 +08:

> Hi Miquel,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.17-rc6 next-20250915]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Sabat-Sol/riscv-kgdb-Prefer-strscpy-instead-of-strcpy/20250916-040750
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250915200644.200498-1-mikisabate%40gmail.com
> patch subject: [PATCH] riscv: kgdb: Prefer strscpy instead of strcpy
> config: riscv-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161619.eJeLbfU0-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161619.eJeLbfU0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509161619.eJeLbfU0-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/ptrace.h:5,
>                     from arch/riscv/kernel/kgdb.c:6:
>    arch/riscv/kernel/kgdb.c: In function 'kgdb_arch_handle_qxfer_pkt':
>>> include/linux/compiler.h:197:67: error: static assertion failed: "must be array"
>      197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>          |                                                                   ^~~~~~~~~~~~~~
>    include/linux/compiler.h:202:28: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>      202 | #define __must_be_array(a) __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/string.h:80:40: note: in expansion of macro '__must_be_array'
>       80 |  sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) + \
>          |                                        ^~~~~~~~~~~~~~~
>    include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
>       25 | #define __CONCAT(a, b) a ## b
>          |                        ^
>    include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
>       26 | #define CONCATENATE(a, b) __CONCAT(a, b)
>          |                           ^~~~~~~~
>    include/linux/string.h:114:2: note: in expansion of macro 'CONCATENATE'
>      114 |  CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
>          |  ^~~~~~~~~~~
>    arch/riscv/kernel/kgdb.c:268:3: note: in expansion of macro 'strscpy'
>      268 |   strscpy(remcom_out_buffer, riscv_gdb_stub_target_desc);
>          |   ^~~~~~~
>>> include/linux/compiler.h:197:67: error: static assertion failed: "must be array"
>      197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>          |                                                                   ^~~~~~~~~~~~~~
>    include/linux/compiler.h:202:28: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>      202 | #define __must_be_array(a) __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/string.h:80:40: note: in expansion of macro '__must_be_array'
>       80 |  sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) + \
>          |                                        ^~~~~~~~~~~~~~~
>    include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
>       25 | #define __CONCAT(a, b) a ## b
>          |                        ^
>    include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
>       26 | #define CONCATENATE(a, b) __CONCAT(a, b)
>          |                           ^~~~~~~~
>    include/linux/string.h:114:2: note: in expansion of macro 'CONCATENATE'
>      114 |  CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
>          |  ^~~~~~~~~~~
>    arch/riscv/kernel/kgdb.c:271:3: note: in expansion of macro 'strscpy'
>      271 |   strscpy(remcom_out_buffer, riscv_gdb_stub_cpuxml);
>          |   ^~~~~~~
>
>
> vim +197 include/linux/compiler.h
>
> 230fa253df6352 Christian Borntraeger 2014-11-25  193
> cb7380de9e4cbc Kees Cook             2025-02-05  194  #ifdef __CHECKER__
> 243c90e917f5cf Vincent Mailhol       2025-03-29  195  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) (0)
> cb7380de9e4cbc Kees Cook             2025-02-05  196  #else /* __CHECKER__ */
> 243c90e917f5cf Vincent Mailhol       2025-03-29 @197  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
> cb7380de9e4cbc Kees Cook             2025-02-05  198  #endif /* __CHECKER__ */
> cb7380de9e4cbc Kees Cook             2025-02-05  199

I was testing on the RISC-V tree, but I should've definitely tested this
on 'next' instead to catch this compiler error.

Since this is not too important, feel free to drop this patch.

Sorry for the noise,
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJlBAEBCgBPFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmjJWoYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyFRxtaWtpc2FiYXRlQGdtYWlsLmNvbQAKCRCWvoxv
2J1lZeTYD/9XO7FVYKCzIaCQhLxyHR3kNYkwsvWUl/OCr1dbInnW87CuFXOKZGY1
Skj7F1e8SQXoDWit5UvL7+C8MSH9KOxAmA4H5GFtQ2N/Y4cQlTgi5IjrxeWG42iy
NTG5FMkVxgVNh1QUJzwiz1RcC9HwVzsKPy0IcyaEoMcJ15bIjItWi4Q7ntyU+U+L
4yY+GWc5E/8li+RPDGW32eVvfejgwhJfdhrimINRHxfqcJdwVbmsj1hDgqecQP7+
w5xzHvcj8m/WP/tlJhGw0ed8NE3SQyIrTj23dr4aOD7XI2pOTyDHp2zRJgIDu5mA
zNzZ3PbesW7PwRKWmjCDnrYVgZolnZnjMvYTnfxfLQMLNaa7bCYPmf4j2BYrO2sV
XpYvqDM6vkL6fyrfnIpSnfeu603H90/jJPGRFgLUIpSJYumzu40XRlNVyvDGolSq
btqPneJ7XFKqHFDd3TsUqk//XQseTxGUFWh+ol27SYaGLxP/Y2iAMM5AaFCry7Rs
nVLtOAjPKfu0Nwopjn7FmLcwGG3QDEym4Pr9pxVSdThPLVxPlbGWZNk6reyiL8o5
JcgyiMFHI/u1PCgEsqJbur1uSzoQOEj4nYPBuVAZq0hYG92B7wpUUcFuxKlAtGmD
X3ys2ZjYEENYy/rcU/mU+6XeUjhVDCZ0Fkrn+NUBzuiMnmcwzvthwQ==
=KjrK
-----END PGP SIGNATURE-----
--=-=-=--
