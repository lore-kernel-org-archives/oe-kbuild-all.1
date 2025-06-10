Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C5A28030F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554043; cv=none; b=lqoOSQ2s8y2M6vFvBDMmscRjLAFBDIXQcqhFK8rwRa1r4UN41dbxCQxRQj+Bhgkz9NDaEqmEmyZfUqd2m8ccOhbF9zP1X9T1piU2BoauZRwjDNZfkg3IIak4Uc8PMdRJm5vTAvxsnmpFefD5i/gJTlKZu4ZIWOqw0Otq6hr/esY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554043; c=relaxed/simple;
	bh=vUAfT+jaX4CiNvLz19ZwFGD3Yrkce6Iaj+byqA1edtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJFBFnmnd4588IorVuYx7YaMz2WOZVbCqiwpFgFJoD+3htl0Yg4Lx0Y0NA1T7EhfICCWsTTuR2Kicm36ZFAjH0Kh+9LxsPwIT/GX1S/IWtOL8hDwJJkfKBCoQ9hreWC8wg2U69AvtnJgo6x7Hjbdlo/vTbhLcVLUFegmEmJSld4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5fEGinN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5fEGinN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749554041; x=1781090041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vUAfT+jaX4CiNvLz19ZwFGD3Yrkce6Iaj+byqA1edtc=;
  b=F5fEGinNd8Y2OJLBPmXh7ZifA0IYncMayUoQyPCSIgWkAKoMLAUPhVdg
   pA2ZL7Ylf0tDvYWFCOC8GnNE9HQ5iMF+l454ORjxK52JwPHaPWHBgmdoJ
   SJNZL0v1pDNo/YRJG3xdKcRswa98/JUciDxRoOSTEhYqs8IWPIrxuvW7d
   PplqS1bnwnCa6MEpe34p4SuSb4X2X8mWxxd7T9+HpVUZbgb4TQQaIsiqO
   49h99q/EYqP51l5aEvOhGGqZSETUhujRZ2cjbF1in0ijucFKmgQ99I5yi
   ObNWn9pSAZWXfrXoLO4He8axASnW/jwIAW5/OKMcJXoNg93ddeLqPclzV
   Q==;
X-CSE-ConnectionGUID: 9IGPVQlgRsaamB80NydqSg==
X-CSE-MsgGUID: RaIQ2jvcSi245CCA3GNlbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69099668"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="69099668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 04:14:01 -0700
X-CSE-ConnectionGUID: xgbIFgn1SP2pE9plUtwSyQ==
X-CSE-MsgGUID: VNTVoO6oR5qwC6Nz7T7KwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147743663"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2025 04:13:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOwvV-00087d-2N;
	Tue, 10 Jun 2025 11:13:57 +0000
Date: Tue, 10 Jun 2025 19:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v1 1/2] iommu: Introduce iommu_dev_reset_prepare()
 and iommu_dev_reset_done()
Message-ID: <202506101933.MWvZALLx-lkp@intel.com>
References: <4153fb7131dda901b13a2e90654232fe059c8f09.1749494161.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4153fb7131dda901b13a2e90654232fe059c8f09.1749494161.git.nicolinc@nvidia.com>

Hi Nicolin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.16-rc1 next-20250610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommu-Introduce-iommu_dev_reset_prepare-and-iommu_dev_reset_done/20250610-024659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/4153fb7131dda901b13a2e90654232fe059c8f09.1749494161.git.nicolinc%40nvidia.com
patch subject: [PATCH RFC v1 1/2] iommu: Introduce iommu_dev_reset_prepare() and iommu_dev_reset_done()
config: arm-randconfig-002-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101933.MWvZALLx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101933.MWvZALLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101933.MWvZALLx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/iommu/iommu.o: in function `iommu_dev_reset_done':
>> iommu.c:(.text+0x1320): undefined reference to `lockdep_is_held'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
