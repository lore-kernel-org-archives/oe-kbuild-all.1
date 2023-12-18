Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFAF6FA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 06:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vy2TUrF5"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1f5bd86ceb3so2065551fac.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 22:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702879848; x=1703484648; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3r99F4vTwCpnbqDKoMm/OyT56eRkkUx331L3tjXnj14=;
        b=vy2TUrF5pRiec+F4q0N7uSixib7WvCTiU8uc0F+06AYj0FmEYhfYNW6dvQlsusnHiG
         l+ruNeKYXbH25TpZCtZ830crmrlUfy0aAfY5YEsryP+kSaQLARytw28gFzwsj/SyDnzm
         uNzEubMCjYL2WJWHwlHnjtcBTHvfu5WRE68uFCDO8LAwsoE0U5eHLD+HB22Sn13VxHZa
         2SXu0oVERtlZp5cyImVA1oIGTrYdBJ1JCHCXvgBBq5cxtvkfShgbO6XlDoKfGfr4mkLJ
         21W61zWxCP8mbUUYoSw0R50paMrpK/6QmPUvz7LrguWkwW0p0XYtTbltY2a3/KcK8l7X
         I6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702879848; x=1703484648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3r99F4vTwCpnbqDKoMm/OyT56eRkkUx331L3tjXnj14=;
        b=vBs0RbW5qAfpGaWLFOuY7W0lziTA4wW2Y4drBZr5P05VQAJYq58C0BqDV8f90m/82t
         6hTjcc0zC6q/LiZhFfC1lhtMn8/Gjjsi6KauCLh9QSieUjAN8fnZr268X3yw+tZBfxS1
         Dt3LOHuV21vjaxOL3WmmO3M1HUhUXFJY8xABfHJTwjU3Db1osA0c65wMWx5FBZftXKta
         3VXP+z5xjkZriPpy+0AVR4yvJ6nRnX5DKbc+kxoBDY0xfjKNTaQ9FmhdwN1UeFMfXy5Q
         kRvfxuw/FTGK7oK7fXE+WDWtaxstDWDN4ERrrAK5LWyicuDzixAltipT7R49kcQNcE0a
         DR8w==
X-Gm-Message-State: AOJu0YxgVk5I9txB/q7ykKvyHesibAHSf6OwZkKtM/YqjTRwIxE0oxWe
	UuY9ADo5iaNDZkKHqT3idS8Ccw==
X-Google-Smtp-Source: AGHT+IE+lIfbWXYxzLYjjV/vlFd2O8QI+jCclyKcPJtNl/b2FqhJXGfuATkJjZi8mc/w4YBBTes30g==
X-Received: by 2002:a05:6870:14d3:b0:203:1c85:21fc with SMTP id l19-20020a05687014d300b002031c8521fcmr10560044oab.57.1702879848699;
        Sun, 17 Dec 2023 22:10:48 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id i4-20020a63cd04000000b005c1ce3c960bsm17065767pgg.50.2023.12.17.22.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:10:48 -0800 (PST)
Date: Mon, 18 Dec 2023 11:40:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/opp/debugfs.c:48:54: warning: '%d' directive output may
 be truncated writing between 1 and 11 bytes into a region of size 8
Message-ID: <20231218061046.jurwf7j2wlja6jgf@vireshk-i7>
References: <202312170608.s9xI4TQb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312170608.s9xI4TQb-lkp@intel.com>

On 17-12-23, 06:23, kernel test robot wrote:
> Hi Viresh,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3b8a9b2e6809d281890dd0a1102dc14d2cd11caf
> commit: 46f48aca2e5aef3f430e95d1a5fb68227ec8ec85 OPP: Fix missing debugfs supply directory for OPPs
> date:   5 years ago
> config: x86_64-randconfig-a006-20230623 (https://download.01.org/0day-ci/archive/20231217/202312170608.s9xI4TQb-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170608.s9xI4TQb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312170608.s9xI4TQb-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/opp/debugfs.c: In function 'opp_debug_create_one':
> >> drivers/opp/debugfs.c:48:54: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
>       48 |                 snprintf(name, sizeof(name), "supply-%d", i);
>          |                                                      ^~
>    In function 'opp_debug_create_supplies',
>        inlined from 'opp_debug_create_one' at drivers/opp/debugfs.c:119:7:
>    drivers/opp/debugfs.c:48:46: note: directive argument in the range [-2147483644, 2147483646]
>       48 |                 snprintf(name, sizeof(name), "supply-%d", i);
>          |                                              ^~~~~~~~~~~
>    drivers/opp/debugfs.c:48:17: note: 'snprintf' output between 9 and 19 bytes into a destination of size 15
>       48 |                 snprintf(name, sizeof(name), "supply-%d", i);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Can someone check if this happens on mainline too ? I think this is a
False report.

-- 
viresh
