Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B21618FC75
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 06:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740983492; cv=none; b=RdD0+QTXMzQvxET685fXI62hkW8FPnHLrc8EX+LFIGueklzoDACPOsXOOWVY/Q0DXxftpMhGLnKErsxD0lKfH3SxtTrdMQkNRf3Ll8cms3xHKVWHvwe4iJz8Gj+negqjcpJ3aGoXELt9tvsab+48qjBR6K5PrTj00GXjS0LOg/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740983492; c=relaxed/simple;
	bh=CaReUaDnQroimNpgBqlYq+TP76juSYIfetTs2GwL4P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMwj0NVvbGnYlOvM91t1yviX2KbOm4qqnlXQT1NHfKDP+qWDpdSjYhhyqWg54qMklEGKOKV5gt14v5dxoyqWsR9AkpK3n/87N1d0tbT1hLYgBT5pJt/742LNiPq2IG7HkzySxJWxqgH9ECQJGFUDqg95iErZVMYZ/+xK+JVi6tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEHIwAyw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEHIwAyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740983491; x=1772519491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CaReUaDnQroimNpgBqlYq+TP76juSYIfetTs2GwL4P0=;
  b=TEHIwAywimoX4qkmWEy9ht0/e+Krs7OplRr7FBoW9wEk4tbhmbouS7mb
   c07e5k57sBKewlIwe6X0E704b1vjshpfRHzE/0dZWVhIlOnZ0lEIERrwZ
   8pufNjUDOR2ieOqIiVJsNPddnc8nD9H7yWBP+5UkEARDJW12EGkxWFJD+
   NOcj0vtCMlJTbJ5ZGJI73dDB3lkAYCHGqeAEVBmW54r7a1aE+5Z9n+j+u
   NCEcJxxS3jjtAK7Al1x5QTaUqjBL1QWHp52hy2tYMMLDGPp1dmzs2tAMO
   wnw1Oc2H7ZYwE2VjB9BsE5qRojRyL1L3piJ5YVSMDTPPF3KiKZnwfkm1e
   g==;
X-CSE-ConnectionGUID: AiSxBpLtRYq3n3Dx+lXswA==
X-CSE-MsgGUID: TB3EmWDDRrKQg76P7qbL0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41967130"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41967130"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 22:31:28 -0800
X-CSE-ConnectionGUID: ODqJKfcBSXeXt7fDvGqY6w==
X-CSE-MsgGUID: tO4IvErCSz6Bbvds153k9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="123065930"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Mar 2025 22:31:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tozKn-000I1F-0Q;
	Mon, 03 Mar 2025 06:31:25 +0000
Date: Mon, 3 Mar 2025 14:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: wang wei <a929244872@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1] mm/page cache: A method to drop one-read page cache
Message-ID: <202503031422.vK2Dy5D8-lkp@intel.com>
References: <20250302061427.33455-1-a929244872@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302061427.33455-1-a929244872@163.com>

Hi wang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/wang-wei/mm-page-cache-A-method-to-drop-one-read-page-cache/20250302-141715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250302061427.33455-1-a929244872%40163.com
patch subject: [RFC v1] mm/page cache: A method to drop one-read page cache
config: x86_64-randconfig-161-20250303 (https://download.01.org/0day-ci/archive/20250303/202503031422.vK2Dy5D8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031422.vK2Dy5D8-lkp@intel.com/

smatch warnings:
mm/workingset.c:570 workingset_refault() warn: inconsistent indenting

vim +570 mm/workingset.c

ffcb5f5262b756 Nhat Pham               2023-05-02  524  
ffcb5f5262b756 Nhat Pham               2023-05-02  525  /**
ffcb5f5262b756 Nhat Pham               2023-05-02  526   * workingset_refault - Evaluate the refault of a previously evicted folio.
ffcb5f5262b756 Nhat Pham               2023-05-02  527   * @folio: The freshly allocated replacement folio.
ffcb5f5262b756 Nhat Pham               2023-05-02  528   * @shadow: Shadow entry of the evicted folio.
ffcb5f5262b756 Nhat Pham               2023-05-02  529   *
ffcb5f5262b756 Nhat Pham               2023-05-02  530   * Calculates and evaluates the refault distance of the previously
ffcb5f5262b756 Nhat Pham               2023-05-02  531   * evicted folio in the context of the node and the memcg whose memory
ffcb5f5262b756 Nhat Pham               2023-05-02  532   * pressure caused the eviction.
ffcb5f5262b756 Nhat Pham               2023-05-02  533   */
ffcb5f5262b756 Nhat Pham               2023-05-02  534  void workingset_refault(struct folio *folio, void *shadow)
ffcb5f5262b756 Nhat Pham               2023-05-02  535  {
ffcb5f5262b756 Nhat Pham               2023-05-02  536  	bool file = folio_is_file_lru(folio);
ffcb5f5262b756 Nhat Pham               2023-05-02  537  	struct pglist_data *pgdat;
ffcb5f5262b756 Nhat Pham               2023-05-02  538  	struct mem_cgroup *memcg;
ffcb5f5262b756 Nhat Pham               2023-05-02  539  	struct lruvec *lruvec;
ffcb5f5262b756 Nhat Pham               2023-05-02  540  	bool workingset;
ffcb5f5262b756 Nhat Pham               2023-05-02  541  	long nr;
ffcb5f5262b756 Nhat Pham               2023-05-02  542  
9cbfd1c3c83b62 Yu Zhao                 2024-12-30  543  	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
9cbfd1c3c83b62 Yu Zhao                 2024-12-30  544  
ffcb5f5262b756 Nhat Pham               2023-05-02  545  	if (lru_gen_enabled()) {
ffcb5f5262b756 Nhat Pham               2023-05-02  546  		lru_gen_refault(folio, shadow);
ffcb5f5262b756 Nhat Pham               2023-05-02  547  		return;
ffcb5f5262b756 Nhat Pham               2023-05-02  548  	}
ffcb5f5262b756 Nhat Pham               2023-05-02  549  
ffcb5f5262b756 Nhat Pham               2023-05-02  550  	/*
ffcb5f5262b756 Nhat Pham               2023-05-02  551  	 * The activation decision for this folio is made at the level
ffcb5f5262b756 Nhat Pham               2023-05-02  552  	 * where the eviction occurred, as that is where the LRU order
ffcb5f5262b756 Nhat Pham               2023-05-02  553  	 * during folio reclaim is being determined.
ffcb5f5262b756 Nhat Pham               2023-05-02  554  	 *
ffcb5f5262b756 Nhat Pham               2023-05-02  555  	 * However, the cgroup that will own the folio is the one that
b006847222623a Yosry Ahmed             2023-11-29  556  	 * is actually experiencing the refault event. Make sure the folio is
b006847222623a Yosry Ahmed             2023-11-29  557  	 * locked to guarantee folio_memcg() stability throughout.
ffcb5f5262b756 Nhat Pham               2023-05-02  558  	 */
ffcb5f5262b756 Nhat Pham               2023-05-02  559  	nr = folio_nr_pages(folio);
ffcb5f5262b756 Nhat Pham               2023-05-02  560  	memcg = folio_memcg(folio);
ffcb5f5262b756 Nhat Pham               2023-05-02  561  	pgdat = folio_pgdat(folio);
ffcb5f5262b756 Nhat Pham               2023-05-02  562  	lruvec = mem_cgroup_lruvec(memcg, pgdat);
ffcb5f5262b756 Nhat Pham               2023-05-02  563  
ffcb5f5262b756 Nhat Pham               2023-05-02  564  	mod_lruvec_state(lruvec, WORKINGSET_REFAULT_BASE + file, nr);
ffcb5f5262b756 Nhat Pham               2023-05-02  565  
93d762f0f33206 wang wei                2025-03-02  566  	if (!workingset_test_recent(shadow, file, &workingset, true)) {
93d762f0f33206 wang wei                2025-03-02  567  		if (file && folio->mapping)
93d762f0f33206 wang wei                2025-03-02  568  			__folio_set_dropbehind(folio);
93d762f0f33206 wang wei                2025-03-02  569  	}
b006847222623a Yosry Ahmed             2023-11-29 @570  		return;
1899ad18c6072d Johannes Weiner         2018-10-26  571  
0995d7e5681412 Matthew Wilcox (Oracle  2021-04-29  572) 	folio_set_active(folio);
0995d7e5681412 Matthew Wilcox (Oracle  2021-04-29  573) 	workingset_age_nonresident(lruvec, nr);
0995d7e5681412 Matthew Wilcox (Oracle  2021-04-29  574) 	mod_lruvec_state(lruvec, WORKINGSET_ACTIVATE_BASE + file, nr);
1899ad18c6072d Johannes Weiner         2018-10-26  575  
0995d7e5681412 Matthew Wilcox (Oracle  2021-04-29  576) 	/* Folio was active prior to eviction */
1899ad18c6072d Johannes Weiner         2018-10-26  577  	if (workingset) {
0995d7e5681412 Matthew Wilcox (Oracle  2021-04-29  578) 		folio_set_workingset(folio);
6e1ca48d0669b0 Vishal Moola (Oracle    2022-11-01  579) 		/*
6e1ca48d0669b0 Vishal Moola (Oracle    2022-11-01  580) 		 * XXX: Move to folio_add_lru() when it supports new vs
6e1ca48d0669b0 Vishal Moola (Oracle    2022-11-01  581) 		 * putback
6e1ca48d0669b0 Vishal Moola (Oracle    2022-11-01  582) 		 */
0538a82c39e94d Johannes Weiner         2022-10-13  583  		lru_note_cost_refault(folio);
0995d7e5681412 Matthew Wilcox (Oracle  2021-04-29  584) 		mod_lruvec_state(lruvec, WORKINGSET_RESTORE_BASE + file, nr);
a528910e12ec7e Johannes Weiner         2014-04-03  585  	}
a528910e12ec7e Johannes Weiner         2014-04-03  586  }
a528910e12ec7e Johannes Weiner         2014-04-03  587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
