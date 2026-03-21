Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5212C15B2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774085059; cv=none; b=kO3dNmJhu/LGcjjmR0hw3cXgrwnd/8DbQyot6JPFdRqIYevJ4A7Tn7qY3oX+xm5P0ihHnviJ0y/D2Ocjvf5NvgVxLCXe0rX6i4IZ5/1ptHzbL8sJlWE5mHYhVhWJPtdB65vBXBT2VUvi+cCyFbcYGbBb1s/uEQJ0bE8hSipfrDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774085059; c=relaxed/simple;
	bh=U3aJCimxyal9WncwjUa7otBiwDk4hsVeIrL5eEW4tVU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhzE3v3e9qDRAc2Ph+rNVRgaL+AH6kuYXQKRIMZNTy+lHleVixpFJyFMLPJ5ePfS5UP15LSeT0i3Mm07ZCpCSbEIPfZ19AfthtYjKUyRx5dGOp3dsai4hw4IiqT+fN7cCSD9+w1kc0AI84cMy1G6Mon7znudJMHMmOOAb4AHaXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJhzGres; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJhzGres"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so25375785e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774085056; x=1774689856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hj6a13EYucDZ+CMGYDSkcJt6QV/xbeGsZkPLM9UtYKQ=;
        b=SJhzGresB7PLRQzrJ91DkatdgVUh6VBPPksnhiTvXeyul8TThIgb8KuYIGXVDQXOpN
         55xvcaIO1TTEJzyXmUcOeYdbjq/9D3lwjDiugKVBKv97ngqs37Hk+k/lSACqHa4KMCuo
         eupuarBW5jpydLgs5dOC+XAF+GUn7PEMdwyC6GtEQueccvMl5YZWS0ZPCGo+2V4LuicK
         IepC+QycNK1qEtpOpM9pa6wjIqgCq4Mu/9/nLy3l7vV0HB4ez05iuloFLZYFrPS8e2Im
         glzCVamyiIF5Qry8o7nlddqtQ+BKLJ+TICDiZj7UEM6EFZPrwxgEYRn9lxMW7z73v2C+
         lL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085056; x=1774689856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hj6a13EYucDZ+CMGYDSkcJt6QV/xbeGsZkPLM9UtYKQ=;
        b=ZGqivqPuBlZEK5rrvsjTd1nH4dXXMYgMrCxtUC8dgNNVWkZLZNrhCH1VYgTifCbdk4
         3VJpAfJ0iHgRpDDPbpkw3feYlP+GDTBSGXg5WWEOXqFHMlw0qKj09Nuv2SxCPOb0NyIP
         sBN9Iv9DuphrZ2XfC7L1Jse28h4t+KsA+qKJlWC9KQ0YZEmQIgPqaFzpYw9juUML6aX5
         MsfEbKVt2FrbG5zPrYwPP+rfUFZo2PLXZ7bribugXOZEm7+57tbhJtFpHAuIrZw2hWOF
         XLKqhjUYCgcAjGdIGg4PS/odlZ1wuq4QlyxrAg71xc+T7B38dkL+cZu8G9FC+Akonu5o
         /NEQ==
X-Gm-Message-State: AOJu0YzeQWaPsSdaNEr10ASMTXlLODOY8z0b2vk8ucctEk897yDX00WO
	Yw7AZme3blJRdK7OSeo3WwG86IXeg+gjn2KNwvWalEm+/80sqEN9yCZm
X-Gm-Gg: ATEYQzylK/ytqVhqDeitSdtIhUD5UUU1roPhf69qh0WMQFQJX2LciwtdKMY1qLdJk3L
	TNS1wAu/fWW/VZY6Mv87b7gQgopKSnRYwERDBt3URmPJPpehtn2CGdwy2BtXfDeZSOdqlWorrj3
	lNMiC5Lg1AUtCkL7roCya7BdTgsSTFmahTJYTSmPlvzziggSWdPdvQ54+ch7wDT/KHyfbYy2sqt
	p10sg1W9p3n0txJm7jp9B8Dht11Mxn7kW2ho7XjfzVSMZHpP3uGZNdKtigaNXJWTzpgN5+3nUB1
	GJ0Sy7v4kNDfHrCSdB30sC+lc1FmHlEnc0Ho2tJSaNFJLjJw6arnLCTkQxHxg0cNiylMgMqJpfq
	xhlQofrRSSOTX5Xxfr9bPRtwNbkbcupDIsvuiCK3by9U+ZgEbvo6QnHoFYFCLhGkZlUIGcdBrqT
	wQYBJGs/Zmff2zUZzYA/LRgXHrINugBj8g4b7yuMkFjd+AmKVSBHLgAltjX4VwOh1p/Ewg816DH
	Cs=
X-Received: by 2002:a05:600c:8207:b0:485:3ff1:d5c3 with SMTP id 5b1f17b1804b1-486febb449bmr76203835e9.5.1774085056253;
        Sat, 21 Mar 2026 02:24:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc61dd4asm160164665e9.14.2026.03.21.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:24:15 -0700 (PDT)
Date: Sat, 21 Mar 2026 09:24:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Nicolas Pitre <npitre@baylibre.com>
Subject: Re: div64.c:(.text.mul_u64_add_u64_div_u64+0x40): undefined
 reference to `__multi3'
Message-ID: <20260321092414.542ad642@pumpkin>
In-Reply-To: <202603211216.YTKRdi1b-lkp@intel.com>
References: <202603211216.YTKRdi1b-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Mar 2026 12:48:23 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   42bddab0563fe67882b2722620a66dd98c8dbf33
> commit: 6480241f31f543333ed0c7a209962412461f6e41 lib: add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
> date:   4 months ago
> config: mips-randconfig-r122-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211216.YTKRdi1b-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211216.YTKRdi1b-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603211216.YTKRdi1b-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
> >> div64.c:(.text.mul_u64_add_u64_div_u64+0x40): undefined reference to `__multi3'  
> 

I thought someone was going to change the #if so that __multi3 was defined
for compilers after (IIRC) 7.1 until at (also IIRC) 10.5.
But for __mips why worry that much - the function is quite small.
Just enable it unconditionally.

While this code only wants the 128bit product of two 64bit integers
(which is a single instruction) the full 128x128 product looks
faster than the fallback code that uses 32bit multiples.

More interesting is sparc64 - where __multi3 can also get called.
That function looks horrid - I presume it is carefully optimised!
Without any comment it is hard to see what it is doing.
(Not helped by me only knowing sparc32 from 1988.)

	David
