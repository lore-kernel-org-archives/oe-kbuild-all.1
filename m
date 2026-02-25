Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E53115BC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772007334; cv=none; b=DplhqRZZTlhPndnlhgTPG/1Q7CjbYcNNrE4pz1TvLDtYcCioJYgoXTa1X4J/SP9ut6tEy4cFelehGeoqCeEdl3yXqzVj9TonK+TJ5GxrHvGvDxVhhz+BsoSiR0G8jmnUI7aEsgxU6A7H4T23XmMnjfJ0H8A8ZmafpTY4rTxlklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772007334; c=relaxed/simple;
	bh=b0IWS/Bv9HIrN/QIceN9IKsqWKFjysW6PbjVYvsdR2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwVBBGRGLLaRISqeWjljrClUgNNIyJ0wvdLgaTUgObGbH6vZaXteN05v2ElE4bIDvw51pw2gOAiwb6TrGVMLLyzW15nG6qeVa7pllxVTcJLwOPm95au6pk4O65NIvJe2Wj2xB/g3sbNAPtelcPHHLZsYZ5eeOi+avd0pOIiv4IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3ff96QQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3ff96QQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48370174e18so34773145e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 00:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772007331; x=1772612131; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X225D5Ei9UC4pV2nV6End/Mxx7XQa7ZRi+IwmSgqyvo=;
        b=X3ff96QQuV+ePCWXpn2APtNq0Mnt5sBlOKhttwZthXsI4RV/YRwGtqImxGxlW+Aofc
         3f4vpV2JV6YvXSlziTsYmGM1POUe5UgvqUPM331HQ8pHy8hbs5gZRQRX1be+jIdbUW/P
         faXUvUsQhuRRUkh35aR1AfMDQM0u00W5UhyMIJBcF/9B5lhrXkoQiJ/2U4FOogLfyQwy
         pOEZIZuenYe0qrZn0SrbWmJ6/emLa4N3lToBOSq3w3Uxbk3F7yZrBJa2+C3RNnqE1FEK
         AnWcORKYz1RdOG199fh/bVRflRS2n37GitkcANakO+u/SGLM0bK/XKnQa/PLmwNFfAaO
         jGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772007331; x=1772612131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X225D5Ei9UC4pV2nV6End/Mxx7XQa7ZRi+IwmSgqyvo=;
        b=pE3069RALT/ELwzkge4iCjDToqAtcV7DUb5YmBZExF0VB11+3EgaM14WtLJw7iEw+6
         yQ/8PUY6tBHfFlbDkC4/F7pQ4SBe+KofjEvwsr0UeQQR3pK6KVoqUNlBk/+RAFBXaZ45
         2gwIloXkN56ooSb9/eb1LZcSky+arcdBPqePCy2OANFAiEhe2UzymCH2PcORN1Gp96D1
         V0SpwsYBsl9QBnHeVUFPWGa4nIRCnQm8Pmx9vN5aNBqd5tNTPzj22belOIMlG3s+ajfR
         KHi54ay6EMYBAcewk7aJPlJamQIfzGpMiae/y0ZgkUlEdH50lP03YEyY1aFSTkgOYfs9
         hSFA==
X-Forwarded-Encrypted: i=1; AJvYcCVvVS+DCgvDKEnUn4hWaOJNmXj/M6Kf+JhPx4xteP6Wn4C5nCuzpw09LvNx0+zcMreOq5uRZHVa9f+RykOB@lists.linux.dev
X-Gm-Message-State: AOJu0YyBHy1yAgKahZlMgfvTA51u6JnwpaFq+tLkDQv1KBbczrqGPT9h
	fdW6RSnRYJrc22sSlpBY5P7ke4jC8GAdynP1T57YbwcugpFMSqm3ZMNpeE+fMLGIrbE=
X-Gm-Gg: ATEYQzxlLyKHH5otQsy6TAztVJsJROVvo86erBzSIO7FTI/8K3tKwHvBLMnAplEwumn
	Z7YkNLl6AStMk4k15cx6NxVFP8jzhzWEFrzm/fW84/K/Ptx6rcKTtuPSeTJn/nX4n1+kU4Q0wKk
	SKhb2KRA5vSPBuQ219ZIbaLssXUNsbL9gRy/oGPBeDpXm2ihZ4ECkAj2Swr65tbcyZal17U60pN
	qH3BjD7zy/Gm5Z5CSgCc9KEEuKyiC4c+Bq2If0geqsBoQ7AZu/2OHQAKQ0wzCVC64ofxGShgc14
	UD+DD0WVHXVj704zxRtZRb97Tkfkq9loj9hEYUPVFCatQaTCWbrES46KspNV9RoUQB/8ytfStyP
	P+7sqvMGAXnHRO1vjqno8f+C01na/yIOLbYbWWdCQCpEeOme/JhrNByeyDWnOhWpPbvNopheVQX
	3oybphkIA5cbTauDMOd4WmGJ/kgM4Ls1y6BBpFcxk=
X-Received: by 2002:a05:600c:4e14:b0:483:702f:4641 with SMTP id 5b1f17b1804b1-483bef19d37mr25321705e9.3.1772007331299;
        Wed, 25 Feb 2026 00:15:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm60197395e9.9.2026.02.25.00.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 00:15:30 -0800 (PST)
Date: Wed, 25 Feb 2026 11:15:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>, Ian Rogers <irogers@google.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, sparse@chrisli.org, linux-sparse@vger.kernel.org,
	Marco Elver <elver@google.com>
Subject: Re: [PATCH] compiler: Use __typeof_unqual__() for
 __unqual_scalar_typeof()
Message-ID: <aZ6vn1NrIkv4UXFW@stanley.mountain>
References: <202601150001.sKSN644a-lkp@intel.com>
 <87v7h23cb0.ffs@tglx>
 <20260115211120.GD831050@noisy.programming.kicks-ass.net>
 <87ms2e32gw.ffs@tglx>
 <87jyxh3ike.ffs@tglx>
 <87ecnp2zh3.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecnp2zh3.ffs@tglx>

On Fri, Jan 16, 2026 at 07:18:16PM +0100, Thomas Gleixner wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -1178,6 +1178,14 @@ ifdef CONFIG_CC_IS_CLANG
>  KBUILD_USERLDFLAGS += --ld-path=$(LD)
>  endif
>  
> +# Validate the checker is available and functional
> +ifneq ($(KBUILD_CHECKSRC), 0)
> +  ifneq ($(shell $(srctree)/scripts/checker-valid.sh $(CHECK)), 1)
> +    $(warning C=$(KBUILD_CHECKSRC) specified, but $(CHECK) is not available or not up to date)
> +    KBUILD_CHECKSRC = 0
> +  endif
> +endif
> +

This means we can't run "CHECK="valgrind smatch -p=kernel" because
valgrind always prints output to stderr.  So hopefully we can
eventually remove this check.

regards,
dan carpenter

