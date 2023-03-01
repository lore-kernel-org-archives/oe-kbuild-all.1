Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825C523AF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677672978; x=1709208978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D0iVxKD3TvGZnCTlPjD20wLSvDkSqKRrao9p9ARBwuw=;
  b=Fv9uwtPYQq7Nh5j1lJsz4zLtEQUIdFLPZgMvy20sPIC28W+lPywajPS2
   czbR/E+m9+tmitKBzYQ41024XL1G42Fyz3crZnSqEITGwLsV1mrlEVr1j
   KkRHD/7UGYnKQLGDkGFt5Qknf7VNw/M96x8uFR6EEFegDO8UJdwgOGshr
   Iay3mVrsQ+zIYcYoqgi7Tp3a1JTmekdM0pLMNCMe8PG+tpy9bEYWOB+QL
   AZ3XZVYNMKzOArjDgcGs7KFOSQmUqzow45tFr4UdxlqlGywRjF0QUJLaW
   5OnyPlKyv355GMIqJQxHyvz8CNTqgA2fF1iLR9ywZ5Tl0B1Q+l4jxkd9n
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="335884858"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="335884858"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 04:16:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="763578411"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="763578411"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Mar 2023 04:16:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXLNY-00068N-1A;
	Wed, 01 Mar 2023 12:16:16 +0000
Date: Wed, 1 Mar 2023 20:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:saa7146 12/12] s390-linux-ld:
 av7110_v4l.c:undefined reference to `saa7146_start_preview'
Message-ID: <202303012021.Tgcji57C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git saa7146
head:   1bd37601a99554315cb2f9c29c7d01765788c933
commit: 1bd37601a99554315cb2f9c29c7d01765788c933 [12/12] fix compliance issues
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230301/202303012021.Tgcji57C-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree saa7146
        git checkout 1bd37601a99554315cb2f9c29c7d01765788c933
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303012021.Tgcji57C-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/staging/media/av7110/av7110_v4l.o: in function `av7110_dvb_c_switch.isra.0':
   av7110_v4l.c:(.text+0x26f6): undefined reference to `saa7146_stop_preview'
>> s390-linux-ld: av7110_v4l.c:(.text+0x2e30): undefined reference to `saa7146_start_preview'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
