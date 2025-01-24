Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E5B1CCED2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 02:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737684150; cv=none; b=Ll600xg3i96XTqcx01imigg8Hl438PoldeqKRKLWQ8/zmZ3lKgnFXjsE0lP1KMEEreSry/5nM99e7loPCrgqA1hZsmsd3HQJtuzS7gHrOsycKaqzM8p2OsT43tpEh7bD5MqiBAEBHy8gEsEB9LLkz8DLNpca960lT+CA7If0QHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737684150; c=relaxed/simple;
	bh=Pt4FkoTPh/xqy5ugIaHVn4kMBmyVuuEa9zLTtJ+9Wic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tljq5ITdhfUlsixSNFU0ufzw2VwJV2+i8nhz1JPInJsiZkN36yojm1mnN4mKCyEkk0SQkW9XD6cPoTVzmO0f2sr0VngzaTEryIpl/aojcYpKfG05rnu1eAsshMQt40vjr/m2Lp15nEM25uDilVlXs8Co2lLnJ9az9sZZJlyC3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmF1wp+U; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmF1wp+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737684148; x=1769220148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pt4FkoTPh/xqy5ugIaHVn4kMBmyVuuEa9zLTtJ+9Wic=;
  b=PmF1wp+U0CSBr7jp11n+SdcRAQ67C22t+L0AKXl/KEql6V0xg1S/kMQy
   jZGRw27HCX0iu7XRvfh9sqnp+s4zJPk5YKORnRfqdwtdaJ5bhwOYMK8WR
   J9OIBLfZkfQKJ0uXL9F9AkV6aLBW8jql5biW4CwHk3n80AEtaYMGWKeHj
   Wia11AiSCaZOZs+G60Hz6I883QxHM5SGoRd+cBNpdBJWytfvW7llnGIPz
   8ShLOXMQ++aQeRcZsUKQ1RD8VavPNcSD6cwyREMX9O6U2gNfsAqxWAiFN
   8Y50DgaSITzrGbOvWTFNACXNHOexhGPIlThrwrvii/5dsvqu0e3TV9pqq
   Q==;
X-CSE-ConnectionGUID: rUCYCdm0TDaTRAv1WETqLA==
X-CSE-MsgGUID: cTBQOkDaRbamtEVnw/d5Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38242201"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="38242201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:02:28 -0800
X-CSE-ConnectionGUID: plSGiPvLTUuV91LhKwXeLw==
X-CSE-MsgGUID: DJWBW2WiTmuePgrAcLFBBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="112647473"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jan 2025 18:02:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb91b-000c0s-1e;
	Fri, 24 Jan 2025 02:02:23 +0000
Date: Fri, 24 Jan 2025 10:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/gup.c:778:15: sparse: sparse: cast to non-scalar
Message-ID: <202501240922.a4YzQD7u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e0b1f59142746f74476a03040f745329c8355a7e
commit: e6fd5564c07c3c749ff3d1b2aa35540b4047e395 mm/gup: cache p4d in follow_p4d_mask()
date:   9 months ago
config: alpha-randconfig-r112-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240922.a4YzQD7u-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240922.a4YzQD7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240922.a4YzQD7u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/gup.c:778:15: sparse: sparse: cast to non-scalar
>> mm/gup.c:778:15: sparse: sparse: cast from non-scalar
   mm/gup.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   mm/gup.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:241:46: sparse: sparse: self-comparison always evaluates to false
   mm/gup.c:682:9: sparse: sparse: context imbalance in 'follow_page_pte' - unexpected unlock
   mm/gup.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:322:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:322:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:315:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:315:16: sparse: sparse: cast from non-scalar
   mm/gup.c:911:18: sparse: sparse: context imbalance in 'get_gate_page' - unexpected unlock

vim +778 mm/gup.c

   769	
   770	static struct page *follow_p4d_mask(struct vm_area_struct *vma,
   771					    unsigned long address, pgd_t *pgdp,
   772					    unsigned int flags,
   773					    struct follow_page_context *ctx)
   774	{
   775		p4d_t *p4dp, p4d;
   776	
   777		p4dp = p4d_offset(pgdp, address);
 > 778		p4d = READ_ONCE(*p4dp);
   779		if (p4d_none(p4d))
   780			return no_page_table(vma, flags);
   781		BUILD_BUG_ON(p4d_huge(p4d));
   782		if (unlikely(p4d_bad(p4d)))
   783			return no_page_table(vma, flags);
   784	
   785		return follow_pud_mask(vma, address, p4dp, flags, ctx);
   786	}
   787	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
