Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3F128E3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675865588; x=1707401588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XqiJNeLBPXRMrE8Tmav1guaQvhQyuiqjvbXQQ8X5E6Q=;
  b=QekcZTUh2EX7/Tk9S/eKUCcQaMoahr55GlzmUsykigSeqDBrmO25kEgT
   ARiTNz4kkxF/nRO4h4W9INf1BnVd5IcCLjGizZiBlUt06uqu2dbDY6h6A
   vOvYupJNHjBbG+/s8TXFI3M5x4CVSEOG9CehjKHBbGeWmcbey40pjeLPf
   kwaugIKTIK275fvhqh96YPPwz9+BaYM3bmbdbu+xfeq44gxp1gE6E0wYL
   OrZqgyOACTnfkq3zPpdbQOPfZ04YRCllAtsxzQBfi0/CLwJt/D7hQQtyd
   RbQaMTPcAWu6U6zJWsY8cbZqaIpzMN5pUDoL5XNKY46sDiREvKxzVd8qb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="317806288"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="317806288"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 06:13:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="699659761"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="699659761"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Feb 2023 06:13:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPlC5-0004UX-33;
	Wed, 08 Feb 2023 14:13:05 +0000
Date: Wed, 8 Feb 2023 22:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: Martina Krasteva <martinax.krasteva@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, nanli2x <nanx.li@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Subject: [intel-lts:5.15/linux 10/62] drivers/media/i2c/kmb-lens.c:35:33:
 sparse: sparse: symbol 'iris_step_inc' was not declared. Should it be
 static?
Message-ID: <202302082217.hHWfmnC6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   3fcbe6a0b3dc32ae64e534484770059e644250bc
commit: 0d5b79d80af57838bdb57ee7ad6d49d29c24e56d [10/62] media: kmb-lens: Add Keem Bay camera lens
config: h8300-randconfig-s031-20230208 (https://download.01.org/0day-ci/archive/20230208/202302082217.hHWfmnC6-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/linux-intel-lts/commit/0d5b79d80af57838bdb57ee7ad6d49d29c24e56d
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 0d5b79d80af57838bdb57ee7ad6d49d29c24e56d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/kmb-lens.c:35:33: sparse: sparse: symbol 'iris_step_inc' was not declared. Should it be static?
>> drivers/media/i2c/kmb-lens.c:67:33: sparse: sparse: symbol 'iris_step_dec' was not declared. Should it be static?

vim +/iris_step_inc +35 drivers/media/i2c/kmb-lens.c

    30	
    31	/*
    32	 * Iris increment movement lookup. To move iris from currect to next posotion
    33	 * use current index. Example to move from position 0 to 1 use 0 index.
    34	 */
  > 35	const struct kmb_lens_iris_step iris_step_inc[] = {
    36		{
    37			/* Move 0 -> 1 position */
    38			.move_dt = 87,
    39			.stop_dt = 75,
    40			.time_ms = 36,
    41		},
    42		{
    43			/* Move 1 -> 2 position */
    44			.move_dt = 85,
    45			.stop_dt = 75,
    46			.time_ms = 51,
    47		},
    48		{
    49			/* Move 2 -> 3 position */
    50			.move_dt = 85,
    51			.stop_dt = 75,
    52			.time_ms = 32,
    53		},
    54		{
    55			/* Move 3 -> 4 position */
    56			.move_dt = 89,
    57			.stop_dt = 75,
    58			.time_ms = 26,
    59		},
    60	};
    61	
    62	/*
    63	 * Iris decrement movement lookup. To move iris from current to
    64	 * previous posotion use previous index.
    65	 * Example to move from position 1 to 0 use 0 index.
    66	 */
  > 67	const struct kmb_lens_iris_step iris_step_dec[] = {
    68		{
    69			/* Move 1 -> 0 position */
    70			.move_dt = 25,
    71			.stop_dt = 0,
    72			.time_ms = 10,
    73		},
    74		{
    75			/* Move 2 -> 1 position */
    76			.move_dt = 30,
    77			.stop_dt = 50,
    78			.time_ms = 10,
    79		},
    80		{
    81			/* Move 3 -> 2 position */
    82			.move_dt = 35,
    83			.stop_dt = 50,
    84			.time_ms = 11,
    85		},
    86		{
    87			/* Move 4 -> 3 position */
    88			.move_dt = 43,
    89			.stop_dt = 50,
    90			.time_ms = 9,
    91		},
    92	};
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
