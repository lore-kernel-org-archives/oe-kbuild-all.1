Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BBD4A33
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960294; cv=none; b=B3YnoiNrVH2X+Xws1Zgsq63VjP0HyU88XRnMcYT05G2E71Aie9wkMafyAt/GgHceuttYtZ3BAfjchh0BqmznsSHKQyaIZc34f3L/9yzwQ3ZM0WxO8BzBf4k0Xebol4H3FLH2BlMXDmg7c+ButV6a4rA6Qce/aXZSNncptrwvPPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960294; c=relaxed/simple;
	bh=2LJyMlmvhwNm+yZvy5qPT4MRbOhQu9UJThK9bUvl1ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQQuv8Z87KM7LdS/fI/W+t/G8b1p3BNIe1Bs7Vp2m0t+NTzExNmNh7W4l5MO70LiHaY5+dkCDG+86/peWCcDs+hBSGQ57vZprrO4ns22rpwz1lI3oyWJ5nJaHKnN/+WWeHAFJWtnrUvD8PJaVdbGDNL5MJAdudUPb6nM1YkDJYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWbJ2Rgk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWbJ2Rgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750960293; x=1782496293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2LJyMlmvhwNm+yZvy5qPT4MRbOhQu9UJThK9bUvl1ao=;
  b=fWbJ2Rgk5OWpXHHbzzfOgWdKFml7RhtEtepgjJnPB+5TkxTbK1kRz0UT
   1zRQfL6jSOgTwwdAgSHXPdGkOFRBBBJvmg1mUOOqJkjmLeu9UDHJwJuGx
   Phw6BRi1otOXPoKtdfpt5XGZcW1pHAOdrqvz/gcTeSVnElY6ZONGPC1Dh
   JdjMglqyi4mBduoVKHU0mEhrIeG/rjVrl/oPrktrinh1G52pGxbZzKD4C
   C5rFAiiCQIhRSyphR2BjpBO48YxiNtiO9BEkmWj1Jb1Tbq+NMhvaIYzkI
   bTIeezsDjv3hbKjHG5Njn3kBpoXFGFGmKzhmoFloOnLSOeTV7/1TybOC0
   A==;
X-CSE-ConnectionGUID: sC0eyPrDRm2wEub6EcXZcQ==
X-CSE-MsgGUID: VeDRFy2+SFS2NSpBtnk50g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64622628"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="64622628"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 10:51:32 -0700
X-CSE-ConnectionGUID: zUsJSFaJSMKT7WNa+tLA5Q==
X-CSE-MsgGUID: fQFTMO9XRgOdXn+FLFuOvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="152336357"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 26 Jun 2025 10:51:31 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUqky-0000YZ-1I;
	Thu, 26 Jun 2025 17:51:28 +0000
Date: Thu, 26 Jun 2025 19:50:31 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, libai <libai12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] drivers/vhost/vdpa.c:589:16: error:
 call to undeclared function 'iommufd_ctx_from_fd'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202506270113.hqxVfK1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 6a58b8be556fb7de52ae0272a994a1c73fffc903 [2195/2195] vhost/vdpa: Add support to bind and attach iommufd
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250627/202506270113.hqxVfK1W-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270113.hqxVfK1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270113.hqxVfK1W-lkp@intel.com/

Note: the openeuler/OLK-6.6 HEAD c02455c4cce8052f74fc11c09e9073c01c7f33a4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/vhost/vdpa.c:589:16: error: call to undeclared function 'iommufd_ctx_from_fd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     589 |         iommufd_ctx = iommufd_ctx_from_fd(bind.iommufd);
         |                       ^
   drivers/vhost/vdpa.c:589:16: note: did you mean 'iommufd_ctx_from_file'?
   include/linux/iommufd.h:143:35: note: 'iommufd_ctx_from_file' declared here
     143 | static inline struct iommufd_ctx *iommufd_ctx_from_file(struct file *file)
         |                                   ^
>> drivers/vhost/vdpa.c:589:14: error: incompatible integer to pointer conversion assigning to 'struct iommufd_ctx *' from 'int' [-Wint-conversion]
     589 |         iommufd_ctx = iommufd_ctx_from_fd(bind.iommufd);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/iommufd_ctx_from_fd +589 drivers/vhost/vdpa.c

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
