Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7639C5380E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTG85wZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702327058; x=1733863058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZTAKJGVnPGxY+DYxogu1KWKjFB9K64MFQUwrzFsFTA=;
  b=dTG85wZR3aHSi9G/x+y93wGANod7R7TP2a0Ut2niCUCeDm2WMWk01BiO
   PKXG8Twr74y9Bc691DzOqAzk4Fn8HJHEpjoYDxTKc+VjkDV1lwEd72rm4
   NO8OmLkojsKI5QjvJrJhnkBhs7GDw9z6jJ0vCU/FhGdPt0ToQC5jDYVuD
   kB4JUt4HjkLFaLzFFrsBpl7xuI1E0w+6z7ThjVH8izPaOc87ynNpap0WZ
   ToL6kyGGGTmbxVuG2sfONRVRS+1IM93C6wDaDw1p2tVnt8C9p5DMnumSW
   iWuT/KBsqk8c879cOJbBc0c9CVF0hVdDNCV9eLctfj5798TElIVvPXQhD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1576465"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1576465"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 12:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946469696"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="946469696"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 12:37:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCn1w-000ISg-2m;
	Mon, 11 Dec 2023 20:37:32 +0000
Date: Tue, 12 Dec 2023 04:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6231/6992] kernel/events/core.c:7477
 perf_virt_to_phys() warn: always true condition '(virt >= (0)) => (0-u64max
 >= 0)'
Message-ID: <202312120428.kUWabWlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bbd220ce4e29ed55ab079007cff0b550895258eb
commit: 8a651e8f1fca74c7c2b033d9a0ad5214ac5d46e4 [6231/6992] riscv: fix VMALLOC_START definition
config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231212/202312120428.kUWabWlC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120428.kUWabWlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120428.kUWabWlC-lkp@intel.com/

New smatch warnings:
kernel/events/core.c:7477 perf_virt_to_phys() warn: always true condition '(virt >= (0)) => (0-u64max >= 0)'
drivers/clk/ingenic/tcu.c:455 ingenic_tcu_probe() warn: 'tcu->clk' from clk_prepare_enable() not released on lines: 455.

Old smatch warnings:
arch/riscv/include/asm/atomic.h:225 arch_atomic64_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +7477 kernel/events/core.c

5622f295b53fb6 kernel/perf_counter.c Markus Metzger   2009-09-15  7466  
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7467  static u64 perf_virt_to_phys(u64 virt)
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7468  {
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7469  	u64 phys_addr = 0;
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7470  
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7471  	if (!virt)
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7472  		return 0;
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7473  
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7474  	if (virt >= TASK_SIZE) {
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7475  		/* If it's vmalloc()d memory, leave phys_addr as 0 */
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7476  		if (virt_addr_valid((void *)(uintptr_t)virt) &&
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28 @7477  		    !(virt >= VMALLOC_START && virt < VMALLOC_END))
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7478  			phys_addr = (u64)virt_to_phys((void *)(uintptr_t)virt);
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7479  	} else {
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7480  		/*
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7481  		 * Walking the pages tables for user address.
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7482  		 * Interrupts are disabled, so it prevents any tear down
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7483  		 * of the page tables.
dadbb612f6e50b kernel/events/core.c  Souptick Joarder 2020-06-07  7484  		 * Try IRQ-safe get_user_page_fast_only first.
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7485  		 * If failed, leave phys_addr as 0.
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7486  		 */
d3296fb372bf74 kernel/events/core.c  Jiri Olsa        2020-04-07  7487  		if (current->mm != NULL) {
4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7488  			struct page *p;
4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7489  
d3296fb372bf74 kernel/events/core.c  Jiri Olsa        2020-04-07  7490  			pagefault_disable();
4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7491  			if (get_user_page_fast_only(virt, 0, &p)) {
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7492  				phys_addr = page_to_phys(p) + virt % PAGE_SIZE;
4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7493  				put_page(p);
4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7494  			}
d3296fb372bf74 kernel/events/core.c  Jiri Olsa        2020-04-07  7495  			pagefault_enable();
d3296fb372bf74 kernel/events/core.c  Jiri Olsa        2020-04-07  7496  		}
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7497  	}
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7498  
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7499  	return phys_addr;
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7500  }
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7501  

:::::: The code at line 7477 was first introduced by commit
:::::: fc7ce9c74c3ad232b084d80148654f926d01ece7 perf/core, x86: Add PERF_SAMPLE_PHYS_ADDR

:::::: TO: Kan Liang <kan.liang@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
