Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844A6165F01
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 15:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736350419; cv=none; b=dmw25FWI8Sjob8/KjFWi6YglYkW52IdXpNFqI7QJM68Zor+1Hz77GA5PZpPOUcJulYNlxXAWz4RXWUBrlDVNN0DTIMOgBBcT8eFtlEKTqPNqGRYJio0G4+mNcJqZqFTgnUMiE522sfi4XAskkLKA1UXFZ/sffKBoDrtPb1UM5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736350419; c=relaxed/simple;
	bh=H8bybu3nVFvc27s/pwja9qq4SJvaRI3z+1uuiLFaxUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV3z5nrANHv4vb4esJzvyPrjPvOBzd9RW/mTiZSIxomQT/2HB73nhvYZZSQNNrfFxvAt0BI7DJqr1M3UyP5HU4ojIcAKsELBzAt4UoDtaCwGmTyTdzxRA0X8xcecXJKHarfnUV9e0gJkRVQyrSy1mgJobS5oHnAn+hcnzrmLDgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIwFxvHt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIwFxvHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736350417; x=1767886417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H8bybu3nVFvc27s/pwja9qq4SJvaRI3z+1uuiLFaxUg=;
  b=FIwFxvHtY9jJzTUA1smdWGz4bCrnovqodbcc5hWPKg3eek4khqmcDrj0
   Bj/urBEO6lKT8MiBvk3q4N3QlJ71+ExhY2WWegNk6uY2Y8JmH9rOC2nvG
   afQy7QomUbkZ1MYit2rlXvCnHIoIbEm7LREMSPWqWoVzeNvfX6NfOto+G
   T05BaimZpM39FZ1tZzcuuhTvipI2sldrmDxGoGA1UA3X9PEsoEkxTxBUd
   IAFqcITFme4A6oID8+Ib99J6qRUSosQvIc90Jfk3wGAB+hdI6Sd8GGOEf
   SpXk8TNKuYuvOkN8tEqLOtayk/FdzYoRulBe/DCBm30VbiXwu/LZuD3ji
   w==;
X-CSE-ConnectionGUID: h1pqymmiS+WmghXjgtB+FA==
X-CSE-MsgGUID: KuPzhXovRL6/U0Vkw/gFYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36603184"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36603184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 07:33:37 -0800
X-CSE-ConnectionGUID: fr4tmWjrQryj+qNdi1H9zg==
X-CSE-MsgGUID: oHN9T00CTjuW13pBKLi9/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140470551"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jan 2025 07:33:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVY3o-000GI3-0o;
	Wed, 08 Jan 2025 15:33:32 +0000
Date: Wed, 8 Jan 2025 23:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>, xuwei5@hisilicon.com,
	yangyicong@hisilicon.com, Jonathan.Cameron@huawei.com,
	wangjie125@huawei.com, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, prime.zeng@hisilicon.com,
	fanghao11@huawei.com, wangyushan12@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 2/2] soc cache: L3 cache lockdown support for HiSilicon
 SoC
Message-ID: <202501082340.1dunPeza-lkp@intel.com>
References: <20250107132907.3521574-3-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107132907.3521574-3-wangyushan12@huawei.com>

Hi Yushan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc6 next-20250108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-Add-framework-driver-for-HiSilicon-SoC-cache/20250107-213022
base:   linus/master
patch link:    https://lore.kernel.org/r/20250107132907.3521574-3-wangyushan12%40huawei.com
patch subject: [PATCH 2/2] soc cache: L3 cache lockdown support for HiSilicon SoC
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250108/202501082340.1dunPeza-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501082340.1dunPeza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082340.1dunPeza-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/hisilicon/hisi_soc_l3c.c: In function 'hisi_read_sccl_and_ccl_id':
>> drivers/soc/hisilicon/hisi_soc_l3c.c:456:21: error: implicit declaration of function 'read_cpuid_mpidr' [-Wimplicit-function-declaration]
     456 |         u64 mpidr = read_cpuid_mpidr();
         |                     ^~~~~~~~~~~~~~~~
>> drivers/soc/hisilicon/hisi_soc_l3c.c:457:20: error: implicit declaration of function 'MPIDR_AFFINITY_LEVEL' [-Wimplicit-function-declaration]
     457 |         int aff3 = MPIDR_AFFINITY_LEVEL(mpidr, 3);
         |                    ^~~~~~~~~~~~~~~~~~~~
>> drivers/soc/hisilicon/hisi_soc_l3c.c:462:21: error: 'MPIDR_MT_BITMASK' undeclared (first use in this function)
     462 |         if (mpidr & MPIDR_MT_BITMASK) {
         |                     ^~~~~~~~~~~~~~~~
   drivers/soc/hisilicon/hisi_soc_l3c.c:462:21: note: each undeclared identifier is reported only once for each function it appears in


vim +/read_cpuid_mpidr +456 drivers/soc/hisilicon/hisi_soc_l3c.c

   453	
   454	static void hisi_read_sccl_and_ccl_id(int *scclp, int *cclp)
   455	{
 > 456		u64 mpidr = read_cpuid_mpidr();
 > 457		int aff3 = MPIDR_AFFINITY_LEVEL(mpidr, 3);
   458		int aff2 = MPIDR_AFFINITY_LEVEL(mpidr, 2);
   459		int aff1 = MPIDR_AFFINITY_LEVEL(mpidr, 1);
   460		int sccl, ccl;
   461	
 > 462		if (mpidr & MPIDR_MT_BITMASK) {
   463			sccl = aff3;
   464			ccl = aff2;
   465		} else {
   466			sccl = aff2;
   467			ccl = aff1;
   468		}
   469	
   470		*scclp = sccl;
   471		*cclp = ccl;
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
