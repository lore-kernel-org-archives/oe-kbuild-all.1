Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7652DE6FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011640; cv=none; b=RIzDpAgWAeMeMh3aErO4CoV2ZKt3snl4FfTkatSNBKJpyWsXX8hS2GNufmLdqrAenIrk60eaoaDKWYNyr5cjAZpczA5L4KAe0LZHxNWYQJDWV/QNiNmjiZjq0YMx2+MpDCTvYq3NDJjWuuPMIN60sGf8Ib+WZLMy7x3mwsubn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011640; c=relaxed/simple;
	bh=R8j2uJWCuPQF4jnyFmqkM+Jyum5uRWUwD37pUrqBtog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YplSRpom7IkoLoZM7KpSnGM//cJysyakA5WObWAUfV427XKqtAsZIEZcT8c+cl78BIhuYdIx9Gig+tL6swMx3izReOvJ6gjEWe6viLqccXVtRTVgtGs8/kS+kXTEicE8iRoGlEWGBJT8dUyzBMCQdUZzKQDrNJf1bG6PoKTMDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cZ61vySY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cZ61vySY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-480142406b3so110135e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 08:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769011636; x=1769616436; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wg40ewCl+D/97ANr1h+YLqT6oKOLJb+xdwWdPiyglqQ=;
        b=cZ61vySYiZmYU2PQuFdpg2zx1XyWEiM2RE4jBJj/niG+Z7VGUKeA6pvfEbKQ/OWW3P
         q4RyM3+TfmrxKA/KKBxMVSIwJVkLfeTCfNevKHt5R5BRNT2PEf0L7e+eE8X26DfWUAs7
         Ffk2tzpz//1LrjiV6510tpJm/0aAkiSS8gV4r8NZwI3sBFXykYcKpCReGhRE99hybKtz
         ddPx3S4+31JElaMWLr+ksCIgkogJjGaknyxDRw6uGNCzZNybdPnb8+jVVgswnZbgHgYM
         ln4wH7ZmDAlqj5AQEiecHP0vlmW4s6HalMhhxGfdYr65URE0XND9jBmTXjOHgwBiPVCH
         VCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769011636; x=1769616436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wg40ewCl+D/97ANr1h+YLqT6oKOLJb+xdwWdPiyglqQ=;
        b=B16Wt/mV8ZdYfqtO9Ediss0ch9bxIo15J2MBWt6Eb2vnR710i9kOVtK2DD1dOXj/5J
         u5JoQkRc+zccb3kauD6Kv9qmPuwlmd/CTcU3DhBIBqtmabGFxvT0iIK8hWbiOHvZu+1o
         EugUYooOAxQCpH0WmfUyQ/btO4/pbQ0GYtzhzEJ5AGS4rkzvJkhYdw/lixlqK60ZBr9S
         ObmzNfkBJ/kHZ2kLJ9iR7pNy4qGmZFAmukuGyRaL7sgeXHd34T3WT4esOwpYJ+rGmfPI
         ZHjak0lVD/EQCC6s/CL84Sy81CKUTcg5o9aEJTf2anq38feHd9wpAMLNmC69zBxR5Eav
         DgEA==
X-Forwarded-Encrypted: i=1; AJvYcCVVqsLS5QpSys6j/PK0tdnkiSnB/j8xxqTG461vUGHUY5Y9JmZY4SA3pPQod/WSQRjV4nUTxLEXcuUMXzEA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5KubH4QoSuPFhbSryQcQKhWqgT0kz82o+0dT94Zz5mq1aN0Bv
	8eOpHha7AX6FwFo0PLwKsKfWiT72Uv0casv3sf7/SgzzNk0SZYHP1HajIUGTZlRGLRU=
X-Gm-Gg: AZuq6aK2DojBSzgF+b4ri+A5hvtTxyWEdfZ4LC1I2pLvK5N3uDggcgvenGtaYK9txaG
	LLmqS98K3lwjKon5DCG+Yyg5CEf+XK2/STQUcgPZnws55uJBRe1ZSRGMVGepZKodRhF5bSJh8he
	/TZ7IaTDW8wc8uRZFgNHjNY626vJSmARzQNir5QMbdfqvASClNbOcFSysT3hQe9iOHlelx3WEq+
	mqE3JMeUxfnTvjcCi0IK5gWLd71GJW3nn1iUJNUT4x/82OT8K7pizPVVyLkmlMNqAfQ/rKVEOBL
	9LXyb4A1p3qNFymLEc2nmTuSvussYfPxkQoIXkIrEerLZ9qUQ1pJQXZu+nMCK5Ld/ZOiOzPVm1a
	FDQX84EUCu7vZwP4bScIeDqqyOPmILsxkMTCvJ6I+GhGse3HGd/UkgoidOXTRoO83duGUM0CwO8
	1CQMY=
X-Received: by 2002:a5d:5f94:0:b0:431:1d4:3a8a with SMTP id ffacd0b85a97d-43569972d22mr24018615f8f.7.1769011635930;
        Wed, 21 Jan 2026 08:07:15 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm38511033f8f.2.2026.01.21.08.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:07:15 -0800 (PST)
Date: Wed, 21 Jan 2026 17:07:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] printf: convert test_hashed into macro
Message-ID: <aXD5sNXwhnU5ycam@pathway>
References: <20260116-printf-kunit-printf-attr-v2-1-3dd7fefc3207@kernel.org>
 <aW3pgf4FQHFCC9Bm@smile.fi.intel.com>
 <CAJ-ks9kOpAVq=-b2AXp02F2gJEAmJZxKE=UAGa5ypsVE_an3pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9kOpAVq=-b2AXp02F2gJEAmJZxKE=UAGa5ypsVE_an3pQ@mail.gmail.com>

On Tue 2026-01-20 10:50:09, Tamir Duberstein wrote:
> On Mon, Jan 19, 2026 at 3:21 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Jan 16, 2026 at 11:27:03AM -0500, Tamir Duberstein wrote:
> > > This allows the compiler to check the arguments against the __printf
> >
> > __printf() since it takes parameters, OTOH it's an attribute at the end,
> > so I have no strong opinion on how to spell it.
> >
> > > attribute on __test. This produces better diagnostics when incorrect
> >
> > __test()
> >
> > *This is reference to a function.
> >
> > > inputs are passed.
> >
> > ...
> >
> > > +/*
> > > + * This is a macro so that the compiler can compare its arguments to the
> > > + * __printf attribute on __test. This cannot be a function with a __printf
> > > + * attribute because GCC requires __printf functions to be variadic.
> >
> > As per commit message remarks.
> >
> > > + */
> > > +#define test_hashed(kunittest, fmt, p)                                   \
> > > +     do {                                                             \
> > > +             char buf[PLAIN_BUF_SIZE];                                \
> > > +             plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE); \
> > > +             test(buf, fmt, p);                                       \
> > > +     } while (0)
> >
> > Make sure you used tabs to indent the \:s.
> >
> > ...
> >
> > The downside of a macro is a killing of compile-time type checks.
> 
> This macro still bottoms out in __test() which is a function, so I
> believe it preserves (and enhances, per the commit message)
> compile-time checks.
> 
> I'll send v3 with the changes you requested above.

JFYI, I am fine with this approach.

Best Regards,
Petr
