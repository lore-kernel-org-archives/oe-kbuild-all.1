Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD8A1E1AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691677333; x=1723213333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/XwvTdBTr2sv28MoDf10Nxf9gkXbgsZnCMBlPPm29hc=;
  b=ZGso8eDWICB5FnJjK2fIXfPVmCaT00+hq08IEUxWIpncXJTKzNtUS/TS
   hIWIE162/iGs8PdNHD/8MYTPQ4dce3NpUIuuW/mMrVuOWUp5odavIT+kA
   rhaWQlmMoi3oD8+iHjGdDJczcT3O+YcdG/Ls5eDKPmygsVSeG4NsixqUO
   n53gF9UuJ1JHh1YElXR0sKnWbf2ekTz9gj5z2UlaDrIvXX420Ueju0/hn
   SsmuiOAawOQ0iIX4WpivfIUJJK07zwAkZzBQzPtRdpbQGUv8/ysLKs8EX
   KdGGU3woXMV5naKRhv1+u3dgKtsTehDi+wct+Za3sk+12/8TThqWREIt+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351012518"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="351012518"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 06:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="735432071"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="735432071"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Aug 2023 06:56:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU694-00072q-30;
	Thu, 10 Aug 2023 13:56:10 +0000
Date: Thu, 10 Aug 2023 21:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/5] mm/autonuma: call .numa_protect() when page
 is protected for NUMA migrate
Message-ID: <202308102157.wk3FSpe2-lkp@intel.com>
References: <20230810090048.26184-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810090048.26184-1-yan.y.zhao@intel.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on mst-vhost/linux-next linus/master]
[cannot apply to akpm-mm/mm-everything kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhao/mm-mmu_notifier-introduce-a-new-mmu-notifier-flag-MMU_NOTIFIER_RANGE_NUMA/20230810-172955
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230810090048.26184-1-yan.y.zhao%40intel.com
patch subject: [RFC PATCH v2 4/5] mm/autonuma: call .numa_protect() when page is protected for NUMA migrate
config: x86_64-buildonly-randconfig-r003-20230809 (https://download.01.org/0day-ci/archive/20230810/202308102157.wk3FSpe2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308102157.wk3FSpe2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308102157.wk3FSpe2-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/huge_memory.c: In function 'change_huge_pmd':
>> mm/huge_memory.c:1895:17: error: implicit declaration of function 'mmu_notifier_numa_protect' [-Werror=implicit-function-declaration]
    1895 |                 mmu_notifier_numa_protect(vma->vm_mm, addr, addr + PMD_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mmu_notifier_numa_protect +1895 mm/huge_memory.c

  1862	
  1863		if (prot_numa) {
  1864			struct page *page;
  1865			bool toptier;
  1866			/*
  1867			 * Avoid trapping faults against the zero page. The read-only
  1868			 * data is likely to be read-cached on the local CPU and
  1869			 * local/remote hits to the zero page are not interesting.
  1870			 */
  1871			if (is_huge_zero_pmd(*pmd))
  1872				goto unlock;
  1873	
  1874			if (pmd_protnone(*pmd))
  1875				goto unlock;
  1876	
  1877			page = pmd_page(*pmd);
  1878	
  1879			if (PageAnon(page) && PageAnonExclusive(page) &&
  1880			    page_maybe_dma_pinned(page))
  1881				goto unlock;
  1882	
  1883			toptier = node_is_toptier(page_to_nid(page));
  1884			/*
  1885			 * Skip scanning top tier node if normal numa
  1886			 * balancing is disabled
  1887			 */
  1888			if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
  1889			    toptier)
  1890				goto unlock;
  1891	
  1892			if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING &&
  1893			    !toptier)
  1894				xchg_page_access_time(page, jiffies_to_msecs(jiffies));
> 1895			mmu_notifier_numa_protect(vma->vm_mm, addr, addr + PMD_SIZE);
  1896		}
  1897		/*
  1898		 * In case prot_numa, we are under mmap_read_lock(mm). It's critical
  1899		 * to not clear pmd intermittently to avoid race with MADV_DONTNEED
  1900		 * which is also under mmap_read_lock(mm):
  1901		 *
  1902		 *	CPU0:				CPU1:
  1903		 *				change_huge_pmd(prot_numa=1)
  1904		 *				 pmdp_huge_get_and_clear_notify()
  1905		 * madvise_dontneed()
  1906		 *  zap_pmd_range()
  1907		 *   pmd_trans_huge(*pmd) == 0 (without ptl)
  1908		 *   // skip the pmd
  1909		 *				 set_pmd_at();
  1910		 *				 // pmd is re-established
  1911		 *
  1912		 * The race makes MADV_DONTNEED miss the huge pmd and don't clear it
  1913		 * which may break userspace.
  1914		 *
  1915		 * pmdp_invalidate_ad() is required to make sure we don't miss
  1916		 * dirty/young flags set by hardware.
  1917		 */
  1918		oldpmd = pmdp_invalidate_ad(vma, addr, pmd);
  1919	
  1920		entry = pmd_modify(oldpmd, newprot);
  1921		if (uffd_wp)
  1922			entry = pmd_mkuffd_wp(entry);
  1923		else if (uffd_wp_resolve)
  1924			/*
  1925			 * Leave the write bit to be handled by PF interrupt
  1926			 * handler, then things like COW could be properly
  1927			 * handled.
  1928			 */
  1929			entry = pmd_clear_uffd_wp(entry);
  1930	
  1931		/* See change_pte_range(). */
  1932		if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) && !pmd_write(entry) &&
  1933		    can_change_pmd_writable(vma, addr, entry))
  1934			entry = pmd_mkwrite(entry);
  1935	
  1936		ret = HPAGE_PMD_NR;
  1937		set_pmd_at(mm, addr, pmd, entry);
  1938	
  1939		if (huge_pmd_needs_flush(oldpmd, entry))
  1940			tlb_flush_pmd_range(tlb, addr, HPAGE_PMD_SIZE);
  1941	unlock:
  1942		spin_unlock(ptl);
  1943		return ret;
  1944	}
  1945	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
