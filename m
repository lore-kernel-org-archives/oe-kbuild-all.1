Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF744D535
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 18:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675622429; x=1707158429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hR6EMvIGTDXMxW+OgCLyN1kH3Wg6dNiny6FEWgmvK0Y=;
  b=etbO/vPriuQ7StOdpxnaE7sKfH4tHKIkokrOXs9ncWkgG5YfcItTfGUJ
   zboY4q4TpHk0WPr3BTgGiobQLPhsGTHrMZ0/buBRP/NtKEDBtGse3KRjo
   zcQ5rgV3DntW3qgsqa9LyYOJCiH4q2wRSJXSkylRghEHtLkFlAEiVprDi
   Ji4RWQzynq3lmT9A5K1nO2tQ+Z7ztEn074MUXp+OVoWKADV52KBpSQkZg
   1EkuYmmwL9nhh51SpEbarxYCScM5PXFRb7A1PB9qmkCvArTLRPS9I1T6r
   OsaO2604rvVe0WzerQFHY7tSI+LBG72R1f4orhLi+kFwKE8GOpjnWN76q
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="330368120"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="330368120"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 10:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="666291287"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="666291287"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Feb 2023 10:40:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOjwA-00029j-1b;
	Sun, 05 Feb 2023 18:40:26 +0000
Date: Mon, 6 Feb 2023 02:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/media/virtio/virtio_video_driver.c:90:26: sparse: sparse:
 symbol 'dma_phys_ops' was not declared. Should it be static?
Message-ID: <202302060205.Dyxi0jaY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 80041cae8e8ca7f9c5ff0c8e22dbd7d4b27d9a6f BACKPORT: FROMLIST: virtio_video: Add the Virtio Video V4L2 driver
date:   2 years, 2 months ago
config: m68k-randconfig-s051-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060205.Dyxi0jaY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=80041cae8e8ca7f9c5ff0c8e22dbd7d4b27d9a6f
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 80041cae8e8ca7f9c5ff0c8e22dbd7d4b27d9a6f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/media/virtio/virtio_video_driver.c:90:26: sparse: sparse: symbol 'dma_phys_ops' was not declared. Should it be static?
>> drivers/media/virtio/virtio_video_driver.c:227:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
>> drivers/media/virtio/virtio_video_driver.c:227:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> drivers/media/virtio/virtio_video_driver.c:227:9: sparse:    bad type *
>> drivers/media/virtio/virtio_video_driver.c:227:9: sparse:    unsigned int *
>> drivers/media/virtio/virtio_video_driver.c:227:9: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'
   drivers/media/virtio/virtio_video_driver.c:235:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
   drivers/media/virtio/virtio_video_driver.c:235:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_driver.c:235:9: sparse:    bad type *
   drivers/media/virtio/virtio_video_driver.c:235:9: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_driver.c:235:9: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'
--
>> drivers/media/virtio/virtio_video_device.c:174:29: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:183:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] width @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:183:35: sparse:     expected unsigned int [usertype] width
   drivers/media/virtio/virtio_video_device.c:183:35: sparse:     got restricted __le32 [usertype] min
>> drivers/media/virtio/virtio_video_device.c:184:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] height @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:184:36: sparse:     expected unsigned int [usertype] height
   drivers/media/virtio/virtio_video_device.c:184:36: sparse:     got restricted __le32 [usertype] min
>> drivers/media/virtio/virtio_video_device.c:189:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] min_width @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:189:31: sparse:     expected unsigned int [usertype] min_width
   drivers/media/virtio/virtio_video_device.c:189:31: sparse:     got restricted __le32 [usertype] min
>> drivers/media/virtio/virtio_video_device.c:190:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_width @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:190:31: sparse:     expected unsigned int [usertype] max_width
   drivers/media/virtio/virtio_video_device.c:190:31: sparse:     got restricted __le32 [usertype] max
>> drivers/media/virtio/virtio_video_device.c:191:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] min_height @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:191:32: sparse:     expected unsigned int [usertype] min_height
   drivers/media/virtio/virtio_video_device.c:191:32: sparse:     got restricted __le32 [usertype] min
>> drivers/media/virtio/virtio_video_device.c:192:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_height @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:192:32: sparse:     expected unsigned int [usertype] max_height
   drivers/media/virtio/virtio_video_device.c:192:32: sparse:     got restricted __le32 [usertype] max
>> drivers/media/virtio/virtio_video_device.c:193:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] step_width @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:193:32: sparse:     expected unsigned int [usertype] step_width
   drivers/media/virtio/virtio_video_device.c:193:32: sparse:     got restricted __le32 [usertype] step
>> drivers/media/virtio/virtio_video_device.c:194:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] step_height @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:194:33: sparse:     expected unsigned int [usertype] step_height
   drivers/media/virtio/virtio_video_device.c:194:33: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:231:43: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:234:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] int_start @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:234:53: sparse:     expected unsigned int [usertype] int_start
   drivers/media/virtio/virtio_video_device.c:234:53: sparse:     got restricted __le32 [usertype] min
>> drivers/media/virtio/virtio_video_device.c:234:71: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] int_end @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:234:71: sparse:     expected unsigned int [usertype] int_end
   drivers/media/virtio/virtio_video_device.c:234:71: sparse:     got restricted __le32 [usertype] max
>> drivers/media/virtio/virtio_video_device.c:235:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] step @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:235:53: sparse:     expected unsigned int [usertype] step
   drivers/media/virtio/virtio_video_device.c:235:53: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:236:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] int_start @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:236:53: sparse:     expected unsigned int [usertype] int_start
   drivers/media/virtio/virtio_video_device.c:236:53: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:236:72: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] int_end @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:236:72: sparse:     expected unsigned int [usertype] int_end
   drivers/media/virtio/virtio_video_device.c:236:72: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:237:54: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] step @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:237:54: sparse:     expected unsigned int [usertype] step
   drivers/media/virtio/virtio_video_device.c:237:54: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:241:47: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:248:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:248:41: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:248:41: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:251:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:251:45: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:251:45: sparse:     got restricted __le32 [usertype] max
>> drivers/media/virtio/virtio_video_device.c:253:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:253:45: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:253:45: sparse:     got restricted __le32 [usertype] min
>> drivers/media/virtio/virtio_video_device.c:255:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:255:46: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:255:46: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:256:26: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:376:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] top @@     got signed int [usertype] top @@
   drivers/media/virtio/virtio_video_device.c:376:35: sparse:     expected restricted __le32 [usertype] top
   drivers/media/virtio/virtio_video_device.c:376:35: sparse:     got signed int [usertype] top
>> drivers/media/virtio/virtio_video_device.c:377:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] left @@     got signed int [usertype] left @@
   drivers/media/virtio/virtio_video_device.c:377:36: sparse:     expected restricted __le32 [usertype] left
   drivers/media/virtio/virtio_video_device.c:377:36: sparse:     got signed int [usertype] left
>> drivers/media/virtio/virtio_video_device.c:378:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] width @@     got unsigned int [usertype] width @@
   drivers/media/virtio/virtio_video_device.c:378:37: sparse:     expected restricted __le32 [usertype] width
   drivers/media/virtio/virtio_video_device.c:378:37: sparse:     got unsigned int [usertype] width
>> drivers/media/virtio/virtio_video_device.c:379:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] height @@     got unsigned int [usertype] height @@
   drivers/media/virtio/virtio_video_device.c:379:38: sparse:     expected restricted __le32 [usertype] height
   drivers/media/virtio/virtio_video_device.c:379:38: sparse:     got unsigned int [usertype] height
   drivers/media/virtio/virtio_video_device.c:421:34: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:424:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] min @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:424:47: sparse:     expected unsigned int [usertype] min
   drivers/media/virtio/virtio_video_device.c:424:47: sparse:     got restricted __le32 [usertype] min
>> drivers/media/virtio/virtio_video_device.c:425:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] max @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:425:47: sparse:     expected unsigned int [usertype] max
   drivers/media/virtio/virtio_video_device.c:425:47: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:428:48: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] min @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:428:48: sparse:     expected unsigned int [usertype] min
   drivers/media/virtio/virtio_video_device.c:428:48: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:429:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] max @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:429:48: sparse:     expected unsigned int [usertype] max
   drivers/media/virtio/virtio_video_device.c:429:48: sparse:     got restricted __le32 [usertype] max
>> drivers/media/virtio/virtio_video_device.c:436:64: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] a @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:436:64: sparse:     expected unsigned int [usertype] a
   drivers/media/virtio/virtio_video_device.c:436:64: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:439:66: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] a @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:439:66: sparse:     expected unsigned int [usertype] a
   drivers/media/virtio/virtio_video_device.c:439:66: sparse:     got restricted __le32 [usertype] step
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse: sparse: incompatible types in comparison expression (different base types):
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    unsigned int *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    restricted __le32 *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse: sparse: cast from unknown type
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse: sparse: incompatible types in comparison expression (different base types):
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    unsigned int *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    restricted __le32 *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse: sparse: incompatible types in comparison expression (different base types):
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    unsigned int *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    restricted __le32 *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse: sparse: cast from unknown type
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse: sparse: incompatible types in comparison expression (different base types):
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    unsigned int *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    restricted __le32 *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse: sparse: cast from unknown type
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse: sparse: incompatible types in comparison expression (different base types):
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    unsigned int *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse:    restricted __le32 *
>> drivers/media/virtio/virtio_video_device.c:449:33: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:454:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:454:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:454:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:454:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:454:34: sparse: sparse: cast from unknown type
>> drivers/media/virtio/virtio_video_device.c:711:70: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] format @@
--
>> drivers/media/virtio/virtio_video_vq.c:241:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:242:21: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] stream_id @@
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse:     expected unsigned long id
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse:     got restricted __le32 [usertype] stream_id
>> drivers/media/virtio/virtio_video_vq.c:549:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_data_sizes @@     got unsigned char [usertype] num_data_size @@
   drivers/media/virtio/virtio_video_vq.c:549:31: sparse:     expected restricted __le32 [usertype] num_data_sizes
   drivers/media/virtio/virtio_video_vq.c:549:31: sparse:     got unsigned char [usertype] num_data_size
>> drivers/media/virtio/virtio_video_vq.c:726:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] top @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:726:31: sparse:     expected restricted __le32 [usertype] top
   drivers/media/virtio/virtio_video_vq.c:726:31: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_vq.c:727:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] left @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:727:32: sparse:     expected restricted __le32 [usertype] left
   drivers/media/virtio/virtio_video_vq.c:727:32: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_vq.c:728:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] width @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:728:33: sparse:     expected restricted __le32 [usertype] width
   drivers/media/virtio/virtio_video_vq.c:728:33: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_vq.c:729:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] height @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:729:34: sparse:     expected restricted __le32 [usertype] height
   drivers/media/virtio/virtio_video_vq.c:729:34: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:776:18: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_vq.c:818:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] @@
   drivers/media/virtio/virtio_video_vq.c:818:34: sparse:     expected unsigned int [usertype] v4l2_format
   drivers/media/virtio/virtio_video_vq.c:818:34: sparse:     got restricted __le32 [usertype]
>> drivers/media/virtio/virtio_video_vq.c:817:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] format @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:817:30: sparse:     expected restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_vq.c:817:30: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:309:28: sparse: sparse: context imbalance in 'virtio_video_queue_cmd_buffer_locked' - unexpected unlock
--
>> drivers/media/virtio/virtio_video_dec.c:313:53: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_dec.c:314:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long input_mask @@     got restricted __le64 [usertype] mask @@
   drivers/media/virtio/virtio_video_dec.c:314:36: sparse:     expected unsigned long input_mask
   drivers/media/virtio/virtio_video_dec.c:314:36: sparse:     got restricted __le64 [usertype] mask
>> drivers/media/virtio/virtio_video_dec.c:325:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pixelformat @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_dec.c:325:48: sparse:     expected unsigned int [usertype] pixelformat
   drivers/media/virtio/virtio_video_dec.c:325:48: sparse:     got restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_dec.c:352:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pixelformat @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_dec.c:352:40: sparse:     expected unsigned int [usertype] pixelformat
   drivers/media/virtio/virtio_video_dec.c:352:40: sparse:     got restricted __le32 [usertype] format
--
>> drivers/media/virtio/virtio_video_enc.c:358:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pixelformat @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_enc.c:358:40: sparse:     expected unsigned int [usertype] pixelformat
   drivers/media/virtio/virtio_video_enc.c:358:40: sparse:     got restricted __le32 [usertype] format
>> drivers/media/virtio/virtio_video_enc.c:384:53: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_enc.c:385:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long output_mask @@     got restricted __le64 [usertype] mask @@
   drivers/media/virtio/virtio_video_enc.c:385:37: sparse:     expected unsigned long output_mask
   drivers/media/virtio/virtio_video_enc.c:385:37: sparse:     got restricted __le64 [usertype] mask
   drivers/media/virtio/virtio_video_enc.c:396:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pixelformat @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_enc.c:396:48: sparse:     expected unsigned int [usertype] pixelformat
   drivers/media/virtio/virtio_video_enc.c:396:48: sparse:     got restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_enc.c:434:51: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_enc.c:438:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] min @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_enc.c:438:44: sparse:     expected unsigned int [usertype] min
   drivers/media/virtio/virtio_video_enc.c:438:44: sparse:     got restricted __le32 [usertype] min
>> drivers/media/virtio/virtio_video_enc.c:438:66: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] max @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_enc.c:438:66: sparse:     expected unsigned int [usertype] max
   drivers/media/virtio/virtio_video_enc.c:438:66: sparse:     got restricted __le32 [usertype] max
--
>> drivers/media/virtio/virtio_video_helpers.c:194:30: sparse: sparse: restricted __le32 degrades to integer
--
>> drivers/media/virtio/virtio_video_caps.c:40:38: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_caps.c:66:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] min @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:66:22: sparse:     expected restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_caps.c:66:22: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:67:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] max @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:67:22: sparse:     expected restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_caps.c:67:22: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:68:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] step @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:68:23: sparse:     expected restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_caps.c:68:23: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:107:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_rates @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:107:26: sparse:     expected restricted __le32 [usertype] num_rates
   drivers/media/virtio/virtio_video_caps.c:107:26: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:108:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted __le32 [usertype] num_rates @@
   drivers/media/virtio/virtio_video_caps.c:108:42: sparse:     expected unsigned int [usertype] n
   drivers/media/virtio/virtio_video_caps.c:108:42: sparse:     got restricted __le32 [usertype] num_rates
   drivers/media/virtio/virtio_video_caps.c:113:34: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_caps.c:146:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] format @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:146:26: sparse:     expected restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_caps.c:146:26: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:149:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] mask @@     got unsigned long long @@
   drivers/media/virtio/virtio_video_caps.c:149:24: sparse:     expected restricted __le64 [usertype] mask
   drivers/media/virtio/virtio_video_caps.c:149:24: sparse:     got unsigned long long
>> drivers/media/virtio/virtio_video_caps.c:150:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] planes_layout @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:150:33: sparse:     expected restricted __le32 [usertype] planes_layout
   drivers/media/virtio/virtio_video_caps.c:150:33: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:152:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_frames @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:152:30: sparse:     expected restricted __le32 [usertype] num_frames
   drivers/media/virtio/virtio_video_caps.c:152:30: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:153:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted __le32 [usertype] num_frames @@
   drivers/media/virtio/virtio_video_caps.c:153:39: sparse:     expected unsigned int [usertype] n
   drivers/media/virtio/virtio_video_caps.c:153:39: sparse:     got restricted __le32 [usertype] num_frames
   drivers/media/virtio/virtio_video_caps.c:158:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
>> drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
>> drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
>> drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
>> drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
>> drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
>> drivers/media/virtio/virtio_video_caps.c:457:69: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_caps.c:457:69: sparse:     expected unsigned int [usertype] v4l2_format
   drivers/media/virtio/virtio_video_caps.c:457:69: sparse:     got restricted __le32 [usertype] format
>> drivers/media/virtio/virtio_video_caps.c:468:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] format @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_caps.c:468:31: sparse:     expected unsigned int [usertype] format
   drivers/media/virtio/virtio_video_caps.c:468:31: sparse:     got restricted __le32 [usertype] format

vim +/dma_phys_ops +90 drivers/media/virtio/virtio_video_driver.c

    89	
  > 90	const struct dma_map_ops dma_phys_ops = {
    91		.alloc			= dma_phys_alloc,
    92		.free			= dma_phys_free,
    93		.map_page		= dma_phys_map_page,
    94		.map_sg			= dma_phys_map_sg,
    95	};
    96	
    97	static int virtio_video_query_cap_resp_buf(struct virtio_video *vv, void
    98						   **resp_buf, int queue_type)
    99	{
   100		int ret = 0;
   101		int resp_size = vv->max_caps_len;
   102	
   103		*resp_buf = kzalloc(vv->max_caps_len, GFP_KERNEL);
   104		if (!*resp_buf) {
   105			ret = -ENOMEM;
   106			goto err;
   107		}
   108	
   109		vv->got_caps = false;
   110		ret = virtio_video_query_capability(vv, *resp_buf, resp_size,
   111						    queue_type);
   112		if (ret) {
   113			v4l2_err(&vv->v4l2_dev, "failed to query capability\n");
   114			goto err;
   115		}
   116	
   117		ret = wait_event_timeout(vv->wq, vv->got_caps, 5 * HZ);
   118		if (ret == 0) {
   119			v4l2_err(&vv->v4l2_dev, "timed out waiting for get caps\n");
   120			ret = -EIO;
   121			goto err;
   122		}
   123	
   124		return 0;
   125	err:
   126		return ret;
   127	}
   128	
   129	static int virtio_video_init(struct virtio_video *vv)
   130	{
   131		int ret = 0;
   132		void *input_resp_buf = NULL;
   133		void *output_resp_buf = NULL;
   134	
   135		if (!vv)
   136			return -EINVAL;
   137	
   138		ret = virtio_video_query_cap_resp_buf(vv, &input_resp_buf,
   139						      VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
   140		if (ret) {
   141			v4l2_err(&vv->v4l2_dev, "failed to get input caps\n");
   142			goto err;
   143		}
   144	
   145		ret = virtio_video_query_cap_resp_buf(vv, &output_resp_buf,
   146						      VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
   147		if (ret) {
   148			v4l2_err(&vv->v4l2_dev, "failed to get output caps\n");
   149			goto err;
   150		}
   151	
   152		ret = virtio_video_device_init(vv, input_resp_buf, output_resp_buf);
   153		if (ret)
   154			v4l2_err(&vv->v4l2_dev, "failed to initialize devices\n");
   155	
   156	err:
   157		kfree(input_resp_buf);
   158		kfree(output_resp_buf);
   159	
   160		return ret;
   161	};
   162	
   163	static int virtio_video_probe(struct virtio_device *vdev)
   164	{
   165		int ret;
   166		struct virtio_video *vv;
   167		struct virtqueue *vqs[2];
   168		struct device *dev = &vdev->dev;
   169	
   170		static const char * const names[] = { "control", "event" };
   171		static vq_callback_t *callbacks[] = {
   172			virtio_video_cmd_ack,
   173			virtio_video_event_ack
   174		};
   175	
   176		if (!virtio_has_feature(vdev, VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES)) {
   177			dev_err(dev, "device must support guest allocated buffers\n");
   178			return -ENODEV;
   179		}
   180	
   181		vv = devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
   182		if (!vv)
   183			return -ENOMEM;
   184	
   185		vv->vdev = vdev;
   186		vv->debug = debug;
   187		vv->use_dma_mem = use_dma_mem;
   188		vdev->priv = vv;
   189	
   190		spin_lock_init(&vv->resource_idr_lock);
   191		idr_init(&vv->resource_idr);
   192		spin_lock_init(&vv->stream_idr_lock);
   193		idr_init(&vv->stream_idr);
   194	
   195		init_waitqueue_head(&vv->wq);
   196	
   197		if (virtio_has_feature(vdev, VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG))
   198			vv->supp_non_contig = true;
   199	
   200		vv->use_dma_api = !virtio_has_dma_quirk(vdev);
   201		if (!vv->use_dma_api)
   202			set_dma_ops(dev, &dma_phys_ops);
   203	
   204		dev_set_name(dev, "%s.%i", DRIVER_NAME, vdev->index);
   205		ret = v4l2_device_register(dev, &vv->v4l2_dev);
   206		if (ret)
   207			goto err_v4l2_reg;
   208	
   209		virtio_video_init_vq(&vv->commandq, virtio_video_dequeue_cmd_func);
   210		virtio_video_init_vq(&vv->eventq, virtio_video_dequeue_event_func);
   211	
   212		ret = virtio_find_vqs(vdev, 2, vqs, callbacks, names, NULL);
   213		if (ret) {
   214			v4l2_err(&vv->v4l2_dev, "failed to find virt queues\n");
   215			goto err_vqs;
   216		}
   217	
   218		vv->commandq.vq = vqs[0];
   219		vv->eventq.vq = vqs[1];
   220	
   221		ret = virtio_video_alloc_vbufs(vv);
   222		if (ret) {
   223			v4l2_err(&vv->v4l2_dev, "failed to alloc vbufs\n");
   224			goto err_vbufs;
   225		}
   226	
 > 227		virtio_cread(vdev, struct virtio_video_config, max_caps_length,
   228			     &vv->max_caps_len);
   229		if (!vv->max_caps_len) {
   230			v4l2_err(&vv->v4l2_dev, "max_caps_len is zero\n");
   231			ret = -EINVAL;
   232			goto err_config;
   233		}
   234	
   235		virtio_cread(vdev, struct virtio_video_config, max_resp_length,
   236			     &vv->max_resp_len);
   237		if (!vv->max_resp_len) {
   238			v4l2_err(&vv->v4l2_dev, "max_resp_len is zero\n");
   239			ret = -EINVAL;
   240			goto err_config;
   241		}
   242	
   243		ret = virtio_video_alloc_events(vv, vv->eventq.vq->num_free);
   244		if (ret)
   245			goto err_events;
   246	
   247		virtio_device_ready(vdev);
   248		vv->vq_ready = true;
   249		vv->got_caps = false;
   250	
   251		INIT_LIST_HEAD(&vv->devices_list);
   252	
   253		ret = virtio_video_init(vv);
   254		if (ret) {
   255			v4l2_err(&vv->v4l2_dev,
   256				 "failed to init virtio video\n");
   257			goto err_init;
   258		}
   259	
   260		return 0;
   261	
   262	err_init:
   263	err_events:
   264	err_config:
   265		virtio_video_free_vbufs(vv);
   266	err_vbufs:
   267		vdev->config->del_vqs(vdev);
   268	err_vqs:
   269		v4l2_device_unregister(&vv->v4l2_dev);
   270	err_v4l2_reg:
   271		devm_kfree(&vdev->dev, vv);
   272	
   273		return ret;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
