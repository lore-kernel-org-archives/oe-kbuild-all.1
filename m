Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D21433C9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 16:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717949039; cv=none; b=XtiakSFAHiq1OgTJ9dn3T/uIgqqmNAx8Lgt4zvs2hLPk79errKdOtOWrhOciF4pQ8/Am5rUMzevr1Oac/S28zZr0QaliEoT9C56tn4px/kd2oGfM+w4uD2gZZz1gZcHDXVb+dCyqvP7kWZ39yVprdFyCOl3So4+3oC/NfMudmG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717949039; c=relaxed/simple;
	bh=uD5a4WMTGSS3ZEm5Ef1829h1zi+/FPA4MqgR7hJ/R/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EMvE/byiWM7qQ+Ro3WeklW028J3ImsQXFsjitejj46KekmsGIlviAtVizSt8dZ2KKkivjxN/PB2WH2wZinF07qrZpW6D69w1Yhrq9ID3snbywLl92mhx2jAAd1KkzBy4Sn8z+LOJnHW78YbIyth/vlPTGdnVf44HPkM8RS1WtYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qcJZ02kG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qcJZ02kG"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so1229022e87.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 09 Jun 2024 09:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717949036; x=1718553836; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2VNLbj93PjSART7sD685Za7R6d9S+vSVdbT1Jxc7+AY=;
        b=qcJZ02kGl+Y+FZOo3nLyxnKglu8g2eqUTXSPpD1e466ZH96FW7B6+xGghbzJvZZNoI
         9cjvev5Teh3NiqUfSkv/9qG7HgMN+P3emYTDqIk7pr449ZyX64nHumqn1oxZbZ4aYph2
         7jgVgukC5w00mLdtx2SnCRJNdLk3PZjmvbl9UAVcZesfFI3NaD9UIlq+7TRpfopLqLml
         0c/Bq/OQ9FoSB8Pi0yPzMcK4GInN7r5JajNvZgeXU67Fnfz963tGGgoZ/yGsBMcF1roF
         z+Y4C5CLc8MT7vhJytR7YOpnguK3+RWpGhmnSUFOuZsQuchyhI8UcI/Dbh+1/OERlk/1
         r/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717949036; x=1718553836;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VNLbj93PjSART7sD685Za7R6d9S+vSVdbT1Jxc7+AY=;
        b=DTsvAWX6LrpcCngmKJIOCYixaJu8Q/zor1vhPV0BvKrqogBHWYik9p8wbrYmfGOzPG
         bf9g0RGzP5DaY7kvhrQmJr9w/d78UctDOWbLSeAF8PAR7M9OAezciUOKincktBFVnyKr
         r+G3kkcRuwanZZjHD0YJ8O4WUZqSySKPwGLXr1Yb3cB3jOwvW+ycXoyc+keAnJoba76Z
         cWQyZjprZGp20f2gdNtZIZTSz+bmIpnoXqdB+HvfF2JhllTLm2SMRLUkkFJgbM5MEjsu
         mkHvsi12IOdn1XOntGvogSmlhdFJFfr9uzWD0OLxfb2Q6e7wvID+i6uRwvOQW7abq0lP
         Yk5g==
X-Forwarded-Encrypted: i=1; AJvYcCWIoVhp+4+NlYoXHYI6T5C/+iGXVFPrKnNTMYXtYG+3ps36eeZrrf8GzbNcA1Goa5lplSJ73srzJzCpdaZeK/DP3AodYAgTdsoiYO9T5g==
X-Gm-Message-State: AOJu0Yz0pJ7sjegQXK+r0CzxLnYEg0RS+TD22zngq4asnaclF4ibn2lm
	ESb9LIR7Z7soIAlHNA28/m6uRacCsuhav1+3+577mJL7I74/CkIW0ZXntc//ZY4=
X-Google-Smtp-Source: AGHT+IGVIKuHGzbO1QP1oVSmFQWhwh0Upqk/8HkvnNom2ucX7YAhQ+a9WXovzeXN3e+1uk9SG/pSwQ==
X-Received: by 2002:a19:5f5b:0:b0:520:c2c1:153a with SMTP id 2adb3069b0e04-52bb9fd2521mr4412443e87.58.1717949035267;
        Sun, 09 Jun 2024 09:03:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c1aa3e4sm114257815e9.15.2024.06.09.09.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 09:03:54 -0700 (PDT)
Date: Sun, 9 Jun 2024 19:03:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	ying.huang@intel.com, Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>, Mel Gorman <mgorman@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>, liushixin2@huawei.com,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
Message-ID: <100add53-aa58-44ce-a15d-8438001fb2b9@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607103241.1298388-1-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-fix-possible-OOB-in-numa_rebuild_large_mapping/20240607-183609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240607103241.1298388-1-wangkefeng.wang%40huawei.com
patch subject: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
config: mips-randconfig-r081-20240609 (https://download.01.org/0day-ci/archive/20240609/202406092325.eDrcikT8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406092325.eDrcikT8-lkp@intel.com/

smatch warnings:
mm/memory.c:5370 do_numa_page() error: uninitialized symbol 'nr_pages'.

vim +/nr_pages +5370 mm/memory.c

2b7403035459c7 Souptick Joarder  2018-08-23  5265  static vm_fault_t do_numa_page(struct vm_fault *vmf)
d10e63f29488b0 Mel Gorman        2012-10-25  5266  {
82b0f8c39a3869 Jan Kara          2016-12-14  5267  	struct vm_area_struct *vma = vmf->vma;
6695cf68b15c21 Kefeng Wang       2023-09-21  5268  	struct folio *folio = NULL;
6695cf68b15c21 Kefeng Wang       2023-09-21  5269  	int nid = NUMA_NO_NODE;
d2136d749d76af Baolin Wang       2024-03-29  5270  	bool writable = false, ignore_writable = false;
d2136d749d76af Baolin Wang       2024-03-29  5271  	bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
90572890d20252 Peter Zijlstra    2013-10-07  5272  	int last_cpupid;
cbee9f88ec1b8d Peter Zijlstra    2012-10-25  5273  	int target_nid;
04a8645304500b Aneesh Kumar K.V  2019-03-05  5274  	pte_t pte, old_pte;
d2136d749d76af Baolin Wang       2024-03-29  5275  	int flags = 0, nr_pages;
d10e63f29488b0 Mel Gorman        2012-10-25  5276  
d10e63f29488b0 Mel Gorman        2012-10-25  5277  	/*
6c1b748ebf27be John Hubbard      2024-02-27  5278  	 * The pte cannot be used safely until we verify, while holding the page
6c1b748ebf27be John Hubbard      2024-02-27  5279  	 * table lock, that its contents have not changed during fault handling.
d10e63f29488b0 Mel Gorman        2012-10-25  5280  	 */
82b0f8c39a3869 Jan Kara          2016-12-14  5281  	spin_lock(vmf->ptl);
6c1b748ebf27be John Hubbard      2024-02-27  5282  	/* Read the live PTE from the page tables: */
6c1b748ebf27be John Hubbard      2024-02-27  5283  	old_pte = ptep_get(vmf->pte);
6c1b748ebf27be John Hubbard      2024-02-27  5284  
6c1b748ebf27be John Hubbard      2024-02-27  5285  	if (unlikely(!pte_same(old_pte, vmf->orig_pte))) {
82b0f8c39a3869 Jan Kara          2016-12-14  5286  		pte_unmap_unlock(vmf->pte, vmf->ptl);
4daae3b4b9e49b Mel Gorman        2012-11-02  5287  		goto out;
4daae3b4b9e49b Mel Gorman        2012-11-02  5288  	}
4daae3b4b9e49b Mel Gorman        2012-11-02  5289  
04a8645304500b Aneesh Kumar K.V  2019-03-05  5290  	pte = pte_modify(old_pte, vma->vm_page_prot);
d10e63f29488b0 Mel Gorman        2012-10-25  5291  
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5292  	/*
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5293  	 * Detect now whether the PTE could be writable; this information
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5294  	 * is only valid while holding the PT lock.
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5295  	 */
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5296  	writable = pte_write(pte);
d2136d749d76af Baolin Wang       2024-03-29  5297  	if (!writable && pte_write_upgrade &&
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5298  	    can_change_pte_writable(vma, vmf->address, pte))
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5299  		writable = true;
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5300  
6695cf68b15c21 Kefeng Wang       2023-09-21  5301  	folio = vm_normal_folio(vma, vmf->address, pte);
6695cf68b15c21 Kefeng Wang       2023-09-21  5302  	if (!folio || folio_is_zone_device(folio))
b99a342d4f11a5 Huang Ying        2021-04-29  5303  		goto out_map;

nr_pages not initialized

d10e63f29488b0 Mel Gorman        2012-10-25  5304  
6688cc05473b36 Peter Zijlstra    2013-10-07  5305  	/*
bea66fbd11af1c Mel Gorman        2015-03-25  5306  	 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
bea66fbd11af1c Mel Gorman        2015-03-25  5307  	 * much anyway since they can be in shared cache state. This misses
bea66fbd11af1c Mel Gorman        2015-03-25  5308  	 * the case where a mapping is writable but the process never writes
bea66fbd11af1c Mel Gorman        2015-03-25  5309  	 * to it but pte_write gets cleared during protection updates and
bea66fbd11af1c Mel Gorman        2015-03-25  5310  	 * pte_dirty has unpredictable behaviour between PTE scan updates,
bea66fbd11af1c Mel Gorman        2015-03-25  5311  	 * background writeback, dirty balancing and application behaviour.
bea66fbd11af1c Mel Gorman        2015-03-25  5312  	 */
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5313  	if (!writable)
6688cc05473b36 Peter Zijlstra    2013-10-07  5314  		flags |= TNF_NO_GROUP;
6688cc05473b36 Peter Zijlstra    2013-10-07  5315  
dabe1d992414a6 Rik van Riel      2013-10-07  5316  	/*
6695cf68b15c21 Kefeng Wang       2023-09-21  5317  	 * Flag if the folio is shared between multiple address spaces. This
dabe1d992414a6 Rik van Riel      2013-10-07  5318  	 * is later used when determining whether to group tasks together
dabe1d992414a6 Rik van Riel      2013-10-07  5319  	 */
ebb34f78d72c23 David Hildenbrand 2024-02-27  5320  	if (folio_likely_mapped_shared(folio) && (vma->vm_flags & VM_SHARED))
dabe1d992414a6 Rik van Riel      2013-10-07  5321  		flags |= TNF_SHARED;
dabe1d992414a6 Rik van Riel      2013-10-07  5322  
6695cf68b15c21 Kefeng Wang       2023-09-21  5323  	nid = folio_nid(folio);
d2136d749d76af Baolin Wang       2024-03-29  5324  	nr_pages = folio_nr_pages(folio);
33024536bafd91 Huang Ying        2022-07-13  5325  	/*
33024536bafd91 Huang Ying        2022-07-13  5326  	 * For memory tiering mode, cpupid of slow memory page is used
33024536bafd91 Huang Ying        2022-07-13  5327  	 * to record page access time.  So use default value.
33024536bafd91 Huang Ying        2022-07-13  5328  	 */
33024536bafd91 Huang Ying        2022-07-13  5329  	if ((sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
6695cf68b15c21 Kefeng Wang       2023-09-21  5330  	    !node_is_toptier(nid))
33024536bafd91 Huang Ying        2022-07-13  5331  		last_cpupid = (-1 & LAST_CPUPID_MASK);
33024536bafd91 Huang Ying        2022-07-13  5332  	else
67b33e3ff58374 Kefeng Wang       2023-10-18  5333  		last_cpupid = folio_last_cpupid(folio);
f8fd525ba3a298 Donet Tom         2024-03-08  5334  	target_nid = numa_migrate_prep(folio, vmf, vmf->address, nid, &flags);
98fa15f34cb379 Anshuman Khandual 2019-03-05  5335  	if (target_nid == NUMA_NO_NODE) {
6695cf68b15c21 Kefeng Wang       2023-09-21  5336  		folio_put(folio);
b99a342d4f11a5 Huang Ying        2021-04-29  5337  		goto out_map;
4daae3b4b9e49b Mel Gorman        2012-11-02  5338  	}
b99a342d4f11a5 Huang Ying        2021-04-29  5339  	pte_unmap_unlock(vmf->pte, vmf->ptl);
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5340  	writable = false;
d2136d749d76af Baolin Wang       2024-03-29  5341  	ignore_writable = true;
4daae3b4b9e49b Mel Gorman        2012-11-02  5342  
4daae3b4b9e49b Mel Gorman        2012-11-02  5343  	/* Migrate to the requested node */
6695cf68b15c21 Kefeng Wang       2023-09-21  5344  	if (migrate_misplaced_folio(folio, vma, target_nid)) {
6695cf68b15c21 Kefeng Wang       2023-09-21  5345  		nid = target_nid;
6688cc05473b36 Peter Zijlstra    2013-10-07  5346  		flags |= TNF_MIGRATED;
b99a342d4f11a5 Huang Ying        2021-04-29  5347  	} else {
074c238177a75f Mel Gorman        2015-03-25  5348  		flags |= TNF_MIGRATE_FAIL;
c7ad08804fae5b Hugh Dickins      2023-06-08  5349  		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
c7ad08804fae5b Hugh Dickins      2023-06-08  5350  					       vmf->address, &vmf->ptl);
c7ad08804fae5b Hugh Dickins      2023-06-08  5351  		if (unlikely(!vmf->pte))
c7ad08804fae5b Hugh Dickins      2023-06-08  5352  			goto out;
c33c794828f212 Ryan Roberts      2023-06-12  5353  		if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
b99a342d4f11a5 Huang Ying        2021-04-29  5354  			pte_unmap_unlock(vmf->pte, vmf->ptl);
b99a342d4f11a5 Huang Ying        2021-04-29  5355  			goto out;
b99a342d4f11a5 Huang Ying        2021-04-29  5356  		}
b99a342d4f11a5 Huang Ying        2021-04-29  5357  		goto out_map;
b99a342d4f11a5 Huang Ying        2021-04-29  5358  	}
4daae3b4b9e49b Mel Gorman        2012-11-02  5359  
4daae3b4b9e49b Mel Gorman        2012-11-02  5360  out:
6695cf68b15c21 Kefeng Wang       2023-09-21  5361  	if (nid != NUMA_NO_NODE)
d2136d749d76af Baolin Wang       2024-03-29  5362  		task_numa_fault(last_cpupid, nid, nr_pages, flags);
d10e63f29488b0 Mel Gorman        2012-10-25  5363  	return 0;
b99a342d4f11a5 Huang Ying        2021-04-29  5364  out_map:
b99a342d4f11a5 Huang Ying        2021-04-29  5365  	/*
b99a342d4f11a5 Huang Ying        2021-04-29  5366  	 * Make it present again, depending on how arch implements
b99a342d4f11a5 Huang Ying        2021-04-29  5367  	 * non-accessible ptes, some can allow access by kernel mode.
b99a342d4f11a5 Huang Ying        2021-04-29  5368  	 */
d2136d749d76af Baolin Wang       2024-03-29  5369  	if (folio && folio_test_large(folio))

Are folio_test_large() and folio_is_zone_device() mutually exclusive?
If so then this is a false positive.  Just ignore the warning in that
case.

8d27aa5be8ed93 Kefeng Wang       2024-06-07 @5370  		numa_rebuild_large_mapping(vmf, vma, folio, nr_pages, pte,
8d27aa5be8ed93 Kefeng Wang       2024-06-07  5371  					   ignore_writable, pte_write_upgrade);
d2136d749d76af Baolin Wang       2024-03-29  5372  	else
d2136d749d76af Baolin Wang       2024-03-29  5373  		numa_rebuild_single_mapping(vmf, vma, vmf->address, vmf->pte,
d2136d749d76af Baolin Wang       2024-03-29  5374  					    writable);
b99a342d4f11a5 Huang Ying        2021-04-29  5375  	pte_unmap_unlock(vmf->pte, vmf->ptl);
b99a342d4f11a5 Huang Ying        2021-04-29  5376  	goto out;
d10e63f29488b0 Mel Gorman        2012-10-25  5377  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

