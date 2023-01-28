Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2433233FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674916717; x=1706452717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=30x0AaS5tC3VupJp0TfLWeRET+VOmcBQwq30E2oeLhI=;
  b=NkgFXBClJ9YefeYrjXTFIOd2p8ytPS6z8iZl2WvZYCdQqOir+0Y9QyWl
   oUWiBPQBCxowjIYICCmJIcCcLX5DBcrSmsDpCwGiUNVZ4qKNmRnztmBgc
   X3jifxl9b5vIM93qmaunly9vlBeZSg7feRhTLg1UBXnh3qw0L+mYZCuPJ
   WtvAX0Qs0j0pQ5s6yWs/SPgqX9QEyMwlLLnHq/Aax0LNF8/OkBaEVbcT4
   8qz/l4dzrRAkIWWelW0DPJJDDl07LwTk3yTizLZTzjYT8nPshDpybHpfS
   sAnN2AN2daRTWdS7c8ecB1r7y94yMH9kg9uXEnk68jxFbek++MCtBInqQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306944574"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="306944574"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 06:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="908984121"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="908984121"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2023 06:38:35 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLmLi-0000nj-2q;
	Sat, 28 Jan 2023 14:38:34 +0000
Date: Sat, 28 Jan 2023 22:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/trace/ftrace.c:42:10: fatal error: asm/setup.h: No such file
 or directory
Message-ID: <202301282212.BYXWaMpE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230125-163113
head:   06897a0964c21c88d28d72b2d7959fc8651a6d21
commit: 3e261a30a338475c3efe666377daa612924b1129 asm-generic: Remove COMMAND_LINE_SIZE from uapi
date:   3 days ago
config: riscv-randconfig-r042-20230124 (https://download.01.org/0day-ci/archive/20230128/202301282212.BYXWaMpE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3e261a30a338475c3efe666377daa612924b1129
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230125-163113
        git checkout 3e261a30a338475c3efe666377daa612924b1129
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/trace/ftrace.c:42:10: fatal error: asm/setup.h: No such file or directory
      42 | #include <asm/setup.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
>> kernel/trace/trace_stack.c:18:10: fatal error: asm/setup.h: No such file or directory
      18 | #include <asm/setup.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +42 kernel/trace/ftrace.c

8aef2d2856158a Steven Rostedt          2009-03-24  40  
b80f0f6c9ed395 Steven Rostedt (VMware  2017-04-03  41) #include <asm/sections.h>
2af15d6a44b871 Steven Rostedt          2009-05-28 @42  #include <asm/setup.h>
395a59d0f8e86b Abhishek Sagar          2008-06-21  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
