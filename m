Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1581A2C29
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225011; cv=none; b=ANXpuwZItvBSAybdcL/u3ltq4X0+PjXeTUSybN4Y5wF6WDLtUHfY6CKVcEaHK3YBRxWZFLrwOwnimVKO7RHWKtjrGqsGsD/s33pKD9qjQhWh2DQsg9BAd+haQicm0GlWlrX3kxTgMprya8reWGIBTcqpv3RVe9z1D6M1WlkruoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225011; c=relaxed/simple;
	bh=thFpIKSrzc48zBWfFcfPLiqFrhjEdaU6F0FW+zf4rsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nch1UwUs8vBodoD3vFFvnYVSh/lChs5sp+YrzE0XgdU8iFaFX4YZHy2gCAaKxseXexAZEAkw6rvHigi4xVAY3fqtyw3JFT84BHmODkYgOHa3lnidRGqjNZNlt9oLQTYppYyDdl1u46ULndxiFxwFBpka8zUHkgHG7A6OslUMhRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UvQvna+G; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UvQvna+G"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-438a39e659cso2907505e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 00:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738225007; x=1738829807; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HbemEf+xhUc2mT3lWThkeJWiexh/Of8vPXBaz6+0qAg=;
        b=UvQvna+Ge6w5HgC5uqrsT1WtfgncLZ3AnAEd/4NW92VzH6ch7IYNazA0FwpHabfCzH
         D4/FKOf41LhmCpt4zcB9B/vU2LLEdownjB4AZg6DugR5aOq0HX4ewM74rYDfVruQYSny
         DQ8cGPXR/Rp00bt2tnUvIhlPLwv8qoyDv5LOjw9CcWRCs0FUMUXtlmGIE+0u7E/7uD1t
         exMbTIgnutAi5dCLCeYqU4ynUSpS+1R0nTQUQhTGdlr26Q/J+5xDfCjN+4EHi1Utvi3G
         eHKq7KJY6Zv9UD7WhA8n4bHZYXHP1o/aSXb5CY+x/XCeJ8tFuqPCt9UN4yoazqBfjB0V
         zrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738225007; x=1738829807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbemEf+xhUc2mT3lWThkeJWiexh/Of8vPXBaz6+0qAg=;
        b=HhuU+2nHW+BK/vRtIEYgAw0xNKT8f7aVzoqLVl9y77Q8lVfTdASwDjUpII77kXfk/c
         cVOGSuAcmSYUueTqc6J9zvAFI3GZfnoGg6yDE9btXwrdd5bh5qskMaxrIEvYZ+yZEBpt
         pbkRmeDtrBfrhPwO/MZwUcTOof1Rmq5pYhkV/7/Lstze0pYuFoEnJ4CYpxIBD4GZadQO
         kan5hV/eKvH1fiKSs1uAD0SngctI1Y8LCAbr7cfUl6M4/mXq0FgvX5elwKp59+ewXqz8
         54sPxnWLx+KnE/Gy75m7om/7PfL4RV1/zY2nZ3k3iVqc+WZrSShl1gFmSvqK3XmJFoHn
         bnBg==
X-Forwarded-Encrypted: i=1; AJvYcCWovcoBmQUhbYG2s/lau6w82L+xx6DB5KjBNeKOY8Zta7gwHV8SxijgdqiycGJ4QtzYpnR3N5Abfo8yecik@lists.linux.dev
X-Gm-Message-State: AOJu0YzSgryygMFpg9xhSQIOhsHBYEgPg9N2SirjyzjnEjuB0IrtVdK3
	t07D8clohwVramWUdvqwBgc5ZQV15YNRjf/XGV7YvKCeXlNTjqtGyXip4V/e3RI=
X-Gm-Gg: ASbGncsd1zg5a4En15OikrZIs5+qJjLGHV9pQFi0lb/UPg5PSUAPP920cxXqX2mK+yK
	Y17PzPaKypHxC0rOelB8NsdjXbg8VM7iCAlb8yrPzIVslcObKXeBUrNqQ2IqQnBA0GDuntl4+q9
	pfMszU6M382Q5wx0LxcsGf+O8oJvEMdPOxwY5P8XEOSt+XPOQwLp+FQcbFece4L0rGkIwOUiJ4X
	19CsUkDQNP/S9abfSUQagrFFeECFzH+i1KjmSphWi9DF4Sq7VGq8jzo69QSGtZtqCLUhuu6Qwik
	qaXOGv/YtBZ6lqKQcXGU
X-Google-Smtp-Source: AGHT+IHhtr9w91Nho4TPvuAAvm8MqwAGRZsNV86QLdJ6VOdB7b7cJnCAZnjkLka/hqqB6XtKlVfCAg==
X-Received: by 2002:a05:600c:870a:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-438dc3cbadcmr53604745e9.17.1738225007382;
        Thu, 30 Jan 2025 00:16:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df1esm50323705e9.27.2025.01.30.00.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 00:16:46 -0800 (PST)
Date: Thu, 30 Jan 2025 11:16:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Dan Carpenter <error27@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	oe-kbuild-all@lists.linux.dev,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net] xfrm: fix integer overflow in
 xfrm_replay_state_esn_len()
Message-ID: <f86c7660-0910-4ca2-9ff9-d2d142a968c7@stanley.mountain>
References: <018ecf13-e371-4b39-8946-c7510baf916b@stanley.mountain>
 <202501230035.cFbLTHtZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501230035.cFbLTHtZ-lkp@intel.com>

I've added linux-hardening to the CC.

This is a fortify false positive.  I can't reproduce it on x86 with
gcc-14.  Perhaps it only affect mips?  It's a W=1 warning so it shouldn't
be a blocker in that sense.

regards,
dan carpenter

On Thu, Jan 23, 2025 at 12:53:14AM +0800, kernel test robot wrote:
> Hi Dan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/xfrm-fix-integer-overflow-in-xfrm_replay_state_esn_len/20250121-191827
> base:   net/main
> patch link:    https://lore.kernel.org/r/018ecf13-e371-4b39-8946-c7510baf916b%40stanley.mountain
> patch subject: [PATCH net] xfrm: fix integer overflow in xfrm_replay_state_esn_len()
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250123/202501230035.cFbLTHtZ-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230035.cFbLTHtZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501230035.cFbLTHtZ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/string.h:389,
>                     from include/linux/bitmap.h:13,
>                     from include/linux/cpumask.h:12,
>                     from arch/mips/include/asm/processor.h:15,
>                     from arch/mips/include/asm/thread_info.h:16,
>                     from include/linux/thread_info.h:60,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/mips/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/net/xfrm.h:7,
>                     from net/xfrm/xfrm_replay.c:10:
>    In function 'memcmp',
>        inlined from 'xfrm_replay_notify_bmp' at net/xfrm/xfrm_replay.c:336:7:
> >> include/linux/fortify-string.h:120:33: warning: '__builtin_memcmp' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overread]
>      120 | #define __underlying_memcmp     __builtin_memcmp
>          |                                 ^
>    include/linux/fortify-string.h:727:16: note: in expansion of macro '__underlying_memcmp'
>      727 |         return __underlying_memcmp(p, q, size);
>          |                ^~~~~~~~~~~~~~~~~~~
>    net/xfrm/xfrm_replay.c: In function 'xfrm_replay_notify_bmp':
>    net/xfrm/xfrm_replay.c:308:53: note: source object allocated here
>      308 |         struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
>          |                                                    ~^~~~~~~~~~~~
>    In function 'memcmp',
>        inlined from 'xfrm_replay_notify_esn' at net/xfrm/xfrm_replay.c:402:7:
> >> include/linux/fortify-string.h:120:33: warning: '__builtin_memcmp' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overread]
>      120 | #define __underlying_memcmp     __builtin_memcmp
>          |                                 ^
>    include/linux/fortify-string.h:727:16: note: in expansion of macro '__underlying_memcmp'
>      727 |         return __underlying_memcmp(p, q, size);
>          |                ^~~~~~~~~~~~~~~~~~~
>    net/xfrm/xfrm_replay.c: In function 'xfrm_replay_notify_esn':
>    net/xfrm/xfrm_replay.c:360:53: note: source object allocated here
>      360 |         struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
>          |                                                    ~^~~~~~~~~~~~
> 
> 
> vim +/__builtin_memcmp +120 include/linux/fortify-string.h
> 
> 78a498c3a227f2 Alexander Potapenko 2022-10-24  118  
> 78a498c3a227f2 Alexander Potapenko 2022-10-24  119  #define __underlying_memchr	__builtin_memchr
> 78a498c3a227f2 Alexander Potapenko 2022-10-24 @120  #define __underlying_memcmp	__builtin_memcmp
> a28a6e860c6cf2 Francis Laniel      2021-02-25  121  #define __underlying_strcat	__builtin_strcat
> a28a6e860c6cf2 Francis Laniel      2021-02-25  122  #define __underlying_strcpy	__builtin_strcpy
> a28a6e860c6cf2 Francis Laniel      2021-02-25  123  #define __underlying_strlen	__builtin_strlen
> a28a6e860c6cf2 Francis Laniel      2021-02-25  124  #define __underlying_strncat	__builtin_strncat
> a28a6e860c6cf2 Francis Laniel      2021-02-25  125  #define __underlying_strncpy	__builtin_strncpy
> 2e577732e8d28b Andrey Konovalov    2024-05-17  126  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
