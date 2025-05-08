Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30E228A72F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736638; cv=none; b=eeHROfYrq7auCzqpcXDbWCHCoD3Zh6KDe98EcB7bIPLskq3WVVnfMhyxp80oFSX8LhIpggkYKw4diQax2MTEuq3pWwWgNtoztbGcJu6EFl/mpCa+7AMM31lXzjrVUFM9UBccJh90llEpDPmqzhig1au0FM90HTz5AcGDMkKlpU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736638; c=relaxed/simple;
	bh=A5FEGp8r+5od+JlaprBQcT/Ywrc2ivb4zcsH9pA1f9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbqmGgQyk98R9OZ21Bz+CEmF0fAMOqiuaJ4iiDrv88GUqtiRTWOa1HZqAflCiZZmSkTlS6ha9iNVJRJlWEuBFQVOm8/xrQCCmcL6AbNPvGDWihAkCA4WSU7R58qceiuD3nrTdMbkW4vX9hMiSZzB2sB9gPRTPaj8a5HCCOfLbeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLgu5Q/m; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLgu5Q/m"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-326bb1d3e34so10922611fa.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 May 2025 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746736634; x=1747341434; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5FEGp8r+5od+JlaprBQcT/Ywrc2ivb4zcsH9pA1f9I=;
        b=sLgu5Q/m5eek3jhSRv0h7tllF3jJCVypie9OWPiTVyIZn6/mCEkUQ6FJrO8KOF1dN5
         HsSyNfzZ7wJin2/0dAgRgI29vfT3HQOTzfnvXstbg5NsKh7fhB2VgyaoAQRlJFCTwp5v
         kGutVUkJKC61FfBayZXjLNWOyHBKMmPBmvpbRjKnBz20EZDCnOsF8BsdJh2ibdnPPblc
         XwEDz3B63JYlRLt2lhcZrRdCs/sP5vzW1CIpfJWU1MVIV8HrfdTAEciTIVBh7OeCX3ck
         MjYCStXcTmslxagD9nCu1/wplOUV4LE5ERJCiGH2XyEOl+AI+jGXyTjxJZL7zWZeCAzM
         TrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736634; x=1747341434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5FEGp8r+5od+JlaprBQcT/Ywrc2ivb4zcsH9pA1f9I=;
        b=BBqIIL8ZHa72/Q+T+lNjASqqwHi1LbAzOin18GezIZQ+3oxyoqouwo4M5QiRuDqEO5
         wVGabM2GM/zjODjrrrjPD82SUfPGKt4vfyoHV9OGm+RdPDxiw5HaybF7b3T74Zzw6Krn
         KER+7QmCnb2qaEeoNxZ1GAqjW/wI4LLGWMNBgzA/Wy+3dCe3LOIQZGFHQAKPNGBXm/Vc
         JD+Ge5fBsyN89e7XJV2oe+VyIrMBNY0DypgS0Dsh1/TgSZREa/W+c+vcNcB3BnYcTByk
         pPeGToutLNx8lCALIEKO+kn21jkMazT6pN+9ASY/jj0XoT0Q7AyKiOw1DNpLP9DxxPhc
         aJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhZc8ICJErgTYGkaKOAcoCPhzgnhbxWglDGpxuLiJmYtCAxjs4rRg/9ZkGM3+1sDjqj7MibIwGmhT4ybNV@lists.linux.dev
X-Gm-Message-State: AOJu0YzdXYj1iNAxsUcyGGFKKutHaH84lileHqAPQrIjzNrelCha1iZA
	XSxZ1Ns8S2ZLPH3pfA8qOdkUFqTKApOw/fDMFuAs2otNzM13gp2kup16gqkq6lEftkUH6CHFrmp
	tYyt8gPEJhNwRvmMHMrXlk6dRjaHLK3eTg0hmNQ==
X-Gm-Gg: ASbGncvaD0OzY+6w2pGOqnH6JWFs5YQgnOztnvQJBVv9XmfXLY2q7wvx3vrwBPaZ4N5
	RaeTGGkYDZUz86RP6xvFpqQdxQspEKWLLh6Ne1lEiHKqOoWVHWg6Nk05/tSXRtJUNnYFQRp33E6
	9jH0yLf19foV7mh0mnvH89fA==
X-Google-Smtp-Source: AGHT+IGVs8OBs3YrTtONe3XV7US68XWWpLWC5HM5bRwwTzVW+hZBYesbymsxYB94plP/2lMdY5IxGudKdxOVmw3MRXA=
X-Received: by 2002:a05:651c:885:b0:30d:e104:d64a with SMTP id
 38308e7fff4ca-326c46b2b7bmr4152421fa.38.1746736633880; Thu, 08 May 2025
 13:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502100841.113091-1-brgl@bgdev.pl>
In-Reply-To: <20250502100841.113091-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 22:37:02 +0200
X-Gm-Features: ATxdqUGIytDrG-RZcZQg2XJ82RlylEF1rDHHrGyUvjJm9IxmZt1ZkIxiitbTU0Y
Message-ID: <CACRpkdZ+K8gw_L3TT=UmSEYo7fA2feYkaP-YAf5QaOrWywHu2Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 12:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver does not use any symbols from gpiolib-of.c. There's no
> reason for it to select OF_GPIO directly. This addresses a kismet issue
> reported by the build bot.
>
> Fixes: 8e86af65f39d ("pinctrl: at91: allow building the module with COMPI=
LE_TEST=3Dy")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505010447.kUlI61vt-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied and pushed out, sorry for the delay!

Yours,
Linus Walleij
