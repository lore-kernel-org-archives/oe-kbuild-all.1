Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07492907
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 00:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709596952; cv=none; b=aARVhoknTMadEo1+mVjvjoTfXLImJ1316QDWt9IUHcy9x8uEtn7OcW2ao3QqymmAxprgoaWWd+vOfAkecnx3FKW/X4IN6ayDK/KH86Bc6/8DIYuaya+LDf5YtrjPP1NKpBN0hZrJ+wJwCCL2a8fgSGdv3QIF/N96qKxcRbs6cgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709596952; c=relaxed/simple;
	bh=ZvRMc0BS9/LuVfEwNzp+RO71hsjWZAb/YIZP8Y+FbLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2EodQsEnuQl74BUlSsv+NioM26IpjkAVpGJUBGIKxj8odfeTV9Bjoxs3xCqb7wYRFVoAWT00RHXAI+eIYmaLjmuJNGwUO6IEx8GhdhbLmrpu+T68kZ4iJB3l97uLzhnOFXSnJfeXlcGjHcCvfTdzO4D0N0bfaHBnMwm2AoKeV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9XtsuQb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9XtsuQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709596951; x=1741132951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZvRMc0BS9/LuVfEwNzp+RO71hsjWZAb/YIZP8Y+FbLw=;
  b=R9XtsuQbK955z4QSW1QYVZA7ocQS+GUlfQO3RSIurVx92x3dgDNZUOrS
   2Q4CeJ2cLj4BKrcLWmq+pYAOlbJ9Ix/3Z93ercj8+Zl4fSiz6NkinK/oB
   RsJOu7Gpyh9jVBZYXvzXZ93JnIGlmE0/1pGNK/lI1EtL3iH1Xt8oSdKZ4
   nUW15q7K3VpApJ/cyNXcmr1o2RRVYDcKaOWgWdCrPxJJR1DTDxM3WXQrO
   +xX7Svxbgr+Ohg9hdF1QvkSad+1ULrDm+EjNXHv7pvog8gFEo7EIwegWc
   FTGiwLOFaCNwqBmK7ZxE4CMt6LVQxeKdWGGGWGqBDw9a7Bf+leeMIifcd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15551672"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="15551672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 16:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9343341"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Mar 2024 16:02:25 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhIGE-0002qd-2s;
	Tue, 05 Mar 2024 00:02:22 +0000
Date: Tue, 5 Mar 2024 08:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/dma/idxd/init.c:493:17: error: implicit declaration of
 function 'iommu_enable_pasid_dma'
Message-ID: <202403050716.r16Fv1cM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 546e294f9aae92ef7987b336ed27ab033b3040f4 dmaengine: idxd: Use DMA API for in-kernel PASID DMA
date:   9 months ago
config: x86_64-buildonly-randconfig-005-20240305 (https://download.01.org/0day-ci/archive/20240305/202403050716.r16Fv1cM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050716.r16Fv1cM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050716.r16Fv1cM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/dma/idxd/init.c:5:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/init.h:5,
                    from drivers/dma/idxd/init.c:3:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
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
