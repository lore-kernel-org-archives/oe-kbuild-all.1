Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95E26AB6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678280927; x=1709816927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EohLf2ONeHucDj+eZKSfV/y8mF/OnSS96XWJpLy4i+E=;
  b=PS4T1F0Q11fKRn73y/qzZmYI8tLw/yuyYHu/VOBFDRzVuovK9M5hwQWH
   z39Ai0AzKHrhCYdHEMeSgVM4xRxkC3jOo4xWwyc8Ffysy/Vk9OVG5KKr0
   7bmylB10gMHwmtcw01kMyf7W8tLJRBMxk1g6KLEat5R71u2EWYzOjZC87
   TWuEs4L1gBpVf+xr2Ne1Bey+6SjqBytOe7pbJM/7C24CRSs7yHL3hZ9wF
   PLeGm7lWqhWWnSycZtchvVeXAUnXydVbDb55eNEv+IV8vgr/RBNIF7eYv
   V68nrpa80SKiGUZcZ5FOA+plTbBDzQ8dJ8KvKGMJuf+vEEn4G9JyGNT7L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333618016"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="333618016"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 05:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="851076539"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="851076539"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 05:08:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZtXB-00028h-0R;
	Wed, 08 Mar 2023 13:08:45 +0000
Date: Wed, 8 Mar 2023 21:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15-arcvm
 11/16] virtio_video_enc.c:undefined reference to `__aeabi_uldivmod'
Message-ID: <202303082117.gQnuUDL0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.15-arcvm
head:   e09e14eaa904078befb89ae73f24f9ee6f7dab6e
commit: d12a3174c5d0a6a0f498d6ba2abf6caee3844082 [11/16] Convert nsec to usec in encoder buffer timestamps
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303082117.gQnuUDL0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/d12a3174c5d0a6a0f498d6ba2abf6caee3844082
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.15-arcvm
        git checkout d12a3174c5d0a6a0f498d6ba2abf6caee3844082
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082117.gQnuUDL0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/virtio/virtio_video_enc.o: in function `virtio_video_enc_buf_queue':
>> virtio_video_enc.c:(.text+0x984): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
