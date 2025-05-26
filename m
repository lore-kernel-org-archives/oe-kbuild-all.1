Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8361FFC46
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262770; cv=none; b=pZbctTJn5BhM6Hbb9reY1VWdX4Gbx8g5A2zlmfIrhOJFKWWTgMizfHeTopwE7nCOecnC2FD3CasD6WPSaXVsLFuXFl9aLkLmJii8MSpPYC+OL067iYZf79Z+KknBkiKzBTf1/VMtky++QG7il9t1bU2n8jEHcTZ1JYxC5fuXKWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262770; c=relaxed/simple;
	bh=LyJ+ndHdNNArdfM2pwhYm9icCIe3xNaf4LRyeL/e41U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmzLtqXw3NMtcBIZQvSjGFr03loUyxKhxXuOSKgs+H4cr/o6S7a/2oXmHJ976gefN7MJI61WponE3zq1y8z5W9mK+5awZYanl8htmkkpBD67MAmr4alu7QcIzrrEW9kuLZZR0VNZyWxZTrwHBfcLD3Jdh9Urzh3CU2Gb8S+x1Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXesNs6K; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXesNs6K"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so15181165e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748262766; x=1748867566; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cX5NeMJ07Z7hPjhpKLdgFWf1Bt2nqdKYkwaeZMAZl5w=;
        b=TXesNs6K9VO/CAcEybCx7GxQxEw4NJ8m2pqi+sznuwA/3d/9ocR5z6GoHNG0pyhYIc
         ICAjwI6u96OyVMYuEpJJ0WOwxxTIq0JD+ElZzuEE4yzzq5u4OAFAzg9hUNInSq4VFK3Z
         V7UEgefvtb6Zcyljq+c7wn/k3N4XNzOekiuTkNsg5TWfo5J4m91Wo2NEX9HmsAMd8Z8A
         mOTpZy4D8wJJBTcVKSzSDqTMFz1q9oXe/2F/j4Pk8P0YUcNw5QTe4NHZa0mol69Wryv8
         Gj5OFUSjXloIuVsgw7/wMSZm45D88D4f1VqulQBLCYdrudZ1xGV/WgM7xiV+ECavZwG2
         G9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262766; x=1748867566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX5NeMJ07Z7hPjhpKLdgFWf1Bt2nqdKYkwaeZMAZl5w=;
        b=A/sSre21pNvAiIBm0NPm2oeGOihYuWc41UPTycqpsnrAbyVPQliqc3+KFeKpNYA82l
         aP6JUuaC/FwzsqKuxMD0DjBKd01W281sosphNRGQ7IyinCTGhub2Kt1L4WlA8IKzNzyb
         hgU3JlmuoG/VTpzf6gPvmPDiuo6it78R+PSoeqU8a5KmVRyGNXWALhhWSVVXBvQxZTHA
         1ffIQL1nPaGJGlSZHiQhenevFVz7m48jiNBZ0R3wZvyVWk72nvj/yDB2/19m5pNRgPLO
         HlrwbqbWYM3lR6t+NXwrTtv2giNfKgb5ql6TxRjKzoO0dJzjjdQOgmGQ8XOOCseJwkZX
         pM1w==
X-Forwarded-Encrypted: i=1; AJvYcCU+0l1r46SWhOfCC1fzYLu/ew6itouroAjvRNImxx7gN4ZHl13PGYJu8ZjRM3n+KYgy//7XkcDdAVKK5uQ9@lists.linux.dev
X-Gm-Message-State: AOJu0YzcP+Or+ZcpUg1kjR61PxF3k8xZXVlsoy+bFrDHT/Rm0QL99leh
	wvyAzms3nE/h23KcD2MuLc6y4pJK9syaF8Vc/Rm4I2WwRmtWA/cQ5qQYKShr12Hgrhc=
X-Gm-Gg: ASbGncu+zZcp0FaQD5ULEC3a20YgxtepurY5vlxcIdDbJaMCNXwKmm9EUZxHvtHpOcw
	TtSZThJ1S8NI661oMXjMvYvd4aZCHsxcDlc4LY9ioV3aPNyKk5O8fELzGxyNnyqFgVGFb/nZxq6
	wHTaziyrmfYCKyxDiQY83aDpqS8BhqSmoN8YeJ7XFvYIK4+aCh4idaUgsEgKa7pD/JOHUaaJ4/k
	pY3xMHnJ1Nux3BJmTbzenkNU2WFsI+JYzLdyxnix1J/aRUQa3mIwo3XHqbaD2GYM/iFhSEN+H43
	JLzvpU+Hdw1D0gjhaCciWVarQ/1k/umKfcMt9hbdDV6g5DyIBgXDq3nw
X-Google-Smtp-Source: AGHT+IF6jnHUeJLMem7dFDtWplrd9BhhtwxXTTdVE3bJLYOHTU+Nm8qMT01la8e5pMTT4rhXoGFI1w==
X-Received: by 2002:a05:600c:4e4d:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-44c94c2a5famr86772495e9.31.1748262766419;
        Mon, 26 May 2025 05:32:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4dc7e69c8sm1707374f8f.95.2025.05.26.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:32:46 -0700 (PDT)
Date: Mon, 26 May 2025 15:32:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild@lists.linux.dev, Yu Zhao <yuzhao@google.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol
 'dirty'.
Message-ID: <aDRfak8sX1Pf53Pg@stanley.mountain>
References: <202505152339.fBOfDPsi-lkp@intel.com>
 <20250523152705.2ecae09e834c66e1327d6748@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523152705.2ecae09e834c66e1327d6748@linux-foundation.org>

On Fri, May 23, 2025 at 03:27:05PM -0700, Andrew Morton wrote:
> On Fri, 23 May 2025 13:47:54 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   088d13246a4672bc03aec664675138e3f5bff68c
> > commit: a52dcec56c5b96250f15efbd7de3d3ea6ce863d9 mm/mglru: fix PTE-mapped large folios
> > config: sparc-randconfig-r073-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152339.fBOfDPsi-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 8.5.0
> > 
> > smatch warnings:
> > mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol 'dirty'.
> > mm/vmscan.c:3595 walk_pmd_range_locked() error: uninitialized symbol 'dirty'.
> > mm/vmscan.c:4215 lru_gen_look_around() error: uninitialized symbol 'dirty'.
> > 
> > ...
> >
> > bd74fdaea14602 Yu Zhao        2022-09-18  3484  	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
> > bd74fdaea14602 Yu Zhao        2022-09-18  3485  		unsigned long pfn;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3486  		struct folio *folio;
> > c33c794828f212 Ryan Roberts   2023-06-12  3487  		pte_t ptent = ptep_get(pte + i);
> > bd74fdaea14602 Yu Zhao        2022-09-18  3488  
> > bd74fdaea14602 Yu Zhao        2022-09-18  3489  		total++;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3490  		walk->mm_stats[MM_LEAF_TOTAL]++;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3491  
> > 1d4832becdc2cd Yu Zhao        2024-10-19  3492  		pfn = get_pte_pfn(ptent, args->vma, addr, pgdat);
> > bd74fdaea14602 Yu Zhao        2022-09-18  3493  		if (pfn == -1)
> > bd74fdaea14602 Yu Zhao        2022-09-18  3494  			continue;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3495  
> > 798c0330c2ca07 Yu Zhao        2024-12-30  3496  		folio = get_pfn_folio(pfn, memcg, pgdat);
> > bd74fdaea14602 Yu Zhao        2022-09-18  3497  		if (!folio)
> > bd74fdaea14602 Yu Zhao        2022-09-18  3498  			continue;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3499  
> > 1d4832becdc2cd Yu Zhao        2024-10-19  3500  		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
> > 1d4832becdc2cd Yu Zhao        2024-10-19  3501  			continue;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3502  
> > a52dcec56c5b96 Yu Zhao        2024-12-30  3503  		if (last != folio) {
> > a52dcec56c5b96 Yu Zhao        2024-12-30 @3504  			walk_update_folio(walk, last, gen, dirty);
> 
> Seems to be notabug because last==NULL on the first loop and in this
> case walk_update_folio() will immediately return without touching
> `dirty'.   But gee, I can't blame smatch from getting fooled by this.

That's true, but if walk_update_folio() we not inlined then we would
still consider this a bug.  It's undefined behavior in the C standard
to pass uninitialized variables to a function call and also the UBSan
checker will detected it as a read at runtime.

In production systems the compiler is going to set
"bool dirty = false;" at the start of the function because everyone
runs with CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y.  Should I send a patch
which does that explicitly?

regards,
dan carpenter

