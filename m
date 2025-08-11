Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF47D284687
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754895658; cv=none; b=heX1TRWpxrvmFCxTFWNuHMCRkS9BPknPWUg1A9PmOXrfOKEgPCDMqElRY2OrDGhmcZtyoKg+q7Iq6QROZfxcaoML61FhsQZV5FV+3/7WOqjZXbm0b19qK01iZ1th2OiUsqif2jRE+Rv0QowTVQtLjz6hnJgNlzHpGanuQuLv4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754895658; c=relaxed/simple;
	bh=4TXBlBGQNvA7bt3BXu4K6a+JVORCJDofx4zHmkOthDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Y9Mg6ha2FHeaHfG4zoOjj0Zcqs3Bb79YTotYEJcGHg3C4OMbN139AkZLP7Jza0oPBiU/4n+5wolXafdM9xHuBTy/evWYv792e2QIN+tDfdlvpu+tQ5BWVKZwyC7uqvjP82aHCCynyR80uC6gWadHvPojnQ28tGGs0xn7ilTTNZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QZADU1AR; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZADU1AR"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b785a69454so2197438f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 00:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754895655; x=1755500455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hwWzDFSbMSy9EZ6eh9Z+w3E0hJBaTZziN3cHZhQKeU=;
        b=QZADU1ARNcg++g4a52S4MBOfLPRP3h5KY0kLMMRdvNKbnRqo4HsQFFcSplidTvFvAu
         73LfuacQ7utdViAGlldw+KPqookqboph352UWuGF1BrgOjY5crtRf/6aiOiPT7hRhW8O
         UFPUCsvAonDeMeAZHReMDZJxsLXRsAM9Op1JP2mVfSmtkyDL2tSRgUJy2kLIqzBdPPNS
         ZF8Wrxw6D8n24tGuFeKh5Vkyu8v91cxSAt/4BjUnVZby2BYu/5aIp5Fzjlrj63H7F6lZ
         gW5e0P7aG2UGzNMR11YNjLBOrZiX8FVguYR60bxj83Qg65tsmWVAKNWVTMugzLkdyj8f
         qzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754895655; x=1755500455;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hwWzDFSbMSy9EZ6eh9Z+w3E0hJBaTZziN3cHZhQKeU=;
        b=Hr53M0jhLR3FU1QgYK4beraJlYHDPNgjDWvjgA+eblmAissHYdLWSCWE/AWxq+ON8h
         +SMExkDbZnwoM0X9yrFdXogglj1HACO2LyAKfctXr3e6yWx7xJK2knc2wceOKSnHtwRD
         X3/Vcq6Yg+S2hyHOFcysSW7cRLg+Rr5t6Wzt4pR7dkIaDHqBCtH2pJcvUMBwAiqbc/cU
         Bw+4k5yGYG1N07cXZFbreBNpwSGObmMJwKBX7li5Hu1A528ypo2NMWMVQle8aaFADWTU
         v6LSpyeGpo+N5kXWYuNkfVWIHfIULSYgT4cBC7dvwEh0sDhVK+Sa4rpwgddUWC2gl9lo
         aZtw==
X-Forwarded-Encrypted: i=1; AJvYcCV3XidM34n8xZ/viY/3ftD3z3BbTlu9WApiAOkZ72dKRZIyRRIRlBHh2p889ZnhTHpsk7k52zab5MgycCJ2@lists.linux.dev
X-Gm-Message-State: AOJu0YxP0U4gkDRUiinBCdpil5XcmWQ1LaIwChkAXLssuvaRkSxi7jCJ
	vgF4Z8Y5bIqg7gZTZdoTKcy5KrsipzUCTyiJF1qRwNRPZata/w+9HX598bTwKOANazw=
X-Gm-Gg: ASbGncvlkwdu38nX2wzgEO3ShBAVvk0ORja7L8uL4a+e3Ey4Hc9ClUWTjJsfgd6j64u
	JNRDgY/AD9aJp8q+8RWIV69RQomEW5sGEW9v1Z5H5n1K8ZlDGuOb+wzDT5zH03S+VWstN5o1Tum
	j7abTfeUnGzqhDDsZPZ+XysxYUIZ1Of4S2b6pkmewxKPzmsG3AidhpVB4z02tbHQwKXzG+eQBly
	w0dQOS3iJb8K5K0dNjHL+8dliJk7ww+SjShtHr+LH2pNBSlqsaJHse+cw3HJQiUXa0/GLJ6j3NM
	Z5GEvXKIzqtDC9SVgwRTzAcwAFpAYIXwRQEIv0iRU7HGyCBJ72Qt/+6n8tBnjQOYFgkZRsunDUT
	vrp44giVA0a5mPBc1ZG6FKj3atk/fV3xBqW5QKQ==
X-Google-Smtp-Source: AGHT+IHRURi+b8G7dagGCHr+89qFgRkhvYaQGSCmp70FV+PfG/xE/6yTSPpoTAWNO1orRt9InmbSaA==
X-Received: by 2002:a05:6000:40ce:b0:3b7:c703:ce4 with SMTP id ffacd0b85a97d-3b900b6aad8mr8041910f8f.59.1754895654564;
        Mon, 11 Aug 2025 00:00:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459dc900606sm305322985e9.15.2025.08.11.00.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:00:53 -0700 (PDT)
Date: Mon, 11 Aug 2025 10:00:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bijan Tabatabai <bijan311@gmail.com>,
	damon@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, sj@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>, corbet@lwn.net,
	Bijan Tabatabai <bijantabatab@micron.com>
Subject: Re: [PATCH 2/5] mm/damon/sysfs: Implement a command to only commit
 scheme dests
Message-ID: <202508101330.XRQqvfiN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805162022.4920-3-bijan311@gmail.com>

Hi Bijan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bijan-Tabatabai/mm-damon-core-Add-damos_destroy_dests/20250806-120845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250805162022.4920-3-bijan311%40gmail.com
patch subject: [PATCH 2/5] mm/damon/sysfs: Implement a command to only commit scheme dests
config: microblaze-randconfig-r072-20250810 (https://download.01.org/0day-ci/archive/20250810/202508101330.XRQqvfiN-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508101330.XRQqvfiN-lkp@intel.com/

smatch warnings:
mm/damon/sysfs-schemes.c:2605 damos_sysfs_set_schemes_dests() warn: iterator 'i' not incremented

vim +/i +2605 mm/damon/sysfs-schemes.c

8014d822c9939b Bijan Tabatabai 2025-08-05  2601  int damos_sysfs_set_schemes_dests(struct damon_sysfs_schemes *sysfs_schemes,
8014d822c9939b Bijan Tabatabai 2025-08-05  2602  		struct damon_ctx *ctx)
8014d822c9939b Bijan Tabatabai 2025-08-05  2603  {
8014d822c9939b Bijan Tabatabai 2025-08-05  2604  	struct damos *scheme;
8014d822c9939b Bijan Tabatabai 2025-08-05 @2605  	int i = 0;
8014d822c9939b Bijan Tabatabai 2025-08-05  2606  
8014d822c9939b Bijan Tabatabai 2025-08-05  2607  	damon_for_each_scheme(scheme, ctx) {
8014d822c9939b Bijan Tabatabai 2025-08-05  2608  		struct damos_sysfs_dests *sysfs_dests;
8014d822c9939b Bijan Tabatabai 2025-08-05  2609  		struct damos_migrate_dests dests = {};
8014d822c9939b Bijan Tabatabai 2025-08-05  2610  		int err;
8014d822c9939b Bijan Tabatabai 2025-08-05  2611  
8014d822c9939b Bijan Tabatabai 2025-08-05  2612  		/* user could have removed the scheme sysfs dir */
8014d822c9939b Bijan Tabatabai 2025-08-05  2613  		if (i >= sysfs_schemes->nr)

i is always zero.

8014d822c9939b Bijan Tabatabai 2025-08-05  2614  			break;
8014d822c9939b Bijan Tabatabai 2025-08-05  2615  
8014d822c9939b Bijan Tabatabai 2025-08-05  2616  		sysfs_dests = sysfs_schemes->schemes_arr[i]->dests;
8014d822c9939b Bijan Tabatabai 2025-08-05  2617  		err = damos_sysfs_add_migrate_dest(&dests, sysfs_dests);
8014d822c9939b Bijan Tabatabai 2025-08-05  2618  		if (err) {
8014d822c9939b Bijan Tabatabai 2025-08-05  2619  			damos_destroy_dests(&dests);
8014d822c9939b Bijan Tabatabai 2025-08-05  2620  			return err;
8014d822c9939b Bijan Tabatabai 2025-08-05  2621  		}
8014d822c9939b Bijan Tabatabai 2025-08-05  2622  
8014d822c9939b Bijan Tabatabai 2025-08-05  2623  		damos_destroy_dests(&scheme->migrate_dests);
8014d822c9939b Bijan Tabatabai 2025-08-05  2624  		scheme->migrate_dests = dests;
8014d822c9939b Bijan Tabatabai 2025-08-05  2625  	}
8014d822c9939b Bijan Tabatabai 2025-08-05  2626  
8014d822c9939b Bijan Tabatabai 2025-08-05  2627  	return 0;
8014d822c9939b Bijan Tabatabai 2025-08-05  2628  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

