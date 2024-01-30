Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64F9376F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 05:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706591526; cv=none; b=tg85KhmgD7y2dBQ4LKaj761cHlk5Y6vcOFx0CX5aiXM0hh7jBYqiI8hZQEMB0/Q+RJE+Og/1Opmu6tWgTRnQxtOoCcoKcgGtrlUXehKNejyChGKsZJnRXQVubKhGTgqOfuvBJ/SFnTRFbmNe+GKPjhFWGhnL4epnwC8A2AIXieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706591526; c=relaxed/simple;
	bh=gRa6zDODoyhQ3+n0FAjSpIYjIVhjcGxZbfcryB4c7Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=taxlq7G9WCv6UsBc4QQR0+TJF8nXRGFYJhDystiNEosxHq4NOWAzA21tUSUs8sh8i3DZoEGOmaC0JDNvD+dRui9usONJxwuR4GM67elFv7UrHXi2jZoP/k0f98Ljmri/2pBbU0qtEOoNHWUeg8Wyr6kMDMWhka1Wyw79qfz29rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLnbZQDF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLnbZQDF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso53758935e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 21:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706591523; x=1707196323; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFkJ8YEcx1vJ5tSiLYWZOmA0x6d7CoNNJ6/W8VFHiks=;
        b=vLnbZQDFQiSahgdFIqqJ/zndimi5U85eArGXvYL/twq6T3tQnC6OyQw6jj7StpDRyy
         BCWJTQXtWmkR9juMZFubBSf2Ee1Ty+wbzhiNCiGgDrG4dN2dlnccnhTezkHKBk5jynPE
         J3BxhjxTeax7lW7pAc6WUWvasxUBD2nQnhSwHX0+rZnzrOxbjZPpTHLByVPMwpe2/HQt
         puwU45QRxi/BZeCj/mpewuPxr2xVyqmcxsCPhF5CUOlrdLR+kIUAXylNy3B7CtwGO9wm
         4vkdq3ESeK+TSvL9erRMeQrnu1JlgCmFp+cbczw6926MpowLdcd0gVvGuk4OJNw2UpHF
         VntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706591523; x=1707196323;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFkJ8YEcx1vJ5tSiLYWZOmA0x6d7CoNNJ6/W8VFHiks=;
        b=H17xmHyKNhELxbuU7L0mP8CT/hqlxKOvM7dUst7inbjuxLX5MKJVk3xygq8o6jdXHF
         1jDay9cgC8HfAcD4Xyvpea+Ydj4nJmWR7V3LlzYIc6+koPx6ZKWekQJDr3xI7BuKrHZK
         0228opHoCf61P0BnfA8Lf9kNy51b7t2ZyhhzniDG06XbQZP75wjdhMNseLL0eW+/LW9v
         30t3ZjEFxw9ucypejEgAb9Iocby+zqWza/ilNlgrFJF/Pof3kdU49HjlihWSq5iq9skk
         heYRrGSsrGeIe0Xi+puWAIYpQxnIHMbCLJlnSYUIsVqo+yfZh/1OmDeu8HpGCLVocgWy
         lBHA==
X-Gm-Message-State: AOJu0Yx+A/7BW/22GheLYzL1GUCg6rBgUrzHtLNs2c+RWxnfFoqFhRWg
	VH/1wLBxvne+s0xMmTN7VMj3vnYi+LHmSrEJc16hR2GCtqteCAvK5YwMOTJ15i4=
X-Google-Smtp-Source: AGHT+IGKV6vXZKlzQvf+WVjlAtnlCBfj/HLfKNq4VXtrhVgXZCLSnPizN49taJaeWoeDjenPtNcpPg==
X-Received: by 2002:adf:e2cc:0:b0:339:58fc:4934 with SMTP id d12-20020adfe2cc000000b0033958fc4934mr5190229wrj.2.1706591522842;
        Mon, 29 Jan 2024 21:12:02 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id e10-20020adfe38a000000b0033afcc069c3sm148033wrm.84.2024.01.29.21.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 21:12:02 -0800 (PST)
Date: Tue, 30 Jan 2024 08:11:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: drivers/gpu/drm/xe/tests/xe_migrate.c:224 xe_migrate_sanity_test()
 warn: passing zero to 'PTR_ERR'
Message-ID: <d06df232-e96e-45aa-b749-21ef729a9463@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   41bccc98fb7931d63d03f326a746ac4d429c1dd3
commit: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs
config: sparc-randconfig-r081-20240128 (https://download.01.org/0day-ci/archive/20240129/202401292346.V7E6rEzz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401292346.V7E6rEzz-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/tests/xe_migrate.c:224 xe_migrate_sanity_test() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/xe/tests/xe_migrate.c:254 xe_migrate_sanity_test() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +224 drivers/gpu/drm/xe/tests/xe_migrate.c

dd08ebf6c3525a Matthew Brost 2023-03-30  210  static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
dd08ebf6c3525a Matthew Brost 2023-03-30  211  {
dd08ebf6c3525a Matthew Brost 2023-03-30  212  	struct xe_gt *gt = m->gt;
dd08ebf6c3525a Matthew Brost 2023-03-30  213  	struct xe_device *xe = gt_to_xe(gt);
dd08ebf6c3525a Matthew Brost 2023-03-30  214  	struct xe_bo *pt, *bo = m->pt_bo, *big, *tiny;
dd08ebf6c3525a Matthew Brost 2023-03-30  215  	struct xe_res_cursor src_it;
dd08ebf6c3525a Matthew Brost 2023-03-30  216  	struct dma_fence *fence;
dd08ebf6c3525a Matthew Brost 2023-03-30  217  	u64 retval, expected;
dd08ebf6c3525a Matthew Brost 2023-03-30  218  	struct xe_bb *bb;
dd08ebf6c3525a Matthew Brost 2023-03-30  219  	int err;
dd08ebf6c3525a Matthew Brost 2023-03-30  220  	u8 id = gt->info.id;
dd08ebf6c3525a Matthew Brost 2023-03-30  221  
dd08ebf6c3525a Matthew Brost 2023-03-30  222  	err = xe_bo_vmap(bo);
dd08ebf6c3525a Matthew Brost 2023-03-30  223  	if (err) {
dd08ebf6c3525a Matthew Brost 2023-03-30 @224  		KUNIT_FAIL(test, "Failed to vmap our pagetables: %li\n",
dd08ebf6c3525a Matthew Brost 2023-03-30  225  			   PTR_ERR(bo));
                                                                   ^^^^^^^^^^^
This should be "err".

dd08ebf6c3525a Matthew Brost 2023-03-30  226  		return;
dd08ebf6c3525a Matthew Brost 2023-03-30  227  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  228  
dd08ebf6c3525a Matthew Brost 2023-03-30  229  	big = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, SZ_4M,
dd08ebf6c3525a Matthew Brost 2023-03-30  230  				   ttm_bo_type_kernel,
dd08ebf6c3525a Matthew Brost 2023-03-30  231  				   XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
dd08ebf6c3525a Matthew Brost 2023-03-30  232  				   XE_BO_CREATE_PINNED_BIT);
dd08ebf6c3525a Matthew Brost 2023-03-30  233  	if (IS_ERR(big)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  234  		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
dd08ebf6c3525a Matthew Brost 2023-03-30  235  		goto vunmap;
dd08ebf6c3525a Matthew Brost 2023-03-30  236  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  237  
dd08ebf6c3525a Matthew Brost 2023-03-30  238  	pt = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, GEN8_PAGE_SIZE,
dd08ebf6c3525a Matthew Brost 2023-03-30  239  				  ttm_bo_type_kernel,
dd08ebf6c3525a Matthew Brost 2023-03-30  240  				  XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
dd08ebf6c3525a Matthew Brost 2023-03-30  241  				  XE_BO_CREATE_PINNED_BIT);
dd08ebf6c3525a Matthew Brost 2023-03-30  242  	if (IS_ERR(pt)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  243  		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
dd08ebf6c3525a Matthew Brost 2023-03-30  244  			   PTR_ERR(pt));
dd08ebf6c3525a Matthew Brost 2023-03-30  245  		goto free_big;
dd08ebf6c3525a Matthew Brost 2023-03-30  246  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  247  
dd08ebf6c3525a Matthew Brost 2023-03-30  248  	tiny = xe_bo_create_pin_map(xe, m->gt, m->eng->vm,
dd08ebf6c3525a Matthew Brost 2023-03-30  249  				    2 * SZ_4K,
dd08ebf6c3525a Matthew Brost 2023-03-30  250  				    ttm_bo_type_kernel,
dd08ebf6c3525a Matthew Brost 2023-03-30  251  				    XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
dd08ebf6c3525a Matthew Brost 2023-03-30  252  				    XE_BO_CREATE_PINNED_BIT);
dd08ebf6c3525a Matthew Brost 2023-03-30  253  	if (IS_ERR(tiny)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  254  		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
dd08ebf6c3525a Matthew Brost 2023-03-30  255  			   PTR_ERR(pt));
                                                                   ^^^^^^^^^^^
s/pt/tiny/

dd08ebf6c3525a Matthew Brost 2023-03-30  256  		goto free_pt;
dd08ebf6c3525a Matthew Brost 2023-03-30  257  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  258  
dd08ebf6c3525a Matthew Brost 2023-03-30  259  	bb = xe_bb_new(m->gt, 32, xe->info.supports_usm);
dd08ebf6c3525a Matthew Brost 2023-03-30  260  	if (IS_ERR(bb)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  261  		KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
dd08ebf6c3525a Matthew Brost 2023-03-30  262  			   PTR_ERR(bb));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

