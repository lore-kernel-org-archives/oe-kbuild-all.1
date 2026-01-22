Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE162EFD9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084969; cv=none; b=GvlDRhp8VeOw/Dj1KoI2ekpwvOnHMLZ50dr7uSfYvvVzraQHs3nmEyh5ZyufjGV69HH83/YggOjA56rWTUfXeJakKdqiKkfxOfqsr4l27DzJOWs78lV6t9WKJqfPvGx73+Ktaj0Rro0MfnpysEuSA61BnoKvcoUwCB9UD5r5yBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084969; c=relaxed/simple;
	bh=7hrihdavUKSRBk1sLsO+Hg6KhwRPOnr3OMEgf2c2K3A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dzgCmWT+qTjI1q6oqMz7KjyNxqDm7jw+pC0l3CN5dFGwBJIJXdSCzfCBfcS/CC0bMKkd0uohnO8Z26zduumLx+WnKXdalxAXeWYMt+JLV7KQR4Y0+GUxscwAKeDRY87fTd7EQWCbd2dH6nLMX7CA37ykMhu+4K4RSaKFsT0Q7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IG66Nq7Z; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IG66Nq7Z"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8838339fc6so124419966b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 04:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769084966; x=1769689766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WniyRiiurCuuasCidSwYbmBfTajQvRsR2qN3REFSig=;
        b=IG66Nq7Zn9FTRqinW6BJpn3p7IDm5yZXGnLJv7aUAI4wGW9ic0QXX3kUhbRvlksxK9
         wSOEXyx1aBU1cCZO3SQxRVlo8fY3Uy42d/1i4jRv2nt59Ns2q3mZJAb2OQC6Px74MvuA
         6inw8NzgSBcZ5Y6XuTdEMhtVupkDSuLDDr+Gydukt5L+l6NThedlvDmIdsn11vXVH/6e
         S4800/tUGjFaEf2SaCC+mFtqxjuvhNuDylOiVFfonrlNeMx6RUW4HidHkw/HVjBbF4jH
         izRC7Y1yps6ixOsoQSxV7n7F3XY3s9an8AmGxI8ZQu/Z7IIiIoe01PiMQMLf1pesI7r0
         5lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769084966; x=1769689766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0WniyRiiurCuuasCidSwYbmBfTajQvRsR2qN3REFSig=;
        b=Gqq+uT6n0c2U2k+MuyNc8NioRektsMDt0s6cwmodJFCpvsKylDGBumF5T8Kq5eSGU/
         vbRj2VQogg9JQRfukHT9gRLsym6xogj89MCgyA4yLeyBH8Ma260oRrNx7yC3RIGjXErv
         xHuqId6VbspumClnQAsj3AwxzqOBIQGGwPUC+VQy5kbT2/jCCXarhpfqjIQW1JLOdBmz
         QLa1bzGXin2YV6diSy+il6zGcR/+pdICBczT5qZeXoRialIQp5Lc6BfbM3h3s0YXn9Ui
         jN4Ck367TMJbStnQntvoLHO2qz78oVT3mX7Zu4P0iXwX/mM5cOPwpTljyUqiCF5wDdR2
         zGBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGlT3kbl7PcSreiPkd11iwQhTowDiPb9PCT8UFlydHkLItDp8zFDKAEPf22+yhd1MJrBklSbgJTW3a1fW9@lists.linux.dev
X-Gm-Message-State: AOJu0YyAON07ZUjKrR8VGBc9YSvfg3aRwYXxom3gl0Pv008+GkQAIl2e
	kKPWTSleZFoCSYbZDRK9kH7P72V8jbmsX4dW9A1dgx07BB3xdUZ+lSKdlhqO6A==
X-Gm-Gg: AZuq6aIRTIy+iI7AwOCHuzUPalvnGSaqHUY1TmihwZGTk2bs4EgJlUaRxqXNPsUT4Bv
	LiEN675q5zITwGAa1g6Xq2UGhliC95N0wr7VuxzUAKqWaU3wlPI7rXPX4s0rhdqYXu6k4pQF4Ty
	oe+uNE0Ye4z3JEAUls0BVQGuOw2VyGji/ql41WUkzdzl9ZyybcbjycZz/DEWLA7VndqRtC7cipY
	rHG39Hxlg7JSIxwTUeSCvPOQQ/aib6CuA37arA3bxASwqtnhKy7Q2OzPMHmcnbaKHhEUL8cpiLX
	jf4YOh2ab5tphp8jpasXNMIH81jiG+fJo7NQyuhVFTWhWU9FnUnpKWRAZCpvH8QTPaYSZSnhZ2S
	duPnM1W3dd46uvyNYEbVfewCd33idzGUjuJqpUWDEGzKMp+hOIl5DzskXUnpSeAjhtJUaOxcfVW
	75TSV3fssvPUHzpK0qbd6gR5fEyv/932Jo7UggmkvZUqbPT3w89SdNEgOS3HNmz5E=
X-Received: by 2002:a05:600c:2d92:b0:47d:87ac:73ef with SMTP id 5b1f17b1804b1-480470c7513mr21530765e9.13.1769077831210;
        Thu, 22 Jan 2026 02:30:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48048b49880sm44067865e9.11.2026.01.22.02.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:30:30 -0800 (PST)
Date: Thu, 22 Jan 2026 10:30:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Yury Norov
 <yury.norov@gmail.com>, Jani Nikula <jani.nikula@intel.com>, Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [PATCH next 12/14] bits: move the defitions of BIT() and
 BIT_ULL() back to linux/bits.h
Message-ID: <20260122103029.255b3dd3@pumpkin>
In-Reply-To: <202601220951.7C4YG7hB-lkp@intel.com>
References: <20260121145731.3623-13-david.laight.linux@gmail.com>
	<202601220951.7C4YG7hB-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 09:23:16 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20260120]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/overflow-Reduce-expansion-of-__type_max/20260122-013456
> base:   next-20260120
> patch link:    https://lore.kernel.org/r/20260121145731.3623-13-david.laight.linux%40gmail.com
> patch subject: [PATCH next 12/14] bits: move the defitions of BIT() and BIT_ULL() back to linux/bits.h
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601220951.7C4YG7hB-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220951.7C4YG7hB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601220951.7C4YG7hB-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from kernel/bounds.c:14:
>    In file included from include/linux/log2.h:12:
>    In file included from include/linux/bitops.h:28:
>    In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
>    In file included from arch/arm64/include/asm/barrier.h:14:
> >> arch/arm64/include/asm/alternative-macros.h:18:20: warning: 'unsigned' is not defined, evaluates to 0 [-Wundef]  
>       18 | #if ARM64_NCAPS >= ARM64_CB_BIT
...
> 
> 4c0bd995d73ed8 Mark Rutland 2022-09-12  17  
> 4c0bd995d73ed8 Mark Rutland 2022-09-12 @18  #if ARM64_NCAPS >= ARM64_CB_BIT
> 4c0bd995d73ed8 Mark Rutland 2022-09-12  19  #error "cpucaps have overflown ARM64_CB_BIT"
> 4c0bd995d73ed8 Mark Rutland 2022-09-12  20  #endif
> 7cda23da52ad79 Will Deacon  2020-06-30  21  

Unless I change BIT() back I'll change that to a static_assert().

	David

