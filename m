Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63274283CBF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549641; cv=none; b=ZkjSvWb9JVvU2PqpbFHEOrQ4OFgiWTqfEDOU3z07EgJNTYDxArMlRaoKMS27oGAxxFL2w7+FPu+PwjuzNJmAlnEaGQ7NU2dAPQKdJNxXnOYoyYqt1ha1zSsogP1UdH1mOgMEX/Z/1L+hbPjUdZtj20VEfyAoYGmFpF8TtutICEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549641; c=relaxed/simple;
	bh=vGIbwHVbDiarOFjBXbroBffEBhHyl/Irn/WEB5Q42K8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6IZ8Wd0SQZ/lutTPYJN8ekHYYWjLSx7lpM5vRqc1cC0oR4OmgNVusFw7JTckQxADZUw5Ncy9lKqng7eYyzU7CUUuAITyny9q559j5MCiDH/PJoyHIQb/GXOY8aTaQp6A1OB/rikbl+Ce3FSfc/9yBRoySzyS6AkvjX8HqgBvCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxpQccto; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxpQccto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746549639; x=1778085639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vGIbwHVbDiarOFjBXbroBffEBhHyl/Irn/WEB5Q42K8=;
  b=PxpQcctor8KzBckwWBew9XWSEvjFbdWI47FWxboF8jB/Fj0MVAOEkRdQ
   tydz6JCYUNiVsnmWQIo/b3OxlAEu+7855gvhSrfjXKRt94IFoyT16usZN
   pgFpo44SYdWb65zzy7rBfPQiJmskqq/XmoLSD0Cimc6AJ9ANpeLjTCc6w
   tlB/0vXiIzIUALgtbJreTb25PRq40d/8+jrQTioYqsl4f31vmKKajjoWo
   XX1w1fPOZpEhM8+0aZopJ5z15MYAjGgAJHUxL26nOlA6VeTlodNoVYvMO
   qSvlwV9liPZCijQyyToio4YLAZmKo8g+s7hOls/AvV850V6F/YSeFKy5s
   w==;
X-CSE-ConnectionGUID: WZXNxqvSSRuWajSI2AcURg==
X-CSE-MsgGUID: jx4lq7yBS7ix6KHELm9M0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59593862"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="59593862"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 09:40:38 -0700
X-CSE-ConnectionGUID: 0H91PmIWQ0ChcqqOI4l0ww==
X-CSE-MsgGUID: huwg74cbSQuJ1QgVyIZVGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135672354"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2025 09:40:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCLLP-0006hZ-2H;
	Tue, 06 May 2025 16:40:35 +0000
Date: Wed, 7 May 2025 00:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, libai <libai12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2200/2200] drivers/vhost/vdpa.c:589:23: error:
 implicit declaration of function 'iommufd_ctx_from_fd'; did you mean
 'iommufd_ctx_from_file'?
Message-ID: <202505070025.y1C68ZCV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9af1041f05d76435457d805d2d60c2aea1dc71f2
commit: 6a58b8be556fb7de52ae0272a994a1c73fffc903 [2200/2200] vhost/vdpa: Add support to bind and attach iommufd
config: x86_64-buildonly-randconfig-006-20250506 (https://download.01.org/0day-ci/archive/20250507/202505070025.y1C68ZCV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070025.y1C68ZCV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070025.y1C68ZCV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/vhost/vdpa.c: In function 'vhost_vdpa_bind_iommufd':
>> drivers/vhost/vdpa.c:589:23: error: implicit declaration of function 'iommufd_ctx_from_fd'; did you mean 'iommufd_ctx_from_file'? [-Werror=implicit-function-declaration]
     589 |         iommufd_ctx = iommufd_ctx_from_fd(bind.iommufd);
         |                       ^~~~~~~~~~~~~~~~~~~
         |                       iommufd_ctx_from_file
>> drivers/vhost/vdpa.c:589:21: warning: assignment to 'struct iommufd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     589 |         iommufd_ctx = iommufd_ctx_from_fd(bind.iommufd);
         |                     ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [y]:
   - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +589 drivers/vhost/vdpa.c

   576	
   577	static long vhost_vdpa_bind_iommufd(struct vhost_vdpa *v, int __user *argp)
   578	{
   579		struct vhost_vdpa_bind_iommufd bind;
   580		struct iommufd_ctx *iommufd_ctx;
   581		struct iommufd_device *idev;
   582		struct device *dma_dev = vdpa_get_dma_dev(v->vdpa);
   583		struct iommu_group *iommu_group = iommu_group_get(dma_dev);
   584		int ret = 0;
   585	
   586		if (copy_from_user(&bind, argp, sizeof(bind)))
   587			return -EFAULT;
   588	
 > 589		iommufd_ctx = iommufd_ctx_from_fd(bind.iommufd);
   590		if (IS_ERR(iommufd_ctx))
   591			return PTR_ERR(iommufd_ctx);
   592	
   593		if (v->domain) {
   594			iommu_detach_device(v->domain, dma_dev);
   595			iommu_domain_free(v->domain);
   596			v->domain = NULL;
   597		}
   598	
   599		/**
   600		 * Default iommu domain is created when vdpa device driver probes.
   601		 * Unuse default domain first to avoid failure when claiming dma owner.
   602		 */
   603		if (dma_dev->bus && dma_dev->bus->dma_cleanup)
   604			dma_dev->bus->dma_cleanup(dma_dev);
   605		ret = iommu_group_claim_dma_owner(iommu_group, iommufd_ctx);
   606		if (ret)
   607			goto dma_configure;
   608	
   609		idev = iommufd_device_bind(iommufd_ctx, dma_dev, &bind.out_devid);
   610		if (IS_ERR(idev)) {
   611			ret = PTR_ERR(idev);
   612			goto release_owner;
   613		}
   614		v->iommufd_dev = idev;
   615	
   616		if (copy_to_user(argp, &bind, sizeof(bind))) {
   617			ret = -EFAULT;
   618			goto unbind;
   619		}
   620	
   621		goto out;
   622	
   623	unbind:
   624		iommufd_device_unbind(v->iommufd_dev);
   625		v->iommufd_dev = NULL;
   626	release_owner:
   627		iommu_group_release_dma_owner(iommu_group);
   628	dma_configure:
   629		if (dma_dev->bus && dma_dev->bus->dma_configure)
   630			dma_dev->bus->dma_configure(dma_dev);
   631	out:
   632		iommufd_ctx_put(iommufd_ctx);
   633		return ret;
   634	}
   635	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
