Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBF51A27A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 06:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707547307; cv=none; b=b0UW3uFaTttr8SBAcmx59oUtrwr5COvbRXLsgFQc1Wbwy8JFdO/izEsxyMWUgS/H5gZgzwPnzoZFsf7GvuK+YW/sw684XkbWU3RorLVmJW7Wi+3TWFkDsMxGeb/u0kuFgOhx81Z7t+Mk+M4Ra0fQPkECrcjS+IoeAVMVGslxXg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707547307; c=relaxed/simple;
	bh=yxaBIvaCvCFMBiJAMWPiBnSu+HXDJ+ESeSh2AhK4QmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fa1Y0Rk7AmsiAw6hVhqzrsN+nvfbxa9VeKK7LUncfvLbQeHCOWHMWGG4G3wrZuySbthsqE4pmZb6nrNY61ZrOZdGKOt7Z7x49fvenGtQ5V0vrigh8/8Z3aBQIF/bs9in8vENyYFBGquhTJNJNs4EiZRjpoFX6elf23NAmfShOYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dUm0vHFb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dUm0vHFb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d746856d85so13368625ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Feb 2024 22:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707547305; x=1708152105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4s7YWKw8vMDXZzc7OV8iMH9o9J180EyKoeLHccFGXhU=;
        b=dUm0vHFb3Q+CrNNlW7jCkW/14SPvc7TCQDh+2QGFmEOVP+4c3QK+YYGdtVNJN99CnA
         Z7E5JDi2Usd/wk0h5u88qTjqAfx84zf3BosZ5OszRe7e+sadm6iuypfFOfPAFVjz0vnw
         Jrj/5eMBoWzAGWeVADR4waMs/Y7t8U4U7TFZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707547305; x=1708152105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4s7YWKw8vMDXZzc7OV8iMH9o9J180EyKoeLHccFGXhU=;
        b=J30e6l8P+tP1kYJ0HSspui7DdY3d19pgoBiuM/88N1AMIvKg7YUcR+mkakBSxuhHw9
         3HrdFN0KRsiJgBhZqiJXwVLOS91J97Fs1Oscb9UlzIbmQgaKS5HtIALVOWIwm4iiWyjb
         wrQHzdV/IEjt3UsxcpWhN+kLKzati//xrcBUPvobSXHdYQ9j/5ZBx1CFo+mOeiaLyJKH
         q8h2crOYrKEl687h961evHcw4UeniELXZSuHUKDUbcAyLSIarJHeDiP538M/hyjf0LJS
         MFUX1RhKRkdS4uEPnDuI5Xvpt9m5mgxdnJVNOPh0TtsD7vRTRrMc8bznvKGphQJosZEF
         /+Qw==
X-Gm-Message-State: AOJu0YzHZ0L1vBRMl3tz544Q4KcBoFWiL+Q1R6EePc7Pdn3Rdt6hR0Dz
	VB/tHLtLyqj+ZzJFpBRTdRWYtBzAYXvxUJBGUdIQZN263gt20WUUMyTAWl7VeQ==
X-Google-Smtp-Source: AGHT+IFUFPhe+sib5iaEaIiNw2Z9OCtCHJ2JT6IBiFYv7CAaK8c9jYUH53fzI0Njczat/JoJiNBftQ==
X-Received: by 2002:a17:903:1104:b0:1d7:88de:cffa with SMTP id n4-20020a170903110400b001d788decffamr1835706plh.19.1707547305177;
        Fri, 09 Feb 2024 22:41:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWiQHvx1eksAu9I0C+I6GQ2b/sjiwh+NM4LLGbspjRvom93rD4s0Rt70l1Y5mk9Il9LeBKdeRPo7sIZ/mvvSDywn1/ITaVthavo3QFGhdwiL82V2aGA/zEZOcYriwjegMufjGEY2BWs7gWPgbSQQR0=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i11-20020a17090332cb00b001d9cfb9af20sm2444010plr.70.2024.02.09.22.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 22:41:44 -0800 (PST)
Date: Fri, 9 Feb 2024 22:41:44 -0800
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Subject: Re: [linux-next:master 4186/4898] debug.c:undefined reference to
 `__ubsan_handle_divrem_overflow'
Message-ID: <202402092240.A6DFC1875B@keescook>
References: <202402080538.FNTaeLJO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402080538.FNTaeLJO-lkp@intel.com>

On Thu, Feb 08, 2024 at 06:00:13AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2ae0a045e6814c8c1d676d6153c605a65746aa29
> commit: 5084a4cd510f887a4fcc9f3386de1fbea698c7c4 [4186/4898] ubsan: reintroduce signed overflow sanitizer
> config: s390-randconfig-r063-20240207 (https://download.01.org/0day-ci/archive/20240208/202402080538.FNTaeLJO-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402080538.FNTaeLJO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402080538.FNTaeLJO-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 2ae0a045e6814c8c1d676d6153c605a65746aa29 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    s390-linux-ld: arch/s390/kernel/debug.o: in function `debug_output':
> >> debug.c:(.text+0x17ea): undefined reference to `__ubsan_handle_divrem_overflow'

I'm not able to reproduce these warnings. I'm using the config above and
s390x-linux-gnu-gcc (Ubuntu 13.2.0-4ubuntu3) 13.2.0

I would expect adding this to arch/s390/kernel/Makefile would fix it:

UBSAN_SANITIZE_debug.o                := n

But I can't meaningfully verify the fix...

-- 
Kees Cook
