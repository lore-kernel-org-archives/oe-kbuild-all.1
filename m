Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871752914
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 02:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737598245; cv=none; b=ARx68p8VJYMZK6KWcHCDP5Buh1lbZQzVfZar5MH5gvgjZUiYhLCTT+eYheSU/nuG8TinDmLchmt7LD2iyVFTwpzTvMCozmXD7CgWxIygZWGCAZzJFE2Dx3sUBc/kKP4464cBHsDEe5n8IY6uhQFzMXm9+cDjA2wsHG9PLgOYazA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737598245; c=relaxed/simple;
	bh=YjSG446FTvCJweSF3NrdN7+t8+WLI0W+hnHlpRheVjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPO+E5t60bXTl7y/f/4q6hK/5/RCYdJBjKPZpGkNqXcgdrDPkNqY9a3v73j0jwBJc1cvgY9HRloE/0ygOQIoA3nM9IPByJT57YFb0UD+6QMp+yOMuAMtbcVRA24ohfHszyCYFCGISXFzLAV89g/oB0MLaoEJ0dDox8qTTqYUkQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ug/TTbg0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ug/TTbg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737598243; x=1769134243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjSG446FTvCJweSF3NrdN7+t8+WLI0W+hnHlpRheVjs=;
  b=Ug/TTbg0jxLGRQi2TyIEqgIwtz73a/DrPMqjSMbTb5+z5VMpu9MBZMd/
   Gd9Hxe1MlwXdAtSk5oRm1Nfbj5cTkm2kJ6ebfPEmrQGfDqe3JY2R5qoh9
   jo/5VJUlynyunzlwzMvBXMbaVH5CTw6UqZ6yb0Cm/FaTIg2Tv1X8HyXy7
   ZZD/YSo0M7ELepfLbE6BnRkTUM6mxawQqJprS7QwUDXGsRvqNjn+IihU4
   EsdIYtPY/zMocoN30NsvtLGTxkwzAbeO6/H5RIA19AO6VXzN7ALIV8q3H
   mc/40hCQKRJJwaoWPEmbbv5is/sJ0FA5pkkG8/hqrr7B7z+q9U2WefVhd
   g==;
X-CSE-ConnectionGUID: Jo7ccM0NSlGVrL31EvmVjw==
X-CSE-MsgGUID: NGffJU1hSnW15hAlbspDpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="40908657"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="40908657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 18:10:42 -0800
X-CSE-ConnectionGUID: XGuwjfTeS1Ky3nVjJjx0Ig==
X-CSE-MsgGUID: T8jqsQBUS/SGHvAvQelKfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="112346971"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Jan 2025 18:10:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tamg0-000aXZ-1S;
	Thu, 23 Jan 2025 02:10:36 +0000
Date: Thu, 23 Jan 2025 10:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/iommu/intel/svm.c:1260:29: warning: variable 'dmar_domain' set but
 not used
Message-ID: <202501231000.tJpdVJur-lkp@intel.com>
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
commit: e5bce0398cb6abc96d88265486f2fe9a89320c3a [2441/2441] iommu/vt-d: Check pasid ownership in intel_svm_page_response
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250123/202501231000.tJpdVJur-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231000.tJpdVJur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231000.tJpdVJur-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from arch/x86/include/asm/paravirt.h:15,
                    from arch/x86/include/asm/irqflags.h:72,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rbtree.h:22,
                    from include/linux/iova.h:14,
                    from include/linux/intel-iommu.h:14,
                    from drivers/iommu/intel/svm.c:8:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/iova.h:13:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/iommu/intel/svm.c: In function 'intel_svm_page_response':
>> drivers/iommu/intel/svm.c:1260:29: warning: variable 'dmar_domain' set but not used [-Wunused-but-set-variable]
    1260 |         struct dmar_domain *dmar_domain;
         |                             ^~~~~~~~~~~
   drivers/iommu/intel/svm.c: At top level:
   drivers/iommu/intel/svm.c:41:13: warning: 'pasid_private_remove' defined but not used [-Wunused-function]
      41 | static void pasid_private_remove(ioasid_t pasid)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/svm.c:35:12: warning: 'pasid_private_add' defined but not used [-Wunused-function]
      35 | static int pasid_private_add(ioasid_t pasid, void *priv)
         |            ^~~~~~~~~~~~~~~~~


vim +/dmar_domain +1260 drivers/iommu/intel/svm.c

  1253	
  1254	int intel_svm_page_response(struct iommu_domain *domain,
  1255				    struct device *dev,
  1256				    struct iommu_fault_event *evt,
  1257				    struct iommu_page_response *msg)
  1258	{
  1259		struct iommu_fault_page_request *prm;
> 1260		struct dmar_domain *dmar_domain;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
