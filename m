Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCE61531C1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 05:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764825290; cv=none; b=F/wGYjcRl2aDYPWoh91wCpqopqBFiAaQe10g3VRldgtXbOLpppxOgLstwStIAp7UJWuyua3XEDDfEN/l7vt8AhRov7D9SAjx9IXpZUBU39Ez9cD0THY4cw5mj4PLzB+RAO/pqWdzKL2/wzroq1IE1pW+Moy/sRNyfWjamgGo6OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764825290; c=relaxed/simple;
	bh=4t7SHe0a/WWoVDjkuvgVi61nDz1BL1jpsoY32RbkNEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iewgRviyYmMELR0GVkUM9ogoFoBYs6TPy1PRZikNGbTzRXloC7QkMcI3nGrvOD/RBWDVuOzFqdUkfLHFMfyXQuDRBr4Sd8E2F9F23Urtn9MPiboXRJB9PGvH6/lbXcrpr+BSC5JpExGEFLbcWjVrA4Z76m6huEyjEGpFJy41A0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=em1kIzhe; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="em1kIzhe"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34372216275so513093a91.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Dec 2025 21:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764825288; x=1765430088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GpEr0fXKRKfAPVzFQLLQ3/1IgfGRkPOJgHxqpLfydDk=;
        b=em1kIzhe/fCLCi4OTBAMrAgCg2XIEwphbk2PYft4oOZSs34AA58dWfHD1uVYJnZEBJ
         EIOILfMsvjDK3kW+xlqvhMwvbvWoYyNQdIG1nfOIEgqPyi/AIgf+GujVJMcWtaEaYA72
         7xCxYg/epS7pJ8agnGXU+3VJzz4vUkd3XSM8HgdIewP97Ui4ycpo+fZCqgfNFFmNjx+4
         LNvsYR8/3wkkCXAFPjQzPD7bEgc9gwCu128WAVaz20hDhci4+vHYLXXSCz3ceIM5+C5U
         x7KPkBMcLKsYz0xfLt9udTH2F3ELe+e1AS7qqQir9Fkkup+G5nqR1Oj+PCMHHkWHI5nx
         dd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764825288; x=1765430088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpEr0fXKRKfAPVzFQLLQ3/1IgfGRkPOJgHxqpLfydDk=;
        b=druwJG66T/Zx1PfTh+CD6c9nidMJtZhFdI4UfLql2NHZgzlNzIHKma3LmbJ2DCYdbu
         koMPCMZNcsGMndtMKuztJ0/rA0rWZ3UOqoIBuNw9rOE2MO1VSY7fDIs5yGVgNp0qMCtI
         JMFjC+PT36I5Qi9w5+D3iYYOXI5LN/FTZ3n+FvvVNCXTayo/j2PlhChQLOY0rg8VDWVV
         x1y7i38LoHXDGBFuFdaNvJPp26Lo7FcA9P3EvdZd4y+G5EiAf1uEM0Fkpd3FjnHEkVLN
         Ony+kLq5+/rRtTlG5Ga1pBMSO8o7D2x4mqItoKV2mrR1atJtP3o8qoI6yf7TMQVJenrL
         C7+w==
X-Forwarded-Encrypted: i=1; AJvYcCVTrCaT2XQPM63Ljw5Zo9BUt8OZo7cZcjjXX4X3vd4gjSqxk/i5EFxhZPw0Slyn0y60exGx/JK1lPLMS9fy@lists.linux.dev
X-Gm-Message-State: AOJu0YzH821E1hFMOYoLN15mBaPZ08vsg5Nog74fneQVbT+eVlCm187l
	rmDJIKwHB6xCj5X87Vutu5eqaZYpbTogEokFMQBzYsUWygo7ck9qZ34zWtGlcsdXh1k=
X-Gm-Gg: ASbGnct96zAbWTYmPedMMNpaCpSYoJijSBlr3jMP7EhQ+23Jj8dJV8JnlTJ9DO6Kbhm
	NjuwqwNfe4H4nHTtnwUDJC9HuXFv29u65CQnnE+QJwdljkSw3mHD6jSJpVxjkVSlaTm3m0Lr5zU
	qdMu2ydyKcjxXkQkz1omPl6ufqWjeC7gOt+HIMGacuukGtxks+SGo6oljY8WJ5Y+t2jZo/J+7lK
	4KsObX7M+hafsPV0/wo/xZ2Xshg7AfyzHO0262tzJmKoa3LVjL8MBCM75YBTLNGt1RqA7ilQ7As
	jcM/fu3D5i3fuz8QhwmEb6znZFiay7IxhlpTS3nq/1+M90iIbe7m8gO1sMf6BsvdrV9PFKj8gu/
	o9ieD0k5f0G7S18kPJykoBRWSpi6WWYWpS/tNcnwCXNKU+t0IIMHfH7WFUFh05UAw2zrmQw3gwb
	3EX/FJBerUX/A=
X-Google-Smtp-Source: AGHT+IHOU66KjM/bqDCEwIa4oaMB1NnX0rRDMZxrD7+HYrPVpRmaHU7Mdpmh+5y5sznY1qGucwWewQ==
X-Received: by 2002:a17:90b:2d4f:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-349125c0989mr4838856a91.2.1764825288212;
        Wed, 03 Dec 2025 21:14:48 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-349129beec4sm1649549a91.2.2025.12.03.21.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 21:14:47 -0800 (PST)
Date: Thu, 4 Dec 2025 10:44:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: error[E0609]: no field `cpu` on type `&bindings::cpufreq_policy`
Message-ID: <h7ujvxxzlvj5nughu3vl4ys7jqpcngdn7wpx3rn2grxuugzgvk@cekrjf5vrnbm>
References: <202512031219.3OgecL5W-lkp@intel.com>
 <vacix7xdfokw3m25ekthitv2f2bhiuicqq63ww22qn34mylfof@tddok7combvo>
 <aTETMp6lr75IPXBg@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTETMp6lr75IPXBg@xsang-OptiPlex-9020>

On 04-12-25, 12:50, Oliver Sang wrote:
> hi, Viresh,
> 
> On Wed, Dec 03, 2025 at 12:56:10PM +0530, Viresh Kumar wrote:
> > On 03-12-25, 12:09, kernel test robot wrote:
> > > Hi Viresh,
> > > 
> > > FYI, the error/warning still remains.
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
> > > commit: 6ebdd7c9317737123b260a24e2780018008f1295 rust: cpufreq: Extend abstractions for policy and driver ops
> > > date:   7 months ago
> > > config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031219.3OgecL5W-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> > > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031219.3OgecL5W-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202512031219.3OgecL5W-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> error[E0609]: no field `cpu` on type `&bindings::cpufreq_policy`
> > >    --> rust/kernel/cpufreq.rs:462:23
> > >    |
> > >    462 |         self.as_ref().cpu
> > >    |                       ^^^ unknown field
> > 
> > Is this still the case ? I wasn't able to reproduce the LKP setup, getting some
> > failures. Can you provide: rust/bindings/bindings_generated.rs from the build
> > folder ?
> 
> sorry for false positive. we confirmed this is an issue caused by a bug in
> bindgen - https://github.com/rust-lang/rust-bindgen/issues/3264
> 
> after we upgrading to bindgen-0.72.1, the issue gone.

Thanks Oliver.

-- 
viresh
