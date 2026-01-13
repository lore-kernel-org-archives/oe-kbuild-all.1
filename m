Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E4C387368
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302757; cv=none; b=Aaz8hiUpUMnmUXJLirNu7d1/8CZaI+fb9K8/Ihl7E1dNBnuN6gR3s/QJnUbpjI84rDWUPCjkr9FwgOixic7GwR2K0oCfnEd+h2fMfCTyQM+aIe5IZiTQdSCoyqj8F6Ih1H9HlWtlQI17WWQ0QMOY71TM4n/N/TULr9ioL7Q+Npg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302757; c=relaxed/simple;
	bh=T6TbEgeGX/rkrzDUoGeL9oBf7IqoSVbZMBVCETBd9P8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lnt87qP5HZ9cNYL6FJnnUufYpR49Ptv16Wef36FbeAeL0QvLCeWrBrbT2X6iGBa+7ObVJ5h/2l8ump8h2wnv5fhmsUg6X9M+/YS3eXB+O8I02tMvwelGYbgnZq7uDRTDYwLgpBlHmU5PpafW5zBdC7O506ou+hKgmCn5WzIQw9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AS69MOJ8; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AS69MOJ8"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b871ba73f49so289751366b.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 03:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768302753; x=1768907553; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rO+by4VRpGoh+64Jlp60LzKBsLBfLOxrwjzwp2adwPk=;
        b=AS69MOJ8LCoo8OYj5LghDl3IRG5yxThBxUCj2+9K7Fo1Vf986zfWDhY70Il8+h4u2d
         g2nGXiwOUaUr+YbL2MbQmoCUI28iF6i9dXUU2AEZ6G5Tr6Wct2HzMmEjsLiWAg7oMa4Y
         y18JdPikQjee/Lv5+roBaZ4OHHY/KxGrlJo8vGkthFjm7O3gp7+2t1AONf5eVHRhDv35
         e6e4RfPqyl/w4d4Sv8rwd+F9GcHqway1EPpFfZ/Uji3uAsk9GknHYinbdFmZtcZg99uX
         WsHRVgb5HU8E2I+4o7+qEKPrN5dRB+YBu9W31W3bF2te2iNE5Wbqcmj6M/TA2mnUZZB4
         19jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302753; x=1768907553;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rO+by4VRpGoh+64Jlp60LzKBsLBfLOxrwjzwp2adwPk=;
        b=Vy0qYj8ijHK8EVrMUqH1k44r+uioFjlObs+pPDiJ6vVRyHJ0bjyUXmyTTLIbn1tXJz
         miRaxXSEDEuB8EmAi8oX79LTYw0a/H1LQnZoWu76ykTAIQX74zZH4o+gtOEmSm2cDseQ
         HENoH2e+ckh62B5WLrZcpsT+Q0g2WELCy98aVI/4H6ftlexAKF6WY1vro2M1y1o2gtWs
         GsWT+kI6LdZGvgekG8SpSPiL2kGRMAKshu8fmtotDM9eJIdt1V7ym7prxtCNm4FKMfYi
         zjPQJT65FzVGjFFYhKEyiPKZ2kcRLrrn/svyj6hUjq0Ox78C361YS2KM8bCIdOg1Qy6M
         onlw==
X-Forwarded-Encrypted: i=1; AJvYcCXKXn8ryGZbuDU7MJzjEiqg9BrMLL4IsDfm0rzJeIdw9watVROKaEoq1RaDIwaePHWFHG7L1Ipl8gHuCp9j@lists.linux.dev
X-Gm-Message-State: AOJu0YzUJ2tJL3Ex6WMpZ8BxYmmJydJMrXXPIdVvepMZliwK8tPADCrp
	zVALFIfPgMehklgtlE1wa8fRU32hisYpBDbjcq7R9h3TQ8z6wZDr0hs+2Aa56gRO3S8=
X-Gm-Gg: AY/fxX5ifn4XFanqI2r2Q9OOi6X2VPMsOMtaNelPr0tNwQIa4269YfnKqptWvXCeS+D
	LUNbjWrvLzUBmHP3rA9vNUx+nnSpwoADB8Ac++OqlyjhL/szQd4KWtqkTiSPIk8cWHYZGEi17/I
	lhN3xbY8Qyjq57FZSw4hIxB40TFfG+6B/opcuMHKooZq5vHmHitXsSKHofsgbGj8sw2u609ZFf0
	cDJ8BRUgYBvfscZB7gaqIHXUiLMJgZWK2R945RSakOt4UNPp/S+lRj20HxJluXqlRiArYZdbV/V
	LXuDX46cWGOvuB+fAYOY6bMpxrbXjdrjaulYWMFAtthmS2xHkovqhIQNPlxC5yw0vlZ1Oqf5bc5
	1j4gaCcNDQ3IO0bYYLB2jTaBnm7wsyPDNoA9jJK20oR73BsIx6Cq8rbyr0h1s+6OsG44cuBcz2E
	0z6ZTbZRv8I056sTnn
X-Google-Smtp-Source: AGHT+IHheoYbuw2wt4/wnA0dnnGI4fo1ixTrXZWv/VYNJFuJtdOOVWhH3xr0vBxqdOpKsEyM3E+uIg==
X-Received: by 2002:a17:906:fe05:b0:b75:7b39:847a with SMTP id a640c23a62f3a-b8445216dccmr2146865366b.60.1768302752980;
        Tue, 13 Jan 2026 03:12:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm2131322766b.57.2026.01.13.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:12:32 -0800 (PST)
Date: Tue, 13 Jan 2026 14:12:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dev Jain <dev.jain@arm.com>, Jan Kara <jack@suse.cz>
Subject: mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning (-12) to
 unsigned variable 'ra->order'
Message-ID: <202601131311.g3lyUAks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 9f1edf1aedac1b287355f63f768ba4275de72dca mm: readahead: make thp readahead conditional to mmap_miss logic
config: x86_64-randconfig-161-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131311.g3lyUAks-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601131311.g3lyUAks-lkp@intel.com/

smatch warnings:
mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning (-12) to unsigned variable 'ra->order'

vim +3307 mm/filemap.c

6b4c9f4469819a0 Josef Bacik             2019-03-13  3248  static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3249  {
2a1180f1bd389e9 Josef Bacik             2019-03-13  3250  	struct file *file = vmf->vma->vm_file;
2a1180f1bd389e9 Josef Bacik             2019-03-13  3251  	struct file_ra_state *ra = &file->f_ra;
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3252  	struct address_space *mapping = file->f_mapping;
fcd9ae4f7f3b5fb Matthew Wilcox (Oracle  2021-04-07  3253) 	DEFINE_READAHEAD(ractl, file, ra, mapping, vmf->pgoff);
6b4c9f4469819a0 Josef Bacik             2019-03-13  3254  	struct file *fpin = NULL;
bfbe71109fa40e8 Lorenzo Stoakes         2025-06-18  3255  	vm_flags_t vm_flags = vmf->vma->vm_flags;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3256  	bool force_thp_readahead = false;
f5e8b140cd1324c Ryan Roberts            2025-06-09  3257  	unsigned short mmap_miss;
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3258  
4687fdbb805a92c Matthew Wilcox (Oracle  2021-07-24  3259) 	/* Use the readahead code, even if readahead is disabled */
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3260  	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3261  	    (vm_flags & VM_HUGEPAGE) && HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER)
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3262  		force_thp_readahead = true;
4687fdbb805a92c Matthew Wilcox (Oracle  2021-07-24  3263) 
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3264  	if (!force_thp_readahead) {
38b0ece6d76374b Ryan Roberts            2025-06-09  3265  		/*
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3266  		 * If we don't want any read-ahead, don't bother.
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3267  		 * VM_EXEC case below is already intended for random access.
38b0ece6d76374b Ryan Roberts            2025-06-09  3268  		 */
38b0ece6d76374b Ryan Roberts            2025-06-09  3269  		if ((vm_flags & (VM_RAND_READ | VM_EXEC)) == VM_RAND_READ)
6b4c9f4469819a0 Josef Bacik             2019-03-13  3270  			return fpin;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3271  
275b12bf5486f6f Wu Fengguang            2011-05-24  3272  		if (!ra->ra_pages)
6b4c9f4469819a0 Josef Bacik             2019-03-13  3273  			return fpin;
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3274  
dcfa24ba68991ab Matthew Wilcox (Oracle  2022-05-25  3275) 		if (vm_flags & VM_SEQ_READ) {
6b4c9f4469819a0 Josef Bacik             2019-03-13  3276  			fpin = maybe_unlock_mmap_for_io(vmf, fpin);
fcd9ae4f7f3b5fb Matthew Wilcox (Oracle  2021-04-07  3277) 			page_cache_sync_ra(&ractl, ra->ra_pages);
6b4c9f4469819a0 Josef Bacik             2019-03-13  3278  			return fpin;
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3279  		}
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3280  	}
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3281  
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3282  	if (!(vm_flags & VM_SEQ_READ)) {
207d04baa3591a3 Andi Kleen              2011-05-24  3283  		/* Avoid banging the cache line if not needed */
e630bfac79456d3 Kirill A. Shutemov      2020-08-14  3284  		mmap_miss = READ_ONCE(ra->mmap_miss);
e630bfac79456d3 Kirill A. Shutemov      2020-08-14  3285  		if (mmap_miss < MMAP_LOTSAMISS * 10)
e630bfac79456d3 Kirill A. Shutemov      2020-08-14  3286  			WRITE_ONCE(ra->mmap_miss, ++mmap_miss);
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3287  
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3288  		/*
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3289  		 * Do we miss much more than hit in this file? If so,
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3290  		 * stop bothering with read-ahead. It will only hurt.
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3291  		 */
e630bfac79456d3 Kirill A. Shutemov      2020-08-14  3292  		if (mmap_miss > MMAP_LOTSAMISS)
6b4c9f4469819a0 Josef Bacik             2019-03-13  3293  			return fpin;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3294  	}
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3295  
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3296  	if (force_thp_readahead) {
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3297  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3298  		ractl._index &= ~((unsigned long)HPAGE_PMD_NR - 1);
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3299  		ra->size = HPAGE_PMD_NR;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3300  		/*
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3301  		 * Fetch two PMD folios, so we get the chance to actually
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3302  		 * readahead, unless we've been told not to.
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3303  		 */
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3304  		if (!(vm_flags & VM_RAND_READ))
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3305  			ra->size *= 2;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3306  		ra->async_size = HPAGE_PMD_NR;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06 @3307  		ra->order = HPAGE_PMD_ORDER;

HPAGE_PMD_SHIFT is zero in this config?
ra->order is a u16.

9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3308  		page_cache_ra_order(&ractl, ra);
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3309  		return fpin;
9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3310  	}
ef00e08e26dd5d8 Linus Torvalds          2009-06-16  3311  
38b0ece6d76374b Ryan Roberts            2025-06-09  3312  	if (vm_flags & VM_EXEC) {
38b0ece6d76374b Ryan Roberts            2025-06-09  3313  		/*
38b0ece6d76374b Ryan Roberts            2025-06-09  3314  		 * Allow arch to request a preferred minimum folio order for
38b0ece6d76374b Ryan Roberts            2025-06-09  3315  		 * executable memory. This can often be beneficial to

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

