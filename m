Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8F1846
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679244613; x=1710780613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1WwfhskjLA1ld8QQ3RHbyLfAAjReGc492cVyE8Y3DOs=;
  b=cma/zYqgek4Hkq1KerS0DlUjZdREUNcvV8xzfzMF7NV5I6CrOKfb0Gtb
   Cvg1/YqWKqvcZhBbV78xa6rb1zMawDmPcaDzTTPpAkp4eOHb8DtI89uLf
   7lX31uOrfKcqgbsD5N3Yv2Sfg6zPMBpqdGuaW6U7GZo1QqNligh3aMfIn
   WKZFAtIP36+ZX1sH6bwp7aa2bWg5VWmBVCjPS1KjjgDHqJamzppbvclMa
   5loHdNo4unPTIvk3oy4+ToeUbci5z9nJFGx+5K2vxYuy5zOZVLlXU84/N
   Povdy20fGK6fYOHjhgYxK6nA6BEeeHq6BTMRwwEfrp96E9iK1CTY8r3R8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="318177713"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="318177713"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 09:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="926732379"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="926732379"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Mar 2023 09:50:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdwEV-000Aad-2E;
	Sun, 19 Mar 2023 16:50:11 +0000
Date: Mon, 20 Mar 2023 00:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 15/19] lib/test_map_h.c:21:1: sparse: sparse:
 symbol 'debug_cats_slist' was not declared. Should it be static?
Message-ID: <202303200005.vo8oC4w2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-next
head:   c4b31485bf709f2667d85485ee94f8bc2f7c91d1
commit: fdaf7cf52761c58abe98dc278e4e4b12785a0e6c [15/19] dyndbg: add map.h, test_map_h.c (RFC)
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230320/202303200005.vo8oC4w2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jimc/linux/commit/fdaf7cf52761c58abe98dc278e4e4b12785a0e6c
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout fdaf7cf52761c58abe98dc278e4e4b12785a0e6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303200005.vo8oC4w2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_map_h.c:21:1: sparse: sparse: symbol 'debug_cats_slist' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
