Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C528710E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676110268; x=1707646268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uoUa4Ng7JPoPWDaDRHsMCFu0k2OpBZt/IGXGG53baGM=;
  b=UEKe4tto1PeV+QIHwm88OzdvA7nv4k/U2scz0LhXrDhHt9eF9Y9X36c3
   n9yPXGLnd8dMLnsaCTq0R8P1DtwATuY6/OiqgtNEPfZQSTpAYROw3jksO
   EWvnKFP0j8ZNlAaBgwVrFBnPHzpCOEENojNTdxPyLv7J8DSbzJJDyQ3l5
   0AvZ6rBQN0RNNlj0GdAF31yJREre+BFkbu6/KWJOUllYHK4asJWivZYyl
   W3mnehRqJe7zXZOsy9yMIl7wHUOOw+ds7/oD9QsyZUE22LGE1dwacDa+x
   tyYiIdSmNn/t3g67f7jXsSG9yw8D3jKpzg6rJSdcI/5qKhSpsk9V4Auf/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="328296098"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="328296098"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 02:11:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="997204914"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="997204914"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Feb 2023 02:11:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQmqW-0006Pl-13;
	Sat, 11 Feb 2023 10:11:04 +0000
Date: Sat, 11 Feb 2023 18:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [linux-next:master 6251/12152] fs/btrfs/btrfs.o: warning: objtool:
 btrfs_unfreeze+0x3e0: unreachable instruction
Message-ID: <202302111800.ls6cw501-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba8a227fd19d19779005fb66ad7562608e1df83
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 [6251/12152] Compiler attributes: GCC cold function alignment workarounds
config: x86_64-randconfig-a012-20221205 (https://download.01.org/0day-ci/archive/20230211/202302111800.ls6cw501-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c27cd083cfb9d392f304657ed00fcde1136704e7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c27cd083cfb9d392f304657ed00fcde1136704e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111800.ls6cw501-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/btrfs.o: warning: objtool: btrfs_unfreeze+0x3e0: unreachable instruction


objdump-func vmlinux.o btrfs_unfreeze:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
