Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697BE39BA28
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 21:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769118711; cv=none; b=QymzF1fvrWfVTyKqaiUPfoLUMIu0DqI0oAifGZIKf8GKPsTX//qKD4AFtVMytuxHvkoBiZAt+DB4Ff2Z3HqpoVh6XHYCtOAVUaKeW4mliRJm0vO6fU8k+3enbQd9Xxo0Z2MX0yfKAK3AlAG5Dg4v9ci3uL4f1qfPrIj8IR5UWFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769118711; c=relaxed/simple;
	bh=h8BIrhqP8PrnWBOOHldJrVM51Gi+ox30172uyTExrUE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oyjtPzGKzmFB/JmKiV9+nt5BWe7EOq/3HAc0w1JegSOwx9VkxJc3J87vm77gOd19WlMo++SBhoRwkgYiXyFa0uQgwkP97cvVWL94gpQkD9r+xO00jufAvvAZ2UMOJZUOe+Q8q79zbFCNqBN3Y8XuKV9iQJ7zmmu4e2eQLiWXrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MooIuH82; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MooIuH82"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso2621730a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 13:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769118702; x=1769723502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Sju0/uBNJAFaT2N2jcYw51V21Jpb0sazE7YFwzTXAw=;
        b=MooIuH82J6p80i/2bneqYisJomL2iMzYyFgXrYsLnbF5USDpPKKaz7DrIJsZCABtHJ
         5psdCCnuFbthretnFl/FC7WQjlXO9J7gdyu/+aT2Q95FioE1FRmSraiQehlRJBcpPHDI
         rn7lCOXZYnWG9ZY5fNXoioOUMiEBgZRYQS5+IYRfRIk6qLvLRxbq1nWE1huHtqXiOtlY
         TnfLCKWxlMjloAlIObc33EYL2SPTjr5Z8216slYS//XYDkeVFEmoPnvzoyf0nw1iPb9j
         j7Va/bLOm3Ow7XGamkvuTq2TfXXz2cQJCq0A+bnwGlZkAa0UszBZWHA/mQSXHM+FtwC0
         aMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769118702; x=1769723502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Sju0/uBNJAFaT2N2jcYw51V21Jpb0sazE7YFwzTXAw=;
        b=Q/EOoGTIpEGyYndqUj8vIBgnQeI+ammB/y5YxR/nCDws/cpMkBbsIW3iltu7hnWZlM
         zPBnStmT4I2gKzLyv0MCJ9UBC0cVBtfZ9V2zZLceav9iE4Go3zjY+RznzIh/ZC0tnbPM
         /hXQoqNe5d8oVFL5jj2A1rR3oEDlGmRH4a4usIXmO9kEc5kuUG9o/nXKCrnycDp4L0Oe
         oLDuIcDXgO5ULReHj84e2jjErhTNIzrfopmg/8LdPNRKmzprhAYz15ksjvgI+sFnHqRe
         O1QGQwBpsHZuMqtPPeO2ZhSQPMmVGPrCQ9vc2OdFgI7k1NF1r/Lhu1+knyaszw68r3C3
         SI3w==
X-Forwarded-Encrypted: i=1; AJvYcCUVT9WyLQPOqEbUaPQsgWGCwVmYAMQ1Dd/a/rTEJj6bE38iUrkbAVQCxE/KUNnhst5FajJE/rbkNAbQE/xq@lists.linux.dev
X-Gm-Message-State: AOJu0YxTOfK6ctmoxPU4wtyA2ZllqlZgKMOO2dWsm0g0sPm35ZHvftOz
	p4u82xW2M9IAogtjO4kYuvdB2gIKbSMbkMPO1/WAgOKWc75BuV+or+4WdR7szw==
X-Gm-Gg: AZuq6aK/kH5CNKu4BtwNDxg6i+Se/aP7lHGKO83JSS0K4wvzyADpO998G4zWXavo7aR
	2wBXxpiVuIqJPQx4Tc9QXSMjRcfvEB+qAeaZYGP4QC6GlEzxC4cHyb9U7DajExf+pmIf8elfl3v
	uATRh7+uwZOPmibvZmsaQqfOmiQBHVzBbYLiE2z9QwrrfYmvWMIYMIMD2FE95qtnJAATIgWkRRQ
	DEYrAv+Hzk429O/LCuoWM6yK9LuhZv/6E+ToZ46tfilWk92SHT/bTtqKX8Oazx7T7jNWMh3TZli
	JL7y9/030pvCshRmWSGrDmtvETkOTsG6wwBgp0Hm1Ci8oApeYHnvROki43CWyYVpEpOig3MtMdd
	7myOnHgumducFQDeGetHah6yWlQfrHaS/GxJxOPuMIV+Is6DPq9/9tDaeJ/U9ASu0GGStIswEE8
	MmMSPgncYfKCpS6NCskOOSSJ7glC0zQuaXhPoGg62/VTiyypWpwsac
X-Received: by 2002:a05:600c:1914:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-4804d2f6b5amr9565905e9.15.1769112622797;
        Thu, 22 Jan 2026 12:10:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6315sm676845e9.4.2026.01.22.12.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 12:10:22 -0800 (PST)
Date: Thu, 22 Jan 2026 20:10:20 +0000
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
Message-ID: <20260122201020.2479d180@pumpkin>
In-Reply-To: <20260122102554.1cc7a2a3@pumpkin>
References: <20260121145731.3623-12-david.laight.linux@gmail.com>
	<202601220829.MgTMeqqN-lkp@intel.com>
	<20260122102554.1cc7a2a3@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 10:25:54 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Thu, 22 Jan 2026 09:11:53 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > Hi,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on next-20260120]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/overflow-Reduce-expansion-of-__type_max/20260122-013456
> > base:   next-20260120
> > patch link:    https://lore.kernel.org/r/20260121145731.3623-12-david.laight.linux%40gmail.com
> > patch subject: [PATCH next 11/14] bit: Strengthen compile-time tests in GENMASK() and BIT()
> > config: s390-randconfig-001-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220829.MgTMeqqN-lkp@intel.com/config)
> > compiler: s390-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220829.MgTMeqqN-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601220829.MgTMeqqN-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from arch/s390/include/asm/bug.h:60,
> >                     from include/linux/bug.h:5,
> >                     from include/linux/mmdebug.h:5,
> >                     from arch/s390/include/asm/cmpxchg.h:11,
> >                     from arch/s390/include/asm/atomic.h:16,
> >                     from include/linux/atomic.h:7,
> >                     from include/asm-generic/bitops/atomic.h:5,
> >                     from arch/s390/include/asm/bitops.h:75,
> >                     from include/linux/bitops.h:67,
> >                     from include/linux/kernel.h:23,
> >                     from net/core/page_pool.c:10:
> >    In function 'netmem_clear_pp_magic',
> >        inlined from 'page_pool_clear_pp_info' at net/core/page_pool.c:721:2:  
> > >> include/linux/bits.h:35:4: error: call to 'GENMASK_INPUT_CHECK_FAIL' declared with attribute error: Invalid bit numbers    
> ...
> >    include/linux/mm.h:4641:27: note: in expansion of macro 'GENMASK'
> >     #define PP_DMA_INDEX_MASK GENMASK(PP_DMA_INDEX_BITS + PP_DMA_INDEX_SHIFT - 1, \  
> 
> This might be a real bug.
> 
> The bit of mm.h is:
> 
> #define PP_DMA_INDEX_SHIFT (1 + __fls(PP_SIGNATURE - POISON_POINTER_DELTA))
> #if POISON_POINTER_DELTA > 0
> /* PP_SIGNATURE includes POISON_POINTER_DELTA, so limit the size of the DMA
>  * index to not overlap with that if set
>  */
> #define PP_DMA_INDEX_BITS MIN(32, __ffs(POISON_POINTER_DELTA) - PP_DMA_INDEX_SHIFT)
> #else
> /* Use the lowest bit of PAGE_OFFSET if there's at least 8 bits available; see above */
> #define PP_DMA_INDEX_MIN_OFFSET (1 << (PP_DMA_INDEX_SHIFT + 8))
> #define PP_DMA_INDEX_BITS ((__builtin_constant_p(PAGE_OFFSET) && \
> 			    PAGE_OFFSET >= PP_DMA_INDEX_MIN_OFFSET && \
> 			    !(PAGE_OFFSET & (PP_DMA_INDEX_MIN_OFFSET - 1))) ? \
> 			      MIN(32, __ffs(PAGE_OFFSET) - PP_DMA_INDEX_SHIFT) : 0)
> 
> #endif
> 
> #define PP_DMA_INDEX_MASK GENMASK(PP_DMA_INDEX_BITS + PP_DMA_INDEX_SHIFT - 1, \
> 				  PP_DMA_INDEX_SHIFT)

I've managed to do an s390 cross build.
It is all quite obvious really.
For s390 PAGE_OFFSET is usually zero (I think kernel and user mappings are separate?).
This make PP_DMA_INDEX_BITS 0.
PP_SIGNATURE is 64 - so PP_DMA_INDEX_SHIFT is 7.
So it is doing GENMASK(6, 7) and, I think, expecting to get zero.
But that is taken a mistyped GENMASK(7, 6) and treated as an error.

If I rewrite __fls() and __ffs() to return 'integer constant expressions'
when the input is one I think it would always have failed.

A comment a few lines higher suggests that the code expects the mask to
be zero in this case - and handles it properly.

	David

> 
> I've no idea what the values are, but the 'hi' bit number must exceed that
> of 'long'.
> The __ffs() probably stop it being an 'integer constant expression'
> making it just a 'compile time constant' - which I added a test for.
> 
> 	David
> 
> 

