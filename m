Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC97D338580
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612106; cv=none; b=fpu2yzUIZ7HnuigUZ/sxbEOiEfwpPHqgokQLNNVKxrScfuQNMA/ZpnO7NaZpPkIXvmoSw9qVa8UdkL9ulgzV6r8b8x1uYlCnaWCKUqEcUOKPxHgmUc5B8MI+0O3Gdt34PENdi/PhUD9ZRQjzAnIF0EbDd1Z89g4BNsJSh1HVptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612106; c=relaxed/simple;
	bh=Cl5MfZTmygfRTiyyEyEUElbsEfjllDUBjhPeeZiTfkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oVp8IOaUqiexJIfqBBgLSiUEp+vRukuVxac3eJXpT93m/l9IwZXUCF74jOzeXhS0pAQS4R2SJik1nHTks2m/OTUuWAN6p5dzYiKO+aqkW2P6rUszqLA5c/Q6cP87tC3KHTgUKY5Snfd5nPP1L5qsBB2eub0HqeNctAN58bSoUik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G83uGYEB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G83uGYEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764612101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cNpwF+vE1biwEuxq5v/m4qt1meHle77L6rU4xp3q9yw=;
	b=G83uGYEBmgY+um9kUoM2NgWizvQeD/Aw0A27YUDRKG/K+Iq1c8ZwNLQJlw7a7Th4YFw1Dy
	6vJb1k1hR8gLEGzk2gohWPZWjYGg/nP1UHzwS/Yub9EHq76hx22ooqRyhKJ/QrwDfxCRQM
	Bpa25K8BXWxGpScb3EttsM2tZtsMLQk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-jJH6x4jfNjuapjMHPKrW9g-1; Mon, 01 Dec 2025 13:01:37 -0500
X-MC-Unique: jJH6x4jfNjuapjMHPKrW9g-1
X-Mimecast-MFC-AGG-ID: jJH6x4jfNjuapjMHPKrW9g_1764612095
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b286006ffaso793233285a.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Dec 2025 10:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764612094; x=1765216894;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNpwF+vE1biwEuxq5v/m4qt1meHle77L6rU4xp3q9yw=;
        b=YyFagugFi+mdAhFFeHBk8SgzHEZ7jyu92wrLYWpUxAyPp6F1YWSgg9UzmOxZvppT3M
         Am1PTUYD2ULeEEUmMXbzXceDvswKRAzve8mjNkPSBklQ5OSkIlJ1c1f2RUlt4LeALw1Z
         ck293lLUAto5wWMMl9OIAenfL++E379eFVEEgbaICWugX+U7gI3T8UhIFw3bF5/UZ4q+
         AA47JlqfHfC+YJLbUn+SWf3M6e9cCBCF80MneCc9I2iUwH6HbGodzmtPMISBYbWxJtEN
         VNjdezm5XkKnQ5y7/JOsHdtIhXpEYcY8/vhkLdg8AGcqynuxgMQBtGXrS2GDlqWVfgNH
         ALJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG+jP4zh+U/w8N5d2jWoc7yisB1KhfhHEd2pbs6jL7F39CYi3Eo5DCBO2Ti2kAe6Eh7vkqXKrmoy9rSBF+@lists.linux.dev
X-Gm-Message-State: AOJu0YwtoBeYb5FPFTDMaCBZj6qdO1cOqt1V4JirZKMtSjsSXotXJHd8
	WqFTgZI9FsF71cKDIxvUbKck992JrhMdYKKqAuTh5ChVY8neowN8MtQGasX4ZSGGYtLYDTjXfFK
	bLcb8raw93E0LoHk6GlxnbzX5y/9r92z98PqCcs86518ogRzj2fa0g5DCaGVtpgkzWYA=
X-Gm-Gg: ASbGnctHpUGuuT0QbwDkw+ZsWdMWKItUyx1rfDgb4tJGMnbMNkl5sGRvtn3sEITycXf
	yDGgmE9DHayvY+cZFx2JDareR3hVtPsEqBo9veRxvaaFGkMQEljcs9MhNzi7F4ClUvQJS3GbBHP
	SWPulZydKzBpvlfgPh4Oqcw53/35nklx57lY+qlTbPkVC+PI1P3s20NFqX5CdMXlPCuMI8Z+TFC
	wpKLWoIQhTGWJwo4JhwuX60GVhpter+u504vqid/6CFZWbhO+m3stKD605Eyg1Rg1xmHlfpKtNh
	H5kgB4lC/vo/1qoooXGTDQhqpGFGJZGe0kfMV2Ip96go3f+patzKR7QInTDB+XHz4TjA+cAfV5j
	BsIVrm1vTdGoITvROdBA2Lpw6ToL+XLqAwT38sclfNBxC
X-Received: by 2002:a05:622a:1394:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4ee5883fc8cmr441494871cf.15.1764612093608;
        Mon, 01 Dec 2025 10:01:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFka/sclAcykb4EafMCqkmrz+Srgtgtrntu+M3uKtzXPbszU0pI6Loxjqn7JQekjtJjw+Qepw==
X-Received: by 2002:a05:622a:1394:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4ee5883fc8cmr441492521cf.15.1764612089955;
        Mon, 01 Dec 2025 10:01:29 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd2fbb8d1sm79292921cf.9.2025.12.01.10.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 10:01:28 -0800 (PST)
Date: Mon, 1 Dec 2025 13:01:25 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aS3X9VXVlKNQyDoz@redhat.com>
References: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
 <202511270924.0uDTpEE9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202511270924.0uDTpEE9-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 39uHDv4Gbo8wZhKM62YGCsrHtnQoHw-mbl5ByWSdCvY_1764612095
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 27, 2025 at 10:11:12AM +0800, kernel test robot wrote:
> Hi Brian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251126-035403
> base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
> patch link:    https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9%40redhat.com
> patch subject: [PATCH 2/2] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> config: loongarch-randconfig-001-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511270924.0uDTpEE9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/microchip/clk-core.c:12:10: fatal error: 'asm/traps.h' file not found
>       12 | #include <asm/traps.h>
>          |          ^~~~~~~~~~~~~
>    1 error generated.
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for TSM
>    Depends on [n]: VIRT_DRIVERS [=n]
>    Selected by [y]:
>    - PCI_TSM [=y] && PCI [=y]
> 
> 
> vim +12 drivers/clk/microchip/clk-core.c
> 
> ce6e1188465998 Purna Chandra Mandal 2016-05-13 @12  #include <asm/traps.h>
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  13  

I only build tested this on arm64. I'll post a v2.

Thanks,

Brian

