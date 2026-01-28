Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C8132ED24
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769591844; cv=none; b=mtW8oF26Kpt/NC68ztkSOdpby+shTyIdBKVkZMHglZz+AaUZwbNJkFPFLQfnPAZVCrNAZbPkd9BspAFDFkKft8Vf4KwM1o71OW5YzJNSUc0keMLUMJuWgmm+Lfyr+o1oCFbkBcN90jLnggEki6NaOri+JwJv4MFNOYzdOg18iBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769591844; c=relaxed/simple;
	bh=yO6+U0qaxUaYOUYCKg1MexH3YZt5dPEUe3lerkYdUFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GczVnzoKnwp/9RBfE7oUt+ikSzctDMTaAKyYFlG43UTuk/NHICtI09RwMYj+mgeZhynRFlNNMLmHhrp4n1I85DYtpFoGbPJyqANsXJmGvjTZSCDGUGqPjavU3KY1ABBI0J6kjWvkpznOB7c0A9eEd5pVd0MOswB2QrQQtEQfcoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=B4wz4sOa; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="B4wz4sOa"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so4516148f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 01:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769591841; x=1770196641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/k4MsBbSp2/KH17/DEg4LJaTxhduisqFO54YsL7siAQ=;
        b=B4wz4sOatPoqTcrwMGe+Wkha/9eDA+cAqEhz3npFbHMI864UAt73qwJElBZRHc/Tq6
         jGwzLdjSCx/uHjJ20AMeaLBzDka7Ah7Ng6yiNX9TbrEh4cwO49x8gVV8hbJA02yjwe/s
         D+jueZEGIv21+HNc5r5FmdsUoaCtsZVf03Gjyx6I5k8jVFp8Edj+UiR2f/EG9PVxq5m/
         WYvho06EkSqR5fy30SNsR5vxEyGB+KyrHU8RbqHbCh1NNEJhSnP7xC1mx85aDpfchRY7
         4aPklkjR7QXwwiV7AZKcB4n9/JFKkDuiZryTQ2xFDqAzcP9Na7pznHF5UhbQzP7OdYLy
         /TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591841; x=1770196641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/k4MsBbSp2/KH17/DEg4LJaTxhduisqFO54YsL7siAQ=;
        b=MDyYcJZEkN6VnddVZGr1HGBc/q68d2Z1ViRvIZHHDn6c2fT16qMtNv99FFiNO4Tr+2
         nEq2BT2t2SolUIEVGUPuLFB2CSe/eouCG+8hVs5xbbFv/Fwu3lxNC45ejTyKJv8HiiD/
         4v0aBjhQT5kvLa0TyY+OS8lyopdjHzOKwgg5S6MLjMmjJIvTmpE/NUL1crYP8S/1Ikcj
         NlDv27naQVynvfcMIsYXz08uF29GXj9Jbx7UAcPplpxN4PHIkrW9sbbq3J+x2lLNQ/Up
         4lOnVFAvHtx3F8oEXx2emawdNGLjUeBX10bu/HnhQREm55Wceq1ketrpCCiZb5AJ77Jc
         unhg==
X-Forwarded-Encrypted: i=1; AJvYcCUEdNvquKGGwd7YjxOc9gaz3Kc7ULtf2vj2XOyMyypWBrH/wgNLvg3Ly5S01+YpacGJxxjWQWMGxlhqEDRL@lists.linux.dev
X-Gm-Message-State: AOJu0YyzkRliEZj/p3FzQNIlkZ0lrXgqTWfGju+NAzNqezTJYIfPyr5D
	nf8+vQC9pyV8ZyjO0ztm7ZBcU4gEn6PF9ocGxwG3y8AB334/iSDspYQda00iLTEBIAE=
X-Gm-Gg: AZuq6aKEj57FDFNZJUHLDZDJEXsta1U9Iw47tFj7boimW9RHPbE7hZwFUGvb0qUlfE9
	94wBiaMxFzGxi7HCw1EEA9Q5SfqkNf3OXNFZZeegKyVypU9RK3A4bd9PhZgQGgh7we+2r85ojkL
	2OVXQWKJ9ZNtJxpW7zJ1doALWhD5y0OwObrvN4k+AKJ40XCjdUsmKHMVZ1BmalBC7V3GOIby4pS
	361XfZlGdIZgR/WDFad36PD3TKfWAOFmBL8xCz78zKNadX10uoStbXAqeVaxA3Rl7Qsl3Ws3e88
	qBKw2im8jRFe7WSCPaTJsJmcoleDZD+OLmW0gt2o10fpXdVfhDDLLkVXWLtyE3H1zkQDvjtlWtW
	k3BT9YllEf6msIxGQvYZEL6BI2TN9gfWV6Sg7Ku6un4vRuaOglD31qWwUarqg7M5IeBM/E64muN
	iBY5ouFxPKqrnJTg==
X-Received: by 2002:a05:6000:1ac6:b0:432:84f9:8c04 with SMTP id ffacd0b85a97d-435dd06e029mr5958691f8f.24.1769591840559;
        Wed, 28 Jan 2026 01:17:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm6281836f8f.15.2026.01.28.01.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:17:20 -0800 (PST)
Date: Wed, 28 Jan 2026 10:17:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] printf: convert test_hashed into macro
Message-ID: <aXnUHTu62MmNGNdy@pathway.suse.cz>
References: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>

On Wed 2026-01-21 11:10:08, Tamir Duberstein wrote:
> This allows the compiler to check the arguments against the __printf()
> attribute on __test(). This produces better diagnostics when incorrect
> inputs are passed.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512061600.89CKQ3ag-lkp@intel.com/
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to push it right now. It took me some time to get back
    to this mail. I am a bit overloaded at the moment.
    
