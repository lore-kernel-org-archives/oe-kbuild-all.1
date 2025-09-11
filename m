Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BEA1F5851
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 21:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626350; cv=none; b=hE8a3wp5hDelsaEvzHiK9upG7inF8SRYej3gB+FW2SyyYlecOEnEHwKz+IhBUWojVmncOkLCVQBiiGo5W+cClFGEf3+O5LGIR8cCnUYsFitTDMcfM+pfG5tiBdOJjaOSAlzfLSWq8XYfhMHTQfajEF4RjdCv348xpyVkrLwECPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626350; c=relaxed/simple;
	bh=zXy1HEH2uPFS4s3SbrF8IGtm5jPewK8JqClz/oEsfLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCIswxgr50p+85LkqQinBvkl1Di+ZNkh4dzkJT2dCLByFih/v9vH8HIxGbHJrVkK1Z8BIefX6CeoXqL8Z8p0B5Tx7jgJYPdwfuYDLbbgtmKJ/J5wXMc9E0jgSR5UQutYK5opwlIVV1uCOSezpsqK0mB6XG7pbAo7CCNaSgHOC3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEbzgLKf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEbzgLKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757626348; x=1789162348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXy1HEH2uPFS4s3SbrF8IGtm5jPewK8JqClz/oEsfLA=;
  b=JEbzgLKfiZ+A8ixKoU6wfvRe2PPLgJkqlNTq9gQ360D5k/MdLVMWc9uW
   PYgF5ZvGRym27WiWlYFDQcM6pWtv6gfqw0C3iweeM4BRaB4CGwhHnIchr
   GWRBe7QuFTdGUfOiwS1KJUcQb0Ax9bd5vWljAx2tTMDwnXsox2tSj3wXy
   vKGxOAPuTrfKi8cgIoblQzKt94jg1Tt7+FjzhutvRAcTFpRprqWXysA5g
   DLzGN2VAMTW/aZqq1OXsyARhZUfpTdVXcSUdWi8OG5b/lFf6hZVDkOMuE
   2mFgZfaNSJMsDWegSC0J03x2GCEP+Yc3T1n2h0mFzkzFrHMuf7khQEwBN
   w==;
X-CSE-ConnectionGUID: 3kaGi6UBSa6MfdTYBybpRg==
X-CSE-MsgGUID: Cba0k8LUQMWbyXLptH8g1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70590228"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="70590228"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 14:32:27 -0700
X-CSE-ConnectionGUID: kQENUW1kSM++OhHMGoS49w==
X-CSE-MsgGUID: 4wZherGfQ7eKmCfVr0MtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="179015372"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Sep 2025 14:31:34 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwotA-0000eG-1G;
	Thu, 11 Sep 2025 21:31:32 +0000
Date: Fri, 12 Sep 2025 05:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 423/440] util.c:undefined reference to
 `vmf_insert_mixed'
Message-ID: <202509120557.Fjb2Px63-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   31690ac95cb30fd036eeda36844c6e2820685e7c
commit: 52b3813194a48b5dd38cc3d76686e0b060171b0f [423/440] mm: add ability to take further action in vm_area_desc
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250912/202509120557.Fjb2Px63-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120557.Fjb2Px63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509120557.Fjb2Px63-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: mm/util.o: in function `mmap_action_complete':
>> util.c:(.text+0x92c): undefined reference to `vmf_insert_mixed'
>> m68k-linux-ld: util.c:(.text+0xa2a): undefined reference to `remap_pfn_range_complete'
   m68k-linux-ld: mm/util.o: in function `mmap_action_prepare':
>> util.c:(.text+0xbe0): undefined reference to `remap_pfn_range_prepare'
   m68k-linux-ld: mm/util.o: in function `__compat_vma_mmap_prepare':
   util.c:(.text+0x10f6): undefined reference to `remap_pfn_range_prepare'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
