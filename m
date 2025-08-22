Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FFB150997
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755883052; cv=none; b=ST4DsXUX3QCMpzncTj5uI6SjCQJx/cJNPOaRtlXtEVESf58H9mQS0IOH63B00aRqDwk0BmWyHDo2fGJbECrmJiktDIqOnrpfMy9zcE/Lj6wExpNSplw5qJtFJi0bTD5mGHMEmtEu4STLdjazMZS4Ygjd7bPyGYU6FUuTYtCQ5Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755883052; c=relaxed/simple;
	bh=5Udo/f8ent/K3o9ISDeOwIWa6pto6XFRhDz1qdZBK/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=teMX6xenwqJo6Cz5Y2lHnvHzE4YCrAD9ByVKm5M4RglBiEegyE9d5FenhGQBQu2WXIPvLb3quMtmMxGlyqovS+QCdHNOBqoK94fdbxLDIh413q6LBjXkr4YZNthXQmfurOrOC7ddOW9/BIS6ji+800ptoE1UIjV07snHUZHk+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvKBpqrx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvKBpqrx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso11761895e9.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755883049; x=1756487849; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nG60mJTcfDhZrN0Chr9ou2fiLnhkow+tZ1jRLbxcJ6I=;
        b=QvKBpqrxExOlTeP/hf1QNxq/OyJjoL7jBQNzpdQ8sLN8BGhl17rygW04b8F8p+6FKg
         9aBq4kZoQeaANxXEug+oBeE5BGkgWZE4PYtRgqQow7Au+QvJYVUjo3uIk8Oj05Rb7QV0
         cz46HGZE4r/jxpHKn1oFBVvzFd+hA8iuGB6qnFHsZcxcNzv6qq+PnUTlnWYpzX1goiER
         auc+49ct+6n8qcrOKt+pleQ5xYkdimi86f4vZjdGYvC3tNwGHDvZSb5SREkjznWWaRee
         m11vaBgP5gRbrAbmmUYdXwReAD/L17ku5ZQEp5TtI9CGIErH3j6nslxjPSFBJ1HXQfPq
         vDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755883049; x=1756487849;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nG60mJTcfDhZrN0Chr9ou2fiLnhkow+tZ1jRLbxcJ6I=;
        b=qG/YRZdcdUxph1gZhus3p5CkaW6RDToyBpLIK8swbEe3xLXpHg+vOaJGidWG40IjD6
         y1CanQelrjT297BeIOIeg5OFS9/hxyI7kZ8wqPno3ZzfqHZI9zIs051D6uflWGRcgnX8
         wlJxbzR7PjcVMVDJfsmuGaIAgftqIX7f2w+CsU+fUaH5k7KubKXCullzlhsCWFIdlwcc
         1wi2cKSsBoxlu0col+iVc4L432Cv6EXmMtOeCaUHvLYk/Wl7F2JnG7Ga90n+V46Lw06d
         BAFaQL6VvCgVxza/AmUwziculrDmfvmeXMf1bilpQG01MKPqb1tMIsGIju1fl9peUUxC
         Joqw==
X-Forwarded-Encrypted: i=1; AJvYcCXig1oAbJs27X+6QPb6scmrDMXkFyUyKXYqMPes1DYfSFRoUuiFOrqPKqLoZmMiFaPKnFR/RiMYQS2RCeum@lists.linux.dev
X-Gm-Message-State: AOJu0YzZixjCz/ST/R4EPP0D6M0dz0hPgwmqho7ivOlASvHzyzyenksg
	s4IWvpUnWxH9b9y42Kd7Y8UjmU0DQI+iEwEP8YflUbdfqnpqCnjXhs0V2e29cojK1lY=
X-Gm-Gg: ASbGncsbvkYy6DV29DVzGJmgE9xlGvordvZ8hfaTq0DJFMcW8vnQlV+jwt2Mr5UzMba
	a6Fxii2oOJrSFQ2t7NaHfLawDAXeTLhHQobTrrFU8khfsRy4TVvjAiWkaTJ5bgLULRaRviVnM7z
	I2xM5MlDCXltgTCVNBSmdC5Jnv1ilag76JqBXUtXOKi53URAJ2HhicNeH/dyoaaYEOfK6pbO/CM
	0H3vDFEeTk+rpWM8+xoJmuGJFd5HSMqeBprM+lJwDCCa+8LUBnrXnSRgewy4ybS8dPEE99ILi6c
	wj22yfbmCs6iLqI3aD0eRcFF/c46cAxKKFeBguKQjSlflJp01/t3uiB20Xx9cj2U8qlb2tfMD3i
	MfnAk/hh+mGqYWNrZUxebUua1FP0=
X-Google-Smtp-Source: AGHT+IE6I2k6xPHD429XkzRqTgiEYzD1yR/BB8fOScRUjLp3oce39ToFkb+CldfR2IO0M4Ry6HmIRg==
X-Received: by 2002:a05:600c:4fcb:b0:458:bc58:850c with SMTP id 5b1f17b1804b1-45b5179f436mr29795645e9.1.1755883049157;
        Fri, 22 Aug 2025 10:17:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c7117d5977sm207666f8f.51.2025.08.22.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:17:28 -0700 (PDT)
Date: Fri, 22 Aug 2025 20:17:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rob Clark <robdclark@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Antonino Maniscalco <antomani103@gmail.com>
Subject: drivers/gpu/drm/msm/msm_iommu.c:778 msm_iommu_gpu_new() error: we
 previously assumed 'adreno_smmu' could be null (see line 767)
Message-ID: <202508230010.dMoERmOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf6fc5eefc5bbbbff92a085039ff74cdbd065c29
commit: e601ea31d66ba83d565cae9cfa45cbbcdd8286dd drm/msm: Support pgtable preallocation
config: arm64-randconfig-r071-20250822 (https://download.01.org/0day-ci/archive/20250823/202508230010.dMoERmOs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508230010.dMoERmOs-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_iommu.c:778 msm_iommu_gpu_new() error: we previously assumed 'adreno_smmu' could be null (see line 767)

vim +/adreno_smmu +778 drivers/gpu/drm/msm/msm_iommu.c

8cceb773f565f3 Dmitry Baryshkov 2023-02-14  756  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  757  {
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  758  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  759  	struct msm_iommu *iommu;
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  760  	struct msm_mmu *mmu;
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  761  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  762  	mmu = msm_iommu_new(dev, quirks);
db40d2928d245f Luca Weiss       2023-05-08  763  	if (IS_ERR_OR_NULL(mmu))
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  764  		return mmu;
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  765  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  766  	iommu = to_msm_iommu(mmu);
e601ea31d66ba8 Rob Clark        2025-06-29 @767  	if (adreno_smmu && adreno_smmu->cookie) {
                                                            ^^^^^^^^^^^
Check for NULL.  Hopefully this can be removed.

e601ea31d66ba8 Rob Clark        2025-06-29  768  		const struct io_pgtable_cfg *cfg =
e601ea31d66ba8 Rob Clark        2025-06-29  769  			adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
e601ea31d66ba8 Rob Clark        2025-06-29  770  		size_t tblsz = get_tblsz(cfg);
e601ea31d66ba8 Rob Clark        2025-06-29  771  
e601ea31d66ba8 Rob Clark        2025-06-29  772  		iommu->pt_cache =
e601ea31d66ba8 Rob Clark        2025-06-29  773  			kmem_cache_create("msm-mmu-pt", tblsz, tblsz, 0, NULL);
e601ea31d66ba8 Rob Clark        2025-06-29  774  	}
f66f3cf6bc42ab Abhinav Kumar    2025-02-19  775  	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  776  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  777  	/* Enable stall on iommu fault: */
8cceb773f565f3 Dmitry Baryshkov 2023-02-14 @778  	if (adreno_smmu->set_stall)
                                                            ^^^^^^^^^^^^^^^^^^^^^^
Because otherwise we are toasted.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

