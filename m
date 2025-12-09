Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6751C84D7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 04:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765253401; cv=none; b=PfUXkOk2JJIBPYQRhp/AA2lBy9ystGFEMuEjdv4i9a5Y1ltpzchtdJS4OTHjfwrjPWPCIuY+AKJRZYt01+cnCX/FM1BQygAnYLjzzfDJgFSLea1HCW7Xf/5iyx/NMH+7nPJxa7pxkLCSWfpCEJjWecg6WOPPCYYDgQrn+RaT7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765253401; c=relaxed/simple;
	bh=BkHAWguDCMvmIKduOa/OdDfR2Pl95uuqqX7pZbQsV9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hGpvzqGR681lxLFMNnYbjEmcznoGT0xwbwqx91pBegczN7Q8WeaolNOLL87BDFbvn0ppobvWVqtKwf1yZvJue1WmdUKV/cPlfecjesul4FuoSw0Kd1YQwJ6zE/nqhEpWk6/MKOSJ5DMWD5JuK9qA59wyv51Xdl1a3jD/vydI2EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHl7FY+S; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHl7FY+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765253398; x=1796789398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BkHAWguDCMvmIKduOa/OdDfR2Pl95uuqqX7pZbQsV9U=;
  b=iHl7FY+SX2zr17J5H2BiJ1bNfPV0wnVRJed5nwNXMc0x8qics0QbTFRt
   iLfIQXs/37/9zTJQgkhLQJPvzG5p0AiztS4BaJvIzGR5uWZkqPxlMfA8y
   Byq5f8O1krADbVbjOzAQoVtOyhHlltS4hTSUWwjrKtIhr63+gJgMvxPxN
   zU8Ex20Z3auB7XyNxpsGrMnUoX64vnFAf2UviXvdaHSk9W+4gghq+Zru8
   7hix6KSeQBo/1+z01LgNtELDGDKthrBi73mzNQFi2asYLQDFgkjOZu4kz
   5wV2uBShI4Q11fBw5d3c9A2+DtXzWS55ZLjQtBmwE1zcfkr2Wk4qhdeS9
   Q==;
X-CSE-ConnectionGUID: ylkIMKUVQM+S3QZiOySHSA==
X-CSE-MsgGUID: LMKWNfFvSd22KhDNGxQ8qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84613775"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="84613775"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 20:09:58 -0800
X-CSE-ConnectionGUID: M8MJL5paQjGMyP8tq3Kjig==
X-CSE-MsgGUID: Rwc4m2huSci+JWBg5KvYvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="195726290"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2025 20:09:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSp2w-0000000002j-3vJo;
	Tue, 09 Dec 2025 04:09:54 +0000
Date: Tue, 9 Dec 2025 05:09:17 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Qi Xi <xiqi2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3386/3386] fs/proc/task_mmu.c:192:23: warning:
 variable 'last_vma_start' set but not used
Message-ID: <202512090552.wjNONK6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   69d9543977fd7abe8b555406c7a3e5d64d8292f8
commit: 094a76ab06c367065280f8760d2100db0c8a0b6a [3386/3386] mm: proc: use per_vma mmap_lock for vma traversal.
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251209/202512090552.wjNONK6W-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090552.wjNONK6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090552.wjNONK6W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'numa_maps_next':
>> fs/proc/task_mmu.c:192:23: warning: variable 'last_vma_start' set but not used [-Wunused-but-set-variable]
     192 |         unsigned long last_vma_start;
         |                       ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/last_vma_start +192 fs/proc/task_mmu.c

   184	
   185	static void *numa_maps_next(struct seq_file *m, void *v, loff_t *ppos)
   186	{
   187		struct proc_maps_private *priv = m->private;
   188		struct vm_area_struct *next = NULL;
   189		struct vm_area_struct *vma = v;
   190		struct mm_struct *mm = priv->mm;
   191		unsigned long last_vma_end;
 > 192		unsigned long last_vma_start;
   193		int ret;
   194	
   195		if (!mm)
   196			goto out;
   197	
   198		if (vma == priv->tail_vma)
   199			goto out;
   200	
   201		if (vma->vm_next)
   202			next = vma->vm_next;
   203		else
   204			next = priv->tail_vma;
   205	
   206		last_vma_end = vma->vm_end;
   207		last_vma_start = vma->vm_start;
   208		if (mmap_lock_is_contended(mm)) {
   209			mmap_read_unlock(mm);
   210			ret = mmap_read_lock_killable(mm);
   211			if (ret) {
   212				mmput(mm);
   213				put_task_struct(priv->task);
   214				priv->task = NULL;
   215				return ERR_PTR(ret);
   216			}
   217	
   218			/*
   219			 * After dropping the lock, there are four cases to
   220			 * consider. See the following example for explanation.
   221			 *
   222			 *   +------+------+-----------+
   223			 *   | VMA1 | VMA2 | VMA3      |
   224			 *   +------+------+-----------+
   225			 *   |      |      |           |
   226			 *  4k     8k     16k         400k
   227			 *
   228			 * Suppose we drop the lock after reading VMA2 due to
   229			 * contention, then we get:
   230			 *
   231			 *	last_vma_end = 16k
   232			 *
   233			 * 1) VMA2 is freed, but VMA3 exists:
   234			 *
   235			 *    find_vma(mm, 16k - 1) will return VMA3.
   236			 *    In this case, just continue from VMA3.
   237			 *
   238			 * 2) VMA2 still exists:
   239			 *
   240			 *    find_vma(mm, 16k - 1) will return VMA2.
   241			 *    Iterate the loop like the original one.
   242			 *
   243			 * 3) No more VMAs can be found:
   244			 *
   245			 *    find_vma(mm, 16k - 1) will return NULL.
   246			 *    No more things to do, just break.
   247			 *
   248			 * 4) (last_vma_end - 1) is the middle of a vma (VMA'):
   249			 *
   250			 *    find_vma(mm, 16k - 1) will return VMA' whose range
   251			 *    contains last_vma_end.
   252			 *    Iterate VMA' from last_vma_end.
   253			 */
   254			next = find_vma(mm, last_vma_end - 1);
   255	
   256			/* Case 3 above */
   257			if (!next)
   258				goto out;
   259	
   260			/* Case 1 above */
   261			if (next->vm_start >= last_vma_end)
   262				goto out;
   263	
   264			/* Case 4 above */
   265			if (next->vm_end > last_vma_end) {
   266				*ppos = last_vma_end;
   267				return next;
   268			}
   269	
   270			/* Case 2 above */
   271			if (next->vm_next)
   272				next = next->vm_next;
   273			else
   274				next = priv->tail_vma;
   275		}
   276	out:
   277		*ppos = next ? next->vm_start : -1UL;
   278		return next;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
