Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8354A35
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 01:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730339930; cv=none; b=hTGMj8CsNFROXL8BjAkyfJyYRPXSxXIRj0wF8SR1MlT0/2Vu8+dk4rI5Xa2fNYdz043hl+NBP8BAJjzG70IxDFWLL4AvIL9ZZfWKP5aOWyKzHFsrFoBVZ/kuO5Xt3oZBJQ4/Bbts5uzv7CztzLI1b9/IPQLt62Wmf3XbD7PvGdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730339930; c=relaxed/simple;
	bh=6suWlV6wVH3cq9zBcMNWNME/QoPYtqydw1ToHeYoL5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIKtgxiSoCpO2b0QJCPXRHvX0uVW8grzcA7SgJrISkD+YuhVWv4yiyKCNlPUGz4zYTvEHDYit+Q8FFMIOUaut4MC/49dBGLlvB35GHLNnAtjZqoqCs5INrfeMeVtTWXLtLxLob72X0QeWTcjTUQKdixfzmXa1hHUR0QSPNf3jmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egdd8OC7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egdd8OC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730339928; x=1761875928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6suWlV6wVH3cq9zBcMNWNME/QoPYtqydw1ToHeYoL5w=;
  b=egdd8OC73L4/OPtTiK7AVEdNnAKQUiL3PgtAw6z6V9QFwny7Fa/Ye/tw
   vTS+cH5SvUmjRpalbkekxC3B4o48J8Y8sFmF9LstjjE8QNULAAbSIPBM+
   87Bxyg8VvS+gzhBo9I0pAo2MrlHrGP9C2VuEzykGbAmE2fS+rOB5tadds
   KmI8sF+BkhJZ+u7R6F0pOD9whmszq9LwxgpiOm1vqJFHEcg78yW28vZKh
   FCRzM5blJQHH8KkC0uR8Mcq/tw9uxUIrWSvFucqlgVmaPCjK3spIzFUfh
   u0Yn75IHfapFByAg9lO7QKc8nfIXLzeWTnJjY0F5Esp5+Kg/9uqmuuaMl
   Q==;
X-CSE-ConnectionGUID: SXeRnaqRSSmJ7gJxv0noRA==
X-CSE-MsgGUID: peeH1yx6TVS5gullRSBABg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="33992066"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="33992066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 18:58:47 -0700
X-CSE-ConnectionGUID: fT+5PibuR/Cz96Pdm+Vzyg==
X-CSE-MsgGUID: XIeU89WETG6YMpjq4XmrUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82919506"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2024 18:58:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6KSR-000fWi-1x;
	Thu, 31 Oct 2024 01:58:43 +0000
Date: Thu, 31 Oct 2024 09:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 27/81]
 arch/x86/kvm/../../../virt/kvm/vfio.c:363:9: error: unknown type name
 'pkvm_handle_t'
Message-ID: <202410310934.2eoHxBUh-lkp@intel.com>
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
commit: ef8dd7aa3457fd60fee7bd4e01dfb6a0bdd8d997 [27/81] ANDROID: kvm/vfio: pviommu: Add set config IOCTL
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241031/202410310934.2eoHxBUh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310934.2eoHxBUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310934.2eoHxBUh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/../../../virt/kvm/vfio.c:12:
   include/linux/kvm_host.h:1575:6: warning: no previous prototype for 'kvm_arch_reclaim_device' [-Wmissing-prototypes]
    1575 | void kvm_arch_reclaim_device(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1579:6: warning: no previous prototype for 'kvm_arch_reclaim_group' [-Wmissing-prototypes]
    1579 | void kvm_arch_reclaim_group(struct iommu_group *group)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/vfio.c: In function 'kvm_vfio_pviommu_set_config':
>> arch/x86/kvm/../../../virt/kvm/vfio.c:363:9: error: unknown type name 'pkvm_handle_t'
     363 |         pkvm_handle_t iommu;
         |         ^~~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/vfio.c:377:15: error: implicit declaration of function 'kvm_iommu_device_id'; did you mean 'iommu_device_link'? [-Werror=implicit-function-declaration]
     377 |         ret = kvm_iommu_device_id(dev, config->sid_idx, &iommu, &phys_sid);
         |               ^~~~~~~~~~~~~~~~~~~
         |               iommu_device_link
   arch/x86/kvm/../../../virt/kvm/vfio.c:381:15: error: implicit declaration of function 'kvm_call_hyp_nvhe' [-Werror=implicit-function-declaration]
     381 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_add_vsid, pviommu->dev->kvm, pviommu->fd,
         |               ^~~~~~~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/vfio.c:381:33: error: '__pkvm_pviommu_add_vsid' undeclared (first use in this function)
     381 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_add_vsid, pviommu->dev->kvm, pviommu->fd,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/vfio.c:381:33: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kvm/../../../virt/kvm/vfio.c: In function 'kvm_vfio_pviommu_attach':
   arch/x86/kvm/../../../virt/kvm/vfio.c:436:33: error: '__pkvm_pviommu_attach' undeclared (first use in this function); did you mean 'kvm_vfio_pviommu_attach'?
     436 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 kvm_vfio_pviommu_attach
   arch/x86/kvm/../../../virt/kvm/vfio.c: In function 'kvm_vfio_pviommu_get_info':
   arch/x86/kvm/../../../virt/kvm/vfio.c:464:25: error: implicit declaration of function 'kvm_iommu_device_num_ids' [-Werror=implicit-function-declaration]
     464 |         info->nr_sids = kvm_iommu_device_num_ids(device);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pkvm_handle_t +363 arch/x86/kvm/../../../virt/kvm/vfio.c

   356	
   357	static int kvm_vfio_pviommu_set_config(struct file *fiommu, struct kvm_vfio_iommu_config *config)
   358	{
   359		int vfio_dev_fd = config->device_fd;
   360		struct file *filp;
   361		int ret;
   362		u32 phys_sid;
 > 363		pkvm_handle_t iommu;
   364		struct kvm_pviommu *pviommu = fiommu->private_data;
   365		struct device *dev;
   366	
   367		filp = fget(vfio_dev_fd);
   368		if (!filp)
   369			return -EBADF;
   370	
   371		dev = kvm_vfio_file_get_device(filp);
   372		if (!dev) {
   373			ret = -ENODEV;
   374			goto err_fput;
   375		}
   376	
 > 377		ret = kvm_iommu_device_id(dev, config->sid_idx, &iommu, &phys_sid);
   378		if (ret)
   379			goto err_fput;
   380	
 > 381		ret = kvm_call_hyp_nvhe(__pkvm_pviommu_add_vsid, pviommu->dev->kvm, pviommu->fd,
   382					iommu, phys_sid, config->vsid);
   383	
   384	err_fput:
   385		fput(filp);
   386		return ret;
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
