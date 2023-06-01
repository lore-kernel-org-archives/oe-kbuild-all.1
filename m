Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C423DF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 19:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685648022; x=1717184022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qp1V5U17H2Bc1SS06shjJMC6AijWWsO7jhFKu1/ZsIY=;
  b=lR+cvcuWzIm7PhJ5M8zoKUZb299qn68K7KhyuVk2mlqM3tGnJcvWmAj7
   JXBg4e/6kofpaeAKTO2PvgVi2j/hLltmTrVMTq1y4O7J1WAfiaqdE7zRo
   khmld6ETRRy/QWwoHVlkDQfhYOGYeYZdDfr4ZGxGxdDLxzv664hp4rrkG
   stmjuFnYwPINZt+tH3xmGCYaNj52c4I1UXra+gEAXfVRFCziR9Eu2M5zR
   WIF312hBHCB0dOxI0sY72/2RLU9X1b5hUsyfAcLp1XY85TjlE6kx/VhvZ
   56sGZT5lzLLVjIygmp0drZwOtH7tdjQ8VIoXmbQz2oLUO6bh5APwlf8w/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353158098"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="353158098"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 12:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="819954902"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="819954902"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 12:33:39 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4o3H-0002dm-0H;
	Thu, 01 Jun 2023 19:33:39 +0000
Date: Fri, 2 Jun 2023 03:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2] ERROR: modpost: module dax uses
 symbol iget5_locked from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202306020335.0OpFLFvy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   45b8bb886df7422b136ba2703469302d9310974f
commit: d4d78c7278ee4f6fd8f3b02c18e472e55558a98b [2/2] ANDROID: fuse-bpf: Fix non-fusebpf build
config: x86_64-randconfig-c022-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020335.0OpFLFvy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout d4d78c7278ee4f6fd8f3b02c18e472e55558a98b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020335.0OpFLFvy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module dax uses symbol iget5_locked from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module dax uses symbol inode_init_once from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module dax uses symbol unlock_new_inode from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
