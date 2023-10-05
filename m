Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5219C43688
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 23:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="filMED3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696547446; x=1728083446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7w11z6CMQZtVqEjBHY+S8t0/eXuisXa8dO4+xtNspo=;
  b=filMED3h3BTv9YRblvMVpi44bxBlr5DBbeo5xTcA5LGBkKKNl6JrZnbB
   rtxZjFmDv8BjsscWUiOLwFUUTTgdQ+1+EZidQymh+w7bwn/hf6Xf6fJx5
   izRqt4XyKXL3l53rn3/Nx7D7FcinQNdcDfbcNX5KBHiCMJJqUMkNIiMcx
   +2pUtfQmDWqHJo/2vEILdOoaS+5JekUTKRGyj/5WAT5AyRVRgQ+BhmDjl
   stZepKmLC3DX4RODnoCdj+ZIGlArHrzxYwbnm7HTDccYFssj70fLLwTJq
   VA/X3WIP6kjSrR5kHDKPNcOS1zHb0Zohb3dGl5Q8GaOfJiz67FYGEtRXm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="368721352"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="368721352"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 16:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787177211"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="787177211"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 16:10:44 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoXUQ-000M0S-0S;
	Thu, 05 Oct 2023 23:10:42 +0000
Date: Fri, 6 Oct 2023 07:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:for-next/ffa/updates 19/21]
 include/linux/arm_ffa.h:105:10: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <202310060720.7VXmqG7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/ffa/updates
head:   f00197d4f473386def496cd34b73cf51778cc28e
commit: 0624de756f756b4e898db1f16775b61fb7e4832c [19/21] firmware: arm_ffa: Update memory descriptor to support v1.1 format
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231006/202310060720.7VXmqG7D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060720.7VXmqG7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060720.7VXmqG7D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tee/optee/ffa_abi.c:8:
   include/linux/arm_ffa.h: In function 'ffa_mem_desc_offset':
>> include/linux/arm_ffa.h:105:10: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     105 |         (FIELD_PREP(FFA_MAJOR_VERSION_MASK, (major)) |          \
         |          ^~~~~~~~~~
   include/linux/arm_ffa.h:107:33: note: in expansion of macro 'FFA_PACK_VERSION_INFO'
     107 | #define FFA_VERSION_1_0         FFA_PACK_VERSION_INFO(1, 0)
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:368:28: note: in expansion of macro 'FFA_VERSION_1_0'
     368 |         if (ffa_version <= FFA_VERSION_1_0)
         |                            ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +105 include/linux/arm_ffa.h

229d58e31678de Will Deacon  2022-11-16   98  
229d58e31678de Will Deacon  2022-11-16   99  /* FFA version encoding */
229d58e31678de Will Deacon  2022-11-16  100  #define FFA_MAJOR_VERSION_MASK	GENMASK(30, 16)
229d58e31678de Will Deacon  2022-11-16  101  #define FFA_MINOR_VERSION_MASK	GENMASK(15, 0)
229d58e31678de Will Deacon  2022-11-16  102  #define FFA_MAJOR_VERSION(x)	((u16)(FIELD_GET(FFA_MAJOR_VERSION_MASK, (x))))
229d58e31678de Will Deacon  2022-11-16  103  #define FFA_MINOR_VERSION(x)	((u16)(FIELD_GET(FFA_MINOR_VERSION_MASK, (x))))
229d58e31678de Will Deacon  2022-11-16  104  #define FFA_PACK_VERSION_INFO(major, minor)			\
229d58e31678de Will Deacon  2022-11-16 @105  	(FIELD_PREP(FFA_MAJOR_VERSION_MASK, (major)) |		\
229d58e31678de Will Deacon  2022-11-16  106  	 FIELD_PREP(FFA_MINOR_VERSION_MASK, (minor)))
229d58e31678de Will Deacon  2022-11-16  107  #define FFA_VERSION_1_0		FFA_PACK_VERSION_INFO(1, 0)
f81e624670e51f Sudeep Holla 2023-10-05  108  #define FFA_VERSION_1_1		FFA_PACK_VERSION_INFO(1, 1)
229d58e31678de Will Deacon  2022-11-16  109  

:::::: The code at line 105 was first introduced by commit
:::::: 229d58e31678dece365060c50a39a99a2b1dc729 firmware: arm_ffa: Move constants to header file

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
