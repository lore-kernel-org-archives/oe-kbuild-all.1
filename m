Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C42112F59D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 22:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712702205; cv=none; b=D2b+hQE/SJMsEONZOt/aL5jt/c25qQ85AM3Ki77utLLVrbC7OlOdA1G5VrlfmpfUfUmGVxrtnQSlT2dVKqhKzlydf4Kq0DGeHSvKiXu1YQUmMTtYv9ZkhIYs740cFB3aHGm5jMm44rE371wrUBaqrJZxfwqNKJbqtbFhHiaT4H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712702205; c=relaxed/simple;
	bh=ekmWQXPMS1ofI798+g9KJMBbmIdCWYxH3WwE6dopHvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoqzNN3DvQEplIsy9cQvWkBt3HfnPWkkCvJWh9L+H+9ARAYf6/JkOO+WeYAXipE0erkSELBHf3mFXPwKLLB8PDN8ZTeExizguYwy6uzd4cg22pfSpvYBbWif4hs6xytNI/SVLcBp4r+77BWqpoTOilpG40/AGiGn0AT9+3GDoic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=FCtmrKyI; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="FCtmrKyI"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-69b236a942dso17540496d6.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Apr 2024 15:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1712702200; x=1713307000; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=99sdplKohlye3r4EJyuRnGxNAU41Gs/6WufhBIEtHTM=;
        b=FCtmrKyIXpFtW0xeNbwQITIMErRMSq+A79nnIQTqZoYDQndZgAxhQlhy9jBfMyh/+K
         u7HSbyGUFMNha9m43CletM/Q6glw3jswTFUMT3htOlL5EMPo090YKIPJU/bpAOUlv/f4
         MlZrL9i65hR7oCrQN9uM/pNaQO/eJSPXn5mzzYuUpaqmSFGlCqxvVAlrFvzCpO/5IWeJ
         Pb/PRVApqPo/NADSm02PPZ1ktu3XCTuPyHfRUnh1Zosi+SacgkoPSaK3S8zp80NYo89h
         /Pcrq0WydC4/hIl5b5edTZ1fi3RHKAspQd5mSz7OgcoXEJpNn51v4juDdv/KVqcD/JvQ
         OB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712702200; x=1713307000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99sdplKohlye3r4EJyuRnGxNAU41Gs/6WufhBIEtHTM=;
        b=QpVWr209dcpsKSv66PrZ+irhMqlY2cBlEE5OC6CyDazq1ezkXNN1jDySzfKmm3Tlo8
         N1g07fgb6kZiZ5PqM7Zal9a7K+V7iaHc9qZkMUQ/MnH84dJZH78Vyhz9i+p3WyUZnyNT
         e5HphLmUB9Y+fHDyALh9yxa9gDAwjySdgkb+iGXSiLO4kD+KNp4WxhdLzNmHwBhifdty
         hfHmgc49gDxA+gKeosH/lqZz2y5U8BSgoJaxeZNTvJBl8fe5fvJrG36+TZ6HezcHdgF5
         dL82Vw7o4jCui+W5/AoTws01/aXTb/mn027oTEHBBmA1ppiPZeQw4EqXWT0dqTagnT8f
         pRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7XF8gzdEh0q3WvmZcl0rm0i5PnSdEKkLcUQXbYK41TepxgUZ/QWL00D4m4VzAODf0TFGWcy6G1ilur67JBTyEQPSZyp0+eYUrlYDtCw==
X-Gm-Message-State: AOJu0Yy3eORFzTj5fVR9bbI5c0NUaj0kg8Mmo0kB7hX/+urrrvFaKNBX
	TY7x1iFcBPDeJrWiIVXUMQSxOATvdp/tw4NZsf74rkDyNVymcfLmHQ5BuM76wfQ=
X-Google-Smtp-Source: AGHT+IH3zjPIq/2rU2Q+QMQhrWtdTesHopSX764fJEFz7KNJ8EcquWTJaKtRksgWvIZKZKBshA04Eg==
X-Received: by 2002:a05:6214:5602:b0:699:45f3:d3a7 with SMTP id mg2-20020a056214560200b0069945f3d3a7mr6376509qvb.16.1712702200125;
        Tue, 09 Apr 2024 15:36:40 -0700 (PDT)
Received: from localhost ([2620:10d:c091:400::5:6db8])
        by smtp.gmail.com with ESMTPSA id p24-20020a05620a057800b0078d6c4b0b3bsm1153406qkp.26.2024.04.09.15.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 15:36:39 -0700 (PDT)
Date: Tue, 9 Apr 2024 18:36:38 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: kernel test robot <lkp@intel.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, vbabka@suse.cz,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, david@redhat.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	mgorman@techsingularity.net, ying.huang@intel.com, ziy@nvidia.com
Subject: Re: [PATCH] mm: page_alloc: consolidate free page accounting fix 3
Message-ID: <20240409223638.GD1057805@cmpxchg.org>
References: <a2a48baca69f103aa431fd201f8a06e3b95e203d.1712648441.git.baolin.wang@linux.alibaba.com>
 <202404100519.mVXXF6kV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404100519.mVXXF6kV-lkp@intel.com>

On Wed, Apr 10, 2024 at 05:15:01AM +0800, kernel test robot wrote:
> Hi Baolin,
> 
> kernel test robot noticed the following build errors:
> 
> 
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20240409-154935/Johannes-Weiner/mm-page_alloc-remove-pcppage-migratetype-caching/20240321-020814
> base:   the 10th patch of https://lore.kernel.org/r/20240320180429.678181-11-hannes%40cmpxchg.org
> patch link:    https://lore.kernel.org/r/a2a48baca69f103aa431fd201f8a06e3b95e203d.1712648441.git.baolin.wang%40linux.alibaba.com
> patch subject: [PATCH] mm: page_alloc: consolidate free page accounting fix 3
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240410/202404100519.mVXXF6kV-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100519.mVXXF6kV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404100519.mVXXF6kV-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/page_alloc.c:808:54: error: too few arguments to function call, expected 4, have 3
>      808 |                         account_freepages(zone, -(1 << order), migratetype);
>          |                         ~~~~~~~~~~~~~~~~~                                 ^
>    mm/page_alloc.c:645:20: note: 'account_freepages' declared here
>      645 | static inline void account_freepages(struct page *page, struct zone *zone,
>          |                    ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      646 |                                      int nr_pages, int migratetype)
>          |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.

Looks like a false alarm because the test bot didn't pick up the
fixlet to remove the page parameter from account_freepages():

https://lore.kernel.org/all/20240327185831.GB7597@cmpxchg.org/

It's right in Andrew's tree.
