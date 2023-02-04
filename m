Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AED163
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 00:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675469084; x=1707005084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5RKlPufzki5/AELpyr4YhgGRTTX3pOrmRbGBrDXalWI=;
  b=Cw052PGDmQjpvMrHRLH6YKfcf++9/xRnqaogq3pZsIbXLc1UPQcCATH+
   detiYH7R13H1F+EUNj2A5M3Qa1/6KiPs+MOCyzC03n/iyTtzlTSrJC+Zz
   AVivd52ohQjI3z7l5lALc9FD7HON40PAlJcYBrbCJ5hxKUif9a9Db70Nx
   2Lic2GBaTn4bXV1stSqR8e4FtJmvCbD9utt8ge2UktNCoxyJcko9Vtfpj
   MjT+8fFJw1rfwEjx/aigBBaFw2p6+a9lQXbC9h8G4JqYha+jLRBuTcv0T
   YVhctLX8joIis6ISvBR0CFj/Dkv6gEgWDfA2ICjHAVjXNEd0sW/qCas/V
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312545481"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="312545481"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 16:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="734526634"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="734526634"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Feb 2023 16:04:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO62X-0000rf-2J;
	Sat, 04 Feb 2023 00:04:21 +0000
Date: Sat, 4 Feb 2023 08:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Garnier <thgarnie@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Torokhov <dtor@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 6822/9999]
 security/container/protos/config.pb.c:14:5: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202302040736.yg8lA1SF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 20ee4b09dd0e4d2167ca00fdcdcb499ebc0cf076 [6822/9999] CHROMIUM: security: Container monitoring LSM
config: sparc-randconfig-s051-20230204 (https://download.01.org/0day-ci/archive/20230204/202302040736.yg8lA1SF-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/20ee4b09dd0e4d2167ca00fdcdcb499ebc0cf076
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 20ee4b09dd0e4d2167ca00fdcdcb499ebc0cf076
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash security/container/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> security/container/protos/config.pb.c:14:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:15:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:19:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:20:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:21:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:22:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:23:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:29:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:33:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:34:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:35:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:36:5: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/config.pb.c:37:5: sparse: sparse: Using plain integer as NULL pointer
--
>> security/container/protos/nanopb/pb_encode.c:156:39: sparse: sparse: Using plain integer as NULL pointer
>> security/container/protos/nanopb/pb_encode.c:156:39: sparse: sparse: Using plain integer as NULL pointer
>> security/container/protos/nanopb/pb_encode.c:156:39: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/nanopb/pb_encode.c:535:27: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/nanopb/pb_encode.c:535:27: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/nanopb/pb_encode.c:535:27: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/nanopb/pb_encode.c:685:30: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/nanopb/pb_encode.c:685:30: sparse: sparse: Using plain integer as NULL pointer
   security/container/protos/nanopb/pb_encode.c:685:30: sparse: sparse: Using plain integer as NULL pointer

vim +14 security/container/protos/config.pb.c

81177f0f903a73 Thomas Garnier 2018-10-09  10  
81177f0f903a73 Thomas Garnier 2018-10-09  11  
81177f0f903a73 Thomas Garnier 2018-10-09  12  
81177f0f903a73 Thomas Garnier 2018-10-09  13  const pb_field_t schema_ContainerCollectorConfig_fields[2] = {
81177f0f903a73 Thomas Garnier 2018-10-09 @14      PB_FIELD(  1, BOOL    , SINGULAR, STATIC  , FIRST, schema_ContainerCollectorConfig, enabled, enabled, 0),
81177f0f903a73 Thomas Garnier 2018-10-09  15      PB_LAST_FIELD
81177f0f903a73 Thomas Garnier 2018-10-09  16  };
81177f0f903a73 Thomas Garnier 2018-10-09  17  

:::::: The code at line 14 was first introduced by commit
:::::: 81177f0f903a73c00175c4553c46279f4f3dece6 CHROMIUM: security: Add container LSM proto definitions

:::::: TO: Thomas Garnier <thgarnie@google.com>
:::::: CC: chrome-bot <chrome-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
