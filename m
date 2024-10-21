Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C81CF285
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495179; cv=none; b=BQclogpUyrSoFkxmE3zq2C617KwsJmtcMCOW432okshCzlGWZHfwn0X993RCjWnj2I8qdZm5pF7VxOKn1Xut/G0JKSkCxtPSdLk/hYk2+0RRYiTBcp2nnoVyAm1zxgY2Ulk8A2F4mkTqcM5ldmR7MWEe9ZTgbMQU2xyLwHkTcsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495179; c=relaxed/simple;
	bh=A4cT04tk6Qpxw/y0XjtON9qAuNPCJvAufgdp//JETJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PI0fxz3HuTKRpEU8CfrWbfEXE2ANOfhAKkLP2UDsDgd+XUI1lf+6iJjj80JtrXdpMxXkcPdIQXnlxnIPUzHIZ+rj55ClZ8x7/LbB7pGPbvWD3H6mYCinF1+3RyliPvL/pXomVnDKHc1WfYMAfc7qbm884d4PMJK9McsZAFwDTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tuRwsXdg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tuRwsXdg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so10651875e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729495175; x=1730099975; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4mG7OtmO6ALnS+LqwK6H+C2vMDexXNqjYjOqwc57+s=;
        b=tuRwsXdgS2Diy6HzTQ+zTPa8YkiBr2H+psLCkFYLlSMv9qK4qjtdPU1wYJOkImDKzt
         x8VIEhR3YTFWlrbDZ8EWqEODWhOf2BIG3mQVtykfE8zyeWj4lYBNSmFg7UFzhMF0SBSw
         7v5rUEHIy+7LPym0kFvvNc7eyS2MR3TLFTKSaHlsyZNhLnuqPUzH7nQIgk9riKKvCG0H
         J1oZw0vl+KtRucFOct98xRK33xsWl8Mw+ghvicPyqy3Ypf/x/1nSZG4D3nBMIjR1QB5d
         joxy1sqCcBv8rumKZPsa8tYS/uz/SEt4smsfAdJt0R8IB3WuQxxyTCpvRUsoCVIUMlPr
         QBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495175; x=1730099975;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4mG7OtmO6ALnS+LqwK6H+C2vMDexXNqjYjOqwc57+s=;
        b=nRJZptMzFNtudROCxOXKCPShCJSFIYOhkWWaJoBM/ULjSsbFtuotuItUQdF0joEHMa
         IoOVZrvx0/3krgXt6s40R0cpc6iRGCT2NUaN5ABoN4LNOYklGhPZhGKq2vaCaHQj9X2r
         t5ZIkEvOHniWTjJcRelen3/7/kxjwx9rywLqKNlpWrn7k/HXbKV9fEU3JNrVQ/ctZAcj
         +MUTwv9hkia822IsN/GlcglV1m4GXRk7F5bbwP6pLu3oZUp6+94iQHe9hBPH0Iqo91hQ
         wm2FqLa9HnWIkcvFir62ywfTZ6zPzPsPSk2kXVvk51jd79phEgTvzWHMHd1iBIQGlFRg
         UnkA==
X-Forwarded-Encrypted: i=1; AJvYcCUfsEOlRQikUFVYxcuzRsaAEm9C0JBHhsvJxKmDOs0yovnEGOPMDTaFELyfvb0/Lu9kxCG7YBXl+1NKJygX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8DNA76fIv9PZh0TenkQRqzinni/uVT/8F7XslZWVXIeBITcGU
	pIn8c/v8cq+w18KeeiMzB/kMf72w02FO1eovzQjnJVD6niGCaEZ0+swZ9zkE5yA=
X-Google-Smtp-Source: AGHT+IE1bmdiEk0vWux62zPzb8bYFDT+mROA8lnQzzHBbtLTh0zkjZe+omLvslbveQ+erNxhecMIrQ==
X-Received: by 2002:a05:600c:4e89:b0:431:60ec:7a91 with SMTP id 5b1f17b1804b1-431616363b0mr76101885e9.2.1729495175283;
        Mon, 21 Oct 2024 00:19:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58aef6sm46951245e9.22.2024.10.21.00.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:19:34 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:19:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Matthew Sakai <msakai@redhat.com>
Subject: drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn: inconsistent
 returns '&pool->lock'.
Message-ID: <717e8949-55c4-4461-8951-3e582e9b77ef@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: f36b1d3ba533d21b5b793623f05761b0297d114e dm vdo: use a proper Makefile for dm-vdo
config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191209.osrd8z9H-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410191209.osrd8z9H-lkp@intel.com/

smatch warnings:
drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn: inconsistent returns '&pool->lock'.

vim +976 drivers/md/dm-vdo/data-vio.c

79535a7881c0cb Matthew Sakai 2023-11-16  958  void vdo_launch_bio(struct data_vio_pool *pool, struct bio *bio)
79535a7881c0cb Matthew Sakai 2023-11-16  959  {
79535a7881c0cb Matthew Sakai 2023-11-16  960  	struct data_vio *data_vio;
79535a7881c0cb Matthew Sakai 2023-11-16  961  
79535a7881c0cb Matthew Sakai 2023-11-16  962  	ASSERT_LOG_ONLY(!vdo_is_state_quiescent(&pool->state),
79535a7881c0cb Matthew Sakai 2023-11-16  963  			"data_vio_pool not quiescent on acquire");
79535a7881c0cb Matthew Sakai 2023-11-16  964  
79535a7881c0cb Matthew Sakai 2023-11-16  965  	bio->bi_private = (void *) jiffies;
79535a7881c0cb Matthew Sakai 2023-11-16  966  	spin_lock(&pool->lock);
79535a7881c0cb Matthew Sakai 2023-11-16  967  	if ((bio_op(bio) == REQ_OP_DISCARD) &&
79535a7881c0cb Matthew Sakai 2023-11-16  968  	    !acquire_permit(&pool->discard_limiter, bio))
79535a7881c0cb Matthew Sakai 2023-11-16  969  		return;
                                                        ^^^^^^

79535a7881c0cb Matthew Sakai 2023-11-16  970  
79535a7881c0cb Matthew Sakai 2023-11-16  971  	if (!acquire_permit(&pool->limiter, bio))
79535a7881c0cb Matthew Sakai 2023-11-16  972  		return;
                                                        ^^^^^^
Still holding pool->lock on these paths.

79535a7881c0cb Matthew Sakai 2023-11-16  973  
79535a7881c0cb Matthew Sakai 2023-11-16  974  	data_vio = get_available_data_vio(pool);
79535a7881c0cb Matthew Sakai 2023-11-16  975  	spin_unlock(&pool->lock);
79535a7881c0cb Matthew Sakai 2023-11-16 @976  	launch_bio(pool->completion.vdo, data_vio, bio);
79535a7881c0cb Matthew Sakai 2023-11-16  977  }
79535a7881c0cb Matthew Sakai 2023-11-16  978  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

