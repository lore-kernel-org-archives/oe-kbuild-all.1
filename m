Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5B1C5490
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738329602; cv=none; b=FnYCpXhQZtoqZxohuy6N3Tm7eOb+TaxSwgvH0e+a7hM2yjvueqlH2a1JXh7VMpABhTe8W0LBSpj2tPZ96v3dHEmoYo+loaYsygD7UDsHihWCUwHx0gzGXHq3kREd4GJzdQJBZ9VhoMORAOkOkJHkSpB0M9yv3iH1cFwcwJvIj+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738329602; c=relaxed/simple;
	bh=XJ8eC8TXCqAs7wYaKXdVsL2OL9dvK2cB6ReFgGM8e0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enqjXJgQixyMrx4PjW/MUVwVwrx/5cVobXRzluML6xQ5ILAT9uCwdzvMyAbPzkUjj7BFm5Y1geOUrx620TL/MoxfP/F5U3R50ft9cjI39CgmrcPX5C24T+JvMDpNrjiUcSA8ka1c2ibi3S2ln/7zan5rbR8PiNgwchKR452K+O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AphWA5Fx; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AphWA5Fx"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30613802a59so21018831fa.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 05:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738329599; x=1738934399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBBdhvhME5ck8WWXRexbnsLPzpHMk57RJ8K1TKpaEa4=;
        b=AphWA5FxRUD5oZcXMv9JPdz68u6nTPvzfyRFBS1SQOwYw0XDMdvPNBCkdEcKg/L6WT
         Kb4a57FDPkzdGpxKPdac/eR0VzQyk65KG0Miasq0idLWjTFOIn+ofXCtk3ln8J9PA4YK
         sHs+WITk6bqEEWiCBNjKN712tJSqPmGreG7+K6lpJeEabjU+yVjSjk14KewFiasaNaju
         jQkr7+JLwr6hadFXHKfHmRUOLN/pFMz/aujw4J2/+x37nVM0GG57seFfNB30POJVbtkB
         OM7idGXieDFX8wJeop4kKToIUraw1/6ANJwj/CD90437Vbl2I59wNS/ve5NB78dlQ/pw
         JtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738329599; x=1738934399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBBdhvhME5ck8WWXRexbnsLPzpHMk57RJ8K1TKpaEa4=;
        b=qp0dxTBkEm5bl/akGmkAhnGmlggYbfqg14GWchnLcE+C93RH98xNWDqaggOXAhqMUU
         n/LCafhOs3aETz1p8VM++Zcs75mLN2ST9jcUr+QWe3YhMBJDdl3YT6MG+RVKiO0dOeKA
         mbyq/gYKcNAWICmurSkFotEW3jdC6ouzs8XlGcFbBkQrlUSrnqg9/1zRiH2BqR7onw9U
         si+6OVNP4XiIZLu4cbwD0kjWMqeTPLuXE1NGZEBKC+KBS0DZ984YtGcml1toltHvliOp
         LJfE/POlCETEFvwqPqDEA2cqDE2uEQvh3AE0p+9+497WZkkQ0snZYC/JISsBhYhbBceA
         uobA==
X-Gm-Message-State: AOJu0YxN6FcoILQiaFfSMd0Soj5CqUx5C9EjqggdhB4EXGNeC7ZULTpC
	+3NH3KFqwseQr/u6eGYZQsMxTnn8PIjn8UQjr20Dsv49zmKBZas790u3wrF9eeBPDBRQUyNZEtV
	qCbhfDLClPlu8GwfcUbs76wNTujI=
X-Gm-Gg: ASbGncuA0x55saYA9+C/B1QihiJ+yh2yArcMBCGQKiQTGgOXQsfWsnwew4lAqMm6DSf
	NrSQC9ir67KtMuhNZijEK+UVf/PeJe0pBuk1z1bhZ+b+aNdVZQwuTwYjq5GO/tH1+f1cE7mML
X-Google-Smtp-Source: AGHT+IFeKXFZp5dZbpF/wlX0bT6/89xtVl7IeL6+5MLAauyFlDRTiDFpSDPaOlP59qjeKeeFI5e1Auc6cq12eWTl8Ss=
X-Received: by 2002:a05:651c:896:b0:2ff:bd92:1d7d with SMTP id
 38308e7fff4ca-307968e71f2mr45613521fa.23.1738329598623; Fri, 31 Jan 2025
 05:19:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501312159.l6jNRaYy-lkp@intel.com>
In-Reply-To: <202501312159.l6jNRaYy-lkp@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 31 Jan 2025 14:19:46 +0100
X-Gm-Features: AWEUYZnTMiOOj8A7f0CwGwcolejVYxRqWGJ68cEC5h2qzVXWQbu9ySqOabHgSOQ
Message-ID: <CAFULd4bYhA+XsJH3rr=i98O4DJr_jjZe5HtBETGV_4Sm0S0QnQ@mail.gmail.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 52/52] lib/bch.c:317:undefined
 reference to `__paritydi2'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 2:12=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-no=
nmm-unstable
> head:   1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e
> commit: 1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e [52/52] lib/bch.c: use _=
_builtin_parity() when available
> config: arm64-randconfig-002-20250131 (https://download.01.org/0day-ci/ar=
chive/20250131/202501312159.l6jNRaYy-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250131/202501312159.l6jNRaYy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501312159.l6jNRaYy-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    aarch64-linux-ld: lib/bch.o: in function `parity':
> >> lib/bch.c:317:(.text+0x10e8): undefined reference to `__paritydi2'
> >> lib/bch.c:317:(.text+0x10e8): relocation truncated to fit: R_AARCH64_C=
ALL26 against undefined symbol `__paritydi2'

This config for some reason generates a call to the library function.
But I have tested this with a crosscompiler:

       fmov    s31, w0
       cnt     v31.8b, v31.8b
       addv    b31, v31.8b
       fmov    w0, s31
       and     w0, w0, 1
       ret

It looks that __has_builtin() does not mean that there will be no call
to a library function?!

Uros.

>
> vim +317 lib/bch.c
>
>    313
>    314  static inline int parity(unsigned int x)
>    315  {
>    316  #if __has_builtin(__builtin_parity)
>  > 317          return __builtin_parity(x);
>    318  #else
>    319          /*
>    320           * public domain code snippet, lifted from
>    321           * http://www-graphics.stanford.edu/~seander/bithacks.htm=
l
>    322           */
>    323          x ^=3D x >> 1;
>    324          x ^=3D x >> 2;
>    325          x =3D (x & 0x11111111U) * 0x11111111U;
>    326          return (x >> 28) & 1;
>    327  #endif
>    328  }
>    329
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
