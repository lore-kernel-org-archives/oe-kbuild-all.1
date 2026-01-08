Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61E284B58
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767914286; cv=none; b=D63P9iNw08tJZOR6kBFhIQR296jKpF6J3Zr9x5mAZ3ehQzs4k28hmSeMN4h5sQ/ztrWv5Q90TJ9toLdHYdC1jSrEjs14irlOAvy0YXdw/RlMztD8WgCKMUgHj24ocuiPz+K4RlFXxa88zxCeHz1Z2lX+F/4QdTA11tvtU/PskVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767914286; c=relaxed/simple;
	bh=NTPOJkiysZJtVEyt4iEXQb3heX+UVL0KUCdqfCPolZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=I5U3fQYw9lBupJt6Fl+ywC2fLJXtWxzRNz2mVOmPGIzYlZxPPLTQ8k/C4TK6PpO/H9m/AdQ/WlkaHS8GSIJ6Wb+VYP1oOaw23ttTfX0+KI5FXqOvXYrBizXSdRtiudWXQje/7f+KFUXgSHnNgn+bjT6ww/CimgDMqyG0fUJQPas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dnhv0hoG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dnhv0hoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767914282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XmkhR6d23VB+MBS3bmm1gqOxsKykbeYeimHuXpLEvDc=;
	b=dnhv0hoGDFBELj0v00vBBo33LfeSAiYg2rN2s/kEPh7rNQU+n5grwTSRvFI9NUl3D3tKZH
	DfceCpGIk2gw6RkRypOT62pvN0tx4vWLMmh7AaK07IpjUzFkkIabCwpqvZUESwCT+r9shI
	ucrKh1GS5TzXkGZEtGPpESOPVsF3NHE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-tRpJ_I14MaOBJ-obzpLmTA-1; Thu, 08 Jan 2026 18:18:01 -0500
X-MC-Unique: tRpJ_I14MaOBJ-obzpLmTA-1
X-Mimecast-MFC-AGG-ID: tRpJ_I14MaOBJ-obzpLmTA_1767914281
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a344b86f7so117052236d6.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 Jan 2026 15:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767914281; x=1768519081;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XmkhR6d23VB+MBS3bmm1gqOxsKykbeYeimHuXpLEvDc=;
        b=vumrec6sgryVZmfl9h74U6GWWKCef+rR6vkNjD3EL4Id9l3ORR9h8Lr5zwHRhefa06
         j6BrSvP3doAvoJfkKUHoAReJhKvjcbzjQ09vhguapPTB6/BhITKKhLD3g+e/cLoNDepG
         vjzGoIWBwGsrtUrNJcmlESjWJGusonF8AO/TiZAz8p61g0bgJT58dU8DANKlVtSOwBOV
         2jxThMujL/dKqtof9aB3HM5PegGFCXKWIbXceUCnXt9xSwT2tc1DuHRHlCOPhVXYJl8O
         f0jTVMaMI5B1tEkSZkAikbZL7T5x0UkLxwb5EB891MQHc49wMfgF2TTSPcTI8Gl9njrl
         /GWA==
X-Gm-Message-State: AOJu0Yx99qx2eCVnBD2jxSXsqj5Ct5U8jQUESzTHwse5AOQle6C4vsBi
	DT+M9Cr9ESYKBxCHdS3y+CbWni2qL4rhSspEMkO3vQU2j6pYJ10zNBhrK4PJQXPjpHUFQt7+I5u
	nIF/XewIWK5NirHfQwyWCV5xq+3bmSvfjFPdZCMQ4fLhWna/M5czKSo040BkG6sZLTOc=
X-Gm-Gg: AY/fxX6D6tUay/z2M19pwLaD2I/Fz8u6z33+QGwEFKl1BAr8It8KRlHVaOpnO28dyOC
	O5jJK34P1B3d9XgHHdwJpcoSGwXKrsEJrOpyqHkwpiWyQ7G4OF9JfgKlYSN146OPOoJK2/+uE3S
	MlXev+NgjHfIaV0qxbHZNhb5gLcjH8IRwISOIKLKwRUyB7uTuDJn49aIKyMU7pONdFHcBZqWjbr
	SDHqRYdlgVCPRUqUe4JmUh1PZi8MbOq6rfdTbIJQscrOanZHmk0EpBf2hWa4OBzaKDzHbf4pPem
	B1lbqiwtFfttNGCJbAyLd5+jE3oNlRoAhGjgEwjFDOTsZ1aXoU0HrPR6xs7EVniUu1DZ3IQhalg
	hc+LhNkE=
X-Received: by 2002:ad4:5aed:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-890841b430bmr111176936d6.27.1767914280795;
        Thu, 08 Jan 2026 15:18:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiAMx2ilPAG+6O2GSLEnHORK3xHLY/Vgkrq55ZG7qozx5/LKhCSFXT6oYJmD7gtqTSNdJ6Qw==
X-Received: by 2002:ad4:5aed:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-890841b430bmr111176656d6.27.1767914280404;
        Thu, 08 Jan 2026 15:18:00 -0800 (PST)
Received: from redhat.com ([2600:382:850d:c75b:2aa0:b08c:d81b:f52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm62576156d6.2.2026.01.08.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 15:17:59 -0800 (PST)
Date: Thu, 8 Jan 2026 18:17:58 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: drivers/clk/microchip/clk-core.c:915:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <aWA7JkZAIGFpAeVZ@redhat.com>
References: <202601070531.yJ4x70yl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202601070531.yJ4x70yl-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5VjW6CqHUlSZdSOQR8K1U6SWeFkM7x1wBl7XWLUj64M_1767914281
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 07, 2026 at 05:52:23AM +0800, kernel test robot wrote:
> Hi Brian,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
> commit: 7d85cd8730ab7701a1cafd0db0d7b6b1f6cfbb91 clk: microchip: core: remove duplicate roclk_determine_rate()
> date:   3 months ago
> config: mips-randconfig-r113-20260106 (https://download.01.org/0day-ci/archive/20260107/202601070531.yJ4x70yl-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070531.yJ4x70yl-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601070531.yJ4x70yl-lkp@intel.com/
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

I posted a series last month to fix this issue.

https://lore.kernel.org/linux-clk/aWA6rNLNqYfJKTzf@redhat.com/T/#t

Brian

