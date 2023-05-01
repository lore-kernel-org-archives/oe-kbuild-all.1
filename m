Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95C651
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682951889; x=1714487889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=daTS94NGBytw3c5+WuFbJtq3o+99Mr3jUOwrs7E/zU0=;
  b=T3tvXhJuOpfXksgXkwBdTIU3SDKjro55ewjiphYNNv57rB1dt9fwN1l1
   EyQPlLR6mgG6DJxaJl+KfW+vGy6zZONSumbjvyfgIyjTUxIn+dDiuEIC5
   km9hvU6/FDaIaeyLU41AMHx+SRELitTgTV4ywz7Hm/Ujgg5iO6KH3xoUN
   OfYAcam4u0hgcdvZAZaj+5PuvQxXPix57W14wYCo2WGP9KCVushA38Nqo
   e6n51lyCy0/EGc9DXHl2L3RLMzB/y2OnvsNVUEYiVXkREg9hlq9H2RAj2
   TAkSgGP59MhH0rUWJZ1QdTJ4ZIiiikkgjPAhtzbBrKMz4tyfmPmqVckuy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="434471671"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="434471671"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 07:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765324856"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="765324856"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 May 2023 07:38:07 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptUfG-0000Up-1k;
	Mon, 01 May 2023 14:38:06 +0000
Date: Mon, 1 May 2023 22:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx2 2/2] dev.c:undefined reference to
 `dev_tcx_uninstall'
Message-ID: <202305012236.g28U0cV8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx2
head:   83fb371f8432de3c2e43cf5cdc60a9de6b419b59
commit: 83fb371f8432de3c2e43cf5cdc60a9de6b419b59 [2/2] bpf: Add generic attach/detach/query API for multi-progs
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230501/202305012236.g28U0cV8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/cilium/linux/commit/83fb371f8432de3c2e43cf5cdc60a9de6b419b59
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx2
        git checkout 83fb371f8432de3c2e43cf5cdc60a9de6b419b59
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305012236.g28U0cV8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/dev.o: in function `unregister_netdevice_many_notify':
>> dev.c:(.text+0x107e5): undefined reference to `dev_tcx_uninstall'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
