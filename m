Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD734FF55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093762; cv=none; b=JT/OlZQpjk273Ziv4kX0KObbveHRbY8KYjHIL+h3m3J936e4iZAfReQvKysl7/NYMyNo1ozeu3Uv9Xsz++DxntD9rWN8D/MMtpFDdaB/l1v67OE9Tk3dFe2bgY9t5yWaFw7LaDxq5mUnl+hjF7DPSqd28x45dtciZ8/fOM6/u2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093762; c=relaxed/simple;
	bh=VuqGJIVM8VcpIVsws5L0tiI/QL70lNQvuGx5zIlxuyE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpMm4JlknLnMaFdbbsW2JFDaWuCAJ6LJAlQdmq+mHcGJOKb073hUeZL6YRmKHuHcyVdpX7by9J0EOnWtGSmGP9sBF1omBBO+YyYv4jEIkcah3rm9uSXBe7mZXeg2aS4DkQ6JuVP9CCEKARij7gGG8aZ6BJSym3dRBH0f3LI5+qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBT8Pw3y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBT8Pw3y"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so10849105e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 06:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769093759; x=1769698559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39Z3xY5BPN6XAwZM/W6drGSAohVogKjxUvJh+CCUHDg=;
        b=QBT8Pw3yz68QH8CcrsCWsVkds7oSY6oSIosLDW0Z6ssoyYK3lNm8CKtnyBxJer7mDK
         MfDSM5HYjwvQsyre29Cbs0Bwus7UoyhD45ZtSjD7xR6j/rTIlGBhBN8/DYA38kC/8Hbz
         F4kdI0/SnBsP8BGgdB1EBcj1L+RaVzdjCL2Yi1KWUykhkKN+ZJCcZxSAI1xjbVEPuTRE
         +VW5m9CdqOgkqtIzZs19CRNHF3knEtkFOBjOB0FbSo3UTfKgG4C0/O4MQcoPIhZckBt+
         LsGbhw7S/Qi2Aei1UHtp9S0BVYzK5UCAVvSPDqdPIniV6ODZk4r7xkM9gWNhXb4H6VFp
         RCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093759; x=1769698559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39Z3xY5BPN6XAwZM/W6drGSAohVogKjxUvJh+CCUHDg=;
        b=DzxsYle6Iv/S/vIfM/HHNwG7ztUcLIBlZ/yggaecQr3i87b34qAS1Wnx22L7PaFb4T
         zG1h+7ncNKdqBqZwgy0o/cyMGAmdDIeLM4EtD5Gb5Cjqy6FhuB3EKHoI7DAmhLWz/ucY
         re3ZaS2R0d4cop2l4CLVwxM8YvdL11aRkm+D8xWGaSpTtxZKGxmy1OEs74Rhq0thI/bZ
         IZWQShbealLX4z+sqT04Ajx1Etrpdtll0AHUwpWkUCFzRRkhrwzL21ILhwOMJq95yGX1
         dwFrIm6wJrV9t9bDo/Dbt7e8yZ+7hssfOMODD4uM+uysMhLMtct89v73POKLgAsmeuxx
         1S1A==
X-Forwarded-Encrypted: i=1; AJvYcCXyvyU3zOrQTzL6H2IOnIYOiiR0pZgWUPVpYJ8L9WAAf7rpXmmIF/T2xYK3XLprSfekyItg1DXvOHur5YKh@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy/8VKcZWo7YTCGLla7rrFH3+WeQCGOFKRjb00/c7GOtk+Y8u+
	PrX8D6n5954mpa3q6TJM9c8asuF6jvO+S0nQNUxILimv3u1y7IQhNEAM
X-Gm-Gg: AZuq6aIpMbQiGKt1tGTwiqLEexn0eWxWyMhqA78RLkQG4JjkfsZR5gKodb3BQFnAcU9
	ENRX0P70tC2cQNrjsg0HY7JDhoJ1RQ1iQtC3J93sgtpgyYhk5Qz4v2fh4bfXenYgyrm3anfgWIH
	B0FEi/860HdY5ULd0yNzyag9ScQ9p4WCVVvClb6PJq2bBQ8uPb54U2N1kGWhLUn0c1szKv03Hp7
	NBfJLxt4l2aHnQ1FMHq8wiPmQ2QvPfeJrb66M9vfTCen85VBE9Q5UfAALyjIP9h8h4SpuQubGgr
	OoU+L9kRD/fVMBjT9zRzKwfAl5ZJk1rgB/j7qoV6LHRHpGYqfaVRMs6nJDVyg5qv3Xrh6/JVOBR
	uXGgkcaGu4Qf43nlyhh0T2T/mDnCOEtoj0SlccRnlwP2QOWv2IYbzK8X+HHS763XWt7SyLjI+AU
	Ckjd+GSTuzzOsmf/+m5BVqThRH+qKoouGUrTh17Zieo5Wyw+MDmGm1
X-Received: by 2002:a5d:584d:0:b0:432:84f9:8bea with SMTP id ffacd0b85a97d-43569bcf38emr33053462f8f.51.1769093758592;
        Thu, 22 Jan 2026 06:55:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921f6esm44884589f8f.4.2026.01.22.06.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 06:55:58 -0800 (PST)
Date: Thu, 22 Jan 2026 14:55:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, Nathan Chancellor
 <nathan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Yury Norov
 <yury.norov@gmail.com>, Jani Nikula <jani.nikula@intel.com>, Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>, Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH next 11/14] bit: Strengthen compile-time tests in
 GENMASK() and BIT()
Message-ID: <20260122145556.7d72f217@pumpkin>
In-Reply-To: <aXIzpC6wpdv47cSH@smile.fi.intel.com>
References: <20260121145731.3623-12-david.laight.linux@gmail.com>
	<202601221237.soiAkwkN-lkp@intel.com>
	<20260122103337.26473d1c@pumpkin>
	<aXIzpC6wpdv47cSH@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 16:26:44 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Jan 22, 2026 at 10:33:37AM +0000, David Laight wrote:
> > On Thu, 22 Jan 2026 12:41:22 +0800
> > kernel test robot <lkp@intel.com> wrote:  
> 
> > > sparse warnings: (new ones prefixed by >>)
> > >    kernel/kthread.c: note: in included file (through include/linux/bitmap.h, include/linux/cpumask.h, arch/mips/include/asm/processor.h, ...):  
> > > >> include/linux/find.h:209:45: sparse: sparse: Variable length array is used.    
> > 
> > Can we stop sparse complaining about sizeof(VLA) ?  
> 
> First of all, the LKP should install the fork of sparse by Al Viro. That will
> fix tons of warnings that are related to modules and speed up the process
> itself.
> 

The problem I have is I want to generate a compile time error inside:
	__builtin_choose_expr(__is_constexpr(x), x && error_a(),
		statically_true(y) && error_b());
Neither static_assert() nor a negative bitfield can be used in error_a()
because they are errors when x isn't isn't a 'constexpr',
There is less of a problem for error_b() it can contain a function call,
but can't contain {( ...)}.

One of the compiler complained about sizeof (char [-!!(expr)]) as well.
I'm not sure of anything else that can be use to get an error.
I could use 0 >> -1 but that is only a warning, at least the error message
is related to the bug.

Any other ideas?

	David

