Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858AC156880
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 00:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742431929; cv=none; b=kIvS07/TfJ5yK6aafyMj3lh8tO1rl3TL41tg3anFrGx7gDUMcfxygjalxkzlplJDrDbXZc/fXdlW9VtVrxkSFU5ZJ8uhhhCQydPsbCoJ09rAe0NnxrIt8eEi+rAz3Rr4JMZwZSa1I3aagZjWK8QAqIEV7VN1OUmkJ2EctIXSBlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742431929; c=relaxed/simple;
	bh=YchgYmqVpo85rDLvK+WwgnbV+Y+fNgnGMhcZ+kel5EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PyFo+T2SXVoZquiG5Mh8KovQzGBW+3uTTZk7QehuH5RmFKY1SHItJAIQIKY13BIe0nM/4fL3qXUurIk66xnLdjUkmYA+nZlRSauTcR1/ZAj03+yXeJNESvGNXJvsydvuPXP3btWr4RCB1happMojKhPItQPLoDnRrIVmtdCYbDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmQpqWPq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmQpqWPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742431926; x=1773967926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YchgYmqVpo85rDLvK+WwgnbV+Y+fNgnGMhcZ+kel5EE=;
  b=PmQpqWPq8SwmQ80IepylGc7rFrMFDL+1XOHR2xxoG2WxxIPKIcSmIdQD
   2POu63VhbXvtO6aag71F0QAcVSpIt232dvpGKEKY5XEHB7fYED/YZ6EkH
   rCqTgn+Tmc3ZdPKwX7gRLA3nrRRqJrmkP+C3sjG2QAYwjQZluAHKFz5Sa
   s3UxRELl3VinCYecHgpcZcsKGA1oerx3XmDdXk963poJBmvTRzQrXBY9r
   k2BXbl6PslnszVqPjelz6or0DrO4KYdvY5G4DjGXO+X4XyfrS7z3e3pVr
   28KW8ka18Fw5pEA2NmGHJkYuqJFsImwSt8EsKal+1Wtp++S2bttoaiQsi
   A==;
X-CSE-ConnectionGUID: ylzBf86aRTGRMEavjOK3kw==
X-CSE-MsgGUID: hLPN8v21R2iw306YYCGDzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55022866"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="55022866"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 17:52:03 -0700
X-CSE-ConnectionGUID: sj720aG9QyGGXvVdC9LcHg==
X-CSE-MsgGUID: h9lRbV8UQKqtD0cXYzde4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="127062221"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 Mar 2025 17:52:01 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv48d-00003t-1w;
	Thu, 20 Mar 2025 00:51:59 +0000
Date: Thu, 20 Mar 2025 08:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [vivek-drm-tip:vfio_dmabuf_v3_flicker_fix 1/11]
 include/drm/drm_pagemap.h:20: warning: Enum value 'DRM_INTERCONNECT_SYSTEM'
 not described in enum 'drm_interconnect_protocol'
Message-ID: <202503200836.sB7o0E6a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/Vivek/drm-tip.git vfio_dmabuf_v3_flicker_fix
head:   383f3a6e352e05a7ccef9ed97af0b479965a0a75
commit: 2abaa8ff01096da4a946016fba89032d7104d50a [1/11] drm/pagemap: Add DRM pagemap
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250320/202503200836.sB7o0E6a-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200836.sB7o0E6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200836.sB7o0E6a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/drm/drm_pagemap.h:20: warning: Enum value 'DRM_INTERCONNECT_SYSTEM' not described in enum 'drm_interconnect_protocol'
>> include/drm/drm_pagemap.h:20: warning: Enum value 'DRM_INTERCONNECT_PCIE_P2P' not described in enum 'drm_interconnect_protocol'
>> include/drm/drm_pagemap.h:20: warning: Enum value 'DRM_INTERCONNECT_DRIVER' not described in enum 'drm_interconnect_protocol'


vim +20 include/drm/drm_pagemap.h

    11	
    12	/**
    13	 * enum drm_interconnect_protocol - Used to identify an interconnect protocol.
    14	 */
    15	enum drm_interconnect_protocol {
    16		DRM_INTERCONNECT_SYSTEM,    /* DMA map is system pages. */
    17		DRM_INTERCONNECT_PCIE_P2P,  /* DMA map is PCIE P2P */
    18		DRM_INTERCONNECT_DRIVER,    /* DMA map is driver defined */
    19		/* A driver can add private values beyond DRM_INTERCONNECT_DRIVER */
  > 20	};
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
