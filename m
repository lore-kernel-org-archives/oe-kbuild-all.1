Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B33191F98
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 02:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481570; cv=none; b=IVqh5L1uIKebhK7J3EGgf5fCveo5/tETz90PBzJeM4GpNnQjdFEZaW8WKUYhNtib7OKQ9aW/pf2YcBhYjr9UkO6VjWgDNISB1eg2/j89myxsDhZhKjpHqFPNunPgqxqqi0lBc1retH7defPrL4fQam7KoHZe9kI1GbyvhpuPfKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481570; c=relaxed/simple;
	bh=6gD5EZExapz8ece3K1wVGUlW8m1deY9KxvWP6xxeRpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l+IPh2rOavcB4DPfyNCLRU18f7l1Id/EioJOy1RpgNMC023HK0kQM2JTxQ9MJIOuKnxYUSmX5RLZh8ck16a+QZQAs8zAIBEwVbBIuCdeuTB8B16ZpG1QfN6HcPrnUNLGvMrgRVMc+PEIhLBdz60Q4MRPIOOHO8kG2CcoDgcUjpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ScmJd/zT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ScmJd/zT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769481568; x=1801017568;
  h=date:from:to:cc:subject:message-id;
  bh=6gD5EZExapz8ece3K1wVGUlW8m1deY9KxvWP6xxeRpA=;
  b=ScmJd/zTk44AKfD0cYPaxjf0vTx/iNXEfuBOsVc5acmyD6C7Y6gW5M+i
   NAwN4MBXJXQln+aTVk42q4xEOOzID/8ftgrj7xsTB1nUcFOM4/ReAVReF
   UUxR+DhQedq19BzRXjzaFQUDB+85EYv+910vGdn6pXGkE61+F4C2swTcE
   rBUKuHT2Ja0/GBkd9G0zLE5Stm3WVob1ddD/nY/QrfcCcrCWVKzE9zuGT
   LpoiB4W2ZbdbsScrQOug9XTxAEPc4vApvzKartCQyPsEWnS6b0+p7+7qI
   OyoEnKVhcaEhsXJ1wbTB5gH3wV+uq4AxvUE9pmFo/+/2hatyGAmteX8ps
   w==;
X-CSE-ConnectionGUID: cH3gjx81R0KmU51WPYJJRw==
X-CSE-MsgGUID: 0l5XDMhYSKKxuGzJHz+puQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70569822"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70569822"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 18:39:27 -0800
X-CSE-ConnectionGUID: MxpWI40cR6SrEASGtDAnGA==
X-CSE-MsgGUID: IOUV0Z/bQxiqN2Gle2kgtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207727397"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jan 2026 18:39:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkYzD-00000000Xuk-2zdt;
	Tue, 27 Jan 2026 02:39:23 +0000
Date: Tue, 27 Jan 2026 10:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri 14/18]
 include/linux/acpi.h:1582:16: warning: returning 'int' from a function with
 return type 'struct acpi_pptt_cache *' makes pointer from integer without a
 cast
Message-ID: <202601271042.UhQdvKmt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   8182dddb709d03a64b99b430d05f8f21103aa9b3
commit: 60aed9e92fe0ca93b56a46ae251eb1ff851d572f [14/18] acpi: pptt: Add helper to find a cache from id
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260127/202601271042.UhQdvKmt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271042.UhQdvKmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271042.UhQdvKmt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/main.c:31:
   include/linux/acpi.h: In function 'find_acpi_cache_from_id':
>> include/linux/acpi.h:1582:16: warning: returning 'int' from a function with return type 'struct acpi_pptt_cache *' makes pointer from integer without a cast [-Wint-conversion]
    1582 |         return -EINVAL;
         |                ^


vim +1582 include/linux/acpi.h

  1579	
  1580	static inline struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id)
  1581	{
> 1582		return -EINVAL;
  1583	}
  1584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
