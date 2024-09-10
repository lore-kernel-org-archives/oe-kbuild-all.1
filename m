Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56867188CC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725960479; cv=none; b=MrvlR5fOO91QVeoWeONpoWdS6WDa04CACM8lqebwUlManrDevorOyEQFxvpwlm9DG4Vqkh2K98qqKRvn0gRu/rUXhfLyIbjKgUUIiX7ctOh6oxAui6GUu5b6EaTABhvo54pee74NFJJeG1iPQe+msKY96eIbU5bYzunQnLrkTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725960479; c=relaxed/simple;
	bh=GNLsnEcDpfFnNAWR3urnvGUz3HpFXqK/e5cclewGaJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K0l4e+SjkU7q9KbVXNb+xkk+9Wpl5fZBXQg3V6e6S6STV72CKXXUD/SGmkPEKXixdXeFVhPc24IPVCF9d5II4ff7RhaSxXP4cGIjop/qAgQhrLZrRt8uhJLoTcox9xLc9vawotHun8y3RCfvvlSZXx0qyCXrjhHMmAPGPqhTmtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YUzqoHKR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YUzqoHKR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42bb6d3e260so5258215e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 02:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725960476; x=1726565276; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhnKEadp0MPVoUcjV0Ee6hhY+nUdAFKRksTQ0ZRfrgk=;
        b=YUzqoHKR4MeH/N+r6sgKNvKA5QB8BiiUWIys9PevaSb1iuaV2R2ZLN6bOXROwNygGh
         nrsLXfwd+39+vnl8NWBjIq0Dn2ImBGw6l4r0DFMG/KQ1wdoLf2/3l2ePy1JibJoa0UtH
         n+GT1rBQiD/xkYry7oZwUAK8pnwC+u8ChfMqmrOYovFTJcOxTNNBMcwaYBYG9ZwVQYby
         n5btjqhy/j7gWZ5Ql10/17lr12phnledRSHEPKX922OTDBdA98gUXmRKY1NSqYpnxVhj
         S1QOoihb3DyOs3lHRW3Ev4gV3f25+EDc2+zw1orKuvGt8UqebzK6nr1qj85uGZE7rDy7
         qy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960476; x=1726565276;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhnKEadp0MPVoUcjV0Ee6hhY+nUdAFKRksTQ0ZRfrgk=;
        b=p6FI+T+SuT6Yp0P1+Xyx8lHewYJsz9qw/DVUrpfXmrfFEIA/mwtX2mKIA4i0xsgY7g
         lQFLEgGYmJkWs/ZFhfV9aatkW+XxZ0/srsF466aKQLtfftFhyqmLMO1KGu7OiuVIcNtA
         QGFGV8FVtxUC3x5lmGzWndClvMDh3nUt4fPbpzgydb9ntCXQYO0yPPKUkeIz7boiFKFU
         eJkqETW9PTaSJY5ZzuydxPN1miqLxS756Q3NufbsX6mEF0QqzQ8tE6+ZO9Uq0VSePNWO
         iyRGiIZen9ZKQ6B4GBlO82+HuNwxrMGyYmE5TnZJN3dUxp923m4W79fz3UTAgjS3oA8X
         18gA==
X-Forwarded-Encrypted: i=1; AJvYcCXPBl/xQFl+btavig1srHGZfq/2zyTzlkDhWZ49dpnzGCRq5XQ90YE7Gn/6CwB91rLQ6qWHoAReiTuCMQmc@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsg4KDfmKpj0FdqFlCHsJS2hpuL0DiCcEMuYq/r/aeql54PwpT
	B80nQbJmb16BDMYdmptvdKkcg4JsKZ3WeHUT6GaqYwP2+oBspaEwcSNAXbs3UYs=
X-Google-Smtp-Source: AGHT+IHYchhen5w0uxVHZAvnfE6YNm/wjH0J795HWSo1Lj1fqJ5m0JnjNBPHqMDWgIxbc6loqogwbw==
X-Received: by 2002:a5d:484b:0:b0:374:b5fc:d31a with SMTP id ffacd0b85a97d-378895de475mr8692895f8f.25.1725960475513;
        Tue, 10 Sep 2024 02:27:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb4444asm104867585e9.22.2024.09.10.02.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 02:27:55 -0700 (PDT)
Date: Tue, 10 Sep 2024 12:27:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240905 24/29]
 drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn:
 passing zero to 'ERR_PTR'
Message-ID: <4d1d7a79-0f69-4036-a0b7-141f3f8c87c9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240905
head:   4291b5d19a8845a8dbe31516094fd1e01ac5ef5e
commit: eca216f94e05faab6b4e6d67ec3d95f2c6024ad3 [24/29] iommufd: Support attach/replace hwpt per pasid
config: i386-randconfig-141-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091622.yfNTNCSQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409091622.yfNTNCSQ-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/pasid.c:37 iommufd_device_pasid_do_attach() warn: passing zero to 'ERR_PTR'
drivers/iommu/iommufd/pasid.c:78 iommufd_device_pasid_do_replace() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +37 drivers/iommu/iommufd/pasid.c

eca216f94e05fa Yi Liu 2024-03-18  10  struct iommufd_hw_pagetable *
eca216f94e05fa Yi Liu 2024-03-18  11  iommufd_device_pasid_do_attach(struct iommufd_device *idev, ioasid_t pasid,
eca216f94e05fa Yi Liu 2024-03-18  12  			       struct iommufd_hw_pagetable *hwpt)
eca216f94e05fa Yi Liu 2024-03-18  13  {
eca216f94e05fa Yi Liu 2024-03-18  14  	void *curr;
eca216f94e05fa Yi Liu 2024-03-18  15  	int rc;
eca216f94e05fa Yi Liu 2024-03-18  16  
eca216f94e05fa Yi Liu 2024-03-18  17  	refcount_inc(&hwpt->obj.users);
eca216f94e05fa Yi Liu 2024-03-18  18  	curr = xa_cmpxchg(&idev->pasid_hwpts, pasid, NULL, hwpt, GFP_KERNEL);
eca216f94e05fa Yi Liu 2024-03-18  19  	if (curr) {
eca216f94e05fa Yi Liu 2024-03-18  20  		if (curr == hwpt)
eca216f94e05fa Yi Liu 2024-03-18  21  			rc = 0;

Are you sure we should call refcount_dec(&hwpt->obj.users) for this path?

This Smatch heuristic is always going to have false positives because calling
ERR_PTR(NULL) is perfectly valid.  So don't worry about it if the code is
correct.  But maybe add a comment explaining that /* we don't bump the ref count
if we're already on the current hw port */ or whatever.

eca216f94e05fa Yi Liu 2024-03-18  22  		else
eca216f94e05fa Yi Liu 2024-03-18  23  			rc = xa_err(curr) ? : -EBUSY;
eca216f94e05fa Yi Liu 2024-03-18  24  		goto err_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  25  	}
eca216f94e05fa Yi Liu 2024-03-18  26  
eca216f94e05fa Yi Liu 2024-03-18  27  	rc = iommufd_hwpt_attach_device(hwpt, idev, pasid);
eca216f94e05fa Yi Liu 2024-03-18  28  	if (rc) {
eca216f94e05fa Yi Liu 2024-03-18  29  		xa_erase(&idev->pasid_hwpts, pasid);
eca216f94e05fa Yi Liu 2024-03-18  30  		goto err_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  31  	}
eca216f94e05fa Yi Liu 2024-03-18  32  
eca216f94e05fa Yi Liu 2024-03-18  33  	return NULL;
eca216f94e05fa Yi Liu 2024-03-18  34  
eca216f94e05fa Yi Liu 2024-03-18  35  err_put_hwpt:
eca216f94e05fa Yi Liu 2024-03-18  36  	refcount_dec(&hwpt->obj.users);
eca216f94e05fa Yi Liu 2024-03-18 @37  	return ERR_PTR(rc);
eca216f94e05fa Yi Liu 2024-03-18  38  }
eca216f94e05fa Yi Liu 2024-03-18  39  
eca216f94e05fa Yi Liu 2024-03-18  40  struct iommufd_hw_pagetable *
eca216f94e05fa Yi Liu 2024-03-18  41  iommufd_device_pasid_do_replace(struct iommufd_device *idev, ioasid_t pasid,
eca216f94e05fa Yi Liu 2024-03-18  42  				struct iommufd_hw_pagetable *hwpt)
eca216f94e05fa Yi Liu 2024-03-18  43  {
eca216f94e05fa Yi Liu 2024-03-18  44  	void *curr;
eca216f94e05fa Yi Liu 2024-03-18  45  	int rc;
eca216f94e05fa Yi Liu 2024-03-18  46  
eca216f94e05fa Yi Liu 2024-03-18  47  	refcount_inc(&hwpt->obj.users);
eca216f94e05fa Yi Liu 2024-03-18  48  	curr = xa_store(&idev->pasid_hwpts, pasid, hwpt, GFP_KERNEL);
eca216f94e05fa Yi Liu 2024-03-18  49  	rc = xa_err(curr);
eca216f94e05fa Yi Liu 2024-03-18  50  	if (rc)
eca216f94e05fa Yi Liu 2024-03-18  51  		goto out_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  52  
eca216f94e05fa Yi Liu 2024-03-18  53  	if (!curr) {
eca216f94e05fa Yi Liu 2024-03-18  54  		xa_erase(&idev->pasid_hwpts, pasid);
eca216f94e05fa Yi Liu 2024-03-18  55  		rc = -EINVAL;
eca216f94e05fa Yi Liu 2024-03-18  56  		goto out_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  57  	}
eca216f94e05fa Yi Liu 2024-03-18  58  
eca216f94e05fa Yi Liu 2024-03-18  59  	if (curr == hwpt)
eca216f94e05fa Yi Liu 2024-03-18  60  		goto out_put_hwpt;

Same question.

eca216f94e05fa Yi Liu 2024-03-18  61  
eca216f94e05fa Yi Liu 2024-03-18  62  	/*
eca216f94e05fa Yi Liu 2024-03-18  63  	 * After replacement, the reference on the old hwpt is retained
eca216f94e05fa Yi Liu 2024-03-18  64  	 * in this thread as caller would free it.
eca216f94e05fa Yi Liu 2024-03-18  65  	 */
eca216f94e05fa Yi Liu 2024-03-18  66  	rc = iommufd_hwpt_replace_device(idev, pasid, hwpt, curr);
eca216f94e05fa Yi Liu 2024-03-18  67  	if (rc) {
eca216f94e05fa Yi Liu 2024-03-18  68  		WARN_ON(xa_err(xa_store(&idev->pasid_hwpts, pasid,
eca216f94e05fa Yi Liu 2024-03-18  69  					curr, GFP_KERNEL)));
eca216f94e05fa Yi Liu 2024-03-18  70  		goto out_put_hwpt;
eca216f94e05fa Yi Liu 2024-03-18  71  	}
eca216f94e05fa Yi Liu 2024-03-18  72  
eca216f94e05fa Yi Liu 2024-03-18  73  	/* Caller must destroy old_hwpt */
eca216f94e05fa Yi Liu 2024-03-18  74  	return curr;
eca216f94e05fa Yi Liu 2024-03-18  75  
eca216f94e05fa Yi Liu 2024-03-18  76  out_put_hwpt:
eca216f94e05fa Yi Liu 2024-03-18  77  	refcount_dec(&hwpt->obj.users);
eca216f94e05fa Yi Liu 2024-03-18 @78  	return ERR_PTR(rc);
eca216f94e05fa Yi Liu 2024-03-18  79  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

