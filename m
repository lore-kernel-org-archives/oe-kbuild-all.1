Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9461538A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693401953; x=1724937953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yFhRZUb/7+GfqKcb9MxGDGd6E4Ln1rLhsSPkn08AbQ=;
  b=fYnl7g4WdBaCkCE7RLaCHmuyumzXeHUCb5Vvy5jTiiYhx8XFjc/ksbj2
   +YjsVMf40dGyCKcKxCia2ERJvrnimx0zpf/Q3UGJ6pyz+rV6K/lsNUNEb
   MBrl3cz6xHrFo1d6x7qiBRWFI4aA6pVLmCfedLI1HuNkZPvPSUhM5XPym
   jef7r5kM4q/a6lrD6t0MNooftlMsL0a4/XNsyG/IJylChy6zYFIh5qfyE
   skujDt0ZknbB9PmsQ/PoDUOsUpBoCUbkW0xqSmjonzIHVchxAvWYXlRCg
   /Y6sixSGt/dlE/L7XSisiShfJV/JLkTDI8tuyatfoBdFBexiNxu2AHCoo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439585071"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="439585071"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 06:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="688910839"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="688910839"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2023 06:25:41 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbLCW-0009rX-35;
	Wed, 30 Aug 2023 13:25:40 +0000
Date: Wed, 30 Aug 2023 21:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/vmalloc-debug-fixes 1/2] mm/vmalloc.c:2696:26: warning:
 'try_to_find_vm_area' defined but not used
Message-ID: <202308302153.50O4hkFI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/vmalloc-debug-fixes
head:   2df62bec04fc85eecff117f78108c220c5f2a883
commit: a952ba57cebba3180e6be290c6e9eda74f46e6a2 [1/2] mm/vmalloc: Add a safer version of find_vm_area() for debug
config: arc-randconfig-001-20230830 (https://download.01.org/0day-ci/archive/20230830/202308302153.50O4hkFI-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308302153.50O4hkFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308302153.50O4hkFI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:2696:26: warning: 'try_to_find_vm_area' defined but not used [-Wunused-function]
    2696 | static struct vm_struct *try_to_find_vm_area(const void *addr)
         |                          ^~~~~~~~~~~~~~~~~~~


vim +/try_to_find_vm_area +2696 mm/vmalloc.c

  2685	
  2686	/**
  2687	 * try_to_find_vm_area - find a continuous kernel virtual area
  2688	 * @addr:	  base address
  2689	 *
  2690	 * This function is the same as find_vm_area() except that it is
  2691	 * safe to call if vmap_area_lock is already held and returns NULL
  2692	 * if it is. See comments in find_vmap_area() for other details.
  2693	 *
  2694	 * Return: the area descriptor on success or %NULL on failure.
  2695	 */
> 2696	static struct vm_struct *try_to_find_vm_area(const void *addr)
  2697	{
  2698		struct vmap_area *va;
  2699	
  2700		va = find_vmap_area_trylock((unsigned long)addr);
  2701		if (!va)
  2702			return NULL;
  2703	
  2704		return va->vm;
  2705	}
  2706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
