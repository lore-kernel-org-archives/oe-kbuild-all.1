Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC4E1FA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676272272; x=1707808272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ef51PczQ+7nY8AMgQge5Yc4hyLNaRq3b0xyhtymjt3Y=;
  b=FppkanMdzQn6xUSamoHDgAk/S8dhNJkPj/J3bw0N3hFnaHQf878e31R0
   MqHa9PHwU/WHTAWdDwsLYpDiVhIZ5X/NBhLAfPOF3LYLIYYqVsFEQ4w5L
   asb+cwzJL44JeWjFKEvPvOkJLA3k+Poxlp3baNZr0sP3aCZyF4p652KB7
   ViVfun80v7nCSJUshJiiu1lH0rWapEtAhYY8YyTuk/T1aDCcvdlQsK9vl
   7s/dBmqT3N7AvFkObAAZa6Wj7lRtur+sUkctg137nOsbpVx+wYEIQ2phQ
   XLIN2mmktwhVitc2CRsy/ykNKQ5rjh5eP3PblprSxaFy9R/SVsI5oFxV3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="395437460"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="395437460"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 23:11:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="646286047"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="646286047"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Feb 2023 23:11:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRSzW-0007bt-13;
	Mon, 13 Feb 2023 07:11:10 +0000
Date: Mon, 13 Feb 2023 15:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 RFC Zisslpcfi 08/20] riscv: ELF header parsing in GNU
 property for riscv zisslpcfi
Message-ID: <202302131526.w68fMDQU-lkp@intel.com>
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
[cannot apply to next-20230213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20230213045351.3945824-9-debug%40rivosinc.com
patch subject: [PATCH v1 RFC Zisslpcfi 08/20] riscv: ELF header parsing in GNU property for riscv zisslpcfi
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230213/202302131526.w68fMDQU-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202302131526.w68fMDQU-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/process.o: in function `allocate_shadow_stack':
>> process.c:(.text+0x22e): undefined reference to `shadow_stack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
