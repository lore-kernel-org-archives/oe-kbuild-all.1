Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E84262D0B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693622; cv=none; b=pRHjmcLwQJgEkJWIEvnOj10frNRUgPCX8ERqyQy/1rsDtfWKQDKlHVUHr6ezyFjcKsmtb2zycSaAHwrLd9NUe628bGnCDuSV2VvnWrAFgcJBHUWPgykRj74xuuCoySwJwiK/BroKRJC8KztxLa4FR97yC2kDUlEup6X/8h1W6A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693622; c=relaxed/simple;
	bh=iD/1mdeio03UjcUlvp2SdLornXqNzXJEWD880XRH+O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/tqs617G4wCgAp+tln/umO0Q5DCuU5r7zzAK4nI0vbEcmV38FkFcAjiwdLSPa1LlH8jQ74Z6bqGoWOd//HcUvuIahvQ9YHe1BYEZMnGycdp8Qg337p47vvxCKqLsnGcV9UI5hGiIV4kQKpuL55eIFjdPJ7VhrbKXU6n3afMK7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WDtYE8/v; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WDtYE8/v"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ee651e419so349871f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 May 2025 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746693617; x=1747298417; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OohA5Q8AnAMNGpiiDuSIocfhmzw1bw1/ZN+QvKo3p8U=;
        b=WDtYE8/vE6PiB7YiHTeE1CMTsjjkgbaEPEwWXx9DC89pgU/D112p7CbGqDlwwxy2iJ
         eFhdbWwrb5IF+c8ucu3zxe58meUgN4DDoMYR/DHD4MHtGrANew+/uYVZq08g5q5VVSFK
         NhfmJbYVvdg7yqjqqYTxgHzh6TnGyKVQpAZphq6HBFbFVe++oiJZXRh2hAYqLBR3XsQT
         Bha337aboTD7yYbsMFrfP4vIuPYIoPXvX1eJ0PE/3FoyUVlyW1FSfoOxZrfeA4bU2yku
         ZVQOcj4hQHSUu2gOKDKpnHLu8gk2A7ljfDFhPpNYqSRTvH3P9B0SxiSKE3P7PlK2VVrL
         xN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693617; x=1747298417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OohA5Q8AnAMNGpiiDuSIocfhmzw1bw1/ZN+QvKo3p8U=;
        b=BuHlz5pbficS0Y/aYR0fCoV+pBvSMQn10pboI7eXqfgfU1x7nkeMKj49WozMcQHAon
         0ZE1nR+4Y1Ek/qltJMaYRSMY/+Q5vBz6vSD7g3PNwkNb6B7nMmMtF/HgHX/zgTlop1zf
         QG5j0kZOFT6wiDgtob8Mv+I7NTTaMJyZkW8jop/D853u2gwIMCBqo0uaomfwHGgibgyn
         oI9n/1gzS1xn1Q+GArBvkZnSoKZm1pFov86dJyE6M57R/v3/G2gbiGBBx9lrTcqYWTH8
         jZIrMYEk4jh7ZkrCxDzYnLJf+w5cywcPXAzz+i8dsYJ2W71QHTIwcRwKetZlOeijEwWM
         xq1A==
X-Gm-Message-State: AOJu0YwO75cY1FOTtRnZsPS71wQSPHP2U/mqBtUYAxs/VQnEsGKQW6Vd
	dnlnT+tW2WCSrccyyBPgLtfDPVOstEqwDAKh94y+YjHO9CW1xfkhUdZNuhSXl9HmpbuMtYkMGGk
	VHLi7HaZeFEdar4cfH0NH5v6H3kLowR62Ar5d
X-Gm-Gg: ASbGnctWFhobT6Npoch+zGYHjrc0q42NANEzWkw7B9AvzDxYdVMQqpDIJrh4gJaZ0VC
	xg/nVb09grRruKQPAIp6bidwM3ZYWp9QhpABcF9txqkfpXkkfo7KjpepwknB9m++MEP1JWjh6pM
	VHTMgSkQKYeheUEiiCAxLJ3i67o/g+jcNIDWi+tyBb7O3v+7teLmN5
X-Google-Smtp-Source: AGHT+IF7JZRhsf2tu+5oyyyE6ipP/MmJDUkeTamdsSsC2bNX6ZZIXNkI6EKo8Hxai+vt039sBJnW2KVDSA0r9zk6L6E=
X-Received: by 2002:a05:6000:dc7:b0:3a0:b4f1:8bcb with SMTP id
 ffacd0b85a97d-3a0b4f18cf3mr3530418f8f.30.1746693617526; Thu, 08 May 2025
 01:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505071753.kldNHYVQ-lkp@intel.com>
In-Reply-To: <202505071753.kldNHYVQ-lkp@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 May 2025 10:40:05 +0200
X-Gm-Features: ATxdqUGSusmuNWP1YmEm-gHR8F6R0lvKA1Codshvk2zWa-S1-EMYvl6xnMJuIqQ
Message-ID: <CAH5fLgh2=vGj47bm-FUO8CCQX_2dpyTfF1OJmOxZOoPQQ+fPXg@mail.gmail.com>
Subject: Re: [linux-next:master 4752/5832] error[E0433]: failed to resolve:
 could not find `mm` in the crate root
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Andreas Hindborg <a.hindborg@kernel.org>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 11:29=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> >> error[E0433]: failed to resolve: could not find `mm` in the crate root
>    --> rust/kernel/miscdevice.rs:17:5
>    |
>    17 |     mm::virt::VmaNew,
>    |     ^^ could not find `mm` in the crate root
>    |
>    note: found an item that was configured out
>    --> rust/kernel/lib.rs:64:9
>    |
>    64 | pub mod mm;
>    |         ^^

This is because I ifdef'd out too much of the kernel::mm module with
CONFIG_MMU=3Dn.

Please see this patch for a fix:
https://lore.kernel.org/all/20250508083540.3832900-1-aliceryhl@google.com/

Alice
