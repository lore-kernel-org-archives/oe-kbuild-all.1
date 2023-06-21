Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F1A10FB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 01:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687310629; x=1718846629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZrqGHq0mL8z5Z88231g4LCzcTyFnr0T0ya0ZxpD9tBo=;
  b=lcqtHuERJYXlkMbyoYdwIHBnbbshicnwoH8yPvGDI3L7ZGwBzDF3NPxV
   vfbpVzivf46FvyR4lGUmbZ8qcrSSILJB+cqlD/1pt138xGvu2IzqSgKTT
   cEu2rkfdHclPIm/chX6OFDP4Bt8LFL03GgQFwH6DAa+r+zI7J9+8NHXR9
   xTmKHiE2F6HYhSu7nWA8AZysV5AytWlpNZQI9AXUdn01AAK8lNfKijd5g
   u8e8VkNbHlFMS/B0/CNY+x39DUXuHrDTnezY+fJv/g3iC7Zkl6u05HEtw
   Ese2CiJaFtGhTx6tNbPyC5e5wriyFLIci9Wyx1iOpiMi1gMKlb58pWGlK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="389419638"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="389419638"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 18:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="717425036"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="717425036"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2023 18:23:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBmZX-0006PI-2E;
	Wed, 21 Jun 2023 01:23:47 +0000
Date: Wed, 21 Jun 2023 09:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:drop-count 1/1]
 drivers/staging/media/tegra-video/tegra20.c:570:31: error: initialization of
 'int (*)(struct vb2_queue *)' from incompatible pointer type 'int (*)(struct
 vb2_queue *, u32)' {aka 'int (*)(struct vb2_queue *, unsigned int)'}
Message-ID: <202306210933.6TK7mQuo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git drop-count
head:   1c9aaf193556b0c5be8007bd4b241fa5b42a4326
commit: 1c9aaf193556b0c5be8007bd4b241fa5b42a4326 [1/1] Drop count arg with start_streaming
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230621/202306210933.6TK7mQuo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210933.6TK7mQuo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210933.6TK7mQuo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/tegra-video/tegra20.c:570:31: error: initialization of 'int (*)(struct vb2_queue *)' from incompatible pointer type 'int (*)(struct vb2_queue *, u32)' {aka 'int (*)(struct vb2_queue *, unsigned int)'} [-Werror=incompatible-pointer-types]
     570 |         .vi_start_streaming = tegra20_vi_start_streaming,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/tegra20.c:570:31: note: (near initialization for 'tegra20_vi_ops.vi_start_streaming')
   cc1: some warnings being treated as errors


vim +570 drivers/staging/media/tegra-video/tegra20.c

e740d199cf0ff1 Luca Ceresoli 2023-04-18  563  
e740d199cf0ff1 Luca Ceresoli 2023-04-18  564  static const struct tegra_vi_ops tegra20_vi_ops = {
e740d199cf0ff1 Luca Ceresoli 2023-04-18  565  	.vi_enable = tegra20_vi_enable,
e740d199cf0ff1 Luca Ceresoli 2023-04-18  566  	.channel_host1x_syncpt_init = tegra20_channel_host1x_syncpt_init,
e740d199cf0ff1 Luca Ceresoli 2023-04-18  567  	.channel_host1x_syncpt_free = tegra20_channel_host1x_syncpt_free,
e740d199cf0ff1 Luca Ceresoli 2023-04-18  568  	.vi_fmt_align = tegra20_fmt_align,
e740d199cf0ff1 Luca Ceresoli 2023-04-18  569  	.channel_queue_setup = tegra20_channel_queue_setup,
e740d199cf0ff1 Luca Ceresoli 2023-04-18 @570  	.vi_start_streaming = tegra20_vi_start_streaming,
e740d199cf0ff1 Luca Ceresoli 2023-04-18  571  	.vi_stop_streaming = tegra20_vi_stop_streaming,
e740d199cf0ff1 Luca Ceresoli 2023-04-18  572  };
e740d199cf0ff1 Luca Ceresoli 2023-04-18  573  

:::::: The code at line 570 was first introduced by commit
:::::: e740d199cf0ff1e53ddc2ab067c0a09b55845d68 staging: media: tegra-video: add support for Tegra20 parallel input

:::::: TO: Luca Ceresoli <luca.ceresoli@bootlin.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
