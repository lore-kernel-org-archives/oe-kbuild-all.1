Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340729ACDB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764746775; cv=none; b=j2j9YYfK1LzawlKWzh1XlN/ysEVHH7gfbJh2XKkd4NEI9ebBdZ13nzCA6ES+lsO1qohbinJpxR/aERPafrCniy8cArs8I+jHAs0oiB8QkmmCqZ5tPJnWnKFkySbK12ek1AGNwVvHWowWgYFzc1d2n45iz7XUut4yL+G6OS06cBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764746775; c=relaxed/simple;
	bh=Ipr04YRG1upCLECL3u5wEejhBGWzA7HjZPoE+tpaVdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAexJZOXT46rNBC1rxUH6rBL0dAEgLqlemtuJDzGZmt3VnJ42wW8jaj5t+8bX0EpX42XEXgrLf7WFPD1cmamDbqd8QZGYbMH+KWkBGdxLq3XIofWd2zkpJK/FhtLqSAuX22XFr6NHlL5Y1unbyz5Ejac7iWshUV88WKQMqLKUT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTHq7YYG; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTHq7YYG"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aad4823079so5731841b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Dec 2025 23:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764746773; x=1765351573; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=utZLIjktZSc+y7Ug+sNhvAnaFQSwfEqYDLXREx/O80Q=;
        b=jTHq7YYGTW4DVL/oRbTWnxCnNkQIdBcTUWhZT3fB/iaZHPi5fnVeCdl/qGYbQOaKTS
         LIf5TJua0qdrqD4TD2FvXufXFDN0IyjzYfP3LWQKSeOKYdT2N9O8WdofBa9B0hZaeEVl
         CpYqn3ffqLLLAebQUgU7ymC/u246tX63Mbjy6AWFAddwSxSJdB4isix1UpteRvl70xlp
         wPfwajSptDBp8Tu3xd3HOK+rqQL+kudcwlJfBfcjFzU3n0TXrIvk+twjdKO5yUFtsexg
         moatNqaerST3WQ/D3h/XPEfb2r+Zd1cBRGv3HQ+Z817UF24+XW+cOOe0Dglej5U8639C
         jrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764746773; x=1765351573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utZLIjktZSc+y7Ug+sNhvAnaFQSwfEqYDLXREx/O80Q=;
        b=Hqr9feHyPU9LVUEhAgW7lXl8uBNicP3NrJzXi4N5I0lc5+x2qwDrCJx3Z3kkN5g4Zl
         YSCzXdP/PKQg9abPHwRuN1d0a88QF8MDZpazGbhfBl1i3B/4WfB+6aK2bgCat7ihhYU2
         ZPhzDdlAxvCTSGrCFUdRkj2TvMc9z/WMy21BwdKOc7yUcdXrC7G+ADatsDNMzNEUYO7Y
         JAmOK+T2qNKP3PaiLjaRVUHs/YSzO+HzffHpwrxjIPaCIB0xG7j6MrnfFncxVOtViOQO
         jriFe6wCaY9gjetIJj2bDewo6UIbQ3wE5HbvtOaiwGOLItkwaHvolD20IjoHK2tZKo9X
         b+JQ==
X-Gm-Message-State: AOJu0YxE/iHYAXK4+D7krZm1tLobVcEq2Z0aNHg5rymkQLNgJftz1NtP
	aXglZi5JxWZN1mzrtrwsCzmJDm9+VQzcgb3+Gons8XJD1LG1rhPjGhCUDWJknY2kous=
X-Gm-Gg: ASbGncuP/0lUxM+yMHOyD/VWIvuxKB62cUsy6T0fK3NUkHpHa1HgKDy/GJ4fm0lXccY
	Ss/jDIEe8IayWP1bVDxuK3Y0sFX3BYJlFeby7Fw7SZQ/bvQV5hrHvBfNtO89qIzvCtDFXGJEpcm
	7jSkWzxy4oTUXgtwc0ZOu0COziH0JRIlTQEjwEIG4bVBggnvKLB2YRYP0euZA011LNfjzYFE3WA
	cKnf9/8ds33BmG2OdUnFTJ2XudKghiPbru3GpF6Mmk/GEmqlmYlSbVPuRfvSJp186G0ks0umOw+
	ATcq3Bna/dAmCYB5b+F7xu011W94HZPNJj+8HleOBZJQKtqVcBi77OTDVTeqjIZQUX+BugGqBpm
	8ETYhk4IhCCTRdIgG3lLRWd590wvZnrWvtAWAAORCUWGyQ2fPVe/5IZMXJup0dXVbzNaTeiZxy0
	DuRtmSsu7ReyE=
X-Google-Smtp-Source: AGHT+IFChg4OAIblgdsJ2PN0Q/L575p116kPOddgYmkvenEMwvxdnQq8kkKpar/+S45xt5cC74uizQ==
X-Received: by 2002:a05:6a00:12cb:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7e00e5a618dmr1314618b3a.24.1764746773333;
        Tue, 02 Dec 2025 23:26:13 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fcfe28csm19124497b3a.67.2025.12.02.23.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 23:26:12 -0800 (PST)
Date: Wed, 3 Dec 2025 12:56:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: error[E0609]: no field `cpu` on type `&bindings::cpufreq_policy`
Message-ID: <vacix7xdfokw3m25ekthitv2f2bhiuicqq63ww22qn34mylfof@tddok7combvo>
References: <202512031219.3OgecL5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512031219.3OgecL5W-lkp@intel.com>

On 03-12-25, 12:09, kernel test robot wrote:
> Hi Viresh,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
> commit: 6ebdd7c9317737123b260a24e2780018008f1295 rust: cpufreq: Extend abstractions for policy and driver ops
> date:   7 months ago
> config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031219.3OgecL5W-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031219.3OgecL5W-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512031219.3OgecL5W-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0609]: no field `cpu` on type `&bindings::cpufreq_policy`
>    --> rust/kernel/cpufreq.rs:462:23
>    |
>    462 |         self.as_ref().cpu
>    |                       ^^^ unknown field

Is this still the case ? I wasn't able to reproduce the LKP setup, getting some
failures. Can you provide: rust/bindings/bindings_generated.rs from the build
folder ?

-- 
viresh
