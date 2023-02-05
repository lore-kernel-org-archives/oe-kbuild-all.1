Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747E628E8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 11:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675595899; x=1707131899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/Y+XUWDpEED1myWUlT77r/N605OW7MjAmVh/y3cqKg=;
  b=B2H1GbiON30wO9yb054aoHps/ef2yqsXRurKuY1EM5kOjFRAwjwA9FLU
   iSXVcgM9rgY8vo7PpvEu8KLN94EnZSMIxP+BdbayfOORfjLyt75PXQrdo
   1teCZwDnN2xvXml7aLclCytaLxRbudKrOFeiucE+ceJPri/Ci1zbSQ5zD
   Kps5DRZzWhMcLj80pN3fK0oXMSNVX0v2X3JeN6QZqDCQ1Xasc8hNU6nI2
   WUufcZ1RP2AUhSIMIs60sRYI1NKNYuMe+nTJqVm/qedlkGw67hUXaNcB1
   F9hfHNptLxZz7yeTd9Vzz/OYVDwrjIc/pzo2itvwX2UfsjblR9MBFr3Ev
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415253722"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="415253722"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 03:18:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="734838063"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="734838063"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Feb 2023 03:18:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOd2H-0001xo-1C;
	Sun, 05 Feb 2023 11:18:17 +0000
Date: Sun, 5 Feb 2023 19:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 1331/20208]
 ./usr/include/linux/videodev2.h:2398:41: error: field 'timestamp' has
 incomplete type
Message-ID: <202302051919.o0yjKueq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 0103d73732ea64a7956c8423ff3ec99d9f8b119f [1331/20208] MLK-21876-13 ipu: add uapi headfile for yocto build pass
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230205/202302051919.o0yjKueq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/0103d73732ea64a7956c8423ff3ec99d9f8b119f
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 0103d73732ea64a7956c8423ff3ec99d9f8b119f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/ipu.h:29,
                    from <command-line>:
>> ./usr/include/linux/videodev2.h:2398:41: error: field 'timestamp' has incomplete type
    2398 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
