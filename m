Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CC6274641
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764691900; cv=none; b=IDyPG+VklixxPGAoPN7F5ldNAFFHPreSUCT+/xN/Vnu3NxvGKWIgmy0jNwY5jg3rMBkQcCLjjnzIeZ5w5zyNwuZCH3M30O9IjD8zIp324pkQHIK3Mm9lcT262zAu7wbDla/+2dZfsBslJuQtMytfg1FV8krvb3NzK9AQpEujVAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764691900; c=relaxed/simple;
	bh=z5MUxg8uJNkPHCuuuTugLtrTf3uaBJDR1DQRw0scZQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bIy5GuZMVKliVFdXKZrthcidebLVDr2Ivr7ty+JbPqbgJlQPNpfHH+eJXmFU2fKZ0wYFy0syL8x/xygkKwun5wCulKAH7YvfsP7y7ko9JYDzB1NJ4wAC8uJrC9AW+yDIX8KCvkQGkhNFYy/HfUNRVt+RYgVVYuKCWFlFvHymqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1On7XS1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1On7XS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764691899; x=1796227899;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z5MUxg8uJNkPHCuuuTugLtrTf3uaBJDR1DQRw0scZQI=;
  b=X1On7XS11H9F1IiUITAglBZSQMZgu9lM7L0BBVI7s6plvD7sIHLmekSp
   w+htYgHl1nwrQNIqu2cy/6YTn4Awc2BaGZBtYtfIQLtUyEmffFl/fl2Bs
   hqeN5uoJzCOlkjJppASOWKuq35o00R8Oi7StmMTG+4eXR6T9tLZe6PoTS
   SsiSi+itfdUb6mXPHmErsXm5YdQu3OYyb97D5I1IHLLhtE+KdTNVJIS/k
   P3qwCckA1XkrK6Qtuz3q6QX9EvEs4VLXtGdlSLvTf9UoARP2M0B165FhF
   WwyLRt53ex1BFeC/c9f1go2GQTCzJVPZDhIDT6HHtW/xXF8p8RX185BdW
   w==;
X-CSE-ConnectionGUID: eyIPCt3hTNCWl037jRNdkg==
X-CSE-MsgGUID: Kt6bolGSTZmAsEIyhI+zNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84061850"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="84061850"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:11:38 -0800
X-CSE-ConnectionGUID: BsNjRlTiR3uaj4O2n2ocHA==
X-CSE-MsgGUID: XFgnGaExQ46D3P/XQ0Nlpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="198604729"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 08:11:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQSyU-000000009yX-4BdT;
	Tue, 02 Dec 2025 16:11:35 +0000
Date: Wed, 3 Dec 2025 00:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2] mm/migrate.c:425
 folio_migrate_mapping() warn: inconsistent indenting
Message-ID: <202512030001.KGp3RuZK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5b6cecf56c7250013e532423509fd9aa77e53456
commit: 49100c0b070e900f87c8fac3be9b9ef8a30fa673 [2/2] mm/migrate: fix shmem xarray update during migration
config: x86_64-randconfig-161-20251202 (https://download.01.org/0day-ci/archive/20251203/202512030001.KGp3RuZK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030001.KGp3RuZK-lkp@intel.com/

smatch warnings:
mm/migrate.c:425 folio_migrate_mapping() warn: inconsistent indenting

vim +425 mm/migrate.c

0b3901b38d9d916 Jan Kara                2018-12-28  374  
b20a35035f983f4 Christoph Lameter       2006-03-22  375  /*
c3fcf8a5daacf35 Christoph Lameter       2006-06-23  376   * Replace the page in the mapping.
5b5c7120e215423 Christoph Lameter       2006-06-23  377   *
5b5c7120e215423 Christoph Lameter       2006-06-23  378   * The number of remaining references must be:
5b5c7120e215423 Christoph Lameter       2006-06-23  379   * 1 for anonymous pages without a mapping
5b5c7120e215423 Christoph Lameter       2006-06-23  380   * 2 for pages with a mapping
266cf658efcf6ac David Howells           2009-04-03  381   * 3 for pages with a mapping and PagePrivate/PagePrivate2 set.
b20a35035f983f4 Christoph Lameter       2006-03-22  382   */
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  383) int folio_migrate_mapping(struct address_space *mapping,
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  384) 		struct folio *newfolio, struct folio *folio, int extra_count)
b20a35035f983f4 Christoph Lameter       2006-03-22  385  {
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  386) 	XA_STATE(xas, &mapping->i_pages, folio_index(folio));
42cb14b110a5698 Hugh Dickins            2015-11-05  387  	struct zone *oldzone, *newzone;
42cb14b110a5698 Hugh Dickins            2015-11-05  388  	int dirty;
108ca8358139bec Matthew Wilcox (Oracle  2022-06-06  389) 	int expected_count = folio_expected_refs(mapping, folio) + extra_count;
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  390) 	long nr = folio_nr_pages(folio);
be72d197b2281e2 Charan Teja Kalla       2023-12-14  391  	long entries, i;
8763cb45ab967a9 Jérôme Glisse           2017-09-08  392  
6c5240ae7f48c83 Christoph Lameter       2006-06-23  393  	if (!mapping) {
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  394  		/* Anonymous page without mapping */
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  395) 		if (folio_ref_count(folio) != expected_count)
6c5240ae7f48c83 Christoph Lameter       2006-06-23  396  			return -EAGAIN;
cf4b769abb8aef0 Hugh Dickins            2015-11-05  397  
cf4b769abb8aef0 Hugh Dickins            2015-11-05  398  		/* No turning back from here */
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  399) 		newfolio->index = folio->index;
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  400) 		newfolio->mapping = folio->mapping;
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  401) 		if (folio_test_swapbacked(folio))
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  402) 			__folio_set_swapbacked(newfolio);
cf4b769abb8aef0 Hugh Dickins            2015-11-05  403  
78bd52097d04205 Rafael Aquini           2012-12-11  404  		return MIGRATEPAGE_SUCCESS;
6c5240ae7f48c83 Christoph Lameter       2006-06-23  405  	}
6c5240ae7f48c83 Christoph Lameter       2006-06-23  406  
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  407) 	oldzone = folio_zone(folio);
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  408) 	newzone = folio_zone(newfolio);
42cb14b110a5698 Hugh Dickins            2015-11-05  409  
89eb946a7432be6 Matthew Wilcox          2017-12-04  410  	xas_lock_irq(&xas);
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  411) 	if (!folio_ref_freeze(folio, expected_count)) {
89eb946a7432be6 Matthew Wilcox          2017-12-04  412  		xas_unlock_irq(&xas);
e286781d5f2e9c8 Nicholas Piggin         2008-07-25  413  		return -EAGAIN;
e286781d5f2e9c8 Nicholas Piggin         2008-07-25  414  	}
e286781d5f2e9c8 Nicholas Piggin         2008-07-25  415  
b20a35035f983f4 Christoph Lameter       2006-03-22  416  	/*
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  417) 	 * Now we know that no one else is looking at the folio:
cf4b769abb8aef0 Hugh Dickins            2015-11-05  418  	 * no turning back from here.
b20a35035f983f4 Christoph Lameter       2006-03-22  419  	 */
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  420) 	newfolio->index = folio->index;
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  421) 	newfolio->mapping = folio->mapping;
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  422) 	folio_ref_add(newfolio, nr); /* add cache reference */
49100c0b070e900 Zi Yan                  2025-03-05  423  	if (folio_test_swapbacked(folio))
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  424) 		__folio_set_swapbacked(newfolio);
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07 @425)     if (folio_test_swapcache(folio)) {
3372c3ffc34509c Zi Yan                  2024-03-06  426          int i;
3372c3ffc34509c Zi Yan                  2024-03-06  427  
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  428)         folio_set_swapcache(newfolio);
3372c3ffc34509c Zi Yan                  2024-03-06  429          for (i = 0; i < nr; i++)
3372c3ffc34509c Zi Yan                  2024-03-06  430              set_page_private(folio_page(newfolio, i),
3372c3ffc34509c Zi Yan                  2024-03-06  431                  page_private(folio_page(folio, i)));
be72d197b2281e2 Charan Teja Kalla       2023-12-14  432  		entries = nr;
6326fec1122cde2 Nicholas Piggin         2016-12-25  433  	} else {
be72d197b2281e2 Charan Teja Kalla       2023-12-14  434  		entries = 1;
6326fec1122cde2 Nicholas Piggin         2016-12-25  435  	}
b20a35035f983f4 Christoph Lameter       2006-03-22  436  
42cb14b110a5698 Hugh Dickins            2015-11-05  437  	/* Move dirty while page refs frozen and newpage not yet exposed */
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  438) 	dirty = folio_test_dirty(folio);
42cb14b110a5698 Hugh Dickins            2015-11-05  439  	if (dirty) {
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  440) 		folio_clear_dirty(folio);
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  441) 		folio_set_dirty(newfolio);
42cb14b110a5698 Hugh Dickins            2015-11-05  442  	}
42cb14b110a5698 Hugh Dickins            2015-11-05  443  
be72d197b2281e2 Charan Teja Kalla       2023-12-14  444  	/* Swap cache still stores N entries instead of a high-order entry */
be72d197b2281e2 Charan Teja Kalla       2023-12-14  445  	for (i = 0; i < entries; i++) {
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  446) 		xas_store(&xas, newfolio);
be72d197b2281e2 Charan Teja Kalla       2023-12-14  447  		xas_next(&xas);
be72d197b2281e2 Charan Teja Kalla       2023-12-14  448  	}
7cf9c2c76c1a17b Nicholas Piggin         2006-12-06  449  
7cf9c2c76c1a17b Nicholas Piggin         2006-12-06  450  	/*
937a94c9db30a81 Jacobo Giralt           2012-01-10  451  	 * Drop cache reference from old page by unfreezing
937a94c9db30a81 Jacobo Giralt           2012-01-10  452  	 * to one less reference.
7cf9c2c76c1a17b Nicholas Piggin         2006-12-06  453  	 * We know this isn't the last reference.
7cf9c2c76c1a17b Nicholas Piggin         2006-12-06  454  	 */
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  455) 	folio_ref_unfreeze(folio, expected_count - nr);
7cf9c2c76c1a17b Nicholas Piggin         2006-12-06  456  
89eb946a7432be6 Matthew Wilcox          2017-12-04  457  	xas_unlock(&xas);
42cb14b110a5698 Hugh Dickins            2015-11-05  458  	/* Leave irq disabled to prevent preemption while updating stats */
42cb14b110a5698 Hugh Dickins            2015-11-05  459  
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  460  	/*
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  461  	 * If moved to a different zone then also account
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  462  	 * the page for that zone. Other VM counters will be
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  463  	 * taken care of when we establish references to the
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  464  	 * new page and drop references to the old page.
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  465  	 *
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  466  	 * Note that anonymous pages are accounted for
4b9d0fab7166c93 Mel Gorman              2016-07-28  467  	 * via NR_FILE_PAGES and NR_ANON_MAPPED if they
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  468  	 * are mapped to swap space.
0e8c7d0fd5b4999 Christoph Lameter       2007-04-23  469  	 */
42cb14b110a5698 Hugh Dickins            2015-11-05  470  	if (newzone != oldzone) {
0d1c20722ab333a Johannes Weiner         2020-06-03  471  		struct lruvec *old_lruvec, *new_lruvec;
0d1c20722ab333a Johannes Weiner         2020-06-03  472  		struct mem_cgroup *memcg;
0d1c20722ab333a Johannes Weiner         2020-06-03  473  
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  474) 		memcg = folio_memcg(folio);
0d1c20722ab333a Johannes Weiner         2020-06-03  475  		old_lruvec = mem_cgroup_lruvec(memcg, oldzone->zone_pgdat);
0d1c20722ab333a Johannes Weiner         2020-06-03  476  		new_lruvec = mem_cgroup_lruvec(memcg, newzone->zone_pgdat);
0d1c20722ab333a Johannes Weiner         2020-06-03  477  
5c447d274f3746f Shakeel Butt            2021-01-23  478  		__mod_lruvec_state(old_lruvec, NR_FILE_PAGES, -nr);
5c447d274f3746f Shakeel Butt            2021-01-23  479  		__mod_lruvec_state(new_lruvec, NR_FILE_PAGES, nr);
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  480) 		if (folio_test_swapbacked(folio) && !folio_test_swapcache(folio)) {
5c447d274f3746f Shakeel Butt            2021-01-23  481  			__mod_lruvec_state(old_lruvec, NR_SHMEM, -nr);
5c447d274f3746f Shakeel Butt            2021-01-23  482  			__mod_lruvec_state(new_lruvec, NR_SHMEM, nr);
4b02108ac1b3354 KOSAKI Motohiro         2009-09-21  483  		}
b6038942480e574 Shakeel Butt            2021-02-24  484  #ifdef CONFIG_SWAP
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  485) 		if (folio_test_swapcache(folio)) {
b6038942480e574 Shakeel Butt            2021-02-24  486  			__mod_lruvec_state(old_lruvec, NR_SWAPCACHE, -nr);
b6038942480e574 Shakeel Butt            2021-02-24  487  			__mod_lruvec_state(new_lruvec, NR_SWAPCACHE, nr);
b6038942480e574 Shakeel Butt            2021-02-24  488  		}
b6038942480e574 Shakeel Butt            2021-02-24  489  #endif
f56753ac2a90810 Christoph Hellwig       2020-09-24  490  		if (dirty && mapping_can_writeback(mapping)) {
5c447d274f3746f Shakeel Butt            2021-01-23  491  			__mod_lruvec_state(old_lruvec, NR_FILE_DIRTY, -nr);
5c447d274f3746f Shakeel Butt            2021-01-23  492  			__mod_zone_page_state(oldzone, NR_ZONE_WRITE_PENDING, -nr);
5c447d274f3746f Shakeel Butt            2021-01-23  493  			__mod_lruvec_state(new_lruvec, NR_FILE_DIRTY, nr);
5c447d274f3746f Shakeel Butt            2021-01-23  494  			__mod_zone_page_state(newzone, NR_ZONE_WRITE_PENDING, nr);
42cb14b110a5698 Hugh Dickins            2015-11-05  495  		}
42cb14b110a5698 Hugh Dickins            2015-11-05  496  	}
42cb14b110a5698 Hugh Dickins            2015-11-05  497  	local_irq_enable();
b20a35035f983f4 Christoph Lameter       2006-03-22  498  
78bd52097d04205 Rafael Aquini           2012-12-11  499  	return MIGRATEPAGE_SUCCESS;
b20a35035f983f4 Christoph Lameter       2006-03-22  500  }
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  501) EXPORT_SYMBOL(folio_migrate_mapping);
b20a35035f983f4 Christoph Lameter       2006-03-22  502  

:::::: The code at line 425 was first introduced by commit
:::::: 3417013e0d183be9b42d794082eec0ec1c5b5f15 mm/migrate: Add folio_migrate_mapping()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
