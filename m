Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D745813AED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvcWaGJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698011235; x=1729547235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qHIq6wWi4K2kk9ZLeD339e5a068S+mXuKQvh4idg+8=;
  b=hvcWaGJ7Wa3ig9og6WVVpKefNmqdKNCyBanDzdpFlBRj/VGN66xN/ks5
   t/8ERX07/WFU31f0kqmjg51oZa4bqk2XqE7/9l+VA/OiD6h1sB1AwbVie
   hXtLLuzAX+oilL903fchuAq5D+58IiXObU+NN/vUYjnVfy4Qmhk3yRldl
   dlvTytjtxIIENpnJ/JQMa6BNqT+TtmV2vzC28aDibOrliwKkSs0ygSN2v
   aszPEQTStIMzNZYV3n4bkdNymYg3nQRl+HF2G2cex7jArAo3kZxGN8DoZ
   Tmb2zgbiArC6M4/AR67mNG+MfZnhJcQYN6Q9yC/Lc8zHa7uvbKAPd5sEq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="386554066"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="386554066"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 14:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="828240347"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="828240347"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Oct 2023 14:47:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qugHs-0006Hd-2e;
	Sun, 22 Oct 2023 21:47:08 +0000
Date: Mon, 23 Oct 2023 05:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 9/13] arch/x86/coco/tdx/tdx.c:849:6: warning:
 no previous declaration for 'tdx_kexec_unshare_mem'
Message-ID: <202310230512.S8GbbOVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   729fd572632d0e3131933616fe258939bcec3430
commit: ed3056edd9f31041e7fafa0c00ba51e313a58cc6 [9/13] x86/tdx: Convert shared memory back to private on kexec
config: x86_64-randconfig-075-20231022 (https://download.01.org/0day-ci/archive/20231023/202310230512.S8GbbOVE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310230512.S8GbbOVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230512.S8GbbOVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:849:6: warning: no previous declaration for 'tdx_kexec_unshare_mem' [-Wmissing-declarations]
    void tdx_kexec_unshare_mem(bool crash)
         ^~~~~~~~~~~~~~~~~~~~~


vim +/tdx_kexec_unshare_mem +849 arch/x86/coco/tdx/tdx.c

   848	
 > 849	void tdx_kexec_unshare_mem(bool crash)
   850	{
   851		unsigned long addr, end;
   852		long found = 0, shared;
   853	
   854		/* Stop new private<->shared conversions */
   855		conversion_allowed = false;
   856	
   857		/*
   858		 * Crash kernel reaches here with interrupts disabled: can't wait for
   859		 * conversions to finish.
   860		 *
   861		 * If race happened, just report and proceed.
   862		 */
   863		if (!crash) {
   864			unsigned long timeout;
   865	
   866			/*
   867			 * Wait for in-flight conversions to complete.
   868			 *
   869			 * Do not wait more than 30 seconds.
   870			 */
   871			timeout = 30 * USEC_PER_SEC;
   872			while (atomic_read(&conversions_in_progress) && timeout--)
   873				udelay(1);
   874		}
   875	
   876		if (atomic_read(&conversions_in_progress))
   877			pr_warn("Failed to finish shared<->private conversions\n");
   878	
   879		/*
   880		 * Walk direct mapping and convert all shared memory back to private,
   881		 */
   882	
   883		addr = PAGE_OFFSET;
   884		end  = PAGE_OFFSET + get_max_mapped();
   885	
   886		while (addr < end) {
   887			unsigned long size;
   888			unsigned int level;
   889			pte_t *pte;
   890	
   891			pte = lookup_address(addr, &level);
   892			size = page_level_size(level);
   893	
   894			if (pte && pte_decrypted(*pte)) {
   895				int pages = size / PAGE_SIZE;
   896	
   897				/*
   898				 * Touching memory with shared bit set triggers implicit
   899				 * conversion to shared.
   900				 *
   901				 * Make sure nobody touches the shared range from
   902				 * now on.
   903				 *
   904				 * Bypass unmapping for crash scenario. Unmapping
   905				 * requires sleepable context, but in crash case kernel
   906				 * hits the code path with interrupts disabled.
   907				 * It shouldn't be a problem as all secondary CPUs are
   908				 * down and kernel runs with interrupts disabled, so
   909				 * there is no room for race.
   910				 */
   911				if (!crash)
   912					set_memory_np(addr, pages);
   913	
   914				if (!tdx_enc_status_changed(addr, pages, true)) {
   915					pr_err("Failed to unshare range %#lx-%#lx\n",
   916					       addr, addr + size);
   917				}
   918	
   919				found += pages;
   920			}
   921	
   922			addr += size;
   923		}
   924	
   925		shared = atomic_long_read(&nr_shared);
   926		if (shared != found) {
   927			pr_err("shared page accounting is off\n");
   928			pr_err("nr_shared = %ld, nr_found = %ld\n", shared, found);
   929		}
   930	}
   931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
