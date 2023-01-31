Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0B9640
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 05:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675141659; x=1706677659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=df7HKtwnBPB/r9W8GxtEo/yFKLGbtb/gTVpZAiw3C8w=;
  b=eTtBamVjjMiflJPeLW5T3F41YCFofGvZB6iBUjHkjv4rHIZlljR/d7sh
   ExtLkQD3JbDOxJdBLB1V49T1CVR+hQVMp+GJnJvZBq9hECu+a6zcPICn8
   S51GZCcBSFDKahZay/qJlcbeBZQ2+G0/t/nh0cVkNbqmLwE2X6ipfqrHd
   tlzi21LySf9EaZsx3FF2AXh6/QsnM9wW7wIdb1il/PqCxGVebwiQPXkiY
   HhqT6lefOasbNAbBhFQl6oHpuk+knnCw2UHK/mZfEZcaG7gwtXKojeHA7
   re9DkB1vLOcN0VO5QLLnF3WQwhdI5w/5VwXoUlyeNr9ZDHXdVES9A/kYt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392300269"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="392300269"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 21:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993137528"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="993137528"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2023 21:07:37 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMiro-0004C8-2e;
	Tue, 31 Jan 2023 05:07:36 +0000
Date: Tue, 31 Jan 2023 13:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Seth Forshee <sforshee@kernel.org>
Subject: [vfs-idmapping:b4/fs-acl-remove-generic-xattr-handlers 7/9] ERROR:
 modpost: "reiserfs_xattr_handlers" [fs/reiserfs/reiserfs.ko] undefined!
Message-ID: <202301311338.jvRhuwxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git b4/fs-acl-remove-generic-xattr-handlers
head:   d62ca8f8268fbd7f6e1c53dff832a4a46ef7ac2c
commit: 54ded711483dcfd67961ed213a2b0719c8c66db5 [7/9] reiserfs: rework ->listxattr() implementation
config: m68k-q40_defconfig (https://download.01.org/0day-ci/archive/20230131/202301311338.jvRhuwxr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git/commit/?id=54ded711483dcfd67961ed213a2b0719c8c66db5
        git remote add vfs-idmapping https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git
        git fetch --no-tags vfs-idmapping b4/fs-acl-remove-generic-xattr-handlers
        git checkout 54ded711483dcfd67961ed213a2b0719c8c66db5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "reiserfs_xattr_handlers" [fs/reiserfs/reiserfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
