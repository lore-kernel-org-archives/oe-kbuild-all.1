Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE9D2BEC25
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755116707; cv=none; b=jFDJ9pxrRcXIg7Qc3tSD/RqXNloT/NV+KAKhXsu/UFXUfFlk7rpjVTvIJEZqq0ZWR8cxHvsOeWrQnY9vsfEbXSsN/OV5bCs12WsHYhvUoltJQyTjdBJu5Ka+y006qMtDwD3bqPoparU2lQuxxU2wvDJ5sqwaB4xFgvzoraK6qUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755116707; c=relaxed/simple;
	bh=uaQZK2yQbNz04MEG6k3vMZdck0Z//tEbPAiEiXehSTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gns4P4VJ1rYnoPuB32n3hEsFM0/o3iMssJBjMdNep+5+5Rdbn/zwMyqx/GZVLhF5vQGPUdx398W4Z9lC5aTtTVoiv4ZxC+SxL+XeHLQdEbjC5S1T9gO+25ts7VYngcxiPWwOCdq+O4LrVABcz9oustaElkg/41brX132av0oQYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktrDWVTZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktrDWVTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755116706; x=1786652706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaQZK2yQbNz04MEG6k3vMZdck0Z//tEbPAiEiXehSTk=;
  b=ktrDWVTZLM5LT8F945dQrseTlgMvFZodtLOUBcIECrek2IW5GuLJYJiU
   YAblFKCy0dv8lMQGcg3meyW9g52E0BcAgj+GdbZbsBeQ8PSOMoN0U/Xf3
   5Gpriab4d+CbBjPqG5eyteXda55xKXZYrBZPWSitEZ+jqg6GLQ2Ydy0gy
   P+luOnKMN0lQ7xQ1CzMNI2riab8PPF/DawclZFj/rjbA52UMSvoOZUQlz
   d5DgSPRxVu1Juge6bt3tLjK7FXosyFcCZjY92S1ULccftWbBo7ssE/JU2
   PlXi6BSXnJCgihLpnsYse+lf8OALKAFrC6G95hRr08kA4wke2nUXye8jH
   Q==;
X-CSE-ConnectionGUID: GbK7aqPyTIOsOqJ1KEnQaA==
X-CSE-MsgGUID: dlRLNX6mRYqa6fURd0oXOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61045145"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="61045145"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 13:25:04 -0700
X-CSE-ConnectionGUID: kgL/HRhAQJG4obdlILW4yw==
X-CSE-MsgGUID: +9M4itFRQZG3ROsTOneKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166942872"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2025 13:25:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umI1r-000AIO-1b;
	Wed, 13 Aug 2025 20:24:59 +0000
Date: Thu, 14 Aug 2025 04:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Jesse Taube <jesse@rivosinc.com>
Subject: [avpatel:riscv_trace_support_v1 35/59]
 arch/riscv/kernel/hw_breakpoint.c:517:22: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202508140405.44qvUXfc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   a186d4c58325610367072323cfc9a7d5cccc2fb9
commit: df85c5a81bf62ede57ad6bdfa14482907dee11cf [35/59] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r112-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140405.44qvUXfc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250814/202508140405.44qvUXfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140405.44qvUXfc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/hw_breakpoint.c:517:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:517:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:517:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:518:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:518:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:518:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:519:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:519:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:519:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:530:15: sparse: sparse: cast to restricted __le32

vim +517 arch/riscv/kernel/hw_breakpoint.c

   499	
   500	/* atomic: counter->ctx->lock is held */
   501	int arch_install_hw_breakpoint(struct perf_event *event)
   502	{
   503		struct arch_hw_breakpoint *bp = counter_arch_bp(event);
   504		union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(&sbi_dbtr_shmem);
   505		struct sbi_dbtr_data_msg *xmit;
   506		struct sbi_dbtr_id_msg *recv;
   507		struct perf_event **slot;
   508		unsigned long idx;
   509		struct sbiret ret;
   510		int err = 0;
   511	
   512		raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
   513				      *this_cpu_ptr(&ecall_lock_flags));
   514	
   515		xmit = &shmem->data;
   516		recv = &shmem->id;
 > 517		xmit->tdata1 = cpu_to_le(bp->tdata1);
 > 518		xmit->tdata2 = cpu_to_le(bp->tdata2);
 > 519		xmit->tdata3 = cpu_to_le(bp->tdata3);
   520	
   521		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
   522				1, 0, 0, 0, 0, 0);
   523	
   524		if (ret.error) {
   525			pr_warn("%s: failed to install trigger. error: %ld\n", __func__, ret.error);
   526			err = sbi_err_map_linux_errno(ret.error);
   527			goto done;
   528		}
   529	
 > 530		idx = le_to_cpu(recv->idx);
   531		if (idx >= dbtr_total_num) {
   532			pr_warn("%s: invalid trigger index %lu\n", __func__, idx);
   533			err = -EINVAL;
   534			goto done;
   535		}
   536	
   537		slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
   538		if (*slot) {
   539			pr_warn("%s: slot %lu is in use\n", __func__, idx);
   540			err = -EBUSY;
   541			goto done;
   542		}
   543	
   544		pr_debug("Trigger 0x%lx installed at index 0x%lx\n", bp->tdata2, idx);
   545	
   546		/* Save the event - to be looked up in handler */
   547		*slot = event;
   548	
   549	done:
   550		raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
   551					   *this_cpu_ptr(&ecall_lock_flags));
   552		return err;
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
