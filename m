Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06449155726
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 18:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731176817; cv=none; b=UOeKDmqyS8B4DrPIWNuU5Leix/jpgrDFpkG13IkLMv4c2a72TpL8iWlb0eIW4Jdi4IsIWU7LIT4fNc+seHZJIL87Dg+/omCx59lSoyNGkjX/aWUYYX9oDYbAQmPZUL2pIOmlCSQyqgkdxDNGwU5PcBf8OH5xd+D/bLY2SK44LT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731176817; c=relaxed/simple;
	bh=9FUiCTlcFyo5YkBiQxL5fJqcOGhMlt2UoKDJGvt707Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pIEQC+wiV1lQ6+kgh0t3Qo6aqDgCeRf5cazZ6UFb080EH/sxMwT9ZqZ9rVa4S6qXMwMiNXKeBzZ1T8fPNmr6egDVaOMb4Wx1DLLrCs6F0LDLybemezq6Rd+2/sHngOoPZUM/EEdyrInag/l0veHDyytw/e0tcnlkIjKaq3WAfjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8bny4if; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8bny4if"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731176816; x=1762712816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9FUiCTlcFyo5YkBiQxL5fJqcOGhMlt2UoKDJGvt707Q=;
  b=j8bny4ifFUtfNga7vpcKrDM/qc8XNalmfWthYZ02e8atrWHiQKo/wFJH
   weRKTGpFmwaeR6jiNZezC7+1XgU8NBVHfpj8KLrlACoZ8dMgbXKccOBeA
   cgfoX+8bG5z5uGJmp6QRkJbq82PqfFvM55x74SO0UhaKryz/uq2fDLSoo
   b2EuTIlG+6wdZ3fdoKPNrrOvkiCVd+sQ2h3VE/8GQI1mhFcSTuIpWTGBw
   lq681Yd4LMY0lqAeSW/hoCoa+12a1FBXYwg+SobqiRBsxAVZCr7ldmvLz
   WkviwvESTLmIRSY3Rtyr6k1XtlMRLL0Mrrrpkx1oTYfy2V26y9aVueyx8
   g==;
X-CSE-ConnectionGUID: JO0h6W2kS7SOmaQfDbqT/A==
X-CSE-MsgGUID: aiU2TxSNRKGk8QVYT2lPIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42136897"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42136897"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 10:26:56 -0800
X-CSE-ConnectionGUID: hRvlbTndQ4yPtaJLPIzwXw==
X-CSE-MsgGUID: NvCdPeVCSbqjtstUs7yqyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="116961758"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2024 10:26:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9qAd-000sXM-3D;
	Sat, 09 Nov 2024 18:26:52 +0000
Date: Sun, 10 Nov 2024 02:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christopher Taylor <ctaylor@tactcomplabs.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:pr/1 1/1]
 drivers/infiniband/sw/rdmavt/qp.c:107:50: error: too many arguments to
 function call, expected 3, have 4
Message-ID: <202411100235.doMAci33-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git pr/1
head:   6f9ce1f156a4d597e2e447443a2655fb0b288337
commit: 6f9ce1f156a4d597e2e447443a2655fb0b288337 [1/1] initial import
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411100235.doMAci33-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100235.doMAci33-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100235.doMAci33-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/sw/rdmavt/qp.c:13:
   In file included from include/rdma/ib_verbs.h:15:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/sw/rdmavt/qp.c:107:50: error: too many arguments to function call, expected 3, have 4
     107 |         __copy_user_nocache(dst, (void __user *)src, n, 0);
         |         ~~~~~~~~~~~~~~~~~~~                             ^
   arch/x86/include/asm/uaccess_64.h:150:13: note: '__copy_user_nocache' declared here
     150 | extern long __copy_user_nocache(void *dst, const void __user *src, unsigned size);
         |             ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +107 drivers/infiniband/sw/rdmavt/qp.c

    96	
    97	/* platform specific: cacheless copy */
    98	static void cacheless_memcpy(void *dst, void *src, size_t n)
    99	{
   100	#if defined(CONFIG_X86_64)
   101		/*
   102		 * Use the only available X64 cacheless copy.  Add a __user cast
   103		 * to quiet sparse.  The src agument is already in the kernel so
   104		 * there are no security issues.  The extra fault recovery machinery
   105		 * is not invoked.
   106		 */
 > 107		__copy_user_nocache(dst, (void __user *)src, n, 0);
   108	#endif
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
