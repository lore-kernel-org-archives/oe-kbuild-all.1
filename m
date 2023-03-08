Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065C7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 02:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678242214; x=1709778214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xDCYWOSzpKAXkdNbI7bYj3Kew1lYHD+0tSb1EB66fCo=;
  b=nDdzwRQj0wphJyuwZA6QkuLBVcs8iXy/utuLdhbX8oBgNnvDa/Acw6mJ
   0zyg7R9OPXiHgCqGs9n50YAVdt25u5qnFSSaak8ztBHqt/s7C7gh1NnOf
   J/WpIvMoDRWwHd/ikqCtiniqdXsqe1Fx/0MhQcTJ/n/6SzBAX/8Vvk2YU
   BiUgY1Vcib2n9jVLi7bCYB2Nf/9YOs6NcIdlV5wATUr0EKdb3yzmJ9Mtj
   b586fAJ18fnTf+FSRWLk1/2qHwE6e7JjOkm6sJHK+649M2HNvhRRAit+4
   rba5tSaDnh9qxqXj3jtCRgOPdYgLiLGRaMaKEF+nladsVGrWGYDbQZlEi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324348049"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="324348049"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 18:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922608265"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="922608265"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Mar 2023 18:23:33 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZjSm-0001oD-1J;
	Wed, 08 Mar 2023 02:23:32 +0000
Date: Wed, 8 Mar 2023 10:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-arcvm 40/40] mm/vmscan.c:5278:5:
 warning: no previous prototype for 'print_node_mglru'
Message-ID: <202303081041.5Ph6IFtj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-arcvm
head:   e09e14eaa904078befb89ae73f24f9ee6f7dab6e
commit: e09e14eaa904078befb89ae73f24f9ee6f7dab6e [40/40] CHROMIUM: Implementation of MGLRU in sysfs
config: arm-randconfig-r046-20230306 (https://download.01.org/0day-ci/archive/20230308/202303081041.5Ph6IFtj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-arcvm
        git checkout e09e14eaa904078befb89ae73f24f9ee6f7dab6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081041.5Ph6IFtj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c:906:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     906 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:1376:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1376 |         int err;
         |             ^~~
   mm/vmscan.c: At top level:
>> mm/vmscan.c:5278:5: warning: no previous prototype for 'print_node_mglru' [-Wmissing-prototypes]
    5278 | int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
         |     ^~~~~~~~~~~~~~~~


vim +/print_node_mglru +5278 mm/vmscan.c

  5277	
> 5278	int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
  5279	{
  5280		unsigned long seq;
  5281		struct lru_gen_struct *lrugen = &lruvec->lrugen;
  5282	
  5283		DEFINE_MAX_SEQ(lruvec);
  5284		DEFINE_MIN_SEQ(lruvec);
  5285	
  5286		int print_pos = orig_pos;
  5287	
  5288		seq = min(min_seq[0], min_seq[1]);
  5289	
  5290		for (; seq <= max_seq; seq++) {
  5291			int gen, type, zone;
  5292			unsigned int msecs;
  5293	
  5294			gen = lru_gen_from_seq(seq);
  5295			msecs = jiffies_to_msecs(jiffies - READ_ONCE(lrugen->timestamps[gen]));
  5296	
  5297			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos,
  5298				" %10lu %10u", seq, msecs);
  5299	
  5300			for (type = 0; type < ANON_AND_FILE; type++) {
  5301				long size = 0;
  5302	
  5303				if (seq < min_seq[type]) {
  5304					print_pos += snprintf(buf + print_pos,
  5305						PAGE_SIZE - print_pos, "         -0 ");
  5306					continue;
  5307				}
  5308	
  5309				for (zone = 0; zone < MAX_NR_ZONES; zone++)
  5310					size += READ_ONCE(lrugen->nr_pages[gen][type][zone]);
  5311	
  5312				print_pos += snprintf(buf + print_pos,
  5313					PAGE_SIZE - print_pos, " %10lu ", max(size, 0L));
  5314			}
  5315	
  5316			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos, "\n");
  5317	
  5318		}
  5319	
  5320		return print_pos - orig_pos;
  5321	}
  5322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
