Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE28D300
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 21:56:30 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so255022a12.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 14:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681941390; x=1684533390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLFmQtDzjn4fYBCM5a8di1qRrzs1inEcdVm3lZ+12QM=;
        b=Q0LakSBjf0+GBzOMLbAb3DpXco7mN4HHs+Qs/Nvg+jLZjcJ1Ie+a7eCijmH4a8EEbS
         33LOFnttp72BosihncMJLawycgMQDlKvNydTZiCFj83K0yz6dglI2Uk8Soum3R0B6cDL
         7kT2rgDuuy2BSkC721XmaGpdyGoniKYYFQdeipvyAeUW+DwbeNi0QdvuxXFIXA6hz82o
         Mt7lompywH7ief7lBe9GAKR27XOorkb+5Hy+igyRHThnYXros/YOxszVOWr9mPsuL9+d
         F2Hbq9EBe7DKdB01RQkTOyfNw68JW+Iaoe0HAhw9Mon/+ggI56OS0ryOXqmr4x8rNAHr
         QsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681941390; x=1684533390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLFmQtDzjn4fYBCM5a8di1qRrzs1inEcdVm3lZ+12QM=;
        b=DNceLYNq3WVbU2yShT1FlRtOQnoHgnRU3CIiw1TWnt/7aQgCxoPYegan3IfPoFlZfX
         k2swOsAYOwXS5Gr8RRb0s2rzlS5s5FwIAAsWvEhgG1t+UBiavw437F56ayqG7nzVJtVQ
         vnpjgmxpNW1B925jI+8HjDd1UVRGHHzakCsxQosZKKK23WsL8mx8NN33tuYoMS3bJslF
         a2cg2lP/Q0etydIBBvE0M7u4SwNCn/zOABzz/CMJBcojoz4Fv/9C9dk/NAl8FY1vXQI4
         3qle1MvGojmccA6MwRVHbgD7LviZBzDQ8R/iXmN+IoNJvjEhZFNVKIBhBsaZyTTDlCoM
         2M+Q==
X-Gm-Message-State: AAQBX9cNxjpkbE2fdULWEJ+zmNvjyeU2/NH2SVbnhinxT9vZI2s8IOno
	wnUw/ysN7MgYqbYM0ulqA3k0jhnm0+hBC8qAYp36UA==
X-Google-Smtp-Source: AKy350ZzIjgiQTad0i+K7AT2aLRAa2MzlG+eA4IP23ChGDk1CoGmo4OGkFCXhCcBg96+koUcNJCu5vVd0OB81LDKpxI=
X-Received: by 2002:a17:90a:4142:b0:247:19c5:aa3d with SMTP id
 m2-20020a17090a414200b0024719c5aa3dmr3916943pjg.36.1681941389816; Wed, 19 Apr
 2023 14:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304081828.zjGcFUyE-lkp@intel.com> <ZD+0DJq1NHmMSSja@gondor.apana.org.au>
 <ZD+1BQd8Phqk3lzv@gondor.apana.org.au> <ZD+1phnERT6EkIUe@gondor.apana.org.au>
In-Reply-To: <ZD+1phnERT6EkIUe@gondor.apana.org.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:56:17 -0700
Message-ID: <CAKwvOdmxK8jKK3aW7xViDyjA=NtmcvXsv=OPNRFC0FTrnVCS4A@mail.gmail.com>
Subject: Re: [PATCH] crypto: arm/sha512-neon - Fix clang function cast warnings
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, Robert Elliott <elliott@hpe.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 2:35=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> Instead of casting the function which upsets clang for some reason,
> change the assembly function siganture instead.

Same comments as sha1 and sha256.  Looks like more casts to remove:

arch/arm/crypto/sha512-glue.c
34:             (sha512_block_fn *)sha512_block_data_order);
40:             (sha512_block_fn *)sha512_block_data_order);
48:             (sha512_block_fn *)sha512_block_data_order);



>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304081828.zjGcFUyE-lkp@int=
el.com/
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/arch/arm/crypto/sha512-neon-glue.c b/arch/arm/crypto/sha512-=
neon-glue.c
> index c879ad32db51..c6e58fe475ac 100644
> --- a/arch/arm/crypto/sha512-neon-glue.c
> +++ b/arch/arm/crypto/sha512-neon-glue.c
> @@ -20,8 +20,8 @@
>  MODULE_ALIAS_CRYPTO("sha384-neon");
>  MODULE_ALIAS_CRYPTO("sha512-neon");
>
> -asmlinkage void sha512_block_data_order_neon(u64 *state, u8 const *src,
> -                                            int blocks);
> +asmlinkage void sha512_block_data_order_neon(struct sha512_state *state,
> +                                            const u8 *src, int blocks);
>
>  static int sha512_neon_update(struct shash_desc *desc, const u8 *data,
>                               unsigned int len)
> @@ -33,8 +33,7 @@ static int sha512_neon_update(struct shash_desc *desc, =
const u8 *data,
>                 return sha512_arm_update(desc, data, len);
>
>         kernel_neon_begin();
> -       sha512_base_do_update(desc, data, len,
> -               (sha512_block_fn *)sha512_block_data_order_neon);
> +       sha512_base_do_update(desc, data, len, sha512_block_data_order_ne=
on);
>         kernel_neon_end();
>
>         return 0;
> @@ -49,9 +48,8 @@ static int sha512_neon_finup(struct shash_desc *desc, c=
onst u8 *data,
>         kernel_neon_begin();
>         if (len)
>                 sha512_base_do_update(desc, data, len,
> -                       (sha512_block_fn *)sha512_block_data_order_neon);
> -       sha512_base_do_finalize(desc,
> -               (sha512_block_fn *)sha512_block_data_order_neon);
> +                                     sha512_block_data_order_neon);
> +       sha512_base_do_finalize(desc, sha512_block_data_order_neon);
>         kernel_neon_end();
>
>         return sha512_base_finish(desc, out);
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
>


--=20
Thanks,
~Nick Desaulniers
