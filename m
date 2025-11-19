Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5DE3563D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571471; cv=none; b=Q/Pih80T7/5KNhKAKtg2Pt9LXqOYXrrimmrevfhbPfz3CSKcrAaiR0Yh2p52zlPVGfBe2o1bb8bIoWvfl1RlbSmNmz720lo0nHZuBILIXKnb6IaWFa65WrLqquO8eNFBYJA2Rv7P+/quOBksoVH4/l9Sf5JJmNdocDoHqQP3Jy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571471; c=relaxed/simple;
	bh=3qbmBlDOhBqpexe2KgI2APMs04wdSfYxDR78bi2WaDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zbsf7el2iviUY/xlZ9Qm6EAHA6iWJ9vdNY4KcLBKNWnHxDejSXvbbELF3bo3hrkVQJ2wz3ZWkDeqvci/ZfPR/IHy051aXWHI5iGXGGVf5LHM8a2FC6aOdpb+dcP6xxseel79MunOCC6P9D87Qrlbk4akEUw1g8v/GPPNCXcRuSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MlNOF6wz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MlNOF6wz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b737cd03d46so654263766b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763571466; x=1764176266; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e5xr7znsz2E58DjiH4TrOVRBZvkxR+ArNemRIj4DQcU=;
        b=MlNOF6wz8z4x0/xr9X5DFWclQyRS31JLnK7lEZMn3LbJj03jOPrxcFbkRX9yO+h+ga
         K/52nwAP7SJWcR0qF8D352XRcexn2Z+DGt4b2x/HZSXEapYWcW88JxFWXzU3Y4U4CVr7
         ihWsgDpvcZyaS+SLHyM/u0Ge/luQG8RsT7UgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571466; x=1764176266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5xr7znsz2E58DjiH4TrOVRBZvkxR+ArNemRIj4DQcU=;
        b=HJ/qciJ+xMdOszqdhVkQUKU9OGscS48jXbnHmeVpPG4/iOt2RXvKHAEfV1ebXvUkiz
         GqaA6+BoX3hU3r4ubuQOpUCsWwzLtUFngXWr6iu/ODXoVLW6O0vWV42iaglqvizQLBCM
         wTKU4trFX02cEGUwEe24VckMf5doVw6IFvbFZ+SVoe8FiMe7usyH2qJpm2mGdH+zYPYM
         aqQNUlWD4MIk3tMltLEtDsIhsRC7JmzDCPZZZmUvPs8d5sPTYuV0xTlaBFYdORyENVJx
         dNpOx6sI4/hBtqAIZurpsGBrLyidgQCwM2XMHziB+7ZFknE8nO+2h7hxYctguzYuAIam
         TB6g==
X-Forwarded-Encrypted: i=1; AJvYcCXq8HFvJXnFfF8w0aeIaktxb5RYmWhgt0raIHg8aTlCeeW4FNn5pC/TClzCsk2iioQIHUOAnQYw4qHARgsf@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1ZbxDAVv8yStIwBMxEdC+O6OStv9lTuu59pq1HL8ohGT1A1v+
	8dZNIcEAc30SnsRe6xbOtMr/6WNe+/HHqwhEV4kUgnXj4NvFVKFMca0XNSEZUrX1KHNr/3Tsi6r
	Irwx+MTQosA==
X-Gm-Gg: ASbGnculqmxZwMPVErAmBBNn1EJOR8kZx7ZTn9cy296r6JtRS0kUu5/nIA99ZM/vTdY
	BTXODE0XrLq0leYnQMFjlF3CyfO7vy5ficLTAvlZ+aSH2Fsx07FmezMaj8IL2XrArfyaQRxfIJy
	SXGaGdiXlol2+5WGqi1XYgr3USVJWVN/1WEaZSV0CaFj7IVLT7LjzgEKoOqEJb6LQMob7rMxY23
	GWoXCcsP1noJE87+N0eENbIwNn1TTCC5HDvum1Hr9ortJu+P5thLuXcsoE81WIia49CLZ/9YqlM
	y+9bBnQr4CD7lChomPL4k8GTtjzNjH2Qcy2OLXVSjGrjJjMthdIXoWO3EqyeEn1MHFSMnz73uwb
	cIMnad8FDRTxhhDqQJHOTWa5hYxq3lmsJhFu6TZwggW5j1TmACo7WsR8dJ0Vt9WdZu2/zjL0VwM
	l2x91YdDubxyz2ZVsMm07ex7h4H3bEelSAA43z4xPxAXLyfTgogBwVhiLj0AxG
X-Google-Smtp-Source: AGHT+IEZVCrxY3Zmz8fJUBYKWpXKKhUUeHWkjsLXNdw1f2hP36TPpnbfhtRrC2L9qSfJEvreM7LbsQ==
X-Received: by 2002:a17:907:6e90:b0:b72:d43a:4fab with SMTP id a640c23a62f3a-b7367bc3f44mr2181688066b.43.1763571451501;
        Wed, 19 Nov 2025 08:57:31 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81296sm1693077566b.6.2025.11.19.08.57.30
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:57:30 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b728a43e410so1151740966b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 08:57:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX22b2toRRLZFpBLb5oBpZ7KpTQo4DZRDwlYRqHb5yug6jmeW4b5p+MEhE+7Jr/mm2JyH13yv5oY10HYLag@lists.linux.dev
X-Received: by 2002:a17:906:478d:b0:b71:9c99:7b8a with SMTP id
 a640c23a62f3a-b7367bc6b95mr1993595766b.49.1763571449725; Wed, 19 Nov 2025
 08:57:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118170240.689299-2-Jason@zx2c4.com> <202511192000.TLYrcg0Z-lkp@intel.com>
 <CAHk-=wj9+OtEku8u9vfEUzMe5LMN-j5VjkDoo-KyKrcjN0oxrA@mail.gmail.com> <CAHmME9pvgyot-PJDbWu1saYagEYutddc_B9qNHf-MZ-vkw4zoQ@mail.gmail.com>
In-Reply-To: <CAHmME9pvgyot-PJDbWu1saYagEYutddc_B9qNHf-MZ-vkw4zoQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Nov 2025 08:57:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=whjG-B517DxHm5rSE0S76n+fHMdnJdqFg9VTvx6-HgGRA@mail.gmail.com>
X-Gm-Features: AWmQ_bkxxp7Yy44j171fiA9Z2Xle-tZAZS12NBySFcI47avzcJvVuC9gPT3eA3A
Message-ID: <CAHk-=whjG-B517DxHm5rSE0S76n+fHMdnJdqFg9VTvx6-HgGRA@mail.gmail.com>
Subject: Re: [PATCH libcrypto 2/2] crypto: chacha20poly1305: statically check
 fixed array lengths
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: kernel test robot <lkp@intel.com>, Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 08:47, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > Hmm. Is this a compiler bug?
>
> It's not. It's a 0day test bot bug! My original patch had in it some
> commentary about what a bug would look like when it's caught by the
> compiler. In order to provoke that compiler output, I mentioned in the
> commit message that this diff will produce such and such result:

Lol, ok.

I sometimes actively just whitespace-damage my "what about this"
patches to make sure people don't just blindly apply them without
thinking about them and actually look at them.

Maybe that's a good policy in general, so that the bots don't do the same ;)

            Linus
