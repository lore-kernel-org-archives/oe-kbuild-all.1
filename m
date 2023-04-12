Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2BF3C02
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681325905; x=1712861905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cOvRvmdOcjKTKaPRHIwZSdM4gnUfgayLyPINRcDqfls=;
  b=LARafzlRaK9Q1TENV8zTNzKJg2HrA+A/qnIQ4duhqbGkGlkawTqSAENL
   jJ7cGq1mqAB6CmxbR9BTHtjHP9rBQn/UJ+cSPHamqQvULSt9wqte5b70E
   cEa7hqzblGF/pyTkv/+9APbm7Lhf1VoFWLtvBRPDnPlFiPMTlEI8z1u3O
   Hx0pAT9/5gkBo2Bp0Fwq4Vxkh8Bl8n3bQqltNW0zc6ZqSSUMV/brnAPgY
   k8VjLwWFAwJuvShMsyWfth07ys8hvx/3dlv1Jz6DSX95L1ZvjSkwWiIM/
   JPsMrHwRCYEPVopmUIEsojW3OmCwvvjtgmA3Mx4a8xE/SS3tJt1obdzjO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346671143"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="346671143"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 11:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721702816"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="721702816"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Apr 2023 11:58:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmffh-000Xzr-0p;
	Wed, 12 Apr 2023 18:58:21 +0000
Date: Thu, 13 Apr 2023 02:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>, tytso@mit.edu,
	adilger.kernel@dilger.ca, ojaswin@linux.ibm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org, shikemeng@huaweicloud.com
Subject: Re: [PATCH v2 19/19] ext4: add first unit test for
 ext4_mb_new_blocks_simple in mballoc
Message-ID: <202304130200.eNNpj54h-lkp@intel.com>
References: <20230412172833.2317696-20-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412172833.2317696-20-shikemeng@huaweicloud.com>

Hi Kemeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on next-20230412]
[cannot apply to linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kemeng-Shi/ext4-fix-wrong-unit-use-in-ext4_mb_normalize_request/20230412-172757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230412172833.2317696-20-shikemeng%40huaweicloud.com
patch subject: [PATCH v2 19/19] ext4: add first unit test for ext4_mb_new_blocks_simple in mballoc
config: loongarch-randconfig-r004-20230409 (https://download.01.org/0day-ci/archive/20230413/202304130200.eNNpj54h-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3ceb1daf83fdf578c28ede1a10e55f05ef7642d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kemeng-Shi/ext4-fix-wrong-unit-use-in-ext4_mb_normalize_request/20230412-172757
        git checkout 3ceb1daf83fdf578c28ede1a10e55f05ef7642d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130200.eNNpj54h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/mballoc.c: In function 'ext4_mb_mark_group_bb':
   fs/ext4/mballoc.c:3752:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3752 |         handle_t *handle = mc->handle;
         |         ^~~~~~~~
   In file included from fs/ext4/mballoc.c:6523:
   fs/ext4/mballoc-test.c: At top level:
>> fs/ext4/mballoc-test.c:153:1: warning: no previous prototype for 'ext4_read_block_bitmap_nowait_stub' [-Wmissing-prototypes]
     153 | ext4_read_block_bitmap_nowait_stub(struct super_block *sb, ext4_group_t block_group,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ext4/mballoc-test.c:162:5: warning: no previous prototype for 'ext4_wait_block_bitmap_stub' [-Wmissing-prototypes]
     162 | int ext4_wait_block_bitmap_stub(struct super_block *sb,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ext4/mballoc-test.c:169:25: warning: no previous prototype for 'ext4_get_group_desc_stub' [-Wmissing-prototypes]
     169 | struct ext4_group_desc *ext4_get_group_desc_stub(struct super_block *sb,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ext4/mballoc-test.c:181:5: warning: no previous prototype for 'ext4_mb_mark_group_bb_stub' [-Wmissing-prototypes]
     181 | int ext4_mb_mark_group_bb_stub(struct ext4_mark_context *mc,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ext4_read_block_bitmap_nowait_stub +153 fs/ext4/mballoc-test.c

   151	
   152	struct buffer_head *
 > 153	ext4_read_block_bitmap_nowait_stub(struct super_block *sb, ext4_group_t block_group,
   154					   bool ignore_locked)
   155	{
   156		struct mb_grp_ctx *grp_ctx = MB_GRP_CTX(sb, block_group);
   157	
   158		get_bh(&grp_ctx->bitmap_bh);
   159		return &grp_ctx->bitmap_bh;
   160	}
   161	
 > 162	int ext4_wait_block_bitmap_stub(struct super_block *sb,
   163					ext4_group_t block_group,
   164					struct buffer_head *bh)
   165	{
   166		return 0;
   167	}
   168	
 > 169	struct ext4_group_desc *ext4_get_group_desc_stub(struct super_block *sb,
   170						     ext4_group_t block_group,
   171						     struct buffer_head **bh)
   172	{
   173		struct mb_grp_ctx *grp_ctx = MB_GRP_CTX(sb, block_group);
   174	
   175		if (bh != NULL)
   176			*bh = &grp_ctx->gd_bh;
   177	
   178		return &grp_ctx->desc;
   179	}
   180	
 > 181	int ext4_mb_mark_group_bb_stub(struct ext4_mark_context *mc,
   182				       ext4_group_t group, ext4_grpblk_t blkoff,
   183				       ext4_grpblk_t len, int flags)
   184	{
   185		struct mb_grp_ctx *grp_ctx = MB_GRP_CTX(mc->sb, group);
   186		struct buffer_head *bitmap_bh = &grp_ctx->bitmap_bh;
   187	
   188		if (mc->state)
   189			mb_set_bits(bitmap_bh->b_data, blkoff, len);
   190		else
   191			mb_clear_bits(bitmap_bh->b_data, blkoff, len);
   192	
   193		return 0;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
