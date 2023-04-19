Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E421D2FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 21:46:10 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2496863c2c7so194484a91.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681940770; x=1684532770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eNA55poY27sJGkFBB9ELAvckRSp+Hs3DdUKmyP8I/c=;
        b=Wu+EO2gLZK7bRlRXhOue6NYns1NGF7FgYObfpP2p7tSWYpnQJon+eZ1th/qgEPsbeT
         n6YG0IH0XPWgIbKKR/M3vjqnEh+7YqJN4K0V0IqQN1geeWosh3pj/m3nQmPs69zCTXOO
         F3hp3XJG3srHyjCAcvzWdXQrY8iGq+h3sroGuLR4nVCU/CgUPdhjHcZiGoQBwmYQOq6q
         6nHpbRCJtMdALeo1UBhlq4sGLfDBin4I4t5N2QYN2KQWrLWqqQOZulXn7jLCyO4SF5D1
         ADWe84kC/4VIG85xthR+4jmVpFZfD4HWvnk92BW52dBG9a56AAf+S53ye2pt6Wt1zQqu
         4zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681940770; x=1684532770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eNA55poY27sJGkFBB9ELAvckRSp+Hs3DdUKmyP8I/c=;
        b=FIHsNji4H6wacTCDMP4klunsgQ3ok+t+29mtEsi3uAuwz/L2bj//noOCTPRQv/umpe
         Z7Zav/Ia8rF3A3nwhMKoWCEFzbiPUlRphpHIa5+J2W6Nz5mqGy6YeHENluVmijW7uigo
         qI5lBqozrnnugQ6vApWwiiD5/tfJD18FfjglGXHt5GRu07VCOMn7DIuNXuD1z5Z0ouMX
         P0UarLMC3+vbE4halEn5Zigi67IgSpdvSxRmm9MkhnW4vJcKV+vJAV77topTgO3VUfRw
         xuhymcwyyt9YsBOCyZnn+CeITfyletQswVjNZqLMVj0pnoTcpqIzaperJcNPCxgZHl6c
         Gc9A==
X-Gm-Message-State: AAQBX9cv93VAa5EMO3dCV1Lq8hk9vBmwma/PzLuFaFVsJjR6SkwmCJ66
	+BBQARCFNlxG0ksVhcjZV81Zw3ztx0DaGtpMapVVGA==
X-Google-Smtp-Source: AKy350bL48Q9SK3cJudoJ6xx9ltTOmsUb9nCB/69hFqPx6lo5kbFN2yYSkaFZsBy9oE0K351LWgmiL9hiI5w4oDtC+Q=
X-Received: by 2002:a17:90b:4c4f:b0:247:78e7:8739 with SMTP id
 np15-20020a17090b4c4f00b0024778e78739mr4187323pjb.0.1681940770255; Wed, 19
 Apr 2023 14:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304081828.zjGcFUyE-lkp@intel.com> <ZD+0DJq1NHmMSSja@gondor.apana.org.au>
In-Reply-To: <ZD+0DJq1NHmMSSja@gondor.apana.org.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:45:58 -0700
Message-ID: <CAKwvOdm2VyCzfmG6707osmtyniV-oL-ism08kER49D7p_7x+Rg@mail.gmail.com>
Subject: Re: [PATCH] crypto: arm/sha1-neon - Fix clang function cast warnings
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, Robert Elliott <elliott@hpe.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 2:27=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> Instead of casting the function which upsets clang for some reason,
> change the assembly function siganture instead.

s/siganture/signature/

Thanks for the patch!  Perhaps worth noting in the commit message that
this fixes an instance of -Wcast-function-type-strict triggered for
W=3D1 builds, which helps us catch potential kCFI violations at compile
time rather than runtime.

After this patch, there's only 4 more users of the sha1_block_fn
typedef, consider if that typedef is a candidate for removal now?

Also, you should update the comment in
arch/arm/crypto/sha1-armv7-neon.S above the assembler implementation
on L288-289 to reflect this revised fn signature, in this patch.

>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304081828.zjGcFUyE-lkp@int=
el.com/
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/arch/arm/crypto/sha1_neon_glue.c b/arch/arm/crypto/sha1_neon=
_glue.c
> index cfe36ae0f3f5..9c70b87e69f7 100644
> --- a/arch/arm/crypto/sha1_neon_glue.c
> +++ b/arch/arm/crypto/sha1_neon_glue.c
> @@ -26,8 +26,8 @@
>
>  #include "sha1.h"
>
> -asmlinkage void sha1_transform_neon(void *state_h, const char *data,
> -                                   unsigned int rounds);
> +asmlinkage void sha1_transform_neon(struct sha1_state *state_h,
> +                                   const u8 *data, int rounds);
>
>  static int sha1_neon_update(struct shash_desc *desc, const u8 *data,
>                           unsigned int len)
> @@ -39,8 +39,7 @@ static int sha1_neon_update(struct shash_desc *desc, co=
nst u8 *data,
>                 return sha1_update_arm(desc, data, len);
>
>         kernel_neon_begin();
> -       sha1_base_do_update(desc, data, len,
> -                           (sha1_block_fn *)sha1_transform_neon);
> +       sha1_base_do_update(desc, data, len, sha1_transform_neon);
>         kernel_neon_end();
>
>         return 0;
> @@ -54,9 +53,8 @@ static int sha1_neon_finup(struct shash_desc *desc, con=
st u8 *data,
>
>         kernel_neon_begin();
>         if (len)
> -               sha1_base_do_update(desc, data, len,
> -                                   (sha1_block_fn *)sha1_transform_neon)=
;
> -       sha1_base_do_finalize(desc, (sha1_block_fn *)sha1_transform_neon)=
;
> +               sha1_base_do_update(desc, data, len, sha1_transform_neon)=
;
> +       sha1_base_do_finalize(desc, sha1_transform_neon);
>         kernel_neon_end();
>
>         return sha1_base_finish(desc, out);
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
>


--=20
Thanks,
~Nick Desaulniers
