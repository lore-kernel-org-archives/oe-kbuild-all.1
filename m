Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5FE125AB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jan 2024 05:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fHY2TyKD"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e72e3d435so762475e87.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Jan 2024 21:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1704606864; x=1705211664; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2+WLp3U3zZ/tGPOXpKoB0JjWL2Gl79ktP3vftiqjZGc=;
        b=fHY2TyKD+Et9rOOKty32vDmsAARC9W5TOcipbezxPEi+cKMH4RbLWwdbQrN+7FuNTE
         lwbSCdEjNuFfowedC9vj9ixL29nsfUsypAL7Q/Jcd6yxCRIQ7l+S/ha2sW8pij7UMZxC
         8kHCRmSq1KFWN9rA3vgVnRDQs/VnFTkOxWrdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704606864; x=1705211664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+WLp3U3zZ/tGPOXpKoB0JjWL2Gl79ktP3vftiqjZGc=;
        b=WMkcTN4FxxTiKPnNFQ4/+FbriwVJbsRAgSAhJm88yTWB7ZeiI9b4EinTOe4DtqgV8Y
         vbpLJrmOCGG7Y1GMtmHqdAOvyZBbErJ1wOSnGKtAelejcH32MxfI6q2XnGcEOBae8qIb
         HH6krThA2n45b23WktpRhqhppUpwWDfKOpv7YGmJ+9iROgccOcMUsctkqbklmb+tci/9
         9fBG6DOa1YyezQl3JuQPFE2EzShuSoJSL1KNKQeWvFmIsFx7/QcxeYamXMeLlEt0BHn7
         7y+yop0p79TF7usx5sqV30fUvLwdybvNPlY6LPG2qvCo9hFblOTamw72IepnzZevThO5
         SMYA==
X-Gm-Message-State: AOJu0YyKtbTcnDz+8Gqo/yBnLUYdZvWSMXO4tdFNw44ORSf/6XNVkPvO
	KFUSc4UC5cPg4nZeLwYybRFK/Q8Unm6QDiKT9+SUs+xJNb/Vi+pG
X-Google-Smtp-Source: AGHT+IGrJa6uQEQqzkw05fjeWKDHwHC44tiqNxGn5zebsanv8FcNWMUQPlaTiOa1jcjxT7WIPmjtTQ==
X-Received: by 2002:a19:6416:0:b0:50e:a9c0:70a6 with SMTP id y22-20020a196416000000b0050ea9c070a6mr385412lfb.43.1704606864268;
        Sat, 06 Jan 2024 21:54:24 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id x17-20020a056512047100b0050e7e434e47sm713095lfd.271.2024.01.06.21.54.23
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jan 2024 21:54:23 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e72e3d435so762467e87.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Jan 2024 21:54:23 -0800 (PST)
X-Received: by 2002:a05:6512:98b:b0:50e:6e7b:1acc with SMTP id
 w11-20020a056512098b00b0050e6e7b1accmr424707lft.129.1704606862788; Sat, 06
 Jan 2024 21:54:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401070147.gqwVulOn-lkp@intel.com> <ZZnzd3s2L-ZwGOlz@google.com>
In-Reply-To: <ZZnzd3s2L-ZwGOlz@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 6 Jan 2024 21:54:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjLaBe3Y_H5WArWdQ6d36+UOQ7NSbga1w+esGYJZaVfVg@mail.gmail.com>
Message-ID: <CAHk-=wjLaBe3Y_H5WArWdQ6d36+UOQ7NSbga1w+esGYJZaVfVg@mail.gmail.com>
Subject: Re: include/asm-generic/unaligned.h:119:16: sparse: sparse: cast
 truncates bits from constant value (aa01a0 becomes a0)
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-sparse@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Jan 2024 at 16:42, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> This is not really a kernel/driver bug, just sparse being over-eager
> with truncation detection. I wonder if we could make sparse skip this
> check on forced casts like this:

No, please don't.

Just face the fact that using integer casts to mask bits off is a bad idea.

Yes, we could say "explicit casting is ok", since it's really the
hidden implicit casts changing values that sparse complains about, but
your solution is really ugly:

>  static inline void __put_unaligned_be24(const u32 val, u8 *p)
>  {
> -       *p++ = val >> 16;
> -       *p++ = val >> 8;
> -       *p++ = val;
> +       *p++ = (__force u8)(val >> 16);
> +       *p++ = (__force u8)(val >> 8);
> +       *p++ = (__force u8)val;
>  }

That's just disgusting.

The *natural* thing to do is to simply make the masking itself be
explicit - not the cast. IOW, just write it as

        *p++ = (val >> 16) & 0xff;
        *p++ = (val >> 8) & 0xff;
        *p++ = val & 0xff;

and doesn't that look much more natural?

Sure, the compiler will then just notice "you're assigning to a char,
to I don't actually need to do any masking at all", but now sparse
won't complain because there's no "cast silently drops bits" issue any
more.

And while the code is a bit more to read, I think it is actually to
some degree more obvious to a human too what is going on.

No?

              Linus
