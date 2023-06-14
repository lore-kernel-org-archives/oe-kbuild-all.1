Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912A62EC00
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686760506; x=1718296506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9W5rPxPJo/DsN3uBRO2fUDIuhMCoNGku7aZ6GNZjXE=;
  b=bwQLROdQhK5PQ33/HcxBE4hbfNGWcAytqpN2R+gb0nomgJTMrU/fEr0/
   xNsL9ILKHzVpdndtJ0082yeqcfKuxwh5LzIRC6/iNsr7RhIPBrJuWm7aA
   5ndoH2nbL7Srza9VEzidWtZhzzrNxV6wG3QnCJX+WxeQZKnZqG/Nuya38
   +mw5Ti9F/whZHQP/2G1s2BYtx/CR4SOnA0KXwMjOjpTUnvJerdOnmoonQ
   vOJvs+/lTeeHEUfce5XzqAemmf4Pw26oOirll32E+teIUx72zHgrfjyqY
   txCojSqK018FhaoSYZD9FlxN/ILDQTQLW6ULcRqHsr2DUAX5rHzV9yCCq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="358668018"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="358668018"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 09:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="1042290671"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="1042290671"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jun 2023 09:35:04 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9TSC-0000r9-2w;
	Wed, 14 Jun 2023 16:34:49 +0000
Date: Thu, 15 Jun 2023 00:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS_2023.1_update 88/1079]
 drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:147: warning: expecting
 prototype for struct strm_node. Prototype was for struct stream_context_node
 instead
Message-ID: <202306150002.LtyhxE4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Venkateshwar,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
head:   b8d15414a440db0904ee32f03268e2d262dbf397
commit: 94ece3554bcf455d4f036547a7030a774bbeec9c [88/1079] staging: xlnx_tsmux: Initial version of xlnx mpeg2tsmux driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306150002.LtyhxE4e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/94ece3554bcf455d4f036547a7030a774bbeec9c
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
        git checkout 94ece3554bcf455d4f036547a7030a774bbeec9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/of/ drivers/staging/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150002.LtyhxE4e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:147: warning: expecting prototype for struct strm_node. Prototype was for struct stream_context_node instead
>> drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:161: warning: expecting prototype for struct strm_info. Prototype was for struct stream_info instead


vim +147 drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c

   124	
   125	/**
   126	 * struct strm_node - struct to describe stream node in linked list
   127	 * @node_number: node number to handle streams
   128	 * @node_status: status of stream node
   129	 * @element: stream context info
   130	 * @error_code: error codes
   131	 * @reserved1: reserved bits for hardware align
   132	 * @tail_pointer: physical address of next stream node in linked list
   133	 * @strm_phy_addr: physical address of stream context
   134	 * @node: struct of linked list head
   135	 * @reserved2: reserved for hardware align
   136	 */
   137	struct stream_context_node {
   138		u32 node_number;
   139		enum node_status_info node_status;
   140		struct stream_context element;
   141		enum stream_errors error_code;
   142		u32 reserved1;
   143		u64 tail_pointer;
   144		u64 strm_phy_addr;
   145		struct list_head node;
   146		u64 reserved2;
 > 147	};
   148	
   149	/**
   150	 * struct strm_info - struct to describe streamid node in streamid table
   151	 * @pid: identification number of stream
   152	 * @continuity_counter: counter to maintain packet count for a stream
   153	 * @usageflag: flag to know free or under use for allocating streamid node
   154	 * @strmtbl_update: struct to know enqueue or dequeue streamid in table
   155	 */
   156	struct stream_info {
   157		u16 pid;
   158		u8 continuity_counter;
   159		bool usageflag;
   160		enum strmtbl_cnxt strmtbl_update;
 > 161	};
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
