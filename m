Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782272AD2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766754881; cv=none; b=DKInTzsnL2zzFa0Y8Y7JdPHf+k6VjiD0hkLoaSy32lotyK6IRQKsRPPca4OIIWqQU1WQNR5mDZw6D7X7ENER0lDXyQG2Pjaue3exL2mr2MP6ruum54Hz/13fRuTCvpq/Kr06qCwY6GmhQzzJCACfQ+dXagp+d13GXOF20hJ1m/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766754881; c=relaxed/simple;
	bh=kERRHzZvOebDAwslu4VrNP7bS8OJH2AhtSFMu3b/ZZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=okMXprfgdSvK3ueVKFMbQmgvGwgtA/3ykMChbvejYsi4cpB5RF4hayf7rWa+LPWihJGNJMPXUbyR1++I/0qeBbtm59x+vkiskUW7FIULT3XJaKQ3HwgEd2MX+mCz9l7+t/+4bJXeAKW3II1c/Eq1p0cCjj99y3ho7xZLCVk+Onc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BKg291fj; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKg291fj"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47755de027eso42487155e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 05:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766754878; x=1767359678; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HdIKT5CyEmmmnLQNQTtHkyzlckiGsOl15OlWxIVgZkU=;
        b=BKg291fj78bzrYFJ6hglXwTIqDplbwxiidLjWwDxrTlWFHhtOlP/3yLzj7K7ujfd6s
         cCBqE6Rln/6by/p2R8NQsHdpt961xVIDgcLjI1Y3weIFF2TCFas6+KmmLzPw/Aclmw4z
         4dGLAaEqy7eRIOH+Q1Q+652U0MGPC7SjKGW32hvxmk+ZkuZkslWcqJf29aAVBWzwsSHz
         LGN5bdcua+mJBOffzwTVzIFtWZIiNVdX8tNFU8HJlrNKUe/7NIRkSapp1+Yu4aDsYQpP
         JLfrglk2BsfnAawFk/AwnSUmFm+NtW/iR1rcziQ+UsBGHwj0wZaHb0N+AYT59UjnWh9o
         6P4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766754878; x=1767359678;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdIKT5CyEmmmnLQNQTtHkyzlckiGsOl15OlWxIVgZkU=;
        b=eNgQBSC5yHmXfvjiBUsxv7ky/d2DFam2MwxGZziHB6B74eAoBECbtcqB1+TiEDIY2o
         cBu4HJ1og/DbS+4aTmTCubvipjWD5mo4txvYYDfPoFkswxUeNl8JW4stgQg1ruyUSU63
         c8LlrPWlxU4atpcQQRhfdL7bkTT5y7TcHDutF/q86xkpybl7oSCOoXme53hsrE8cYAWL
         wkFMQuSGdYoaejndogLMcPSAJLe58bQ3s3RecPTuzXTveWtdUeKNQeMD51d/Idct8Wva
         R91PVn9+5+am7HW/8IJQb1CLk2QygEThQZBSKkO5tlwiOZnADsq+1Jp4I7dC5fF5S5LL
         DY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrS7yayywXg9Xgc2HODqSod9vqbPkEmX35R5v07+AQpopsvWMU1dOX2Vg3/K7jUfWawEzscrqtrkwGrDJT@lists.linux.dev
X-Gm-Message-State: AOJu0YzTkD3Z04Cg/ONH73G8HQbW3x9/XQUpGJI6gtZkWfVSWcxJmbaF
	wmxmHYxadpo8dEGNagPUpeBfCBScu/yVs15WKH9QJoAbJR7NQw603agxLvcnsUr1Tqo=
X-Gm-Gg: AY/fxX4RxV4+mxpqhgB0jTqQe+/cf9e53SBKgzFNkGik05wJ2HdV9Oo28kMnmqSA6mJ
	sekHkw6Y/hv+/t5pl6IL+ENMPjN08g048C1Mym7oVMfE8Ez6+WQgjTjlCBZ1vkE7gKnypddyBpc
	ZJcV5UffFGt2/jUVfbZz4F5kxJRthfu+fHx1FL7yRzkHI4kZeUVzibAq6etSCWNKyMmJp0SmnIy
	wyukqNORZ4ToWfvWPqaBWbR/vgLK45Zn+Z+cYCECClVfYNEvhB+12VZVwgH7v7Qqb9wRMPVy/y6
	LnJ3mdTGY9svzFXefSiIk0qMYrgXfaTVrKd6P1a9LmIPd2j7zdE+6hec+EZmRUNK4/ibSv409+9
	vpBTfKixkCWG1ZR5IMCUYdgICpiF4bZTnvYOEnsX3h4Hltz+QN5drjZMP2jc2OZ1JIZWknH/wJM
	GzOQ2YvlV8f26ILiWf
X-Google-Smtp-Source: AGHT+IH9GWAJJr6VzgSN/cEleuRucyLjOeSxG2SPmXEbEB98sLdwV5IOEfVFvfSIFBlPWKdctuROdA==
X-Received: by 2002:a05:6000:250a:b0:431:66a:cbc4 with SMTP id ffacd0b85a97d-4324e4cc43dmr25195530f8f.17.1766754877729;
        Fri, 26 Dec 2025 05:14:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab33f5sm45859368f8f.41.2025.12.26.05.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 05:14:37 -0800 (PST)
Date: Fri, 26 Dec 2025 16:14:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 50/50]
 drivers/dma-buf/heaps/system_heap.c:347 system_heap_dma_buf_release() error:
 buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)
Message-ID: <202512251032.CRikw3RC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   1937a62dd1dad3155e2ec8c130f263e8f74ddf32
commit: b882b8502c3496eb2520d2d03fa94f7e6fa23075 [50/50] ANDROID: dma-buf: system_heap: Add pagepool support to system heap
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251225/202512251032.CRikw3RC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512251032.CRikw3RC-lkp@intel.com/

smatch warnings:
drivers/dma-buf/heaps/system_heap.c:347 system_heap_dma_buf_release() error: buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)

vim +347 drivers/dma-buf/heaps/system_heap.c

5f9d15ca7993a6 John Stultz 2020-09-25  329  static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
5f9d15ca7993a6 John Stultz 2020-09-25  330  {
5f9d15ca7993a6 John Stultz 2020-09-25  331  	struct system_heap_buffer *buffer = dmabuf->priv;
5f9d15ca7993a6 John Stultz 2020-09-25  332  	struct sg_table *table;
5f9d15ca7993a6 John Stultz 2020-09-25  333  	struct scatterlist *sg;
b882b8502c3496 John Stultz 2019-06-06  334  	int i, j;
b882b8502c3496 John Stultz 2019-06-06  335  
b882b8502c3496 John Stultz 2019-06-06  336  	/* Zero the buffer pages before adding back to the pool */
b882b8502c3496 John Stultz 2019-06-06  337  	system_heap_zero_buffer(buffer);
5f9d15ca7993a6 John Stultz 2020-09-25  338  
5f9d15ca7993a6 John Stultz 2020-09-25  339  	table = &buffer->sg_table;
679d94cd7d9008 Guangming   2021-11-26  340  	for_each_sgtable_sg(table, sg, i) {
0597bca8783840 John Stultz 2020-09-26  341  		struct page *page = sg_page(sg);
0597bca8783840 John Stultz 2020-09-26  342  
b882b8502c3496 John Stultz 2019-06-06  343  		for (j = 0; j < NUM_ORDERS; j++) {
b882b8502c3496 John Stultz 2019-06-06  344  			if (compound_order(page) == orders[j])
b882b8502c3496 John Stultz 2019-06-06  345  				break;

If we don't hit this break

b882b8502c3496 John Stultz 2019-06-06  346  		}
b882b8502c3496 John Stultz 2019-06-06 @347  		dmabuf_page_pool_free(pools[j], page);
                                                                                    ^
then j is out of bounds.

0597bca8783840 John Stultz 2020-09-26  348  	}
5f9d15ca7993a6 John Stultz 2020-09-25  349  	sg_free_table(table);
efa04fefebbd72 John Stultz 2019-12-03  350  	kfree(buffer);
efa04fefebbd72 John Stultz 2019-12-03  351  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

