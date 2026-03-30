Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65C3A8738
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857250; cv=none; b=OpYPdzUiflKOLC9rIbliYxLwMEXPNTmhHnWUE8n79og9zJBjw4N2sfKV1mLovkDBOWsHSfZltlHu3kN8mdDVsaro17ZihLQOkb1e0uizURU32OWFDuN+Lk04dO2wUfMzwhRp13cBLt1h1Kn5M18C4l5ft34tSkZE8jj7RZWQJWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857250; c=relaxed/simple;
	bh=NEU8Av0vlUBzp5kKsTkFtklbYuwd1qHwq2q2D0FU8nY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcq2xWsJhhrmBG5k2VGO+jRT86dlWJEaqYFcamnokjaJj97a2qGa1igBHTxjxJ1u45fzYXZ4OPggCM7Pa58+HbrCEnE8wmFqKI9hgbtHpunuX8H9b+8ZF/x/kkI0qh5KMbtA5dGj3XwsVkqurZKmpdpgBEumPmT/mXrIMXgN8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npYsjt6C; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npYsjt6C"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfd96354aso419094f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774857247; x=1775462047; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8ZV7UGRrDw67LHE/kLdGf0yRxyZLc6A+RaF4e4HLAE=;
        b=npYsjt6CD5LzCSSYyy5RM1NM+HGXBxpoyb0AD1d+9mYLU7zgjmEdEjX6ISLKvOGw0t
         LQJ7MktutcP2lI5gVdjkBWcD+SGiRUnfloNtA2PoElWOFF8nCCoW2mrdzNmCx2YX+JC8
         k/+tZ9diO7s2vZC+Af96yVDmMMVrv23hgfl2LAv3Kmf9mwJY7ox+lxkfvkEVjild4+N0
         9iu5TBw6vJCIFiqoKc+OZj7LhKDCd9fVWvjJeKMJKzPTDEZp365It/3Xrc2Ye8dQGhG3
         iSrLu94T4Bre8yRvCk9DCfHsoTMhvpfi0lFD6vFGSxnovAyq1iu63PpRHKPfFj3D+zoS
         FwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857247; x=1775462047;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8ZV7UGRrDw67LHE/kLdGf0yRxyZLc6A+RaF4e4HLAE=;
        b=n+siDd0YCJfMLLjiqt5AkMj61JxuopfMr2Xy898wgFNd64hcak0WutMp+QJWVBhzKK
         g+EuA/cjQ858R9VA/L6W1U+qcjlIqR8ynB1u8qKTJbC1JnQd/NgHKQSDRwRUoqSKL0ma
         CwfA4/YdMU0V5Fokghhvn43tdIk8julOKttKOjH5rU13y+hds+avdrlJ2R+Z7JdC7QKB
         Zd4KI+fGvjUdDBCcQTqCMnZy3Kmz5oQEYeWd0qpcevH9PNhEFz2VCru1YfaFALemj8SF
         /yll5Csup7S7a5LGqUqnAVuo1k505ZUfBheugetzPSTKSz3fdQLfULFYRQti8MRrp6ap
         Rjgg==
X-Forwarded-Encrypted: i=1; AJvYcCXbakvi8axQXgZ+YQTzbelOpch4p+ebqQMO8LE1eefL9dLqEPdfmOw4cyVDOHMxW7fzugRixOGeG6oRYAgf@lists.linux.dev
X-Gm-Message-State: AOJu0YwlZUJRKFbVSOwY2WJBOir0M46E+y8HQqcfCGzwkvbcsO+ppeHF
	PF8ZHRJNmWL3TlgznNvgaHMI8u62DiZjMneh8oXX781NduiefSSWbvaH
X-Gm-Gg: ATEYQzwOJaBlkAk0WAFx5jFo1/76D+RUCR0huF09by2erC0cAope/3wjUxf2keYT2FS
	ewdCs/8Wzemj/+Lxn/KVbbpv85lZkgi9/yY7ES4Q6ji6Yq2uSlKLu79/bFDkaAeojw/wL57/dHn
	acV+Eoqn/ozSOfXAx575C+8CX/Fu0j1RNL244WpyJKhVs8cUmOUMHVcIo1bF19ZnQggzlqwl51e
	hsoPzNBOTTmvPqvG0lAPrlfFNnWPYa6L1japVNBrZ6RrgOoiYYOpQ3UUBIBohUX9q+DXiOhZJP8
	For09nPOkf5g2BCNmJK9YfjavVhOSylMEEgkf+Te14hZWJegYRldxzTQQ9ipW6//bCfSOwgYu5s
	Hhtf2iHcTj5czquT2ynhUgcBskdprQPc/6Ct3ALjcx3CdkBeShe8bbYh60pnFIy5ryRM+1Sbjwt
	cM9A43v9oaHnm36S2f7ws=
X-Received: by 2002:a05:6000:2f8a:b0:43b:47ee:4586 with SMTP id ffacd0b85a97d-43b9ea4aac1mr18937756f8f.29.1774857246627;
        Mon, 30 Mar 2026 00:54:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm15835567f8f.29.2026.03.30.00.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:54:05 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:54:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 7/7] mm/cma.c:927 __cma_alloc()
 error: we previously assumed 'cma' could be null (see line 921)
Message-ID: <202603290833.9K8Zc8aA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   233c0add490b678592b7a7bf767018cece8826b2
commit: 5d61ead66dce096277985e4f198cd88bb43f3e68 [7/7] ANDROID: mm: Allow GFP_ATOMIC for GCMA
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290833.9K8Zc8aA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603290833.9K8Zc8aA-lkp@intel.com/

smatch warnings:
mm/cma.c:927 __cma_alloc() error: we previously assumed 'cma' could be null (see line 921)
mm/cma.c:932 __cma_alloc() warn: variable dereferenced before check 'cma' (see line 927)

vim +/cma +927 mm/cma.c

8a504fbd272ac3 Carlos Llamas        2025-04-21  914  struct page *__cma_alloc(struct cma *cma, unsigned long count,
c009da4258f988 Frank van der Linden 2025-02-28  915  		       unsigned int align, gfp_t gfp)
c009da4258f988 Frank van der Linden 2025-02-28  916  {
c009da4258f988 Frank van der Linden 2025-02-28  917  	struct page *page = NULL;
c009da4258f988 Frank van der Linden 2025-02-28  918  	int ret = -ENOMEM, r;
5d61ead66dce09 Vincent Donnefort    2026-03-19  919  	gfp_t gfp_allowed;
c009da4258f988 Frank van der Linden 2025-02-28  920  	unsigned long i;
c009da4258f988 Frank van der Linden 2025-02-28 @921  	const char *name = cma ? cma->name : NULL;
                                                                           ^^^

c009da4258f988 Frank van der Linden 2025-02-28  922  
5d61ead66dce09 Vincent Donnefort    2026-03-19  923  	/*
5d61ead66dce09 Vincent Donnefort    2026-03-19  924  	 * GCMA allows GFP_ATOMIC, while CMA can only do GFP_KERNEL.
5d61ead66dce09 Vincent Donnefort    2026-03-19  925  	 * Both support optional flags NOWARN|NORETRY
5d61ead66dce09 Vincent Donnefort    2026-03-19  926  	 */
5d61ead66dce09 Vincent Donnefort    2026-03-19 @927  	gfp_allowed = GFP_KERNEL | (cma->gcma ? GFP_ATOMIC : 0);
                                                                                    ^^^
This adds an unchecked dereference in between two NULL checks.

5d61ead66dce09 Vincent Donnefort    2026-03-19  928  	if (WARN_ON_ONCE((gfp & gfp_allowed) == 0 ||
5d61ead66dce09 Vincent Donnefort    2026-03-19  929  		(gfp & ~(gfp_allowed | __GFP_NOWARN | __GFP_NORETRY)) != 0))
e20c2e5ba70ac5 Suren Baghdasaryan   2025-05-02  930  		return page;
e20c2e5ba70ac5 Suren Baghdasaryan   2025-05-02  931  
c009da4258f988 Frank van der Linden 2025-02-28 @932  	if (!cma || !cma->count)
                                                            ^^^^

c009da4258f988 Frank van der Linden 2025-02-28  933  		return page;
c009da4258f988 Frank van der Linden 2025-02-28  934  
c009da4258f988 Frank van der Linden 2025-02-28  935  	pr_debug("%s(cma %p, name: %s, count %lu, align %d)\n", __func__,
c009da4258f988 Frank van der Linden 2025-02-28  936  		(void *)cma, cma->name, count, align);
c009da4258f988 Frank van der Linden 2025-02-28  937  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

