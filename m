Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1443A1868
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 11:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681558596; x=1713094596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fh1WBQnJOCzYW8qZMQ9gn7wt6ZNXpmmkmv4iiIeCQe4=;
  b=IkQbVEXdejFCT4Pdqug/ZlIfUmTRmR1Yp2Mlj/Mvkvjxip4Pq9rHEodf
   LEvUdy3OlZWdTm1rtcMLquYMfWs6IicpVimSm1pumuRyOm15ylsCLsNv8
   pgQOTQFXVTcd0qvq439MgAVB56sZ5FoiCZEg/+FvR7GuO8Gda9kP+swpI
   m8hGcIqrreGJCvV4fq72DXoq0WAdnkKCsVviLRruW1uoO5OXsWFGlO3wi
   mci+CDyZG9dHDcnvN9LdidjnaGaY01DlDvA/1bGuEfgqQux2fCSc2+ygL
   KY6mJTxb/33QfpQAHljyDXeCsy3uRjVCePZUc2giIkW76xcXhDSRxm5WI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="430931417"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="430931417"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 04:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="690132360"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="690132360"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Apr 2023 04:36:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pneCn-000axC-1q;
	Sat, 15 Apr 2023 11:36:33 +0000
Date: Sat, 15 Apr 2023 19:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4851/9838] alpha-linux-gcc: error:
 unrecognized command-line option '-march=armv7-a'
Message-ID: <202304151941.RhHfhBIQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/9838] Merge branch 'mxc/next' into next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304151941.RhHfhBIQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151941.RhHfhBIQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> alpha-linux-gcc: error: unrecognized command-line option '-march=armv7-a'
>> alpha-linux-gcc: error: unrecognized command-line option '-mfpu=neon'
>> alpha-linux-gcc: error: unrecognized command-line option '-mfloat-abi=softfp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
