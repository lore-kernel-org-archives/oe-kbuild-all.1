Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6CC2583
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 20:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679256798; x=1710792798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rmp95APKxZpH55FswKt0BKUVYXpgMyoIeboFT/9t+s=;
  b=GjOew8PuPpzCig3hDGHb0SIj7S9XVJNuaEQ5Mh/G3XQcFNOQqBdLeCw4
   tbd1BYvrmvOiD+DiCexbsQ2Oq3IMd8mo/X3qA5HMCW9baBkaMrzv2P4Ye
   IL+gJbb1QK0LLcSbUS0QDymOPbfUuCzZH8gDyJMsUh4XtHm+I52QHEiHL
   MU99NCK9NKLUxLF80vJo0KFc2nrBsGVoGPOoOZE67+1JQmu/PvKDoseIQ
   omGcbvzGR/y05YQQegHlHoaqOjgfuzdmNLTFJ97gyVeceIPCS/uuoaYa1
   2N2H3vYQaxrO7/lxJyEyRD+wmDbJnFFovQktB4O+ahPh1Png+wdfwjKjU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="326907299"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="326907299"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 13:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="674133883"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="674133883"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Mar 2023 13:13:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdzP1-000Adq-33;
	Sun, 19 Mar 2023 20:13:15 +0000
Date: Mon, 20 Mar 2023 04:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 96/135]
 ./usr/include/drm/asahi_drm.h:318:1: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202303200432.7CAb1N9X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   d605918324a63a5a82ca14adeb87077620dd1428
commit: 020a96a385f8edaf20da0c0c7b3dca5b4c857d1f [96/135] drm/asahi: Add the Asahi driver UAPI
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230320/202303200432.7CAb1N9X-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/020a96a385f8edaf20da0c0c7b3dca5b4c857d1f
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout 020a96a385f8edaf20da0c0c7b3dca5b4c857d1f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303200432.7CAb1N9X-lkp@intel.com/

Note: the asahilinux/bits/210-gpu HEAD d605918324a63a5a82ca14adeb87077620dd1428 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/drm/asahi_drm.h:318:1: error: C++ style comments are not allowed in ISO C90
     318 | // FIXME: Type doesn't make sense here
         | ^
   ./usr/include/drm/asahi_drm.h:318:1: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
