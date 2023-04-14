Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F497C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 04:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681446925; x=1712982925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qVf5Qb/jBPz/3d5A4hJn/1Yrak4rbvDVHYou2oOmkE=;
  b=W5W3CXW2SoO4WwlSt3uX+Mru9Uo7hYTB82OhSjMETNhHom3Ix/5JpUNT
   K6VP/rXrZFnl57gCq4tn5N0woh0z+noY0Vd4rMDTj7m/OuFkekhfYZpmf
   mfhK4UdvmnA12F/qNMFWj/Tt0yQqRKIjD3tkA/0FgsHXRtcWZokR2oRwx
   Kv8w0vB9pT8tVTBd6632gFOUeKPRiA6iUFJwXVVEb2+/tVgd6N4QuWkOy
   ga+j8sf7ND1tbamUHsa/TJ9f0H1z2hJAbggYny35xJeaDYX1a+rE/y7CC
   8XL9B67xBC+dZITjEJ15OU429oijOrMPZe/d1b6dScin5EMpwi4r/eUKb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="333145708"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="333145708"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 21:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689646607"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="689646607"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Apr 2023 21:35:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnB9W-000ZEC-1O;
	Fri, 14 Apr 2023 04:35:14 +0000
Date: Fri, 14 Apr 2023 12:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [atishp04:cove_integeration_v2 74/136] drivers/base/core.c:52:6:
 sparse: sparse: symbol 'dev_default_authorized' was not declared. Should it
 be static?
Message-ID: <202304141240.ZM7PDuDJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux cove_integeration_v2
head:   94c0fb847a505a21d11c0de2e0acefc2e9965311
commit: 26d8801d2fe5fc15aeabb0f5875fd2a1366e4361 [74/136] driver core: Add command line option to initialize authorized attribute
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230414/202304141240.ZM7PDuDJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/atishp04/linux/commit/26d8801d2fe5fc15aeabb0f5875fd2a1366e4361
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 cove_integeration_v2
        git checkout 26d8801d2fe5fc15aeabb0f5875fd2a1366e4361
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141240.ZM7PDuDJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/core.c:52:6: sparse: sparse: symbol 'dev_default_authorized' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
