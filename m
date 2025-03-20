Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C971626AF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 04:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742444304; cv=none; b=lL39zP88LLp0q1NcVuKKUyC0/CHE6KbiP5eXUbx+QReEn6zMVRpyVRUijNi06suqSP7s2RZgT1Or35N5BEKyVg4Nagi4LNzRBy39/LKvrN4ewq1sPBJYV/i2D7J5LJarF3nlV2/01wlr0SABIV/RhItWLSyIQt0S3ZkOWg5RUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742444304; c=relaxed/simple;
	bh=xN1k9E4FL+UJ3e1igWQgGHDF7fpFNbCGXSsfqzCmxM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djHBNXhkssevmgMVjUuCAF7sWdj5b+gN4Wkv0FlkuP43kQEdUTlwN/Z/tF1iDqTekOi1Ci6KzkKge/NPn3vx2p+NFux8Gst3CQOQzxeBbubI2IPlpVXWO8mECYajlnpo/zlR2zE76Husc4SDBZkuE1mUL1M7qc6Tb1X/3fQDNwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBfa1mvx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBfa1mvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742444303; x=1773980303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xN1k9E4FL+UJ3e1igWQgGHDF7fpFNbCGXSsfqzCmxM8=;
  b=LBfa1mvxgcH65xFZBehXWDOWQD+zKGCT4OWSDyiaGh038I5xXb/quitz
   rQMRBShpH58Mg0YgRojN+SKi2uWuqNuVtRtKZkyOhgPOjkMrj6QJcC5so
   EGm2Q31nMkwr3uVvuwi/LuYXxJWFY7vGV4HcVZaPI9gPP47wLThAzCTrz
   GyOURWBTluzxjWQv4FLzTADVZbmbXUQ/XF1n/W0Jh92XxAJJiBFypfUoI
   x62TNIFJ3yEufA6uRLZbECgpTvZlqkCcomhRutaY/MTrqFWuNU2OZCP97
   UzXaO82XznnuRDaosQFu3Zs+qxx0w2Spqjljzzj5j436zrarbsWD7dRZF
   Q==;
X-CSE-ConnectionGUID: SV4z6fQtTEKfIaswSCMJvA==
X-CSE-MsgGUID: kb9+ewonSECqHX3zelCMvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47539453"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="47539453"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 21:18:22 -0700
X-CSE-ConnectionGUID: +H3ytFPwR8qR2+WCJq2LEQ==
X-CSE-MsgGUID: jAoqG35UT2+86jpVYH2Zag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="122743061"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2025 21:18:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv7LA-0000C3-0M;
	Thu, 20 Mar 2025 04:17:42 +0000
Date: Thu, 20 Mar 2025 12:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 6/7] usb: dwc3: qcom: Transition to flattened model
Message-ID: <202503201125.gjJnWYGS-lkp@intel.com>
References: <20250318-dwc3-refactor-v5-6-90ea6e5b3ba4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-dwc3-refactor-v5-6-90ea6e5b3ba4@oss.qualcomm.com>

Hi Bjorn,

kernel test robot noticed the following build errors:

[auto build test ERROR on c4d4884b67802c41fd67399747165d65c770621a]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/usb-dwc3-qcom-Snapshot-driver-for-backwards-compatibilty/20250319-030854
base:   c4d4884b67802c41fd67399747165d65c770621a
patch link:    https://lore.kernel.org/r/20250318-dwc3-refactor-v5-6-90ea6e5b3ba4%40oss.qualcomm.com
patch subject: [PATCH v5 6/7] usb: dwc3: qcom: Transition to flattened model
config: openrisc-randconfig-r131-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201125.gjJnWYGS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250320/202503201125.gjJnWYGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201125.gjJnWYGS-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/usb/dwc3/dwc3-qcom.o: in function `dwc3_qcom_complete':
>> dwc3-qcom.c:(.text+0x44): undefined reference to `dwc3_pm_complete'
>> dwc3-qcom.c:(.text+0x44): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `dwc3_pm_complete'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
