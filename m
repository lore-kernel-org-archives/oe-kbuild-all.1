Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827CC47F45
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977822; cv=none; b=bbyKY7iBB+71daBUY4pUZH9KFDOLYt2BZ92Ga0HWJRmPs4wkwoBfpFB2YO8Qrx7Oda2LHPbl8Hk64eUKZF9El3TKde7SVkaI+Ihjai2RII0v/EUlH5yUGCOA1eH0I3WDeQBz9EQxD/BFvup5gi2jNSGU/3sEz+BgkxdmDnY/XnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977822; c=relaxed/simple;
	bh=TTtQyHcx8HkIEEBoI/wvFIf+0GYqPB/yGd00nQkF9Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlsV2ranDcKwYX0ALR74IPHIHsOy33fOZvCT1TWu1b6tRN2X+2vCnUyB+BgaX0El0unI1HIf4jCTz92Nahfkxk+8AqUZktvSQ8Ke9LxbsC+u92vXX6MNufbKDzpze5Y95d8zjAGGoFc3sXXBzyVJNHMy04XGA3CfrZeMGBrUPAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X/+nB2zi; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X/+nB2zi"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2b33d011e5dso959876a91.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 05 May 2024 23:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714977821; x=1715582621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Awh0YX9sFOZlmXGVWv7TrQyTmY6KwzUZh2FsqtFN28s=;
        b=X/+nB2zi0CqUC5Mzlz282PC4mHW108sT2OtTmKz+9Fd9on2jbkmo60IH0vHSOfmAOF
         KhrjD21cctvjRQ9R22k5ydWBHhSWrVok9SO2rt0UnFH7+6elbLk3Kyym+hTFqEefSYpJ
         +OSOy/lOXR/P4HwEnfac0PZJo0fsUszBsikcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714977821; x=1715582621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awh0YX9sFOZlmXGVWv7TrQyTmY6KwzUZh2FsqtFN28s=;
        b=VhElZBhtZIilAwncZyJE5bbC5y9qbnpwmHB7Nglux48265mp5OLLp8UGUGQJAXhuUV
         0w+ymPGPjEBv8+5eW0oFtbMVYzK5xn+9L84qQAcH6unv21yzx1DyeuGiq1ii4gPfBrk0
         LXh92upS4Y+HzqEXTo3hTzyqG0jXtMdqTS4GMbYGgh7ATsx8qaOMMknrUggIWOvDDH12
         fmT0x4Vf7t1bT62IGBXy/fHzAkPGY4MdM8I1GyNFa+3DfSptMTTL3W5hG/+ribxmykEM
         edES6Vq0zOzn8jCmZ5qhJwH3863ktFf4cIuyrloFbd7Rrr8da4jz8XlPrUS7GKpbpStO
         OYIw==
X-Forwarded-Encrypted: i=1; AJvYcCWZkGQTLeSAmTsKuyf44J9MavUu0Fvm/IlUxAS/t2ga0x0MWUwcge6bSiO9F0nZ4wL7M3Nk0QSP/vexp84NO9ZJBRybMCd3avfQDriGEA==
X-Gm-Message-State: AOJu0YwKZyEn2PMnKwZpfrxRGoUtXgTjc5mQjnTDqBOhn7WhKgfFijjW
	mKmApd2uXvx32sSBw2yfD8+mPXpf5Rhqcox/b1R76V43UFCzzxgpZkGr2r4PQQ==
X-Google-Smtp-Source: AGHT+IH9/hiNrPAZgMq5yCe0qsmK1lm2LH0SwY8LB+Tn+zX2oS8PqcHxJee+fl5rH8OfTgRdDd1VYA==
X-Received: by 2002:a17:90b:124b:b0:2b0:763b:370e with SMTP id gx11-20020a17090b124b00b002b0763b370emr18238105pjb.18.1714977820818;
        Sun, 05 May 2024 23:43:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4e24:10c3:4b65:e126])
        by smtp.gmail.com with ESMTPSA id rr3-20020a17090b2b4300b002b113ad5f10sm9316590pjb.12.2024.05.05.23.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 23:43:40 -0700 (PDT)
Date: Mon, 6 May 2024 15:43:35 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Minchan Kim <minchan@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one
 backend
Message-ID: <20240506064335.GE8623@google.com>
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com>
 <20240504071416.GH14947@google.com>
 <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>
 <20240505043957.GA8623@google.com>
 <20240505051305.GB8623@google.com>
 <20240505064832.GC8623@google.com>
 <20240506032207.GD8623@google.com>
 <CAK7LNARUBuR3gDtX6GfB7Zv6dydt1+qzBB_XT58wOg3WeCTVvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARUBuR3gDtX6GfB7Zv6dydt1+qzBB_XT58wOg3WeCTVvA@mail.gmail.com>

On (24/05/06 14:20), Masahiro Yamada wrote:
> config ZRAM_BACKEND_FORCE_LZO
>         def_bool !ZRAM_BACKEND_LZ4 && !ZRAM_BACKEND_LZ4HC && \
>                  !ZRAM_BACKEND_ZSTD && !ZRAM_BACKEND_DEFLATE
> 
> config ZRAM_BACKEND_LZO
>         bool "lzo and lzo-rle compression support" if !ZRAM_BACKEND_FORCE_LZO
>         depends on ZRAM
>         default ZRAM_BACKEND_FORCE_LZO
>         select LZO_COMPRESS
>         select LZO_DECOMPRESS

I'll take this one. Thank you.

> BTW, "default n" you are adding are redundant.

OK.
