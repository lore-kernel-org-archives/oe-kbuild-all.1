Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33F53EA98
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 03:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730518756; cv=none; b=WTiymEbRBAQI4BfY8+GgwHpmWG/2mtZQpLkc0pfvD6P8tT7aMCpShCd1CeKWBNA9q1qmGSkqN95R7El6JL6yrPSTSh5mrA/e24ETe/3bo2mkgyvRntSpR5J+8fEEtzhUa4xKbXa+w8blg0JboDaQckvYmZwyCHizX3ivu3oI3Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730518756; c=relaxed/simple;
	bh=Qf7EKLj/B+XhzE5+efZL4vQu+rnXFCp30CucFVVSruk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RAEJwqQefF+wdJhDFurd6fWdQNgcwVI3U0ETt2W5UT0Zs2k16nIWxaHLwq4TMbCXxjGuTU1SZpKoRaTv4KR3gid3wJP2l9uXa0mex6/6/jBCglOkyDeRlnQhFxRUgYE+YwhESVObUU2YhWJbBOw/zfFhxs5+lP6CX1KhB9Gf6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxR3fw4N; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxR3fw4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730518754; x=1762054754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qf7EKLj/B+XhzE5+efZL4vQu+rnXFCp30CucFVVSruk=;
  b=JxR3fw4N8MqlA5eplBReVx9MOphDufwHTSsGcpGu1thnifC2mv2CrVJZ
   NMIZpo8uvbAJPMXsTVcXmAdpUTSngMuBbsUP6P8zQF2Jdgm8t46jcGyHf
   1T95NSOh/kzY0ycfH1ZAk5M71GJ7TBseTo6IqNCD76kGdxaB9sNAmLMRQ
   JUuSjMZ90Ur6C39rryUklTxVIGRHdjL9RCXz4uGTJGYKy1crAW3fteGBD
   Uzf7hdMAocNxyWyn5DYBEMO3iVo5AWxxw5vFkk6gJ1I8FTF4Cfb+j8Yqq
   RK7LJpwy0H3B6FbIBChhLDzQN7NajUyhynVMDzx+SKw9jIS64fAKKlQIU
   A==;
X-CSE-ConnectionGUID: NdOSqsviTBajGyzfOoiLjQ==
X-CSE-MsgGUID: eANzfx8PRR6T2N0rsvrw5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="29711738"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="29711738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 20:39:14 -0700
X-CSE-ConnectionGUID: XD3NrewGSjGyaaD9hfxdWg==
X-CSE-MsgGUID: npNQHHwDTDOUZFBFuO9bfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="87744493"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Nov 2024 20:39:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t74yl-000iN3-0i;
	Sat, 02 Nov 2024 03:39:11 +0000
Date: Sat, 2 Nov 2024 11:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20241101 2/57]
 init-mm.c:(.text+0x0): multiple definition of
 `iommu_paging_domain_alloc_flags'; kernel/fork.o:fork.c:(.text+0x752): first
 defined here
Message-ID: <202411021131.ZDCJVxlL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20241101
head:   96a6bacf52e9104ff2ad3f9fd356325a88efe276
commit: da9c8ba14267921a8fdce17e19d349faed4405af [2/57] iommu: Introduce iommu_paging_domain_alloc_flags()
config: riscv-nommu_k210_defconfig (https://download.01.org/0day-ci/archive/20241102/202411021131.ZDCJVxlL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021131.ZDCJVxlL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021131.ZDCJVxlL-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: mm/init-mm.o: in function `iommu_paging_domain_alloc_flags':
>> init-mm.c:(.text+0x0): multiple definition of `iommu_paging_domain_alloc_flags'; kernel/fork.o:fork.c:(.text+0x752): first defined here
   riscv64-linux-ld: drivers/base/platform.o: in function `iommu_paging_domain_alloc_flags':
   platform.c:(.text+0xe70): multiple definition of `iommu_paging_domain_alloc_flags'; kernel/fork.o:fork.c:(.text+0x752): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
