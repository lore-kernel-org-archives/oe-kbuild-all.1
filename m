Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B06B31ED9C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555950; cv=none; b=IDadfuTr/3ryyXIYQ8fTw+1atcAuULl7Ks8DxWgJdpXGcxG7Kv5nlw0M4pBbMKi9E3o+SwxKTtTcNns6xVTlNtdc3nv+a7oOSeY/+QJ5ECMQCpopuSX8BKvEq2fbGrW9lG1EoAjES1EYQM5U8IJZ0yIiB52U//KVVuTvz87KPwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555950; c=relaxed/simple;
	bh=5gFeZNgqrsMX6jwOkCEQwUdo7/X9FYun+sRtuOCorE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab/0mTZGnLItUmzaqLUdFiHAhcBq/AMbWAj5UDX2h5jZ+++svAh5Qi6MJB64VFI9OxpG6Cf9M/BOi8CBVwMXWgNVktEXo5N3d18NDpAU+/J/Os5DhpFrFSi4OTkg8VxzAKO4f3fx8VAWDj0Z9EqQoyr3jLCRXPfG2RYdjno13YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APm3CLBC; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APm3CLBC"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so11747039a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 04:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763555946; x=1764160746; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHvebzZNHtF5Uirfhl1zM1fOdHCkj14yEnqWrebk/Qs=;
        b=APm3CLBCJOgcyd4P3ylL7OewcRYjgSWK8XL0zqPuEuEMxerVs54U6H+rPzYmIX9fK4
         9i8zzTIzsN8yXSAWMehWej34BRoVWrIOApEH6FZtD3mKCrQYK9wDpIpuog862SzTAdoE
         SZqI+t3Ksg+K+4v/v1yzmvNJQEUT7pfMkwmWi8hvC2EAsrupDpJEhzA8sD/v0DtZuNmv
         LFyuC4SQ1NFqHMYumlM2LiEzIJWhxi4bSLa1MOC3EcnBQk/pT1/P68S5EftSwg9s2hdC
         yqKVcTImsCJi/fdM4+8rK1XbSsoVYeA8Lp86X/PklWeuL1VT/czj6aH7rT4r0ehCHWbc
         84/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555946; x=1764160746;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHvebzZNHtF5Uirfhl1zM1fOdHCkj14yEnqWrebk/Qs=;
        b=Qt1PNGZGKWzbI7AIjIZvBl2c6Eevmi9RQm+P19j+xD1p+yr1gFSoGQdPuyD67CWup2
         5rCNlvruz70lKQBmOGHr3GtRs1EzBh/jASHEKtAAKdCOm8aj3M8hvr/ER8orvZ9p4ifv
         Xzd8Lw6NelVIC7cfnRvl07KpMGkn0ZIu1rWBq4Hxlm41aDQd1gBg39eJ6s082hC1bOlV
         eaXwHsbwRIZsQXy/A3bcPNGlA3QYjhaBB08bPxH8bqWm8JyTbrSYEm0BMtCoUnSEI4Kj
         +RoTTClRY3IZ/MXDnd8asnPVV+9cC38twZU+rbSn1D+B5oppPsZSj7F0rgG+aOcW6FV+
         kdDA==
X-Forwarded-Encrypted: i=1; AJvYcCVZDfq9+NQ0tLjDnT7m1AGQFJEDERcan4KjGshSnq4qQPU86tHQev+gJAAyGbiJl6inteq+cR8RsxpyavOO@lists.linux.dev
X-Gm-Message-State: AOJu0YxHf568NQgNk9PuDG3LSoWR5N8qRWZ+Eulp5bgrcRsBoaeJN6xQ
	rh/CdD97QjQPfQgAZPcAvmYjEH5PYCQsUKBGm6K8KtLWdh/Ln0Ndf253
X-Gm-Gg: ASbGnctx6BAYmRmpOcWphoA9cTSJEWttXV+PkvhvGcWaMbHX7MEetYSJusEQobEgqFf
	uj54bb1so3A3NCGL1dWKpuCQ6kgdzm8jjaPlmI/1rFN0qL5Zyv1eQY4U3ORJdD3TxMtC48fyTBr
	Jz5hoFsQMDZJlnDpd+6cJJ0ARua1j6tcmcWGnOtPt7vwdKuLtHL/irWJFKmEJQ9XaTH48K28ZI2
	JR97X2/2vpo4EVYx15OWC/bh4UAeGXmRU685KGnY7N9r6FmTtxP+OF4r6Sa/IVpp979We1igwu/
	+EkabKZF/uI3CH21Tu1IzAFrgcQjXY9I7yR71XaYePTjf2FQi2Mg6xkeH4mfVzIfSPzcRIRHit/
	apGWaUO9ZBpl0kLXWGKALuf/sSKS8cskH3UVnbY29YuMbCI0HblzcGZyJyC/zdzmRjKplpdfBRu
	5FPT9N7uwaEhOGZHpk8gbT02NH
X-Google-Smtp-Source: AGHT+IH6kOS0l+EUbnypOaJgGizNY/obs0hzloB1TKPSHs9xqLDPIWs5NS3ucRiDjUds0rraP+UpiA==
X-Received: by 2002:a05:6402:354d:b0:640:ef03:82c9 with SMTP id 4fb4d7f45d1cf-6451e36df53mr2153224a12.11.1763555945740;
        Wed, 19 Nov 2025 04:39:05 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f96e2sm14975912a12.16.2025.11.19.04.39.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Nov 2025 04:39:05 -0800 (PST)
Date: Wed, 19 Nov 2025 12:39:05 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Wei Yang <richard.weiyang@gmail.com>,
	willy@infradead.org, akpm@linux-foundation.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/huge_memory: consolidate order-related checks into
 folio_split_supported()
Message-ID: <20251119123905.ak67ykufvfr4iulr@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20251114075703.10434-1-richard.weiyang@gmail.com>
 <202511151652.GKPwEctt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511151652.GKPwEctt-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Nov 19, 2025 at 03:37:09PM +0300, Dan Carpenter wrote:
>Hi Wei,
>
>kernel test robot noticed the following build warnings:
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-huge_memory-consolidate-order-related-checks-into-folio_split_supported/20251114-155833
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
>patch link:    https://lore.kernel.org/r/20251114075703.10434-1-richard.weiyang%40gmail.com
>patch subject: [PATCH] mm/huge_memory: consolidate order-related checks into folio_split_supported()
>config: i386-randconfig-141-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151652.GKPwEctt-lkp@intel.com/config)
>compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>| Closes: https://lore.kernel.org/r/202511151652.GKPwEctt-lkp@intel.com/
>
>smatch warnings:
>mm/huge_memory.c:3696 folio_split_supported() warn: signedness bug returning '(-22)'
>
>vim +3696 mm/huge_memory.c
>
>aa27253af32c74 Wei Yang 2025-11-06  3690  bool folio_split_supported(struct folio *folio, unsigned int new_order,
>                                          ^^^^
>This is a bool function.
>
>aa27253af32c74 Wei Yang 2025-11-06  3691  		enum split_type split_type, bool warns)
>58729c04cf1092 Zi Yan   2025-03-07  3692  {
>ab62f1bb0caaa5 Wei Yang 2025-11-14  3693  	const int old_order = folio_order(folio);
>ab62f1bb0caaa5 Wei Yang 2025-11-14  3694  
>ab62f1bb0caaa5 Wei Yang 2025-11-14  3695  	if (new_order >= old_order)
>ab62f1bb0caaa5 Wei Yang 2025-11-14 @3696  		return -EINVAL;

Thanks, this is noticed.

>
>s/-EINVAL/false/
>
>ab62f1bb0caaa5 Wei Yang 2025-11-14  3697  
>58729c04cf1092 Zi Yan   2025-03-07  3698  	if (folio_test_anon(folio)) {
>58729c04cf1092 Zi Yan   2025-03-07  3699  		/* order-1 is not supported for anonymous THP. */
>58729c04cf1092 Zi Yan   2025-03-07  3700  		VM_WARN_ONCE(warns && new_order == 1,
>58729c04cf1092 Zi Yan   2025-03-07  3701  				"Cannot split to order-1 folio");
>28753037121116 Zi Yan   2025-11-05  3702  		if (new_order == 1)
>28753037121116 Zi Yan   2025-11-05  3703  			return false;
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

-- 
Wei Yang
Help you, Help me
