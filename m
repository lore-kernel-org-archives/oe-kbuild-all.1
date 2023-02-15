Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0A6109
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 14:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676472658; x=1708008658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8QWS9hju6+0HMB8NQL5CsaZNGrHpaJS0+vxpn9v6CY=;
  b=kOwxINAsYmUL39NBAUt+/z4znP4MbMyGSWsoh36RRShUwm8r+owIfczJ
   EhyZwbCl6mCZUupWypTf3ylahbAQJxFMNgcN04RU3mvQGm0vReT6blu9c
   kkuKels935kcYT6K8cQaup5Ija7JyjU2IPkZQmWe1cxr5EnhhgsOwcjzM
   A3a5TuJ/pgOzktCWDbv7YxCKEEZ/KFx2G0MZmqwywjturLyVzW/GyczDn
   VGnHgOIEjnb1gK++LZQvIyBRoc21sktW35nPV9nx68ykcFca54Mkp86BJ
   KI9FyFRdymSdO0qabrAce0z/RbxOS5IlMH+Q87nCMJZtGkGMbP53HTSxP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="331442760"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="331442760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 06:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699994162"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="699994162"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Feb 2023 06:50:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSJ7R-0009Sl-1x;
	Wed, 15 Feb 2023 14:50:49 +0000
Date: Wed, 15 Feb 2023 22:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/3] io_uring: enable io_uring to submit sqes located in
 kernel
Message-ID: <202302152219.3euu62fj-lkp@intel.com>
References: <20230215004122.28917-3-xiaoguang.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215004122.28917-3-xiaoguang.wang@linux.alibaba.com>

Hi Xiaoguang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf/master]
[also build test WARNING on axboe-block/for-next linus/master v6.2-rc8]
[cannot apply to bpf-next/master next-20230215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230215004122.28917-3-xiaoguang.wang%40linux.alibaba.com
patch subject: [RFC 2/3] io_uring: enable io_uring to submit sqes located in kernel
config: arm-zeus_defconfig (https://download.01.org/0day-ci/archive/20230215/202302152219.3euu62fj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0d433a1cf7f666e5596514da7fab92f2691463ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
        git checkout 0d433a1cf7f666e5596514da7fab92f2691463ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152219.3euu62fj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/io_uring_types.h:472:35: note: in expansion of macro 'BIT'
     472 |         REQ_F_KBUF              = BIT(REQ_F_KBUF_BIT),
         |                                   ^~~


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  8  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
