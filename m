Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7740B1CCB50
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 22:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729634713; cv=none; b=ONz6fRorwt9rpNVBRht++cpE+eqIn+jZwesv9bpxhhONPUu3Ta75dj+RwVMxUZPc2ComB7cle3+QkKGagU9VaaoR7AL7lAEAF0OKoWbSqMA77c6iEfI2XhKmMIg1MMenMMtaesLwA5zfHvf4yGUXDxfpVzY+UNqkUYXAX3xqPOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729634713; c=relaxed/simple;
	bh=Xjp80yp69NlWwn8pPCLTczH/Vr2qi4MNNQeDAof+pQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onndgev5FVVrqCVP/xsUlqq7b1WohZsTPtZjYTyJafjJAFcW5qwdIpJ1pGw4a4iOaSDVHPxTIJmhBWM5PWHZdTWFwja/6zpPQB4DozwIYU12qAQ3sRwlaMpgl1+osVZ0CXJNst1e61+7+XrlVt1/n97Nuf1mW9JRJ6YbzxfDrhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E56wzb/Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E56wzb/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729634712; x=1761170712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xjp80yp69NlWwn8pPCLTczH/Vr2qi4MNNQeDAof+pQo=;
  b=E56wzb/Yeh7btz/1zDdOO5/URvY6yw1fqYZjrMuKimMQ9claqkf14QMS
   buuJecoLFNRfDbbuCS5FEBm9NosdVJsHBGQVrAcxPqeScyDk91TPfUNAO
   FI5w52sS2nbPF6/lVko5u5SCg2MeC4c/GNWHfNVYdIuPVdFK/CYJE6gqt
   TV9NL1t05IVo78wadB0lWvhuSb+U3YnNBlBUuSEzRkgi3nWgOsbtPHHCZ
   G/uWQGqgzRavBpkbN80JLMppxenwlnUApkujjc8s6b0gEkH0CjpEiZO57
   tsCeqz1JKw+scOeQnOiAjkSkcrCwFBu5Do0xpU7sBrzL3H7bjzovQyYTL
   g==;
X-CSE-ConnectionGUID: yxt1KSzzSM20jUOpPwzOLQ==
X-CSE-MsgGUID: HIzpBRqaRhOiSydTWeAyGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46660836"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46660836"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 15:05:11 -0700
X-CSE-ConnectionGUID: J/3gP+/aTgCr/QvzTww+VA==
X-CSE-MsgGUID: cikLTbcBTr2j796O1YWYFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="110800194"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2024 15:05:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Mzx-000U9o-1P;
	Tue, 22 Oct 2024 22:05:05 +0000
Date: Wed, 23 Oct 2024 06:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1866/2444]
 drivers/dma/idxd/init.c:493:17: error: implicit declaration of function
 'iommu_enable_pasid_dma'
Message-ID: <202410230651.hXei5EO8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 037b509f6a47c89997dd196a8a7b034e4844d1bb [1866/2444] dmaengine: idxd: Use DMA API for in-kernel PASID DMA
config: x86_64-randconfig-102-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230651.hXei5EO8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230651.hXei5EO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230651.hXei5EO8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/iommu.h:16,
                    from drivers/dma/idxd/init.c:18:
   include/linux/ioasid.h:214:51: error: unknown type name 'ioasid_set_type'
     214 |                                                   ioasid_set_type type)
         |                                                   ^~~~~~~~~~~~~~~
   drivers/dma/idxd/init.c: In function 'idxd_enable_system_pasid':
>> drivers/dma/idxd/init.c:493:17: error: implicit declaration of function 'iommu_enable_pasid_dma' [-Werror=implicit-function-declaration]
     493 |         pasid = iommu_enable_pasid_dma(&idxd->pdev->dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/idxd/init.c: In function 'idxd_disable_system_pasid':
>> drivers/dma/idxd/init.c:505:9: error: implicit declaration of function 'iommu_disable_pasid_dma' [-Werror=implicit-function-declaration]
     505 |         iommu_disable_pasid_dma(&idxd->pdev->dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iommu_enable_pasid_dma +493 drivers/dma/idxd/init.c

   487	
   488	static int idxd_enable_system_pasid(struct idxd_device *idxd)
   489	{
   490		u32 pasid;
   491		int ret;
   492	
 > 493		pasid = iommu_enable_pasid_dma(&idxd->pdev->dev);
   494		if (pasid == INVALID_IOASID) {
   495			dev_err(&idxd->pdev->dev, "No DMA PASID %d\n", ret);
   496			return ret;
   497		}
   498		idxd->pasid = pasid;
   499	
   500		return 0;
   501	}
   502	
   503	static void idxd_disable_system_pasid(struct idxd_device *idxd)
   504	{
 > 505		iommu_disable_pasid_dma(&idxd->pdev->dev);
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
