Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D897F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682156803; x=1713692803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCwyfvAsEm+Q8e3+lqTVbOLNfaLmLpcAQLGqE7+R3Mw=;
  b=TdOVX79FtpgXT0fWADpuFiCcyIah+F0zszb11dR0fd1+UWNp4J6P6h6U
   EpUEqvL1vhKWFTXSaQEhfaP5j2xtxRJz6hgcWzEl/tlblGv/2SQ2LEcGt
   vnU6lDbDLXYm6CyhaAUu4JS8U2/KnAnYq4DDcdFzdneZ98YUEdvw7Yx4U
   EQW6HDwsyN/H3juziPNjGqZF7n2VPxvO7TTrXB5rkm0G9eDB9dMPeoHTC
   9s0psyWSR/Wkn7N7OJlXfe0yByHoIbSd1teLNkiruPs+HNxOzr9MBmP0i
   5kzHZh/yzYT8+gJAhIWdmdUasxsz/JvQl+0gMlA6aSBJFXjdV0OGe3x5n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="343628042"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="343628042"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 02:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="761834416"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="761834416"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2023 02:46:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq9pI-000hE0-30;
	Sat, 22 Apr 2023 09:46:40 +0000
Date: Sat, 22 Apr 2023 17:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 4/32] kernel/bpf/syscall.o:undefined reference to
 `netfilter_prog_ops'
Message-ID: <202304221756.FUecAdjp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   4db10a8243df665ced10b027c2d4862173a7a3ec
commit: fd9c663b9ad67dedfc9a3fd3429ddd3e83782b4d [4/32] bpf: minimal support for programs hooked into netfilter framework
config: m68k-randconfig-r034-20230421 (https://download.01.org/0day-ci/archive/20230422/202304221756.FUecAdjp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=fd9c663b9ad67dedfc9a3fd3429ddd3e83782b4d
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch --no-tags bpf-next master
        git checkout fd9c663b9ad67dedfc9a3fd3429ddd3e83782b4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221756.FUecAdjp-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: section .rodata VMA [0000000000001000,000000000023811f] overlaps section .text VMA [0000000000000400,000000000060f72f]
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 271
>> kernel/bpf/syscall.o:(.rodata+0x388): undefined reference to `netfilter_prog_ops'
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 72
>> kernel/bpf/verifier.o:(.rodata+0x4f2): undefined reference to `netfilter_verifier_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
