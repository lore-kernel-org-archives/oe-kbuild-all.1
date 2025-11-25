Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0D274B59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764099774; cv=none; b=UPIb6pe6t7hK7iSvGtRe9ymuIxxIDhxPomou4Ayj9yzfkBvZcf7c7tSgrFgrvh5R5XmAD72pU1NgWzGvyeyATDn1rKYEm+5qQ9EseC+wcDfrrUlhXTtsF57mB+JAnrgERlcnaAXtyriFh7APkC3qNfMT3JLFn+STQyYiV3haxH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764099774; c=relaxed/simple;
	bh=JBt1h3L2XtYYOq0p5DK/08eVARBt19AunXpQdaBuxiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cfwkhegk2YLFsSYDHXSvaJZiGnllRVdq5KV80xFZ7ZgA63FWELf8Fv/jqV0m3gKywH+HJO0J7xqVA9FZUF+jydlkFZ47EhmoL1e4lidVdFsz/76mXmWwjCnw3/eU89qzLn0fTsag9gvL/2Z2YehWPunhDusD9HpjllIkcgPsgJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a3oW7eVN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a3oW7eVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764099771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYzyEzWjGRI3sd+N+V0H4yOjf+wNz2/MgKDjSabE5Yc=;
	b=a3oW7eVN1KGNHZmRRCb0XLs5xHFztbxBB8kSK7i+hxNKyU2vJNnMr21IUq3DFu0pBis48X
	XgJom48mcIgm2W0X7u7sE87zWUrmRgkZt76GC+ukN6LUW3RC6tjgqP1zpzG/aiqbQWDPUg
	wQIk+A8xUZqXjnEypBVYbvoKTdAf0xY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-941FiEkHMSeDdyZxwDTRZQ-1; Tue, 25 Nov 2025 14:42:50 -0500
X-MC-Unique: 941FiEkHMSeDdyZxwDTRZQ-1
X-Mimecast-MFC-AGG-ID: 941FiEkHMSeDdyZxwDTRZQ_1764099770
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed82af96faso128664511cf.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 11:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764099770; x=1764704570;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XYzyEzWjGRI3sd+N+V0H4yOjf+wNz2/MgKDjSabE5Yc=;
        b=JCg9lbSjtZgo4aGxFlVQLRWoo3osDm91X5Avk5pspSLuCDa8oScMSWSaLEtRB7Lmfx
         WXNvEZwjupuOwbMsNbCnV7XVdwPFTJU1gi9e1tcacgWJHgjzOHyk+Yb/xQriwgKG8uoq
         IVeKfd88Qzz4spV0bHov4nI05hyy9i3x9xpwI+NHuCGBIwowm5EnDxmJJ6bJv0BN1E9L
         huqEIJqSPsJUJ6cK1BrmzCaaWg+ZgqXTLrEiYUD+hZCFka8QRF6VKhrXm398HqT26E2a
         O7rHUvF114FM5B7JS6cwnmfvFtH16jtzNc/5uORJgu6Zf4oagVtMmUmQYB1YQuIfASkD
         LY0Q==
X-Gm-Message-State: AOJu0Yz3/jLnoyFS1EB4wZeokc5DiGMhrus+1+M4fmAudG1BxbajerRE
	HWBwCpP1zCFNgdxHDzHQrS4sgf3oubSXLFbpk0ovl7zsbukVVyDL0uQmzI3sBzwsoE62ejYLoLu
	ITTLh+Mb1uhHmOziXbX7Cs66aQi5aXogU5Ot0WT2iJBi438p7VyeCe7NWWUz6dsMxOSE=
X-Gm-Gg: ASbGnctx/AIBF1XfAIDWMHVSbhYvc0gpuqP3ZAT7fpx/vb1N+RemJJVY70bFtyMxmul
	YFAHl5yTqinTMm1lNiLJhcJjHBdEvkVrc9MzNzTRWB1KhZtitgRvY9ck3e9m5e9YJ4qkIOpU7Yt
	7FnF/6TYNLMmZVMxGTeJXJvYJAdfMvaIp0pMiYTgI/RrEtYKQdtbMM/GC/+N2nAF5TGIOYvA5SF
	YuyRjcjaHvp4odD/tA6uLwRbgGBiIVfEjTFhq8bikG3UZyZytOC0mr0agudptXGiM5i1FmsKuF9
	/LpOxBcZ6ECoHMfkHYvJpfGbSZywvSF7G3MpMgFgCSTsdIixLXsaCf1f4O7831XfGX47wAej3Qb
	O7gsJb5iLaxwqvf6j7xRoCWiNy4/xObYCSuGfx4m3hh3K
X-Received: by 2002:a05:622a:15c7:b0:4ee:1625:f783 with SMTP id d75a77b69052e-4ee58a57849mr240628141cf.21.1764099769724;
        Tue, 25 Nov 2025 11:42:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2zrlXEGz8Fzd+K/KuGsrxEJEQzWyiUZ4iUBJcE2N5XYvMvBi0OSp2vU9DCTvtsWarlmgq3g==
X-Received: by 2002:a05:622a:15c7:b0:4ee:1625:f783 with SMTP id d75a77b69052e-4ee58a57849mr240627871cf.21.1764099769406;
        Tue, 25 Nov 2025 11:42:49 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e46a4b2sm129052196d6.19.2025.11.25.11.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 11:42:48 -0800 (PST)
Date: Tue, 25 Nov 2025 14:42:47 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: drivers/clk/microchip/clk-core.c:915:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <aSYGt5O2PzqfKs_n@redhat.com>
References: <202511222115.uvHrP95A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202511222115.uvHrP95A-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RB0LfFylh1tMqIKLZgvNJwVG0dcKIbIiGhhDyB-5zT8_1764099770
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 22, 2025 at 09:39:06PM +0800, kernel test robot wrote:
> Hi Brian,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
> commit: 7d85cd8730ab7701a1cafd0db0d7b6b1f6cfbb91 clk: microchip: core: remove duplicate roclk_determine_rate()
> date:   7 weeks ago
> config: mips-randconfig-r134-20251122 (https://download.01.org/0day-ci/archive/20251122/202511222115.uvHrP95A-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511222115.uvHrP95A-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511222115.uvHrP95A-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clk/microchip/clk-core.c:915:10: sparse: sparse: Initializer entry defined twice
>    drivers/clk/microchip/clk-core.c:919:10: sparse:   also defined here
> 
> vim +915 drivers/clk/microchip/clk-core.c
> 
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  910  
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  911  /* sclk with post-divider */
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  912  const struct clk_ops pic32_sclk_ops = {
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  913  	.get_parent	= sclk_get_parent,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  914  	.set_parent	= sclk_set_parent,
> e9f039c08cdc9b Brian Masney         2025-08-11 @915  	.determine_rate = sclk_determine_rate,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  916  	.set_rate	= sclk_set_rate,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  917  	.recalc_rate	= sclk_get_rate,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  918  	.init		= sclk_init,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  919  	.determine_rate = __clk_mux_determine_rate,
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  920  };
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  921  
> 
> :::::: The code at line 915 was first introduced by commit
> :::::: e9f039c08cdc9b38665aee9a88ae21f59c09ba8c clk: microchip: core: convert from round_rate() to determine_rate()
> 
> :::::: TO: Brian Masney <bmasney@redhat.com>
> :::::: CC: Brian Masney <bmasney@redhat.com>

Thanks for the report. I posted a fix for this:

https://lore.kernel.org/linux-clk/20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com/T/#t

Brian

