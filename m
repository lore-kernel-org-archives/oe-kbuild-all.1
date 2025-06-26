Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2A2E718D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952431; cv=none; b=aPySPJM2wOjgMd4cCLi5Gw5QWFaDztVzfjCnN/CkYjB052voPOPW9Ox9x43bbePo1RVGND7Aqx6WLoKXCkG7V2Qq0e0CAzkheVodRcDzNkDfxp6N0Mrgw5C0+e0+0e9AFZ7xlJEl+xsFVHKZj0tEyA97mpH0GCJiMBYHd0T8L1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952431; c=relaxed/simple;
	bh=QvXKLKollMOX5Lb0Y68xf5vFlkmwYxxcoDXDNoIyOt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JHHP8JtVnOoLoXK5cqGboNBjT6Kcft0WkJz88mbNRcDmwcJefZktvgZMDJZfABYebb3uefkdlLi7C3GWZeldupixJRYPXmZvmO+OVqHcdcbpK7wPwPLs4DNQ4xAsb5qOSbNrCNhLyNxkgEZwfb9mfVF4TotwP47IxtS1W+JAnYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1t7pt/j; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1t7pt/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750952429; x=1782488429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QvXKLKollMOX5Lb0Y68xf5vFlkmwYxxcoDXDNoIyOt4=;
  b=G1t7pt/jqO7FZBLyoGusGPpbsx10GiRstOCQUltld6TRrmvg8u71zfC7
   Sqm9mgOAQt4QyNNdwILFewNu23oPGc/uxt3IKeJKegP4ihV7Z7q9aPzys
   5HfUfuP/XT3Hz18Fn4F7RH/iMEoZAfjEW+8tQHlxp+EQDqq2EisYX5mth
   zmCqOqqvtWTbXJT/6Uu7w0g3OXddcTIWgUO6xWCP8aMGx9bgaTLxv1YU1
   55GzOj5g5flUNhnjryRDkfKWwkyvuP+g+thbvB7npca+TjH9jA1gCLazT
   456mDtTqkxZnO+VfDQuAriBm7Djg6OeRaPhIahl+HFiWWpy4ZzXJGZPEh
   Q==;
X-CSE-ConnectionGUID: XXYPbtLbTWOlX8xiy6Mhew==
X-CSE-MsgGUID: ntt09N2CROKAmpkd4e92Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64690728"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="64690728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:40:29 -0700
X-CSE-ConnectionGUID: /Ya2QkpCTtyPea0tLr1ovA==
X-CSE-MsgGUID: A4dkBbI2T2iS2tRhzj1uZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152305729"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Jun 2025 08:40:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUoi9-000UDi-1N;
	Thu, 26 Jun 2025 15:40:25 +0000
Date: Thu, 26 Jun 2025 23:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Zi Yan <ziy@nvidia.com>
Subject: [davidhildenbrand:migration 19/29] mm/migrate.c:74: undefined
 reference to `zsmalloc_mops'
Message-ID: <202506262314.sLjaWWCY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   2119af6765ea1ce921ab4e6dba8ee4e651e42a59
commit: d9cf33cabf3b3027973522362e9198273c7abffd [19/29] mm: stop storing migration_ops in page->mapping
config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/archive/20250626/202506262314.sLjaWWCY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506262314.sLjaWWCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506262314.sLjaWWCY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/migrate.o: in function `page_movable_ops':
>> mm/migrate.c:74: undefined reference to `zsmalloc_mops'


vim +74 mm/migrate.c

    55	
    56	static const struct movable_operations *page_movable_ops(struct page *page)
    57	{
    58		VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
    59	
    60		/*
    61		 * If we enable page migration for a page of a certain type by marking
    62		 * it as movable, the page type must be sticky until the page gets freed
    63		 * back to the buddy.
    64		 */
    65	#ifdef CONFIG_BALLOON_COMPACTION
    66		if (PageOffline(page))
    67			/* Only balloon compaction sets PageOffline pages movable. */
    68			return &balloon_mops;
    69	#endif /* CONFIG_BALLOON_COMPACTION */
    70	#ifdef CONFIG_ZSMALLOC
    71		if (PageZsmalloc(page))
    72			return &zsmalloc_mops;
    73	#endif /* CONFIG_ZSMALLOC */
  > 74		return NULL;
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
