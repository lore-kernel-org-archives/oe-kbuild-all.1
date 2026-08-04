Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BEA1A5B8C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 04:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817225; cv=none; b=nPaUUa7QkCMXTHpEcGJGI/hCeZx4eUF1EbYdjYqeZ/ahahsukIjS84D+YMHzaynL+UfGzNo7LC2GevzUuWhIdpKRavc9AuRQzxotF9rS4fXPOQ/Qa51A0galUg02sMW0OaYdsFjqb0T2RXfofvEz5iDB4w+3y0id+5yD9n8jbXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817225; c=relaxed/simple;
	bh=Xv4daIJrWNnnddmSj3tDlCr+BvO43NdJEsaAoSebs2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHAWVc1qnMoEaULPnJ03yJUOrqkakeVCm3JLaqpxPxjWmtyidyDA8ltVvu8aK5uqV+DeFx/TWdW5zQXpN0oS+Z+ZXIkyI63pjoVGX6zoziSyJ04//toqBAQ08+PDHxdDkbG7VRX5L+JTMopq6Ig7i2YaHzDuaaJ2j28JRQa71xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fpz7++QJ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fpz7++QJ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so465719a91.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 03 Aug 2026 21:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785817224; x=1786422024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkAjNXvY3U9OS/JzuROlHK9PoDhiFO0/7y1BE5nqcCM=;
        b=Fpz7++QJcuXUIRhPhHIMgsx6PthlGEvCaMrKm7VCZmTJWSDXoHuPO30YTNnP/LLUi3
         67pZbDIxaAliGE0yfs1psSLkFafIKzzbar6JqARw1XrgyaCp5sDeMDHMx9m7q8TfaE2j
         mCjkbT473Cz6O75idBlRdASFM/8175Wntl4VMmU+s2VnHtQbmCyP55SZLQME6j3SV8F4
         kHnsRRoMFA9sM1TEuMuo24simnJT+Z2dUbXMq0ohtomt33i0dy9J1cepmWO5/lpPZCwu
         xxynkrAYe1gbzw5shk42CRPkwIeo0mKiCw7xT9W1Rb+xANJrmlr4r30nXVMqCQMH4QBW
         syTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817224; x=1786422024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkAjNXvY3U9OS/JzuROlHK9PoDhiFO0/7y1BE5nqcCM=;
        b=iJFkJh+5M4XHu8HwEaPGrgHVbKUe6YmsN9npxaiRX9TCBZ0vCQp0RYFGgjZ523jIkX
         yQ/rx0ZYq5rmpvHemw55cL8d2TQj7wcyNmdEzw5irkhCHjqVcbKD/Gp2HIR1kh4NcQqc
         TE177DDPCfOxa78d5/m2N2bhs8mm8bMPc0+BDZQLu+hN6UI1yA8U7MNk32qW3Cc/ZvHT
         dJ0UQS64bIPTskgoa6W2kiEeHr/wVtuWLMB1A2tpEuCN02evddd/TgHC+yzTTs74Su+V
         5jzZJVtGKprwHZmL/sSk0H/x1eLx8wjmjrEiUVhuAKgCylfDmpZG/WbToGOKxaKGxaNx
         HOxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPhkiwQDH+V1qhGjp3k/bMQohPKHdT2PY1rGYHkjsvRMhkvFwPkWIC1+FaiykbKxmmvZfE0V17RIXB4Lyn@lists.linux.dev
X-Gm-Message-State: AOJu0YzWrA0ih0LotnuRVh9ISYKueCrfKFiQukt0yBT3uofEJBtxJMcI
	IGbF8uDHqKJKB22t3nRhQTarj7DJ4Ftn+GuUa/EPA9UtkUxpanuEpNpQ3Gs9LtZ4YY4=
X-Gm-Gg: AR+sD13X1V3ImiMY+Upe3PgeQ1gKDJ46iumFsmAnW8+7P4wFyYDzuUfFh3rnW0LDf96
	/Q/ONFuMTEKnLtzi2JDEvfoQ3pT4Uhg1Qkb50JJS3ZSNXtY5SOfikSFbiW3DPZ4N7c3KaVSsqz0
	pRvWRMdLDjKAAi/NBfOmBA8lb5XkJp/ckHbyGOC3qodWMYRJaWccRunP53ryIIsjrthujxSWNxT
	yjPGdggqp2cbaxRX9GpAzO7lbXNdwaSbdi5zIM9+g11e5DYXuk8sVwdKHYbpKIm9D9xTaRsJXOg
	7kWhUXspW+5BSbmyNJKNbSN+sWNqXpCKrW6ihzN4TvtCAISo13DpimkT5FDOC5uOda5RsPRTYeC
	NxYUwsnITWrCR5xbMtFd4SZ3v1dQs4QqHJc8CcA/+rrAMwM8NR41XgkwQm0LneOJUDfb0hgLnE1
	F3ZfJ83DryVtRZ7auBIWSO7509LfgI5J9NeRbEalfrv/CEUGDW9slquFMbJgC4
X-Received: by 2002:a17:90b:3a0e:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-38feda4cdebmr2330459a91.20.1785817223505;
        Mon, 03 Aug 2026 21:20:23 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm57821732c88.9.2026.08.03.21.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:20:22 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:50:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Priya Bala Govindasamy <pgovind2@uci.edu>, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 8890/10862] Diff in
 rust/kernel/cpufreq.rs:1361:
Message-ID: <adhpyq3m2pe7g7xk2qxm2x26fjzyypd5lyix3btd6xrsgsrcz6@g7qbpzluydw2>
References: <202607311127.vrars8ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607311127.vrars8ja-lkp@intel.com>

On 31-07-26, 11:41, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   95d6a9ccef99117115e41e9adb271243bd5e985b
> commit: 8aa931819543aaed39215a8ee39af4b1ed44cfa8 [8890/10862] rust: cpufreq: Fix temporary write in Registration::bios_limit_callback
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260731/202607311127.vrars8ja-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311127.vrars8ja-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607311127.vrars8ja-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>    INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>    /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
>    make: Entering directory '/kbuild/src'
>    make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
> >> Diff in rust/kernel/cpufreq.rs:1361:
>                 let mut policy = PolicyCpu::from_cpu(cpu_id)?;
>                 let val = T::bios_limit(&mut policy)?;
>                 // SAFETY: `limit` is guaranteed by the C code to be valid.
>    -            unsafe { *limit = val; }
>    +            unsafe {
>    +                *limit = val;
>    +            }
>                 Ok(0)
>             })
>         }
> >> Diff in rust/kernel/cpufreq.rs:1361:
>                 let mut policy = PolicyCpu::from_cpu(cpu_id)?;
>                 let val = T::bios_limit(&mut policy)?;
>                 // SAFETY: `limit` is guaranteed by the C code to be valid.
>    -            unsafe { *limit = val; }
>    +            unsafe {
>    +                *limit = val;
>    +            }
>                 Ok(0)
>             })
>         }

Fixed and pushed again.

-- 
viresh
