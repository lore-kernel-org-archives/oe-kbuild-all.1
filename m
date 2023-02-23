Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCBFA20
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 00:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677112778; x=1708648778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yco7Uw4f7sFVPwWuh4P8IOlZFO+URYdWWhzx/izIpJc=;
  b=C0PN6fA5/B5eqA9+VaP310s1m6ug3JBDWwbyKhzWK4znZro700qR+sVW
   Bh9t55YYKIHC7a5zN6SEkZtNzX0RoxSSzAmxwmk7fCXXDS8X5B7lJCmKt
   hynYzox0iw0i7JWttq+JuoHjY3bfm1f+q1wtqhtLNqAraNo9lGzv4Ydwh
   lY9wRpheHy+myUNIh+t2tT2ehOlUqgUZnEgiBT17k9WxC9mY3BQ70frH0
   bkMZ3Tekh1MN4BSaru6Dtm6YmCOLyVOwDwiGeNu84UjIiV2OO/JOoUyxU
   cWUqhOEje5bcTl3Dtzt5A38hO/8K3s5rr7TiWUQHfB+ocW0vequ81lWIg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="397768090"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="397768090"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 16:39:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="917763197"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="917763197"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2023 16:39:37 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUze4-0000q0-1Q;
	Thu, 23 Feb 2023 00:39:36 +0000
Date: Thu, 23 Feb 2023 08:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 2/4] io_uring: enable io_uring to submit sqes located in
 kernel
Message-ID: <202302230852.2d5z1aBz-lkp@intel.com>
References: <20230222132534.114574-3-xiaoguang.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222132534.114574-3-xiaoguang.wang@linux.alibaba.com>

Hi Xiaoguang,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on v6.2]
[cannot apply to bpf-next/master bpf/master axboe-block/for-next linus/master next-20230222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoguang-Wang/bpf-add-UBLK-program-type/20230222-235148
patch link:    https://lore.kernel.org/r/20230222132534.114574-3-xiaoguang.wang%40linux.alibaba.com
patch subject: [RFC v2 2/4] io_uring: enable io_uring to submit sqes located in kernel
config: csky-randconfig-r034-20230222 (https://download.01.org/0day-ci/archive/20230223/202302230852.2d5z1aBz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/160719e38c318893c448e87e839f2c68c211c500
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoguang-Wang/bpf-add-UBLK-program-type/20230222-235148
        git checkout 160719e38c318893c448e87e839f2c68c211c500
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230852.2d5z1aBz-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/exit.o: in function `io_uring_submit_sqe':
>> exit.c:(.text+0x9f0): multiple definition of `io_uring_submit_sqe'; kernel/fork.o:fork.c:(.text+0xd94): first defined here
   csky-linux-ld: fs/exec.o: in function `io_uring_submit_sqe':
   exec.c:(.text+0x2080): multiple definition of `io_uring_submit_sqe'; kernel/fork.o:fork.c:(.text+0xd94): first defined here
   csky-linux-ld: security/selinux/hooks.o: in function `io_uring_submit_sqe':
   hooks.c:(.text+0x8420): multiple definition of `io_uring_submit_sqe'; kernel/fork.o:fork.c:(.text+0xd94): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
