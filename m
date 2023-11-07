Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742C358BF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 19:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uhqqez5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699384865; x=1730920865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yoVeFIlTCmxMkP56vAaZKvF5E0tHnjym9cdnab/yi4c=;
  b=Uhqqez5TNPHQd9hzdeH9c30JCfW2cg4j2JiE2VSuEVkn0puwFemAlIRy
   33jcFKnqDaju3sJg6BljLwXFxN7bM5l3Pf55Gnw5XBti02EC9Utybl5Cs
   AmpHl7EoG1rHtCm2n59hYogpKi8cKX63Iz52HK10vRtjJXvqKXp8nmdg5
   qv9lK7u+tBeKDVQQnxMaI3DxeX97/GN1TtqD/j7WSQW38yEXPA9bRU2ge
   gYcvG7naC9iw4+advAPC7mLY8iGJ5W2sPE/V86RSP8Hm6GTQzwRi3cWqv
   PE0hNEjs2DxgGjqAUG8YmPm/XtHJMYEx6AM0JNa9M0Xe03KoYCNmcYHhR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2535167"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="2535167"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 11:21:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762798829"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="762798829"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Nov 2023 11:21:02 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0RdD-0007LY-1w;
	Tue, 07 Nov 2023 19:20:59 +0000
Date: Wed, 8 Nov 2023 03:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-attest-wip 11/13] arch/x86/coco/tdx/tdx.c:62:
 warning: Function parameter or member 'hdr' not described in
 'service_query_req'
Message-ID: <202311080323.sb6i2r2J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest-wip
head:   4ed58356a95af36f4112fa8808ca91bdd81e65d0
commit: c2dde52f0d63212db400986731ee8240aac7e410 [11/13] x86/tdx: Add tdx_hcall_query_service() API
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311080323.sb6i2r2J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080323.sb6i2r2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080323.sb6i2r2J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:62: warning: Function parameter or member 'hdr' not described in 'service_query_req'


vim +62 arch/x86/coco/tdx/tdx.c

    43	
    44	/**
    45	 * struct service_query_req - Service query command buffer
    46	 * hdr: Command buffer header.
    47	 * @version: Command version (default is 0).
    48	 * @cmd: Command ID (0 for query command).
    49	 * @rsvd: Reserved for future use.
    50	 * @guid: Service GUID to query.
    51	 */
    52	struct service_query_req
    53	{
    54		/* Command buffer header */
    55		struct tdx_service_req_hdr hdr;
    56	
    57		/* Command data */
    58		u8 version;
    59		u8 cmd;
    60		u8 rsvd;
    61		u8 guid[16];
  > 62	};
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
