Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE925382D2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981725; cv=none; b=tcL+r6c+yE3ZjeAw/w5zWlXSY7Nt2Be7AvX6XeDF7gxuj7cyBe4xF/+1R3pTmTkM32HkhMrzB0xp0pMotd9lPMk1wimKxifHgwoLfONkVxE8Z/FEDSsGz7zaiNzv+ELJHm/hJBjOWnfMllx2yIaC6QnPGw2ZMVu8Zz9G7+SrFG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981725; c=relaxed/simple;
	bh=J6NSUzD2V2k2/q+qqNzY1IFQg+Meq4nswaVLTHkSkI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BpDYwTunTP+273E6zzsa/3XbGZPB2y67nqCwsIuRlQz6IBesg95PItZCSIXWPlwerHQaHvT/Xj39YP0o5MTHaP8XRgwP3mXLP5RwfZsC1hOO+T3nql7HxaFgk8jaQC9okC6faHAkdakG4pNs5sJeqoaeVQJqX1pl0uNKizJJ0UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDXQKqFG; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDXQKqFG"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so44512725e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765981721; x=1766586521; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHx7DZEBmfQLYTq+RgL+Ee4so8rfbbSfi7WOO0Gbr+4=;
        b=oDXQKqFG5E/h3XEA7237hYZw8LuNmrliQdO+yN0iVTk8xctqKMF9IMF8G7fJJ4n+mp
         DSPzfrpx7Ly6mEwaeQD6MaMPefq9zCJwqjch5AteTKvpx5IE6TDRcQBi0q7PJ3c7xJ40
         CTNqhDr8pdzcsziUNVZNFhrQE2F1cphvRfIoqHRv0BleRDcfxqWQmqoJivld4/X6jSCq
         KJf55xLWgSJ9CxlIHMLynuLExxuXBLKXrIaljTaFIyCGPjZuOTE2Hm1o10qa/sf9AtGD
         KQ/f1zPohl4TmQazLpsbu7q/QYk9usP/qBn9MowaDwcJ5ObWkyWjSRBrQvQMfp+ZvyWi
         MNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765981721; x=1766586521;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHx7DZEBmfQLYTq+RgL+Ee4so8rfbbSfi7WOO0Gbr+4=;
        b=eXs4+anwcGMLrIq76kN6ILPLLYJeNzfbLA9h9hZnh98MF39Fmz4Equ9vR7oDqtn28Z
         n1t3fLlVGr3ka9b3a2YcMQ4x8BUNac3ot4CrVW6iS17JVR5XZQHpU29vkcxuUv0hzSBE
         ZFPw6XvZw51t+6bDjZGtSNScAT7ljj/ZxCF4zdzXU+p+aWL+lrP/zoKcVrQwKj6G7O0j
         fyKY7Q0ksEwxR0M/ahvZsQoJ0MP2sU2EkhPeA2XKJBxoJC0eRe1NQffTCfJwpjOYDjIB
         N7J1pDf7MM52z/ZC98QIPhHkdnl8LNgDUJ55W7PPnh+3DWk1+fZkn6hGx/IdnAFu/seq
         kf3w==
X-Forwarded-Encrypted: i=1; AJvYcCU92+xEmYFePIr05/7l9aBPTki/fOifjZp/Lvmu8s9Ht4wn7F98p72KYxiBZRm5eEkIJb/ELjjWac5HJLXS@lists.linux.dev
X-Gm-Message-State: AOJu0YxS5xBuppYNlak+zdcJjPDtuLKiV4Ty2nGFc2+qEZQxhtj4e4mw
	EGoxaFolncZJ1YuB3VtsW/+TXg1xCiPOv9ds0CTMOkANg2R30M+x2ycjfOl0ww5etx4=
X-Gm-Gg: AY/fxX7tN6/HUmUs+dCuf6PnnDtdW5WSZKaTYwfXhe4tmNZ4BuskgiISYu0q4tbVFly
	ItOtuLSGIV9jI9PKZVD3m2fdPzKYcHnJob7uhKrGsk2PiQu8XpAkkPNm1HihLz1YFjewyHzcEnF
	QlHScAhS4CkY5XCMH3u+IYmR/XeLVPAfI+4CkyQgWZgvxx46vQxHAglMS/JA+4k/4IuDZUjS6CY
	2y7bcOMHzu5w+mtEsjlV8rsNFXABC2mTLTaRVvMnZ1l6DDexI12GrILaIL/x/Y4O9LEGs+7J2DP
	plXT6Dc3yycq1abQd1W64c3aIT2UTEH2CMLlMu7wr82zlj3/krA6gIrQuuto7dtf/2LrdGoXjpL
	UL5/hfnyTbCg3udhoPXTbzVK5CNMmhiEPgLmCoal0xF0GyVqDiYUHGC7FkDDlDrSZGy7BqzvIYI
	hLb2YxZOkrKiQ1HODJ
X-Google-Smtp-Source: AGHT+IG+XNDdLvIHjDWrz7xBYNWynyjVwkhnneYUAaXVF1orqrHeVdrqwUGfJiVZQRW2LglRzOTRBQ==
X-Received: by 2002:a05:600c:5286:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47bd60152abmr72370455e9.11.1765981720725;
        Wed, 17 Dec 2025 06:28:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adeeedcsm5059934f8f.31.2025.12.17.06.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:28:40 -0800 (PST)
Date: Wed, 17 Dec 2025 17:28:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Arvind Yadav <arvind.yadav@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:100
 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be
 null (see line 85)
Message-ID: <202512131704.dhYp30j8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 70773bef4e091ff6d2a91e3dfb4f29013eb81f1f drm/amdgpu: update userqueue BOs and PDs
config: s390-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131704.dhYp30j8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512131704.dhYp30j8-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:100 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be null (see line 85)

vim +/bo_va +100 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

70773bef4e091f Arvind Yadav 2024-09-25   76  static void
70773bef4e091f Arvind Yadav 2024-09-25   77  amdgpu_gem_update_bo_mapping(struct drm_file *filp,
70773bef4e091f Arvind Yadav 2024-09-25   78  			     struct amdgpu_bo_va *bo_va,
70773bef4e091f Arvind Yadav 2024-09-25   79  			     uint32_t operation,
70773bef4e091f Arvind Yadav 2024-09-25   80  			     uint64_t point,
70773bef4e091f Arvind Yadav 2024-09-25   81  			     struct dma_fence *fence,
70773bef4e091f Arvind Yadav 2024-09-25   82  			     struct drm_syncobj *syncobj,
70773bef4e091f Arvind Yadav 2024-09-25   83  			     struct dma_fence_chain *chain)
70773bef4e091f Arvind Yadav 2024-09-25   84  {
70773bef4e091f Arvind Yadav 2024-09-25  @85  	struct amdgpu_bo *bo = bo_va ? bo_va->base.bo : NULL;

bo_va can be NULL.

70773bef4e091f Arvind Yadav 2024-09-25   86  	struct amdgpu_fpriv *fpriv = filp->driver_priv;
70773bef4e091f Arvind Yadav 2024-09-25   87  	struct amdgpu_vm *vm = &fpriv->vm;
70773bef4e091f Arvind Yadav 2024-09-25   88  	struct dma_fence *last_update;
70773bef4e091f Arvind Yadav 2024-09-25   89  
70773bef4e091f Arvind Yadav 2024-09-25   90  	if (!syncobj)
70773bef4e091f Arvind Yadav 2024-09-25   91  		return;
70773bef4e091f Arvind Yadav 2024-09-25   92  
70773bef4e091f Arvind Yadav 2024-09-25   93  	/* Find the last update fence */
70773bef4e091f Arvind Yadav 2024-09-25   94  	switch (operation) {
70773bef4e091f Arvind Yadav 2024-09-25   95  	case AMDGPU_VA_OP_MAP:
70773bef4e091f Arvind Yadav 2024-09-25   96  	case AMDGPU_VA_OP_REPLACE:
70773bef4e091f Arvind Yadav 2024-09-25   97  		if (bo && (bo->tbo.base.resv == vm->root.bo->tbo.base.resv))
70773bef4e091f Arvind Yadav 2024-09-25   98  			last_update = vm->last_update;
70773bef4e091f Arvind Yadav 2024-09-25   99  		else
70773bef4e091f Arvind Yadav 2024-09-25 @100  			last_update = bo_va->last_pt_update;

Unchecked dereference.  If "bo" is non-NULL we would know that
bo_va is also non-NULL, but the fact that bo is possibly NULL makes us
even more suspicious of bo_va.

I reported this before and never got a response.
https://lore.kernel.org/all/7074cf24-b136-44fc-a86d-4394d62c5242@stanley.mountain/

70773bef4e091f Arvind Yadav 2024-09-25  101  		break;
70773bef4e091f Arvind Yadav 2024-09-25  102  	case AMDGPU_VA_OP_UNMAP:
70773bef4e091f Arvind Yadav 2024-09-25  103  	case AMDGPU_VA_OP_CLEAR:
70773bef4e091f Arvind Yadav 2024-09-25  104  		last_update = fence;
70773bef4e091f Arvind Yadav 2024-09-25  105  		break;
70773bef4e091f Arvind Yadav 2024-09-25  106  	default:
70773bef4e091f Arvind Yadav 2024-09-25  107  		return;
70773bef4e091f Arvind Yadav 2024-09-25  108  	}
70773bef4e091f Arvind Yadav 2024-09-25  109  
70773bef4e091f Arvind Yadav 2024-09-25  110  	/* Add fence to timeline */
70773bef4e091f Arvind Yadav 2024-09-25  111  	if (!point)
70773bef4e091f Arvind Yadav 2024-09-25  112  		drm_syncobj_replace_fence(syncobj, last_update);
70773bef4e091f Arvind Yadav 2024-09-25  113  	else
70773bef4e091f Arvind Yadav 2024-09-25  114  		drm_syncobj_add_point(syncobj, chain, last_update, point);
70773bef4e091f Arvind Yadav 2024-09-25  115  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

