Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6252F32
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677679348; x=1709215348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4JdekUTmDUWn8aqDXAdr4TBF3ovpcsMmyvp+5ahzoJ4=;
  b=VPoeTAZ5+LfOzwVYHmUzDkambTqhbCtilkYuSXybRk12bDzWOkEjWJTu
   DKCeCy2YOwJpmm4jaGkmj+FGbDxzjsTBuiLxU3HG+nzJU+Gm65Nt0N9Xb
   Jj9KOA3iUaBzzux3ZYwS+P2uLv5Na07aCTb4665JQ1JzqILpipUWcgICz
   zZTM8f4gaffCawDDo2TBl1Gn/GjR3DWUxGvi+2UYQzW66EouqwL9W3ucN
   Ws6g20rmauasY4mQKs2S+8hC2Ulm33OGtJdNcCtD7eKtKoHUvZjDZ3jxw
   eMulhIYdh/K+LIa+9fhlv8O73HCAT0Lgc+GotkUMb6ufXCnQf0xE9hGTA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="318213732"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="318213732"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 06:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="1003683478"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="1003683478"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Mar 2023 06:02:19 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXN2A-0006Bf-3D;
	Wed, 01 Mar 2023 14:02:19 +0000
Date: Wed, 1 Mar 2023 22:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:saa7146 12/12] av7110_v4l.c:undefined reference
 to `saa7146_stop_preview'
Message-ID: <202303012104.g0H3jL57-lkp@intel.com>
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
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230301/202303012104.g0H3jL57-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree saa7146
        git checkout 1bd37601a99554315cb2f9c29c7d01765788c933
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303012104.g0H3jL57-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/staging/media/av7110/av7110_v4l.o: in function `av7110_dvb_c_switch':
>> av7110_v4l.c:(.text+0x1bb4): undefined reference to `saa7146_stop_preview'
>> arm-linux-gnueabi-ld: av7110_v4l.c:(.text+0x2104): undefined reference to `saa7146_start_preview'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
