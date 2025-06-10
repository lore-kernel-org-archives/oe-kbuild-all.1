Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42861A8401
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546487; cv=none; b=CmYe5IhxJ8bdhz9J63PK/6Yjl4NeALrasmixK91Mhs3fFtF+QvycgzKx6tfyU2J+CS2pnJHHotNhu60qEdVixoU/10WqZTRLH0Lg3Yftc61MbM5l2Mya4t3Rix8kaAWnN6cFLR1SxIoAZEEcdBV3r4PNpG2LnV1eMuIbZdlben8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546487; c=relaxed/simple;
	bh=vX7dGgNAk4b5/FGNFMh1N632X7tTQ7n9HQAfh2++OA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmMlUtzWdZjGG28eW08MZf1wa1tX8UO33ZPaiNr0oRvTKUKGULQ9MxOBH3+qiPeQiLCoqYx1R/z194zpqjsgz4b0xHvVCiXW5fG5gKIMwil1qtk7RpxVQOuqCXtQ9z4eaiCZljqjYO9SKC7IVfFCKNJCWjNxOVcWFCxaeeG8C0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a8yH0Z28; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a8yH0Z28"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2e95ab2704fso3252600fac.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749546484; x=1750151284; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX7dGgNAk4b5/FGNFMh1N632X7tTQ7n9HQAfh2++OA8=;
        b=a8yH0Z28Oy15YZ1e4h+m0tMLO7K/GBQXl+HyNPXczv2tICEtTyziS/mAbsaAfhJAcX
         sBB3U6SWRu2jwP8OF9kgBaYt3tRaTDKxD/Fc7+cQD+I/wCMGVodVTWGB2+3cICxbfGD+
         p0x/KkBdB/jryK+HpJIfv179EbZds+XsmV+dv4hDyX4zlygyjx44QKPbBe50XxuYlPnc
         Qeghgz8BQD51uwKhcQbbNy3nY/HIlI6usMmW5vGvOBkv8WSkO55B33HXy+S6A8ScGXpX
         0CBLD/pougSkaECZDkqCPfOncTi5/pZ37o+/nsjKq3PLFb9GUiWYnY0YmWuQiTSHt+5O
         0Ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546484; x=1750151284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vX7dGgNAk4b5/FGNFMh1N632X7tTQ7n9HQAfh2++OA8=;
        b=BLQZJPeE15G2YDJb4RASwHHJz/EmClrYdxIFmFnYn6liGu5UsI9QxNegVUmN92wS8u
         ArfvSKYoLNoB6rV+JPv4cjzleR0CFxGyElezyuQOGogNWhFisxYRJ/8B+NDrNLTsIBYn
         B2s38Z8nCJfcPdLst+0357iLPKpW7VKMKwMYYPobIDVV8U/sFCkQ0fL4ebZPQIlafZi/
         rA10Jiy7EVyQY160/A3sQeLopstSVtAHEpd6K4R6GxH2wSQRA9z7wWsUXkNh08guAPXz
         f4quux4sfRu2/W+MPuja85ohmAhhRkEp6I6/rn4TTYW4/pVTXApJLxXV5hAHW6DToFST
         gWpg==
X-Forwarded-Encrypted: i=1; AJvYcCX92TLg/kMs76u5mn51UKlBwCOdRBCEE31p+4kHJX9/7WC5Slk9Gf8bBAO0h/AoHtFucFBVpTZsBX5xUiJF@lists.linux.dev
X-Gm-Message-State: AOJu0YyiUtubnrEpLgH8PCw7YKuGZrsuipqJc/qjDssxnIi7T3rir0sW
	UHWybnIdwEx1p68p9oX4dnWWBfyX29SGCjuEI6vkI45DSfrfm8DQ0hFJyXv+62HfWjvxqsB8Axn
	B4imFO1bi0mNOnnUkFw9gAPAvbEg96MEbcHZIGRG6uw==
X-Gm-Gg: ASbGncuL/rVi63LvCf2r9ki1NrAQXgWr4HD3UfceN7uaU0MQslMIzbSXWHvSNMYAbXz
	qFIHiCNIKZZ20zQ5gt5xy9SdR12z9IwAC1uLQx1DHl7QZ/kobzzCvspC08EsZ8CDKVx2Hvy3g33
	GVVIWn5wNp09Sn9UFX4qNDQPKoZYRFPh54vw+dpmIABuRfU57CnfjEJyvH
X-Google-Smtp-Source: AGHT+IHMfNZCwnd6vXybcVIniDLYPuMDu8WKsskKBcpBcqOLGXZlR8IcyYwO+ilM/gtPqgyQLnbexS0m57shr3ilsSE=
X-Received: by 2002:a05:6871:4315:b0:2d6:2a40:fb9d with SMTP id
 586e51a60fabf-2ea011ab501mr10787266fac.28.1749546483893; Tue, 10 Jun 2025
 02:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609074348.54899-2-cuiyunhui@bytedance.com> <aEaQ__Dc5PSA5dQ9@902657ab729a>
In-Reply-To: <aEaQ__Dc5PSA5dQ9@902657ab729a>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 10 Jun 2025 17:07:52 +0800
X-Gm-Features: AX0GCFvRgChwovQIjyF1Kg5WgdIKVbyyt9_B3y_fvjO10aGZy-f19ZAp4iufqE8
Message-ID: <CAEEQ3wmK4LcRBuTPY0_h=tSN3kPOrbCE+w1_AbFD-mtfVNVmBg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 2/4] serial: 8250: avoid potential
 PSLVERR issue
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 9, 2025 at 3:45=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi,
>
> Thanks for your patch.
>
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>
> The check is based on https://www.kernel.org/doc/html/latest/process/stab=
le-kernel-rules.html#option-1
>
> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to ha=
ve the patch automatically included in the stable tree.

This is an improvement and does not require adding Cc: stable@vger.kernel.o=
rg.

> Subject: [PATCH v8 2/4] serial: 8250: avoid potential PSLVERR issue
> Link: https://lore.kernel.org/stable/20250609074348.54899-2-cuiyunhui%40b=
ytedance.com
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
>
Thanks,
Yunhui
