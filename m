Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8193597E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736113903; cv=none; b=h67mc1QdMA/J/3dZ+/julCX6vUnCJcR9gPrMYOBHkLaO65EaahToUPBMxw7eI7YBWMA3alJ4H7qAZcXzDJOxFmaovgZGKIjRmW7eHV55uEbVc4Iz1RdBD9Vo8vb6nfCIU1On6IB1oI5XTWkzGjhLVcj8KUgtZYtLKJ0r13Pn1X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736113903; c=relaxed/simple;
	bh=+Iv4GzdSfyP/K9u9CoJb2eqJJr5fi++CFIMk1H2xTVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlH92FeBdvTc65J9QKKBcGjP3n61vioaBjNG8q/w55i48WAFf1wrJZwC6/AfZE2IZFbXghER0SwZ0qd7hW/hSDrWJ82QsQ2+70vy1sXv4xw4C3ZzvVcEhF/JKoYJH9JdM+skMep0FzFi62yZua6UTolxaC/SxQXJ1eqGw6oMXzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QUy/w8FQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QUy/w8FQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso1544868566b.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 05 Jan 2025 13:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1736113899; x=1736718699; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rpmRkGX5eC8WQcFjbwo5fM+X4EHi5ZBIwXmu7JGQna8=;
        b=QUy/w8FQRWZ+HLLaanmYNihigbiEEkE1W6+8p2HIq8sIydB5ESwZAyJ2IN8XR5lbcG
         h2Bhe+VTzdxUVv7/QpbUkjfohPNt1dQjeS2ib1rtNYsBI96fJrdCNS/c6uCVr16dWhGz
         Y+DR4p6WIbKSDia/+zkyGciKdbD08YlcsRvMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736113899; x=1736718699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpmRkGX5eC8WQcFjbwo5fM+X4EHi5ZBIwXmu7JGQna8=;
        b=w+PYvkelpme3XPxHnCAvMeMZZYl9cB2MZJooxfGUy3VbNm7nnncJdD/RBtZkM4QRu2
         CbyjK2qmJWwa7iBZoQYVr/HOMI4eo4KaADSQgAXG+pWY63A57YqlzSJo9ZV8JTnmk685
         +2NeqIGVTyD5zYN1bJOrU0ztSRbrxnenjJWsCLGNrctvxFoXpVYu2cQcp23WAdmHknH0
         YuiuaRreGohrmCbv8HmcaOEbALFziVg2ubKLy4pTxEWItOJLycgg8OpusRsbO+3sJxeW
         qFV4MbvrpHwtKuv6Yfxd56JehbQDZ4HezwlF2d/pyKCv+7floWNNRphzcI1lQzHjs4SK
         17OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2mqtyn2q6KjkSyqjwldDfaj8s8YF1PeoKT6kKH/mMLVxO8JLDJo2VMXJmnMiqDxFexoMfltyRoPjN1Ie@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7ikw0pvx/rISJJr7PK20smpOwywauOqwAf0RqZieSlYTodq1o
	610jlkMT+cflmIZzyQ/OqwkP/LS595vSM0xSmhyZ13s77hhz0QFI2xzYEv61n1vomuAsfgMdug/
	pdUQ=
X-Gm-Gg: ASbGncuh2IPqNhtPOLPFdqcQ6e0Wn0EDTLz5FdKhxl3QIlbfXsC/XjEwAnl0SAjDoEA
	xSaJOIlnvwefC3Dpgkc0Q8Ici6B8MkWlskkOxinKEhZDtUVH7hgESj7BoKKXR2g1geEJ8V3wpZ2
	d2i6cqkyEUa6dHpVk7b+CWVH4b//6sVKi4Xf/YHGiti8qcdMTtjnPb4B4Zj2m0T/aCPqbMwsnR5
	r3G3vQoad4JjzgnWDPE60Nox1/NaJMrQoTpZ869S/th0GAy4vvuE3sg13W3qoP8LqKFWXrhmZAt
	je3I8dPErVl2nptB9JvT43eVWs+YqqM=
X-Google-Smtp-Source: AGHT+IGny7PO+KuUVDPAse8vv61MwSVqZZMUkX2AFpp21o7lv3iya1Y9G7gLNyW2w/ZYz6gFItWmYA==
X-Received: by 2002:a17:907:3f1d:b0:aab:d7ef:d44 with SMTP id a640c23a62f3a-aac2d326ba8mr5022206166b.24.1736113899498;
        Sun, 05 Jan 2025 13:51:39 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f013900sm2183395566b.144.2025.01.05.13.51.38
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 13:51:38 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaee0b309adso1622497866b.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 05 Jan 2025 13:51:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0u9aR45UZLjTtKWyWanO93k71JHhhcUP0aD25RUN+LJaym5PYTYxUN7Ju/BP8DO8HtJdsKwb7rOYH1AMv@lists.linux.dev
X-Received: by 2002:a17:907:728c:b0:aab:9430:40e9 with SMTP id
 a640c23a62f3a-aac2d420441mr4954091566b.32.1736113898164; Sun, 05 Jan 2025
 13:51:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501030516.uZrwnuQQ-lkp@intel.com> <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
In-Reply-To: <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Jan 2025 13:51:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com>
Message-ID: <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com>
Subject: Re: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, Greg Ungerer <gerg@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, 
	linux-sparse@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jan 2025 at 01:22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Perhaps this is an issue with sparse?

No, this is just m68k doing disgusting things that happen to work with
gcc, because gcc considers casts to be lvalues (which in turn is comes
from some horrid C++ thing, since in C++ casting is a whole magical
extra complexity).

IOW, this m68k pattern is horrendous, and sparse quite reasonably
complains about it:

  #define umul_ppmm(w1, w0, u, v) \
    __asm__ ("mulu%.l %3,%1:%0"                                           \
             : "=d" ((USItype)(w0)),                                      \
               "=d" ((USItype)(w1))                                       \
             : "%0" ((USItype)(u)),                                       \
               "dmi" ((USItype)(v)))

notice how it has two register outputs (the "=d"), and the destination
of said output is not a proper lvalue, but a cast expression.

I think you could just remove the cast. Afaik the w0/w1 arguments come from

#define __umulsidi3(u, v) \
  ({DIunion __w;                                                        \
    umul_ppmm (__w.s.high, __w.s.low, u, v);                            \
    __w.ll; })

and __w.s.high and __w.s.low are from struct DIstruct, which uses
"SItype". So all the cast does is to change the signedness of the
variable, but that has no *meaning* when you assign to it and the
sizes match.

Alternatively, you could just use the right types explicitly and write
the umul_ppmm() macro something like

#define umul_ppmm(w1, w0, u, v) do {            \
        USItype __w0, __w1;                     \
        __asm__ ("mulu%.l %3,%1:%0"             \
                : "=d" (__w0)                   \
                  "=d" (__w1)                   \
                : "%0" ((USItype)(u)),          \
                  "dmi" ((USItype)(v)));        \
        w0 = __w0; w1 = __w1; } while (0)

NOTE! UNTESTED! Treat the above as a "something like this, perhaps".

              Linus
