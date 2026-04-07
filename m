Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767CF348898
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 05:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775538775; cv=pass; b=EjsPDyhZsswfe6k/zhGirUdhP0cA6Mbp97gkxIO/t5g8dD8l1F0SnT2T/VnSGL7dv17p6y5TohWu7A/Q/wkx1lGZiCBG7IGaTbBmW1Mtzuy2VbpYbfGG4H0cbRf7BFzvHdaYDoWB/Xr/lyIaxiC0tnjEwfCv1pCK3Hso6aU1uO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775538775; c=relaxed/simple;
	bh=/tAeAVFfLa3BAJdaw8XFGiTq1kAgqBc+qqoSggDEA+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TsHdqkZe50yoQCF3dDPuG13QZaltXX95mRIIKPPHyKZRRdjNJdxw/5mpuev+ZwUJWr0TaftyB8MEIdM9Y4uDyacUo5kqxH64DfxGKgch/nlpinIf/nalO9jw3Wcm69l4LmtCRcERCbXc2drJtyZsWOPoVtk/7siNIuFuYFlpYr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dc/UoGKa; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dc/UoGKa"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b2591757fbso346725ad.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Apr 2026 22:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775538774; cv=none;
        d=google.com; s=arc-20240605;
        b=iDuOS0O0CojXxyxP38iKoVdETlvUBf8In9vew80N4L3Lo5Dg+fZxielp8FWlGe8Mje
         6oW7PEgNBbbx2WsJ/0sofAkRrAisDFuPOYiQzngVmuxT7UVqfBvqPWxqx1o8TBXwx5QJ
         MU8lEzUkH6Jpz4XIXhMRjOUARpFVIHZ6yxUxjydXxz37v7vUJdQa/jme/TkRw6qoNY4B
         cJb7nR77nSoJTQYQn4FoZ2Z91wLIMosGev2tWCzInc5IfssYNSdTUDWqoLlwv1gKjcCQ
         JShLv2oiXYaLtpGaM0ZfLdWGMyleWGJGVMUez+3JHhvqQn3kWPDVdkXNjTWhY34Y1S+K
         Q0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xP9Cc2QEXzoralI8Q3/pv4kXEl+6Bhb4StE3Cccy/K8=;
        fh=Vhp424LqTaE6Bp7QpTiiM8dCIvAKgo61Zf4PPdq1yYk=;
        b=AIk9k1svMqfX3GXg88uH8Pxmznv1Aw3nTdEy0SfdNgSja8C2E+uQSS/dLNNOklGnVC
         9P9aZYFDUQBpAYSd73jrC/IyIP8kIVTGjtKFxtwK9rb+9BTW+wxFvjM43/9jyWLo0lkU
         AiZ8p2QNtqFT8CQKiIV2OzZwhiFjAWQkKzzofIlgSNdF91dja/Mb5InAFyci+1guNNT6
         t0dLvQTHdGhjEtIv8GZhaY9jzDCvrDg1KjZVJcu3csszJeAG/bKyK9iOS+AmR40ekYtx
         V92GCmWLVgyB3phTgaAyAgsDSJI2fwwcp3g31P4gBtqdQNWfyy+NYAFK1oxndq4jboeK
         Mvgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775538774; x=1776143574; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP9Cc2QEXzoralI8Q3/pv4kXEl+6Bhb4StE3Cccy/K8=;
        b=Dc/UoGKav2B7r2vvS/4fDUDANTxa8mIKVmKttnXWtoThXs4oY5KZldlSxb9bg0bYv2
         7ORMMKM+A0z/rgaX8qU/T/Hpr105Q4b91EylS1Xy7KUQSW8tD6kmrypgGlBRjfb/oKrL
         bXLbMqWNAOaQUbcqVfV3Po42ilAOMlfFkzTDC1JVMuxAexrglPyTPeS9XUmC9c5RPEpq
         prf+dUCYU5uL5ZbyxmGrsCJQG/qUPXrw6SIrJ2YlvaL+tjb8wTGPLQ6nkxxgK0hF+BHV
         Cf8Mb/mFxc8Pizn+0zKfQoH1thf3dcbv8ACuzoWAJ1EudLyMKDyldzJzYJ+rTXQUcu/6
         AAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775538774; x=1776143574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xP9Cc2QEXzoralI8Q3/pv4kXEl+6Bhb4StE3Cccy/K8=;
        b=Azhbkd2qRX6c052YnP7wFSZqSX7UZ8XEzUdNt52zf58m9XHrn/L1VKNslKp3DV4U6J
         8tqqsTHozzsIhjjGPrNO90zKEIwobWcdJEpEMwgPdoyqZbBwAThNxNbpy0DZEGfZ3xU4
         zq3pIusGdhsnVZSgunPmlNa8bAw1f5dGoUTo51sZ1h2eL48RXrYIV2cvvUm1M1rTk02f
         alAwpUPVI+XHHXRYP5guSI+8i7A465n2g+SCCVK5TVReqsFxt99ZPuTE3W1PM2ZzbDPZ
         8ofVbuWXVZIX7JmKQq4ODwPxkocpU3wq5TRWaYaitG3d9+EIXGzexCrfR8TOCLzBbUOR
         6big==
X-Gm-Message-State: AOJu0YzZj6LrDmZPCujBL/vFvsJXXcIeZRozwwpBHSZUkmqY/+e6am2J
	RsWhKzw6ewPgbJnstxaJqLK5EOTQlZt+jN3KMuABBBJmGVTjLzP7Lg4x9YRozCoJd6b1NVTAC9y
	dZqoKXSjWOpOVrzX9gvBuzVQOwbgH1ic0pYfmgH2v5vxWpblfmx1zLq21vpI=
X-Gm-Gg: AeBDiesDYxHSnnF9EbRti6/6RjcvGk2dTED5IBUs/aJM0cxpBe3JnBaVC2oSLgifQ6N
	0jhaGdCgCAHyPe2PIIifwmyS+AD15ReQLFSQJTgjeljh2dWS4rxK7a8phRheiiFKKPtNk95zTZB
	wPmFQC+UVldN9jO6ii6MmPnVxJfHBUig4uAkDIt+BN+N5yNM4XvhdmICl793HQoM4cHt2F2cxSY
	2tSdDZFXjaV0jrnHwO7PXFcwBxUZ3oFU5at4aEJGLLsludG50HysKGKSHSFYUa1AZFpGjRVuO+X
	dpCKLEIp
X-Received: by 2002:a17:902:e852:b0:271:9873:80d9 with SMTP id
 d9443c01a7336-2b283fbe6bdmr8531405ad.7.1775538773093; Mon, 06 Apr 2026
 22:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604070917.ZVd6Ugz4-lkp@intel.com>
In-Reply-To: <202604070917.ZVd6Ugz4-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Apr 2026 22:12:41 -0700
X-Gm-Features: AQROBzBKvQqVQNICwhE1RilQY2nY6Rrqn-aYKRpKX9DBeQSfK51lDsGdw4UTVjo
Message-ID: <CAP-5=fVBZPBz6J1omfvSS4JLkueRGqCdouLji6gsFLTeu9nJTw@mail.gmail.com>
Subject: Re: include/vdso/unaligned.h:23:9: warning: '__builtin_memcpy'
 reading 4 bytes from a region of size 0
To: kernel test robot <lkp@intel.com>, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 9:03=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   bfe62a454542cfad3379f6ef5680b125f41e20f4
> commit: a339671db64b12bb02492557d2b0658811286277 vdso: Switch get/put_una=
ligned() from packed struct to memcpy()
> date:   3 months ago
> config: mips-randconfig-r111-20260406 (https://download.01.org/0day-ci/ar=
chive/20260407/202604070917.ZVd6Ugz4-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.4.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260407/202604070917.ZVd6Ugz4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed stru=
ct to memcpy()")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604070917.ZVd6Ugz4-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/byteorder/little_endian.h:5,
>                     from arch/mips/include/uapi/asm/byteorder.h:15,
>                     from arch/mips/include/asm/bitops.h:21,
>                     from include/linux/bitops.h:67,
>                     from include/linux/kernel.h:23,
>                     from arch/mips/boot/compressed/decompress.c:14:
>    In function 'get_unaligned_le32',
>        inlined from 'decompress_kernel' at arch/mips/boot/compressed/deco=
mpress.c:113:16:
> >> include/vdso/unaligned.h:23:9: warning: '__builtin_memcpy' reading 4 b=
ytes from a region of size 0 [-Wstringop-overread]
>       23 |         __builtin_memcpy(&__get_unaligned_val, (void *)(ptr), =
          \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>       24 |                          sizeof(__get_unaligned_val));        =
          \
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: in definitio=
n of macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    include/linux/unaligned.h:23:28: note: in expansion of macro '__get_un=
aligned_t'
>       23 |         return le32_to_cpu(__get_unaligned_t(__le32, p));
>          |                            ^~~~~~~~~~~~~~~~~
>    In file included from arch/mips/boot/compressed/decompress.c:22:
>    arch/mips/boot/compressed/decompress.h: In function 'decompress_kernel=
':
>    arch/mips/boot/compressed/decompress.h:6:39: note: at offset -4 into s=
ource object '__image_end' of size [0, 2147483647]
>        6 | extern unsigned char __image_begin[], __image_end[];
>          |                                       ^~~~~~~~~~~

I wonder if in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/mips/boot/compressed/decompress.c#n113
```
image_size =3D get_unaligned_le32((void *)__image_end - 4);
```
would be better as:
```
image_size =3D get_unaligned_le32((void *)__image_begin + zimage_size - 4);
```
so that the code isn't negatively indexing an array.

Thanks,
Ian

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
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
