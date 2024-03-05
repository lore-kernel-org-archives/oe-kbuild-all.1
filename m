Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75B517C72
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 01:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709603973; cv=none; b=Nxzh15dg1Xq/rtuJctqYcQbA2IsWrqXNs2EWeRylbNiv9jqYmO0l/zN6NqNYwYtudO9uJy30fW/jJYIjezfS1+ybVPs26MSplXOSrQ5VmHwOlA5eQXiaGeFbRaOwg/KKrNJfrsB5IOyMzpoXWBm5msB47IELLTR9Cb3281BjUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709603973; c=relaxed/simple;
	bh=/e4Yin1vIvDSShH7KSTRqRS8pxrMls9Ojhw6xGGDWyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=na37le/Pjo+cQ/qj8+vOIXiTKST8Yc+rQav4D/SS69I6eGaHR7X6ReZn1mnznDKyHWslv5QfhBiqzA2haFdLj9xwosBYYSjWAMDfPioqH+kCZO5AiNJsIUzEkWHaUjp9ULOtzsZgNru64mIWxIsaV/J23jSylrIYJQ4NjUV/SvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhvwiHen; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhvwiHen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709603972; x=1741139972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/e4Yin1vIvDSShH7KSTRqRS8pxrMls9Ojhw6xGGDWyM=;
  b=XhvwiHentyGScAcYL1N0PiMFjq1kRqUM3WAL7B7uVo1sgayDiR1P08f3
   qmLdFUVgnVMmTmakQr4rQLFzTZ9GaYNoFOdDX7kPKOLW6vAfZM7ofMcj+
   CH1PbHcOXmAfG1MIgLBNlVO9u5l7hV4EH8V8gG9S2MmBV8IehXSVLvPGe
   AyHx5Ak9huoW2efrL13yQiccnytJCjgVjB0zjk1Q3ZYq8i/k2zVAuQLMl
   qXFwGsidCJRiTyfH9fjpe1OuNmi8Mcs4jnXk5JnUo0duILCslICBQnEuG
   i7TXI1A/9QxwivK/lB8xkzB+cpgL7fx7f6D4mnK1Ddb1hKlTOCL7gkZGu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4300583"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4300583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 17:59:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9158935"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2024 17:59:28 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhK5U-0002uj-37;
	Tue, 05 Mar 2024 01:59:24 +0000
Date: Tue, 5 Mar 2024 09:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/2454]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:4486:37: warning:
 'kvmmmu_reclaim_times_proc_fops' defined but not used
Message-ID: <202403050926.n2OTc5lm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: b59fce6d7c0295de07c4f8d335e297891ca82471 [1/2454] fix:Don't reclaim kvm mmu pages in mmu_shrink
config: x86_64-buildonly-randconfig-004-20240305 (https://download.01.org/0day-ci/archive/20240305/202403050926.n2OTc5lm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050926.n2OTc5lm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050926.n2OTc5lm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/../../../virt/kvm/kvm_main.c:18:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:674:12: warning: no previous prototype for 'kvm_arch_post_init_vm' [-Wmissing-prototypes]
     674 | int __weak kvm_arch_post_init_vm(struct kvm *kvm)
         |            ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:683:13: warning: no previous prototype for 'kvm_arch_pre_destroy_vm' [-Wmissing-prototypes]
     683 | void __weak kvm_arch_pre_destroy_vm(struct kvm *kvm)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:4493:6: warning: no previous prototype for 'kvm_proc_interface_uninit' [-Wmissing-prototypes]
    4493 | void kvm_proc_interface_uninit(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:4501:5: warning: no previous prototype for 'kvm_proc_interface_init' [-Wmissing-prototypes]
    4501 | int kvm_proc_interface_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:4486:37: warning: 'kvmmmu_reclaim_times_proc_fops' defined but not used [-Wunused-const-variable=]
    4486 | static const struct file_operations kvmmmu_reclaim_times_proc_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:4468:37: warning: 'kvmmmu_reclaim_try_times_proc_fops' defined but not used [-Wunused-const-variable=]
    4468 | static const struct file_operations kvmmmu_reclaim_try_times_proc_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:4449:37: warning: 'kvmmmu_limit_nr_proc_fops' defined but not used [-Wunused-const-variable=]
    4449 | static const struct file_operations kvmmmu_limit_nr_proc_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvmmmu_reclaim_times_proc_fops +4486 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  4448	
> 4449	static const struct file_operations kvmmmu_limit_nr_proc_fops = {
  4450		.open		= kvmmmu_limit_nr_proc_open,
  4451		.read		= seq_read,
  4452		.write		= kvmmmu_limit_nr_proc_write,
  4453		.llseek		= seq_lseek,
  4454		.release	= single_release,
  4455	};
  4456	
  4457	static int kvmmmu_reclaim_try_times_proc_show(struct seq_file *m, void *v)
  4458	{
  4459		seq_printf(m, "%d\n", kvm_mmu_reclaim_try_times);
  4460		return 0; 
  4461	}
  4462	
  4463	static int kvmmmu_reclaim_try_times_proc_open(struct inode *inode, struct file *file)
  4464	{
  4465		return single_open(file, kvmmmu_reclaim_try_times_proc_show, NULL);
  4466	}
  4467	
> 4468	static const struct file_operations kvmmmu_reclaim_try_times_proc_fops = {
  4469		.open		= kvmmmu_reclaim_try_times_proc_open,
  4470		.read		= seq_read,
  4471		.llseek		= seq_lseek,
  4472		.release	= single_release,
  4473	};
  4474	
  4475	static int kvmmmu_reclaim_times_proc_show(struct seq_file *m, void *v)
  4476	{
  4477		seq_printf(m, "%d\n", kvm_mmu_reclaim_times);
  4478		return 0; 
  4479	}
  4480	
  4481	static int kvmmmu_reclaim_times_proc_open(struct inode *inode, struct file *file)
  4482	{
  4483		return single_open(file, kvmmmu_reclaim_times_proc_show, NULL);
  4484	}
  4485	
> 4486	static const struct file_operations kvmmmu_reclaim_times_proc_fops = {
  4487		.open		= kvmmmu_reclaim_times_proc_open,
  4488		.read		= seq_read,
  4489		.llseek		= seq_lseek,
  4490		.release	= single_release,
  4491	};
  4492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
