Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF43359703
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555838; cv=none; b=pTsuy0WKmksgi2Ck4h79NizLU/gNgsPtQwGuBK+OKbStEXakShyiAH6n5TjvqW8L21QTOYsRp5CQmeDGSZ+AO1DZJSJqIoxx0rtChgekOJqY1sEvXeaw/wCgJ8GPhVj8Zm2ZugTaRxCEaSPA29ri/o4o6h4kcillkx7pmnqGvdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555838; c=relaxed/simple;
	bh=cvBlKjUi3la4FRQ842NLzR324mE7CJQHgUXi3+al4ow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ftpHQSqvpW3fLlpqMfvfYEKSiJbp5ajxrY3M0/JH4nhlqSodWah7+05GIJxkp58cHUiM9iY1hrR8Me9udg0JFMRDozEw+s330a72bkqbXD5b1ySRnKtjvQ/IOZvT1T2tfA9ZGdGUS1xBMp15jlIxxchTDJ0LYwrk7jkRRE62dCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X2DHhvec; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2DHhvec"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso2920126f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 04:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763555833; x=1764160633; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UbNuZv/5Za3Oc7Abgb1kuQDSQgL1n6Sh6FodFTL94fI=;
        b=X2DHhvecPwP9h8E6JVs5Zk06s6j6SMkv7xlVDbfud+BEdcdjIkCMAvk5u0E6BeNn5A
         st3YKoAHItJ9iXQQTKV4Kc3T2W/w9SaM1vpY54PWtH+U9A/GDAvNGG+QuOXE3oxCFn15
         V9GXOSgBEhLHHQQ434T9fXhOQEapBMFIQoEJEtYbfom+R6vEpfYE+DpM/LgzeoIhgeKs
         SYGD6LYZrmiFqyYsWWOMSoW70Z5rOr72ZdKVIviSrpQgQxTBdOZmNMBhUY/l/wR+k6oV
         Ow7gnShJB7JJx9pkZJvVsRaIPWUbvf5aHQyhaMfL7MygzOePYb9jEym1Rkv0gYoIa5Cw
         +00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555833; x=1764160633;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbNuZv/5Za3Oc7Abgb1kuQDSQgL1n6Sh6FodFTL94fI=;
        b=Hr7zp+/43BIlJaxvr4Nk6wtut02vkKuFn0a/Fk9IV6Ys51eGiyMaGVR8L0wpfW/Pcr
         nIej8POwNRWp3l0cZE6CnM+bbCa1FuwPfki7jLjp0a7aRgegzN3JYJdgFmeyIdovUB+b
         V/SCh2xWMXJxU1Pb9C87gtcVPX2lhtxMvUnaYBgZQIMqnJxY2Mgx/rBGLDr202ZsOpIq
         6h1fhYBhFgiXdEmL3kZJX6MULuCV7qtHPJVkMGf/xlwcdUS/rDVDNck+jdMrfmuVFczf
         4k6hGp9vqZXFq4eQ4UsUxgVkQnpTTGRlFIqjZQlw8hX8IK277NLzUyaGmRrs8UiA1xsd
         G6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLRad8Yj5/1Ttpui6NFp0Ze++5eAOtTvFchemSVKR1Re0hFCGeC7QV9cdx1R5lW2myzWyvGdSlMqjwjneo@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3PUwlxilSfGtbXypLJo/X/fEpXs2hihXFQzdWSQKJ3hkaBfmq
	G0zov18a3b4QFaHOTSITKjGRLydzyCt4XkqMRauQKyY9e2Q2W65TSFFVHaIFB3ZONxk=
X-Gm-Gg: ASbGncvuh+9qSPZDP48YitOXxQUujmq7myE7aqzhp9RgF7PusCJ1dZ29+h6FSaquVQc
	Y/EvxMFdp7zpTph0lOM8n+UaD5IbHd0PV5xM+lUxfHhgcqGx45gcQcVLfsRCLRh7vYurV3zEqN+
	EwwMyDNe7coLn7r1yWYH1zont9IYdyPiV9Kk8nE70c+d66gKcADcP9/w3rQgiiGDCkPBEhGqFiE
	IQPeo/esuFckuqqJge4fpgg3dJIv0RQOWJs6HkVtB0gwaVUYqB40vituNxtIIcce3LeOGUeGeK+
	aaEl89JRM8L/QKLi41j19h6hkgWtxxcD5a2olsikGs7S8xZN4GsmcJzT7gAYI44jJREFdsLy8vg
	N8nn+vMKFvn2enSgdJD9lgqif+85wGupUGFJFfT0+RiFs4JmEzztfkJq+9CYv33B/kC1st4gsXT
	xqtkdf4hi0G2gRJYQZELTJe4HaaaA=
X-Google-Smtp-Source: AGHT+IEkeW7AYIkdag7V6zOou3VntsZM8Hgog/jx8e0yYhvUx47QmrZwYx5wIGi3mp9Al3RK8NbQFQ==
X-Received: by 2002:a05:6000:40c9:b0:429:8b01:c093 with SMTP id ffacd0b85a97d-42b5934f642mr18648197f8f.15.1763555833162;
        Wed, 19 Nov 2025 04:37:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53e846afsm36908546f8f.13.2025.11.19.04.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:37:12 -0800 (PST)
Date: Wed, 19 Nov 2025 15:37:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wei Yang <richard.weiyang@gmail.com>,
	willy@infradead.org, akpm@linux-foundation.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH] mm/huge_memory: consolidate order-related checks into
 folio_split_supported()
Message-ID: <202511151652.GKPwEctt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114075703.10434-1-richard.weiyang@gmail.com>

Hi Wei,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-huge_memory-consolidate-order-related-checks-into-folio_split_supported/20251114-155833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251114075703.10434-1-richard.weiyang%40gmail.com
patch subject: [PATCH] mm/huge_memory: consolidate order-related checks into folio_split_supported()
config: i386-randconfig-141-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151652.GKPwEctt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511151652.GKPwEctt-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:3696 folio_split_supported() warn: signedness bug returning '(-22)'

vim +3696 mm/huge_memory.c

aa27253af32c74 Wei Yang 2025-11-06  3690  bool folio_split_supported(struct folio *folio, unsigned int new_order,
                                          ^^^^
This is a bool function.

aa27253af32c74 Wei Yang 2025-11-06  3691  		enum split_type split_type, bool warns)
58729c04cf1092 Zi Yan   2025-03-07  3692  {
ab62f1bb0caaa5 Wei Yang 2025-11-14  3693  	const int old_order = folio_order(folio);
ab62f1bb0caaa5 Wei Yang 2025-11-14  3694  
ab62f1bb0caaa5 Wei Yang 2025-11-14  3695  	if (new_order >= old_order)
ab62f1bb0caaa5 Wei Yang 2025-11-14 @3696  		return -EINVAL;

s/-EINVAL/false/

ab62f1bb0caaa5 Wei Yang 2025-11-14  3697  
58729c04cf1092 Zi Yan   2025-03-07  3698  	if (folio_test_anon(folio)) {
58729c04cf1092 Zi Yan   2025-03-07  3699  		/* order-1 is not supported for anonymous THP. */
58729c04cf1092 Zi Yan   2025-03-07  3700  		VM_WARN_ONCE(warns && new_order == 1,
58729c04cf1092 Zi Yan   2025-03-07  3701  				"Cannot split to order-1 folio");
28753037121116 Zi Yan   2025-11-05  3702  		if (new_order == 1)
28753037121116 Zi Yan   2025-11-05  3703  			return false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

