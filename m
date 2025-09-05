Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980BC223DF6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 04:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047230; cv=none; b=JGqe5rZWCbMlaTpnlPpXNwshrObikvolkeHTfKi0wcKI+XbVwXBfAX5Ve4Hk+ZHSwj79B0TV0+a8piteYU1Br/TRiRWEh9RDH19AgouO2SblAoJxfBJgs6ZWppgzJTmai/P05ENhg7aTHBGVVm1u7bv0z+imUL/UPymQx+ftxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047230; c=relaxed/simple;
	bh=YcUlzkCjciQyQsyj+Ao9fuugAyHzxx8jpNjMWCaRaGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iblhkWPNHe8UKDfhZBGl9//m8hgySrTYC6+/dQ0H0spyRLicBxvk/HEWMpTZTmaDyz3Pq7FxuQuuj4XMYEVfpVLkdqN8LpG0hiQhZpwen1WnGV6MY9+jKGP8nk7juZvQiDBzq4HB1TGT5xoGCG5qFf5uaMVg4mzF5s7Us3I8jwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=usDsxDCd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="usDsxDCd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24cf5bcfb60so85515ad.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Sep 2025 21:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757047226; x=1757652026; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l72XkLM6JjDtnHZ/WxCVuCDCXtNUPwGl4oh1q9Ac3KM=;
        b=usDsxDCdJaxqkWus8pphF6pX98nVVvcyMUjMCKnxDcmIAZuShx9gC3+T7Fwhlu+cqH
         gUajfDXVkYKMegf4rZmOSI0QhYgGcW0XKdrRgVbaUpX0a8HQeFAh93VGl+GN8tr9iEL2
         LuLGOzg2BAgvBYSbqeL6x2DioLdpwwOpaaWtxFIy98EjKg6ZKfktMFOptGLwRdN9Qu5q
         hJgZbXWfrQnV3qLVngbgmnMPuQyUV73YffCigYRKJIYZkp+Sxyw9MaFY8bQ0DDZpLvrn
         BdT0Uq/2U2bWTgCM3GoqPWFgOXGTs1FWwFBQr+QEY1/tXVW/MZjfbenQMGmq9ssZ5ZQ3
         9hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047226; x=1757652026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l72XkLM6JjDtnHZ/WxCVuCDCXtNUPwGl4oh1q9Ac3KM=;
        b=ck0PrfpO+D/MfLxU5CeDjw8OMl0hnhpB3N7xMuBQT92e+zJEFKeAcCkDPOFAMiK1eP
         0Lg5Wri5SH9RPxnw1YWUkZEMhgJ+g0Sr1p3lR92I+9FBezTIFfXIEup1wTvEiyBxrKMc
         C4uq8AI/B5rzAp5i+E1E2YvLNmVvQKrzIP9xYecibL7OTIvua+3YsFeyIvNSjr/JaNhq
         q3bIdjBO6P0xN0ZCRy4SuS/4O2gu6iJNhxmZyLwGzIn98fi5O+ozy3/jktUgFZXt3Yg7
         41cTXcf5yJRU98p3hVQbF2oyLG6YxaAAoPGcNgmb9SI6grN2ZV3eCtiWkA53nWm1AouL
         Z/bw==
X-Gm-Message-State: AOJu0YxLpdDLGViexUaq1xxevwU7j0/K95iWGMohGpfwL4uyq0Rv5Dor
	duNesciZLPXdHkjmvAWSQhIr98xMjfVAPdGmvlT+/4311rUrPmVVNPGmGqBRkOkn9y+EBPs+X81
	0KNGtH2gfvNyPq9PQZXN9dO0h3Yrf9ATK8dR3my+H6rImunZPOKuZkoJF3WY=
X-Gm-Gg: ASbGnctVj1WxhnTRaA//K9JJ+AGDf7719DjlrKBp+Y0nE2eEChKeUXSw089ArOeX/xp
	bG7v8Po5FJHJU3Rbgi+zfWPCHo0FUpDtgPKwhTO+y+AwAdu4xQOoGdLcBAsEy61ob3IGf72Bmeb
	gmTN7iCturLyaXrEYQq6GipTsVeWQ+wwb9VX+bMwgTBK+KzZIQb7zS9PbgWoA6rjOTIPoeUtyci
	NvUu8mF/La9Suo=
X-Google-Smtp-Source: AGHT+IG4GpbmzoqZpV66rFDyfEIRKIwucqS2np5/dBU7tvVqgCnlPsA17XwuBma80HwvQ2Ar+OUdjj2g/6IDb/qcSTI=
X-Received: by 2002:a17:902:e887:b0:24c:1a94:e603 with SMTP id
 d9443c01a7336-24d387714c3mr1797165ad.1.1757047226055; Thu, 04 Sep 2025
 21:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509051042.7KOze0fZ-lkp@intel.com>
In-Reply-To: <202509051042.7KOze0fZ-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 4 Sep 2025 21:40:14 -0700
X-Gm-Features: Ac12FXxpq9vJBkVYQSEtNNhW4_CQv-jyodFDS2PeHj7bxexZ3zp36-cRo8FwKNY
Message-ID: <CAP-5=fVEp8UPS-B3X=66AwYbbbs8559AHEObpQZSVnSnVYSxhA@mail.gmail.com>
Subject: Re: [tip:timers/vdso 12/15] include/vdso/unaligned.h:23:9: warning:
 '__builtin_memcpy' reading 4 bytes from a region of size 1
To: kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 7:44=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timer=
s/vdso
> head:   e994a4197086cd5df809277b3b96c88f75e1e860
> commit: 34a1cbf21227f1327ead30dcf2a52aac79bf4f15 [12/15] vdso: Switch get=
/put_unaligned() from packed struct to memcpy()
> config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20250=
905/202509051042.7KOze0fZ-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250905/202509051042.7KOze0fZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509051042.7KOze0fZ-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/swab.h:5,
>                     from include/uapi/linux/byteorder/big_endian.h:14,
>                     from include/linux/byteorder/big_endian.h:5,
>                     from arch/parisc/include/uapi/asm/byteorder.h:5,
>                     from arch/parisc/include/asm/bitops.h:11,
>                     from include/linux/bitops.h:67,
>                     from include/linux/kernel.h:23,
>                     from arch/parisc/include/asm/bug.h:5,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:13,
>                     from include/linux/sched.h:14,
>                     from include/linux/uaccess.h:9,
>                     from arch/parisc/boot/compressed/misc.c:7:
>    In function 'get_unaligned_le32',
>        inlined from 'decompress_kernel' at arch/parisc/boot/compressed/mi=
sc.c:312:16:
> >> include/vdso/unaligned.h:23:9: warning: '__builtin_memcpy' reading 4 b=
ytes from a region of size 1 [-Wstringop-overread]
>       23 |         __builtin_memcpy(&__get_unaligned_val, (void *)(ptr), =
          \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>       24 |                          sizeof(__get_unaligned_val));        =
          \
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab=
32'
>      120 |         __fswab32(x))
>          |                   ^
>    include/linux/byteorder/generic.h:89:21: note: in expansion of macro '=
__le32_to_cpu'
>       89 | #define le32_to_cpu __le32_to_cpu
>          |                     ^~~~~~~~~~~~~
>    include/linux/unaligned.h:23:28: note: in expansion of macro '__get_un=
aligned_t'
>       23 |         return le32_to_cpu(__get_unaligned_t(__le32, p));
>          |                            ^~~~~~~~~~~~~~~~~
>    arch/parisc/boot/compressed/misc.c: In function 'decompress_kernel':
>    arch/parisc/boot/compressed/misc.c:29:13: note: source object 'output_=
len' of size 1
>       29 | extern char output_len;
>          |             ^~~~~~~~~~
>
>
> vim +/__builtin_memcpy +23 include/vdso/unaligned.h
>
>      6
>      7  /**
>      8   * __get_unaligned_t - read an unaligned value from memory.
>      9   * @type:       the type to load from the pointer.
>     10   * @ptr:        the pointer to load from.
>     11   *
>     12   * Use memcpy to affect an unaligned type sized load avoiding und=
efined behavior
>     13   * from approaches like type punning that require -fno-strict-ali=
asing in order
>     14   * to be correct. As type may be const, use __unqual_scalar_typeo=
f to map to a
>     15   * non-const type - you can't memcpy into a const type. The
>     16   * __get_unaligned_ctrl_type gives __unqual_scalar_typeof its req=
uired
>     17   * expression rather than type, a pointer is used to avoid warnin=
gs about mixing
>     18   * the use of 0 and NULL. The void* cast silences ubsan warnings.
>     19   */
>     20  #define __get_unaligned_t(type, ptr) ({                          =
       \
>     21          type *__get_unaligned_ctrl_type __always_unused =3D NULL;=
         \
>     22          __unqual_scalar_typeof(*__get_unaligned_ctrl_type) __get_=
unaligned_val; \
>   > 23          __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),    =
       \
>     24                           sizeof(__get_unaligned_val));           =
       \
>     25          __get_unaligned_val;                                     =
       \
>     26  })
>     27

Ugh. This is the same issue as discussed here:
https://lore.kernel.org/linux-parisc/CAP-5=3DfWXcGiWXeb8=3D165tCVtEAYX7qkVU=
panbpmg=3DDb=3DkwEP0g@mail.gmail.com/

I was failing to find the e-mail thread and thought maybe the issue
had been resolved. Anyway, I also came across commit  f6b5f1a56987
("compiler.h: Introduce absolute_pointer macro")
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/f6b5f1a56987de837f8e25cd560847106b8632a8?id=3Df6b5f1a56987de837f8e25cd56=
0847106b8632a8
which solves a similar -Werror=3Dstringop-overread. Could somebody on
the parisc side take a look?

Thanks,
Ian


> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
