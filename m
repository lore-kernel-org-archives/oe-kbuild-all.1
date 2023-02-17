Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341DF6AA0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676638455; x=1708174455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8O5i4xBmrmGqtxdl2m4J6gT65TXT7ON83/q863QUJ0Y=;
  b=YaKo2NGairy53LoQ/9btg7NHdYJnWiuq2RX4BNYtCl6g9R55cNg/hl4n
   vIeYzGkCuqG6Ii/C3R7c8Cg1iZJvlmYW1t/XY368tEDU4rIuwRZwfW4bN
   rPx463jQAcl71ulWoNOX5y40LmOmDgFrQPUmaWCYsL4nA7UTDTE0SSlJY
   Dt+aspsR5dBS91VBvO7CKUfGbBH/o0omyw/Zv15invnidaCpOmjD3i5wA
   +2eZSckpmG6lgqVJRp769KjNfPv33ox+Z+9eEnPseGJ0VNe5b0J3RkZFb
   vEzMQHMXHqJ5jS6EB1DfJZMkTbeedwabWDoOdvmQgEAzFZ7HbAAOo/x+l
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315695282"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="315695282"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 04:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813364016"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="813364016"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2023 04:54:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT0Fg-000BTR-27;
	Fri, 17 Feb 2023 12:54:12 +0000
Date: Fri, 17 Feb 2023 20:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave:for-next 120/128] ERROR: modpost: "__aeabi_uldivmod"
 [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202302172004.2bUI7Nec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
head:   5c202ce4169d7220f67b0c8b3650f26ed5f9bcaf
commit: 4a8c6e8a6dc8ae4ce2adb1f807b61b6d99088293 [120/128] btrfs: replace btrfs_io_context::raid_map with a fixed u64 value
config: arm-randconfig-r023-20230214 (https://download.01.org/0day-ci/archive/20230217/202302172004.2bUI7Nec-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git/commit/?id=4a8c6e8a6dc8ae4ce2adb1f807b61b6d99088293
        git remote add kdave https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git
        git fetch --no-tags kdave for-next
        git checkout 4a8c6e8a6dc8ae4ce2adb1f807b61b6d99088293
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172004.2bUI7Nec-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
