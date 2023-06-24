Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E248818
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 07:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91154C433CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 07:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687592472;
	bh=avZPsBEagJV1X6yWFemzFd3KKpTlFWMQ2aBJ544GOm4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qY9v29XX/xhWJjTkHFbhoaIP1m6vqHppompViPqOnd/rTmHyq5EDBrKLXLXZHxwsr
	 wfiKbYPV5LN9FXFCRHc5YSlOSUQOoi/nAex66is/yTBkjNefboCWRf9GMGUYJo9XuY
	 VG5O6y5bLRpyZHcg7xS0fYrY7z1ZxFP+aBwc/iJQUY6O4cne5yOcnMlKqN6o2CDYTy
	 SFAtJGBxjrHVLMZqLLIxiDf1pjkGmXHeRpISWAFjj6OEIdAhYYCblBDWj/RIpa2kl3
	 ii8DtgXy2IV8PBwArZ7UtjSodar4Z/zP87oWkfdLONM/Z7ReGx3EGztbMHE7tXCR7H
	 6z9pJJwUXZ1Rg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f86dbce369so1913929e87.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 00:41:12 -0700 (PDT)
X-Gm-Message-State: AC+VfDwC9tJt54XuhtzRbFmMaYL0og6prbyXprqErhLfP7+GBCt/9O/b
	wPkLVz8Ie12x9tL39tEWhi2k1VjbK23scuWvDsY=
X-Google-Smtp-Source: ACHHUZ7+NKjRZFpsalZkjMNh2oIyWbdUyClJ8buxDj6a5GSz0vbyONo1glmlzVWeC8egy8/EeToXZf4pdRlV4y8MaGY=
X-Received: by 2002:a19:915d:0:b0:4ec:9ef9:e3d with SMTP id
 y29-20020a19915d000000b004ec9ef90e3dmr14682823lfj.26.1687592470554; Sat, 24
 Jun 2023 00:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306231917.utO12sx8-lkp@intel.com> <ZJZ8/JifEeygojAq@gondor.apana.org.au>
In-Reply-To: <ZJZ8/JifEeygojAq@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 24 Jun 2023 09:40:59 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGKnusvWDV8rSUhQexeKy1e2+x2-ZXw6_6RiExvtiR_8A@mail.gmail.com>
Message-ID: <CAMj1kXGKnusvWDV8rSUhQexeKy1e2+x2-ZXw6_6RiExvtiR_8A@mail.gmail.com>
Subject: Re: [PATCH] crypto: sm2 - Provide sm2_compute_z_digest when sm2 is disabled
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Jun 2023 at 07:20, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Fri, Jun 23, 2023 at 07:22:29PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
> > head:   b335f258e8ddafec0e8ae2201ca78d29ed8f85eb
> > commit: e5221fa6a355112ddcc29dc82a94f7c3a1aacc0b [76/81] KEYS: asymmetric: Move sm2 code into x509_public_key
> > config: nios2-randconfig-r031-20230622 (https://download.01.org/0day-ci/archive/20230623/202306231917.utO12sx8-lkp@intel.com/config)
> > compiler: nios2-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231917.utO12sx8-lkp@intel.com/reproduce)
>
> ---8<---
> When sm2 is disabled we need to provide an implementation of
> sm2_compute_z_digest.
>
> Fixes: e5221fa6a355 ("KEYS: asymmetric: Move sm2 code into x509_public_key")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306231917.utO12sx8-lkp@intel.com/
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/include/crypto/sm2.h b/include/crypto/sm2.h
> index 7094d75ed54c..04a92c1013c8 100644
> --- a/include/crypto/sm2.h
> +++ b/include/crypto/sm2.h
> @@ -13,7 +13,16 @@
>
>  struct shash_desc;
>
> +#if IS_REACHABLE(CONFIG_CRYPTO_SM2)
>  int sm2_compute_z_digest(struct shash_desc *desc,
>                          const void *key, unsigned int keylen, void *dgst);
> +#else
> +static inline int sm2_compute_z_digest(struct shash_desc *desc,
> +                                      const void *key, unsigned int keylen,
> +                                      void *dgst)
> +{
> +       return -ENOTSUPP;
> +}
> +#endif
>
>  #endif /* _CRYPTO_SM2_H */

How is this supposed to work when
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y but SM2 is configured as a
module?
