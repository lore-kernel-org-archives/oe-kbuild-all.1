Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1690339F179
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335051; cv=none; b=fStx0UYGZRJUvzt1dgVRla7x5tuBRNh/cCZ8TNVJyAQYQC4bsOVeXX3SNaEhQFL8lCEuSARUM1ManqU5o3/YA63WCxFNYwsoqaaa9P5MTLgdYubxNFCPmTN/VJwDqZIJQlYYBzJK5aco8IM4DJkWxO5fAScPL4gJTYnXXlXp7pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335051; c=relaxed/simple;
	bh=hoSWFt1lN7mgDuGcRxcB1lkiBWIHGGLW3aOdhlsJdAw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rpuGIF8wM8MXcw+Ho15C7nguoAlTaNbavUHiEw21OMpqUz1+JNeaDT60P2NIjbnm9ZsIvrTKGrNhTXXNr/TyQyzN6ZUbYGtPQ9JinYQ6pf8MPw4HlhTTSgfiNYEVi3LMClO25SsCX+8GBfKiy9CHktkOuVA60KCrH3ExHv6U72Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEY0JGAe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEY0JGAe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a041eae5so58219285e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776335048; x=1776939848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZezAuOM8XC3wh9BcVHj9NdPAqzBIZU7wkxD6LaGlRhs=;
        b=ZEY0JGAehMc/bOiZuwl1JfeSGGQv9R9+G+Lb4jTqRkTSMFp58zzbcIS0AkH51ylWvw
         dNqL90LDXtU1KfaXEUma0g5khTD/nyphTjyHDi5wWaNPfaHcG82C9w6NDHT5T6y3FP1A
         lDakyPByaJL/cxnSP2xbV+wOpWkPwRWm+Ur6G+pqeJcx+SasVlBoqkaF8olK5U6Ar+NI
         QMMC6wc7j4FFJiGrW7lEeP6nY8khLZgRJQbXIe+zUoEW/vKN7vsBsNHpuBSDEBtH1iuq
         Dtm3qwwtU6aGdlZeADFZbJEp9mIx9H4IadTW3cIWoDV5aieLug5E51uhUPH940phM+Kd
         QAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335048; x=1776939848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZezAuOM8XC3wh9BcVHj9NdPAqzBIZU7wkxD6LaGlRhs=;
        b=VUbQAyMfCK5mpzep4zvxFAIH2/PQ9BeMWB+mmjp0pNICClz+CdElKUXJFeVeBK2/ZT
         yFTJr1dAFDzlyjBBlSqBAeKqPhM7XwPc+jtEKcq2IiIgzm7ijPNQ0gCD4CIIlPdYOAf3
         VaJLgbGmG9sUluhk5qqEClfKk+134K5BNXyASzcvIQOKdNXfa8fArfgQEPgBQyPPDI9m
         x4QReOQdfhUPuwHgb1/2TbV5BOO1m9k2x5WmHaFLAliGqWbw0VBlkaaRoLUsTNoEO4Sd
         RYLEK4X8fmom4M1vgpmljOmOPzGnzGjSRWo90IYET3PJEOMaYOjTtOtiQbBz2+rUQghy
         vfIA==
X-Forwarded-Encrypted: i=1; AFNElJ+GXQJI1Y5eAJDXFDQ3UV4/bDQbNCUvmonwPdgnDKYEt3pv3eORFS4dXtPSTC4cLZB5mJEs4pzov3Im7Ir/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6MRo5mHboZazu/s/Of4Xzdy0F5Ntic9se/BrFyfbIuvIrNKmJ
	G9kepChuw2LKdO72Ed877KYIuKbeOSYOlZ9xKgn+TDWkylIlMr665TbQ
X-Gm-Gg: AeBDiethqIhwzStuqU5RKRaRPiCvQ3Gmu2KYtTQVnq7UC6W5Tbqbf4tqyeaiolYShvz
	tWU0rEcF+ZM67MZWyOBgM4YjHMU0TFbiEbhUKZpiT/TG4n7GNMwo0sxHrpWWS36ZUCeIX9mpKCb
	DU9UK0jLNh+fnPP/rfe3PFH8TtDKPUH/N92oJQpr7ufKpHXSSgC6v6riHsYd+LLZtlfUmGNmEm0
	MH9F8kpPytJhlVJZ0Id/4vdJfEy5CCGuJuob6F8JfP+1kS+SWql7AhSLAuG6aoAE2ablblZVHSu
	Od3zjJ9oo1qLLj0zdXKmSOD2NvE4NsTZI401WKnria2Xt+mN5EgNyJe8yi037CDK0PkqNU399yY
	zsIc046RB6JMxiGToLp8xxjoR//M7UxV+XDjdRtpdSB47BNIHZwV2dwz82ruWtPJlJjaReiky2m
	ljNjTK/Z3jIoSga9MFRhuns2txj40xuiv9g/TBhz86s9WzTKx+Ma5srMmG86pl2w2E
X-Received: by 2002:a05:600c:64cf:b0:485:b6dd:5066 with SMTP id 5b1f17b1804b1-488d67ce664mr337518265e9.7.1776335048179;
        Thu, 16 Apr 2026 03:24:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm71848815e9.0.2026.04.16.03.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 03:24:07 -0700 (PDT)
Date: Thu, 16 Apr 2026 11:24:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds
 limit (1024) in 'hmac_setkey_ahash'
Message-ID: <20260416112406.68b7afcd@pumpkin>
In-Reply-To: <202604161035.PMTaI4Cg-lkp@intel.com>
References: <202604161035.PMTaI4Cg-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Apr 2026 11:04:43 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Herbert,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9e1e9d660255d7216067193d774f338d08d8528d
> commit: c3103416d5217655d707d9417aaf66f184e3d72f crypto: hmac - Add ahash support
> date:   11 months ago
> config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20260416/202604161035.PMTaI4Cg-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161035.PMTaI4Cg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: c3103416d521 ("crypto: hmac - Add ahash support")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604161035.PMTaI4Cg-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds limit (1024) in 'hmac_setkey_ahash' [-Wframe-larger-than]  
>      251 | static int hmac_setkey_ahash(struct crypto_ahash *parent,
>          |            ^
>    1 warning generated.

For a typical x86-64 build with gcc the frame is 700 bytes.
Most will be for req - so it should be pretty architecture/compiler neutral.
Really need the associated object file to see what is going on.
The config file doesn't seem to contain anything unusual.

There are some unrelated oddities though.

> 
> 
> vim +/hmac_setkey_ahash +251 crypto/hmac.c
> 
>    250	
>  > 251	static int hmac_setkey_ahash(struct crypto_ahash *parent,  
>    252				     const u8 *inkey, unsigned int keylen)
>    253	{
>    254		struct ahash_hmac_ctx *tctx = crypto_ahash_ctx(parent);
>    255		struct crypto_ahash *fb = crypto_ahash_fb(tctx->hash);
>    256		int ds = crypto_ahash_digestsize(parent);
>    257		int bs = crypto_ahash_blocksize(parent);
>    258		int ss = crypto_ahash_statesize(parent);
>    259		HASH_REQUEST_ON_STACK(req, fb);
>    260		u8 *opad = &tctx->pads[ss];

Is ss actually guaranteed to be not smaller than bs ?


>    261		u8 *ipad = &tctx->pads[0];
>    262		int err, i;
>    263	
>    264		if (fips_enabled && (keylen < 112 / 8))
>    265			return -EINVAL;
>    266	
>    267		ahash_request_set_callback(req, 0, NULL, NULL);
>    268	
>    269		if (keylen > bs) {
>    270			ahash_request_set_virt(req, inkey, ipad, keylen);
>    271			err = crypto_ahash_digest(req);
>    272			if (err)
>    273				goto out_zero_req;
>    274	
>    275			keylen = ds;

Is ds guaranteed to be not larger than bs?

>    276		} else
>    277			memcpy(ipad, inkey, keylen);
>    278	
>    279		memset(ipad + keylen, 0, bs - keylen);
>    280		memcpy(opad, ipad, bs);
>    281	
>    282		for (i = 0; i < bs; i++) {
>    283			ipad[i] ^= HMAC_IPAD_VALUE;
>    284			opad[i] ^= HMAC_OPAD_VALUE;
>    285		}
>    286	
>    287		ahash_request_set_virt(req, ipad, NULL, bs);
>    288		err = crypto_ahash_init(req) ?:
>    289		      crypto_ahash_update(req) ?:
>    290		      crypto_ahash_export(req, ipad);
>    291	
>    292		ahash_request_set_virt(req, opad, NULL, bs);
>    293		err = err ?:
>    294		      crypto_ahash_init(req) ?:
>    295		      crypto_ahash_update(req) ?:
>    296		      crypto_ahash_export(req, opad);
>    297	
>    298	out_zero_req:
>    299		HASH_REQUEST_ZERO(req);
>    300		return err;
>    301	}
>    302	
> 

