Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D276AB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 09:31:58 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b9b5ee9c5aso28458501fa.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691746317; x=1692351117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2VGyZBytmpnhJA0vv2u38IIsmTj+XuPqzVQBW8m7X8=;
        b=pC1Os6ZCtOEPs37F7qkk1QPZGPEYNG3QycSK86EQO7CfDh4WeEengx5Q7GbAdpbtyu
         NbGVzL/JtntLzzgbs4OSb1JOh0kZN5bqQ1v0/tdgr25+tFtLO9BQYB9xQ6HsimF197B9
         Rdbr37zidkokL2for+H9vX+8p3WCo2R/nFhx4Vb5/aeal12LD/HglVlCte6QcXn9rRTh
         DJ+/EWj2HiLgBFV60XqexbZOhG5EJQL1rE2YtGvclqXO0tFMacDgkpSXghctoSITgJHi
         q2LoXpxtzrf6mc17Yus3kSunD5oA26l8YMxlyy0Q+XYyXWRulJMzfQSBbbXxcyu2/8WH
         dqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691746317; x=1692351117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2VGyZBytmpnhJA0vv2u38IIsmTj+XuPqzVQBW8m7X8=;
        b=bbxwD7VhoCryMPyd88iV4ZBq2ebzwN5rrpaEfInBCY/fuDe3BBK170Ugvzqn0R6Oys
         DLRjCwFh+NBaZeOGRM2YhYFeMcSHAHBM3+XmQji137XKL09ApMNkN0PjioK6a5R26FuQ
         uEM4MHrGfB/TsXJohHyVreXbR2G+3m/wpJ7djxflVkrpw2XYqbQlRb66GWSQxiVTgNc8
         aVA+ImfecDPCxXeiJljSDx5dKvxvzUY2l4j0JypPKIfVV2ySmXjUVvjmoaIqmXy574sX
         6NTPRAFSMckkVkkGLSqKXuGe8uVoyuPezxQ7OvJ0ngocITrPUDxWWATELGX2JGYsu1PB
         +hAg==
X-Gm-Message-State: AOJu0YzaPq+l3ocMOpgD3LAoUfygSrRRWZlgHG92xYdLx2qWA6gE9lK2
	h9M6P22LC4lsbib/yPMLUAVsBQ==
X-Google-Smtp-Source: AGHT+IEgLWmt9jM55+QIvswvVbtk9wb3d49vZcs5e6sq7Hrp8q5aRDoXXwp7b+uYFEjuwAOVYgb/zw==
X-Received: by 2002:a05:651c:104f:b0:2b7:2db:8ea4 with SMTP id x15-20020a05651c104f00b002b702db8ea4mr1336268ljm.30.1691746316757;
        Fri, 11 Aug 2023 02:31:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bc8c9000000b003fba92fad35sm7608507wml.26.2023.08.11.02.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 02:31:56 -0700 (PDT)
Date: Fri, 11 Aug 2023 12:31:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpio: sim: simplify code with cleanup helpers
Message-ID: <e1f0ddf1-542f-423b-9484-5f992c1f7d1d@kadam.mountain>
References: <20230809131442.25524-2-brgl@bgdev.pl>
 <2444c3ff-eaf3-4cb9-851b-8e92156128b0@kadam.mountain>
 <ZNX8DDKYMOyxdTnB@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNX8DDKYMOyxdTnB@smile.fi.intel.com>

On Fri, Aug 11, 2023 at 12:14:52PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 11, 2023 at 08:20:11AM +0300, Dan Carpenter wrote:
> 
> > smatch warnings:
> > drivers/gpio/gpio-sim.c:1472 gpio_sim_config_make_device_group() warn: possible memory leak of 'dev'
> 
> Isn't smatch a bit dumb about cleanup.h?
> 

Aw.  Crud.  I hadn't seen that this was a cleanup.h thing.

I did do some work to suppoort cleanup.h but probably it will take a
while to work out the kinks.  Let me figure this out.

regards,
dan carpenter
