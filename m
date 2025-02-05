Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8130222DF81
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758037; cv=none; b=jw1Wj+244Z+NbvUpYJXfB5RY0WUJf5INANYyk+D0WoOqoZW9yjfASzQWNbVTsE8KKK4cz2IaxK0Sh6brBI+2BgIgB5VqnSiKg9CSQNNJ+4So8GTVOwxBD/BjHYRK6lwUJiFjftQQnuy9oYb1KDkMO50CbV9ncnnXxdBPs9dtmgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758037; c=relaxed/simple;
	bh=f1ppVHpe9kr2PtPnI+mWauj9WQ+R0qf0GEDK1AdEHQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2pyZcUCdnJplNN0RJ33qc8ae7thQ2pZGYJeQvGcyhWi9X5nPbN5vOtwLJBUua3nPC7Q+UVZwumOyD4g5C3Oqov++hgwc1jUj3k1yJsbtxE96ay3XvEirOjfEyfzbbRSlxC2IxSv+pwvISCmZb8ip0mzd7Ek+dGT3NeyVGGjazE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dneQEen1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dneQEen1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738758035; x=1770294035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1ppVHpe9kr2PtPnI+mWauj9WQ+R0qf0GEDK1AdEHQ8=;
  b=dneQEen19ILuzjDBLMqolSKSywHVKfospu5K94NOJURC11ey6ukAyD+V
   fTu8a5qgTxSvodedOMXFfpmvbIG5A02tr4tiBvssbPSN5HwteAbkzTxhf
   /6MvoWuWcKNBC9PqF3RDVFaOPfGpke31aw2+ne81WsL/IxhX9SLhcNEuy
   SQf08WBc8YEBbPEJFQlaP129TMgxiMju0RcKsLD6krFjjYyZt9vmtz1rb
   n6nvwyd/TH1ymz8vhdJAS9mHtOXyFmMWD7W2W4SwZzXht/bXdshepm2Wh
   eU9JSTCHZwtnpBI+Uvm4HUXIT6mORhBv9o90ZwH3OWRIOBHxp4yykzmfX
   g==;
X-CSE-ConnectionGUID: cHhqY2ZnT/eXKzX1viW/zg==
X-CSE-MsgGUID: IBjRV1g4Q5+c3oZv+nHhTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42982236"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="42982236"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 04:20:35 -0800
X-CSE-ConnectionGUID: gcUnCdGGTkCqdX+WqZejKA==
X-CSE-MsgGUID: c2lIYaFMTCecpOWVPTelyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110866863"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 04:20:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfeON-000tru-0L;
	Wed, 05 Feb 2025 12:20:31 +0000
Date: Wed, 5 Feb 2025 20:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs-6.15.misc 2/3] mm/gup.c:2270: warning: Function
 parameter or struct member 'locked' not described in 'get_dump_page'
Message-ID: <202502052058.brmQ0100-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.15.misc
head:   625aec60ff1462a0620753deeec4a38ddd032e29
commit: 62801d0e24907a20b4724b58ce174bc9a2fc3b4c [2/3] fs: avoid mmap sem relocks when coredumping with many missing pages
config: i386-buildonly-randconfig-003-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052058.brmQ0100-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052058.brmQ0100-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502052058.brmQ0100-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.c:2270: warning: Function parameter or struct member 'locked' not described in 'get_dump_page'


vim +2270 mm/gup.c

bb523b406c849e Andreas Gruenbacher 2021-08-02  2253  
8f942eea12ae8c Jann Horn           2020-10-15  2254  /**
8f942eea12ae8c Jann Horn           2020-10-15  2255   * get_dump_page() - pin user page in memory while writing it to core dump
8f942eea12ae8c Jann Horn           2020-10-15  2256   * @addr: user address
8f942eea12ae8c Jann Horn           2020-10-15  2257   *
8f942eea12ae8c Jann Horn           2020-10-15  2258   * Returns struct page pointer of user page pinned for dump,
8f942eea12ae8c Jann Horn           2020-10-15  2259   * to be freed afterwards by put_page().
8f942eea12ae8c Jann Horn           2020-10-15  2260   *
8f942eea12ae8c Jann Horn           2020-10-15  2261   * Returns NULL on any kind of failure - a hole must then be inserted into
8f942eea12ae8c Jann Horn           2020-10-15  2262   * the corefile, to preserve alignment with its headers; and also returns
8f942eea12ae8c Jann Horn           2020-10-15  2263   * NULL wherever the ZERO_PAGE, or an anonymous pte_none, has been found -
8f942eea12ae8c Jann Horn           2020-10-15  2264   * allowing a hole to be left in the corefile to save disk space.
8f942eea12ae8c Jann Horn           2020-10-15  2265   *
7f3bfab52cab96 Jann Horn           2020-10-15  2266   * Called without mmap_lock (takes and releases the mmap_lock by itself).
8f942eea12ae8c Jann Horn           2020-10-15  2267   */
8f942eea12ae8c Jann Horn           2020-10-15  2268  #ifdef CONFIG_ELF_CORE
62801d0e24907a Mateusz Guzik       2025-01-19  2269  struct page *get_dump_page(unsigned long addr, int *locked)
8f942eea12ae8c Jann Horn           2020-10-15 @2270  {
8f942eea12ae8c Jann Horn           2020-10-15  2271  	struct page *page;
7f3bfab52cab96 Jann Horn           2020-10-15  2272  	int ret;
8f942eea12ae8c Jann Horn           2020-10-15  2273  
62801d0e24907a Mateusz Guzik       2025-01-19  2274  	ret = __get_user_pages_locked(current->mm, addr, 1, &page, locked,
7f3bfab52cab96 Jann Horn           2020-10-15  2275  				      FOLL_FORCE | FOLL_DUMP | FOLL_GET);
7f3bfab52cab96 Jann Horn           2020-10-15  2276  	return (ret == 1) ? page : NULL;
8f942eea12ae8c Jann Horn           2020-10-15  2277  }
8f942eea12ae8c Jann Horn           2020-10-15  2278  #endif /* CONFIG_ELF_CORE */
8f942eea12ae8c Jann Horn           2020-10-15  2279  

:::::: The code at line 2270 was first introduced by commit
:::::: 8f942eea12ae8c5a7cde85c145234b25e38de959 binfmt_elf_fdpic: stop using dump_emit() on user pointers on !MMU

:::::: TO: Jann Horn <jannh@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
