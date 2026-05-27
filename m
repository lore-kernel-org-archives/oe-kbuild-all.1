Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA38383C95
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 03:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779853364; cv=none; b=Plp2dEe6SpsNtJepjLAfpZxOQWatJdjbou9pbu2bjRgsBRLHP+NTNhxZK9oTP9SETlOB3dBPaO/rOweOYMaAcavOo2uos8UBbYwBj1BTX5I42ISplepapxXvHhMYc/N6BauEmR9CwKukRgTWB5nUO+S9xqE2MevPHhJqlgxiaU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779853364; c=relaxed/simple;
	bh=mNdFNfR2e4/65shxu0CC2MkDNtzL89tuju83evaBLMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBA+m50twu7HbIgxhyyeN4CBAGPOVobB5ls7F4+laggIQiq0nuPxcH23LTW2/IdgqVg3RH3XNS/4XBufDtukvRkfGQ0dfMJAUdm+jGn62Dt+ymAdFQXGEovbwmPpzJ+0iQJRGv8opSxpyoFY9n41W2dESCjgoxrluzFOqenBQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IGFpuSCx; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IGFpuSCx"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8419ab3a297so1126100b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 20:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779853363; x=1780458163; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFp/skMYpNsFk+AsET2tPkoK5hubkQ0FZUfrIoL0LfU=;
        b=IGFpuSCxFPSR42rEhUn79+UMpqRbL4JQe29h29e0LksPVN4LlzG+b505YkSETFlFjP
         QLr+HyvkI9Ak5ry9CWzlJysIM5ewpiTT8NASW4eUvSPtoQPRR7fMFXNt4eD7fn7KkPFy
         l2y8Pawi+oyJ71EmQjELCngC1BUimsFoiJhPdjD7LMvTFORVxg+yS6ymhfPsC4FHY/57
         9hXXDROXWy63mvHw65Qswa77Xh0ec2tCnIPhZ68U1Jq/GYTDn8lsstnMRnOVbBFnVysW
         BHJIPDtX7mk943GfMZAaAuE75OpGvFTJV5GYjJoDUZXCAIyYb272TJKPLr2O8lDQoj3l
         CK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779853363; x=1780458163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFp/skMYpNsFk+AsET2tPkoK5hubkQ0FZUfrIoL0LfU=;
        b=Hs9hkZuFNoTcK2e46cQ2sSKKZGFTv6X5Lmp9E3X3q2QxVvu6uvQBOhkt2jrCerzPJF
         R9FcCivqw+O3Njd6zDAoeaQFTa+FOpG1zN3uXh/8nSAtcmaasg7dQjS6ZHs7tPAPBghP
         rXW327ndNbMqwu91uTwet+E/nE2lmSk7zdn7UYsAEgB117AKgT1+HeOHTBKX8vxKvtlN
         jSL4+u/QvVhMNGvpdn77qmcybClwzvyt7QYh+aMF9jpBO/4jHnK8gBhFweDZejE/Qnt2
         gj3aHjpeeM4YhfcMEtqJM0vR3waAj/GclniCdc4Las4dyFHYKYqstpMe+mcDo1fLXKJL
         6/kw==
X-Forwarded-Encrypted: i=1; AFNElJ9p+RUonV+4Y3cyOpWJK5HjANl7zina1cEIR8J2hbSeyI72msTUSz+QMnGM1KyQpyC7IMp6XCWvAC78nyjv@lists.linux.dev
X-Gm-Message-State: AOJu0YxlHQMNl+mHUI8FKQO+J65gQWO7JZZZhw/xeAqnooyI+nDjgBxY
	k3RAnQe8ekX/unpB0zGrgYUkM6+AdqnBIEq395PNO2Cg9pOoclQFnenwKCMjYVhEPac=
X-Gm-Gg: Acq92OHOIx8U3aiMR+4qg08astqDwr+9JcjwoVuq1xczCB7Ry2PHAa4hpASO0+C2BLB
	eQveZYNYZx2Amt90rfW9WmhzJzBEBlPt4ZX9Oz+IBEVV5mM4BBkwoZdOfJD5rJqWhD1ern3DO7z
	HIESISsd+uV5RF5xlLp20aJwX6tfAwM52qcQUA7hJR0bSwh7WgOFT+6kgzXFQow4TU5201k7DZV
	88Rt3exe1RpdRk6G2weGhQT6AtVxfiFpQn1V9YWALvU64lEBcZX9IKhWkvL4iZzMLca282QhGeC
	EZBO5cOxDZn/oSkEXQxFfbrB2PnfvRqDOY6/OzEQev5npfxE9Ny9vKfAVX8ClOScvAZGkFcCkpC
	yoYXe8s46hQ15RPOodp43b2dI/lu/dAottzkMUimLD3ZdVAtsyA1K0ZPYUt+dUnSQymxBn98OdV
	ENoGZSTKV43+LEd6nZINmAf7S1qCbr3tW1vg==
X-Received: by 2002:a05:6a00:8c10:b0:827:32de:d197 with SMTP id d2e1a72fcca58-8415f37d792mr20378561b3a.40.1779853362397;
        Tue, 26 May 2026 20:42:42 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d72f8c7esm739804b3a.52.2026.05.26.20.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:42:41 -0700 (PDT)
Date: Wed, 27 May 2026 09:12:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: drivers/cpufreq/intel_pstate.c:2945:11: error: no member named
 'update_limits' in 'struct cpufreq_policy_data'
Message-ID: <iqboomrmgx2wwbhj4achjbiidnw4hfsamnnmurs3lp5texra2c@evxcicq32sji>
References: <202605261237.PUsriOv4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605261237.PUsriOv4-lkp@intel.com>

On 26-05-26, 12:56, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/cpufreq-Avoid-redundant-target-calls-for-unchanged-limits/20260521-194713
> head:   6721940d0119159636e6b2da0c43eb5cff826857
> commit: 74b0d552acf45e33ce12c19ee815e52029b0b0a8 cpufreq: Avoid redundant target() calls for unchanged limits
> date:   5 days ago
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260526/202605261237.PUsriOv4-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261237.PUsriOv4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605261237.PUsriOv4-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/cpufreq/intel_pstate.c:2945:11: error: no member named 'update_limits' in 'struct cpufreq_policy_data'
>     2945 |                 policy->update_limits = true;

A different change was already merged instead of this one.

-- 
viresh
