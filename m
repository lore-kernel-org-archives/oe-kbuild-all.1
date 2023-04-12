Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD469474
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 20:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681330224; x=1712866224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mq/ZS1kYUp43xyc9n45WhnjeuO9jHSj6ScAOp4KsheY=;
  b=A+W3YhO9+rHJIirKAkgjvuNP1Sdqt+FsDQL98lP3AnaVVx7eTXyXWt+I
   ioivjH6Y3HMF/zDliBJxABwZmBcEVcrVoGL5mZe5cWPsIP7XyIix4wm0V
   okqDTlC+gKb6SLDBFQu21heFBicU0ig0Lw++ustBMyA7exyZwdl8djZIc
   Ca2/bZOm5GuT15f++QOcUhOcSnOsztXv6NUD67t2VgDQsFBBHxSVri7wQ
   /MIgPZt2gCmkDg03+QrboQApjU5B/+zo1BUwBKVe+BADEIqYS4JDUKiOb
   Ubac9gutNLtz1QssL/FYgsK0Xv4UdNGegGRN1g6iUcH3DASiLeSs/hrtH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430298463"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="430298463"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 13:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="778438186"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="778438186"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2023 13:10:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmgnO-000Y1n-14;
	Wed, 12 Apr 2023 20:10:22 +0000
Date: Thu, 13 Apr 2023 04:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Nava kishore Manne <nava.manne@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 132/1065]
 drivers/of/configfs.c:134:9: warning: no previous prototype for
 'cfs_overlay_item_dtbo_read'
Message-ID: <202304130404.m8FEI58k-lkp@intel.com>
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
commit: 698cb7a307651a82aa2786c6ae8fac13e9cddf2d [132/1065] OF: DT-Overlay configfs interface (v8)
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304130404.m8FEI58k-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/698cb7a307651a82aa2786c6ae8fac13e9cddf2d
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout 698cb7a307651a82aa2786c6ae8fac13e9cddf2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/irqchip/ drivers/media/i2c/ drivers/media/mc/ drivers/net/ethernet/xilinx/ drivers/of/ drivers/ptp/ drivers/spi/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130404.m8FEI58k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/configfs.c:134:9: warning: no previous prototype for 'cfs_overlay_item_dtbo_read' [-Wmissing-prototypes]
     134 | ssize_t cfs_overlay_item_dtbo_read(struct config_item *item,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/of/configfs.c:156:9: warning: no previous prototype for 'cfs_overlay_item_dtbo_write' [-Wmissing-prototypes]
     156 | ssize_t cfs_overlay_item_dtbo_write(struct config_item *item,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cfs_overlay_item_dtbo_read +134 drivers/of/configfs.c

   133	
 > 134	ssize_t cfs_overlay_item_dtbo_read(struct config_item *item,
   135					   void *buf, size_t max_count)
   136	{
   137		struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
   138	
   139		pr_debug("%s: buf=%p max_count=%zu\n", __func__, buf, max_count);
   140	
   141		if (!overlay->dtbo)
   142			return 0;
   143	
   144		/* copy if buffer provided */
   145		if (buf) {
   146			/* the buffer must be large enough */
   147			if (overlay->dtbo_size > max_count)
   148				return -ENOSPC;
   149	
   150			memcpy(buf, overlay->dtbo, overlay->dtbo_size);
   151		}
   152	
   153		return overlay->dtbo_size;
   154	}
   155	
 > 156	ssize_t cfs_overlay_item_dtbo_write(struct config_item *item,
   157					    const void *buf, size_t count)
   158	{
   159		struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
   160		int err;
   161	
   162		/* if it's set do not allow changes */
   163		if (overlay->path[0] != '\0' || overlay->dtbo_size > 0)
   164			return -EPERM;
   165	
   166		/* copy the contents */
   167		overlay->dtbo = kmemdup(buf, count, GFP_KERNEL);
   168		if (!overlay->dtbo)
   169			return -ENOMEM;
   170	
   171		overlay->dtbo_size = count;
   172	
   173		err = create_overlay(overlay, overlay->dtbo);
   174		if (err < 0)
   175			goto out_err;
   176	
   177		return count;
   178	
   179	out_err:
   180		kfree(overlay->dtbo);
   181		overlay->dtbo = NULL;
   182		overlay->dtbo_size = 0;
   183	
   184		return err;
   185	}
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
