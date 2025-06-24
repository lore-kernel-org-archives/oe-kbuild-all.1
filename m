Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8F228ECE2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776440; cv=none; b=m9MSVil343Uk7p++q13bzVdB1gnvBj4VEJtC/rcmmOUwMC05kIEweoatreidsQT/zKprkrXn3JG+kbHJqJIUQA2zsHOBWF/vpBRx4SYSMYCcAYLv9S1+ZdU24k5NS8BhtOnghZRrx+L71wHfPDmehuLHQ3KAld3yovenLSAeJk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776440; c=relaxed/simple;
	bh=8ndPHen9gVkkJ8keDVpzacmHbP27NW7V1US5clTByPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=R9ZLkqi6YXSjvlEARLJJLXSR9iu1VTfv/DS30eqzMgrDk2rQ8GwmUYxGTDy4v5uF0V5oVQWH6kCblw3CHitaSk9vZh2V1uAcD/YTCSEXhbPMDoVHEoiuXXkQ1VDa+d5QtgDwSoq8/PxCXJgJPLOdQk894wDBl4YELFgGc4JDoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7BfidS7; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7BfidS7"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so148697fac.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750776438; x=1751381238; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uA5wqktVLlF/6ye0p0dHnC0cgi9tO2Q4YJtZShQkDM=;
        b=U7BfidS7jp6xxwHRrvNEMFRVwuW4RrPkzAlcOW327VL80THoyMoLLx7vwPtLwGOhi1
         T6dS7iRD/00FCmUvXmllhsg2OBI4Fh7yCLa6oK7y4WF09jg8ODQKejUW1+nyiZytI9v0
         yIUpYwNwrZcbcSpPfeyWnaUGLfl2vQYl25UADQ3TqNvzlih8gaHpKMPvQps9WX+vLgro
         apy0OOv1MrXCFDdhj4Bug+dSsHdFwwSz0EmMhbUT9eC6UTmgL/0kPrRnt66oteAPIPaH
         0JtiAeDA4tkb7QeZ5GD2zBJXA7ZfVzuZ+SGb+Wwx9wLUDaCuyKEuT0gznauGAqO4pqqn
         xKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776438; x=1751381238;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uA5wqktVLlF/6ye0p0dHnC0cgi9tO2Q4YJtZShQkDM=;
        b=XyHQvOfIYexvueYvBREfCd5TfFSW4FEcVkCtexCnNYF1nHcUgshpGTlQZfD0896FEo
         lNTah4bN6WT+G4tSDBjKfKR7gCym5dXy60eJboHnOD/d3u/QgTDqjxnrPnWuhh5FERI6
         oWkMD+bWE0pev2Y8L3c1oxGUcPKHoLHV8YLDWDZCKeYxrPcVSEt80krQJULRV6QRx7n/
         BP+Rrj5099Pab+bWmNFoApjkLc8eJK2gbPTuR6vQTmyetbPiazLT+iTb3HuhAVBpjHXM
         9AJo75ZmfmraCfcEHOONosHBJhA46LHpiyZ6VhTBr4LsLdyrH/cWpy+jWGx7NnoP4QiW
         Zrbg==
X-Forwarded-Encrypted: i=1; AJvYcCUkxJhCzM2dswbFa6nQWBysUn50JI+Chv99qkKS5xdRAPmaR2G4c+U5wEwRrDAr+CAIj7O3msx2lxyfr9Ch@lists.linux.dev
X-Gm-Message-State: AOJu0YwS6gsS2WCpUFeahDfarr2HL00+VYC06CsgDfgNIccgxw0rb6wY
	P41uxTiGPkuiYxdS6oqKK9UTnz5VzSHZNTDITbQ/hiahNCqtm0RCJI0UdqIW2/++4/E=
X-Gm-Gg: ASbGnctmqm45i/sPSgszEOGYAa9KV1HYPmbqFHktja11gfHxKbmwMRfjdv4gWx2p4VO
	a1TnEBLCrG5TX8+e4Y2FL7bhMuVyzSPKQu1Xs+BygXswPZwOvwZ+RLeTeKHD90LU2h7b1B58jjR
	+dMGQANYkEriMCgSoK3eqWFaBzxQ+epEksxk+s3G6jNzYUEVFE/qg9l/A8WoAR9a9FjHX5F8KMk
	7232b44sMs3Aux4DOIrvKiaynEQLw5ANYoEXj5NcY8thj5scGzTMRi+Xcm2sYhIXvyG3z0eeavT
	0VC8EAPDVsxCFnqG+0UJQO7Q15sNORkKJxFPHFX3wDJlkQRDm3WNdHPYkfwwz/n8M2ZAdQ==
X-Google-Smtp-Source: AGHT+IGt8ie5ZbF0x4WPTsVM6n791kVfLV7Ad3NJEmRPz2hPk2XoNedp9cCuBS6gbjfhNJu6obKMeQ==
X-Received: by 2002:a05:6870:2487:b0:2c2:b9cc:afb8 with SMTP id 586e51a60fabf-2eeda4e389cmr9736316fac.7.1750776438135;
        Tue, 24 Jun 2025 07:47:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee6655a39asm2104434fac.15.2025.06.24.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:47:16 -0700 (PDT)
Date: Tue, 24 Jun 2025 17:47:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zhongkun He <hezhongkun.hzk@bytedance.com>,
	akpm@linux-foundation.org, tytso@mit.edu, jack@suse.com,
	hannes@cmpxchg.org, mhocko@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, muchun.song@linux.dev,
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, cgroups@vger.kernel.org,
	Zhongkun He <hezhongkun.hzk@bytedance.com>,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH 1/2] mm: memcg: introduce PF_MEMALLOC_ACCOUNTFORCE to
 postpone reclaim to return-to-userland path
Message-ID: <400e2b89-1ad7-4626-9ee0-e45a9e5b5227@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71a4bbc284048ceb38eaac53dfa1031f92ac52b7.1750234270.git.hezhongkun.hzk@bytedance.com>

Hi Zhongkun,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongkun-He/mm-memcg-introduce-PF_MEMALLOC_ACCOUNTFORCE-to-postpone-reclaim-to-return-to-userland-path/20250618-194101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/71a4bbc284048ceb38eaac53dfa1031f92ac52b7.1750234270.git.hezhongkun.hzk%40bytedance.com
patch subject: [PATCH 1/2] mm: memcg: introduce PF_MEMALLOC_ACCOUNTFORCE to postpone reclaim to return-to-userland path
config: i386-randconfig-141-20250619 (https://download.01.org/0day-ci/archive/20250624/202506242032.uShv7ASV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506242032.uShv7ASV-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:2341 mem_cgroup_handle_over_max() warn: use 'gfp_mask' here instead of GFP_KERNEL?

vim +/gfp_mask +2341 mm/memcontrol.c

b5db553cc19549 Zhongkun He 2025-06-18  2320  void mem_cgroup_handle_over_max(gfp_t gfp_mask)
                                                                                   ^^^^^^^^
b5db553cc19549 Zhongkun He 2025-06-18  2321  {
b5db553cc19549 Zhongkun He 2025-06-18  2322  	unsigned long nr_reclaimed = 0;
b5db553cc19549 Zhongkun He 2025-06-18  2323  	unsigned int nr_pages = current->memcg_nr_pages_over_max;
b5db553cc19549 Zhongkun He 2025-06-18  2324  	int nr_retries = MAX_RECLAIM_RETRIES;
b5db553cc19549 Zhongkun He 2025-06-18  2325  	struct mem_cgroup *memcg, *mem_over_limit;
b5db553cc19549 Zhongkun He 2025-06-18  2326  
b5db553cc19549 Zhongkun He 2025-06-18  2327  	if (likely(!nr_pages))
b5db553cc19549 Zhongkun He 2025-06-18  2328  		return;
b5db553cc19549 Zhongkun He 2025-06-18  2329  
b5db553cc19549 Zhongkun He 2025-06-18  2330  	memcg = get_mem_cgroup_from_mm(current->mm);
b5db553cc19549 Zhongkun He 2025-06-18  2331  	current->memcg_nr_pages_over_max = 0;
b5db553cc19549 Zhongkun He 2025-06-18  2332  
b5db553cc19549 Zhongkun He 2025-06-18  2333  retry:
b5db553cc19549 Zhongkun He 2025-06-18  2334  	mem_over_limit = get_over_limit_memcg(memcg);
b5db553cc19549 Zhongkun He 2025-06-18  2335  	if (!mem_over_limit)
b5db553cc19549 Zhongkun He 2025-06-18  2336  		goto out;
b5db553cc19549 Zhongkun He 2025-06-18  2337  
b5db553cc19549 Zhongkun He 2025-06-18  2338  	while (nr_reclaimed < nr_pages) {
b5db553cc19549 Zhongkun He 2025-06-18  2339  		unsigned long reclaimed;
b5db553cc19549 Zhongkun He 2025-06-18  2340  
b5db553cc19549 Zhongkun He 2025-06-18 @2341  		reclaimed = try_to_free_mem_cgroup_pages(mem_over_limit,
b5db553cc19549 Zhongkun He 2025-06-18  2342  					nr_pages, GFP_KERNEL,

I guess GFP_KERNEL is fine.  The gfp_mask is used below.  Don't worry
about this one if the GFP_KERNEL is intended.  Just ignore the warning
message.

b5db553cc19549 Zhongkun He 2025-06-18  2343  					MEMCG_RECLAIM_MAY_SWAP,
b5db553cc19549 Zhongkun He 2025-06-18  2344  					NULL);
b5db553cc19549 Zhongkun He 2025-06-18  2345  
b5db553cc19549 Zhongkun He 2025-06-18  2346  		if (!reclaimed && !nr_retries--)
b5db553cc19549 Zhongkun He 2025-06-18  2347  			break;
b5db553cc19549 Zhongkun He 2025-06-18  2348  
b5db553cc19549 Zhongkun He 2025-06-18  2349  		nr_reclaimed += reclaimed;
b5db553cc19549 Zhongkun He 2025-06-18  2350  	}
b5db553cc19549 Zhongkun He 2025-06-18  2351  
b5db553cc19549 Zhongkun He 2025-06-18  2352  	if ((nr_reclaimed < nr_pages) &&
b5db553cc19549 Zhongkun He 2025-06-18  2353  	    (page_counter_read(&mem_over_limit->memory) >
b5db553cc19549 Zhongkun He 2025-06-18  2354  	    READ_ONCE(mem_over_limit->memory.max)) &&
b5db553cc19549 Zhongkun He 2025-06-18  2355  	    mem_cgroup_oom(mem_over_limit, gfp_mask,
b5db553cc19549 Zhongkun He 2025-06-18  2356  			  get_order((nr_pages - nr_reclaimed)  * PAGE_SIZE))) {
b5db553cc19549 Zhongkun He 2025-06-18  2357  		nr_retries = MAX_RECLAIM_RETRIES;
b5db553cc19549 Zhongkun He 2025-06-18  2358  		goto retry;
b5db553cc19549 Zhongkun He 2025-06-18  2359  	}
b5db553cc19549 Zhongkun He 2025-06-18  2360  
b5db553cc19549 Zhongkun He 2025-06-18  2361  out:
b5db553cc19549 Zhongkun He 2025-06-18  2362  	css_put(&memcg->css);
b5db553cc19549 Zhongkun He 2025-06-18  2363  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

