Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB7A3FF5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 11:05:15 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-57b67c84999so5894579eaf.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 04:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695812715; x=1696417515; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vetR3GnlwFXT3zkdDS+aeE4yPjMJRiiW2xyPGx6ftZ0=;
        b=Vo638iisoEYWqQd2LMtz2W1ltOYvqf5lU/aqUjQaN+4hQowSigD+SYjj6eNIaniK0f
         2mwm2ZrO2KPNQo+nE2eLSbVkS0v2csfx2Ix79Lyhv3iGTDBEz+6vvn1GZpOLQejoaH4o
         loM4tVqQ+UR97Vslg5t+6iW0rs0xZbfFx0k/i6LF61/8MEbKNszHbKQgTb8x7aQvFksr
         Hg+5M5+zWOTn0aQiS2pjDDJVDObOtTP6OD/fR9DHV3mmrwr8v+5ejzWgAPNSKaItV1gf
         3biwEWK6lupHjBMdnuKVVfw/u7Ae5V9u3t43bVoU6efStzTctVvDjsvyYD/dKVccyCEf
         TnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695812715; x=1696417515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vetR3GnlwFXT3zkdDS+aeE4yPjMJRiiW2xyPGx6ftZ0=;
        b=teoq+jmCTXY6pduPM1lq4FnROuMjqwNG9NbIMuVZM1t9zGe7LFiKAKE76eOuw9ExXx
         858clA15Sdbb5BsLJRM1r1NbEenZ4wDRYFvI2gch8fJpp7JGBT//oL+v9uHpgehHJt/7
         b0Uoiu+gvPusx96g5F2b1eZy7XztNjRKGKyGoKg32WUdMkgwzQOLGkUSSY80GvdUy3Sp
         O1BHhgs98d/eS9oxRQJtzDxm9UCobcKVGpSpBduzT0b0EICG49WStNgrA4AlYicgby67
         4pqgaWEJ1HUL70ewXQBzLtHvR533H7P1ZDPKNcdILsto+MNBAL/+Y742UeI16FRiKEwm
         JGXg==
X-Gm-Message-State: AOJu0Yyp8DmGdYQpGPbxOkTW+JOfL8BVLQa4eSEKj+HU6yvjTk7Zq2+w
	9WliR5BknOxqTbwQ8h1nSY8Ucw==
X-Google-Smtp-Source: AGHT+IH33pd389pOJmt1++lTT1g7TKrnAgOO3Sd5QaIebHmN4PEVtfqxMEzdG/doEVybvDTQII3XWQ==
X-Received: by 2002:a05:6358:9917:b0:133:428:35dc with SMTP id w23-20020a056358991700b00133042835dcmr2360041rwa.11.1695812714657;
        Wed, 27 Sep 2023 04:05:14 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id k7-20020aa78207000000b00690f622d3cdsm2537790pfi.126.2023.09.27.04.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 04:05:14 -0700 (PDT)
Date: Wed, 27 Sep 2023 16:35:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: drivers/opp/core.c:2113: warning: Function parameter or member
 'opp_table' not described in '_opp_set_regulators'
Message-ID: <20230927110512.3ihludnoqj5vugu2@vireshk-i7>
References: <202309091728.siozDgSB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309091728.siozDgSB-lkp@intel.com>

On 09-09-23, 17:34, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
> commit: b0ec09428621daee5101130c307634a390b0213b OPP: Migrate set-regulators API to use set-config helpers
> date:   1 year, 2 months ago
> config: csky-defconfig (https://download.01.org/0day-ci/archive/20230909/202309091728.siozDgSB-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091728.siozDgSB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309091728.siozDgSB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/opp/core.c:2113: warning: Function parameter or member 'opp_table' not described in '_opp_set_regulators'
> >> drivers/opp/core.c:2113: warning: Excess function parameter 'count' description in '_opp_set_regulators'
>    drivers/opp/core.c:2756: warning: Function parameter or member 'token' not described in 'dev_pm_opp_clear_config'
>    drivers/opp/core.c:2756: warning: Excess function parameter 'opp_table' description in 'dev_pm_opp_clear_config'

I have sent patches to fix all warnings related to OPP core:

https://lore.kernel.org/all/0484680a9c7bb66cf1fb583a5178e753dd763afd.1695812634.git.viresh.kumar@linaro.org/

-- 
viresh
