Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F63EC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 03:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682565002; x=1714101002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CN72jPO35vn29cEv1bkKmQVCTf0kR0oqguVO/Zb5Tms=;
  b=hb88xU82g45cuIUIkp7Ax9Ib5azrwcZ8tVuIAWmqvoAQ9TwhVunTN94n
   86lNMHldgN2jNio3f0ajZ88Fpj8W5J38v5ePHm9hN8YFxWZgdov+0PTz9
   nWDIVra+IM2rentU7KEpzMIU3uUgBVx1AQLnZYYoz0crPvX7xk4DrLNX0
   E3PcN6n6CmW1N09N8gE697nkweAeZts1/cQB9LmlA+f4kpxAqS82HG6/M
   fxwZqIXSgiVqOUrP930LWcj3jAEBnH3JjNskH5nfTP291R87evox4ow2V
   LYkUsPEKi0l/mHemzQE0af7W2FY90W5BGkkcJpw6ooKatvA3RXZ/Ia6yS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="350141066"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="350141066"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 20:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="671596960"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="671596960"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Apr 2023 20:10:00 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prs1A-0000gQ-0h;
	Thu, 27 Apr 2023 03:10:00 +0000
Date: Thu, 27 Apr 2023 11:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [selinuxproject-selinux:main 1/1] README.orig: warning: ignored by
 one of the .gitignore files
Message-ID: <202304271127.9qojNxa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/SELinuxProject/selinux-kernel main
head:   5eba58b16e86b49fddf40450359fc3f1c19b6a8e
commit: 5eba58b16e86b49fddf40450359fc3f1c19b6a8e [1/1] selinux: add a SELinux specific README.md and SECURITY.md
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230427/202304271127.9qojNxa7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/SELinuxProject/selinux-kernel/commit/5eba58b16e86b49fddf40450359fc3f1c19b6a8e
        git remote add selinuxproject-selinux https://github.com/SELinuxProject/selinux-kernel
        git fetch --no-tags selinuxproject-selinux main
        git checkout 5eba58b16e86b49fddf40450359fc3f1c19b6a8e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271127.9qojNxa7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> README.orig: warning: ignored by one of the .gitignore files
   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
