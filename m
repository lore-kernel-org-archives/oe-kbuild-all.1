Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0F16AB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681390433; x=1712926433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GvvJOp8D3No7OEz8DTlxlB6wkgvdvUkllXz1rK0B7N4=;
  b=PSiKDQaEMNvTFmMVulu4ifmhmpI2Jo0jz3KrV+a2gHTTsG1NmmS9bboK
   3sus9xuDgr/mND5W7kKuOnWTzqxdAZzSVLDhJHuOHujuydy/ng678O3G2
   wxONTrgjcD0MGwqAjy04epeTSx6RxswzqVAs6eCM/9YTclNfoxw44GjAT
   HcNZC54G8fWBfFD3scAaXmCEHxCYqI2awLgFAEf0QAdKmumd2mJ3IFWu/
   ukc0ke3tg0xivS4yvPikGQ8Qbbk8dZluuhhpqAX1r01rl+5oZOtNtWKvv
   3d6qAH2u9etIm2ZqZ7ONIJzA71JVCNs5DXcwal1XieQ+4NbXJYqy75WVv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="346858742"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="346858742"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 05:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="813443053"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="813443053"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Apr 2023 05:53:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmwST-000Yh5-02;
	Thu, 13 Apr 2023 12:53:49 +0000
Date: Thu, 13 Apr 2023 20:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 637/1065]
 drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:46:16: error: implicit
 declaration of function 'in_be32'
Message-ID: <202304132039.DL11YImH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: 03252b346d787210f709c33dc420d2e1bcb0f10a [637/1065] staging: net: xilinx: add Xilinx TSN driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304132039.DL11YImH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/03252b346d787210f709c33dc420d2e1bcb0f10a
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout 03252b346d787210f709c33dc420d2e1bcb0f10a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132039.DL11YImH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c: In function 'xlnx_tod_read':
>> drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:46:16: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
      46 |         nsec = in_be32(timer->baseaddr + XTIMER1588_CURRENT_RTC_NS);
         |                ^~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c: In function 'xlnx_rtc_offset_write':
>> drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:58:9: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
      58 |         out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_H), 0);
         |         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/in_be32 +46 drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c

    41	
    42	static void xlnx_tod_read(struct xlnx_ptp_timer *timer, struct timespec64 *ts)
    43	{
    44		u32 sec, nsec;
    45	
  > 46		nsec = in_be32(timer->baseaddr + XTIMER1588_CURRENT_RTC_NS);
    47		sec = in_be32(timer->baseaddr + XTIMER1588_CURRENT_RTC_SEC_L);
    48	
    49		ts->tv_sec = sec;
    50		ts->tv_nsec = nsec;
    51	}
    52	
    53	static void xlnx_rtc_offset_write(struct xlnx_ptp_timer *timer,
    54					  const struct timespec64 *ts)
    55	{
    56		pr_debug("%s: sec: %lld nsec: %ld\n", __func__, ts->tv_sec, ts->tv_nsec);
    57	
  > 58		out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_H), 0);
    59		out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_L),
    60			 (ts->tv_sec));
    61		out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_NS), ts->tv_nsec);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
