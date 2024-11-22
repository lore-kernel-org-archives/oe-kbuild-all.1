Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A391304BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732271608; cv=none; b=bWdeqF2mpSUAwhQP3ii8Sv8SdAH78w4bDCKxbvcWmdEoY3p8iAr7WeXymZdZjnD1OTRX4NnxcIjRdG7pydpQG6FNmRFDUPcmmgyAsD7hfbEmcUvNV0Vaxl6Tk8Ef9mb58VFqtmX2DqBAy3G6vRMnVEhVbHkXxcuohNmztQLyjdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732271608; c=relaxed/simple;
	bh=0YknbAA/S4y0wu1gNJNG2kKf+NwrDuNAwSBhcQn04x4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VN9Pny4lwfSCI31r88N8V246OwJuIRgO9LDOeyf8iv4RotnW8HLcjgMkURi6TtM7ABoFwONfqxOgnR+Se2VWfgWYADuk++XlZrTdFO0IRCXKAidR78IVNJ9nCsszFN4dOANeL6EsNmr0mKJ5DCMofDiuSjirvtIlNKObAtuvFXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZfnN7SZn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZfnN7SZn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316cce103dso22427655e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 02:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732271604; x=1732876404; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GIG9GqTnbBii47hGIT+ji4F2/b2t1HvQWmRSGv5/eck=;
        b=ZfnN7SZn2JHy5Mwc1O89cW1xn0zjVLYrgfnRH6GiaiCjpMhkNYkW5HzI1RGUnBsRjM
         i6786OS+GlgWQSSMoTxo1VzcLFmYyvIBPiz+NDD3VlwaJVhA1nrah9ZhNl/sq2VXpCC8
         Gyc9Q1rk5eYRiX785kH2neCwL2Zz+1tCAav4SQK8yl2jWjRKJ2KbcjQucNT0VSfBttWF
         iEg1y1cn+mzPJfXvpC+0sJwgOQ6GW+wSkPsKlsf5WHBfq9S8P4K3yHbq1a19cHQZM4cr
         vvOf9Wrr1Y3GCEfmVxRGbcyUvjFNCHWYe8wKVjTAtYOmMll4fuqprLQdjt29EzRAlYXL
         8Q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732271604; x=1732876404;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIG9GqTnbBii47hGIT+ji4F2/b2t1HvQWmRSGv5/eck=;
        b=Agyz7/ZWehHN6EHT/2r6qWMLNcICm6ibvk/k6bxOiotEPYqkLjvrtAiXmnZHlmYGC5
         wiD5FolN0tdNIZ4s2cqQSp+eN6rzc5hP3j6Zxh82PBZtDUfue++6T/bhmloMk5+X1Trl
         XNgwqVdlTfaCpBI5dbkWPrXeoZ1sIgF1Y1SuIHKRJ7MNa0HUHLMlOvDMaFPB9uvo+1wL
         ZEuRpwkv/XWUjTQlx77mrSiEgdpwqWHaCdthDSMAuxPTLEiPUQR8TJCDCC49+IY3h10P
         d3GoFkth4OUCehl0n0Q9cAJtFwEKNscMOqqgafXWO/pSmZVxhErNTHWistV1wmlMNs7C
         Oqqg==
X-Forwarded-Encrypted: i=1; AJvYcCXFNpdBcA+M8Xs1/9SrCCycMXaoLBzZFnuc4JXxJnw2n3H6uGFiKd5B1hub1XotfBSwGe02VgmYVoekDkYN@lists.linux.dev
X-Gm-Message-State: AOJu0YzUd8DZS1xOyT9q2RLRQFSuD5pYnKt6hcKIkN5vENj8qTCSWBBD
	3lc49hA/FzWjrY58BG5hnx+23HIr/O/E+B2/BwuJ1ImqPOlJ+8Kkl9LDebB3G8s=
X-Gm-Gg: ASbGncvDr4dA+pylpptG0JKck2K6j2b16IA1TGms9tujD8Nb7La77A61Su3RYbaNbFC
	rCuGAvOZodWAQ+O3AFPOBU06W34Y5z/AvdpOAjqupQ7tJJrKoW2hU9Gs/+qUce3XyLYzfWDdWOQ
	QavC98oNIDOs+i7cgstl4IZZJ7JZVJW4mraT1wRD+ROktLBt0N6V1PZMuikolxUIKjhop4We6dP
	kZOcNU5gn+Rdnpfj+2FySynTp5qSw2ufVSJL9f6hWDHBLqg10bbESU=
X-Google-Smtp-Source: AGHT+IFseIzEs67gwQVeeSsoHhjZ6MZyV8JpKTka1LXvAI3BfXrBvvNVo0pc9ykMQGHPJN472aKP9A==
X-Received: by 2002:a05:600c:1d28:b0:42c:b508:750e with SMTP id 5b1f17b1804b1-433ce41e40emr19349845e9.11.1732271604497;
        Fri, 22 Nov 2024 02:33:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb3134bsm2005518f8f.58.2024.11.22.02.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:33:24 -0800 (PST)
Date: Fri, 22 Nov 2024 13:33:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 27/29] drm/xe: Teach xe_sync layer about
 drm_xe_semaphore
Message-ID: <f5ffb9fd-1783-4c9b-98c8-bbb727e06fe7@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118233757.2374041-28-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/dma-fence-Add-dma_fence_preempt-base-class/20241121-124856
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241118233757.2374041-28-matthew.brost%40intel.com
patch subject: [RFC PATCH 27/29] drm/xe: Teach xe_sync layer about drm_xe_semaphore
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221644.U9ddWy9K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411221644.U9ddWy9K-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_sync.c:275 xe_sync_semaphore_parse() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +275 drivers/gpu/drm/xe/xe_sync.c

0f3343471ed4df Matthew Brost 2024-11-18  219  int xe_sync_semaphore_parse(struct xe_device *xe, struct xe_file *xef,
0f3343471ed4df Matthew Brost 2024-11-18  220  			    struct xe_sync_entry *sync,
0f3343471ed4df Matthew Brost 2024-11-18  221  			    struct drm_xe_semaphore __user *semaphore_user,
0f3343471ed4df Matthew Brost 2024-11-18  222  			    unsigned int flags)
0f3343471ed4df Matthew Brost 2024-11-18  223  {
0f3343471ed4df Matthew Brost 2024-11-18  224  	struct drm_xe_semaphore semaphore_in;
0f3343471ed4df Matthew Brost 2024-11-18  225  	struct drm_gem_object *gem_obj;
0f3343471ed4df Matthew Brost 2024-11-18  226  	struct xe_bo *bo;
0f3343471ed4df Matthew Brost 2024-11-18  227  
0f3343471ed4df Matthew Brost 2024-11-18  228  	if (copy_from_user(&semaphore_in, semaphore_user,
0f3343471ed4df Matthew Brost 2024-11-18  229  			   sizeof(*semaphore_user)))
0f3343471ed4df Matthew Brost 2024-11-18  230  		return -EFAULT;
0f3343471ed4df Matthew Brost 2024-11-18  231  
0f3343471ed4df Matthew Brost 2024-11-18  232  	if (XE_IOCTL_DBG(xe, semaphore_in.offset & 0x7 ||
0f3343471ed4df Matthew Brost 2024-11-18  233  			 !semaphore_in.handle || semaphore_in.token ||
0f3343471ed4df Matthew Brost 2024-11-18  234  			 semaphore_in.reserved[0] || semaphore_in.reserved[1]))
0f3343471ed4df Matthew Brost 2024-11-18  235  		return -EINVAL;
0f3343471ed4df Matthew Brost 2024-11-18  236  
0f3343471ed4df Matthew Brost 2024-11-18  237  	gem_obj = drm_gem_object_lookup(xef->drm, semaphore_in.handle);
0f3343471ed4df Matthew Brost 2024-11-18  238  	if (XE_IOCTL_DBG(xe, !gem_obj))
0f3343471ed4df Matthew Brost 2024-11-18  239  		return -ENOENT;
0f3343471ed4df Matthew Brost 2024-11-18  240  
0f3343471ed4df Matthew Brost 2024-11-18  241  	bo = gem_to_xe_bo(gem_obj);
0f3343471ed4df Matthew Brost 2024-11-18  242  
0f3343471ed4df Matthew Brost 2024-11-18  243  	if (XE_IOCTL_DBG(xe, bo->size < semaphore_in.offset)) {
0f3343471ed4df Matthew Brost 2024-11-18  244  		xe_bo_put(bo);
0f3343471ed4df Matthew Brost 2024-11-18  245  		return -EINVAL;
0f3343471ed4df Matthew Brost 2024-11-18  246  	}
0f3343471ed4df Matthew Brost 2024-11-18  247  
0f3343471ed4df Matthew Brost 2024-11-18  248  	if (flags & DRM_XE_SYNC_FLAG_SIGNAL) {
0f3343471ed4df Matthew Brost 2024-11-18  249  		struct iosys_map vmap = sync->bo->vmap;
0f3343471ed4df Matthew Brost 2024-11-18  250  		struct dma_fence *fence;
0f3343471ed4df Matthew Brost 2024-11-18  251  
0f3343471ed4df Matthew Brost 2024-11-18  252  		sync->chain_fence = dma_fence_chain_alloc();
0f3343471ed4df Matthew Brost 2024-11-18  253  		if (!sync->chain_fence) {
0f3343471ed4df Matthew Brost 2024-11-18  254  			xe_bo_put(bo);
0f3343471ed4df Matthew Brost 2024-11-18  255  			dma_fence_chain_free(sync->chain_fence);
0f3343471ed4df Matthew Brost 2024-11-18  256  			return -ENOMEM;
0f3343471ed4df Matthew Brost 2024-11-18  257  		}
0f3343471ed4df Matthew Brost 2024-11-18  258  
0f3343471ed4df Matthew Brost 2024-11-18  259  		fence = xe_hw_fence_alloc();
0f3343471ed4df Matthew Brost 2024-11-18  260  		if (IS_ERR(fence)) {
0f3343471ed4df Matthew Brost 2024-11-18  261  			xe_bo_put(bo);
0f3343471ed4df Matthew Brost 2024-11-18  262  			return PTR_ERR(fence);
0f3343471ed4df Matthew Brost 2024-11-18  263  		}
0f3343471ed4df Matthew Brost 2024-11-18  264  
0f3343471ed4df Matthew Brost 2024-11-18  265  		vmap = bo->vmap;
0f3343471ed4df Matthew Brost 2024-11-18  266  		iosys_map_incr(&vmap, semaphore_in.offset);
0f3343471ed4df Matthew Brost 2024-11-18  267  
0f3343471ed4df Matthew Brost 2024-11-18  268  		xe_hw_fence_user_init(fence, xe, vmap, semaphore_in.seqno);
0f3343471ed4df Matthew Brost 2024-11-18  269  		sync->fence = fence;
0f3343471ed4df Matthew Brost 2024-11-18  270  		sync->flags = IS_UNINSTALLED_HW_FENCE;
0f3343471ed4df Matthew Brost 2024-11-18  271  	} else {
0f3343471ed4df Matthew Brost 2024-11-18  272  		sync->user_fence = dma_fence_user_fence_alloc();
0f3343471ed4df Matthew Brost 2024-11-18  273  		if (XE_IOCTL_DBG(xe, !sync->user_fence)) {
                                                                             ^^^^^^^^^^^^^^^^^
user_fence is NULL

0f3343471ed4df Matthew Brost 2024-11-18  274  			xe_bo_put(bo);
0f3343471ed4df Matthew Brost 2024-11-18 @275  			return PTR_ERR(sync->ufence);
                                                                               ^^^^^^^^^^^^
returns success

0f3343471ed4df Matthew Brost 2024-11-18  276  		}
0f3343471ed4df Matthew Brost 2024-11-18  277  
0f3343471ed4df Matthew Brost 2024-11-18  278  		sync->addr = semaphore_in.offset;
0f3343471ed4df Matthew Brost 2024-11-18  279  		sync->timeline_value = semaphore_in.seqno;
0f3343471ed4df Matthew Brost 2024-11-18  280  		sync->flags = DRM_XE_SYNC_FLAG_SIGNAL;
0f3343471ed4df Matthew Brost 2024-11-18  281  	}
0f3343471ed4df Matthew Brost 2024-11-18  282  	sync->bo = bo;
0f3343471ed4df Matthew Brost 2024-11-18  283  
0f3343471ed4df Matthew Brost 2024-11-18  284  	return 0;
0f3343471ed4df Matthew Brost 2024-11-18  285  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

