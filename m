Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821C11AAE17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776504744; cv=none; b=CIVzE8ifRA9YV3WdeXtiFgBkfhzFJoa83ciRGPpBSaV3vmMO4cR89CEr6KbnE2KPe8y5RZm1dQDEVq6CzylF69RGfF+LmmeQHEI1jBKVNkeNXR/kyQQsw9o2BhfEXfqm534YjKMGRV0IDJgFlaZknJxNvKQwaxP7/fa3yPkyjio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776504744; c=relaxed/simple;
	bh=LuNgNR4zWEnIVng3Iao/eYGyIMmZ7NSZVhPM11xUPG0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qMzsUFSNDMxm1RVTEB0Ky/nWFNUIAK1T6uJx4hA5wFziH2QZm8sn1UojD2vvUogynpB3DUWgH2JXMMawLMXmo2rAfCbx8qqoOcgjym/v7Sy4YoYEXbU9imWyAxmZzp9az1PhyJ1mvjHZIX0hSF1Ehm8hLJ7kmeoUM2uyNUCivQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIJhGeeE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIJhGeeE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488d2079582so15972565e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 02:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776504742; x=1777109542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxD+is+pbahMT9dB8HsDTaseFAqKL6o1uQcZ5xCt9OM=;
        b=PIJhGeeEheYcr+tAWYWh6SE3ycM6/HXtFkeBmQfwXFquqlDYi+lDCpJpfYLHKUIM3G
         A+J+jfswx9swxLPoGImoatJMZhfGnTgS4o9Tat0KMKzHwoqFwvSJcXHPEeHSXe3jVyVJ
         vImtSGbxD1Pm3MiSG7MrraA9X9SARmONTp1/0P0hz+w+3OGs7q6AjyxVGJaVqCybj3TP
         UYM2qF9aOD0hmAdbt5Wi2YM1zfbXQPAhRpiH75QB+bPjUtaevKXMwLT0Ld9bw4GzVqWx
         JbrlF+fmDZxIi1KsIO7tjQh8Q0mgNBLFcmsS2hIwbqm6ozF3yDnFZAkkC3V3+PtbqbWX
         sV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776504742; x=1777109542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HxD+is+pbahMT9dB8HsDTaseFAqKL6o1uQcZ5xCt9OM=;
        b=OY7SfD+XrPnBALebrrXD6Tb/DCdTJdWZhSKLrbxbMHoBfJZv9qOtM5aH8IRzqbZVrG
         ueAqeECrTw01vk6z9MLysQpVyuv5sA4tl+nQnqqB2aqbozkmfqTNbkZpH+lVYmYHOdtK
         nnVD5qZqgJvsEZGSCcSfZqbL8z0wC1tJ1FLw0xfDsV30RVhAxNjc4MG+ziSNmkhiwg9F
         aR++Y8if36HuK/jXW/Hft3m5aqqZMUY3qo3iwyhp9tjUAkaCveoeeKboWwZtP9IQJsr2
         rXdaPQSijiHfO0f1bQI8K7QOOXVnuEYCMhd1fNtguK5pJnBg+ia9rG9xXsIlT1oA08Z9
         ZTvg==
X-Forwarded-Encrypted: i=1; AFNElJ8TenlkkfKB4rC/NDiSG2F9fcHnKZ/mzWXOtHBKUZqfQue0hkUL5IJ/I/9k8i0O2J9Tjdh/aQs8WBwcjj+f@lists.linux.dev
X-Gm-Message-State: AOJu0YzVmlVDNZSi84Glf/AYl88fQ8vGX8ck+1A2klp1tcREvSbkLEkj
	YtrebaHngHKvQkrvPE6/zMOhZ6F1MdAIxxEB6iLkp9/gNCgizCMJYSeK
X-Gm-Gg: AeBDietbmwcT9P9AVxNYddMf9asGujiWw5iffmeX1GgkahL+0i6CpPvjfw3fmER80Ph
	4o1IJEV6gbC6FmqPZTz8WAiIx9eT4OmL8aGrpzuiNU+K/la4A8ijH0mUt5K3TrSLHoqrQyGi2pZ
	3vU1fl+m8pDYuA19LkayX1WssEltnO5icjF+oUlzU7b40Ayo+g2HUWKKvTkMvgpYCDm6xDcTTnJ
	6QRYgeq1HxSE5wJMv5mKv9k3G7cmkR2mDcLEdRwaNHL4gXpHixaefQAmNRupZW7twNUq5sEH2Yi
	N5aEEEaahnBiugcwq4j05eJ0e567j+iGkvE/yWXBiUB+WurbMeY23RGtS3gQNcU/Hg2bEk4ZvMt
	68aikp7cnQaKbeFXN4YrxYavoZfic9wOkfeH43vocSXcPQLp66UfL2r8r34KRtdLM4wMyibIoGG
	bK//viXWnJictNcghS5p+eCKXIJR/xl6A8G4RwdU/HnGqNilBnesVCp01EJiWwebxt8NMVBwYS2
	gM=
X-Received: by 2002:a05:600c:a30b:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-488fb74dff1mr59895795e9.9.1776504741623;
        Sat, 18 Apr 2026 02:32:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc13938fsm166946075e9.10.2026.04.18.02.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 02:32:21 -0700 (PDT)
Date: Sat, 18 Apr 2026 10:32:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds
 limit (1024) in 'hmac_setkey_ahash'
Message-ID: <20260418103219.1024d2ce@pumpkin>
In-Reply-To: <aeGwENQpQIlY1-d8@gondor.apana.org.au>
References: <202604161035.PMTaI4Cg-lkp@intel.com>
	<20260416112406.68b7afcd@pumpkin>
	<aeGwENQpQIlY1-d8@gondor.apana.org.au>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Apr 2026 11:59:12 +0800
Herbert Xu <herbert@gondor.apana.org.au> wrote:

> On Thu, Apr 16, 2026 at 11:24:06AM +0100, David Laight wrote:
> >  
> > >    250	  
> > >  > 251	static int hmac_setkey_ahash(struct crypto_ahash *parent,    
> > >    252				     const u8 *inkey, unsigned int keylen)
> > >    253	{
> > >    254		struct ahash_hmac_ctx *tctx = crypto_ahash_ctx(parent);
> > >    255		struct crypto_ahash *fb = crypto_ahash_fb(tctx->hash);
> > >    256		int ds = crypto_ahash_digestsize(parent);
> > >    257		int bs = crypto_ahash_blocksize(parent);
> > >    258		int ss = crypto_ahash_statesize(parent);
> > >    259		HASH_REQUEST_ON_STACK(req, fb);
> > >    260		u8 *opad = &tctx->pads[ss];  
> > 
> > Is ss actually guaranteed to be not smaller than bs ?  
> 
> Yes, it's checked in hmac_create_ahash:
> 
>         ds = halg->digestsize;
>         ss = halg->statesize;
>         if (ds > alg->cra_blocksize || ss < alg->cra_blocksize)
>                 goto err_free_inst;
> 
> Thanks,

Ok, so the comment on the definition of 'struct crypto_ahash' could
reasonably be changed to say that pads[] is large enough for two copies
of any the digest, block or state.
And then line 260 (above) changed to use 'bs'.
The memcpy(opad, ipad, bs) could also be replaced by putting
	opad[i] = ipad[i] ^ HMAC_OPAD_VALUE;
into the loop.

None of this helps find why this build explodes the stack.
I've had another look and can't see any inline functions calls
that might cause grief.

	David

