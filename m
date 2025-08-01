Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718CC1EA65
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 02:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754016192; cv=none; b=PON+5l2a+ZVG1ifBQKKMiKv0yHbo5lPRQK7wu7tHBwLgeAtqh2SAeUisLEqev5u5GxBWX+Bjk1vvs2vWawfexRWF4M4pTfVGYrk+dnDkpEsKkVSnsmr0X9XLSbhbOQFKoy0sjsaxqUGDxaVZhT2zjPDCLAh24/gO4fj0c8MiuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754016192; c=relaxed/simple;
	bh=nzD6WB5RkC6BGze6HMUMTiSxxJJtsLrFFAQICpP6Gnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpahp3QDAZk3yimvUo0g1UiZL7yFmGkY28yMYuk6kru8s8l2WJ13QOAIuDlw+AXkCv/AVWDwJOyuR+vo6hTF7sueJAPuWTk70ANVRbYknf/FzIZ9a1lG8dOfY8ch4x9v2bmZKP4/DgY+TIses8fG/QfbC0uwSxrVkDMvYpKFyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hDQ9Z/ff; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hDQ9Z/ff"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7426c44e014so1621796b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 19:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1754016190; x=1754620990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CzF4jXxLSwk12tntJ9tivy32DZakdcy3HZY4JGEQh/8=;
        b=hDQ9Z/ffkpq8Ky35ceRvQ5IUldS6rD/bKxg54NThiGTUuw1SOYLZ7gV2ttYHJyCEt6
         NIa/4rL5wS7ovnPikdp9EoPFSJeqTEfyjE7+g/+V8FGr/0piSnOsqMsCYHYSJO4hzG7D
         lf7wxMPPYqpU8D38FcNXiW637cfl6pDykWky/fzxcshor5yZmedZNSTJPckyfxUQWyjT
         NXGis4PEGRAZa2Nq138Bs+jnPFDyPuqaat6CmtrNa2q2fz2vCaHC/MsepaRbw87Bd7R0
         ak7P6C0XlV0QNhADpdRT7/k0bVsGaVVvUBOyQjfbqELVgqlKiuHqhlpQwTvbwc7sZHW5
         ZuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754016190; x=1754620990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzF4jXxLSwk12tntJ9tivy32DZakdcy3HZY4JGEQh/8=;
        b=g+SLeaQ5lDPthHJclIGR4EBk+kNpwSlT9zu+zTpk0p+aMbeWzWKJu20vDWXMHqwHVM
         aK7qPT7nr6iKPDHSKZ8QQ3xaztUpANf8uMFzhKdYgG6pc81kuw0GL1A13Ne6gDnhe+CK
         6SdRJdZpv85ZDXWF6IIAcDprjKcGnUaaxWM/bQJRv6sQ/Yb1yUSmdN473+FY1IpxoI9L
         efZs6zYWJIik3ECOrDcYdm3zPTTWYX7tQAAOekRAlrBWfLDCUU1nA+m8skdU7t7EqcF0
         jaOMkNYt7oW6kBrgSov63km0DeT+3nWViQkjtJkz9/SMWIr8vwOy4ITAvsFfMOMr2j7u
         bcNw==
X-Forwarded-Encrypted: i=1; AJvYcCVxlOwW4PDJFzjCa419fJPGJmxf4eiCFaXYi0gSiF6/1xd/gLwlfRzPbWKkJ0wkWi9Ak1TYIT41bGsI3Dxc@lists.linux.dev
X-Gm-Message-State: AOJu0YzJW0v71Y8sS8VxkeiE8h0ol5TpfqJ0uwdPBTwok/wOBcTgmGj9
	eHfJcOgPfyFxvn3nd7fmZzT87fYh8bv4X7ViJnFCOynMjGdhAmKLDaOQptsBakW6Bg==
X-Gm-Gg: ASbGnctk4aq7TedenJPdyEi9MDC5GHkSXYAV8gHG78BvGMPl0ufCEN/Z8Z2QSFD10io
	4Btj5AIcEeYng4mF6ePx5ttH4BhdmV7uhBvshfh7cQ6w1Ra+j7kZM+q5LMLWl7xyAMlX3iNa+/j
	fx6iCdb0hyaS5wIj8SMCTSbSDIrOm+zk6oX3tSjKWluzZf4FXX4B2EWn+GJeH7T1c4i5W2Pk4pQ
	uBaCmskGBOiV81McYb24PQHF/cGpzM5gmja1qTk0nJWwhnmXqa78HrV6g7XSuwEWoCs5vtvPTX3
	2ORxDOYAzCPhuiUQM7AXqCLb7V1jMOLS5cQqfZ1jkTiBNwAbfmgp5CR4zLbhCZZv/NEeBXFtV/T
	ErDSisNsNu3/Txus7kaR+vNf5qVISY1FY8erZYbPCbgKm+2y5FPaJKw==
X-Google-Smtp-Source: AGHT+IH+UDQ7iOpF4B7kF0iLPjzpWWshotanqhyLxmLjhjWrs9mQTlq560Ea7kIcPBTsIu2VocDCVA==
X-Received: by 2002:a05:6a20:914c:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-23dc0cf63e6mr14331609637.9.1754016189706;
        Thu, 31 Jul 2025 19:43:09 -0700 (PDT)
Received: from bytedance ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb19069sm2363362a12.65.2025.07.31.19.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 19:43:09 -0700 (PDT)
Date: Fri, 1 Aug 2025 10:42:53 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: kernel test robot <lkp@intel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clocksource: Use correct limit for wd-cs-wd read back
 delay in printing
Message-ID: <20250801024253.GA360@bytedance>
References: <20250731120454.GA309@bytedance>
 <202508010911.AmkxEw1p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508010911.AmkxEw1p-lkp@intel.com>

On Fri, Aug 01, 2025 at 09:48:40AM +0800, kernel test robot wrote:
> Hi Aaron,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on tip/timers/core]
> [also build test WARNING on linus/master v6.16 next-20250731]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Lu/clocksource-Use-correct-limit-for-wd-cs-wd-read-back-delay-in-printing/20250731-200709
> base:   tip/timers/core
> patch link:    https://lore.kernel.org/r/20250731120454.GA309%40bytedance
> patch subject: [PATCH] clocksource: Use correct limit for wd-cs-wd read back delay in printing
> config: i386-buildonly-randconfig-001-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010911.AmkxEw1p-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010911.AmkxEw1p-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508010911.AmkxEw1p-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/time/clocksource.c:293:43: warning: format specifies type 'long' but the argument has type 'int64_t' (aka 'long long') [-Wformat]
>      292 |         pr_warn("timekeeping watchdog on CPU%d: wd-%s-wd excessive read-back delay of %lldns vs. limit of %ldns, wd-wd read-back delay only %lldns, attempt %d, marking %s unstable\n",
>          |                                                                                                           ~~~
>          |                                                                                                           %lld

Thanks for catching this, will fix it in next version.

>      293 |                 smp_processor_id(), cs->name, wd_delay, md + cs->uncertainty_margin, wd_seq_delay, nretries, cs->name);
>          |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
