Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF13EBF1B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889944; cv=none; b=uKBk19z0wPhiBmJeGO5osbuLxggDTH4ZJl0synG7qhS5PLsljrQVEhtTvM9GRs7gjBGpU0rV7hD5aA6GQ3yBKRoKu5OuQn/h3gdVVZE+Rk9cjWwi32BoZdwik2UiYZT9czcAkjKcugWF1kbkaNirWU1QtOLgVHjENZpI7xG536I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889944; c=relaxed/simple;
	bh=pU0VB7AYOzQl/yh/JheYXq51M96vqe6qh/dIv+Br+Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gU2EKl6wUpQ4HN/jkWAkYC3lYLRtQ8ruztyIvzlSGkt9vihDewC6HRZcsGlQTBevH2Jtds510osLIaAPh2r7mjiYfW3glZFBidWYQaNeljRnm0jixFrnHTIzb1niTsXgrx+AZcNLU+fowZaRMWxMTZxpO0YFUO6ti8GgKqL8a6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H4wICBwh; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H4wICBwh"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so79561635e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 01:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770889941; x=1771494741; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9k+OG3Lg6/8MR/lpCIljUo1hlGXRPUExOQsJeHIhbY=;
        b=H4wICBwh5x3fVbvwHCPd4dbC/donLyhMHtY4M5ZMlrDFNVaDSPAlAIxXevMhMYOcbK
         eLMMxZMVpFkxBtNj+lejvTzsvS2hOpOqyne+AskyxDjMWdtM2b/BGpWawTAX07Q0w/Ji
         XeZQYXhIrY8EOlw0rXpabCpxLpW0dS7cYD8NR2ZKGqjkwj2RMl4M+xfe84P+gBjjpmtM
         RgvFBY9Dbu1AykxE5U+WDMb3Zhb8ubujhEPKz+w50kecInzLqxSONEyXnqYb/rdz2Rue
         mpTo5ElQUU5QvJLLUwguUGBQj9L0YX+zytCbYsI+lRJnPxnRfO0A2bYtyGJDHhOJ7OB0
         koEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770889941; x=1771494741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9k+OG3Lg6/8MR/lpCIljUo1hlGXRPUExOQsJeHIhbY=;
        b=qH8sInvUF1N0dXp4S7FJA/X6/ha3eM0iIbxdtN0aM4hUwBFfCDYR6wprv4I19V6vpr
         /ytH7tLouLpPvaXf81otpo7vEeE2W3STz5D5jHrOQju5sGDkLQTtXeDZ2J2YMZ+AZEpG
         bGf8+GnCVgTMkr1SIJ2lILJtnwT+1jAIMafWaLTReA2RfGuWNn+PxPh/N2464QbCvQOX
         2gcRHVzAm4M26Ng78bbUsd7EVnemNOE2w6unvi0rWmqOzKfHlBsuuDSaDzK5y0sMDyzX
         NB0TATcfEjzczv9dOIEsV1cgdX5b8g1KjdbCV4AckrdHwFOEQJunwOUvaIZWcAbhge84
         8L1A==
X-Forwarded-Encrypted: i=1; AJvYcCXAjoshzp4KzMD+5PfA/IdEvIv1BsVuBRg7RfF1lZTv5o3ji4173n9f7IrbZFBZyqArB3oCPkOlsP/z6kYE@lists.linux.dev
X-Gm-Message-State: AOJu0YwBmY5spRP4ndDe/JJJY83FcMP9ZGs67hdETCFibGsNO5Rtwp8r
	Rmozrz6C5+CsVcMz+2lJpyM3Qpy5pDsE4mPZkgErOXM6PPirkqq+JtUrMHK3M2hwoWk=
X-Gm-Gg: AZuq6aLEnimtnxRFbNJK/QxDRrIYHzN0pcJ8IL0FfuhFQiLkJCgb6FQYOXFtPK9XFVg
	iDTzGjxp5U+LS9A/RQv9CsqwJa/SySLBb3wvvLdoc8OYoHMMOXqR8O5CldfJuBukmRlnNoUow2K
	vNj8q3k/kh3wP0yq40oNY9M8Je0ZaHwtszdLLGH6ax3SUTsSvxkAs/x/TNdPEGfj9UxoSOGKqPt
	3EGhZd9CrM99jhui0PtFTXlkRn7NXB8y+VBKkhu/l9Dkw4Gum9Wmc71r89bILPshJNstFaLI5v5
	y+Phrub61DiImwDJz32D2H0EcQYLUN9nuRyxrwGyMdNReT8RcYLlmaZ1/89Ngx7VI7nNk1BWqwy
	Kzl0bmlu47VgoQzy6JqARSWuQtztntgZRUn/MAPyvBHSOS5pa/uNCOwSEijccOumaVImj7WVRZu
	iwe67EOXYod0BtMLVXeXprdTdDAw==
X-Received: by 2002:a05:600c:450e:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-4836560d37amr28513665e9.0.1770889941139;
        Thu, 12 Feb 2026 01:52:21 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d834ebesm183195375e9.13.2026.02.12.01.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:52:20 -0800 (PST)
Date: Thu, 12 Feb 2026 10:52:18 +0100
From: Petr Mladek <pmladek@suse.com>
To: Helge Deller <deller@gmx.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	kernel test robot <lkp@intel.com>,
	Tamir Duberstein <tamird@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9199/12313]
 include/linux/compiler_types.h:617:38: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: IS_ERR(PTR)
Message-ID: <aY2i0vuq1TG-yEhn@pathway.suse.cz>
References: <202602110708.x7AYvCN7-lkp@intel.com>
 <aYxi3KG0gHBBbqox@smile.fi.intel.com>
 <aYxomlXamlNiNa8G@smile.fi.intel.com>
 <aYyKYa36G-X-ScN2@smile.fi.intel.com>
 <933de445-c15d-49f6-a5f9-026eff6e4e06@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <933de445-c15d-49f6-a5f9-026eff6e4e06@gmx.de>

On Wed 2026-02-11 17:27:47, Helge Deller wrote:
> On 2/11/26 14:55, Andy Shevchenko wrote:
> > +Helge, do you have any insights on this?
> > 
> > The original mail is here:
> > https://lore.kernel.org/r/202602110708.x7AYvCN7-lkp@intel.com
> > 
> > On Wed, Feb 11, 2026 at 01:31:41PM +0200, Andy Shevchenko wrote:
> > > On Wed, Feb 11, 2026 at 01:07:12PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Feb 11, 2026 at 07:15:01AM +0800, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > > head:   fd9678829d6dd0c10fde080b536abf4b1121c346
> > > > > commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 [9199/12313] printf: convert test_hashed into macro
> > > > > config: parisc-randconfig-r122-20260211 (https://download.01.org/0day-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/config)
> > > > > compiler: hppa-linux-gcc (GCC) 8.5.0

I guess that the test bot is using GCC 8.5 because 8.1 should be the minimal
supported version, see Documentation/process/changes.rst.

> > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/reproduce)
> > > > > 
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202602110708.x7AYvCN7-lkp@intel.com/
> > > > > 
> > > > > All errors (new ones prefixed by >>):
> > > > 
> > > > Very interesting case. My theory is that this is a compiler bug or
> > > > a rare corner case. When test_hashed was converted to a macro it
> > > > affects the scope of PTR in errptr(). And compiler most likely
> > > > mistakenly drops it's value to 0.
> > > > 
> > > > OTOH, I do not believe that it's a problem of IS_ERR_VALUE() implementation
> > > > since that it is so low level C standard integer promotion rules and should
> > > > be covered very well by compiler tests, etc.
> > > > 
> > > > However, it might be possible (but very unlikely) that the 32-bit
> > > > value is considered smaller than (unsigned long)-MAX_ERRNO. If
> > > > this a case, why only now? The change was introduces in 2019 to
> > > > have this BUILD_BUG_ON()?
> > > > 
> > > > TL;DR: Changing a compiler version might help, I think?
> 
> I think so too.
> 
> > > So, PTR was used in two places in errptr():
> > > 
> > >          BUILD_BUG_ON(IS_ERR(PTR));
> > >          test_hashed(kunittest, "%pe", PTR);
> > > 
> > > The compiler has seen that PTR is always used (it was static inline).
> > > When it was converted to a macro, the stage that does some pass now
> > > probably thinks that PTR may be eliminated even if it has non-0 value!

Honestly, I have no idea what is going on here and why inlining would
mater. But google pointed me to a discussion where the inlining was
mentioned:

<paste>
Oh! This function is defined inline and not __always_inline, so that's
the problem. BUILD_BUG_ON will always fail if the values used in
the condition are not compile-time constants. So you can comment out
the BUILD_BUG_ON or change inline to __always_inline if you want
to get going asap. I can probably reproduce it by setting the max
inline insns to a low value and I'm guessing that's why it's occurring
for you -- your compiler may have a different default max inline insns
value than mine, so it just exposed this bug. In fact, it would make
sense for Debian to patch their gcc like that, it likely results in
slightly smaller executables.
</paste>

, see
https://github.com/daniel-santos/mcp2210-linux/issues/7#js-repo-pjax-container

I have no idea if this was similar scenario or a completely different
one. But it seems that inlining affect how complilers handle
BUILD_BUG_ON()...

> > > But again, my knowledge in all this is close to 0, especially for PA-RISC.
> > > I'm purely speculating here based on my experience, intuition, and current
> > > code base of the Linux kernel.
> 
> I tried to reproduce, but my cross-compiler does not trigger:
> hppa-linux-gnu-gcc (GCC) 15.2.1 20250808 (Red Hat Cross 15.2.1-1)
> 
> Preprocessed source is:
> 
> # 76 "/home/cvs/parisc/git-kernel/linus-linux-2.6/include/linux/err.h"
> static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __attribute__((__warn_unused_result__)) IS_ERR( const void *ptr)
> {
>  return __builtin_expect(!!((unsigned long)(void *)((unsigned long)ptr) >= (unsigned long)-4095), 0);
> }
> ...
> static void errptr(struct kunit *kunittest) {
> ...
>  do { __attribute__((__noreturn__)) extern void __compiletime_assert_305(void) __attribute__((__error__("BUILD_BUG_ON failed: " "IS_ERR(PTR)"))); if (!(!(IS_ERR(((void *)0x456789ab))))) __compiletime_assert_305(); } while (0);
> 
> I will try to check again, but I believe upgrading the compiler should fix it.

Hmm, I am not sure if upgrading the compiler is an option here.
I guess that they use the old version on purpose.

I think about reverting the commit 9bfa52dac27a20b43 ("printf: convert
test_hashed into macro") if we can't find a better solution.

I am sorry. I do not have time to play with this.

Best Regards,
Petr
