Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3DB214E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 16:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691685140; x=1723221140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3jchyk3KAcfVY7g00972y3+C7h+3MzBBwONeBkjIkKM=;
  b=GFXLDSArsNKuU09WBQhRGdp6heZ3xIwafYclCUWx1+7zbCDU7yYAZwQv
   A6RFj1aiaX2uzD/W1HTOv/Y6+U4IiOoTyCM1zUOw1W1ClYleiJqOQv2ex
   GOq63zT00VD7l88w1w7X5K06tprePTOYWfnfoaQJpGw96X2rbI1W2N4zT
   qn2pzMSKqASMx8NOthmW2Mx9OyeO1vlzbOVUFyaHq9VSD7u25iteghLjx
   8rW/s+0mFj8ZLco9irvISq5f8zPZXooUyeBpU247bzJ7CIIfgs/NQc10S
   4A+L1feaGDcsX0c/HIW3rOTnfy8K8Va0IyKeJCs4KvpmVCuXlqjys7p31
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="402430619"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="402430619"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 09:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="761856022"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="761856022"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Aug 2023 09:31:14 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU8Z7-00077I-2G;
	Thu, 10 Aug 2023 16:31:13 +0000
Date: Fri, 11 Aug 2023 00:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Maxime Ripard <mripard@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: [linux-next:master 5608/8441] i2c-hid-core.c:undefined reference to
 `drm_panel_remove_follower'
Message-ID: <202308110003.nNRe30qb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 96a37bfd232ae912648c73cd2dc29c13f1c7776a [5608/8441] HID: i2c-hid: Support being a panel follower
config: arc-randconfig-r092-20230809 (https://download.01.org/0day-ci/archive/20230811/202308110003.nNRe30qb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110003.nNRe30qb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110003.nNRe30qb-lkp@intel.com/

Note: the linux-next/master HEAD 21ef7b1e17d039053edaeaf41142423810572741 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arceb-elf-ld: drivers/hid/i2c-hid/i2c-hid-core.o: in function `i2c_hid_core_remove':
>> i2c-hid-core.c:(.text+0xe52): undefined reference to `drm_panel_remove_follower'
>> arceb-elf-ld: i2c-hid-core.c:(.text+0xe52): undefined reference to `drm_panel_remove_follower'
   arceb-elf-ld: drivers/hid/i2c-hid/i2c-hid-core.o: in function `i2c_hid_core_probe.part.0':
>> i2c-hid-core.c:(.text+0x113e): undefined reference to `drm_is_panel_follower'
>> arceb-elf-ld: i2c-hid-core.c:(.text+0x113e): undefined reference to `drm_is_panel_follower'
>> arceb-elf-ld: i2c-hid-core.c:(.text+0x11de): undefined reference to `drm_panel_add_follower'
>> arceb-elf-ld: i2c-hid-core.c:(.text+0x11de): undefined reference to `drm_panel_add_follower'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_HID_CORE
   Depends on [m]: HID_SUPPORT [=y] && I2C_HID [=y] && (DRM [=m] || !DRM [=m])
   Selected by [y]:
   - I2C_HID_OF_GOODIX [=y] && HID_SUPPORT [=y] && I2C_HID [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
