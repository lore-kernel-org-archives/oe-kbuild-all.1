Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746382CA6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685121224; x=1716657224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKf30GzmTV//LytmILcL7m9uzWJ9KkcfoncHkT1Fy8A=;
  b=bW2t8gH1nossQnWDW1lO/OPAZ9EzM1kguHZmd6537qOLgkwDQvSlWZ7X
   19nXkyGA1q6zQM9y7ZDtkXtpzZ64pRv2caQ8tWJMrUfj3A/eJABZoxP0w
   o59RFyUmytawTnMi23qyJagj52fIInTGYlm+uzTwotHP3usGLWh8dSyL0
   22Fi8dvKABhEul/C9VHMr6xOy9OkW9yLXH55NCwpP1iJudYz5YnWkmOei
   fx2ut5WIb57z9xGjkhNexsSvVx/fL5s+KBzaTD3carzXT9B7LR6UpCbe0
   Ah/cdW6QGpa3DBbZCSJutPOvzYtYBcPoIeStq1ulcqcwiwvytgLhlvwco
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382501479"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="382501479"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 10:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="655706744"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="655706744"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 May 2023 10:13:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2b0V-000JUg-0f;
	Fri, 26 May 2023 17:13:39 +0000
Date: Sat, 27 May 2023 01:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/md/dm-bow.c:97:10: warning: no previous prototype for
 'range_top'
Message-ID: <202305270119.6WXetqzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 184f0876d5a9e629ebf1bcb3398c74a310c02b3e ANDROID: dm-bow: Add dm-bow feature
date:   2 years, 5 months ago
config: nds32-randconfig-r014-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270119.6WXetqzq-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=184f0876d5a9e629ebf1bcb3398c74a310c02b3e
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 184f0876d5a9e629ebf1bcb3398c74a310c02b3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=nds32 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=nds32 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270119.6WXetqzq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-bow.c:97:10: warning: no previous prototype for 'range_top' [-Wmissing-prototypes]
      97 | sector_t range_top(struct bow_range *br)
         |          ^~~~~~~~~
>> drivers/md/dm-bow.c:103:5: warning: no previous prototype for 'range_size' [-Wmissing-prototypes]
     103 | u64 range_size(struct bow_range *br)
         |     ^~~~~~~~~~
>> drivers/md/dm-bow.c:148:6: warning: no previous prototype for 'add_before' [-Wmissing-prototypes]
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         |      ^~~~~~~~~~
>> drivers/md/dm-bow.c:1093:5: warning: no previous prototype for 'remap_unless_illegal_trim' [-Wmissing-prototypes]
    1093 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c: In function 'dm_bow_map':
>> drivers/md/dm-bow.c:1129:51: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1129 |                                 /* pass-through */;
         |                                                   ^
   drivers/md/dm-bow.c:1136:51: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1136 |                                 /* pass-through */;
         |                                                   ^
   drivers/md/dm-bow.c: At top level:
>> drivers/md/dm-bow.c:1248:5: warning: no previous prototype for 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
    1248 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/md/dm-bow.c:1279:12: warning: no previous prototype for 'dm_bow_init' [-Wmissing-prototypes]
    1279 | int __init dm_bow_init(void)
         |            ^~~~~~~~~~~
>> drivers/md/dm-bow.c:1288:6: warning: no previous prototype for 'dm_bow_exit' [-Wmissing-prototypes]
    1288 | void dm_bow_exit(void)
         |      ^~~~~~~~~~~


vim +/range_top +97 drivers/md/dm-bow.c

    96	
  > 97	sector_t range_top(struct bow_range *br)
    98	{
    99		return container_of(rb_next(&br->node), struct bow_range, node)
   100			->sector;
   101	}
   102	
 > 103	u64 range_size(struct bow_range *br)
   104	{
   105		return (range_top(br) - br->sector) * SECTOR_SIZE;
   106	}
   107	
   108	static sector_t bvec_top(struct bvec_iter *bi_iter)
   109	{
   110		return bi_iter->bi_sector + bi_iter->bi_size / SECTOR_SIZE;
   111	}
   112	
   113	/*
   114	 * Find the first range that overlaps with bi_iter
   115	 * bi_iter is set to the size of the overlapping sub-range
   116	 */
   117	static struct bow_range *find_first_overlapping_range(struct rb_root *ranges,
   118							      struct bvec_iter *bi_iter)
   119	{
   120		struct rb_node *node = ranges->rb_node;
   121		struct bow_range *br;
   122	
   123		while (node) {
   124			br = container_of(node, struct bow_range, node);
   125	
   126			if (br->sector <= bi_iter->bi_sector
   127			    && bi_iter->bi_sector < range_top(br))
   128				break;
   129	
   130			if (bi_iter->bi_sector < br->sector)
   131				node = node->rb_left;
   132			else
   133				node = node->rb_right;
   134		}
   135	
   136		WARN_ON(!node);
   137		if (!node)
   138			return NULL;
   139	
   140		if (range_top(br) - bi_iter->bi_sector
   141		    < bi_iter->bi_size >> SECTOR_SHIFT)
   142			bi_iter->bi_size = (range_top(br) - bi_iter->bi_sector)
   143				<< SECTOR_SHIFT;
   144	
   145		return br;
   146	}
   147	
 > 148	void add_before(struct rb_root *ranges, struct bow_range *new_br,
   149			struct bow_range *existing)
   150	{
   151		struct rb_node *parent = &(existing->node);
   152		struct rb_node **link = &(parent->rb_left);
   153	
   154		while (*link) {
   155			parent = *link;
   156			link = &((*link)->rb_right);
   157		}
   158	
   159		rb_link_node(&new_br->node, parent, link);
   160		rb_insert_color(&new_br->node, ranges);
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
