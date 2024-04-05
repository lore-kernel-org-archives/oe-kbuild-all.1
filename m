Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6985788E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 20:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712349020; cv=none; b=c3yuxkd2fcBywi2fJ89BXYjqoXqlegVioSEhlQ1/6daJwtMqf2dHByBGrmvTxRQNX26nfMBYMk7+vpDmGYGXni1lT+2czDETRdN3IXB+w7J3y1BxW4iG1VBS0QZRQUhwvlUI8BHbfxGf1LRh3phzGPGf9Qzt7mMVkL6hKvfg5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712349020; c=relaxed/simple;
	bh=nV9Y5sZu3ZPCtOva3EsmstVhIY4akSsXCrbWmGpcqII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lb0TpnFyL1Kovsok0NT8tPnO0OCVzqFUaVCEvF62awq2c/UiOJ9aKi34Ob1pYStZjp0KYAVYboVFim3oMJc3Il6A9VAnd8zdMsVlW8TShT3h7NUFR2RqAx3554Iw5GT8Jz0hRUvFHX/v7GIyFwsxy/bNpGelB34DwOklt8akNg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lj/0EOer; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lj/0EOer"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516d15d72c3so2429601e87.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Apr 2024 13:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712349017; x=1712953817; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+jEmOFEjTU7lwjjt1V5FPrXRPUYL1ukEXhP8ohspNk=;
        b=Lj/0EOeruCJF8nh2bpKBWPJitcOJq+E4aQpzzEp8lVeOiUEaCP1U4fSAR762bKLJRV
         SXq0tcbFJrCYnw11JNzms1LG1E4Zf4vQBr2WRnPEoblPFBjXa1u4m3qh4Ldjej54zZbq
         OY3UvBZwAlvZylYjDc8zNEXNkiOWZS0mKRFFRBkaXKs22/96ByIUwIv8Ijmn6jV5XT1w
         2i95fg1L/TV/NtzHMHpFtWOE1QDgymbi+PyJ1AKM+DMVlTt00aN3c6UjfUt2mNaLdcfs
         kL6tZxmTTxvAk4Y97t22gBiwy+gvW+stSnJcI1nIGbp4GuPPxQ4Yn7e6uvSCv00xIbC2
         9I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712349017; x=1712953817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+jEmOFEjTU7lwjjt1V5FPrXRPUYL1ukEXhP8ohspNk=;
        b=tVzMh1dN1T7w4J+6hC6X8t4MksqkMd35VG7aTX1yX1dQ6B1MJ4RD1UehCRSpCDa3tk
         lXMhHyqu1ncO4LtICdlNQ19oCIpgQSC/+oGVTcV5rvNIOY6Y0R4xm7qerrdhVkKqeM1n
         qmhcPFcfN1SX6PWw6gQ/8jBqloAut4IqXRtrQb6GYaMiTKhypJZWPJsv3oB4TvJl83S1
         FaJTs1CRr42cowTOmJ7IB8r4EWzrcRhxQnxaroXj9KTsBkM49iMoA2DsuOvcO1FLOiDN
         m4Y8QqNht8NzMcai2RK7eMTw3qSCrn8HBuGLz+UxdQoADQB2Sc0ZFlQ+9zQmBcCtcCuY
         bu4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk03bCl38C4sRHMzLqHgyuDfF5yedAQHdNWmVFp70eGckB5SUT5DG4I5VOGNQYLi7tydume7TV6o+cQGVLyzdKoiMG9Vc+vcDguXKkmQ==
X-Gm-Message-State: AOJu0Yxj1yZIsrissRrHdfiS1EcNt3hp5ru0VmsCn+p3gcOSeoQ34Eki
	M6XJzUd5Hd8dktrv5sbRv3Dsekat/brXt3cKURdOlAr3AmQYPVNpsRg8FeAlOlsPKRYPmtGKghp
	CFyH/Rkkr7keyqOtkea78EzEFjDZlt12ndhxySp8IMDwVv6OgGklE
X-Google-Smtp-Source: AGHT+IEctCIw+qSiNBMbysTxNZa7FXusQuq+U7LwmIXIiKndMkDSxEkCWBXPlF0xCd7GX4Brs7t/yyuAjdtpKpywhjM=
X-Received: by 2002:ac2:5964:0:b0:513:edf4:6f20 with SMTP id
 h4-20020ac25964000000b00513edf46f20mr1622327lfp.54.1712349016554; Fri, 05 Apr
 2024 13:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240405053510.1948982-3-yosryahmed@google.com> <202404060445.zMPxumi9-lkp@intel.com>
In-Reply-To: <202404060445.zMPxumi9-lkp@intel.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 5 Apr 2024 13:29:38 -0700
Message-ID: <CAJD7tkZ20wwnM2PXTUS+VMvEXcNU5xrpBCjs4LT=Ds0gLpopLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] mm: zswap: calculate limits only when updated
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 1:24=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Yosry,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on next-20240405]
> [cannot apply to linus/master v6.9-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/mm-zsw=
ap-always-shrink-in-zswap_store-if-zswap_pool_reached_full/20240405-133623
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ev=
erything
> patch link:    https://lore.kernel.org/r/20240405053510.1948982-3-yosryah=
med%40google.com
> patch subject: [PATCH v2 2/5] mm: zswap: calculate limits only when updat=
ed
> config: i386-randconfig-061-20240405 (https://download.01.org/0day-ci/arc=
hive/20240406/202404060445.zMPxumi9-lkp@intel.com/config)
> compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240406/202404060445.zMPxumi9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404060445.zMPxumi9-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> mm/zswap.c:132:15: sparse: sparse: symbol 'zswap_accept_thr_pages' was=
 not declared. Should it be static?

Yes, I already have it static for v3, which will be sent after the
discussion on this patch settles.
