Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9A11A0BC9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937596; cv=none; b=Oo4JYNzK5xcvJQjZrUORal3o7kgkhORoXGuTEbuqXyDyhVCnzSqQqSsvK+wMoMgbQH18TWT/W06QmO1uNm4wAihb9N0u3cDmha7ITXTotERSVfds1g7ag9L/7ieBKL1lNYwAfM74NozaVIfPjqkogu9B7y2gv6zOQ3CE0WaH1dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937596; c=relaxed/simple;
	bh=tOwPpYGFdGD2JRvumdnEAaypaSlpManYCkAoaKjaTYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lRsYvPw/HYZRgIbLRcQyxrcxSCXn6VylBKSwCNK91xzdcSi1UupJqVrVBNsdQ3CgQMsPQ7KjjPLDYMlRNf42DHJKnrqLyj+CFM4afdw4hG/omg6zTi1j+juBbMhd1QZHE+ZLu6jJBOUwz3Ga9hOJTjSnTqsC2ZsMnPL1q2ywKyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkZIdAz7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkZIdAz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747937595; x=1779473595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tOwPpYGFdGD2JRvumdnEAaypaSlpManYCkAoaKjaTYU=;
  b=JkZIdAz7FHJI8QTFRJwTNCQ2mOgk9HKrttAUTkZxJjuO2XJWAk487deM
   NYzBYKCNfNPzJDo1gMXcVs8THFFUu4bQmoFBgbnCPmx4c+z4LbpY5Opdm
   9lKOwU2xsjQo1sarbZFM4/0s52DNeJpSviVXnfsDsTbI9gD0Nt4bFVurZ
   T/gHZF4NUprZmOkSvT//QX0IheVUcijNkkudTDU/yyjTa09CbtLLl2fr+
   I9bShdicvVU1bYo6ng9T83Wy3uSSNs/QzwT8s0/eo7dXCRQc44d8Cy9kT
   4vm9ffXi17bOpnFKjwF9T9ItSvAGne5AnXgSmyhy0guW8N9VY5gR6i314
   w==;
X-CSE-ConnectionGUID: ZpL1jeJ5S+6EKhIEkoNCnw==
X-CSE-MsgGUID: ki3es4yXQ762F/l6QEnUFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="52610761"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="52610761"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 11:13:14 -0700
X-CSE-ConnectionGUID: AyDO0t1XREOilbiqKzMQEA==
X-CSE-MsgGUID: 37sl845iTEqcXSdF2pJZhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="163988474"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 May 2025 11:13:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIAPn-000Pae-0k;
	Thu, 22 May 2025 18:13:11 +0000
Date: Fri, 23 May 2025 02:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 10/22] mm/migrate.c:192: warning:
 Function parameter or struct member 'dst' not described in
 'migrate_non_folio_page'
Message-ID: <202505230233.bEeomDWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   d598167a1ec281079ea1f6a0f041fa2b1918001a
commit: 19d9d3ad2c6e040da894b7ce0b8d610ad6d4fe8f [10/22] mm/migrate: factor out non-folio page handling into migrate_non_folio_page()
config: x86_64-randconfig-008-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230233.bEeomDWR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230233.bEeomDWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230233.bEeomDWR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:192: warning: Function parameter or struct member 'dst' not described in 'migrate_non_folio_page'
>> mm/migrate.c:192: warning: Function parameter or struct member 'src' not described in 'migrate_non_folio_page'
>> mm/migrate.c:192: warning: Function parameter or struct member 'mode' not described in 'migrate_non_folio_page'
>> mm/migrate.c:192: warning: Excess function parameter 'page' description in 'migrate_non_folio_page'


vim +192 mm/migrate.c

   163	
   164	/**
   165	 * migrate_non_folio_page - migrate a non-folio page
   166	 * @page: The page.
   167	 *
   168	 * Migrate a non-folio page that was previously isolated with
   169	 * isolated_non_folio_page().
   170	 *
   171	 * If the src page was already released by its owner, the src page is
   172	 * un-isolated and migration succeeds; the migration core will be the
   173	 * owner of both pages.
   174	 *
   175	 * If the src page was not released by its owner and the migration was
   176	 * successful, the owner of the src page and the dst page are swapped and
   177	 * the src page is un-isolated.
   178	 *
   179	 * If migration fails, the ownership stays unmodified and the src page
   180	 * remains isolated: migration may be retried later or the page can be putback.
   181	 *
   182	 * TODO: migration core will treat both pages as folios and lock them before
   183	 * this call to unlock them after this call. Further, the folio refcounts on
   184	 * src and dst are also released by migration core. These pages will not be
   185	 * folios in the future, so that must be reworked.
   186	 *
   187	 * Returns MIGRATEPAGE_SUCCESS on success, otherwise a negative error
   188	 * code.
   189	 */
   190	static int migrate_non_folio_page(struct page *dst, struct page *src,
   191			enum migrate_mode mode)
 > 192	{
   193		int rc = MIGRATEPAGE_SUCCESS;
   194	
   195		VM_WARN_ON_ONCE(!PageIsolated(src));
   196		/* If the page was released by it's owner, there is nothing to do. */
   197		if (PageMovable(src))
   198			rc = page_movable_ops(src)->migrate_page(dst, src, mode);
   199		if (rc == MIGRATEPAGE_SUCCESS)
   200			ClearPageIsolated(src);
   201		return rc;
   202	}
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
