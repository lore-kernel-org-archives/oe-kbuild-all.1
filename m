Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81923EC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 00:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711673071; cv=none; b=Ktsdvs2iPGZ5fUzxkaoTgNsE+KJJoA+unzjkL8aqY6ZyoX0syTx2rHchnyeDFrL2Z7MSE7oqjCMWf5Ol/vhgHGalUIadkQAD6hecwUOj5vcSus4Oz7Gw3SxVFh0TtgNF49JyCXAc6pDZiRJ5MgnLwZaxueEeIOJu0tx1Qx9Z4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711673071; c=relaxed/simple;
	bh=u6KUtXTD91EmW2D2AJwqmNoX4eRrqQSbi5wf+WK/2gs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnWIAYPSGK1VQM/GfH5J/4BWZBKItx7Z82+onYkGWveAyyqrDAxyIK/m73J361QSHWYtdPei+4viCPJbFPXBaF8HDZX6P10Usa6RFMDANOMew4V2kYIU+pkz3rWDUqN8mW4Sg/5CP1Ey9n6lHIgPi7ZY10x1jF7JF4SR9412I4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfYAEzrr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfYAEzrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711673068; x=1743209068;
  h=date:from:cc:subject:message-id:mime-version;
  bh=u6KUtXTD91EmW2D2AJwqmNoX4eRrqQSbi5wf+WK/2gs=;
  b=YfYAEzrrxdE53h43LXv6BbTp/Iv1kL2A/X8Jdt53+HDov2C4JK5ofsn/
   Ph4XT6iVC25mlkRPPnz9AvKgEHSufLaU6hb7H6cW+Bj/IW4z5DujO6iUS
   u0/cTnE791nBqfd0TqcOx2a/Xsd91WMXNBIInf/xcaFfZ7BgsxKTZUt9/
   xl2jyeqjsDyZ1FD1MPm3X+u4EpwMGAeHS52wS5iBINwJegZJ34DoXphK5
   lOnAl1i6MpA0T/VK/LYbuGtO7tgS0lfsmWKCsnha+wsIHIO/7nBP9SoFy
   5arNNKY2Fu6LQUeGk+uFL264x0viqkDgqUZ+FCL0s0JIRTLEXDBque76w
   A==;
X-CSE-ConnectionGUID: hfrIMX33ST+ZJpSuO9abTQ==
X-CSE-MsgGUID: Hw4HjQLoSbqb2ZIdR4XUKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24354555"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="24354555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 17:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16861172"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2024 17:44:27 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq0M5-0002eU-10;
	Fri, 29 Mar 2024 00:44:25 +0000
Date: Fri, 29 Mar 2024 08:44:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.1.y 4/20] mm/mmap.c:1945:12: error: invalid
 type argument of '->' (have 'struct ma_state')
Message-ID: <202403290805.9efnF0gQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liam,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common ti-android-linux-6.1.y
head:   bbf722b1059a245fffdd90e1e763281a6d205dd3
commit: b802573f44901bf91ed597caf63b5e55ac162500 [4/20] FROMLIST: BACKPORT: mm: Set up vma iterator for vma_iter_prealloc() calls
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240329/202403290805.9efnF0gQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290805.9efnF0gQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290805.9efnF0gQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mmap.c: In function 'expand_upwards':
>> mm/mmap.c:1945:12: error: invalid type argument of '->' (have 'struct ma_state')
    1945 |         mas->last = address - 1;
         |            ^~


vim +1945 mm/mmap.c

  1908	
  1909	#if defined(CONFIG_STACK_GROWSUP) || defined(CONFIG_IA64)
  1910	/*
  1911	 * PA-RISC uses this for its stack; IA64 for its Register Backing Store.
  1912	 * vma is the last one with address > vma->vm_end.  Have to extend vma.
  1913	 */
  1914	int expand_upwards(struct vm_area_struct *vma, unsigned long address)
  1915	{
  1916		struct mm_struct *mm = vma->vm_mm;
  1917		struct vm_area_struct *next;
  1918		unsigned long gap_addr;
  1919		int error = 0;
  1920		MA_STATE(mas, &mm->mm_mt, vma->vm_start, address - 1);
  1921	
  1922		if (!(vma->vm_flags & VM_GROWSUP))
  1923			return -EFAULT;
  1924	
  1925		/* Guard against exceeding limits of the address space. */
  1926		address &= PAGE_MASK;
  1927		if (address >= (TASK_SIZE & PAGE_MASK))
  1928			return -ENOMEM;
  1929		address += PAGE_SIZE;
  1930	
  1931		/* Enforce stack_guard_gap */
  1932		gap_addr = address + stack_guard_gap;
  1933	
  1934		/* Guard against overflow */
  1935		if (gap_addr < address || gap_addr > TASK_SIZE)
  1936			gap_addr = TASK_SIZE;
  1937	
  1938		next = find_vma_intersection(mm, vma->vm_end, gap_addr);
  1939		if (next && vma_is_accessible(next)) {
  1940			if (!(next->vm_flags & VM_GROWSUP))
  1941				return -ENOMEM;
  1942			/* Check that both stack segments have the same anon_vma? */
  1943		}
  1944	
> 1945		mas->last = address - 1;
  1946		if (mas_preallocate(&mas, vma, GFP_KERNEL))
  1947			return -ENOMEM;
  1948	
  1949		/* We must make sure the anon_vma is allocated. */
  1950		if (unlikely(anon_vma_prepare(vma))) {
  1951			mas_destroy(&mas);
  1952			return -ENOMEM;
  1953		}
  1954	
  1955		/*
  1956		 * vma->vm_start/vm_end cannot change under us because the caller
  1957		 * is required to hold the mmap_lock in read mode.  We need the
  1958		 * anon_vma lock to serialize against concurrent expand_stacks.
  1959		 */
  1960		anon_vma_lock_write(vma->anon_vma);
  1961	
  1962		/* Somebody else might have raced and expanded it already */
  1963		if (address > vma->vm_end) {
  1964			unsigned long size, grow;
  1965	
  1966			size = address - vma->vm_start;
  1967			grow = (address - vma->vm_end) >> PAGE_SHIFT;
  1968	
  1969			error = -ENOMEM;
  1970			if (vma->vm_pgoff + (size >> PAGE_SHIFT) >= vma->vm_pgoff) {
  1971				error = acct_stack_growth(vma, size, grow);
  1972				if (!error) {
  1973					/*
  1974					 * We only hold a shared mmap_lock lock here, so
  1975					 * we need to protect against concurrent vma
  1976					 * expansions.  anon_vma_lock_write() doesn't
  1977					 * help here, as we don't guarantee that all
  1978					 * growable vmas in a mm share the same root
  1979					 * anon vma.  So, we reuse mm->page_table_lock
  1980					 * to guard against concurrent vma expansions.
  1981					 */
  1982					spin_lock(&mm->page_table_lock);
  1983					if (vma->vm_flags & VM_LOCKED)
  1984						mm->locked_vm += grow;
  1985					vm_stat_account(mm, vma->vm_flags, grow);
  1986					anon_vma_interval_tree_pre_update_vma(vma);
  1987					vma->vm_end = address;
  1988					/* Overwrite old entry in mtree. */
  1989					vma_mas_store(vma, &mas);
  1990					anon_vma_interval_tree_post_update_vma(vma);
  1991					spin_unlock(&mm->page_table_lock);
  1992	
  1993					perf_event_mmap(vma);
  1994				}
  1995			}
  1996		}
  1997		anon_vma_unlock_write(vma->anon_vma);
  1998		khugepaged_enter_vma(vma, vma->vm_flags);
  1999		mas_destroy(&mas);
  2000		return error;
  2001	}
  2002	#endif /* CONFIG_STACK_GROWSUP || CONFIG_IA64 */
  2003	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
