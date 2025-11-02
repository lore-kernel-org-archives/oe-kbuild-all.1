Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F216D1C5F1B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 10:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762079766; cv=none; b=Nfb72FMvGYWYmKENU8W1GuTvNR0Tc3nVuqCPraW41YsI/xHZqrCxI6xYEjHQGUR6PnwZKFm2/RclfOFlgl8455YP3y7hEpHK6VARu1YDAxIFtGRSUrWUK845EMeU5j1luioszyYjYeJMCsJrcANYWj1jMwhYJlMxxhpNzYV/LeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762079766; c=relaxed/simple;
	bh=QDjFHAnNGxJtqq3B2eRN6crskPhgy/pT5GpK0XQSS00=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d+o8xrhcqyaHLM2DEujqZ4xOChQRO+fBAsTM+Jfwywnpc4WkSGfxFlBX4dNUSTLi7NFsl0/JzakJj0ITdGPi8LZ+/Ae2nTaagGlABiiJqTs44OsHQLawPryeqbVOgbWMrMxrI6eUEKOYC6LyM4cgf7vJSd+4ZsxYu6KFY7lSSzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/NIZ/3e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/NIZ/3e"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4710022571cso34479605e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 02:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762079763; x=1762684563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ovu4hk1QeQJCG4bKMFk7VDTxcv3q5N8PBdUxZwYYOd8=;
        b=N/NIZ/3e/bUXvEQTmnOmdOnYOaNy4XSQUf0nFalPmevZViwX4vb9SCiG8eb3hVnIsa
         PVIflGLteP1WzTmnPmJ/1CFxeqs/u+5WLfsJlYv968nTAszfAIxybtaBnbVWgTZlTaBj
         5bkfSiT+TCvsqnJ0kupjE2MwFKZF4vbnP8A1sRnLhul91XFgHaKwTlUlcggvUy+d456D
         M4GSJzs0szKdX7B17V7NJWnePy/IXrEdFIJuvVWnerivifr9Wq5bka4kKY6/sJXppb1f
         7UsjLtKxWlUbVlCqlKWn+KNgaquuXrQdhtIWwG+ETi+amCFMpNfoEklwHVDkLklFAwrt
         n4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762079763; x=1762684563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ovu4hk1QeQJCG4bKMFk7VDTxcv3q5N8PBdUxZwYYOd8=;
        b=F9UIpHl5E1GSqDFRmNROeRTY/BUNr4ti2+CxEWRTrhtMQLALGLplBQcw+XwIxVngKQ
         x1L17onCdgdxJ38bvFsncYWJMPlZRuaMRAYsn1oV6ARhit3xC+5LmqOUjEO5GgfCg2T3
         0Fl//asTTLBkHdk/GFA34/lcG5RFAk6B8iRWomd+Cv6nlQujyhesykkBIi51m3zZhILO
         JKlykvPF51uAXbw11KxjGQDYOK9D+1/Y2HPG+JP84GYHowFjJmZJY0I/F1CAf1hoVbRH
         q+qw9HhwMEyxBQrih8CEmesRXbbZYIe6iKjWAzx5a4zxoOA8vc6+myaUIr9tntgpigBE
         b+4g==
X-Forwarded-Encrypted: i=1; AJvYcCX9WBdjIi1WEn8QyGMWIxembWM7J+z7uuVpibpHQPAk2vjPHlxZQTlQJ6Xu0A0gFB5+SyQrI60t78sEDWt7@lists.linux.dev
X-Gm-Message-State: AOJu0YzB0c0K4ZnsEE3QY9VKGrm6f0VyYD9JnTaUhsE8YDphd5HlY4ja
	81nb9lx11+mmSKTUB9l4RCs/WWPjuKewAiY+a+GqHICHWRG1asOba/Na
X-Gm-Gg: ASbGncumAvN2otfLKY+sFFzS0Ndf+I7h5Q4wh7TU8WzMGaFP5hMTV7pynpGlPgMN8vx
	aSUDyw8r8AyEC6DDYfWf4UpX1Bh112mAQ3TQBfbtdZHsXyUyDOxa4xFvoxWDrW7JovT+Ju0NWHt
	4uaZP8qz+xVY0AIteV7fChANOumv5kilqljDymspRbVYFqc0nv+U+j67JTsIBX/7VG060fbkb81
	QeVfPe1oIwWQ+vJgYpyWpbXinyyWxw+2gDnfBtiLEWK4CzHEJY9GO0vvgUgaQuR4eYVOhYlK9dc
	fvee8xlM9GiXUvEdmSqgCM5qVbeYEIrnLmY25rmzl1/YO9cQX/KXhg3dHLdqv8pnPio7MVSHXWo
	Q44rpfW3S3WOKi4ZHLomZwQXfgRx4g4hHJmj4poS6eJMtAAkEi8hsOa2qxQJcLjeNbz2SOejQv1
	s6ktw9Q8wAk0OHO2mDQbbTaocYF13oqgaB+QoQP7b76Mjkr8SW/6lO
X-Google-Smtp-Source: AGHT+IHL30gVPu+1tpP35sbbUpZLKsl40U91AdkYUoDD4qFiMCXwuao1AO3rSfpQub8UcTTdTBgniA==
X-Received: by 2002:a05:600c:1c1d:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-4773086e04fmr100701075e9.19.1762079762968;
        Sun, 02 Nov 2025 02:36:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fbeef62sm64496655e9.1.2025.11.02.02.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 02:36:02 -0800 (PST)
Date: Sun, 2 Nov 2025 10:36:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, u.kleine-koenig@baylibre.com, Nicolas
 Pitre <npitre@baylibre.com>, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas
 Gleixner <tglx@linutronix.de>, Li RongQing <lirongqing@baidu.com>, Yu Kuai
 <yukuai3@huawei.com>, Khazhismel Kumykov <khazhy@chromium.org>, Jens Axboe
 <axboe@kernel.dk>, x86@kernel.org
Subject: Re: [PATCH v4 next 6/9] lib: test_mul_u64_u64_div_u64: Test both
 generic and arch versions
Message-ID: <20251102103600.65754bf2@pumpkin>
In-Reply-To: <202511020421.ZZPBAIIw-lkp@intel.com>
References: <20251029173828.3682-7-david.laight.linux@gmail.com>
	<202511020421.ZZPBAIIw-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 2 Nov 2025 04:59:10 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on next-20251029]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/lib-mul_u64_u64_div_u64-rename-parameter-c-to-d/20251030-025633
> base:   next-20251029
> patch link:    https://lore.kernel.org/r/20251029173828.3682-7-david.laight.linux%40gmail.com
> patch subject: [PATCH v4 next 6/9] lib: test_mul_u64_u64_div_u64: Test both generic and arch versions
> config: i386-buildonly-randconfig-004-20251102 (https://download.01.org/0day-ci/archive/20251102/202511020421.ZZPBAIIw-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020421.ZZPBAIIw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511020421.ZZPBAIIw-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> lib/math/test_mul_u64_u64_div_u64.c:142:9: warning: '__div64_32' macro redefined [-Wmacro-redefined]  
>      142 | #define __div64_32 __div64_32
>          |         ^
>    arch/x86/include/asm/div64.h:78:9: note: previous definition is here
>       78 | #define __div64_32

That is preceded by a comment that says it can't happen for x86-64.
I think it would be better as '#define __div64_32 @@@' so that you get a compile
error.
But that isn't part of this change,
>          |         ^
>    1 warning generated.
> 
> 
> vim +/__div64_32 +142 lib/math/test_mul_u64_u64_div_u64.c
> 
>    140	
>    141	/* Compile the generic mul_u64_add_u64_div_u64() code */
>  > 142	#define __div64_32 __div64_32  

It needs a preceding #undef
Although I'm not sure why a normal build doesn't show it.

Looks like I'll need to do a v5 :-(

	David

>    143	#define div_s64_rem div_s64_rem
>    144	#define div64_u64_rem div64_u64_rem
>    145	#define div64_u64 div64_u64
>    146	#define div64_s64 div64_s64
>    147	#define iter_div_u64_rem iter_div_u64_rem
>    148	
> 

