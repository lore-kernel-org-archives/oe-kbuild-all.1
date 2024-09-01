Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02445127E18
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 20:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725222452; cv=none; b=prmQvzM4RvTLCt05Qe1V+JK/YNYRk3qj4D8sk4+aemT7Q41Y7Z00K53wAdqVGkGSEpwID6VicjYEorc3CZ7KzFFs618B2fc+1aliDjXfgi+ZgNxkN3TzqPDxHNazYk4kV+1gbFRPpVRgXFXw540qlDc03OtZJqECki6SioQ6VKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725222452; c=relaxed/simple;
	bh=SqRYSQqiRKNDJxoJo2eETRjSdiJW1YHogG+jf/9ukR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W2iz1vGU0olVsBBRqwfbqirK2zaa2fFoBeqyLH9LGfSahSTMG1xYjHBnZRDJcaj29UTYHOkUKLn92OBPnpg1TZoCRqGp0tmkUGLGUR2Ron1DeGtGqlOoppRQc6ZY4FS1RD+L51Yrk6WNc0jX/hAh6jdTfRBMEQcxqPUMqetiiTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xz0pOFot; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xz0pOFot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725222450; x=1756758450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqRYSQqiRKNDJxoJo2eETRjSdiJW1YHogG+jf/9ukR0=;
  b=Xz0pOFothnH5YzswqwVqGr2gSrHobiFoPDL08EdVi6U+4AprhVp8a2Qi
   GunrfNg3A5Wj8PHnwp4Bjnyj/imKvuXwxwTIeHnXRpz0BrFgaDBOwldgx
   hHBdjCAgYdDwAg+Jg+5uD8PJkxxlVIWtsr2yssOd81jSsX2Ol+pfznBgM
   8w24uiMq9UmZIGEHXXyzGsNq7Xr7CYS9uw998Imgv5id9ejou/exMcD4d
   GI8NCO6O7ECzwJ5/w5Qqylm0NLnFE0s5mHyVVA6G0YdRID4E6cM+SnJvA
   WxD5LNExlbSdnCB7V5aJnolHOloaJVNAk1flvqwShrOuW6NMGvPfPey9j
   Q==;
X-CSE-ConnectionGUID: a13RYzVyQnaFBI1A83iAbg==
X-CSE-MsgGUID: aK62LEWLSdKD0hP/9+SoKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23981290"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="23981290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 13:27:29 -0700
X-CSE-ConnectionGUID: gPoiUtrYQmej1NqsgdWK2Q==
X-CSE-MsgGUID: 1A5oqmJ6SKmxAwKNSV46Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="95228498"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Sep 2024 13:27:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skrAT-0004t7-27;
	Sun, 01 Sep 2024 20:27:25 +0000
Date: Mon, 2 Sep 2024 04:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Nate Watterson <nwatterson@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: [arm-perf:for-joerg/arm-smmu/updates 13/17]
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:56: warning: '%u'
 directive output may be truncated writing between 1 and 5 bytes into a
 region of size between 3 and 11
Message-ID: <202409020406.7ed5uojF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-joerg/arm-smmu/updates
head:   070e326f327a8d32669b5bf9b50a12c2cd8277ff
commit: 918eb5c856f6ce4cf93b4b38e4b5e156905c5943 [13/17] iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV
config: arm64-randconfig-004-20240902 (https://download.01.org/0day-ci/archive/20240902/202409020406.7ed5uojF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409020406.7ed5uojF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409020406.7ed5uojF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c: In function 'tegra241_vintf_alloc_lvcmdq':
>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:56: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                                        ^~
   In function 'lvcmdq_error_header',
       inlined from 'tegra241_vintf_alloc_lvcmdq' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:557:2:
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:32: note: directive argument in the range [0, 65535]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:9: note: 'snprintf' output between 25 and 37 bytes into a destination of size 32
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     238 |                  vcmdq->vintf->idx, vcmdq->idx, vcmdq->lidx);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c: In function 'tegra241_vintf_free_lvcmdq':
>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:56: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                                        ^~
   In function 'lvcmdq_error_header',
       inlined from 'tegra241_vintf_free_lvcmdq' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:531:2:
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:32: note: directive argument in the range [0, 65535]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:9: note: 'snprintf' output between 25 and 37 bytes into a destination of size 32
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     238 |                  vcmdq->vintf->idx, vcmdq->idx, vcmdq->lidx);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c: In function 'tegra241_vcmdq_hw_deinit':
>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:56: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                                        ^~
   In function 'lvcmdq_error_header',
       inlined from 'tegra241_vcmdq_hw_deinit' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:338:24:
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:32: note: directive argument in the range [0, 65535]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:9: note: 'snprintf' output between 25 and 37 bytes into a destination of size 32
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     238 |                  vcmdq->vintf->idx, vcmdq->idx, vcmdq->lidx);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c: In function 'tegra241_vcmdq_hw_deinit':
>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:56: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                                        ^~
   In function 'lvcmdq_error_header',
       inlined from 'vcmdq_write_config' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:244:24,
       inlined from 'tegra241_vcmdq_hw_deinit' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:341:6:
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:32: note: directive argument in the range [0, 65535]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:9: note: 'snprintf' output between 25 and 37 bytes into a destination of size 32
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     238 |                  vcmdq->vintf->idx, vcmdq->idx, vcmdq->lidx);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c: In function 'tegra241_vintf_hw_init.constprop':
>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:56: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                                        ^~
   In function 'lvcmdq_error_header',
       inlined from 'tegra241_vcmdq_hw_init' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:366:24,
       inlined from 'tegra241_vintf_hw_init.constprop' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:418:10:
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:32: note: directive argument in the range [0, 65535]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:9: note: 'snprintf' output between 25 and 37 bytes into a destination of size 32
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     238 |                  vcmdq->vintf->idx, vcmdq->idx, vcmdq->lidx);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c: In function 'tegra241_vintf_hw_init.constprop':
>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:56: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                                        ^~
   In function 'lvcmdq_error_header',
       inlined from 'vcmdq_write_config' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:244:24,
       inlined from 'tegra241_vcmdq_hw_init' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:375:8,
       inlined from 'tegra241_vintf_hw_init.constprop' at drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:418:10:
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:32: note: directive argument in the range [0, 65535]
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:237:9: note: 'snprintf' output between 25 and 37 bytes into a destination of size 32
     237 |         snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     238 |                  vcmdq->vintf->idx, vcmdq->idx, vcmdq->lidx);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +237 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c

   230	
   231	static inline char *lvcmdq_error_header(struct tegra241_vcmdq *vcmdq,
   232						char *header, int hlen)
   233	{
   234		WARN_ON(hlen < 32);
   235		if (WARN_ON(!vcmdq->vintf))
   236			return "";
 > 237		snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
   238			 vcmdq->vintf->idx, vcmdq->idx, vcmdq->lidx);
   239		return header;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
