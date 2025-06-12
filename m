Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7471A29A9C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 16:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744382; cv=none; b=fdG3VwFZGifxCEJwqcbipt5GowQN9g4u49hWKLLjThizhbQJyGvpTjk5WCbuzuubhMD4wAuubWiuQ/tD2kXL3yMUnrx9AHdnT+/9tD9qy6QDtDQG57hED1k+U9ROqZBMCy9BFpE55Ud8BOAfePcNb+qaX1xTT9Avq6NoWvw1OWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744382; c=relaxed/simple;
	bh=04GkUWrTTqQUp181YEIvcJyQTVFi48opIFB+InHSc5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMAZB2UknaQ4MqCTWJh8eK/32LG8axASE888zlQS5Iqw6UG/1kF+jU5LDSsPDBx98+rLb8EbGc+F5q+YPzonsMxyOn5H3dCu0elFTGxPEEFcaFgBBQU3XFYKwUuM8hTvWrrT8Gj4O9zXhcwFhWZ7PPDBQyoFU6/xqD27yaSwAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OMr/rvcC; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OMr/rvcC"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2e999729ccbso645854fac.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749744378; x=1750349178; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udm2JNtgUVnGtTALc+UG19LJaRFqXt9eusqJiG8Hlj0=;
        b=OMr/rvcClnqrqocgQpkkavSDL09WYaKkIAAzFUwpuu4IJodhFgGbddDfCeG2yrKwdG
         uFbzTHrznD/z8vUsSor5oeUrG0rf9N0dmHtGmwuf5mAsTX7Xlx1F5ZKvPksE7Iic4fFu
         lrSvYcSeFGMr33dFHzbye+PmE1dLGIFG8rkmPEuev59yWodPQwBdHYzEzof26pH/CCFX
         h7pLSUiq1PnnTPRwSGf8KSv+x8829jSqEW4X5v17hu9vKBGk/QFJtJ21gmCZazCqdlpE
         X2a/n/+yciG0FtkTN5ymmdsjHkemAX0S8nVtoIK5V1hnsd2SiZ/q0WFY9Hz7CznY1Q/S
         wJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749744378; x=1750349178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udm2JNtgUVnGtTALc+UG19LJaRFqXt9eusqJiG8Hlj0=;
        b=S+YMHoWjsLcW3da7o0fMtBa+yWR6+SuzShsdXSd+6yznxxt3Jlt7Mth8Sw4hSSutMs
         FcLDVVhLsGdcw4v306rHxVUEELzVsk6jybyafe9pbsOyq5C9ZREmg1tL/m4KoyvxxRBd
         Z+a3PhacdQgkeLDJ84/pcUQ6FOkPFqjvd4D3zeMhJ9c9u6pmFGqgRkvWvOqtrygTY1Wu
         wSH37CmRK4OcQT2oQhS2ugNbkhtIrxW8BF5u8+GxIAlz2Hcm34Uu/HdBh1EHge0Xkiga
         drLUZNYsol9k+KlSt7ljLZhUVdt6L8kvx3vTsXOV439UKU+0eK7hgEG0kM/TLGieMLr3
         PedA==
X-Gm-Message-State: AOJu0Yzop/TP8LS56LZV9eEU9A0xLn6EIZ9IhakdilVQ6AW2OP7hufIN
	yWt2IdzaRcd0siEsmNlIwrlgE1sSEJGy0aTGg6E3+a5GPhirbI+VHdBueaiIhkqG0R0=
X-Gm-Gg: ASbGncusfSOsvKxdrdiRCiKE5mg+uxxiStwlDOTbKT741dxBlJazdH3I/qZzX86JFMn
	ExK3R9l11gDCE5hZYLpSdGIomoyeNItGkwS/kvGz/4tcDTlmrmc1mhcwp9Vi8qxKWhlxWmHGom2
	4zJwYLKdnjTE8daFk0DSf8Rn59Rysm7NKLCIqUipWeRCfrgy334/tKeYYIg5WUd3OhwS/SgdPpZ
	F6zNyx/jWSyCzAb6tVeEVY8a41VLAupLk9iisoFmg7ZdxdNM0zzr+BgoFosU9aSmcDULbgKDgXp
	Fr9iNIpTyrQ+JS9I4ceYGLv3tqJW8kP9FYva6lceWrCH2dHJTjT9RAh0+1h+I26hvg93bW7FWDo
	+mbCsrLLS9Vk4gCsiuj89BWcqDkkJLZKWalUUIA4=
X-Google-Smtp-Source: AGHT+IF/vr0JdR7BhUZF/CLVXT/7bWNiAbEwT6msbj/HgBgDO3T/ANvkscC5qNafqYzSb/qLbMi0kQ==
X-Received: by 2002:a05:6870:9c89:b0:29e:74a0:e03f with SMTP id 586e51a60fabf-2eab46e5dd7mr2125102fac.24.1749744378382;
        Thu, 12 Jun 2025 09:06:18 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm221571fac.18.2025.06.12.09.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:06:18 -0700 (PDT)
Message-ID: <1c1c2888-be50-4578-8afd-bfbe4bd9cbae@baylibre.com>
Date: Thu, 12 Jun 2025 11:06:16 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] iio: accel: sca3000: use guard(mutex)() for
 handling mutex lock
To: kernel test robot <lkp@intel.com>, Andrew Ijano <andrew.ijano@gmail.com>,
 jic23@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andrew.lopes@alumni.usp.br,
 gustavobastos@usp.br, nuno.sa@analog.com, andy@kernel.org,
 jstephan@baylibre.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611194648.18133-4-andrew.lopes@alumni.usp.br>
 <202506122309.FvJPaMhh-lkp@intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <202506122309.FvJPaMhh-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 10:52 AM, kernel test robot wrote:
> Hi Andrew,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on jic23-iio/togreg]
> [also build test ERROR on linus/master v6.16-rc1 next-20250612]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Ijano/iio-accel-sca3000-replace-error_ret-labels-by-simple-returns/20250612-034940
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
> patch link:    https://lore.kernel.org/r/20250611194648.18133-4-andrew.lopes%40alumni.usp.br
> patch subject: [PATCH v5 3/3] iio: accel: sca3000: use guard(mutex)() for handling mutex lock
> config: nios2-randconfig-002-20250612 (https://download.01.org/0day-ci/archive/20250612/202506122309.FvJPaMhh-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506122309.FvJPaMhh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506122309.FvJPaMhh-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/irqflags.h:17,
>                     from include/asm-generic/bitops.h:14,
>                     from ./arch/nios2/include/generated/asm/bitops.h:1,
>                     from include/linux/bitops.h:68,
>                     from include/linux/kernel.h:23,
>                     from include/linux/interrupt.h:6,
>                     from drivers/iio/accel/sca3000.c:10:
>    drivers/iio/accel/sca3000.c: In function 'sca3000_read_raw':
>>> include/linux/cleanup.h:258:2: error: a label can only be part of a statement and a declaration is not a statement
>      class_##_name##_t var __cleanup(class_##_name##_destructor) = \
>      ^~~~~~
>    include/linux/cleanup.h:319:2: note: in expansion of macro 'CLASS'
>      CLASS(_name, __UNIQUE_ID(guard))
>      ^~~~~
>    drivers/iio/accel/sca3000.c:699:3: note: in expansion of macro 'guard'
>       guard(mutex)(&st->lock);
>       ^~~~~
>>> include/linux/cleanup.h:258:2: error: a label can only be part of a statement and a declaration is not a statement
>      class_##_name##_t var __cleanup(class_##_name##_destructor) = \
>      ^~~~~~
>    include/linux/cleanup.h:319:2: note: in expansion of macro 'CLASS'
>      CLASS(_name, __UNIQUE_ID(guard))
>      ^~~~~
>    drivers/iio/accel/sca3000.c:731:3: note: in expansion of macro 'guard'
>       guard(mutex)(&st->lock);
>       ^~~~~
>>> include/linux/cleanup.h:258:2: error: a label can only be part of a statement and a declaration is not a statement
>      class_##_name##_t var __cleanup(class_##_name##_destructor) = \
>      ^~~~~~
>    include/linux/cleanup.h:319:2: note: in expansion of macro 'CLASS'
>      CLASS(_name, __UNIQUE_ID(guard))
>      ^~~~~
>    drivers/iio/accel/sca3000.c:735:3: note: in expansion of macro 'guard'
>       guard(mutex)(&st->lock);
>       ^~~~~
>    drivers/iio/accel/sca3000.c: In function 'sca3000_write_raw':
>    drivers/iio/accel/sca3000.c:748:6: warning: unused variable 'ret' [-Wunused-variable]
>      int ret;
>          ^~~
>    In file included from include/linux/irqflags.h:17,
>                     from include/asm-generic/bitops.h:14,
>                     from ./arch/nios2/include/generated/asm/bitops.h:1,
>                     from include/linux/bitops.h:68,
>                     from include/linux/kernel.h:23,
>                     from include/linux/interrupt.h:6,
>                     from drivers/iio/accel/sca3000.c:10:
>    drivers/iio/accel/sca3000.c: In function 'sca3000_read_event_value':
>>> include/linux/cleanup.h:258:2: error: a label can only be part of a statement and a declaration is not a statement
>      class_##_name##_t var __cleanup(class_##_name##_destructor) = \
>      ^~~~~~
>    include/linux/cleanup.h:319:2: note: in expansion of macro 'CLASS'
>      CLASS(_name, __UNIQUE_ID(guard))
>      ^~~~~
>    drivers/iio/accel/sca3000.c:835:3: note: in expansion of macro 'guard'
>       guard(mutex)(&st->lock);
>       ^~~~~
>    drivers/iio/accel/sca3000.c: In function 'sca3000_write_event_value':
>    drivers/iio/accel/sca3000.c:881:6: warning: unused variable 'ret' [-Wunused-variable]
>      int ret;
>          ^~~
>    drivers/iio/accel/sca3000.c: In function 'sca3000_write_event_config':
>    drivers/iio/accel/sca3000.c:1188:6: warning: unused variable 'ret' [-Wunused-variable]
>      int ret;
>          ^~~
> 
> 
> vim +258 include/linux/cleanup.h
> 
> 54da6a0924311c Peter Zijlstra 2023-05-26  256  
> 54da6a0924311c Peter Zijlstra 2023-05-26  257  #define CLASS(_name, var)						\
> 54da6a0924311c Peter Zijlstra 2023-05-26 @258  	class_##_name##_t var __cleanup(class_##_name##_destructor) =	\
> 54da6a0924311c Peter Zijlstra 2023-05-26  259  		class_##_name##_constructor
> 54da6a0924311c Peter Zijlstra 2023-05-26  260  
> 54da6a0924311c Peter Zijlstra 2023-05-26  261  
> 

These error messages aren't particularity helpful, but what I think
this is try to say is that you have to be careful with guard() in
switch statements.

The guard() macro is declaring a new local variable, which shouldn't
be done in a case: statement without enclosing it in a separate scope.
Some compilers complain and some don't so even if it worked for you
locally, we need to make it work for all supported compilers.

So the code needs to looks something like this:

 	case IIO_CHAN_INFO_SAMP_FREQ: {
		guard(mutex)(&st->lock);
 		ret = sca3000_read_raw_samp_freq(st, val);
 		return ret ? ret : IIO_VAL_INT;
	}
