Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D06210F2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683396745; x=1714932745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJ4RjKdDf2iKQfanBgDcxRAN/WqZZYUa7VwsIR4mSNo=;
  b=BsejfiT703NN35nUV8kQ4ox1CBIORbMxyJryMC9ycBowF3IK8adky1oL
   hgm+W87bFeVcTJcNjF5OIf6mu9kyAlY38V0ta3kcxCqQLN1/SeNC2NO3j
   4zmM8bQe0Uig4R4C1K0NU1JFtJ8eBdwL7t6Z60IWq7B8kgUJh3+60oXVz
   3a6osomhuPorJcd36vw46+r0xFsNDe9qtZtytSxrbzPC6O0WIb+yGgfdB
   3H5iOwRdm02b+zglJBKAUUVP1y9Pm1Kw5exb0Uj/Hj5zjR/53P5KmK0Yg
   IcHl7AWQ/I35A2gpD0/JxrOhhboig2XvebpGRlbaGwuRkZhLOLLxK6g/7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="329030118"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="329030118"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 11:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="822147832"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="822147832"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 May 2023 11:12:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvMOL-0000RH-1r;
	Sat, 06 May 2023 18:12:21 +0000
Date: Sun, 7 May 2023 02:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/6.1 94/569]
 drivers/net/ethernet/intel/igc/igc_base.h:92:41: error: implicit declaration
 of function 'FIELD_PREP'
Message-ID: <202305070251.2Tcd9gNl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.1
head:   fc034f9e231eee5b1ffa449131efc3edd5c2768a
commit: 88f3b991b93262602baa9a7c57497ec20c009237 [94/569] igc: read before write to SRRCTL register
config: riscv-buildonly-randconfig-r004-20230502 (https://download.01.org/0day-ci/archive/20230507/202305070251.2Tcd9gNl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=88f3b991b93262602baa9a7c57497ec20c009237
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.1
        git checkout 88f3b991b93262602baa9a7c57497ec20c009237
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305070251.2Tcd9gNl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/igc/igc_hw.h:17,
                    from drivers/net/ethernet/intel/igc/igc.h:17,
                    from drivers/net/ethernet/intel/igc/igc_main.c:19:
   drivers/net/ethernet/intel/igc/igc_main.c: In function 'igc_configure_rx_ring':
>> drivers/net/ethernet/intel/igc/igc_base.h:92:41: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      92 | #define IGC_SRRCTL_BSIZEHDR(x)          FIELD_PREP(IGC_SRRCTL_BSIZEHDR_MASK, \
         |                                         ^~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:647:19: note: in expansion of macro 'IGC_SRRCTL_BSIZEHDR'
     647 |         srrctl |= IGC_SRRCTL_BSIZEHDR(IGC_RX_HDR_LEN);
         |                   ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +92 drivers/net/ethernet/intel/igc/igc_base.h

    86	
    87	/* SRRCTL bit definitions */
    88	#define IGC_SRRCTL_BSIZEPKT_MASK	GENMASK(6, 0)
    89	#define IGC_SRRCTL_BSIZEPKT(x)		FIELD_PREP(IGC_SRRCTL_BSIZEPKT_MASK, \
    90						(x) / 1024) /* in 1 KB resolution */
    91	#define IGC_SRRCTL_BSIZEHDR_MASK	GENMASK(13, 8)
  > 92	#define IGC_SRRCTL_BSIZEHDR(x)		FIELD_PREP(IGC_SRRCTL_BSIZEHDR_MASK, \
    93						(x) / 64) /* in 64 bytes resolution */
    94	#define IGC_SRRCTL_DESCTYPE_MASK	GENMASK(27, 25)
    95	#define IGC_SRRCTL_DESCTYPE_ADV_ONEBUF	FIELD_PREP(IGC_SRRCTL_DESCTYPE_MASK, 1)
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
