Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7931690E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 21:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472993; cv=none; b=rwLxq2tojj/nG6HK1dzSHNBp7ou466YeXScciThqhzMNP8APulZJ/2GA+IzYWJEe0afwbBXkldgavGHdy5nqd9oMKm74bZbrnY3FNTHOdxIAJNWQq8tgvrNUrA95X6/2JUCSZvCYHwDl13xOOhf7w3R7XiqOErE45vm+Z2UgenI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472993; c=relaxed/simple;
	bh=ZmSEIxubanQfA9hkiAVsLmP0w4h08bIfUo7jx7MVnnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EH74nIXVUsMa6k+16P0Hhn0fHUxUEi0kBAjB+LFziftJsMlI7FZI0jvhTdxhAxsy9SNNqzyCUwOgC9QgThQ5TTMBWuBYWlTnZ31ncXNI2yozNfEqifXLFvzzqtpF6kJJTXazgkh05zUM7Amd6R76sE6G45o2cICK6TFoDL1J2po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yi8ZxRpV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yi8ZxRpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774472992; x=1806008992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZmSEIxubanQfA9hkiAVsLmP0w4h08bIfUo7jx7MVnnU=;
  b=Yi8ZxRpVMeahVDwUzyw8mbC3QfBjw+O4pJ2h/HLuM2EUHYyeLt/FFC+Y
   kr9BrZCKZ8M7w6eRIJFi+u6KprpADk2TNg8Fd+ULOrGla0TxHvlX3Ba/D
   CFUN3Hq01IYd5W0W8DItbX3pE2PCEMiEpjTpNaB6lmRWMkfpKM4pGtJt4
   8xLYYZAoObbNy8IBWI6Qf0CxnNJr5oI/qKiAMgD4/3ChiJyv/TYEhjkPi
   uoO3Sl1HePr496H7c4IqFG8oVI+pY3Uwoh0HyZc9gUT0a8fdNLyMkzsfq
   HZ4Dy3+dA1xWcD2GoM1i8SfiJ2w2+uD2gHc35PCq2ZdiZ7B67WossiSHq
   g==;
X-CSE-ConnectionGUID: 6DoGAa4ARIycmw97DjN97w==
X-CSE-MsgGUID: N2POTOUFSaakTVYzJtJC4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="92900422"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="92900422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 14:09:35 -0700
X-CSE-ConnectionGUID: k2Y+9+ExQb6PuxQUVXqREA==
X-CSE-MsgGUID: +/d99mbGSrWbLPdQBb0gPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="218210904"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2026 14:09:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5VTo-000000007jF-1Eqv;
	Wed, 25 Mar 2026 21:09:32 +0000
Date: Thu, 26 Mar 2026 05:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <202603260538.la9LvRZQ-lkp@intel.com>
References: <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>

Hi Loic,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.0-rc5 next-20260325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Loic-Poulain/dt-bindings-media-qcom-Add-CAMSS-Offline-Processing-Engine-OPE/20260323-220343
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260323125824.211615-3-loic.poulain%40oss.qualcomm.com
patch subject: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing Engine driver
config: arm-randconfig-002-20260326 (https://download.01.org/0day-ci/archive/20260326/202603260538.la9LvRZQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260538.la9LvRZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260538.la9LvRZQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/platform/qcom/camss/camss-ope.o: in function `ope_gen_stripes':
>> camss-ope.c:(.text+0x1c42): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: camss-ope.c:(.text+0x1c62): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: camss-ope.c:(.text+0x1e32): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: camss-ope.c:(.text+0x1e54): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: camss-ope.c:(.text+0x1ea0): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/media/platform/qcom/camss/camss-ope.o:camss-ope.c:(.text+0x1ec0): more undefined references to `__aeabi_uldivmod' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
