Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF7215B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 01:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677115962; x=1708651962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uZipXgTEL8d2R96QGFjnNAPt0uknoIB4YburlxUKLd4=;
  b=iZqq4Jq8qlZkOue/t2G+5Qnk2earqhYHoYUIQVksMD115a3eE0w8X/fp
   DoQjsLelFYYdScmZldV2phjsJ2FGbRG+bIM4U5YsTzlIL/cfuGKi0DjpX
   yfRvFwpGeQ/UnGjQI8FwyjqlW8scZK4pUMYTDQQT+QU3vk+wvuUx6d6bA
   ArEDVca7ivs6DVNiIQJB5VNDDFliP711YlgRcU0Eb231ngyaCJtO8ka8a
   Kt0hoLFoKwMux9AaYPzkT086hI+Wac76okKoDrBYQ+1H5C33cdPYf/qCJ
   o6nKVEy4rq99qV9lPD8z7QruX4+Q4V7PvnGKirJsVhNdxOauBFo6YyJGB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312714398"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="312714398"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 17:32:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="674322429"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="674322429"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2023 17:32:40 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV0TQ-0000t3-02;
	Thu, 23 Feb 2023 01:32:40 +0000
Date: Thu, 23 Feb 2023 09:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 2/4] io_uring: enable io_uring to submit sqes located in
 kernel
Message-ID: <202302230919.13HuuMnB-lkp@intel.com>
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
config: parisc-randconfig-r033-20230222 (https://download.01.org/0day-ci/archive/20230223/202302230919.13HuuMnB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/160719e38c318893c448e87e839f2c68c211c500
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoguang-Wang/bpf-add-UBLK-program-type/20230222-235148
        git checkout 160719e38c318893c448e87e839f2c68c211c500
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230919.13HuuMnB-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: hppa-linux-ld: DWARF error: could not find abbrev number 148863851
   kernel/exit.o: in function `io_uring_submit_sqe':
>> exit.c:(.text+0xee4): multiple definition of `io_uring_submit_sqe'; hppa-linux-ld: DWARF error: could not find abbrev number 100
   kernel/fork.o:fork.c:(.text+0x1528): first defined here
   hppa-linux-ld: hppa-linux-ld: DWARF error: could not find abbrev number 2312747227
   fs/exec.o: in function `io_uring_submit_sqe':
   exec.c:(.text+0x26e4): multiple definition of `io_uring_submit_sqe'; kernel/fork.o:fork.c:(.text+0x1528): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
