Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D8E37702
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 05:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706591587; cv=none; b=I8heJBvIeA0hEM5Bqqq5fEkYJXt+ItDIUuyV+zz/pUT5rTM7E9NtXeo7CT+YTVW3R2hzpfe335PoSvtQ0dfPC4mtfKQg+Ai3k5Ig9oS01Fg9SSQAZiYMrrNXoIJkKw0KhzXLAFP+D2wf/nmRs8p7pgEaYAdvcFOuLLKDWNp0dZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706591587; c=relaxed/simple;
	bh=jm+IbRvOLBBftDdu6HVRQEikyw7DWMZaFSdBcsKbPCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pP5puZK2U6TfxIf2C/F+u3msTiw3TfWP76+qWp8qsl6wOnONVbxefSI4Lhmw9YKBmC+tOLBcRTrbFNYxuZwz1pmrcq4Ju+x0reWo/LpkiAQpv9hKFkQG8NYCC3NIGrVMMeliNYu/QyTSX2yNke4eWtKV+YHxpjfLagpE1y4yj4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPWb6Aig; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPWb6Aig"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e800461baso49266945e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 21:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706591583; x=1707196383; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgeDU61xpXmO9yARRomsrfS77QJfqHMvQL82d6t3wk0=;
        b=FPWb6AigsflKZfAOYafnG2WMHZo23judL5ENsdIWmwk/XIed2Cxo9slneFpK8YYPAj
         Z6xoQv3SlxZwX4PJMBf4IeUqs47rwqbIEqFEAdvQo0En1qtTi9hQQ1G8Ua5l49H1cQVg
         v1JODq8GAlqorj6Y6KNsBdP5hBBxSCmpqCMVz6dgDayjy3hJBRXp6hinHfKqOEnFaEdB
         bZhgfgDgnZtLxhSX+KIG2DaP6BtkKREBzXn6yt9uUlk+0jY7x/Efbv0cdC7lSKQeCTRL
         6OJQZSOulfddc2qAexZYV0fBvIKSNIilPqLXJTmTAaG9Q27eoxRJzbAiI/aCkR4yaBLc
         GPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706591583; x=1707196383;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgeDU61xpXmO9yARRomsrfS77QJfqHMvQL82d6t3wk0=;
        b=bHcqgUp/nzfsCrca3cU1SSyupbfHqAiA/8m+kRi66O8wU+15zHYk6x6WTU4Ek7P1wM
         iu2KMwA/J8p8z1SVkoYZGbpC2j2/Ir/RqL6gHYFMWmD6vzjxh7IuDttEqj3LL5TWe4U8
         NSmq9qZPuc1VPKVDfx9GA5w09L2/0ceyAG3Bq97h8KVIitstsSe8CfRzO7oSD/5lI5jC
         1G9vcFxffTpOCA0VgpXCO9pIPl+mki/7Ku+jqejbDceniq4B2P2ohlkASGHpykqnmk/g
         Y4uVvrQ5shdEOI3QzQVM4VjZzp8LEvG8p5aj72tStTteJU6K9O4x/367E5Gj8hyh1BqO
         YX3A==
X-Gm-Message-State: AOJu0YwjOikg3jo6PmU5+VQNDo3gxaf/ToJaix2WYJKl4DdLdTmw1fJZ
	FryRLiQ/EwL4oGFYMnYckXBv6JjZ3izVmXN1rV+soisUNkOW3kVcPG3jPuXJcOw=
X-Google-Smtp-Source: AGHT+IEWywyF/XrrWi7Mz9vD7AK2hoDQAcOwEQjixZKeoSfeXBjBDZvimd+by4z7GcPqn9/zBswmoQ==
X-Received: by 2002:a05:600c:3ba7:b0:40e:f161:bf10 with SMTP id n39-20020a05600c3ba700b0040ef161bf10mr5828652wms.16.1706591583404;
        Mon, 29 Jan 2024 21:13:03 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b0040ebf603a89sm15486103wmq.11.2024.01.29.21.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 21:13:03 -0800 (PST)
Date: Tue, 30 Jan 2024 08:13:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Suren Baghdasaryan <surenb@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 2565/2825] mm/userfaultfd.c:983
 move_zeropage_pte() warn: inconsistent returns 'dst_ptl'.
Message-ID: <1a42e4fc-54a0-49f1-94ba-f075e0ef29a8@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   596764183be8ebb13352b281a442a1f1151c9b06
commit: ea4df6a5ea81105879ca5549555e231c4596fbc4 [2565/2825] userfaultfd: handle zeropage moves by UFFDIO_MOVE
config: x86_64-randconfig-161-20240129 (https://download.01.org/0day-ci/archive/20240130/202401300107.U8iMAkTl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401300107.U8iMAkTl-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:983 move_zeropage_pte() warn: inconsistent returns 'dst_ptl'.

vim +/dst_ptl +983 mm/userfaultfd.c

ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  962  static int move_zeropage_pte(struct mm_struct *mm,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  963  			     struct vm_area_struct *dst_vma,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  964  			     struct vm_area_struct *src_vma,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  965  			     unsigned long dst_addr, unsigned long src_addr,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  966  			     pte_t *dst_pte, pte_t *src_pte,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  967  			     pte_t orig_dst_pte, pte_t orig_src_pte,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  968  			     spinlock_t *dst_ptl, spinlock_t *src_ptl)
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  969  {
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  970  	pte_t zero_pte;
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  971  
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  972  	double_pt_lock(dst_ptl, src_ptl);
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  973  	if (!pte_same(ptep_get(src_pte), orig_src_pte) ||
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  974  	    !pte_same(ptep_get(dst_pte), orig_dst_pte))
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  975  		return -EAGAIN;

double_pt_unlock(dst_ptl, src_ptl) before returning?

ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  976  
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  977  	zero_pte = pte_mkspecial(pfn_pte(my_zero_pfn(dst_addr),
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  978  					 dst_vma->vm_page_prot));
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  979  	ptep_clear_flush(src_vma, src_addr, src_pte);
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  980  	set_pte_at(mm, dst_addr, dst_pte, zero_pte);
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  981  	double_pt_unlock(dst_ptl, src_ptl);
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  982  
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24 @983  	return 0;
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  984  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

