Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5404927452
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 19:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728156621; cv=none; b=j0a/MTbBO3TwBDavzTTAvJXXm+7M60Go8PAGi9tDnJhZQGuVy+glnn4v3hzZDfO/VlaSyZ+R9Js6HFuao9UbWY/FQ4WQhPpU05XpkWV5zKyckOGJx/xedMMPepPbvNvPkoeQtyzshrfzoa5Br6zBzTRB7AhL/iZ7tt1kmmWVJ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728156621; c=relaxed/simple;
	bh=zXwfvmJApLD9tnOzOuIJ7ZIUhfNsrLaaqCjeWXV7Elk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b93glPeZIZGN2wC/Qbk5FCG4yAabBbA9Hyjam4oLOLUQrCtR3RfZdjwDM9XVapV5dsQMsl8SM06fV/3kuydIbG3N2MkFd2BB0up6F5w61X2DvlZWsY+VwrG0CEdPU0FaU1s41ey9RyMvUxUs9elC+i/AYOJj2akBoXpPQwT1gu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=THJsO73R; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="THJsO73R"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20bb92346caso20266195ad.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 05 Oct 2024 12:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728156618; x=1728761418; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2mCkEtcNei0RywUlinCjtM9b0gDURZfM0UOxs82SjYE=;
        b=THJsO73RlfFlQDCZ+XrG0Y9IDE/Jley8hNKJv/ToSgEprDcz05AAnbu8aiY+GoZPoP
         +nH2FvKwfJSrWu2tRQ82Y4wUSa03WtaLvYYFGHzq3Yp6Bz0El3C6nTOM02603X6Gk1IK
         VAML79NDvokqXSC+SFIJuL3ZcDyfgnYAH1fhGW6KzvHWtl3G3EoQg05ZLwivSBKiHIle
         OxiWCkcjnp12mcVUhTlM4mqFgeNDKsKEb/KeRWg52JJLw4MA8wNLusmFtiW2jUwhVfyA
         68BSGkRcA2LeWRg1KaQVldbULgznS7SD6uRXEWDap/gt7qYZges9rqelW0Nr5soXbzVV
         HnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728156618; x=1728761418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mCkEtcNei0RywUlinCjtM9b0gDURZfM0UOxs82SjYE=;
        b=iNSYiUBe5CRekitWjDik7Aa+KjVS+fsgaL5BnwmoBPJDqO6TXlTnfS6GhI53PeQPwG
         Rcv0D7U89FbUByig5vDr/0uw5nGTZg9z1C+mZhGogJxX2NL8ZNsyK8Ay60mahuij9nDI
         6OPYC6Lwb2OZtS3tU0DxI5G7GYxEQYGvd0Zb8UIpLmvTCJHYySjkxLsYIdP+kX0fuSK5
         jQOkRlIbJmUON6jjTyhDTsjwOYF6hAPBhrV8p7PuEfOuLg2Ca3X9z99szWpQ/xURWLqD
         pc1dfUqo0G9XHkEfLjhffLMPKvzSmEyDtLBw7wR9PmaAOVS19lgc411+Nkppp+lx+RMA
         mB9w==
X-Forwarded-Encrypted: i=1; AJvYcCVCXeJ5t4ticeUva9nMc+hn0GjWeIjHFxiTyhmc3b1e3+fZvOhvSgoEFz7tOvmrlksrc59NtwuiBz6G/4pn@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfk/NdtT/aB9EmGQEa/yp3m4xuLBX7uShxL7YYgbQLhA0SNTen
	2uXDQQG3u676bGSa9wRrubYWRqeEpTroU7KdWqDbiT7LuKPF7H9PwWT73WYl0Bk=
X-Google-Smtp-Source: AGHT+IEnJr3VbfJgt6Bq6ck7F7NugIDnpMGYJKRaSAWYSIaYNPPuWja5Wzr70A66h9+W+yD0RZ0b9A==
X-Received: by 2002:a17:902:f547:b0:207:794c:ef24 with SMTP id d9443c01a7336-20bff37b1b3mr110878845ad.4.1728156618572;
        Sat, 05 Oct 2024 12:30:18 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1398ac48sm16210815ad.275.2024.10.05.12.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 12:30:18 -0700 (PDT)
Date: Sat, 5 Oct 2024 12:30:16 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
Message-ID: <ZwGTyOBUAppE5WAM@x1>
References: <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
 <9f76efc9-c9c6-4097-a7a0-80e1b941866d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f76efc9-c9c6-4097-a7a0-80e1b941866d@stanley.mountain>

On Wed, Oct 02, 2024 at 06:54:48PM +0300, Dan Carpenter wrote:
> Hi Drew,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/dt-bindings-pinctrl-Add-thead-th1520-pinctrl-bindings/20241001-035421
> base:   9852d85ec9d492ebef56dc5f229416c925758edc
> patch link:    https://lore.kernel.org/r/20240930-th1520-pinctrl-v3-2-32cea2bdbecb%40tenstorrent.com
> patch subject: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
> config: s390-randconfig-r072-20241002 (https://download.01.org/0day-ci/archive/20241002/202410022336.xyWlV0Tf-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/

I put these tags in the patch I'm about to send but I get this
checkpatch warning:

-----------------------------------------------------------
WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
#9:
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

total: 0 errors, 1 warnings, 7 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

Commit 8d7cdbc31c9f ("pinctrl: th1520: Fix return value for unknown pin error") has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.
-----------------------------------------------------------

If I remove the first Reported-by, then checkpatch no longer complains.

Am I missing something?

Thanks,
Drew
