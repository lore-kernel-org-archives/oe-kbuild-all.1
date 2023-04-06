Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F04320D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680806587; x=1712342587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8eVRPT4or6jQ10xTTIUp+BjaTsEI8U6G/YAgrKZfGbQ=;
  b=l+WuK/y3pGuph1s5uxln0DxP3tLsBP+PDvgK7T09+fgF40IrZkKqVf7x
   dDycUAQne55FUfAVGOJOb9+gQgwEGjHbItVc0pvwbRpg+wf1SkhOTMct3
   MpTmqZeTj2svhWftIz24/9OPFelu4iD88Ll6KUZM2BzHb/lXVjQdvoEP+
   9gjytvi64gY/nuRw6e/NODpo4dSzXcgffRRtrDf7cRnTEN0p1YGCMaTZz
   /50520SyGeGK27tryfPT/8zb53UfVw059BTg0cNo5+45hevg8I/mTxzUA
   XxJr2ENW5g9B2O1flt9Hsfjzev6/KZR260mjDjgmUpsEy03IdwEUG/dPT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326880920"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326880920"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 11:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751743627"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="751743627"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Apr 2023 11:43:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkUZd-000Rc8-0G;
	Thu, 06 Apr 2023 18:43:05 +0000
Date: Fri, 7 Apr 2023 02:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 1/1] include/uapi/linux/kvm.h:15:10: fatal error:
 asm/kvm.h: No such file or directory
Message-ID: <202304070228.EZZq7YPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/bpf
head:   bc707d986839ac443becd8e83cce71d9cf5ff1b1
commit: bc707d986839ac443becd8e83cce71d9cf5ff1b1 [1/1] KVM: Add support for new KVM_DEV_TYPE_BPF device
config: m68k-randconfig-r031-20230405 (https://download.01.org/0day-ci/archive/20230407/202304070228.EZZq7YPq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=bc707d986839ac443becd8e83cce71d9cf5ff1b1
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout bc707d986839ac443becd8e83cce71d9cf5ff1b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070228.EZZq7YPq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:40,
                    from include/kvm/bpf.h:5,
                    from kernel/bpf/btf.c:8:
>> include/uapi/linux/kvm.h:15:10: fatal error: asm/kvm.h: No such file or directory
      15 | #include <asm/kvm.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +15 include/uapi/linux/kvm.h

6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   4  
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   5  /*
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   6   * Userspace interface for /dev/kvm - kernel based virtual machine
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   7   *
dea8caee7b6971 include/linux/kvm.h      Rusty Russell          2007-07-17   8   * Note: you must update KVM_API_VERSION if you change this interface.
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   9   */
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  10  
fb1070d18edb37 include/uapi/linux/kvm.h Joe Richey             2021-05-21  11  #include <linux/const.h>
00bfddaf7f68a6 include/linux/kvm.h      Jaswinder Singh Rajput 2009-01-15  12  #include <linux/types.h>
97646202bc3f19 include/linux/kvm.h      Christian Borntraeger  2008-03-12  13  #include <linux/compiler.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  14  #include <linux/ioctl.h>
f6a40e3bdf5fe0 include/linux/kvm.h      Jerone Young           2007-11-19 @15  #include <asm/kvm.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  16  

:::::: The code at line 15 was first introduced by commit
:::::: f6a40e3bdf5fe0a7d7d7f2dbc5b10158fbdad968 KVM: Portability: Move kvm_memory_alias to asm/kvm.h

:::::: TO: Jerone Young <jyoung5@us.ibm.com>
:::::: CC: Avi Kivity <avi@qumranet.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
