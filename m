Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726A8F6D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679578376; x=1711114376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hMfNgJaQYDOGlaOlsNAyX/+eGeCwS3cORtVe7GZPBCc=;
  b=VFiVETcWv/ZZQKONZ1ldIL/34gG8jJ8nNhDEWaLlA/mzeDdpkluysMtd
   HMSSW2qzX0jrVcR+jasM/igwRl6sRhACh7Td0AhFg7JcExUk/H6HiN2Dg
   oyrUin2ImSqsMsrGpGxRl50exNAatlSA2A4VnrFO1eV/8ep5s8Ohe9I9w
   /mqfr7+8d734oL/xgTIi9yHavbu4jlsd/l5AaEbPEaSY/MV8daHjMUaHy
   AVLAn8RS5vzr2LgjXpdUrfLrSvCgQkTtqPag5eVf8FBSAb30N+b29ZIvA
   kUshYewKim2WReMRl1AuesxwS6O8vnr79L7+nEmM+kRzMCvhSBMRXPgrn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341031944"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="341031944"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746711549"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="746711549"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 06:15:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfKms-000ENm-2t;
	Thu, 23 Mar 2023 13:15:26 +0000
Date: Thu, 23 Mar 2023 21:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:smp/core 9/12] smp.c:(.text+0x88): multiple definition
 of `__traceiter_ipi_raise'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0xe08):
 first defined here
Message-ID: <202303232134.j4pKXr8u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git smp/core
head:   965abfc95e362b8650b49b61c33de7e7691094c6
commit: 29b92a412994a1201ecc6eb6ffa35317436b6da8 [9/12] treewide: Trace IPIs sent via smp_send_reschedule()
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230323/202303232134.j4pKXr8u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=29b92a412994a1201ecc6eb6ffa35317436b6da8
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout 29b92a412994a1201ecc6eb6ffa35317436b6da8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232134.j4pKXr8u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: kernel/smp.o:(__tracepoints+0x0): multiple definition of `__tracepoint_ipi_raise'; virt/kvm/kvm_main.o:(__tracepoints+0x3f0): first defined here
>> aarch64-linux-ld: kernel/smp.o:(__tracepoints+0x48): multiple definition of `__tracepoint_ipi_send_cpumask'; virt/kvm/kvm_main.o:(__tracepoints+0x438): first defined here
>> aarch64-linux-ld: kernel/smp.o:(__tracepoints+0x90): multiple definition of `__tracepoint_ipi_entry'; virt/kvm/kvm_main.o:(__tracepoints+0x480): first defined here
>> aarch64-linux-ld: kernel/smp.o:(__tracepoints+0xd8): multiple definition of `__tracepoint_ipi_exit'; virt/kvm/kvm_main.o:(__tracepoints+0x4c8): first defined here
   aarch64-linux-ld: kernel/smp.o: in function `__traceiter_ipi_raise':
>> smp.c:(.text+0x88): multiple definition of `__traceiter_ipi_raise'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0xe08): first defined here
   aarch64-linux-ld: kernel/smp.o: in function `__traceiter_ipi_send_cpumask':
>> smp.c:(.text+0x188): multiple definition of `__traceiter_ipi_send_cpumask'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0xf08): first defined here
   aarch64-linux-ld: kernel/smp.o: in function `__traceiter_ipi_entry':
>> smp.c:(.text+0x288): multiple definition of `__traceiter_ipi_entry'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x1008): first defined here
   aarch64-linux-ld: kernel/smp.o: in function `__traceiter_ipi_exit':
>> smp.c:(.text+0x388): multiple definition of `__traceiter_ipi_exit'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x1108): first defined here
>> aarch64-linux-ld: kernel/smp.o:(.data+0x7e0): multiple definition of `__SCK__tp_func_ipi_exit'; virt/kvm/kvm_main.o:(.data+0x1610): first defined here
>> aarch64-linux-ld: kernel/smp.o:(.data+0x7e8): multiple definition of `__SCK__tp_func_ipi_entry'; virt/kvm/kvm_main.o:(.data+0x1618): first defined here
>> aarch64-linux-ld: kernel/smp.o:(.data+0x7f0): multiple definition of `__SCK__tp_func_ipi_send_cpumask'; virt/kvm/kvm_main.o:(.data+0x1620): first defined here
>> aarch64-linux-ld: kernel/smp.o:(.data+0x7f8): multiple definition of `__SCK__tp_func_ipi_raise'; virt/kvm/kvm_main.o:(.data+0x1628): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
