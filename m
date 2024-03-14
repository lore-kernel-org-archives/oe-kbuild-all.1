Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD4EDDD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429063; cv=none; b=I8nbKTQA+Y1gcOjhdelgyK5SI9TTkn2XkvNe9GwRitDVonxWAoPCRqUAi+ehr3PB7j6WGiSfZQBxi1ks/mZnhL+Eq8E+dnmXHHBoEnk8ObF3gGqWXbNTowZ6a1dklTQCtLdbQFyM9l1v3Vb+RWqBq//g1XdOunTV8Doz3OEzh78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429063; c=relaxed/simple;
	bh=XFd2dc0tWjDZgxdUzHO/DQJ9iut5qRit6E7LKJaSpEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Enq5E775X0cQp4r2VpBdOZyL7ID7cFfCVKtdxqdQoIEuDJWI4fz0u/xpHlFYhQo60jC4P2/cLJOHMITo7+A3TxyBPc3BVvSqnsBsQitB6dMRSAqvGp6aE3S8Fm3Cf/8H9NVM2w3PeuQKr6ckxOMzrqd/I6AX1vsmdIs21xzzQ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brRqHB9q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brRqHB9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710429061; x=1741965061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFd2dc0tWjDZgxdUzHO/DQJ9iut5qRit6E7LKJaSpEw=;
  b=brRqHB9qV2PPvQVcNTRmJjgBAh0CjWf6gSvxm9AFi8SEw6Y8STQartM4
   Ucwq3Vmra3H6hkp1DQCExj126hnjZYop+3W1v46L/C0gzZoVy+nXip7k2
   DXaFe+nI/koJUJjM9fq6oDjSGOZLSP+FkGKBrjnzlR4CvEQhTWttonD5g
   CBb0FW8LyPYjQUPQIUhh8oN7SSw0nat07ZxDqoqiSAZVwVF+knNfKgDVY
   x4ifMH9oDNjHOpnkjhjOFCMRdUBJGAma20j9GjseUKiwwU9xMDtTwRCHc
   TUng5BxVWXvT9tMBIPIsErvjgOgDqGMmJ395dg9RoZfa2tlEApw1cu9hb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5118467"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5118467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="12334437"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Mar 2024 08:10:32 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkmj0-000DWl-0f;
	Thu, 14 Mar 2024 15:10:30 +0000
Date: Thu, 14 Mar 2024 23:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/intel/debugfs.c:650:13: error: redefinition of
 'latency_show_one'
Message-ID: <202403142330.VblH1QEJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: 08ce2eb804a181333618d34f9e8ad915b3d4da97 iommu/vt-d: Expose latency monitor data through debugfs
date:   9 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240314/202403142330.VblH1QEJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403142330.VblH1QEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403142330.VblH1QEJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from drivers/iommu/intel/debugfs.c:11:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/iommu/intel/debugfs.c: In function 'dmar_perf_latency_write':
   drivers/iommu/intel/debugfs.c:591:13: error: implicit declaration of function 'copy_from_user'; did you mean 'copy_from_user_page'? [-Werror=implicit-function-declaration]
     591 |         if (copy_from_user(&buf, ubuf, cnt))
         |             ^~~~~~~~~~~~~~
         |             copy_from_user_page
   drivers/iommu/intel/debugfs.c: At top level:
>> drivers/iommu/intel/debugfs.c:650:13: error: redefinition of 'latency_show_one'
     650 | static void latency_show_one(struct seq_file *m, struct intel_iommu *iommu,
         |             ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:545:13: note: previous definition of 'latency_show_one' with type 'void(struct seq_file *, struct intel_iommu *, struct dmar_drhd_unit *)'
     545 | static void latency_show_one(struct seq_file *m, struct intel_iommu *iommu,
         |             ^~~~~~~~~~~~~~~~
>> drivers/iommu/intel/debugfs.c:666:12: error: redefinition of 'latency_show'
     666 | static int latency_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:561:12: note: previous definition of 'latency_show' with type 'int(struct seq_file *, void *)'
     561 | static int latency_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~
>> drivers/iommu/intel/debugfs.c:679:12: error: redefinition of 'dmar_perf_latency_open'
     679 | static int dmar_perf_latency_open(struct inode *inode, struct file *filp)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:574:12: note: previous definition of 'dmar_perf_latency_open' with type 'int(struct inode *, struct file *)'
     574 | static int dmar_perf_latency_open(struct inode *inode, struct file *filp)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/intel/debugfs.c:684:16: error: redefinition of 'dmar_perf_latency_write'
     684 | static ssize_t dmar_perf_latency_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:579:16: note: previous definition of 'dmar_perf_latency_write' with type 'ssize_t(struct file *, const char *, size_t,  loff_t *)' {aka 'long int(struct file *, const char *, long unsigned int,  long long int *)'}
     579 | static ssize_t dmar_perf_latency_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/intel/debugfs.c:747:37: error: redefinition of 'dmar_perf_latency_fops'
     747 | static const struct file_operations dmar_perf_latency_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:642:37: note: previous definition of 'dmar_perf_latency_fops' with type 'const struct file_operations'
     642 | static const struct file_operations dmar_perf_latency_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c: In function 'intel_iommu_debugfs_init':
>> drivers/iommu/intel/debugfs.c:774:36: error: 'qi_done_fops' undeclared (first use in this function)
     774 |                             NULL, &qi_done_fops);
         |                                    ^~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:774:36: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/intel/debugfs.c: At top level:
>> drivers/iommu/intel/debugfs.c:642:37: warning: 'dmar_perf_latency_fops' defined but not used [-Wunused-const-variable=]
     642 | static const struct file_operations dmar_perf_latency_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/latency_show_one +650 drivers/iommu/intel/debugfs.c

   641	
 > 642	static const struct file_operations dmar_perf_latency_fops = {
   643		.open		= dmar_perf_latency_open,
   644		.write		= dmar_perf_latency_write,
   645		.read		= seq_read,
   646		.llseek		= seq_lseek,
   647		.release	= single_release,
   648	};
   649	
 > 650	static void latency_show_one(struct seq_file *m, struct intel_iommu *iommu,
   651				     struct dmar_drhd_unit *drhd)
   652	{
   653		int ret;
   654	
   655		seq_printf(m, "IOMMU: %s Register Base Address: %llx\n",
   656			   iommu->name, drhd->reg_base_addr);
   657	
   658		ret = dmar_latency_snapshot(iommu, debug_buf, DEBUG_BUFFER_SIZE);
   659		if (ret < 0)
   660			seq_printf(m, "Failed to get latency snapshot");
   661		else
   662			seq_puts(m, debug_buf);
   663		seq_puts(m, "\n");
   664	}
   665	
 > 666	static int latency_show(struct seq_file *m, void *v)
   667	{
   668		struct dmar_drhd_unit *drhd;
   669		struct intel_iommu *iommu;
   670	
   671		rcu_read_lock();
   672		for_each_active_iommu(iommu, drhd)
   673			latency_show_one(m, iommu, drhd);
   674		rcu_read_unlock();
   675	
   676		return 0;
   677	}
   678	
 > 679	static int dmar_perf_latency_open(struct inode *inode, struct file *filp)
   680	{
   681		return single_open(filp, latency_show, NULL);
   682	}
   683	
 > 684	static ssize_t dmar_perf_latency_write(struct file *filp,
   685					       const char __user *ubuf,
   686					       size_t cnt, loff_t *ppos)
   687	{
   688		struct dmar_drhd_unit *drhd;
   689		struct intel_iommu *iommu;
   690		int counting;
   691		char buf[64];
   692	
   693		if (cnt > 63)
   694			cnt = 63;
   695	
   696		if (copy_from_user(&buf, ubuf, cnt))
   697			return -EFAULT;
   698	
   699		buf[cnt] = 0;
   700	
   701		if (kstrtoint(buf, 0, &counting))
   702			return -EINVAL;
   703	
   704		switch (counting) {
   705		case 0:
   706			rcu_read_lock();
   707			for_each_active_iommu(iommu, drhd) {
   708				dmar_latency_disable(iommu, DMAR_LATENCY_INV_IOTLB);
   709				dmar_latency_disable(iommu, DMAR_LATENCY_INV_DEVTLB);
   710				dmar_latency_disable(iommu, DMAR_LATENCY_INV_IEC);
   711				dmar_latency_disable(iommu, DMAR_LATENCY_PRQ);
   712			}
   713			rcu_read_unlock();
   714			break;
   715		case 1:
   716			rcu_read_lock();
   717			for_each_active_iommu(iommu, drhd)
   718				dmar_latency_enable(iommu, DMAR_LATENCY_INV_IOTLB);
   719			rcu_read_unlock();
   720			break;
   721		case 2:
   722			rcu_read_lock();
   723			for_each_active_iommu(iommu, drhd)
   724				dmar_latency_enable(iommu, DMAR_LATENCY_INV_DEVTLB);
   725			rcu_read_unlock();
   726			break;
   727		case 3:
   728			rcu_read_lock();
   729			for_each_active_iommu(iommu, drhd)
   730				dmar_latency_enable(iommu, DMAR_LATENCY_INV_IEC);
   731			rcu_read_unlock();
   732			break;
   733		case 4:
   734			rcu_read_lock();
   735			for_each_active_iommu(iommu, drhd)
   736				dmar_latency_enable(iommu, DMAR_LATENCY_PRQ);
   737			rcu_read_unlock();
   738			break;
   739		default:
   740			return -EINVAL;
   741		}
   742	
   743		*ppos += cnt;
   744		return cnt;
   745	}
   746	
 > 747	static const struct file_operations dmar_perf_latency_fops = {
   748		.open		= dmar_perf_latency_open,
   749		.write		= dmar_perf_latency_write,
   750		.read		= seq_read,
   751		.llseek		= seq_lseek,
   752		.release	= single_release,
   753	};
   754	
   755	void __init intel_iommu_debugfs_init(void)
   756	{
   757		struct dentry *intel_iommu_debug = debugfs_create_dir("intel",
   758							iommu_debugfs_dir);
   759	
   760		debugfs_create_file("iommu_regset", 0444, intel_iommu_debug, NULL,
   761				    &iommu_regset_fops);
   762		debugfs_create_file("dmar_translation_struct", 0444, intel_iommu_debug,
   763				    NULL, &dmar_translation_struct_fops);
   764		debugfs_create_file("domain_translation_struct", 0444,
   765				    intel_iommu_debug, NULL,
   766				    &domain_translation_struct_fops);
   767		debugfs_create_file("invalidation_queue", 0444, intel_iommu_debug,
   768				    NULL, &invalidation_queue_fops);
   769	#ifdef CONFIG_IRQ_REMAP
   770		debugfs_create_file("ir_translation_struct", 0444, intel_iommu_debug,
   771				    NULL, &ir_translation_struct_fops);
   772	#endif
   773		debugfs_create_file("qi_done", 0644, intel_iommu_debug,
 > 774				    NULL, &qi_done_fops);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
