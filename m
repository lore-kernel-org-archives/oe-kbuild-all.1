Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F380277104
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744473814; cv=none; b=bedvO9WvW2s5Ch+FBa9pXFsbVmMSUzvWk33dttuTN8WuoN8rSjWHYUzoPk+ASWVCle5O+kUnNV4u+5pY1gsIgBp1MuHkqXz2aA6bwTOaumSstUDysocll7YiAA9WdYvu7Y9NZMs9mCiUsjI/TTLjVgIcDfnla2kYqGIwQryDpkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744473814; c=relaxed/simple;
	bh=j36SHYCJy+U+/lr8nvDnBpwZSaINR+oy1jk0KKfIbFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n2EYbd8J3rS0DVeoFhbo1TR1mZnV1pjD+Hhd8+vWs2lHH9KOKl/vnWNsFBLReIIIWrFKzW/P9Aiqg7h3nCWZYauyYX41Wmp5LOdGZGuiFYJr/rgmGsLsNMiLX6tg01H9ANz3UgHTmDgQ9biqdACOTU9rAprfMzPKBkXbcEup9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgBEQOoa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgBEQOoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744473813; x=1776009813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j36SHYCJy+U+/lr8nvDnBpwZSaINR+oy1jk0KKfIbFU=;
  b=dgBEQOoa1tmQPd+H3aTkBhFKxZZL6ZKDiaSbYYOVCSvCLTxp6ekxrOvD
   Y19FX1t0aiBJl7KuaPKDuAbDn/TgEMval+n3bbtzI0KtqI5t1Co4QmBl2
   R/WJV6UqCHVz+QrKba/TMv/K4i7CFs3H7STm9+nLxTKfxLJUrE4Dp6yDT
   72P1Ny+NDD+NwOfVM0T9n5SQ5tQmx2gOmyXZ5gSsWuySHi18JIRT3tmI2
   s1oYQjypwZCnFm+1jubvlb+z4W+I8DumlixO4mVmurTYY6x3lKKWWQpbu
   cHuemJF6NQYKaUdYnqaNqHYc7IgWrD9/a/RS7ZS6pzuun2zb8RFPXvnvD
   A==;
X-CSE-ConnectionGUID: HhyHmQ63Qky39H34buRoNw==
X-CSE-MsgGUID: Q3lR1DlZRmuWt+45aS9c5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="63544095"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="63544095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 09:03:32 -0700
X-CSE-ConnectionGUID: 4eUdHy5fQeaXQEvG2zYZMg==
X-CSE-MsgGUID: Zd/F4p1TReak/lE9S9i/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134424603"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Apr 2025 09:03:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3dKL-000Buh-0H;
	Sat, 12 Apr 2025 16:03:29 +0000
Date: Sun, 13 Apr 2025 00:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 6/6] drivers/misc/lkdtm/perms.c:89:1:
 warning: parameter names (without types) in function declaration
Message-ID: <202504122325.qYyZD24S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e
commit: c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e [6/6] objtool: Validate kCFI calls
config: sparc-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504122325.qYyZD24S-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504122325.qYyZD24S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504122325.qYyZD24S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/lkdtm/perms.c:89:1: warning: data definition has no type or storage class
      89 | ANNOTATE_NOCFI_SYM(execute_location);
         | ^~~~~~~~~~~~~~~~~~
   drivers/misc/lkdtm/perms.c:89:1: error: type defaults to 'int' in declaration of 'ANNOTATE_NOCFI_SYM' [-Werror=implicit-int]
>> drivers/misc/lkdtm/perms.c:89:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


vim +89 drivers/misc/lkdtm/perms.c

    70	
    71	static noinline __nocfi void execute_location(void *dst, bool write)
    72	{
    73		void (*func)(void);
    74		func_desc_t fdesc;
    75	
    76		pr_info("attempting ok execution at %px\n", do_nothing_ptr);
    77		do_nothing();
    78	
    79		if (write == CODE_WRITE) {
    80			memcpy(dst, do_nothing_ptr, EXEC_SIZE);
    81			flush_icache_range((unsigned long)dst,
    82					   (unsigned long)dst + EXEC_SIZE);
    83		}
    84		pr_info("attempting bad execution at %px\n", dst);
    85		func = setup_function_descriptor(&fdesc, dst);
    86		func();
    87		pr_err("FAIL: func returned\n");
    88	}
  > 89	ANNOTATE_NOCFI_SYM(execute_location);
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
