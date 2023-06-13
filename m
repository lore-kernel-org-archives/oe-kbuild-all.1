Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEDB7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 04:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686630276; x=1718166276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TPKGGpv1scWoSTn1oljMQSKTF64jb/R+1PHj7dOd3IY=;
  b=AhtxJi60kny/aBOQoLupewtc2joD2oN7i4C64qYFDrgr/T8VyK9I6cyd
   d9wk9/guevWpP+yZM0ccfmCTCO0b5HRxnef8d9NCS4y1u3KCZkQeJenFY
   fBis2m7GTF2wyLGniWjSDhyppzV4jwU75I7K7pRCBfoIdTd3m4CEdO1MR
   Ro9nyHeItPDlntjePILCwL0FN7BHwrZ2QS6Ge4RX6M1RsuTUVelLdnR6P
   5mtTCeC+Drh0TLX+USrWJhvtS4b4vMdBi2ZEA1GKWAJ5khrB2e90j7hDv
   yK50lnhSz7C3iOsiYokaTheOGF2OduFPVjJ4r67NTyz8sQM5ZOETmLjpl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="357109657"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="357109657"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="855933100"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="855933100"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2023 21:24:29 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8va0-00010k-25;
	Tue, 13 Jun 2023 04:24:28 +0000
Date: Tue, 13 Jun 2023 12:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 3/7] bpf: implement devtx hook points
Message-ID: <202306131159.sly1cScQ-lkp@intel.com>
References: <20230612172307.3923165-4-sdf@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612172307.3923165-4-sdf@google.com>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/bpf-rename-some-xdp-metadata-functions-into-dev-bound/20230613-012928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230612172307.3923165-4-sdf%40google.com
patch subject: [RFC bpf-next 3/7] bpf: implement devtx hook points
config: csky-randconfig-r011-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131159.sly1cScQ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch bpf-next master
        git checkout bpf-next/master
        b4 shazam https://lore.kernel.org/r/20230612172307.3923165-4-sdf@google.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash net/core/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131159.sly1cScQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/devtx.c:41:22: warning: no previous prototype for 'devtx_sb' [-Wmissing-prototypes]
      41 | __weak noinline void devtx_sb(struct devtx_frame *ctx)
         |                      ^~~~~~~~
>> net/core/devtx.c:51:22: warning: no previous prototype for 'devtx_cp' [-Wmissing-prototypes]
      51 | __weak noinline void devtx_cp(struct devtx_frame *ctx)
         |                      ^~~~~~~~


vim +/devtx_sb +41 net/core/devtx.c

    34	
    35	/**
    36	 * devtx_sb - Called for every egress netdev packet
    37	 *
    38	 * Note: this function is never actually called by the kernel and declared
    39	 * only to allow loading an attaching appropriate tracepoints.
    40	 */
  > 41	__weak noinline void devtx_sb(struct devtx_frame *ctx)
    42	{
    43	}
    44	
    45	/**
    46	 * devtx_cp - Called upon egress netdev packet completion
    47	 *
    48	 * Note: this function is never actually called by the kernel and declared
    49	 * only to allow loading an attaching appropriate tracepoints.
    50	 */
  > 51	__weak noinline void devtx_cp(struct devtx_frame *ctx)
    52	{
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
