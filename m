Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B41BD9E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730321137; cv=none; b=MNbesO0ei4HKtNXEiyH1AEoGmnC9QynVubM6LPwPOZKtHCUa9E/v/IruKDvB0npP4gwxapTw6Z8af9fwJPSijjTQaUaZc2zTqnb4NOAZ5viSaXwQh3vwjij1hArK8UVWAUPWEfQyGfOtYQXBmbq1Ij1+lUf8fqxqRne3UyIUa+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730321137; c=relaxed/simple;
	bh=ex1Umbgo/+zilzOEJEI3WWMKyf3fD/IfnTV4Vfj6jzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MW3COZcHxFTg9mdNjVzIt3wRXEOzRtwDm9PCckeAi4xcoQddj1U+50q3s5y3E6xa2YWF9Vk8Yv9r3M9VOZAGzVCo+qgUqU81vv0vqzTP/RuxkNvYlsHdPyPVfSZBmayubG6MAxqGtqwEwjOq8GqHnyb2FqUlNN6xXxxqgAkNA6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQ2wwrhr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQ2wwrhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730321134; x=1761857134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ex1Umbgo/+zilzOEJEI3WWMKyf3fD/IfnTV4Vfj6jzM=;
  b=SQ2wwrhrYv9YMuSPf5lSCoRuGVQg8UeF2VoohmSFCt2dX9d2sgtOU5ZZ
   f70b0gdsRlZPeXDEfCl6iSk0yyAgcLpmnuS/hheu+bsspoHqkflHi0HBO
   ir7MOrkNSdDc4Blhl10/LOMdR88VxA1uhO908ZtRLIzVcOaRs5xLOby9e
   lsvnYvwNIsGSZMNuPNZWBn+yy6eaCA4/9Ne9uB1BZWaeuAYhbQL7O/Vud
   yiBs1BDJ37eM3e+BZ7toZAJqDBpZtyTESxAiIhk0BN+1fvsTSZAUPwapf
   3WG3OgCukatLO66bVt15De5UB1v1ltCIjavHBHafvxl0QzCzV4W5h5fhd
   w==;
X-CSE-ConnectionGUID: jFRejhMWSz6Mii2Z+VHDLA==
X-CSE-MsgGUID: id1BtkEZTMaQVuYN0YwwDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47505586"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47505586"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 13:45:34 -0700
X-CSE-ConnectionGUID: QZYtxCLJSHOhio8L07SYqQ==
X-CSE-MsgGUID: txMY9TdvQ4C6d0nYy1Avsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82589923"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Oct 2024 13:45:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6FZK-000fI0-2T;
	Wed, 30 Oct 2024 20:45:30 +0000
Date: Thu, 31 Oct 2024 04:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 26/81]
 arch/x86/kvm/../../../virt/kvm/vfio.c:422:25: error: implicit declaration of
 function 'kvm_iommu_device_num_ids'
Message-ID: <202410310406.XJezqtJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: af6fdeb325822ebc7fb32ed24751fc597d78c952 [26/81] ANDROID: kvm/vfio: pviommu: Add attr to probe device IOMMU info
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241031/202410310406.XJezqtJ6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310406.XJezqtJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310406.XJezqtJ6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/../../../virt/kvm/vfio.c:12:
   include/linux/kvm_host.h:1575:6: warning: no previous prototype for 'kvm_arch_reclaim_device' [-Wmissing-prototypes]
    1575 | void kvm_arch_reclaim_device(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1579:6: warning: no previous prototype for 'kvm_arch_reclaim_group' [-Wmissing-prototypes]
    1579 | void kvm_arch_reclaim_group(struct iommu_group *group)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/vfio.c: In function 'kvm_vfio_pviommu_attach':
   arch/x86/kvm/../../../virt/kvm/vfio.c:394:15: error: implicit declaration of function 'kvm_call_hyp_nvhe' [-Werror=implicit-function-declaration]
     394 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
         |               ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/vfio.c:394:33: error: '__pkvm_pviommu_attach' undeclared (first use in this function); did you mean 'kvm_vfio_pviommu_attach'?
     394 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 kvm_vfio_pviommu_attach
   arch/x86/kvm/../../../virt/kvm/vfio.c:394:33: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kvm/../../../virt/kvm/vfio.c: In function 'kvm_vfio_pviommu_get_info':
>> arch/x86/kvm/../../../virt/kvm/vfio.c:422:25: error: implicit declaration of function 'kvm_iommu_device_num_ids' [-Werror=implicit-function-declaration]
     422 |         info->nr_sids = kvm_iommu_device_num_ids(device);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kvm_iommu_device_num_ids +422 arch/x86/kvm/../../../virt/kvm/vfio.c

   375	
   376	static int kvm_vfio_pviommu_attach(struct kvm_device *dev)
   377	{
   378		int ret;
   379		struct kvm_pviommu *pviommu;
   380	
   381		pviommu = kmalloc(sizeof(*pviommu), GFP_KERNEL);
   382		if (!pviommu)
   383			return -ENOMEM;
   384	
   385		pviommu->dev = dev;
   386	
   387		ret = anon_inode_getfd("kvm-pviommu", &pviommu_fops, pviommu, O_CLOEXEC);
   388		if (ret < 0)
   389			goto out_free;
   390	
   391		pviommu->fd = ret;
   392	
   393		/* Create pvIOMMU with this ID. */
 > 394		ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
   395		if (ret)
   396			goto out_free;
   397	
   398		return pviommu->fd;
   399	out_free:
   400		kfree(pviommu);
   401		return ret;
   402	}
   403	
   404	static int kvm_vfio_pviommu_get_info(struct kvm_device *dev,
   405					     struct kvm_vfio_iommu_info *info)
   406	{
   407		int vfio_dev_fd = info->device_fd;
   408		int ret = 0;
   409		struct file *filp;
   410		struct device *device;
   411	
   412		filp = fget(vfio_dev_fd);
   413		if (!filp)
   414			return -EBADF;
   415	
   416		device = kvm_vfio_file_get_device(filp);
   417		if (!device) {
   418			ret = -ENODEV;
   419			goto err_fput;
   420		}
   421	
 > 422		info->nr_sids = kvm_iommu_device_num_ids(device);
   423	err_fput:
   424		fput(filp);
   425		return ret;
   426	}
   427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
