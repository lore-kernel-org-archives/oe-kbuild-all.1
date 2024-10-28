Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CF718C90A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 07:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101842; cv=none; b=PRHIyKaVX6G4jtnb6snU+sfDzCwQrSN2ozJm7r2k5EsbhsrjWmJ+DcDwX/CIMimxZ7EDx6jmt31fmZoB0409ZaTDYGM2O4VHP8vfYPLv7lXET8/bRCzvOlntK1brIb7oV64NouGOS7yiwHVisnFaoWH5ZfN8cOhhEnrLdKXDR3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101842; c=relaxed/simple;
	bh=h9SlZrc4kfntcHB/dZzVdSpdWA2Am6XwFODO4QATLoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O6+OQ1Vh8azgrmL6IENkZoF/AnzmOI+d7xKV5cBhizXY+FPewJGucwme+vOLUpE4l5UufYkTNIdO0N2amIO7W+QCTBAflPC6pe8V9Dgg5oKQ7gMPBCfKt/vkmBaiUetZOf78GiOvW2IdJxqM5gzoFqjRY8Cw9r6H/HguEtjcqSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cq3+tsrH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cq3+tsrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730101840; x=1761637840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h9SlZrc4kfntcHB/dZzVdSpdWA2Am6XwFODO4QATLoQ=;
  b=cq3+tsrHEriHIKO17X4tM3a6VWmNntz+QnRlC9cebL87kTF04OmulEH8
   VuN2Dp2bJ0GC/IBnrUfyLkGGaw7202rUIVD9BKO8kXVfSDuYZCeyasB9k
   ncQqwhgUBQlCTka0t322HOds8ashBWzIghc5PIUdq20pyGkDemLz9i/jS
   ufm0j1Niz/Y/C3yNm8rAiTsec/FPGrzRFdhU5mVg1CQvZz2KKJwZ31tsf
   L7Q4Rah1waOkEPHEOzKA8Fdc7oQt7ONMZnsQcvMLdzg+hWqURGfxdvG3e
   WfOnh+XTot6wZHqInE3iy112asLquBAonbd5vsCAKjnSDzXWadNMsNQFR
   A==;
X-CSE-ConnectionGUID: xUIBXm9JTA6mNE3Xsk0jDw==
X-CSE-MsgGUID: mdXHHq/5QjuaTHlEomBGgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33484099"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="33484099"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:50:40 -0700
X-CSE-ConnectionGUID: oMdBPahmTImyqph9q1rRRQ==
X-CSE-MsgGUID: mqyLkb9RQ8yCisB8a6BjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86681052"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Oct 2024 00:50:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5KWJ-000c8U-1u;
	Mon, 28 Oct 2024 07:50:35 +0000
Date: Mon, 28 Oct 2024 15:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 239/250] mm/workingset.c:598:38: error:
 implicit declaration of function 'folio_memcg_charged'; did you mean
 'folio_memcg_check'?
Message-ID: <202410281525.6Obl6WjL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   92409df3e00a17d6fd5bb27732fa186749725ed5
commit: b4fa93fbd1dc5828d3a21ec45d9a6386058181de [239/250] memcg: workingset: remove folio_memcg_rcu usage
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20241028/202410281525.6Obl6WjL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281525.6Obl6WjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281525.6Obl6WjL-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/workingset.c: In function 'workingset_activation':
>> mm/workingset.c:598:38: error: implicit declaration of function 'folio_memcg_charged'; did you mean 'folio_memcg_check'? [-Wimplicit-function-declaration]
     598 |         if (mem_cgroup_disabled() || folio_memcg_charged(folio))
         |                                      ^~~~~~~~~~~~~~~~~~~
         |                                      folio_memcg_check


vim +598 mm/workingset.c

   587	
   588	/**
   589	 * workingset_activation - note a page activation
   590	 * @folio: Folio that is being activated.
   591	 */
   592	void workingset_activation(struct folio *folio)
   593	{
   594		/*
   595		 * Filter non-memcg pages here, e.g. unmap can call
   596		 * mark_page_accessed() on VDSO pages.
   597		 */
 > 598		if (mem_cgroup_disabled() || folio_memcg_charged(folio))
   599			workingset_age_nonresident(folio_lruvec(folio), folio_nr_pages(folio));
   600	}
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
