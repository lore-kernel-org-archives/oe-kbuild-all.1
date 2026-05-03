Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CB121D596
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777792889; cv=none; b=mIKMX3VkhTU/SbyajkDWz5zgGJ1XJFL02lkoKYWnmlXK0EvRLusNNOjCr2NahcGumtTd9i+LvtJw7KfkgAX3bPQ4y6+e15PepBIbZhwS1QwNRc8mxneTzmoZZDBDi9hSx0sj4nmAj7y2AlSeY9VcIUVvfxcspkCWfkMmlhFL1T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777792889; c=relaxed/simple;
	bh=3eQEaY/qOVr4OGd/C9d+BMbhYulq5ijaq2fiyz73BXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XSVKMP27xR7IcNpFjdRW3tywLxq5GZkMAAHZ98soUDCXD6uq2EPMu5P/9VGkKEpeCYlUrZzaKEBVwWI35dLqou7nyFUwmvuZ878jvGGeT/5zhYGODuQE1zdtkgCOP8bGl5LyyVENZFiEEqy3pgC0/vwjC8krZQ20iWwGXgjoqmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0BhIVqb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0BhIVqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777792888; x=1809328888;
  h=date:from:to:cc:subject:message-id;
  bh=3eQEaY/qOVr4OGd/C9d+BMbhYulq5ijaq2fiyz73BXU=;
  b=Z0BhIVqbxfxbkwNbUG1ekQcX/WUbILG7lr6pyTH3pwCiP+YBQzci6IKl
   oVDsbJPxKjV7kFIZW8DRGNo3R/EqJljNsiOd2dAHRmHbML+SVw53Su/xi
   Nn0ZfWkAEv/T18iDvS0cUWzOaRr7JTG12AxY5KAhV1vR0UuNsqCb4qaU/
   I1/A2QymLilnoPxvkUvCsPQl+FBQukp9ia2KmEdR/Gw6ezBhjPOS/5Rgm
   pVyvkSBQGryXOsa9gnOdn1T/vIH7qhrv6FSMeUc9j9JoUGvI0Q+ZcnQ0C
   FNVCi5eoATcINuq0ht55QvvHm51WFIi/G4pwJzjPV6o6KDg9vsi/BaNSL
   g==;
X-CSE-ConnectionGUID: EE5mTzqLThC8KO00/E3oJQ==
X-CSE-MsgGUID: 59XIpSppTYGSauNZjOX9hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82540066"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="82540066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 00:21:27 -0700
X-CSE-ConnectionGUID: +7OqvoWpRaOZt2pXwFibTQ==
X-CSE-MsgGUID: wIk1OXZERw65fNqn8SfWlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="228737438"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 May 2026 00:21:26 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJR8l-000000002JJ-37Ar;
	Sun, 03 May 2026 07:21:23 +0000
Date: Sun, 03 May 2026 15:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 51/69] arch/x86/mm/init_32.c:733:60: error:
 'HPTE_SIZE' undeclared; did you mean 'PTE_SIZE'?
Message-ID: <202605031516.9WZ7Ra7W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: 31f670864922c11937d9351a9e3ca96f715d7cfe [51/69] treewide: The rest of the owl
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031516.9WZ7Ra7W-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031516.9WZ7Ra7W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031516.9WZ7Ra7W-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/init_32.c: In function 'mark_nxdata_nx':
>> arch/x86/mm/init_32.c:733:60: error: 'HPTE_SIZE' undeclared (first use in this function); did you mean 'PTE_SIZE'?
     733 |         unsigned long size = (((unsigned long)__init_end + HPTE_SIZE) & HPAGE_MASK) - start;
         |                                                            ^~~~~~~~~
         |                                                            PTE_SIZE
   arch/x86/mm/init_32.c:733:60: note: each undeclared identifier is reported only once for each function it appears in


vim +733 arch/x86/mm/init_32.c

   722	
   723	static void mark_nxdata_nx(void)
   724	{
   725		/*
   726		 * When this called, init has already been executed and released,
   727		 * so everything past _etext should be NX.
   728		 */
   729		unsigned long start = PFN_ALIGN(_etext);
   730		/*
   731		 * This comes from is_x86_32_kernel_text upper limit. Also HPAGE where used:
   732		 */
 > 733		unsigned long size = (((unsigned long)__init_end + HPTE_SIZE) & HPAGE_MASK) - start;
   734	
   735		if (__supported_pte_mask & _PAGE_NX) {
   736			printk(KERN_INFO "NX-protecting the kernel data: %luk\n", size >> 10);
   737			set_memory_nx(start, size >> PTE_SHIFT);
   738		}
   739	}
   740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
