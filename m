Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB9D366DA5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084554; cv=none; b=YVgnkmGC25F9uCfhFWNGV+kN8LW732qiJgWWKuQ8t+N7ApQNS/sEjvmlSqKVK+rr7hWTGbSYmugnbft9YgXitLuup0Stso4rP/6AsXjX9nzBf97FepYaXiT4LnrycLkn70vi/vUyx59RNAmFuFIk7yA0NyHljL5C5DnuCnPIWHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084554; c=relaxed/simple;
	bh=Luz8B2TwJRarH7eRwBAhfKkOBXwfgblGcy0Dgye670E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FmfiqYNkwbKGTg2P+gaFhHnuTvRT+B503NTR9f+eUpKjwNAXVftBEqMRjlqfBu3s/pXx2mmrDXni29MXmq4I3q2RjvKWZV2Zk04+qWAXA1tFopGsJhXLUsXwjnRTKTorCPCFYN6Cr6CfIvoT4bm01O4jZgwsVovrCNKb7iGpHuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVkgHtdz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVkgHtdz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6582e8831aeso1457168a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 04:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769084551; x=1769689351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30EptBzNKREQjciAE94dkKi4CBlW2pcTBovWP9se6eo=;
        b=cVkgHtdzoy7Jz6Fq/xGUTEOKvLjJxqi6htzsJuaYVPkUwDm+xfsdyDtMUlATXYrHiB
         WY2+vge6cg6KOrqY+spBR+Owmrh5JBp9jLuL8wOYwQKurBCIZKmxbwlsFn1ssgJF9CU6
         YUle45Ija6nfiIhnNag4dieJXpjiw3p41d1bFI35xCz/DRXZPGNYIlZkuQYjZjTe8IFg
         ftI/ORjDid4cTrzGp4bjKB9dj0fNMSfft1m73xk0mOYYeel/5h6nzjwiGulBEEMmL0Nq
         nHjIK43Fn/qwcxcjBLPkk5WMR5BLLYty2CUciEELD9C1oFYxygWPKbdKvQXR+Yc2aHed
         t9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769084551; x=1769689351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=30EptBzNKREQjciAE94dkKi4CBlW2pcTBovWP9se6eo=;
        b=ikpeze7u//VM12cD/H6+HY+K4apyLI1G3KXHgvIFd1SXqWFycj4xtxKxRk7nswYikr
         BBd54BZiVJgQ2lCo1nsugI0iCvoWPY8RvUGJcYz+VsmwSb//dLYQ+Ew7VDxIavrLt7P6
         UMMDdq4epBB0qnuGvUVI5QteXgwxz+9pcEELXAFGogB0fC7886wZFnS4pCrgkz5tZsY7
         RgCs3qNhJRTllZiseL3B1MqxrQV3WB/DQ77/WbNvnYKC+EfFFGmcuaplYenUW6TG9/cQ
         /CXqpguIBaC0ANeSJ4JoAvNuUkWnFI6ETM5qbqSx8Uhz3CYgpDnyxhE2tTKZamao56mF
         4oKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUeubLy1LIQHIiBrQBZrxcLYoD07UMe+ytUuFxYRtB3uECqqCNam4spwpo3hYFQS2olvk/+CizJveasFXb@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7ZR2WE+uardt5FlFID2tORMt/LSG46hEzR4D3SrcqMCYhHRGy
	tbGKsVQ4JafxBHKbMUIlUNpJiz0xtQmFiNpePPwCAE+OIpFdGlCci54kriq0gw==
X-Gm-Gg: AZuq6aKqxyEO6lxVVzs9KLyJEy40yNjH/nZ4eTQqHuD0PIbcFON7Ublc60Udd6TC8sq
	nh/73d4X+C2C2dS68GYTDENBU4JEmfipBeBTf0kleCZi7s+GQcSZwbvq0JsNzxkPeWAULmpjmO7
	R2xNpFbD9u+/bSLOmkKZGyMCreT3SQuMPsSEfHEcB+i7PyZrA8hJFVNHF7fzQ7XCPACIweCqaDA
	oVHPLKkH66uD0dfNfql66+EuWqZpojzojVrNs7qRDhshcKJZcRv8TasoW/Zz0+OW0/v5Gx3HmRi
	+uUmct/ISZQQn8xoo8lalE8tcPdr6O5mEOQc9uqNBkbP/+kBO3zYVHCGsK+EFlHrbQ6l9pm9Oet
	FLWwwyc8EPzRL4cxKYatCp6XEWAJYHq0kxq0kX6yWLWBtHbtA6n0z65G+rIjr3NuuJXZUAaGzOf
	E4ZOZN2Mpxdu2AkqYoLYOElFVXhvAEOfWmZMSX69dG2FbNDLJsbd9n
X-Received: by 2002:a05:600c:5299:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-4803e7e859dmr122557745e9.22.1769077556776;
        Thu, 22 Jan 2026 02:25:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804706ef6csm51088835e9.15.2026.01.22.02.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:25:56 -0800 (PST)
Date: Thu, 22 Jan 2026 10:25:54 +0000
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
 Andrew Morton <akpm@linux-foundation.org>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH next 11/14] bit: Strengthen compile-time tests in
 GENMASK() and BIT()
Message-ID: <20260122102554.1cc7a2a3@pumpkin>
In-Reply-To: <202601220829.MgTMeqqN-lkp@intel.com>
References: <20260121145731.3623-12-david.laight.linux@gmail.com>
	<202601220829.MgTMeqqN-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 09:11:53 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20260120]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/overflow-Reduce-expansion-of-__type_max/20260122-013456
> base:   next-20260120
> patch link:    https://lore.kernel.org/r/20260121145731.3623-12-david.laight.linux%40gmail.com
> patch subject: [PATCH next 11/14] bit: Strengthen compile-time tests in GENMASK() and BIT()
> config: s390-randconfig-001-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220829.MgTMeqqN-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220829.MgTMeqqN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601220829.MgTMeqqN-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/s390/include/asm/bug.h:60,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from arch/s390/include/asm/cmpxchg.h:11,
>                     from arch/s390/include/asm/atomic.h:16,
>                     from include/linux/atomic.h:7,
>                     from include/asm-generic/bitops/atomic.h:5,
>                     from arch/s390/include/asm/bitops.h:75,
>                     from include/linux/bitops.h:67,
>                     from include/linux/kernel.h:23,
>                     from net/core/page_pool.c:10:
>    In function 'netmem_clear_pp_magic',
>        inlined from 'page_pool_clear_pp_info' at net/core/page_pool.c:721:2:
> >> include/linux/bits.h:35:4: error: call to 'GENMASK_INPUT_CHECK_FAIL' declared with attribute error: Invalid bit numbers  
...
>    include/linux/mm.h:4641:27: note: in expansion of macro 'GENMASK'
>     #define PP_DMA_INDEX_MASK GENMASK(PP_DMA_INDEX_BITS + PP_DMA_INDEX_SHIFT - 1, \

This might be a real bug.

The bit of mm.h is:

#define PP_DMA_INDEX_SHIFT (1 + __fls(PP_SIGNATURE - POISON_POINTER_DELTA))
#if POISON_POINTER_DELTA > 0
/* PP_SIGNATURE includes POISON_POINTER_DELTA, so limit the size of the DMA
 * index to not overlap with that if set
 */
#define PP_DMA_INDEX_BITS MIN(32, __ffs(POISON_POINTER_DELTA) - PP_DMA_INDEX_SHIFT)
#else
/* Use the lowest bit of PAGE_OFFSET if there's at least 8 bits available; see above */
#define PP_DMA_INDEX_MIN_OFFSET (1 << (PP_DMA_INDEX_SHIFT + 8))
#define PP_DMA_INDEX_BITS ((__builtin_constant_p(PAGE_OFFSET) && \
			    PAGE_OFFSET >= PP_DMA_INDEX_MIN_OFFSET && \
			    !(PAGE_OFFSET & (PP_DMA_INDEX_MIN_OFFSET - 1))) ? \
			      MIN(32, __ffs(PAGE_OFFSET) - PP_DMA_INDEX_SHIFT) : 0)

#endif

#define PP_DMA_INDEX_MASK GENMASK(PP_DMA_INDEX_BITS + PP_DMA_INDEX_SHIFT - 1, \
				  PP_DMA_INDEX_SHIFT)

I've no idea what the values are, but the 'hi' bit number must exceed that
of 'long'.
The __ffs() probably stop it being an 'integer constant expression'
making it just a 'compile time constant' - which I added a test for.

	David


