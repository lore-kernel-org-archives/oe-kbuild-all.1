Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B390221DB4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604740; cv=none; b=oBzg9a2KnemqofOQ3uvAFLT13Zu+PC5zOMyNejiajm+Xu9tz+46ywPFtmhXj7BRRwiM2ZGxQh/44MYytsCT+LqJneAvXCH7aV9t096s4L0XbkHoiuHo+VLdW9drQEBrU3XFqYJWSjoe0F/3GLCC7KVC1htWL+CNcII+ziiFEaag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604740; c=relaxed/simple;
	bh=GFTmPbTqMikgo5v/AloWY7RXIxfzIDqPK7izTppTy20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qdVQny1T9/bmj0HGvZd+k4KHvdaZ+RaPceY5mEjluikGl39VLMzX5SmM0B1LjPYcX4Yo/+IHaSx6zjVd8jLaRnjPrfu31O2gh/LDsD300NWN+3uzPqCsKpruxx0FJI20Sc6peinpBYZTGeOhISeIjgA0rmJrpTuwUwGhD3LgOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXr+l+I9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXr+l+I9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746604738; x=1778140738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GFTmPbTqMikgo5v/AloWY7RXIxfzIDqPK7izTppTy20=;
  b=PXr+l+I9Ss8bPB6cIx4QvaIkLLaCBfiz6v59uZ7VQLQl41jHJD/HSQQi
   WgxMk2R9AhkiseKRk97c0IWQinLJboxXyLo+KKNXUcdNBWSpR77jbBPAT
   lOY9y9RzJDuFmQB7N0jn6/idQFrvkQJDnHoMaWI2j+dLnz/Qmm8LinsBG
   1In6LdACbHFyhfgjQ1135PSkEBgEOKX1IbYolePBqGOL9zQQT92N0sqSR
   rjraDBfSdM/4wscohs8h6dWSZ0Zv+IJeu2luQqucOnp2qGFzJJNaZ0E/C
   dhvVE8uQmiEoh1QuRuz6pVtY3WIQHFZnne7c4RU5HVXjEnRC9sO/xH5+U
   w==;
X-CSE-ConnectionGUID: dswKsm+nSQueYPdsnNXwoA==
X-CSE-MsgGUID: 3jcTi8akS6619C3f3+5udA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65727561"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="65727561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:58:57 -0700
X-CSE-ConnectionGUID: 0clyParNR0yP2tIa6Yy/yA==
X-CSE-MsgGUID: omILuKEDSS6Ogy24tgPPZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140619522"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 00:58:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZg6-0007N7-2M;
	Wed, 07 May 2025 07:58:54 +0000
Date: Wed, 7 May 2025 15:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/syscon-phandle-args-iommu 4/4]
 drivers/iommu/mtk_iommu_v1.c:512:28: warning: variable 'data' set but not
 used
Message-ID: <202505071512.GpxYXmXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/syscon-phandle-args-iommu
head:   2ffacca9e16ae5a4cf942a7bd5756c2d9903a45e
commit: 2ffacca9e16ae5a4cf942a7bd5756c2d9903a45e [4/4] iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable
config: arm64-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071512.GpxYXmXf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071512.GpxYXmXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071512.GpxYXmXf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: note: -Wvla-larger-than=0 is meaningless
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_v1_probe_finalize':
>> drivers/iommu/mtk_iommu_v1.c:512:28: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     struct mtk_iommu_v1_data *data;
                               ^~~~


vim +/data +512 drivers/iommu/mtk_iommu_v1.c

57dbf81f50c82a Joerg Roedel        2020-04-29  509  
ad9b10e533f6fb Yong Wu             2022-05-03  510  static void mtk_iommu_v1_probe_finalize(struct device *dev)
57dbf81f50c82a Joerg Roedel        2020-04-29  511  {
ad9b10e533f6fb Yong Wu             2022-05-03 @512  	struct mtk_iommu_v1_data *data;
57dbf81f50c82a Joerg Roedel        2020-04-29  513  	int err;
f3e827d73ed454 Yong Wu             2018-01-26  514  
3524b5592cad63 Joerg Roedel        2020-03-26  515  	data        = dev_iommu_priv_get(dev);
f3e827d73ed454 Yong Wu             2018-01-26  516  
2ffacca9e16ae5 Krzysztof Kozlowski 2025-05-01  517  	err = arm_iommu_attach_device(dev, data->mapping);
57dbf81f50c82a Joerg Roedel        2020-04-29  518  	if (err)
57dbf81f50c82a Joerg Roedel        2020-04-29  519  		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
b17336c55d8928 Honghui Zhang       2016-06-08  520  }
b17336c55d8928 Honghui Zhang       2016-06-08  521  

:::::: The code at line 512 was first introduced by commit
:::::: ad9b10e533f6fb3fa74afdc2341774b1305c176f iommu/mediatek-v1: Just rename mtk_iommu to mtk_iommu_v1

:::::: TO: Yong Wu <yong.wu@mediatek.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
