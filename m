Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0B433AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 00:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789517904; cv=none; b=jxooS0FYcyxYZlBq/2dufFHwm7lYJGxYYF2IB93MpGm8r/Bx+ghIkYbGqG9GW944Y+VWjKsK5P8lYMqLQg9XIJmuWL92En8KeMx6wLWncMF7vOAyv33c0Zi+iSA5EDtOtblwIZagTPYD2BEDlR32NalgPKXJrQ3IQBHiFTSqrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789517904; c=relaxed/simple;
	bh=Xv/ly5e8OLy9FPlp38eFdYJ3wHwARXe+T3WRr+pVARI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ehh5K9K6Ynka9CDdmGUj3hLyMBKNFmceFIkMb0+KDVQlvB68Pq+OueGlroD4+8KB7IVeeH5U90IfBdgEX9ucpo2pzYOnAHVpeAFgoZww/o7MBEAjEVqjnASQL3uHfKoROwDMZT/SD1x4X58tRpdIvLUmOdwbEmNVqv0xp9pF8y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaMG9Nhi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaMG9Nhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789517903; x=1821053903;
  h=date:from:to:cc:subject:message-id;
  bh=Xv/ly5e8OLy9FPlp38eFdYJ3wHwARXe+T3WRr+pVARI=;
  b=aaMG9NhiBE0cW4pp6O1ioKcB0R5MOzGOHwlRFF0D8g5QM19/Qv2m4CxN
   orthaP3sB3V+sdeG1dLtwYcL3dAFL4Ma6z+VWxKa7pOunYZQMWYJFCKFf
   ZbQXB4TzVJM2MIgGXuaSQJoZAalj+YVSzZrvbH3QZ2lXnrqFXlLMU8ggb
   jwbTK6RzZopkdIt/ORByF/GEGsrxr+sp9l741fdYCBIQ2hLSn770nJuXk
   KVvR0INK1ppE5ajLiLdgjKdh7N/ZlTdosAyFxFmpvtflb4vYjeSLNUMHO
   oooLBuFNI7DoQ91+WPIxJO/QQPdEYpA00/HoBrIgO+BxjvIj3xYOYjX8x
   w==;
X-CSE-ConnectionGUID: urk3i6u0TvmuS0weI11seQ==
X-CSE-MsgGUID: 8UPW6fpaSlWnMkViDzxSBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89027667"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89027667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 17:18:22 -0700
X-CSE-ConnectionGUID: FQxIewSyQSSd74x5XYTw9w==
X-CSE-MsgGUID: 8uHJzz8KRne1/B9asoHD5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276693325"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Sep 2026 17:18:21 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6dLu-000000005DZ-1upW;
	Wed, 16 Sep 2026 00:18:18 +0000
Date: Wed, 16 Sep 2026 08:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 8/67] mm/page_alloc.c:7386:3: error: implicit declaration of function
 'folio_test_clear_young'; did you mean 'folio_test_clear_lru'?
Message-ID: <202609160816.fmlzELdi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: 4af770f6b4623768abd534b154c6d8136f601cac [8/67] mm/page_alloc: let alloc_contig_range() try harder
config: nios2-randconfig-002-20260916 (https://download.01.org/0day-ci/archive/20260916/202609160816.fmlzELdi-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160816.fmlzELdi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160816.fmlzELdi-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'contig_range_reclaim':
>> mm/page_alloc.c:7386:3: error: implicit declaration of function 'folio_test_clear_young'; did you mean 'folio_test_clear_lru'? [-Werror=implicit-function-declaration]
      folio_test_clear_young(folio);
      ^~~~~~~~~~~~~~~~~~~~~~
      folio_test_clear_lru
   cc1: some warnings being treated as errors


vim +7386 mm/page_alloc.c

  7363	
  7364	/*
  7365	 * ACR_FLAGS_RECLAIM: evict the folios in [@start, @end) that migration could
  7366	 * not move.  Ages them down first so reclaim does not decline on the strength
  7367	 * of a recent reference -- the caller is not asking for a hint.
  7368	 *
  7369	 * Return: pages reclaimed.
  7370	 */
  7371	static unsigned long contig_range_reclaim(unsigned long start, unsigned long end)
  7372	{
  7373		unsigned long pfn = start, reclaimed = 0, isolated = 0;
  7374		LIST_HEAD(folio_list);
  7375	
  7376		while (pfn < end) {
  7377			struct folio *folio = contig_get_lru_folio(pfn);
  7378	
  7379			if (!folio) {
  7380				pfn++;
  7381				continue;
  7382			}
  7383			pfn += folio_nr_pages(folio);
  7384	
  7385			folio_clear_referenced(folio);
> 7386			folio_test_clear_young(folio);
  7387			if (!folio_isolate_lru(folio))
  7388				goto put;
  7389			if (folio_test_unevictable(folio)) {
  7390				folio_putback_lru(folio);
  7391			} else {
  7392				list_add(&folio->lru, &folio_list);
  7393				isolated += folio_nr_pages(folio);
  7394			}
  7395	put:
  7396			/* isolation took its own reference; drop the lookup's */
  7397			folio_put(folio);
  7398	
  7399			if (isolated >= CONTIG_RECLAIM_BATCH) {
  7400				reclaimed += reclaim_pages(&folio_list);
  7401				isolated = 0;
  7402				cond_resched();
  7403				if (fatal_signal_pending(current))
  7404					break;
  7405			}
  7406		}
  7407		reclaimed += reclaim_pages(&folio_list);
  7408	
  7409		return reclaimed;
  7410	}
  7411	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
