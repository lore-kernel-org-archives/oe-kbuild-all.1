Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A713223A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676278694; x=1707814694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v9Z7ODcxuoPuxXvu9n7Pq7GYDowcpcphHU40wLTByYk=;
  b=UXL/HAGqgCVobZn2juMCu/0Bs0IyFeQbvHW06c4ACEzKoDql3Q/5GeOb
   XsXPEeYQTUwIpZSkGmRsHn0EVNIRzSv3LsG7c21Ot//gbWAX0CCcB6vgV
   b/wp3Q0H6jXmOvS2cDs1Zk0QN2KsoWReok7OuE6Mlq2i5gpuhlI5OwWoD
   s1qRzW3bxfN3YpuemglntgtvS7zra2FJ4iJ/44Lu8WOqQ1bPHb4CHMfXB
   hxkq32SXkIiY7di1rukSq1PPDOmgMWTe+ljzhrXdXpmPiBn4oDSOLBryx
   KQBbRbZJHU1snPoJW5qkh4KH+pShx+GP8yyolKcq+cMlXivyzQs11Gnbt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="330851286"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="330851286"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 00:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="811520136"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="811520136"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2023 00:58:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRUf5-0007e5-31;
	Mon, 13 Feb 2023 08:58:11 +0000
Date: Mon, 13 Feb 2023 16:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 RFC Zisslpcfi 08/20] riscv: ELF header parsing in GNU
 property for riscv zisslpcfi
Message-ID: <202302131638.YbgO3Q0v-lkp@intel.com>
References: <20230213045351.3945824-9-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213045351.3945824-9-debug@rivosinc.com>

Hi Deepak,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kees/for-next/execve]
[also build test ERROR on linus/master v6.2-rc8]
[cannot apply to arnd-asm-generic/master next-20230213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20230213045351.3945824-9-debug%40rivosinc.com
patch subject: [PATCH v1 RFC Zisslpcfi 08/20] riscv: ELF header parsing in GNU property for riscv zisslpcfi
config: riscv-randconfig-r036-20230212 (https://download.01.org/0day-ci/archive/20230213/202302131638.YbgO3Q0v-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/20f9ba1925526ea13ae4ba4398b2c4a800e63c53
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
        git checkout 20f9ba1925526ea13ae4ba4398b2c4a800e63c53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131638.YbgO3Q0v-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/process.o: in function `.L0 ':
   process.c:(.text+0x10e8): undefined reference to `shadow_stack'
>> riscv64-linux-ld: process.c:(.text+0x110a): undefined reference to `shadow_stack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
