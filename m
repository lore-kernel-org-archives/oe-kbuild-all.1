Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8271E2F31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 12:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676030617; x=1707566617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5m+gwPiabYBVzhKMyYKXqZCjiu/n1VinVl7o7REHuxc=;
  b=iHvHTn3lSwDmhkzYUv6QvU7+WJKIcn+3CSVn2/Tb6uU+Y9+5pzxJgrM4
   0PlIhaXqYR5LoJZLiwBCwwFYqXlK6JEWod/AseYEd3xuyPnWXgLsxK3gG
   D943MWNyQ0YrQCZ3nSFCxcAmQSvB8Tumcwz7/ktXx1KasypdL8H+P1ZvQ
   rgSdv10xB5f5o0FHV5f0k+ovaL79RMpZ3IRMBMFWjGr+0SpK9/jK38AAc
   VE8HBCnTjHfjqgcK0em3m7WkJlstEmmwCxk3wDZbAZdKwT8k+Z1jx3dbS
   cleB/kc1k//Jagjcvsr6t5/C6N9X0atEIkLcGoxownuZM6Y2bzVyLnrdl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="392805821"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="392805821"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 04:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="617870359"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="617870359"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Feb 2023 04:03:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQS7q-0005nB-1l;
	Fri, 10 Feb 2023 12:03:34 +0000
Date: Fri, 10 Feb 2023 20:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Nick Pelly <npelly@google.com>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [jsarha:topic/cros-sof-v4.19 58/6555]
 drivers/input/misc/gpio_axis.c:28:10: sparse: sparse: symbol
 'gpio_axis_4bit_gray_map_table' was not declared. Should it be static?
Message-ID: <202302101929.x3maPnJL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 67d0f63b5a28037a7bcb777d9fb1e80f6e760ccc [58/6555] ANDROID: input: Generic GPIO Input devices
config: parisc-randconfig-s032-20221204 (https://download.01.org/0day-ci/archive/20230210/202302101929.x3maPnJL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/67d0f63b5a28037a7bcb777d9fb1e80f6e760ccc
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout 67d0f63b5a28037a7bcb777d9fb1e80f6e760ccc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/input/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101929.x3maPnJL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/misc/gpio_axis.c:28:10: sparse: sparse: symbol 'gpio_axis_4bit_gray_map_table' was not declared. Should it be static?
>> drivers/input/misc/gpio_axis.c:43:10: sparse: sparse: symbol 'gpio_axis_5bit_singletrack_map_table' was not declared. Should it be static?

vim +/gpio_axis_4bit_gray_map_table +28 drivers/input/misc/gpio_axis.c

    27	
  > 28	uint16_t gpio_axis_4bit_gray_map_table[] = {
    29		[0x0] = 0x0, [0x1] = 0x1, /* 0000 0001 */
    30		[0x3] = 0x2, [0x2] = 0x3, /* 0011 0010 */
    31		[0x6] = 0x4, [0x7] = 0x5, /* 0110 0111 */
    32		[0x5] = 0x6, [0x4] = 0x7, /* 0101 0100 */
    33		[0xc] = 0x8, [0xd] = 0x9, /* 1100 1101 */
    34		[0xf] = 0xa, [0xe] = 0xb, /* 1111 1110 */
    35		[0xa] = 0xc, [0xb] = 0xd, /* 1010 1011 */
    36		[0x9] = 0xe, [0x8] = 0xf, /* 1001 1000 */
    37	};
    38	uint16_t gpio_axis_4bit_gray_map(struct gpio_event_axis_info *info, uint16_t in)
    39	{
    40		return gpio_axis_4bit_gray_map_table[in];
    41	}
    42	
  > 43	uint16_t gpio_axis_5bit_singletrack_map_table[] = {
    44		[0x10] = 0x00, [0x14] = 0x01, [0x1c] = 0x02, /*     10000 10100 11100 */
    45		[0x1e] = 0x03, [0x1a] = 0x04, [0x18] = 0x05, /*     11110 11010 11000 */
    46		[0x08] = 0x06, [0x0a] = 0x07, [0x0e] = 0x08, /*    01000 01010 01110  */
    47		[0x0f] = 0x09, [0x0d] = 0x0a, [0x0c] = 0x0b, /*    01111 01101 01100  */
    48		[0x04] = 0x0c, [0x05] = 0x0d, [0x07] = 0x0e, /*   00100 00101 00111   */
    49		[0x17] = 0x0f, [0x16] = 0x10, [0x06] = 0x11, /*   10111 10110 00110   */
    50		[0x02] = 0x12, [0x12] = 0x13, [0x13] = 0x14, /*  00010 10010 10011    */
    51		[0x1b] = 0x15, [0x0b] = 0x16, [0x03] = 0x17, /*  11011 01011 00011    */
    52		[0x01] = 0x18, [0x09] = 0x19, [0x19] = 0x1a, /* 00001 01001 11001     */
    53		[0x1d] = 0x1b, [0x15] = 0x1c, [0x11] = 0x1d, /* 11101 10101 10001     */
    54	};
    55	uint16_t gpio_axis_5bit_singletrack_map(
    56		struct gpio_event_axis_info *info, uint16_t in)
    57	{
    58		return gpio_axis_5bit_singletrack_map_table[in];
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
