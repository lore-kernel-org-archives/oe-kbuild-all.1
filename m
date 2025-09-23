Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABD26C393
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 03:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758599735; cv=none; b=bz8QBGoqoAZkyMhGRetYdsrAqhqzoxfAswV9iWqW7cjorWcatfMgKgBN/Oom7MZucfTcFnk7xglKAyKuH12RVV7F07aJ1W95vBaSn53PGXbF1kucRvANINlGAluFlJpJat256/WM2Vio/YkKhsBDW4R8NnEYoW9EjM07jclSNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758599735; c=relaxed/simple;
	bh=ohWI6WSO+PSw4hXZhgB3dfQn+szoP3mYARPpOIebVxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDyVCPxhWeBAHNIvV6ODtdj5TtcnmMtiPY8aqm2rfR7qPyQAbqrKOAHgDHEMKKZYIZps1ClyVAUHQnwVSa3Jsh11/7Sdjwt2ZRs95l/g9GBP00u7Yf176icINUFCLqOytnVLEksrioPMjiQPzVX0CalxrYT1J/DF7Q7pXUbVMxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJ1KZnGM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJ1KZnGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758599733; x=1790135733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ohWI6WSO+PSw4hXZhgB3dfQn+szoP3mYARPpOIebVxA=;
  b=oJ1KZnGMm+idGIbNdbSpg98BEOfioRvTdJRIoXI24I7rd2up+etBRxl5
   RAYjwtBd1gLpFUn7CMoMQR+CQXnxn0BzyJMOPPzLhL/FIM9X1kdYqp9ri
   IsqvxKLsmyysqvpU/8o9HZggliv6zbOof1o7nogQwNG7ZoE/LQMbZ9dCH
   bzlfLJpZ6DFKygB58cVli1zB4tew30Ve5DfFDE0IuroCo0Zr/E2Pv18Kn
   Nko8EoAykg7MLoXjY3J6eNLzjLWay429pOlaaLssYN3gcx4kaZx8FCPaJ
   2EsFb/y1PBwFjywwqQyHEQwI58whJAdJiHu4hpydWGr9mO8ZiJ6e+80Lm
   Q==;
X-CSE-ConnectionGUID: JbGYTYUSQp+w+OdTxWFsIg==
X-CSE-MsgGUID: z0tBNnskSIyVu7Y2uBTELA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64676221"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64676221"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 20:55:33 -0700
X-CSE-ConnectionGUID: VcPg7g17QeS2ARdEpQElLA==
X-CSE-MsgGUID: T2jGMXONQk2VO7wv3QsGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="213815270"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Sep 2025 20:55:32 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0u7m-0002j2-0U;
	Tue, 23 Sep 2025 03:55:30 +0000
Date: Tue, 23 Sep 2025 11:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1] mm/swapfile.c:102:26: warning:
 no previous prototype for function 'swap_type_to_swap_info'
Message-ID: <202509231119.lhBOkHXM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f06b723c6fa4f8cf9750f131eaf8991b291f16bd
commit: 4506bcbba5ec78d8d694fbb43e964cfefe900887 [1/1] ANDROID: mm: export swap_type_to_swap_info
config: x86_64-buildonly-randconfig-004-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231119.lhBOkHXM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231119.lhBOkHXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231119.lhBOkHXM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:102:26: warning: no previous prototype for function 'swap_type_to_swap_info' [-Wmissing-prototypes]
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         |                          ^
   mm/swapfile.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         | ^
         | static 
   1 warning generated.


vim +/swap_type_to_swap_info +102 mm/swapfile.c

   101	
 > 102	struct swap_info_struct *swap_type_to_swap_info(int type)
   103	{
   104		if (type >= READ_ONCE(nr_swapfiles))
   105			return NULL;
   106	
   107		smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
   108		return READ_ONCE(swap_info[type]);
   109	}
   110	EXPORT_SYMBOL_GPL(swap_type_to_swap_info);
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
