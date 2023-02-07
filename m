Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3A747F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675800093; x=1707336093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4xIeivNeheGV10GaSYDAa//tf69jn6+aAcKRYxVOcsw=;
  b=Rh4Jg3ijQ47McPhUvkMfdC8sANCt0PIj18XxGcLMHJ2WXiAOG7YG9Ep0
   xwYb19ocJOuNhfXy+y+Q9ahnzfyhWXjCavzYgXWuiWxa3+TvUXM6JoYHz
   DQPpQSHL+Gf0pcDm+cViCxM6IpPV0bU8EqnINzF8r16/+l0BJeTDe3QnK
   +i3YhGcbU8V/5BNwCJR9MIi6usYbfdawsbuPpE3eDiEWWoYXxexJZk5fl
   YgFcBnE6Mc7kBr46oiKthFRDnztlGFu4I1BL7Z4OZ3DgUKnIC4DyOkRaq
   irQn2PZZF2iMoeLm5unVK3cSNCjwWcqCilGB1GlpBjDAqXytPCQsGxrm9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="327304274"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="327304274"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 12:01:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="790922519"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="790922519"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Feb 2023 12:01:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPU9i-0003qY-0Q;
	Tue, 07 Feb 2023 20:01:30 +0000
Date: Wed, 8 Feb 2023 04:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-can@vger.kernel.org
Subject: [mkl-can-next:testing 42/51] drivers/net/can/dev/bittiming.c:79:24:
 error: too many arguments to function 'can_calc_bittiming'
Message-ID: <202302080358.PGPjdXwE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
head:   3dafbe5cc1409dd2e3fc2955b0026c1ba7dfa323
commit: 286c0e09e8e07de0f116a01aa234b05d9956dcf5 [42/51] can: bittiming: can_changelink() pass extack down callstack
config: parisc-randconfig-r026-20230205 (https://download.01.org/0day-ci/archive/20230208/202302080358.PGPjdXwE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git/commit/?id=286c0e09e8e07de0f116a01aa234b05d9956dcf5
        git remote add mkl-can-next https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git
        git fetch --no-tags mkl-can-next testing
        git checkout 286c0e09e8e07de0f116a01aa234b05d9956dcf5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/net/can/dev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/can/dev/bittiming.c: In function 'can_get_bittiming':
>> drivers/net/can/dev/bittiming.c:79:24: error: too many arguments to function 'can_calc_bittiming'
      79 |                 return can_calc_bittiming(dev, bt, btc, extack);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/can/dev.h:18,
                    from drivers/net/can/dev/bittiming.c:7:
   include/linux/can/bittiming.h:126:1: note: declared here
     126 | can_calc_bittiming(const struct net_device *dev, struct can_bittiming *bt,
         | ^~~~~~~~~~~~~~~~~~


vim +/can_calc_bittiming +79 drivers/net/can/dev/bittiming.c

    66	
    67	int can_get_bittiming(const struct net_device *dev, struct can_bittiming *bt,
    68			      const struct can_bittiming_const *btc,
    69			      const u32 *bitrate_const,
    70			      const unsigned int bitrate_const_cnt,
    71			      struct netlink_ext_ack *extack)
    72	{
    73		/* Depending on the given can_bittiming parameter structure the CAN
    74		 * timing parameters are calculated based on the provided bitrate OR
    75		 * alternatively the CAN timing parameters (tq, prop_seg, etc.) are
    76		 * provided directly which are then checked and fixed up.
    77		 */
    78		if (!bt->tq && bt->bitrate && btc)
  > 79			return can_calc_bittiming(dev, bt, btc, extack);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
