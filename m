Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7901E3C1967
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 05:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780551816; cv=none; b=iPKLmF8yLoixS4VQMVJNCRKDMc2VeTi6AlUZnOEobxPNq93mjhNFgE5KMte34Iqk77n0k7Dicxs7QkFoFh404m+nfA8VEkZ9rU577W8Poc1s+X6t1vQZsl5XRS2rdMX2B8VTdyoTn+jg466yNL8DgiQrb6a6Onpq1FgQZz88uzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780551816; c=relaxed/simple;
	bh=AEhMerSE061sddegxts/S9Yhziuy8j0ynoTHFqr9dPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxpZOQfywnakzbNay3C/Mmj3XNs72DCRppGoFTtA7GWloPaGTwtraCC7n7tM5ccNf6RfwlGQi59m5qPKT0QvTScmPs1/SS5rHNRxJYcBYdw2G3VrlHku9uvlMj5S77daRDwngZ0oaVKlNZ+SPqWlvNcDpOpoen5juutLvGqLdxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAp4rMtg; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAp4rMtg"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4863a7dac63so160840b6e.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Jun 2026 22:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780551812; x=1781156612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd5qbt0svs5X9PyH4+Z4KjGVOSti+IcuLa2FFG2ZmDM=;
        b=tAp4rMtgW4akyxyJ5xMc1AS5I9FbmUPDbcENQpX4V81mkitsW1cHKttFoS2whnTvRC
         9OunO5fpsTJHHgQpgQ8itT18BQgLdreFApuBiYgnsaF8mddHFFTwTFxhORuaypRDweGU
         b6TWcBGmNLWkwXfZscN96bsTQ0BcyHJm9eLRavMQfY9cDjJQzuqn+70IhdDJjputWmIo
         IRezM0aIG4fmm+/wYKDTCC6ml5FfOXSnt0E6gNC8eWvEyznXsPPsZ3c+8qVnbPpNBesg
         7BSBEnrktEfwjw41s8CIuEbPaDFZzA45DUkvxU2+ADXxjavofIw/+m9WCylaBwqn0kui
         4nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780551812; x=1781156612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dd5qbt0svs5X9PyH4+Z4KjGVOSti+IcuLa2FFG2ZmDM=;
        b=mlV4X0ct1m/xxb9UfyPE3VptNYCeMfVH3xI6IR7iIVJaluDSYZXy3+/60+5KPRO8Zo
         qzVo24Ricmas9YVT3ZBGc46JNS9cl7uW2J9g2G42nAfeQciOa3YaDgB0o3GC9zJP3GQP
         fdI0IlsxQsmE9tzDUBAxOzvn6I90aOxZ2CL29yJJiMTjRohVSK2Tf6x9FNTtjr1jE2X1
         XQxfJs4qKRjPlKiy+SdY9sRIeXnf2Dcc8egyjw2Dv2G5yA+Q2Y4qryU1WYazDlbSdBO7
         eEjh2Sd1EojcjmMWvH/Iq5b6yYWIP5+I5DG1uQIwSQyJIh5tVoOfR4TqgUW/VgvJ+tQW
         fgMw==
X-Forwarded-Encrypted: i=1; AFNElJ+mKwpB8fjpSDtbI1dctXDX6wX6R0cBtgWSURulgLkdrOQ0RuCkS3J35bHKCw3tq2emRzm1a9uvFvw93MxU@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmi5NqAIvgT3/lbt6U5mZ14qre7/HMoUJwScAkBt+CCkzfNqU8
	ecawXCHKH48NqmjDU3ZLsoxPwFNN2ZBV+OfzydUxTe6QWIDXZBp1eQM6DX9nSUmU
X-Gm-Gg: Acq92OFmKbLaaVEcc1BpXdqUZPUzdph7sMMiSDQfXQIlQx1lh9muZ5os3Xo9wdxqHig
	JZs4Ajdk8Hy18tMZFTkgP+MOIdpxpt4BZ3p+KHRPu6Nh4q+AB81GxntDZApqgSyw9xMJd/Ly/PI
	2YAGUQ2S05CKFCSX7bAk24U16qW9g4Ux1c9kuiKwbylg6Kwe+l/DQC+66nx8IaNt6DsEnHv2RQx
	wuj6/UE+0Dxpt7hCR2losIAbmYoOj97l+O/Ngu/yxl6A5+/pQTgXwOiLddeG0Kw1+uSxGuKysZo
	Gn5/SbUI//2irqR8L9V2ETevGSjS33ZXwcQtw4+vd58+j2oBOwrPwirsslhfj0d9Vq8L68Lgjjf
	HSby8SzARhGUdbFSyCk3p0V5sorSoG+7LFHfyDfbO8ghxOAjo8H5agtHAu9vb9LIroh3/uWUbcs
	Og/5GAlHU+EvCBesAmVI+JY6GaGu/4dk20SGud5UsWAw8NvKjs/01xuRHWXqFX3njVdrnpUg8MA
	fUHx25kdNcglmU9sZWixLgx6F8+YrwjL7GC+IAxzH2ofObBnqtB+kZXCAKNlJB/9YLoOg==
X-Received: by 2002:a05:6808:d48:b0:486:4892:d562 with SMTP id 5614622812f47-4865a9a50b5mr3872126b6e.1.1780551812279;
        Wed, 03 Jun 2026 22:43:32 -0700 (PDT)
Received: from localhost.localdomain (99-61-165-33.lightspeed.sntcca.sbcglobal.net. [99.61.165.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e75c5495sm3197548a34.10.2026.06.03.22.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:43:31 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: nathan@kernel.org
Cc: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	bavishimithil@gmail.com,
	kees@kernel.org,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@armlinux.org.uk,
	lkp@intel.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	rogerq@kernel.org,
	samitolvanen@google.com,
	tony@atomide.com
Subject: Re: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Date: Wed,  3 Jun 2026 22:43:29 -0700
Message-ID: <20260604054329.19450-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525165527.GA18457@ax162>
References: <20260525165527.GA18457@ax162>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> are both pointing out that cfi_types.h needs to be included in
> arch/arm/mach-omap2/sleep44xx.S for SYM_TYPED_FUNC_START to always be
> expanded properly. I tested adding
>
>   #include <linux/cfi_types.h>
>
> as the first include line and both issues were resolved.

My apologies, I was switching systems and seem to have lost this somewhere
in the process. Sent a v3 with the include, thanks a lot!

Best,
Mithil Bavishi
