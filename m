Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FA93BCD29
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 06:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453287; cv=none; b=kAdV/5DUa9Uu2tOZzB4xdpB9YGvUEl7WIXXdYbqaG3df44KfvC1szruT2yAjurwCZHrwPq/nLC3Z7b7b0iM6mxzoX6GAVZUNHqa9HK3DnKZ7/rAZ0+G/idC9PrVSt8lFe9AGHbOw2N3379cal4bShaQuy/EeOp6w1G7iQCF4+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453287; c=relaxed/simple;
	bh=z4G27XxUCwqaCPH9yLtGpo7U8rzF3MYd6XaVWXaiCkc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WIuDO4P2msB1uMH5CT3z8AVN6Vswn6FS6o6Ry3M2oWhvbWYI1gxEfU5O3XvKvuE3JpqCKbQXadpm95FMkzxZ1vf4WfXjxj5pmiYll8unhZmoAKnZ9p5fMFfhjk5HCg5WXpMXAveiVl/5dgSDUPsCvHDNozLu/SlGEqXxTGNtaiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dq8vj7e2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dq8vj7e2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789453285; x=1820989285;
  h=date:from:to:cc:subject:message-id;
  bh=z4G27XxUCwqaCPH9yLtGpo7U8rzF3MYd6XaVWXaiCkc=;
  b=Dq8vj7e2gKHdKfALo/SlWGw5usVanMKQ5tqtb+H94+b6sewneFdkfFfG
   47Ux0o2OGD5HbIY9b29b2S8EdJWLRTNIkE4krAwJx+QEozdG1Q+roKIpw
   ni7x812ni0mdJ6Is+vK5INA1GP4V6BAZP/8kBbHpsRItSTjCBuwFR8p4J
   OAEQvRBsP3D03dWZA0Z+JCIk9KWGM3srEIhYmNwBJXQrquFJe3IZJOmFQ
   tKrdw+QIMq5ARQbrBJSr+YwWow+qZCZXjmeAkZDLg7DNcme7xx1kSBfIV
   hbpmkPdrnGc7TBg+L6+gK8MVP/KuKCOsGllAIQ4987ah2+yAVHo55S5kR
   Q==;
X-CSE-ConnectionGUID: K82klJ4bQJiX3+bHcwtngA==
X-CSE-MsgGUID: 3cW+GOi2QbGZtm0BQvpBgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89821115"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89821115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 23:21:25 -0700
X-CSE-ConnectionGUID: 5FDiqC1QTYWqDf8HSUc9Ug==
X-CSE-MsgGUID: Ce8CGG/1QvCo51QR7dZOnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269182978"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 23:21:24 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6MXh-000000000WR-40W7;
	Tue, 15 Sep 2026 06:21:21 +0000
Date: Tue, 15 Sep 2026 08:21:21 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 8/67] mm/page_alloc.c:7386:17: error: implicit declaration of function
 'folio_test_clear_young'; did you mean 'folio_test_clear_lru'?
Message-ID: <202609150733.bokShgrT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: 4af770f6b4623768abd534b154c6d8136f601cac [8/67] mm/page_alloc: let alloc_contig_range() try harder
config: i386-randconfig-054-20260915 (https://download.01.org/0day-ci/archive/20260915/202609150733.bokShgrT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150733.bokShgrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150733.bokShgrT-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'contig_range_reclaim':
>> mm/page_alloc.c:7386:17: error: implicit declaration of function 'folio_test_clear_young'; did you mean 'folio_test_clear_lru'? [-Wimplicit-function-declaration]
    7386 |                 folio_test_clear_young(folio);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 folio_test_clear_lru


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
