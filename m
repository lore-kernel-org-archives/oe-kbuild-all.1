Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E26F53B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 13:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpZAsHAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697289396; x=1728825396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CNHIN3QnOEN31sg+2R43fipHAnxhGw8MWO3+i1foWiA=;
  b=XpZAsHAnh1XbtIjKr6IBnThBQ2av9200z9YICsgOy5jxzC2KA1tm+W/L
   20vwISlvfkdv5p7G65ToEKUQQCPwO9C2uCj3Wem7I2PL7/jkNqh28QIza
   nVhywbMv1wOyX6a5Qgqrf4752ZFXQD0tqZOfaLmhacFSihIGE1oXtFSbd
   /G7lh1yXjnp3Pp32jXkNzNG3sFoEuP9IaZClTAyMH1AlFxQApWi01nCAX
   5xg9xB+imZDK++aec59FR1CifcVc4OS8KC0GT+sw8P5eDrxAE82McbyY9
   9rmLJRVJW0aUO0+24KJLiSfNAa0TR/2+UYY5ANGV4QWjXu6InGl6f04+4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="382554350"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="382554350"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 06:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758799748"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758799748"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 06:14:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qreTJ-0006Bb-0B;
	Sat, 14 Oct 2023 13:14:25 +0000
Date: Sat, 14 Oct 2023 21:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext 8/20] arch/arm64/kernel/patching.c:106:9: error: implicit
 declaration of function 'ktext_replication_write'; did you mean
 'ktext_replication_init'?
Message-ID: <202310142120.VmDpiNiJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   7fa946ce05c273d5ff092c814efe64978e5faf45
commit: 6188e1f71bf3f1000eb5b404ec62c17cd336b23d [8/20] arm64: text replication: handle aarch64_insn_write_literal_u64()
config: arm64-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142120.VmDpiNiJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142120.VmDpiNiJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142120.VmDpiNiJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/patching.c: In function 'aarch64_insn_write_literal_u64':
>> arch/arm64/kernel/patching.c:106:9: error: implicit declaration of function 'ktext_replication_write'; did you mean 'ktext_replication_init'? [-Werror=implicit-function-declaration]
     106 |         ktext_replication_write(addr, &val, sizeof(val));
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         ktext_replication_init
   cc1: some warnings being treated as errors


vim +106 arch/arm64/kernel/patching.c

    91	
    92	noinstr int aarch64_insn_write_literal_u64(void *addr, u64 val)
    93	{
    94		u64 *waddr;
    95		unsigned long flags;
    96		int ret;
    97	
    98		raw_spin_lock_irqsave(&patch_lock, flags);
    99		waddr = patch_map(addr, FIX_TEXT_POKE0);
   100	
   101		ret = copy_to_kernel_nofault(waddr, &val, sizeof(val));
   102	
   103		patch_unmap(FIX_TEXT_POKE0);
   104		raw_spin_unlock_irqrestore(&patch_lock, flags);
   105	
 > 106		ktext_replication_write(addr, &val, sizeof(val));
   107	
   108		return ret;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
