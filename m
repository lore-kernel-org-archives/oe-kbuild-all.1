Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB8A1D5CE7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730757648; cv=none; b=p1/a7DAXl8jXg/NMDq6j8n4wPBZEr9y394fmfLJ32mm7n2ahuiKR9aLKClrNXY1zp+0mnguSzUBIB6MY/UDFVg9rP1B0rFPpREOrSQKnXEU67hlFRqJD/dJdb9qgbPBIbabc2423KX8S+9cvuacH+ygQSKGWxgEF7q/ADrXU/qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730757648; c=relaxed/simple;
	bh=BrAmx1hZ30mAX/h2aAqOMb8rQ0yN+SnP7saW/HC+zfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCMthlJj79t3hW05lTewkyNUNs7NZKw1E5k7Gcoe6pBthMYJfbz5GuNzzKi6umkTNLMYhAwK1FIkBUVUvrAvjN+SqUcJ/A7q6IpWtmWz49+TAkRWCcEZwjOcEyxjBPO8Z+0xWoHTvQ6/sz9XNmP6MLIOlODAKE/Fm08eDvV3uWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJlx2vuv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJlx2vuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730757646; x=1762293646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BrAmx1hZ30mAX/h2aAqOMb8rQ0yN+SnP7saW/HC+zfU=;
  b=AJlx2vuvVLzwa0oNb7g9lgLnDZGSnpoDEhzM3+R/ZiVhTOscjiLpQ+sz
   3tZIN8EhgxKtJmOv7nDAjTp6TFYNjgN1sobgSa5RHYzTBmnh62eOb5AVm
   +8THW5YVv+PX/L7n0BXERewzkeZ9xPcjPAmHvfJSxidUzFe2Er7uMKca9
   SfA0fcbMe/ca+yE3iZlgHG/TrU5U2WWXAfrOhhXUW0eflWlzq1EWGO8wA
   36ye89xgkoHBQbFVcnf0dzHN8XmTX8xAZM9+uAHO2IbMnjVRlE0tPkBWW
   uQmpra5qpL9HNpabg/eiu0KLqIk7tKFSm82LBFy9XFrf5w0YL9oFGGalk
   A==;
X-CSE-ConnectionGUID: yIbAzXsuT8ysWgX9JmV76w==
X-CSE-MsgGUID: ltWuqdvYS9Suy1ZrnIULjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18097380"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="18097380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 14:00:43 -0800
X-CSE-ConnectionGUID: TZrufVL9TXKzzArsgyWWbQ==
X-CSE-MsgGUID: Sx4XrgHpQXSrSx9ESRGwMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="84120109"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2024 14:00:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t857n-000lJv-1W;
	Mon, 04 Nov 2024 22:00:39 +0000
Date: Tue, 5 Nov 2024 06:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9864/16090]
 arch/x86/kernel/early-quirks.c:727:34: warning: no previous prototype for
 function 'kh40000_get_direct_dma_ops'
Message-ID: <202411050505.GKcOQBxL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab4fcabb7d813ddd7a455c85557f8d0891df4c41
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [9864/16090] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-buildonly-randconfig-002-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050505.GKcOQBxL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050505.GKcOQBxL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050505.GKcOQBxL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/early-quirks.c:13:
   In file included from include/linux/pci.h:1666:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for function 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^
   arch/x86/kernel/early-quirks.c:722:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     722 | bool is_zhaoxin_kh40000(void)
         | ^
         | static 
>> arch/x86/kernel/early-quirks.c:727:34: warning: no previous prototype for function 'kh40000_get_direct_dma_ops' [-Wmissing-prototypes]
     727 | __weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
         |                                  ^
   arch/x86/kernel/early-quirks.c:727:14: note: declare 'static' if the function is not intended to be used outside of this translation unit
     727 | __weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
         |              ^
         |              static 
   3 warnings generated.


vim +/kh40000_get_direct_dma_ops +727 arch/x86/kernel/early-quirks.c

   721	
 > 722	bool is_zhaoxin_kh40000(void)
   723	{
   724		return zhaoxin_kh40000;
   725	}
   726	
 > 727	__weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
   728	{
   729		return dma_ops;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
