Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8261C683
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521217; cv=none; b=R9XYiRw/7tl/Uh6dtqPDYmDTS61mWpiYG25ReAw1A8l2dXm93ulpFT9iik56kpLTrrpqd4f0ylYSBW47Lh4FdsZQRE8mZPe8QOuTXerjao1uEApow+XkvgkCgwj1pGS3U8QzgGarvTTyb0w/bDJlCMkYTceNAwFtlGmPt+GQces=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521217; c=relaxed/simple;
	bh=1n02ghahfCX4otQpHau/ATa+zl8gz9G0pEhFOiHAG+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RZgw+ua4SVm3m0M+jaeydE4G1ksLR0q70ALQ6KYikmsW+GPlcEphA9ocO/YPEhUWd3AUb4JXauyCmMl24rG6oSFkZVRltaaxLL+O0bIxs25mP5yjU7vQGGm6EeeAjOAPpt8oeCbXSyJygJ3npaSgLO8iI/NuSQBhKqqIBYOGa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6mjiJfE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6mjiJfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748521215; x=1780057215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1n02ghahfCX4otQpHau/ATa+zl8gz9G0pEhFOiHAG+Y=;
  b=I6mjiJfE0PuPj2Czsk6QADGW0d1M9/WOeqs6BbT+VKIu0XlwJxBvHUhN
   17fG9UZ6Fi+QipfpxaYkvH19iFoc4O79TBBkcfiIG1yyt8bc6/sCONtPO
   2ISsLsBpPAaVGh6HiL6QuZtuChoTuwZJgvVoXlN6c7iYXGnJpiiNJO9+1
   htk2j/3WPz9cjkMGYpiy3URMu2DB9BzSTxFj70N0mY1QPcBklWxaqaAF1
   RJTjOyU4fkIsJPz5rtLUbbw4JHFJFVb0lCsyQyNZnlLHq2zBear/jHB1E
   klFAv/OahYRkOBKHIRZZqhrumV+mYJG1LwhFwsgkNKY2AiZfzA02hkn4f
   Q==;
X-CSE-ConnectionGUID: k4+R+PU/Q062SoP4PRwWLg==
X-CSE-MsgGUID: J/RYCmqyT66FTXWZMv0UxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50581945"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="50581945"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 05:20:14 -0700
X-CSE-ConnectionGUID: qOO6FxVXR6Gab/VaofAlSA==
X-CSE-MsgGUID: iD8+bJh3SI2SkZ1IsfMUoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="166725436"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 May 2025 05:20:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKcEv-000WfM-1V;
	Thu, 29 May 2025 12:20:05 +0000
Date: Thu, 29 May 2025 20:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2331/2331]
 drivers/crypto/ccp/hygon/psp-dev.c:35:6: sparse: sparse: symbol
 'psp_in_nowait_mode' was not declared. Should it be static?
Message-ID: <202505292025.Uqstjrf4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fb62fea0a81a08823f133facca690b2f666a49ef
commit: 3907486bfebfabd1b4cfcfd94fdb04d617e68db8 [2331/2331] crypto: ccp: support psp generic ringbuffer
config: x86_64-randconfig-121-20250529 (https://download.01.org/0day-ci/archive/20250529/202505292025.Uqstjrf4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505292025.Uqstjrf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505292025.Uqstjrf4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/hygon/psp-dev.c:35:6: sparse: sparse: symbol 'psp_in_nowait_mode' was not declared. Should it be static?
   drivers/crypto/ccp/hygon/psp-dev.c:47:10: sparse: sparse: symbol 'atomic64_exchange' was not declared. Should it be static?
   drivers/crypto/ccp/hygon/psp-dev.c:52:5: sparse: sparse: symbol 'psp_mutex_init' was not declared. Should it be static?

vim +/psp_in_nowait_mode +35 drivers/crypto/ccp/hygon/psp-dev.c

    34	
  > 35	bool psp_in_nowait_mode;
    36	static struct psp_misc_dev *psp_misc;
    37	#define HYGON_PSP_IOC_TYPE 'H'
    38	enum HYGON_PSP_OPCODE {
    39		HYGON_PSP_MUTEX_ENABLE = 1,
    40		HYGON_PSP_MUTEX_DISABLE,
    41		HYGON_VPSP_CTRL_OPT,
    42		HYGON_PSP_OP_PIN_USER_PAGE,
    43		HYGON_PSP_OP_UNPIN_USER_PAGE,
    44		HYGON_PSP_OPCODE_MAX_NR,
    45	};
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
