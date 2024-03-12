Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A5310E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 00:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710202570; cv=none; b=oVGpoGK3vQ4FZztcvAw4p+rap/CWVzYrqmERQT5PMgr1eFYQQK5pQ4OfdWoLrRWnax4PB7eFfliI9/5+U5z5KVqgKldKRItEpDtFd5DsszB5y4KinHz5X9kd8xc/Rmg0MUg52LZCrCZY09xbi7tuzr1qnjjKUYFgZfUswTywYXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710202570; c=relaxed/simple;
	bh=838Ub4lZ9V62y6Zil80Q9u1Lpy7eCrvi0p6HvQwuLb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ud6DBdMRJBfnLj975HCZLnlTycjo/RPrtSpHJMKK14eVk4fx4K9fwNCaKCDLeUC9Htyk+2l/PG95u9jem4+TsdxzAkuI22k3YS4D+92D+DrZf1Jte4rUBwWJbchCiJ9/VcG74Sp5soxg/tdY56R8Tv5WUCuBXd0MTk8IB7uUP28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPlrnjLU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPlrnjLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710202567; x=1741738567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=838Ub4lZ9V62y6Zil80Q9u1Lpy7eCrvi0p6HvQwuLb4=;
  b=XPlrnjLUe+2GYh10xhQiCxUJel8M55mONpjdThwLAa/BXHUr3QkBmgqB
   6gAvoVaspzUO6e5ttJLHsNFu+uYvUxtOgz4EvLAU+TqKU8LGYIo9iBcLH
   UjYTmvcoAoP5USh3MEYesqv6//iMvQJu8ZIE8zKganFT0v2BjC+/6qrOy
   n/stUoT5RZ3tI05x2XbiH8K/OdMsW7bOdU5ySB4/Th41l+0k89pQec9i8
   qfKRzv8zwAev3kcS3/D0hf6BV/9heZb7h3kkK3EKIjgtRMZgmA5YVYBdh
   jn//uSk8a1Rh7xxg6HY8DGsvur503chRGj3sfHTS41UPj/YSDwAa94Ow1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16294742"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="16294742"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 17:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11787431"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Mar 2024 17:16:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjpoH-0009ZH-0t;
	Tue, 12 Mar 2024 00:16:01 +0000
Date: Tue, 12 Mar 2024 08:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/intel/debugfs.c:591:13: error: implicit declaration of
 function 'copy_from_user'; did you mean 'copy_from_user_page'?
Message-ID: <202403120835.FxLGbJLo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e07182766e467ad9f34911579d25d705e0647e76
commit: a675f20b6c8f495b19c4eb4307544dc265a17af3 x86/pkru: Remove useless include
date:   9 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240312/202403120835.FxLGbJLo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120835.FxLGbJLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120835.FxLGbJLo-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> drivers/iommu/intel/debugfs.c:591:13: error: implicit declaration of function 'copy_from_user'; did you mean 'copy_from_user_page'? [-Werror=implicit-function-declaration]
     591 |         if (copy_from_user(&buf, ubuf, cnt))
         |             ^~~~~~~~~~~~~~
         |             copy_from_user_page
   cc1: some warnings being treated as errors


vim +591 drivers/iommu/intel/debugfs.c

4c6e3c9ad8f248 Lu Baolu 2021-06-10  578  
4c6e3c9ad8f248 Lu Baolu 2021-06-10  579  static ssize_t dmar_perf_latency_write(struct file *filp,
4c6e3c9ad8f248 Lu Baolu 2021-06-10  580  				       const char __user *ubuf,
4c6e3c9ad8f248 Lu Baolu 2021-06-10  581  				       size_t cnt, loff_t *ppos)
4c6e3c9ad8f248 Lu Baolu 2021-06-10  582  {
4c6e3c9ad8f248 Lu Baolu 2021-06-10  583  	struct dmar_drhd_unit *drhd;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  584  	struct intel_iommu *iommu;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  585  	int counting;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  586  	char buf[64];
4c6e3c9ad8f248 Lu Baolu 2021-06-10  587  
4c6e3c9ad8f248 Lu Baolu 2021-06-10  588  	if (cnt > 63)
4c6e3c9ad8f248 Lu Baolu 2021-06-10  589  		cnt = 63;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  590  
4c6e3c9ad8f248 Lu Baolu 2021-06-10 @591  	if (copy_from_user(&buf, ubuf, cnt))
4c6e3c9ad8f248 Lu Baolu 2021-06-10  592  		return -EFAULT;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  593  
4c6e3c9ad8f248 Lu Baolu 2021-06-10  594  	buf[cnt] = 0;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  595  
4c6e3c9ad8f248 Lu Baolu 2021-06-10  596  	if (kstrtoint(buf, 0, &counting))
4c6e3c9ad8f248 Lu Baolu 2021-06-10  597  		return -EINVAL;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  598  
4c6e3c9ad8f248 Lu Baolu 2021-06-10  599  	switch (counting) {
4c6e3c9ad8f248 Lu Baolu 2021-06-10  600  	case 0:
4c6e3c9ad8f248 Lu Baolu 2021-06-10  601  		rcu_read_lock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  602  		for_each_active_iommu(iommu, drhd) {
4c6e3c9ad8f248 Lu Baolu 2021-06-10  603  			dmar_latency_disable(iommu, DMAR_LATENCY_INV_IOTLB);
4c6e3c9ad8f248 Lu Baolu 2021-06-10  604  			dmar_latency_disable(iommu, DMAR_LATENCY_INV_DEVTLB);
4c6e3c9ad8f248 Lu Baolu 2021-06-10  605  			dmar_latency_disable(iommu, DMAR_LATENCY_INV_IEC);
4c6e3c9ad8f248 Lu Baolu 2021-06-10  606  			dmar_latency_disable(iommu, DMAR_LATENCY_PRQ);
4c6e3c9ad8f248 Lu Baolu 2021-06-10  607  		}
4c6e3c9ad8f248 Lu Baolu 2021-06-10  608  		rcu_read_unlock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  609  		break;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  610  	case 1:
4c6e3c9ad8f248 Lu Baolu 2021-06-10  611  		rcu_read_lock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  612  		for_each_active_iommu(iommu, drhd)
4c6e3c9ad8f248 Lu Baolu 2021-06-10  613  			dmar_latency_enable(iommu, DMAR_LATENCY_INV_IOTLB);
4c6e3c9ad8f248 Lu Baolu 2021-06-10  614  		rcu_read_unlock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  615  		break;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  616  	case 2:
4c6e3c9ad8f248 Lu Baolu 2021-06-10  617  		rcu_read_lock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  618  		for_each_active_iommu(iommu, drhd)
4c6e3c9ad8f248 Lu Baolu 2021-06-10  619  			dmar_latency_enable(iommu, DMAR_LATENCY_INV_DEVTLB);
4c6e3c9ad8f248 Lu Baolu 2021-06-10  620  		rcu_read_unlock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  621  		break;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  622  	case 3:
4c6e3c9ad8f248 Lu Baolu 2021-06-10  623  		rcu_read_lock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  624  		for_each_active_iommu(iommu, drhd)
4c6e3c9ad8f248 Lu Baolu 2021-06-10  625  			dmar_latency_enable(iommu, DMAR_LATENCY_INV_IEC);
4c6e3c9ad8f248 Lu Baolu 2021-06-10  626  		rcu_read_unlock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  627  		break;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  628  	case 4:
4c6e3c9ad8f248 Lu Baolu 2021-06-10  629  		rcu_read_lock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  630  		for_each_active_iommu(iommu, drhd)
4c6e3c9ad8f248 Lu Baolu 2021-06-10  631  			dmar_latency_enable(iommu, DMAR_LATENCY_PRQ);
4c6e3c9ad8f248 Lu Baolu 2021-06-10  632  		rcu_read_unlock();
4c6e3c9ad8f248 Lu Baolu 2021-06-10  633  		break;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  634  	default:
4c6e3c9ad8f248 Lu Baolu 2021-06-10  635  		return -EINVAL;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  636  	}
4c6e3c9ad8f248 Lu Baolu 2021-06-10  637  
4c6e3c9ad8f248 Lu Baolu 2021-06-10  638  	*ppos += cnt;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  639  	return cnt;
4c6e3c9ad8f248 Lu Baolu 2021-06-10  640  }
4c6e3c9ad8f248 Lu Baolu 2021-06-10  641  

:::::: The code at line 591 was first introduced by commit
:::::: 4c6e3c9ad8f248b9f4c11f490e2320ef8e29ffec iommu/vt-d: Expose latency monitor data through debugfs

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Song, Youquan <youquan.song@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
