Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E847E14BFBF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722553801; cv=none; b=ccB6Ouei6oGtrHAPL4OrH9dI/RoYQ6bKMXlI5Gbrt7kqFUmZAh5fftbb/kvCAtt8uqxTIlr2+1uL+sYfmZ66Gz71kq7ki/LjRlxHE4T5+wWhRSZVlBt2Sxv7IJDVjLas6ehrP3vUZHw2Bxsp8IXZojphT8T42vHS/AqsDMTD5WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722553801; c=relaxed/simple;
	bh=oQhyiiRakrpcvmfJckAXhy6OBw+JAobt9aYJSCdzFFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RX3pCkmp4oB6aK6l5GSkfltv1GpgMpgH2jdNFcG5i0BuP1pTkrNu33QT3ykpFf5KaM7TElecU63AqwsYrj9MPjANfGteCMGqEucQ34kbArJtmkz19rEet9cpCvqakYQkm1SN/Zaj7ccjxmisQUTsaz9gLdxC4IPrayZTwPL4BJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyN0uGhn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyN0uGhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722553799; x=1754089799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQhyiiRakrpcvmfJckAXhy6OBw+JAobt9aYJSCdzFFQ=;
  b=hyN0uGhnqvrcpe5HuO8/UHvBPlitFz5Lp5ex9oX4jkC1dJpRJKxrPUVK
   pAGPxecMHD/xxlwllUiG9OarLEw4ALSgIHBFoP4V2iDZZWMJkq4IbLo2O
   w+ocEbNrmkHXcGDO4tkHofhcA+W15VKzZqBvjI0RpQWRTF8ko81cOqBwA
   gaPwRtiWuFURcDK9+9mlQ76UySGuvlLc9CjgoYDCWCfOoOwkIQ/P0f5WH
   6diFbekmi/HPzzAcFV111Zm/O0DjEKBZjn4fe1cQOVJbbG3zoNSy3rpX7
   ejYWtruVo5/DZkn4TR+UvqbY0KyV2bl8fKvDqeBdMRkt/QUpdmSlmru3/
   g==;
X-CSE-ConnectionGUID: S/nCOyqwSzyy8JlqVFjXew==
X-CSE-MsgGUID: Z1A1pvb9QXmCGAvXf/JlZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31948832"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="31948832"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 16:09:54 -0700
X-CSE-ConnectionGUID: YzQTjFnWSAqeh3gWqz3yGw==
X-CSE-MsgGUID: pLJQns/TQvSk8uI7l7LOig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="60231116"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2024 16:09:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZevf-000w7O-0T;
	Thu, 01 Aug 2024 23:09:51 +0000
Date: Fri, 2 Aug 2024 07:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/midr-cleanup 8/8]
 drivers/char/hw_random/cavium-rng-vf.c:41:54: error: 'MIDR_THUNDERX_83XX'
 undeclared
Message-ID: <202408020731.jaF26ELC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/midr-cleanup
head:   73db361e3b8efa037e9ab62740b8a67e095778f1
commit: 73db361e3b8efa037e9ab62740b8a67e095778f1 [8/8] WIP: delete unused MIDR definitions
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240802/202408020731.jaF26ELC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020731.jaF26ELC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020731.jaF26ELC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/hw_random/cavium-rng-vf.c: In function 'is_octeontx':
>> drivers/char/hw_random/cavium-rng-vf.c:41:54: error: 'MIDR_THUNDERX_83XX' undeclared (first use in this function)
      41 |         if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
         |                                                      ^~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cavium-rng-vf.c:41:54: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/char/hw_random/cavium-rng-vf.c:44:54: error: 'MIDR_THUNDERX_81XX' undeclared (first use in this function)
      44 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
         |                                                      ^~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/cavium-rng-vf.c:47:54: error: 'MIDR_THUNDERX' undeclared (first use in this function)
      47 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
         |                                                      ^~~~~~~~~~~~~


vim +/MIDR_THUNDERX_83XX +41 drivers/char/hw_random/cavium-rng-vf.c

cc2f1908c6b8f6 Omer Khaliq   2016-08-23  38  
680efb33546be8 Sunil Goutham 2021-10-29  39  static inline bool is_octeontx(struct pci_dev *pdev)
680efb33546be8 Sunil Goutham 2021-10-29  40  {
680efb33546be8 Sunil Goutham 2021-10-29 @41  	if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
680efb33546be8 Sunil Goutham 2021-10-29  42  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  43  				    MIDR_CPU_VAR_REV(3, 0)) ||
680efb33546be8 Sunil Goutham 2021-10-29 @44  	    midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
680efb33546be8 Sunil Goutham 2021-10-29  45  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  46  				    MIDR_CPU_VAR_REV(3, 0)) ||
680efb33546be8 Sunil Goutham 2021-10-29 @47  	    midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
680efb33546be8 Sunil Goutham 2021-10-29  48  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  49  				    MIDR_CPU_VAR_REV(3, 0)))
680efb33546be8 Sunil Goutham 2021-10-29  50  		return true;
680efb33546be8 Sunil Goutham 2021-10-29  51  
680efb33546be8 Sunil Goutham 2021-10-29  52  	return false;
680efb33546be8 Sunil Goutham 2021-10-29  53  }
680efb33546be8 Sunil Goutham 2021-10-29  54  

:::::: The code at line 41 was first introduced by commit
:::::: 680efb33546be8960ccbb2f4e0e43034d9c93b30 hwrng: cavium - Check health status while reading random data

:::::: TO: Sunil Goutham <sgoutham@marvell.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
