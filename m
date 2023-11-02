Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A744210F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wyigjwwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698903865; x=1730439865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GS155UFsrX5XUJR37JWuXbd6NdC9ZuWM8Y7Ukyh/enw=;
  b=WyigjwwlblfD/nmMOB1xHAHxvevwQrfLSybJ51phKjSmqeVA+9zavPnG
   y5hTiKJ9XzLO98sQZKGDyHYfz0aRHeJBIRhArlKSpRiiCil8oR6V7O6FQ
   4HloUfxlmYhBhrfPA+WI01kMGkKtunTIV+6NN0PUlZfAC2Xq8Wg9JomwN
   87EQ5RCRtrDk2qj6RAVbprQkDhhM5mbjfRAvvqBcyjfb6c9Nj4s2a03y9
   DpoDwK/iBxdnqpCdFRJLUmoNxUf3wBwZwI9liiJPhTzKOSdo1gCsrzETV
   /BVvTUMAft/GvRUyR96XYqWxkrt2+K2u9Qgu0QzTyHy75JhvW7Cz1F0dh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452938120"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="452938120"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 22:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="851802736"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="851802736"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2023 22:44:19 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyQV7-0001A2-11;
	Thu, 02 Nov 2023 05:44:17 +0000
Date: Thu, 2 Nov 2023 13:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Sakai <msakai@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dm-devel@redhat.com,
	Mike Snitzer <snitzer@kernel.org>,
	"J. corwin Coburn" <corwin@hurlbutnet.net>,
	John Wiele <jwiele@redhat.com>
Subject: [device-mapper-dm:dm-vdo-wip 55/90]
 drivers/md/dm-vdo/block-map.h:35:37: warning: 'UNMAPPED_BLOCK_MAP_ENTRY'
 defined but not used
Message-ID: <202311021353.WMMPQspU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git dm-vdo-wip
head:   d4e7d305aaa9738d9606f986ad8f2f01edbb14b3
commit: 5a6d19abe1dc27648b64418df24ea0acef0f38d6 [55/90] dm vdo: enable configuration and building of dm-vdo
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231102/202311021353.WMMPQspU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021353.WMMPQspU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021353.WMMPQspU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm-vdo-target.c:16:
>> drivers/md/dm-vdo/block-map.h:35:37: warning: 'UNMAPPED_BLOCK_MAP_ENTRY' defined but not used [-Wunused-const-variable=]
      35 | static const struct block_map_entry UNMAPPED_BLOCK_MAP_ENTRY = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/md/dm-vdo/block-map.h:34:38: warning: 'NO_PAGE' defined but not used [-Wunused-const-variable=]
      34 | static const physical_block_number_t NO_PAGE = 0xFFFFFFFFFFFFFFFF;
         |                                      ^~~~~~~


vim +/UNMAPPED_BLOCK_MAP_ENTRY +35 drivers/md/dm-vdo/block-map.h

fd98f3e3ccc645 Matthew Sakai 2023-10-26  33  
15deeca3859a19 Matthew Sakai 2023-10-26 @34  static const physical_block_number_t NO_PAGE = 0xFFFFFFFFFFFFFFFF;
15deeca3859a19 Matthew Sakai 2023-10-26 @35  static const struct block_map_entry UNMAPPED_BLOCK_MAP_ENTRY = {
15deeca3859a19 Matthew Sakai 2023-10-26  36  	.mapping_state = VDO_MAPPING_STATE_UNMAPPED & 0x0F,
15deeca3859a19 Matthew Sakai 2023-10-26  37  	.pbn_high_nibble = 0,
15deeca3859a19 Matthew Sakai 2023-10-26  38  	.pbn_low_word = __cpu_to_le32(VDO_ZERO_BLOCK & UINT_MAX),
15deeca3859a19 Matthew Sakai 2023-10-26  39  };
15deeca3859a19 Matthew Sakai 2023-10-26  40  

:::::: The code at line 35 was first introduced by commit
:::::: 15deeca3859a19abfaadd333fb3df7a45087ab3e dm vdo: implement the block map page cache

:::::: TO: Matthew Sakai <msakai@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
