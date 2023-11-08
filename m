Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB6ECA67
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 06:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ICL1awKq"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6b709048d8eso5585408b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 22:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699423992; x=1700028792; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UqET+/tUbFu2Jp9wRy1DEiP4GTn/JAUINR9zHqa/AlU=;
        b=ICL1awKqGWUdyhna9a4XaQPF5lfx9RT6fqpV/W1uh7AM5T4syFJCQrXFXTJG2Ang/g
         dtZdMsmsei0LipX68sADQh9YQvGj0YN5YJnDM/bz0RZYASrSh8HF9befLM4wt5pFzobQ
         Ad+HG7t1IJTJhd9hZQULCjYDQf2PAPRQp/sKiGYsaIbjmQvV4qWNQcMjhrh1DBFkedWa
         1rKC53BQTFqyJuY3ejD8RMiCmc80trAQTPpwHCFCCHtbh2aweSV3yB8rBPEvmIkAII8c
         O4I9584b/2I9AabWLDCU/jZPCC8A3U3n21D2Y0zdB0llzksc0IkNAVTq9sG36k0LZiIh
         JCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699423992; x=1700028792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqET+/tUbFu2Jp9wRy1DEiP4GTn/JAUINR9zHqa/AlU=;
        b=uBdghEIoP8/QhNQSqHhlHtyoD0gdCWPuvELXqym5ZltZwVG5YLuFCIQIplX7cABP8g
         cgryFHkpiilmXW7HJU8fzKtKVFq0h48APUdBvI3lghFM7ETjk6eZNoMTVJ1gb30wvedG
         6BfmnFhXs0/MbdAWaY9VJjQNgh/g+YwPIE4bqawDHyhCPpPLGOyuZ0Ht75aC4d4KSdKD
         dE+QYgx798+IfdNr5EcxUHNkIGgpg374fJzEDIbVv+PAkMrTyPBxTursgaGJPnSwuyim
         PKVkhZ9SE4kDbTsTmVth4549v5AuJYB3WFB4FfFhTPXPGWNl8AxbgXCALHQIf1nw1gxM
         JG2Q==
X-Gm-Message-State: AOJu0YwrDlLnN8mRqgxnDeYRfsUvPT8cc80Nlw7zyMLbMY9xAjUnCuev
	h7SB5nVh/sNU8ttiYn/LxxSBUg==
X-Google-Smtp-Source: AGHT+IHpdE+SHUhlg41LDgR83N6jNh0Bs3AiiFpPYiktqU9+a3AFWX5KM2j0MLP9vhd632/I6QaBjA==
X-Received: by 2002:a05:6a20:1608:b0:161:ffbf:d949 with SMTP id l8-20020a056a20160800b00161ffbfd949mr1253550pzj.3.1699423992235;
        Tue, 07 Nov 2023 22:13:12 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id rr5-20020a17090b2b4500b002804af3afb7sm792350pjb.49.2023.11.07.22.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 22:13:11 -0800 (PST)
Date: Wed, 8 Nov 2023 11:43:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/opp/debugfs.c:48:54: warning: '%d' directive output may
 be truncated writing between 1 and 11 bytes into a region of size 8
Message-ID: <20231108061308.jcoj4bjzv4m5pilx@vireshk-i7>
References: <202311061847.BOtfUmbQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311061847.BOtfUmbQ-lkp@intel.com>

On 06-11-23, 18:41, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d2f51b3516dade79269ff45eae2a7668ae711b25
> commit: 46f48aca2e5aef3f430e95d1a5fb68227ec8ec85 OPP: Fix missing debugfs supply directory for OPPs
> date:   4 years, 11 months ago

This is a really old commit, are we running the test over it ? Or it is what git
bisect reported ?

> config: x86_64-randconfig-r025-20230725 (https://download.01.org/0day-ci/archive/20231106/202311061847.BOtfUmbQ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061847.BOtfUmbQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311061847.BOtfUmbQ-lkp@intel.com/
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

I tried to reproduce it for ARM and don't see the warning locally. I saw a
similar one earlier (reported by the bot), which is already fixed:

make ARCH=arm64 O=../barm64/ -j8 CROSS_COMPILE=aarch64-linux-gnu- W=1 CONFIG_DEBUG_SECTION_MISMATCH=y

-- 
viresh
