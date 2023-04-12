Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53522CA5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 23:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681343849; x=1712879849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K5Trul80Qxoqq2gAi8o1HaHYaaAZdarjBYzCrq60Z3Q=;
  b=QXZue7dli9c+y5JOE44skzQtd2R7yFbK5hzicrZGaDATbXaZ74Zx8oZR
   Lbhc4vL2hkrw1IsBP0dzvPwuWcV1bIPNR/Cw3bY+aknWMKqm6u4TFsZXI
   wRFHpgzMIE3ChINGw0Scn4fGrjeoIXBx8jbsOz5HBuv90iPdBl/Lz54mU
   wZO2NoG2+ZcPuw2HAn76B//vD/7ow+AfYd1mBMkvauis8+5OMauZyXMrd
   DOH+N5NKpn8ihp8siWf3gmjJg2MzQ1oWnat8JOeuyTNOmh8MVf9GuaCqG
   mUER3vxLUAX/cIYfmItG6ZWR/Y4oeeejWj82b+wQDFqCe6Do2v625lRcY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346731890"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="346731890"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 16:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639421871"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="639421871"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Apr 2023 16:57:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmkL8-000Y9P-2I;
	Wed, 12 Apr 2023 23:57:26 +0000
Date: Thu, 13 Apr 2023 07:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 282/1065]
 drivers/media/mc/mc-entity.c:333: warning: expecting prototype for
 media_entity_graph_walk_init(). Prototype was for media_graph_walk_init()
 instead
Message-ID: <202304130727.t5lIYuIa-lkp@intel.com>
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
commit: f7de2dee5bdb4c8795acf268919e1be16e2b013f [282/1065] media: entity: Add media_entity_has_route() function
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304130727.t5lIYuIa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/f7de2dee5bdb4c8795acf268919e1be16e2b013f
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout f7de2dee5bdb4c8795acf268919e1be16e2b013f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/irqchip/ drivers/media/i2c/ drivers/media/mc/ drivers/net/ethernet/xilinx/ drivers/spi/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130727.t5lIYuIa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/mc/mc-entity.c:333: warning: expecting prototype for media_entity_graph_walk_init(). Prototype was for media_graph_walk_init() instead


vim +333 drivers/media/mc/mc-entity.c

f7de2dee5bdb4c drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  319  
f7de2dee5bdb4c drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  320  /**
f7de2dee5bdb4c drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  321   * media_entity_graph_walk_init - Allocate resources for graph walk
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  322   * @graph: Media graph structure that will be used to walk the graph
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  323   * @mdev: Media device
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  324   *
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  325   * Reserve resources for graph walk in media device's current
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  326   * state. The memory must be released using
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  327   * media_graph_walk_free().
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  328   *
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  329   * Returns error on failure, zero on success.
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  330   */
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  331  __must_check int media_graph_walk_init(
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  332  	struct media_graph *graph, struct media_device *mdev)
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16 @333  {
29d8da02d13020 drivers/media/media-entity.c Sakari Ailus     2015-12-16  334  	return media_entity_enum_init(&graph->ent_enum, mdev);
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  335  }
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  336  EXPORT_SYMBOL_GPL(media_graph_walk_init);
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  337  

:::::: The code at line 333 was first introduced by commit
:::::: e03d220336dd69292370393f5eee98ac17eda308 [media] media: Amend media graph walk API by init and cleanup functions

:::::: TO: Sakari Ailus <sakari.ailus@iki.fi>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
