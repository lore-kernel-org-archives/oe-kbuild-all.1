Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792A62C86D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768738785; cv=none; b=a1NMnDdhkxn2CZv7yidFF+vc8kJXhTkuSXggolHmID7+BVAXXiFj5O8aETQU6dq2HAF8xDmRoph98nnO6VEBy4eSOvqSm5HddKTjKUNp7PqB/JNI5wFtjoK+9ZvVd257a3+HUdwauJdvfwmxtV8p3CU03w0zUKrswFfEpI7Zh4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768738785; c=relaxed/simple;
	bh=yKm86xc59L8rWXSGE7GuuKfrBrGlY5HVhIRTxxd/NSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4Q/MTXCPoJ+PcEPSeLNe9aKMobdkT7mCq1Po9+RhBIODmKYaqH0mbycFF+4z/n6e7ThTwQxTkok+2rl3FLe9QRdqmWEUa3QtLcuNSKWDSGjLq2XuY/oVlOQBsMz07qsN+KyXKFUcTIWWO/Hszxq2+TymhhzgocV8YWcLkI7/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wye8Iosa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wye8Iosa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43277900fb4so2009187f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 04:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768738782; x=1769343582; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkoju9Swt6eeI9dWtzme/fPtYzDmyPT2GeuFpxC4il4=;
        b=wye8Iosa15n6pon/kYz66vKNWI0rEU7EsdwYG+a4zLiSGZleLkyjemRgUMW75uYwZd
         5K28UzF0/AU0DcXOhboBLdH1msczfMqtHi+MhRaQmwJ3sTR9KK9NcjxaZ/gBS4O1S/FT
         4PqQkOnbhWQ5KTJsdvFlYSdBiypE860io5vXYMI7yNpl4JJqrCEX2auqyCr73h7H+r/O
         m7r4I+lqg+EA+0FuT1kRtOMc4Z6vAYMCehXGoHHmqnrkwWPwAfJ8eV7l49WeCv6Xv3/j
         0j8KdtEKbS0DWwdEl+JZfCI0sHSbta7DhtGV0fU0I/PRVgNvUaLQpgpk5xW06Wb86JGv
         EhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768738782; x=1769343582;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lkoju9Swt6eeI9dWtzme/fPtYzDmyPT2GeuFpxC4il4=;
        b=orS8Q0NkYw6KVARIIwH1zAllPmJAZh9ukJHt6edD2+gO7Ut02H/AQ3tPD27JcuK5uc
         cLGb0xHKiyDLMMe/DiPkXdbkqAIy2as6Afj2GpuI5dYhtzSYR/w/ORqe+76eHwGciGX1
         Ydeh3QqdlZLp6yush4gSH4aHH7aHm4sGFickRAis2oJCVHe992uKbTrwrBCNhew30D8j
         EaRWUd9AJqh4KyhIy6+fnPQZmQlYk5bDjtGtRV7MovA+vBzqWBMZBCF4WelGznbI7De6
         d1yuU/TK/iJEP84cyNxDmhD2s3P/pQ3MozC8kZamoK8V1GxMR19gtK0Yc0U8L/CPDfin
         DwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB19eDqC1zqoYzTGPaGpC3SZHAae4fypnmaj6kLxa3Rf8AElFprM6TYO3xubk2hGLFeL1TC//eYrkjzKG0@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7ZVFhlXLv1vxIEoccKol+GP0Vu1zbFzEnziGnOPTov1qV6EgL
	WY2axjkpC9GXQI2Be9IXBBYLrBcMPHw8EJ+c1GD92dlJaPnWiT+f1fgMC7PKx5Ea72E=
X-Gm-Gg: AY/fxX7/i46FBHwtiRKF6ANIud0hu/MKF/yUOAMbtWDbQVdflf/bJG7foYLfBXVhmWa
	S1Qd0+SixQn0CxM/1p6MRNPvuzArOi8Ke3ppTcANFdCrhuUwQGMJ1lDRAg7thXx740K9mZWeMvp
	SNXx2UXFaWHFvrcc/7V1jzs7H6LtU/DWYTMzIiWSNtz4erxyouOQM/vGGhe8AuT1ik/k7sF/9HW
	/FtRnXe4tCwUNZhQ62rl/+xR1hn13Wppu7Ze+OFJw/L9wf4FzFID9oStKzgCYPYPxrLcoIVTzOq
	4jNjDJzACN55Q4DlqpSyP5eMt6088QzANUc29hQ+SUaxTPtqpytCzwao9XUcMc6/Di8vQ57LxZK
	0cEewKRgg2oVKumyhQcwabFCU643RNG96foBiVzTz1lYoVOjZeXqx3qtF5bifOOEJbHLZawBoo0
	Vb/Ioz5F3+Z/il2IiG
X-Received: by 2002:a05:6000:2c01:b0:432:86de:f396 with SMTP id ffacd0b85a97d-435695780admr9574503f8f.26.1768738781758;
        Sun, 18 Jan 2026 04:19:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926648sm17199398f8f.10.2026.01.18.04.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:19:41 -0800 (PST)
Date: Sun, 18 Jan 2026 15:19:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4]
 drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all()
 error: uninitialized symbol 'ret'.
Message-ID: <202601162042.mrCEt4Ms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 3c9ca275100e4fae48ab5206021b3ec82cf37b04 [4/4] drm/ttm: Should to return the evict error
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601162042.mrCEt4Ms-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601162042.mrCEt4Ms-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all() error: uninitialized symbol 'ret'.

vim +/ret +440 drivers/gpu/drm/ttm/ttm_resource.c

8af8a109b34fa88 Christian König 2020-10-01  411  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
b2458726b38cb69 Christian König 2020-08-03  412  				   struct ttm_resource_manager *man)
b2458726b38cb69 Christian König 2020-08-03  413  {
b2458726b38cb69 Christian König 2020-08-03  414  	struct ttm_operation_ctx ctx = {
b2458726b38cb69 Christian König 2020-08-03  415  		.interruptible = false,
b2458726b38cb69 Christian König 2020-08-03  416  		.no_wait_gpu = false,
c44dfe4de053914 Christian König 2020-11-02  417  		.force_alloc = true
b2458726b38cb69 Christian König 2020-08-03  418  	};
b2458726b38cb69 Christian König 2020-08-03  419  	struct dma_fence *fence;
b2458726b38cb69 Christian König 2020-08-03  420  	int ret;
b2458726b38cb69 Christian König 2020-08-03  421  	unsigned i;
b2458726b38cb69 Christian König 2020-08-03  422  
b2458726b38cb69 Christian König 2020-08-03  423  	/*
b2458726b38cb69 Christian König 2020-08-03  424  	 * Can't use standard list traversal since we're unlocking.
b2458726b38cb69 Christian König 2020-08-03  425  	 */
b2458726b38cb69 Christian König 2020-08-03  426  
a1f091f8ef2b680 Christian König 2020-10-06  427  	spin_lock(&bdev->lru_lock);
b2458726b38cb69 Christian König 2020-08-03  428  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
b2458726b38cb69 Christian König 2020-08-03  429  		while (!list_empty(&man->lru[i])) {

Can the list be empty at the start?

a1f091f8ef2b680 Christian König 2020-10-06  430  			spin_unlock(&bdev->lru_lock);
b2458726b38cb69 Christian König 2020-08-03  431  			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
b2458726b38cb69 Christian König 2020-08-03  432  						  NULL);
b2458726b38cb69 Christian König 2020-08-03  433  			if (ret)
b2458726b38cb69 Christian König 2020-08-03  434  				return ret;
a1f091f8ef2b680 Christian König 2020-10-06  435  			spin_lock(&bdev->lru_lock);
b2458726b38cb69 Christian König 2020-08-03  436  		}
b2458726b38cb69 Christian König 2020-08-03  437  	}
a1f091f8ef2b680 Christian König 2020-10-06  438  	spin_unlock(&bdev->lru_lock);
b2458726b38cb69 Christian König 2020-08-03  439  
3c9ca275100e4fa Emily Deng      2025-06-03 @440  	if (ret && ret != -ENOENT)


This check makes no sense.  ret is either zero or uninitialized.

3c9ca275100e4fa Emily Deng      2025-06-03  441  		return ret;
3c9ca275100e4fa Emily Deng      2025-06-03  442  
b2458726b38cb69 Christian König 2020-08-03  443  	spin_lock(&man->move_lock);
b2458726b38cb69 Christian König 2020-08-03  444  	fence = dma_fence_get(man->move);
b2458726b38cb69 Christian König 2020-08-03  445  	spin_unlock(&man->move_lock);
b2458726b38cb69 Christian König 2020-08-03  446  
b2458726b38cb69 Christian König 2020-08-03  447  	if (fence) {
b2458726b38cb69 Christian König 2020-08-03  448  		ret = dma_fence_wait(fence, false);
b2458726b38cb69 Christian König 2020-08-03  449  		dma_fence_put(fence);
b2458726b38cb69 Christian König 2020-08-03  450  		if (ret)
b2458726b38cb69 Christian König 2020-08-03  451  			return ret;
b2458726b38cb69 Christian König 2020-08-03  452  	}
b2458726b38cb69 Christian König 2020-08-03  453  
b2458726b38cb69 Christian König 2020-08-03  454  	return 0;
b2458726b38cb69 Christian König 2020-08-03  455  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

