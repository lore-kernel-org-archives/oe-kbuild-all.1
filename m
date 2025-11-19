Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C82E1DF980
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569398; cv=none; b=npeb6uv+RBsTTuq93qZMKg13VccOjrZCuO89xIgJJ+ffZzn3OUrtgRoe8jopCAIMGkTSBjs/Ed5vpvNI935TpxC353g3bWL7NnhH6Fy6lh3j3IkF6R4hMhFj/7lVII7rM/2eXZUsN2Hkj8vrbjftVdKFoW+ZCvFM/YEBJiLYFeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569398; c=relaxed/simple;
	bh=UKD3Ih/vdXts1YAdrLZqIWg/yDwIkFf0XJQHTJ83sEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H9lWNjLj0FYjZAYUg81ei6m/9mgbA8X5OfcqsYoF0ub93CAiPAmn+ZS7ODCWlUhdQnUmDbePilchmJLZYuoIq9q1WnzkcZrS5dv97W6dsk9wdZ9hElomwS0hpSIVYiafFCI8LGt97IDi/INrd8FSm5W8chbVvC85/uIpPRypJa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PArixiAY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PArixiAY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b73a9592fb8so220385466b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 08:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763569395; x=1764174195; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2SE94M0Eu3i3U+0dCVoKdz4qQM+FPRKFn1N8b2gaTM=;
        b=PArixiAYziEDg/heQDjivd0moAoEUX53f7o/TaM28xdecdjMyqso/ypi3EgjyH4lrX
         0sf+LcsAN8xv+t+ynD8zCrG59H+3ElQog/CRgkw4jPibMgLtEZC4yh36f98+hgC9a6Tu
         z3D7iU43ExbXZjNpji33GBR9e6JH2jeWU5+cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569395; x=1764174195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2SE94M0Eu3i3U+0dCVoKdz4qQM+FPRKFn1N8b2gaTM=;
        b=mkIj0KhwPsJ2vWL6Y0gK/W6T+rIhyfA+9HDBY8SI3jFu+sLWmDmgXbmPYQgLicNLJp
         q6zyA9MdK/s6MMC34PDJLhwSTdSRDegOddhhJ5mY+IzB8rJn7v14pH8SLEWsJ2p1Ucgi
         1ImLtoxTA+WhmcfuPz73Hka9PedyMWfrCdPk8xkqVMC/Dl90pdt7G7fBnutcZkzGcShJ
         I1OBDG4p5AsRzNLjNifniJcxOvVGBlaLDH4fAvYe8yQeGS6FKqD49E+NJ+H/+ADDH0OT
         4xuuCEB8RIACtCkcAQk6I3f2OjOQ9kn4qG+cGTypgKQ6UbEWuPoRX2jFllHQXrBrUgF3
         PjdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3p0YXaYI88bKVlfz5o+kTLE56gWBRXLrpxKcl0MnE7JHPQywrbmjUd7INOStlArIddauW+8Uu6FiwbLYj@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk3j6MBmuCCcP9s6ZutMVFmxJVWFNfpzgE2z+Sl2h7jACVRWKD
	Vwr0w34IGczdrQjBWnWLt5syMGaKyVD/V/CRrNd7nzY1U46gBIGuDZxuGVJIYiXArb61CdN4UOM
	b16bVhDw=
X-Gm-Gg: ASbGncvgveWlEtYjnhdXPaqEpiLfNaTyQ7wFg5gehS2GWsLiL692fHtL+Vjin9Y0Hjd
	G8DlYN5H2F6l5f7qNBM3Rw5HWJ2N7MD6QAi27uuQfGir4RlEWYy7W17ZwRT7iLk2mp8M9pAGrW/
	UYEu2SqA7s3LVA41AFcRgkdgi1Z3MyoAe1DZyjJaaAuL84eku/gIWlXNAQk2+uUrS958E0K7jvL
	mtKuew/8gAs2Nzfk6RB+/EHaIWjNOxmRKt4aay42cJXcVaAZkfQBAehu1eHHKibCUdTjEih8nmc
	4lLlRXwlTmXYIkQQwCxT2f4I/hSawtJ7uHtodS/SutyflCIAH6LI1xmHcoZe9Js+ib1bcFZ+KX9
	qkxt5peb6cUzYl9cWm0T3Q2fpgXh8ny1n1XZ9o0uIWXk9bTGiZXLGG5FL9W9btA93AG4qlYVhV/
	nv7hjpoODgx/HxMEh/dThxbrk8eFrdCnIx+9APBm2RK2POG7NDCxiSGggQkrrF
X-Google-Smtp-Source: AGHT+IGZTgLJccQ8Y7St3RKiYe31NXRyVHKN50159KiqCG8CxD/bRlzx2r/avPxYUFyji8Zl1Q8Hmg==
X-Received: by 2002:a17:906:29d5:b0:b76:52d0:3a0b with SMTP id a640c23a62f3a-b7652d03d3cmr24075766b.25.1763569394664;
        Wed, 19 Nov 2025 08:23:14 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81223sm1690578966b.4.2025.11.19.08.23.13
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:23:13 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b735b7326e5so195333266b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 08:23:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGMM97T8hdf6fn/EmH+KVBJ3m3pUBwSyamG0P0A5yOoq6JX6cNQUJlSHahFcYHzBkkpK5NhJNpSQ5faydz@lists.linux.dev
X-Received: by 2002:a17:907:3f22:b0:b70:83a2:3f5a with SMTP id
 a640c23a62f3a-b7637f09c18mr367914966b.0.1763569393225; Wed, 19 Nov 2025
 08:23:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118170240.689299-2-Jason@zx2c4.com> <202511192000.TLYrcg0Z-lkp@intel.com>
In-Reply-To: <202511192000.TLYrcg0Z-lkp@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Nov 2025 08:22:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9+OtEku8u9vfEUzMe5LMN-j5VjkDoo-KyKrcjN0oxrA@mail.gmail.com>
X-Gm-Features: AWmQ_blvNYn7H28EA66iZpW2y6IrvCN6ellqnQuobuFiTc4oP03NDclyafTOCUE
Message-ID: <CAHk-=wj9+OtEku8u9vfEUzMe5LMN-j5VjkDoo-KyKrcjN0oxrA@mail.gmail.com>
Subject: Re: [PATCH libcrypto 2/2] crypto: chacha20poly1305: statically check
 fixed array lengths
To: kernel test robot <lkp@intel.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Biggers <ebiggers@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, linux-crypto@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

 On Wed, 19 Nov 2025 at 04:46, kernel test robot <lkp@intel.com> wrote:
>
> >> drivers/net/wireguard/cookie.c:193:2: warning: array argument is too small; contains 31 elements, callee requires at least 32 [-Warray-bounds]

Hmm. Is this a compiler bug?

That checker->cookie_encryption_key is declared as

        u8 cookie_encryption_key[NOISE_SYMMETRIC_KEY_LEN];

and NOISE_SYMMETRIC_KEY_LEN is an enum that is defined to be the same
as CHACHA20POLY1305_KEY_SIZE, which is 32.

And the compiler is aware of that:

>    include/crypto/chacha20poly1305.h:32:20: note: callee declares array parameter as static here
>       32 |                                const u8 key[min_array_size(CHACHA20POLY1305_KEY_SIZE)]);
>          |                                         ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

but still talks about "contains 31 elements".

Is this some confusion with the compiler thinking that a "const u8[]"
is a string, and then at some point subtracted one as the max length,
and then is confused due to that?

Because if compilers screw this up, we can't do that 'static' thing,
regardless of name. I'm  not willing to play silly buggers with broken
compiler warnings.

               Linus
