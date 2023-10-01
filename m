Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AA944B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696144204; x=1727680204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sp2tUtXlza2trcBkB1T7QXm/9hI992+VDp0Pa+TJSnk=;
  b=fR96BjFTdC3XwGns/6sPLZxf4ALGv+7Cl0DfFcDlByBoc4VyFZwl+TUu
   DczHzzkyQGaULKuL2DbLDCe0tCzbe56VLxnpTj15c1frRtTS9Y7mgRMdE
   Z1lqpapDHb2noFuy8eq4M0LILDU4Lqfejl1XyhNhcn8x3ygI0IipQZMp7
   19FH9oX9oHVT97qccmcXcM9PHJPIC/+4i6ZnppwhoK86y2b4k8nkQiw4d
   qydiMeqB7xakJCd/5X8gLOwnmbgyo6rZaxHaXbsV04DbjuhmNN43olLxG
   n+016NclpUuWEm1L/QGwNP4HYwp18TNCsQtxefezn5yG8QVE7AswBPGZN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="362764409"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="362764409"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 00:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="779655225"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="779655225"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Oct 2023 00:09:51 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmqaL-0004s2-2C;
	Sun, 01 Oct 2023 07:09:49 +0000
Date: Sun, 1 Oct 2023 15:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:delbuf 234/282]
 drivers/media/common/videobuf2/videobuf2-core.c:39:2: error: #error Expected
 PAGE_SHIFT to be 12
Message-ID: <202310011439.OwR48ALH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git delbuf
head:   1bc6667f0589132aa48871dbc62e8bca3f5827fb
commit: 731a94840769c87f3bab57b033ccc89b9f4f9bef [234/282] media: videobuf2: Rework offset 'cookie' encoding pattern
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231001/202310011439.OwR48ALH-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011439.OwR48ALH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011439.OwR48ALH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/common/videobuf2/videobuf2-core.c:39:2: error: #error Expected PAGE_SHIFT to be 12
      39 | #error Expected PAGE_SHIFT to be 12
         |  ^~~~~


vim +39 drivers/media/common/videobuf2/videobuf2-core.c

    37	
    38	#if PAGE_SHIFT != 12
  > 39	#error Expected PAGE_SHIFT to be 12
    40	#endif
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
