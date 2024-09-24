Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B01A76A6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727190448; cv=none; b=YuWcuKgTGgE5I5aAOW+7MP7kV0K8FeTy67Xxz9ADFdNT2apMpmOx/izbjMHEWafIlD+xEF+PzZyw5jnUMFd69ZHFhjySvs19XpuWAbRCu9nsdxmbD9ZEeztJvwF1co4Dz5qCK+sU7nWIEuFE7jk2VSXpp6nUQKU0yvIlaI2yu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727190448; c=relaxed/simple;
	bh=kATl7V87QdChzLtPnK/t+I6IE7XjFqPl1Kc31zJmz00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KX7aHBSBAvpgMKxRkbSt+EdU+WCHyRmZ8LxoS0mvb9QDwMVWO5w2epG3RbPJYoxB1PPMb6RhubLMe0oAkelQWogexz9zw6Cpo2iIBzxZ6/DLGkx/dNXMrVD7fKyiBcnG/DBpr/yHc5g19Ni+HjvMrREb+J7GBgAqXcqQjn16zRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpnliHT3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpnliHT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727190447; x=1758726447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kATl7V87QdChzLtPnK/t+I6IE7XjFqPl1Kc31zJmz00=;
  b=EpnliHT364TdvoNrbogiGsmxT+rKloAIT7dKNyE/b82MMAsNdhTCcyoj
   3nnQqasMXOJVuJ8H0x8HhGULJqfU8m4fFMz4a8YuE+cnn76XqZA6fat3t
   /JN0hR4pJ8cR090zRADsI8uNz6+YZP2W56AX4u8GecTUNr7kYHUcqctrr
   7yFpQfeJhocBCjDpua8Fmo/eUQyOemxySaz7RH1je+IbFJTb21HLZsIPK
   PTGfV4RF/LXs/C2IgplDPuo9Qr+anBquUySOGiyppJpQHo4W3CEjz0q7k
   b1GW0SQixeoXHvYLsRydmAS1DbyHwSMPSgVARPSXTwsJDgfxjSbonKwM1
   A==;
X-CSE-ConnectionGUID: jmAdDYI/Q8OCs0zY7RHnVA==
X-CSE-MsgGUID: A6FXKWn4QKKwC33yBYREdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43661851"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="43661851"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 08:07:26 -0700
X-CSE-ConnectionGUID: mhRNl/lxSS+vyBW2tEu4Gg==
X-CSE-MsgGUID: V6E1uOI1TYyxIn2QbN59aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="71741772"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2024 08:07:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st78L-000ITW-07;
	Tue, 24 Sep 2024 15:07:21 +0000
Date: Tue, 24 Sep 2024 23:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: "qiwu.chen" <qiwuchen55@gmail.com>, corbet@lwn.net, oleg@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, paulmck@kernel.org,
	akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, "qiwu.chen" <qiwu.chen@transsion.com>
Subject: Re: [PATCH v4 1/2] panic: add option to dump task maps info in
 panic_print
Message-ID: <202409242252.cefLq5jM-lkp@intel.com>
References: <20240924074341.37272-1-qiwu.chen@transsion.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924074341.37272-1-qiwu.chen@transsion.com>

Hi qiwu.chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on brauner-vfs/vfs.all akpm-mm/mm-everything linus/master v6.11 next-20240924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/qiwu-chen/arm64-show-signal-info-for-global-init/20240924-154508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240924074341.37272-1-qiwu.chen%40transsion.com
patch subject: [PATCH v4 1/2] panic: add option to dump task maps info in panic_print
config: arm-stm32_defconfig (https://download.01.org/0day-ci/archive/20240924/202409242252.cefLq5jM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409242252.cefLq5jM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409242252.cefLq5jM-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/panic.c: In function 'dump_task_maps_info':
>> kernel/panic.c:235:17: error: implicit declaration of function 'get_vma_name'; did you mean 'arch_vma_name'? [-Wimplicit-function-declaration]
     235 |                 get_vma_name(vma, &path, &name, &name_fmt);
         |                 ^~~~~~~~~~~~
         |                 arch_vma_name


vim +235 kernel/panic.c

   210	
   211	/*
   212	 * This function is called in panic proccess if the PANIC_PRINT_TASK_MAPS_INFO
   213	 * flag is specified in panic_print, which is helpful to debug panic issues due
   214	 * to an unhandled falut in user mode such as kill init.
   215	 */
   216	static void dump_task_maps_info(struct task_struct *tsk)
   217	{
   218		struct pt_regs *user_ret = task_pt_regs(tsk);
   219		struct mm_struct *mm = tsk->mm;
   220		struct vm_area_struct *vma;
   221	
   222		if (!mm || !user_mode(user_ret))
   223			return;
   224	
   225		pr_info("Dump task %s:%d maps start\n", tsk->comm, task_pid_nr(tsk));
   226		mmap_read_lock(mm);
   227		VMA_ITERATOR(vmi, mm, 0);
   228		for_each_vma(vmi, vma) {
   229			int flags = vma->vm_flags;
   230			unsigned long long pgoff = ((loff_t)vma->vm_pgoff) << PAGE_SHIFT;
   231			const struct path *path;
   232			const char *name_fmt, *name;
   233			char name_buf[SZ_256];
   234	
 > 235			get_vma_name(vma, &path, &name, &name_fmt);
   236			if (path) {
   237				name = d_path(path, name_buf, sizeof(name_buf));
   238				name = IS_ERR(name) ? "?" : name;
   239			} else if (name || name_fmt) {
   240				snprintf(name_buf, sizeof(name_buf), name_fmt ?: "%s", name);
   241				name = name_buf;
   242			}
   243	
   244			if (name)
   245				pr_info("%08lx-%08lx %c%c%c%c %08llx %s\n",
   246					vma->vm_start, vma->vm_end,
   247					flags & VM_READ ? 'r' : '-',
   248					flags & VM_WRITE ? 'w' : '-',
   249					flags & VM_EXEC ? 'x' : '-',
   250					flags & VM_MAYSHARE ? 's' : 'p',
   251					pgoff, name);
   252	
   253		}
   254		mmap_read_unlock(mm);
   255		pr_info("Dump task %s:%d maps end\n", tsk->comm, task_pid_nr(tsk));
   256	}
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
