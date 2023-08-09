Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5718AE4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691597750; x=1723133750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+fKCTRGVPpI4zVaoVYlc8G7tt7g7r6KKV+qlCVyeyM=;
  b=nypvtwufLnv8a7z92scVTkV6WxWQeIWFY2VY7e+IU8Z/DBtu8alv5tN5
   JFk5vY+MFqGnewLSPAVyR3cVs+kMy0x5bVRCDC7u2Hs1tkVM2qwZb20xA
   ibvUK8eFaA6sNDGgCGnXPKaCoxjw2TWANJSAVaUn5exRHCkw0tWuXsl5q
   UlnhKjMkVf7X+0yP4dRZA71CWWgMA9f6JtpSRdyD9gYXnOTs3N3euz/+p
   17Cu7LQkUPM8mkVfUMPbSuHz85YBj00Dlpr7vtU+GMleACXVkJqSMZNXd
   2v21W29mYBKH57lOZVxg+kxH5Jyogj6r89/I4GnIbgwEqtt5zjKaFZwtm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="371155138"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="371155138"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 09:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="1062520487"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="1062520487"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 09:15:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTlqT-0006Ew-2E;
	Wed, 09 Aug 2023 16:15:37 +0000
Date: Thu, 10 Aug 2023 00:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.5-rc1 10/12]
 physaddr-debug.c:(.text+0x10e): multiple definition of `__phys_addr_symbol';
 arch/riscv/mm/physaddr.o:physaddr.c:(.text+0x1a): first defined here
Message-ID: <202308100011.xn33W7kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.5-rc1
head:   b6a25d37eca4850c246b94d73bd2e3c75860d265
commit: a3f18d6c511bc900bacc83834a84d3dc4807846a [10/12] riscv: Make virt_to_pfn() a real function
config: riscv-randconfig-r033-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100011.xn33W7kj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100011.xn33W7kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100011.xn33W7kj-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/mm/physaddr-debug.o: in function `__phys_addr_symbol':
>> physaddr-debug.c:(.text+0x10e): multiple definition of `__phys_addr_symbol'; arch/riscv/mm/physaddr.o:physaddr.c:(.text+0x1a): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
