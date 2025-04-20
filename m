Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA84213C3F6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745170943; cv=none; b=haDVfM3sQExeryfi9NdwOG+MMEX7MfWZjaDfzvIFGkWN8Z6h/luVv0qOB1rxZv9+v3ckJZgaoJOW3IyKsWO4JL402Z6KBah1lHeb2NrVQMpwiM6HzogZjVpoLIu4Qs1U0JxplMsv1/+4PnXOMb2ZGiK6ksmODWIbIZ/Ysk1vmaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745170943; c=relaxed/simple;
	bh=KaPUcl8wK8U9WuVzuT3vYzaCZJ2u4mNGxRpXGDP00Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngHPUMk++ASoScw4m+OanA4d4IqkNP0kMzSIrOh7XMaLUIWNhMJGHaU7VvByWrQNs07LB9GQ/untZ7Nm23ywpGt7KYQANcssysE+BvtCmuVPVY909avdx4D1zr3oVXW6ozHeXwWP5CA8SScAuxxTayGShHRa7NeNnAII8nzxbno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoRfS3jd; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoRfS3jd"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7376dd56eccso3407786b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745170941; x=1745775741; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myuVKRwCeU9ZUEKKzU/xoBVSsZcB8quoj9npxdOLf/g=;
        b=JoRfS3jdzd049bk2qfVN5QMFkgREkEn/+o6lPUoQiCO42+CvCKPC6WPZOwPDR7ioIj
         griGL0wuVEUbUHO4/VEIEyhFLNFvQ+h/NlPvenBdPaoFh2/Xjh9qS5a7xDLY8fowVx2t
         oTvBlaQwkECzYQ3zIIEHwVkAeKW8MJvDKJr7Lr8IU6bAc3pGxI2xdZ+MSyzIl/afjXjI
         JPFtBTK6sK/b4tGnDK6GivF2ZtkAEQUtiLUg5dj5PPNdzlD9iTTvFhArSinAQzDZdVkR
         i+nLOgi+LcUXXKHgrxeYYpienyEr442ihZxQ2HJldWgrj6zuqV/sPl386xOvtpt2cNJm
         Yc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745170941; x=1745775741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=myuVKRwCeU9ZUEKKzU/xoBVSsZcB8quoj9npxdOLf/g=;
        b=C2jgZQmt64rw4J9K7ZQ0GDO1cjkMgyjq419WFpNolmtSmBFSCPKAOnHrIkHmGttFrD
         BFBMLIhWKHTrnX9C0XM/S1MqumJEWeGWVe9TcEQFlIuvynGZhtxZU/GjZ+vfsvI0WwRm
         n25F9WY/yRLL2sFy4f3i0/OJ+bRz7X+ral1w1k15dzRpM1REONQ0vOvaxxnoakEUxu1D
         fh6W+F1wu1578VVrG5nZoWq3op8K0TKZx+qCNbGHzvXj+2WpbjgjTFVZX5RAQM/OCfpB
         P1Fe9vU3B5cXDgG9A8bL1bdboJNb/yPF0ughKsPsqZSz/cRIh/pMfaWeYcO8DZ5GgWjT
         Pvyg==
X-Forwarded-Encrypted: i=1; AJvYcCX8bSA+SUfwUJiLw5KdYT1+ntuV2hFVch+R3bT/1757yRRBn7c/GqNQFVHwBgep3KRKvkvlW/lZ3Dhdzv6l@lists.linux.dev
X-Gm-Message-State: AOJu0YxnI/j7JWL6J2yHe1ZBw3yeqAM4r5porYVhtitBy5XZvucy6RA2
	CIvw9EybiwAwuJlz7+pk1+QqaC8RhWOFVKgL1zqPzGO+gX4c1urY
X-Gm-Gg: ASbGncuFxp8ByswlequzYbjPX0u2D5yBXV6p9bYc8H27y8pN8aIVRRo3uVf0us16kiU
	9iGDF4ht6/P/t1CzFSCPrKls6peP1Ag26crvUlmtz0a0m972c0I6ieXesCM4YFFgYAQj5KgJ/b+
	D/dLA8YQJF0mxMIzuuhTI0tfe/rpTQUCxszl7HmPeK9xA5I3Oe3z7e+JcPRQvr4tWvGpGS3IhgF
	Q5P0KjSEzp45bAhYA4PVI0lnXE/EFwGM5l96E4RYNPdLRLjVeIWZ1/rdMDlem9Q4uipPs+s8neX
	Z1/sURGx2XUP9D8OxMRx/DILgh3OJRI5Fjh77alCWOCClHxpNnvJo5rgM82mL+lg
X-Google-Smtp-Source: AGHT+IGapvyA6RZML9rG6T0Qn5NdkWQXMSUWzdwI60ykn6Ibua+5OHVS9D+UlwtXsFoGTTTEoL5sTA==
X-Received: by 2002:a05:6a00:2e84:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-73dc15c4883mr12201150b3a.20.1745170940903;
        Sun, 20 Apr 2025 10:42:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaaa313sm4942211b3a.122.2025.04.20.10.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:42:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 20 Apr 2025 10:42:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: cem@kernel.org
Cc: linux-kernel@vger.kernel.org, Hans.Holmberg@wdc.com,
	oe-kbuild-all@lists.linux.dev, hch@lst.de, lukas@wunner.de,
	angelogioacchino.delregno@collabora.com,
	Jonathan.Cameron@huawei.com
Subject: Re: [RFC PATCH] math.h: Account for 64-bit division on i386
Message-ID: <2bf6d797-d974-49bb-a234-a20378f5dda5@roeck-us.net>
References: <20250419115157.567249-1-cem@kernel.org>
 <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>

On Sun, Apr 20, 2025 at 08:40:27AM -0700, Guenter Roeck wrote:
> On Sat, Apr 19, 2025 at 01:51:46PM +0200, cem@kernel.org wrote:
> > From: Carlos Maiolino <cem@kernel.org>
> > 
> > Building linux on i386 might fail if a 64bit type is passed to
> 
> i386 actually builds. Its compiler is probably able to convert
> the offending mult_frac() without helpers since the divisor is
> a constant. I see the problem with openrisc and parisc, with
> gcc 13.3.0.
> 
> > mult_fract(). To prevent the failure, use do_div() for the division
> > calculation instead of hardcoding a / b.
> > 
> > Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/
> > ---
> > 
> > I'm sending it as a RFC because I didn't to extensive testing on this
> > patch, also I'm not sure if mult_frac() was intended to work on 32-bit
> > only types. If that's the case, perhaps, a new mult_frac64() might be a
> > better idea?!
> > 
> >  include/linux/math.h | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/include/linux/math.h b/include/linux/math.h
> > index 0198c92cbe3e..05ea853b75b4 100644
> > --- a/include/linux/math.h
> > +++ b/include/linux/math.h
> > @@ -133,15 +133,16 @@ __STRUCT_FRACT(u32)
> >  #undef __STRUCT_FRACT
> >  
> >  /* Calculate "x * n / d" without unnecessary overflow or loss of precision. */
> > -#define mult_frac(x, n, d)	\
> > -({				\
> > -	typeof(x) x_ = (x);	\
> > -	typeof(n) n_ = (n);	\
> > -	typeof(d) d_ = (d);	\
> > -				\
> > -	typeof(x_) q = x_ / d_;	\
> > -	typeof(x_) r = x_ % d_;	\
> > -	q * n_ + r * n_ / d_;	\
> > +#define mult_frac(x, n, d)		\
> > +({					\
> > +	typeof(x) x_ = (x);		\
> > +	typeof(n) n_ = (n);		\
> > +	typeof(d) d_ = (d);		\
> > +					\
> > +	typeof(x_) r = do_div(x_, d_);	\
> > +	r *= n_;			\
> > +	do_div(r, d_);			\
> > +	x_ * n_ + r;			\
> >  })
> >  
> 
> Unfortunately that doesn't work. I get build errors on parisc.
> 

Turns out the first parameter of do_div needs to be u64, not s64,
at least on parisc.

Guenter

> In file included from ./arch/parisc/include/generated/asm/div64.h:1,
>                  from ./include/linux/math.h:6,
>                  from ./include/linux/kernel.h:27,
>                  from ./arch/parisc/include/asm/bug.h:5,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/mm.h:6,
>                  from mm/page_alloc.c:19:
> mm/page_alloc.c: In function 'boost_watermark':
> ./include/asm-generic/div64.h:183:35: error: comparison of distinct pointer types lacks a cast [-Werror]
>   183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>       |                                   ^~
> ./include/linux/math.h:142:24: note: in expansion of macro 'do_div'
>   142 |         typeof(x_) r = do_div(x_, d_);  \
>       |                        ^~~~~~
> mm/page_alloc.c:2010:21: note: in expansion of macro 'mult_frac'
>  2010 |         max_boost = mult_frac(zone->_watermark[WMARK_HIGH],
> 
> That is just one example. It seems to affect all uses of
> mult_frac().
> 
> Guenter
