Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7C02F37
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 03:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713756731; cv=none; b=pvjsfZ1UHldida+GaMGPMLS9wSJldkukOqULp0o+R1sHVfY9jb1suXJfu/7tSB7SAhscYpmI3c7KDj6rnGl9IJUechn91XNVsoT7CT3G1RoKnbuGkaYnCDQo6QVsfIJRYxss+E7aZucfh8Lid2fSET5infzcyDqmY+bU6+b96VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713756731; c=relaxed/simple;
	bh=RusiIAulFcEtDtxzFZ+lmKKT6v1DO/M06FRDfurWsSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxVwtMiGfkWYk/xmxhGTueLHaYkG2JLs42qqD6OUf/JqseqmhCVDVyw7OHLjBMZSFPNUsMn5tf04HjhT93y56XrbbFAbM2ES6VFmNUMRH9jNmm/aQlUfWpbBSEayF0fofypglEYce53F3ZsenYGZqwUzgdzbrf47ieKfjKXKB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TInAlbP/; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TInAlbP/"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ed627829e6so4434326b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713756729; x=1714361529; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ayQSqFKLgMTG3/4LHwIFhlRf2H80k4xhFX/GtydfIr8=;
        b=TInAlbP/e45gqQw7tBfi67y3rvHJbPmm/0MKJNJO3kPoXjuWA2Dt/oA6Xh3HdcKX2H
         UjXlCHWEmQH5zxSsUEJNL8gjVcnSDZ/b756brC67h3eUba/BZAudy901z7UHTvi4gfgJ
         AVMFGzQd/HxwsxnBkpFIRq2NteQl5hekYbUsmGDJdKN3mU/RFuh6Dqx8OWS1Siy3hQ6j
         mdkseA+blhELPlMyZB+qMoYvp2Hkcqebc/tZBqo8fLGee0QmI4RIgyqlmoio0cUtkDAu
         WWnPsGZ8gyKrPahVE6NKhhVxt6iwQH40HMlm5ScBMprvbkBvjUJyedtgrDYKZ4HJfbLs
         a9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713756729; x=1714361529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayQSqFKLgMTG3/4LHwIFhlRf2H80k4xhFX/GtydfIr8=;
        b=d2WnWy60aSpMGo/BlpnvzOHxOGI0bYQKD15krwmhCUZ9fqSVwUwHtLVZ+mNRhx/UDu
         rf4oKFSt9hfwA5OuXAI5Q9xId8b0GI8YxUrhC+o0f4NDh3tuPes1uOXWRGUGFwuBBOZk
         Wne8uCY1C2VKHfJx6XfegPd6Z77HIkV4Y2bUSAlY5fGAIuKXRxYbUASFAwyNJQK9g9/B
         2gDXMMW2SjQ0IRhKKuuzDACkvw4w5txF9qcyWLkawy+AXUdh5cAzIsbTHO77i3bM0uTe
         3xfL+alei8Vo4FHIt0wo0yv3NhP423a+J9hNyrV4NG+IJPCrt52Q/61EeW0skg2SZvC6
         pE7g==
X-Forwarded-Encrypted: i=1; AJvYcCWcwU4cCIWXLwTIjjqtLVCb8f+aXUFgA6nz2hXp4rDOMb4hm98UsBz1Z5YEfaq9xOl1HvTTC30lHPKlqzvOLeYYGTzMW7nSQ7FmiVgZzA==
X-Gm-Message-State: AOJu0YwkN+OMkSkfbKjJl6bBt1ieYuRsxKpNDgLxiQrlrlTPh0tEmv3Z
	IXeiI6dTymFvxNJXDotx9W+armwKlxLv1MGQpseiDhF1eANLJmUqHWU0mlzBfLg=
X-Google-Smtp-Source: AGHT+IEsPl/aJM3asyJHoY/vAmluEaqy5/to36FYHyzgaZF7710nQQ8lhCmFTSytnV3Mxigh5Nq7Bg==
X-Received: by 2002:a05:6a00:21cb:b0:6f0:28a4:a6ac with SMTP id t11-20020a056a0021cb00b006f028a4a6acmr11796453pfj.8.1713756728764;
        Sun, 21 Apr 2024 20:32:08 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id m191-20020a633fc8000000b005f751c18d0esm6624198pga.86.2024.04.21.20.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 20:32:08 -0700 (PDT)
Date: Mon, 22 Apr 2024 09:02:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: kernel test robot <lkp@intel.com>,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pm@vger.kernel.org
Subject: Re: [vireshk-pm:cpufreq/arm/linux-next 6/10]
 drivers/cpufreq/sun50i-cpufreq-nvmem.c:128:44: warning: '%d' directive
 output may be truncated writing between 1 and 10 bytes into a region of size
 2
Message-ID: <20240422033206.3bsqlx3pt5xuc4uy@vireshk-i7>
References: <202404191715.LDwMm2gP-lkp@intel.com>
 <20240419111345.028ad7ec@donnerap.manchester.arm.com>
 <20240419105628.faaqz2p4qdlfxyre@vireshk-i7>
 <20240419125630.7951b45c@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419125630.7951b45c@donnerap.manchester.arm.com>

On 19-04-24, 12:56, Andre Przywara wrote:
> Ah, yes, thanks, that looks good to me, and indeed fixes the warning.
> 
> How are we going to handle this? Do you gonna squash this into the
> respective patch?

This was an existing issue I think and wasn't introduced with your
patches. And so I have applied a separate patch now.

-- 
viresh
