Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3E8A937
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 05:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762493572; cv=none; b=bnvOyoABaX1fRTD1W6CJ6wXU6h6GOCiAtzVWVg+bypa6vd4fhiRNvU0DMUcrXhNx/fFN3Rp+qy7MPCg0nUINL02rVhSiCZkII/3rbh5M4mFKg56vA/POmOvbOB8/MI7y2F8sfO7bmr7m0bZHY/ECpAJ47ylxQScJ/z0aMr7wxHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762493572; c=relaxed/simple;
	bh=uPlH+fFnEngPnUpwovNCLNeNiEKo2KnZs58LJ3qR3bA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FIGFvhD9j3+mK5nJZUMPG9kRtKJlNQgX6NzNUnobcQPixWeFdl1QUk8u8JmGx4bTxI6iYX1tAIEPIHendp15AsA0UzD73QzY1MfblCMgqS8OPOAOjZWAnZfGisDf0aXgGXka+DWS1yny899/srLHlYqNEmhBTpa+f9cN1q2Kml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8mV7hII; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8mV7hII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762493571; x=1794029571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uPlH+fFnEngPnUpwovNCLNeNiEKo2KnZs58LJ3qR3bA=;
  b=Y8mV7hIIOGf+7tsG12rCf5cL+tLGrOshBZ/ZFPIonQS+6beGaHOV+ne/
   mCDlJzdqIhaV6vkHzYFe/H7IVlYOFAMAiOFLtNzK7wdBAxxtA9dWKlMrN
   wDaHICGl4xbHfpMvNSz4KKfTz4Kfsb8wxCrMxg99+DhZ1twFUCT0pey5I
   ScmX6wg0tZI6o61urvCPaviAEaJhq47t6GnSQ4cf43rAnVRXnMwklvHzk
   VoLE5gTpFVmBOepbmSwOGNLH5Vv3lAVI78Y+rbpcJ2GDAqKllxTb/l81U
   SRRIrdGDRe/3TXxx7AKw/SosnpKNpmReu/9THisJDgUYV1LPjXBy0CG9v
   A==;
X-CSE-ConnectionGUID: CPGkkjFhQXCzkhmGp0WoLg==
X-CSE-MsgGUID: JjrYhsFPShSwvL44Cu+HWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64567847"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64567847"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 21:32:50 -0800
X-CSE-ConnectionGUID: xU+3WeIXTmOkhQzD4UXSyQ==
X-CSE-MsgGUID: 87z8vLSkR2Kuqqt3ZWYKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="188117737"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Nov 2025 21:32:48 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHF5A-000Ujr-1Z;
	Fri, 07 Nov 2025 05:32:25 +0000
Date: Fri, 7 Nov 2025 13:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/interrupt.c:43:6:
 warning: no previous prototype for function 'ub_intr_init'
Message-ID: <202511071322.Zrq7tHrZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d92229e139bee35ce8e87e18db2e548549c94afd
commit: 1faf759d302206a8387d685808928c228c9aa306 [3075/3075] ub:ubus: Add MSI capability for UBUS driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251107/202511071322.Zrq7tHrZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511071322.Zrq7tHrZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071322.Zrq7tHrZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/interrupt.c:43:6: warning: no previous prototype for function 'ub_intr_init' [-Wmissing-prototypes]
      43 | void ub_intr_init(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/interrupt.c:43:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      43 | void ub_intr_init(struct ub_entity *uent)
         | ^
         | static 
   1 warning generated.


vim +/ub_intr_init +43 drivers/ub/ubus/interrupt.c

    42	
  > 43	void ub_intr_init(struct ub_entity *uent)
    44	{
    45		if (uent->cfg1_bitmap[0] & UB_INT_TYPE2_CAP_BIT)
    46			uent->intr_type1 = 0;
    47		else if (uent->cfg1_bitmap[0] & UB_INT_TYPE1_CAP_BIT)
    48			uent->intr_type1 = 1;
    49		else
    50			uent->no_intr = 1;
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
