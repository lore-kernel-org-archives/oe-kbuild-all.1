Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B67156871
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729620599; cv=none; b=uYw99Pj5OeeC0bhE4ffHyGfoJi3gMX8w+RlDm+XJuWWUiCtV0RkSpae5yKwaH0lx+pYVsrBrzOlLuDbEirAjJbkaM8HFgHQ39ZEN70L8rEoXba//WOWxrDdO86TaZSehPCBcjYGCCJxBNLDHmoqQAJfmwXQAIC6IlFLYTrjmkas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729620599; c=relaxed/simple;
	bh=qDGD2uCfSQe0ns7pgAKHakOw9xnhCw4HqE9pvqPgWIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uNRK4v4lUrRU2Ve5+Q3q67LLFWnCGYNvMyRXO/ViF+gZIbkrCdR7fB4+HL4a7ISCXq3vU7gqxqjM2RGvWagF+FSSqu3aiNybTkiBy3914Kzd2bfDxryykHguWOUa3N5OlulOnDbFHgV2IJF2keVx073nWByG9MXpzNvZ4EJq4IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNHUdbbo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNHUdbbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729620598; x=1761156598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qDGD2uCfSQe0ns7pgAKHakOw9xnhCw4HqE9pvqPgWIU=;
  b=SNHUdbbo8iKr+46/XG0NgO+Hh+iiG+LT8HV1YLMW+2KhWCh8pVvWW3Po
   UcK0oE/3BkyLcJ9HsoftKDPh6bK2PzwNbuQ66R+6Zjr3u/VPnVNEVxgbs
   fIwoU6pPX0iSJJOTFGQQHeRYXsopuGCUGcGEoRYKbggLMsv9IgYVndFNS
   tSKs8SGMTYmtoksOt59xQtOGaLjgG+WibR8vtGjnLl1ei13eD8O830j0b
   MZwP52e4RzG1VWmyO6zI+f6up3e7TCMSrXt/Ob1Y/g3r3N69SUh7CG387
   cKKLXsmOcH/rfojgkJtDT/w/bpZNHOhpGUaonW9KtxevGAnjmf4YOUxzm
   w==;
X-CSE-ConnectionGUID: P1W7OrhsSrus3Kro7w5WXA==
X-CSE-MsgGUID: 0ocnwgqWQlKqZMdzmvFAWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32869488"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32869488"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 11:09:57 -0700
X-CSE-ConnectionGUID: tpCI3JIpTsGEGPjorZPhqA==
X-CSE-MsgGUID: 59hjh+mvQ4+qVHdRPbmVhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80363738"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2024 11:09:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3JKJ-000TvF-1S;
	Tue, 22 Oct 2024 18:09:51 +0000
Date: Wed, 23 Oct 2024 02:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1934/2444]
 drivers/iommu/intel/debugfs.c:429:67: error: 'struct intel_iommu' has no
 member named 'num_prqs'
Message-ID: <202410230231.fwzaApEn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 291c0dc10cbc47487923c0c6b3d92703e09a5008 [1934/2444] iommu/vt-d: Add PRQ counter for debug
config: x86_64-randconfig-076-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230231.fwzaApEn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230231.fwzaApEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230231.fwzaApEn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/intel/debugfs.c: In function 'invalidation_queue_show':
>> drivers/iommu/intel/debugfs.c:429:67: error: 'struct intel_iommu' has no member named 'num_prqs'
     429 |                 seq_printf(m, "No. of received PRQs: %ld\n", iommu->num_prqs);
         |                                                                   ^~
>> drivers/iommu/intel/debugfs.c:430:70: error: 'struct intel_iommu' has no member named 'num_prrs'
     430 |                 seq_printf(m, "No. of PRR SUCCESS sent: %ld\n", iommu->num_prrs);
         |                                                                      ^~
>> drivers/iommu/intel/debugfs.c:431:70: error: 'struct intel_iommu' has no member named 'num_prri'
     431 |                 seq_printf(m, "No. of PRR INVALID sent: %ld\n", iommu->num_prri);
         |                                                                      ^~
   drivers/iommu/intel/debugfs.c: In function 'dmar_perf_latency_write':
   drivers/iommu/intel/debugfs.c:594:13: error: implicit declaration of function 'copy_from_user'; did you mean 'copy_from_user_page'? [-Werror=implicit-function-declaration]
     594 |         if (copy_from_user(&buf, ubuf, cnt))
         |             ^~~~~~~~~~~~~~
         |             copy_from_user_page
   drivers/iommu/intel/debugfs.c: At top level:
   drivers/iommu/intel/debugfs.c:653:13: error: redefinition of 'latency_show_one'
     653 | static void latency_show_one(struct seq_file *m, struct intel_iommu *iommu,
         |             ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:548:13: note: previous definition of 'latency_show_one' with type 'void(struct seq_file *, struct intel_iommu *, struct dmar_drhd_unit *)'
     548 | static void latency_show_one(struct seq_file *m, struct intel_iommu *iommu,
         |             ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:669:12: error: redefinition of 'latency_show'
     669 | static int latency_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:564:12: note: previous definition of 'latency_show' with type 'int(struct seq_file *, void *)'
     564 | static int latency_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:682:12: error: redefinition of 'dmar_perf_latency_open'
     682 | static int dmar_perf_latency_open(struct inode *inode, struct file *filp)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:577:12: note: previous definition of 'dmar_perf_latency_open' with type 'int(struct inode *, struct file *)'
     577 | static int dmar_perf_latency_open(struct inode *inode, struct file *filp)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:687:16: error: redefinition of 'dmar_perf_latency_write'
     687 | static ssize_t dmar_perf_latency_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:582:16: note: previous definition of 'dmar_perf_latency_write' with type 'ssize_t(struct file *, const char *, size_t,  loff_t *)' {aka 'long int(struct file *, const char *, long unsigned int,  long long int *)'}
     582 | static ssize_t dmar_perf_latency_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c: In function 'dmar_perf_latency_write':
   drivers/iommu/intel/debugfs.c:715:30: error: 'struct intel_iommu' has no member named 'num_prqs'
     715 |                         iommu->num_prqs = 0;
         |                              ^~
   drivers/iommu/intel/debugfs.c:716:30: error: 'struct intel_iommu' has no member named 'num_prrs'
     716 |                         iommu->num_prrs = 0;
         |                              ^~
   drivers/iommu/intel/debugfs.c:717:30: error: 'struct intel_iommu' has no member named 'num_prri'
     717 |                         iommu->num_prri = 0;
         |                              ^~
   drivers/iommu/intel/debugfs.c: At top level:
   drivers/iommu/intel/debugfs.c:753:37: error: redefinition of 'dmar_perf_latency_fops'
     753 | static const struct file_operations dmar_perf_latency_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:645:37: note: previous definition of 'dmar_perf_latency_fops' with type 'const struct file_operations'
     645 | static const struct file_operations dmar_perf_latency_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c: In function 'intel_iommu_debugfs_init':
   drivers/iommu/intel/debugfs.c:780:36: error: 'qi_done_fops' undeclared (first use in this function)
     780 |                             NULL, &qi_done_fops);
         |                                    ^~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:780:36: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/intel/debugfs.c: At top level:
   drivers/iommu/intel/debugfs.c:645:37: warning: 'dmar_perf_latency_fops' defined but not used [-Wunused-const-variable=]
     645 | static const struct file_operations dmar_perf_latency_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +429 drivers/iommu/intel/debugfs.c

   405	
   406	static int invalidation_queue_show(struct seq_file *m, void *unused)
   407	{
   408		struct dmar_drhd_unit *drhd;
   409		struct intel_iommu *iommu;
   410		unsigned long flags;
   411		struct q_inval *qi;
   412		int shift;
   413	
   414		rcu_read_lock();
   415		for_each_active_iommu(iommu, drhd) {
   416			qi = iommu->qi;
   417			shift = qi_shift(iommu);
   418	
   419			if (!qi || !ecap_qis(iommu->ecap))
   420				continue;
   421	
   422			seq_printf(m, "Invalidation queue on IOMMU: %s\n", iommu->name);
   423	
   424			raw_spin_lock_irqsave(&qi->q_lock, flags);
   425			seq_printf(m, " Base: 0x%llx\tHead: %lld\tTail: %lld\n",
   426				   (u64)virt_to_phys(qi->desc),
   427				   dmar_readq(iommu->reg + DMAR_IQH_REG) >> shift,
   428				   dmar_readq(iommu->reg + DMAR_IQT_REG) >> shift);
 > 429			seq_printf(m, "No. of received PRQs: %ld\n", iommu->num_prqs);
 > 430			seq_printf(m, "No. of PRR SUCCESS sent: %ld\n", iommu->num_prrs);
 > 431			seq_printf(m, "No. of PRR INVALID sent: %ld\n", iommu->num_prri);
   432			invalidation_queue_entry_show(m, iommu);
   433			raw_spin_unlock_irqrestore(&qi->q_lock, flags);
   434			seq_putc(m, '\n');
   435		}
   436		rcu_read_unlock();
   437	
   438		return 0;
   439	}
   440	DEFINE_SHOW_ATTRIBUTE(invalidation_queue);
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
