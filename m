Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206721A459
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 13:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741355932; cv=none; b=nnByYb3Mj0W/b4N773PpZqZpjEJgHHooIfa1Qyo3OA4jBsfd3A/oYPU/l7jOyySO3AScVV+lvEUCQsaRlxxcGnhHr5rtO8uBcITpuxO3NQOO6G5TUpk8vPkFGEtGGNS0O361kDrV9RmjGmfXHMRSeAKh7KFSQ9ADnQ35KADYNI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741355932; c=relaxed/simple;
	bh=LgdGyBjxDWXmoa9HcdXIpGcy9TdkkZ9WRcWjI+eTOWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IfZRBvVOrgMiWrn31blfv9/wRJ3l/rzz/o88jkYo0wVNFJbJW71S4pblAPcjOp9Mtd4xPvcYK16xOQOP1tr+eOqnB6G5bWkGrbzoUNFgebYdrRMgJrk74xbLVKkkwPb4XlG/Il//uC4Ltcs/RPlEd00WA+oMKjNiuLlYDK7yG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PKNVkO0d; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PKNVkO0d"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-390f69f8083so1603699f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Mar 2025 05:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741355928; x=1741960728; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9EGxfAWzHmc0n2XcMsv4xyGAchxM7sK9Sox0qv/mbjM=;
        b=PKNVkO0dkaxrB30hoV+MOm0MqXLDrf9Ogw5OLXCcALHeu14bi5rFJ+hSdQfLLyVZbx
         neeaHS5lXuOuuDfhty4LcA1qnu6yQnXAh/sTe0IFPWKu/xxyYzWMGbPmbk9c5NPMSYSM
         nY/xbyS6svGXDXNQDzK39WndDh5QpBuRErQV5as1WyRTR+5tCABxyO4ipZeXvz/nk6xT
         xIfzaYh7XMFwHWQJgEOUAYZHWwQXRZxFbjF8hPDRuX078rYe9GY8p01Gdlu5vPWgKVMD
         qp01ZnmuxNDt2M8zT/qZI7DzHBwtAvgdAPXo0TeYowz/erAtGJeCAEnA8uzkKFypSQx1
         1KKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741355928; x=1741960728;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EGxfAWzHmc0n2XcMsv4xyGAchxM7sK9Sox0qv/mbjM=;
        b=qUdJtiyoeRmY4+Q/UViB7Ciig+s8Or7mHxE4VLeuWB1vlmPy9o+UyXSjEAOGqbpTpt
         kP/iq4OL0Ropey27GHtS84l5Mdca5hXgLAT4j/1IC+o3tRuHyk6eXjXF0Dka2b09OFLQ
         CNUEac5VkdKrkrDpK2VOfeMzoRXryVMg3boK6hEmYvkdodphFJxVx2f+C3T3sD3XQ12w
         lGiWQXcB8A5Ixn20uZVdLShXiFoHMPQEDc7Tm02d/5LT55Wn69R5IP8F0LxaJUHTgL5a
         Wbo20Q/N4YTyVwGBcF+iIlXNjQVqJboBPfvJ8A0AZIiouOeE1zA4pUWyuB+P/apkMtH4
         Hx3w==
X-Forwarded-Encrypted: i=1; AJvYcCXPJnVeMC2FtICfFEQXKFcQMOio7nydvUEoqhqK/AVFZF8a+RDj9URGfWCpgUIlThSMxvc1hZvPQfEgfkgm@lists.linux.dev
X-Gm-Message-State: AOJu0YxTIWGDdxnb7FmNR1gwJ7nBb339tlAVH6X9rh1nwCTcEWJwtGvV
	7KiYHtlVu5zJBkndt+Q9Mh7SF7MsANTRiH+2P1AauoGsJ45p7zyfP2QL5VY3RaM=
X-Gm-Gg: ASbGncuFSwakT+0QeCc0XubOPbPRqpOWOf5YyvWaJR/5BANeTU3oxztUaBXhqWwo+0b
	PpfHyNIhqiVwaE11FJDU+2UBwzMHgMwXHOeF7OsEWqjsvn7Q8m8xlzSaL3hG56Dno1ElDIyEHzQ
	5jePTLTaXNGjYpFu8MgYSF3I+6d5qoIQnlKT4tGgGvKAx0oWIbR6IyMobXp0oQQy437S83F0JlJ
	mYb+NfrSym7H959Rc5YlOAkK9Fg7xkpmYJXUvG32eLBvSoOVTOqrewVBcDCauzqzyjyvY/WU+/9
	2T+wZIgPkFl5XKJnxrw94LhQoFBmTP5kEPWqcChpGIUIF/EoZQ==
X-Google-Smtp-Source: AGHT+IHob9xSwHZHxbIGxOhr+1B8/H6WPDLiz5T5TIbPy4IHpRxIEmfhrIuEHRHdzuZcNtNspVmeNA==
X-Received: by 2002:adf:8bd7:0:b0:391:39bd:a381 with SMTP id ffacd0b85a97d-39139bda886mr202282f8f.30.1741355928133;
        Fri, 07 Mar 2025 05:58:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfb7aefsm5371321f8f.20.2025.03.07.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:58:47 -0800 (PST)
Date: Fri, 7 Mar 2025 16:58:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Julian Sun <sunjunchao2870@gmail.com>,
	linux-xfs@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, cem@kernel.org,
	djwong@kernel.org, Julian Sun <sunjunchao2870@gmail.com>
Subject: Re: [PATCH 1/2] xfs: remove unnecessary checks for __GFP_NOFAIL
 allocation.
Message-ID: <398b4241-bef5-4270-9fff-204e528b76fb@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228082622.2638686-2-sunjunchao2870@gmail.com>

Hi Julian,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Sun/xfs-remove-unnecessary-checks-for-__GFP_NOFAIL-allocation/20250228-162815
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20250228082622.2638686-2-sunjunchao2870%40gmail.com
patch subject: [PATCH 1/2] xfs: remove unnecessary checks for __GFP_NOFAIL allocation.
config: sh-randconfig-r073-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072035.d6QqiZWT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503072035.d6QqiZWT-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_mru_cache.c:360 xfs_mru_cache_create() warn: variable dereferenced before check 'mru' (see line 338)

vim +/mru +360 fs/xfs/xfs_mru_cache.c

2a82b8be8a8dac David Chinner     2007-07-11  314  int
2a82b8be8a8dac David Chinner     2007-07-11  315  xfs_mru_cache_create(
22328d712dd7fd Christoph Hellwig 2014-04-23  316  	struct xfs_mru_cache	**mrup,
7fcd3efa1e9ebe Christoph Hellwig 2018-04-09  317  	void			*data,
2a82b8be8a8dac David Chinner     2007-07-11  318  	unsigned int		lifetime_ms,
2a82b8be8a8dac David Chinner     2007-07-11  319  	unsigned int		grp_count,
2a82b8be8a8dac David Chinner     2007-07-11  320  	xfs_mru_cache_free_func_t free_func)
2a82b8be8a8dac David Chinner     2007-07-11  321  {
22328d712dd7fd Christoph Hellwig 2014-04-23  322  	struct xfs_mru_cache	*mru = NULL;
2a82b8be8a8dac David Chinner     2007-07-11  323  	int			err = 0, grp;
2a82b8be8a8dac David Chinner     2007-07-11  324  	unsigned int		grp_time;
2a82b8be8a8dac David Chinner     2007-07-11  325  
2a82b8be8a8dac David Chinner     2007-07-11  326  	if (mrup)
2a82b8be8a8dac David Chinner     2007-07-11  327  		*mrup = NULL;
2a82b8be8a8dac David Chinner     2007-07-11  328  
2a82b8be8a8dac David Chinner     2007-07-11  329  	if (!mrup || !grp_count || !lifetime_ms || !free_func)
2451337dd04390 Dave Chinner      2014-06-25  330  		return -EINVAL;
2a82b8be8a8dac David Chinner     2007-07-11  331  
2a82b8be8a8dac David Chinner     2007-07-11  332  	if (!(grp_time = msecs_to_jiffies(lifetime_ms) / grp_count))
2451337dd04390 Dave Chinner      2014-06-25  333  		return -EINVAL;
2a82b8be8a8dac David Chinner     2007-07-11  334  
10634530f7ba94 Dave Chinner      2024-01-16  335  	mru = kzalloc(sizeof(*mru), GFP_KERNEL | __GFP_NOFAIL);
2a82b8be8a8dac David Chinner     2007-07-11  336  
2a82b8be8a8dac David Chinner     2007-07-11  337  	/* An extra list is needed to avoid reaping up to a grp_time early. */
2a82b8be8a8dac David Chinner     2007-07-11 @338  	mru->grp_count = grp_count + 1;
10634530f7ba94 Dave Chinner      2024-01-16  339  	mru->lists = kzalloc(mru->grp_count * sizeof(*mru->lists),
10634530f7ba94 Dave Chinner      2024-01-16  340  				GFP_KERNEL | __GFP_NOFAIL);
2a82b8be8a8dac David Chinner     2007-07-11  341  
2a82b8be8a8dac David Chinner     2007-07-11  342  	for (grp = 0; grp < mru->grp_count; grp++)
2a82b8be8a8dac David Chinner     2007-07-11  343  		INIT_LIST_HEAD(mru->lists + grp);
2a82b8be8a8dac David Chinner     2007-07-11  344  
2a82b8be8a8dac David Chinner     2007-07-11  345  	/*
2a82b8be8a8dac David Chinner     2007-07-11  346  	 * We use GFP_KERNEL radix tree preload and do inserts under a
2a82b8be8a8dac David Chinner     2007-07-11  347  	 * spinlock so GFP_ATOMIC is appropriate for the radix tree itself.
2a82b8be8a8dac David Chinner     2007-07-11  348  	 */
2a82b8be8a8dac David Chinner     2007-07-11  349  	INIT_RADIX_TREE(&mru->store, GFP_ATOMIC);
2a82b8be8a8dac David Chinner     2007-07-11  350  	INIT_LIST_HEAD(&mru->reap_list);
007c61c68640ea Eric Sandeen      2007-10-11  351  	spin_lock_init(&mru->lock);
2a82b8be8a8dac David Chinner     2007-07-11  352  	INIT_DELAYED_WORK(&mru->work, _xfs_mru_cache_reap);
2a82b8be8a8dac David Chinner     2007-07-11  353  
2a82b8be8a8dac David Chinner     2007-07-11  354  	mru->grp_time  = grp_time;
2a82b8be8a8dac David Chinner     2007-07-11  355  	mru->free_func = free_func;
7fcd3efa1e9ebe Christoph Hellwig 2018-04-09  356  	mru->data = data;
2a82b8be8a8dac David Chinner     2007-07-11  357  	*mrup = mru;
2a82b8be8a8dac David Chinner     2007-07-11  358  
2a82b8be8a8dac David Chinner     2007-07-11  359  exit:
2a82b8be8a8dac David Chinner     2007-07-11 @360  	if (err && mru && mru->lists)
                                                                   ^^^

d4c75a1b40cd03 Dave Chinner      2024-01-16  361  		kfree(mru->lists);
2a82b8be8a8dac David Chinner     2007-07-11  362  	if (err && mru)
                                                                   ^^^
I normally wouldn't hit forward on this zero-day bot thing because it's
obviously harmless.  But since you're removing NULL checks you could
remove these two too if you want.

d4c75a1b40cd03 Dave Chinner      2024-01-16  363  		kfree(mru);
2a82b8be8a8dac David Chinner     2007-07-11  364  
2a82b8be8a8dac David Chinner     2007-07-11  365  	return err;
2a82b8be8a8dac David Chinner     2007-07-11  366  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

