Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E35A4D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737653693; cv=none; b=R7yI6J0htmvLr0Q+2v/abZmnmazIW4EhiweTJdH29REngyeEYBpysTNAfQoxXUGZkn0eUCGXzDzMNs71BWC9JLBOpxvxzzOMwxY1INRBNGsb5+zu7QRRHet1QoG5qHurc2FiEzCL+ZtvbQCYoyqkFBx/heLBeASJJCYR0d1GP+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737653693; c=relaxed/simple;
	bh=DX5KAbw65sVxxr4lV6xmTvk7c6YLHu2b8n3MFCMzAY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qQx/Q7PYofTrxltqSnbhIK1Jo2n40WLuUOaqxlip9c6ZKXxCm45JrmOS9eDLAdI+0HX6ZVFu/Y7rYOXo92iBV8HCZxidc+1JaOLcQU6GPccfM2eriksdCIiw/qKUSsFcjAbarKse6R8sHNZ4zLe798edjXKtf0usbJCd4M0LIvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDvdjXby; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDvdjXby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737653691; x=1769189691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DX5KAbw65sVxxr4lV6xmTvk7c6YLHu2b8n3MFCMzAY8=;
  b=JDvdjXbyZEjy4oKUarM5C9UcBUhRmSUsAP61NJQ2co2OfOSL867WJKPF
   qSpCgtJIHAh7Eqtx5zK5nRibfdzpG5CNoOALOSDL7ag7uUq1X5ymy1co6
   yJd46ItrUIYh+tomyr1DtISrE7w01fFaHlYLWfMMMS+BwHH3O0jsSbGfl
   /XEEXG9AtcljbPfegT97dcMUxPb5xdmo6oY6sls8YSEWKibOTgAwAEBfW
   ahGuLNOv/PEcn/gaJHQpB+a5tarhC+Unktooha4kYSYbhaqg6wJciWo3L
   MNP/QG6Edwj/Xuthtkgt8u6nSim/K14O3ywde68An8Sx5CpmmtNJbxPEH
   g==;
X-CSE-ConnectionGUID: 21+RuVqzS4G9EVjOBvUnqw==
X-CSE-MsgGUID: alVEtsPEQJeEYoxar0/pxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38333042"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38333042"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 09:34:50 -0800
X-CSE-ConnectionGUID: spvfKswJTJ6oliLeTZp2HQ==
X-CSE-MsgGUID: Qu1BHeUMQFeiv8C8rukSwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112168336"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2025 09:34:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb16L-000bRh-1V;
	Thu, 23 Jan 2025 17:34:45 +0000
Date: Fri, 24 Jan 2025 01:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/iommu/intel/debugfs.c:642:37: warning: 'dmar_perf_latency_fops'
 defined but not used
Message-ID: <202501240117.wcOARjLR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 589132a513fbf4f1c0b7627cda829e7bba9e7e5f [2441/2441] iommu/vt-d: Expose latency monitor data through debugfs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250124/202501240117.wcOARjLR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240117.wcOARjLR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240117.wcOARjLR-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/iommu/intel/debugfs.c:650:13: error: redefinition of 'latency_show_one'
     650 | static void latency_show_one(struct seq_file *m, struct intel_iommu *iommu,
         |             ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:545:13: note: previous definition of 'latency_show_one' with type 'void(struct seq_file *, struct intel_iommu *, struct dmar_drhd_unit *)'
     545 | static void latency_show_one(struct seq_file *m, struct intel_iommu *iommu,
         |             ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:666:12: error: redefinition of 'latency_show'
     666 | static int latency_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:561:12: note: previous definition of 'latency_show' with type 'int(struct seq_file *, void *)'
     561 | static int latency_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:679:12: error: redefinition of 'dmar_perf_latency_open'
     679 | static int dmar_perf_latency_open(struct inode *inode, struct file *filp)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:574:12: note: previous definition of 'dmar_perf_latency_open' with type 'int(struct inode *, struct file *)'
     574 | static int dmar_perf_latency_open(struct inode *inode, struct file *filp)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:684:16: error: redefinition of 'dmar_perf_latency_write'
     684 | static ssize_t dmar_perf_latency_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:579:16: note: previous definition of 'dmar_perf_latency_write' with type 'ssize_t(struct file *, const char *, size_t,  loff_t *)' {aka 'long int(struct file *, const char *, long unsigned int,  long long int *)'}
     579 | static ssize_t dmar_perf_latency_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:747:37: error: redefinition of 'dmar_perf_latency_fops'
     747 | static const struct file_operations dmar_perf_latency_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:642:37: note: previous definition of 'dmar_perf_latency_fops' with type 'const struct file_operations'
     642 | static const struct file_operations dmar_perf_latency_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c: In function 'intel_iommu_debugfs_init':
   drivers/iommu/intel/debugfs.c:774:36: error: 'qi_done_fops' undeclared (first use in this function)
     774 |                             NULL, &qi_done_fops);
         |                                    ^~~~~~~~~~~~
   drivers/iommu/intel/debugfs.c:774:36: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/intel/debugfs.c: At top level:
>> drivers/iommu/intel/debugfs.c:642:37: warning: 'dmar_perf_latency_fops' defined but not used [-Wunused-const-variable=]
     642 | static const struct file_operations dmar_perf_latency_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dmar_perf_latency_fops +642 drivers/iommu/intel/debugfs.c

c4a45045c239ac Lu Baolu 2021-06-10  641  
c4a45045c239ac Lu Baolu 2021-06-10 @642  static const struct file_operations dmar_perf_latency_fops = {
c4a45045c239ac Lu Baolu 2021-06-10  643  	.open		= dmar_perf_latency_open,
c4a45045c239ac Lu Baolu 2021-06-10  644  	.write		= dmar_perf_latency_write,
c4a45045c239ac Lu Baolu 2021-06-10  645  	.read		= seq_read,
c4a45045c239ac Lu Baolu 2021-06-10  646  	.llseek		= seq_lseek,
c4a45045c239ac Lu Baolu 2021-06-10  647  	.release	= single_release,
c4a45045c239ac Lu Baolu 2021-06-10  648  };
c4a45045c239ac Lu Baolu 2021-06-10  649  

:::::: The code at line 642 was first introduced by commit
:::::: c4a45045c239acae7673408f03e3a9cd67dbfc48 iommu/vt-d: Expose latency monitor data through debugfs

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
