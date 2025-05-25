Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2EB32C85
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 06:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156122; cv=none; b=kqmqA3YVvlmPOkXMFw4vlWvgSlpkplCQOiqGkLu0bgS6+t+Hnln1qaMJ9GoZB89d9V9ewJEwSpOUqlblYuM/CQH7XbDzf3aqSMTAqv8x7AIG0snII5jLNP7OlE4Fx9oDeQZGd1bfsqiJ4CQdHNChhBTFl/QnEUYpzNRVvXFNiVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156122; c=relaxed/simple;
	bh=5qMjrgUYvlba2efaiGoW5Fzbzasujnn7KOgFyQVGai4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SaGBY6OgUTM8zKTVSOmsDiCLdKoL2fKZIRZ8EPsyq+amqw6gimHW3nHBHDmel6ywTo862FhFHSn2TtaX3T+VOc7rh1e5ecNugRd1rzV56KLPs9me5GFRf7QUan2desC/6FDzR6PerV3vNM9IoblteE9cKEr6Xh+v4DEpm5jHDWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZB1UfCh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZB1UfCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748156120; x=1779692120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qMjrgUYvlba2efaiGoW5Fzbzasujnn7KOgFyQVGai4=;
  b=QZB1UfChtyFtKqMcAQOFgXss5OsA48oZpXQpxgS5qe6CYWYXyxLlXcrS
   GikGEPjjowR4woN/HzNQjStcqu4KKMb/Vrj9KpQpKPbA4p+hnuSHKHoXE
   1jXZL/GYL/gl+k7lZv80dYy4wt0TA0MNXeNdbnA/f428yUbJ4cXK2njp3
   yVR5olKP9X3ig+d8h/+kQDhSLK3438fFGShzpiIU7fVaPKLyNJumvTTjT
   ql4vgm9GL1Yr5rBRj0eGN17wG6wqL84HtseEa8NMs8s5iTj2WdvKNK3+p
   nb97LYNjFmnCJ34lyuhFvyTXL7HV1dheqdd8/pTKRuDAWIoIZ/GFekeY+
   w==;
X-CSE-ConnectionGUID: CMk7PSyuS3O2NGP1IPQ/pg==
X-CSE-MsgGUID: 1bWMTmIVRbqHQq8I8WB8kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="53811644"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="53811644"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 23:55:20 -0700
X-CSE-ConnectionGUID: WvFq42hwT9SKjsX8xZuwyQ==
X-CSE-MsgGUID: /vOL5BU5RqS9CnN7DLtQ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="141691994"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2025 23:55:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ5GO-000RfG-29;
	Sun, 25 May 2025 06:55:16 +0000
Date: Sun, 25 May 2025 14:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 299/299]
 fs/bcachefs/fast_list.c:118:16: warning: unused variable 'flags'
Message-ID: <202505251423.YmHaN7tO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   38d6d152803440c29cbcc3f7031d5feab5d84c20
commit: 38d6d152803440c29cbcc3f7031d5feab5d84c20 [299/299] bcachefs: use scoped_guard() in fast_list.c
config: s390-randconfig-002-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251423.YmHaN7tO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505251423.YmHaN7tO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251423.YmHaN7tO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fast_list.c: In function 'fast_list_remove':
>> fs/bcachefs/fast_list.c:118:16: warning: unused variable 'flags' [-Wunused-variable]
     unsigned long flags;
                   ^~~~~


vim +/flags +118 fs/bcachefs/fast_list.c

d49bafdc5d16591 Kent Overstreet 2024-09-28  106  
d49bafdc5d16591 Kent Overstreet 2024-09-28  107  /**
d49bafdc5d16591 Kent Overstreet 2024-09-28  108   * fast_list_remove - remove an item from a fast_list
d49bafdc5d16591 Kent Overstreet 2024-09-28  109   * @l:		list
d49bafdc5d16591 Kent Overstreet 2024-09-28  110   * @idx:	item's slot index
d49bafdc5d16591 Kent Overstreet 2024-09-28  111   *
d49bafdc5d16591 Kent Overstreet 2024-09-28  112   * Zeroes out the slot in the radix tree and frees the slot for future
d49bafdc5d16591 Kent Overstreet 2024-09-28  113   * fast_list_add() operations.
d49bafdc5d16591 Kent Overstreet 2024-09-28  114   */
d49bafdc5d16591 Kent Overstreet 2024-09-28  115  void fast_list_remove(struct fast_list *l, unsigned idx)
d49bafdc5d16591 Kent Overstreet 2024-09-28  116  {
d49bafdc5d16591 Kent Overstreet 2024-09-28  117  	u32 entries[16], nr = 0;
d49bafdc5d16591 Kent Overstreet 2024-09-28 @118  	unsigned long flags;
d49bafdc5d16591 Kent Overstreet 2024-09-28  119  
d49bafdc5d16591 Kent Overstreet 2024-09-28  120  	if (!idx)
d49bafdc5d16591 Kent Overstreet 2024-09-28  121  		return;
d49bafdc5d16591 Kent Overstreet 2024-09-28  122  
d49bafdc5d16591 Kent Overstreet 2024-09-28  123  	*genradix_ptr_inlined(&l->items, idx) = NULL;
d49bafdc5d16591 Kent Overstreet 2024-09-28  124  
38d6d152803440c Kent Overstreet 2025-05-25  125  	scoped_guard(irqsave) {
d49bafdc5d16591 Kent Overstreet 2024-09-28  126  		struct fast_list_pcpu *lp = this_cpu_ptr(l->buffer);
d49bafdc5d16591 Kent Overstreet 2024-09-28  127  
d49bafdc5d16591 Kent Overstreet 2024-09-28  128  		if (unlikely(lp->nr == ARRAY_SIZE(lp->entries)))
d49bafdc5d16591 Kent Overstreet 2024-09-28  129  			while (nr < ARRAY_SIZE(entries))
d49bafdc5d16591 Kent Overstreet 2024-09-28  130  				entries[nr++] = lp->entries[--lp->nr];
d49bafdc5d16591 Kent Overstreet 2024-09-28  131  
d49bafdc5d16591 Kent Overstreet 2024-09-28  132  		lp->entries[lp->nr++] = idx;
38d6d152803440c Kent Overstreet 2025-05-25  133  	}
d49bafdc5d16591 Kent Overstreet 2024-09-28  134  
d49bafdc5d16591 Kent Overstreet 2024-09-28  135  	if (unlikely(nr))
d49bafdc5d16591 Kent Overstreet 2024-09-28  136  		while (nr)
d49bafdc5d16591 Kent Overstreet 2024-09-28  137  			ida_free(&l->slots_allocated, entries[--nr]);
d49bafdc5d16591 Kent Overstreet 2024-09-28  138  }
d49bafdc5d16591 Kent Overstreet 2024-09-28  139  

:::::: The code at line 118 was first introduced by commit
:::::: d49bafdc5d1659171d988888ebfc773629f8ca97 bcachefs: fast_list

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
