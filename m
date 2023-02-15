Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BCB6109
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676476379; x=1708012379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hniv0XheC9me4UyPk3PW9kgSTHu0jFqR0LkYI1r/HEQ=;
  b=ije156Psyl2aaL7qJuvfreCikVdAKvmlE5WikDedBxHM4texo9YgseX0
   oSaCIf0RTaAwAX0/Yu4eDpXcmlkz9u4l/6RzmB+P1dtafOgJmSHV23FS/
   ScF8oFo3EjwkkbWvNRUizbbSRCUqn/+nnluujNkwyI45rw4M1jirJZmm/
   eGc5B3/L/E++xgvGqLoHI4FyedKOXLp0B4Ji/fkkBZwyVUlXlXiJNeFhz
   giiRaXnsmY42MK4BR5HXoeoFK1NSq/nd54sAbvHmv3dt9168u0xlYnvi6
   MlPKCIJPCuIc7Mtzrl2sC6D3687fLjSrFKRQFWA1mY64uOqR+2NNWLVrG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393863052"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="393863052"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 07:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758449676"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="758449676"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Feb 2023 07:52:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSK5T-0009WL-1y;
	Wed, 15 Feb 2023 15:52:51 +0000
Date: Wed, 15 Feb 2023 23:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] bpf: add UBLK program type
Message-ID: <202302152356.3cUGk3rZ-lkp@intel.com>
References: <20230215004122.28917-2-xiaoguang.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215004122.28917-2-xiaoguang.wang@linux.alibaba.com>

Hi Xiaoguang,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf/master]
[also build test ERROR on axboe-block/for-next linus/master v6.2-rc8]
[cannot apply to bpf-next/master next-20230215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230215004122.28917-2-xiaoguang.wang%40linux.alibaba.com
patch subject: [RFC 1/3] bpf: add UBLK program type
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230215/202302152356.3cUGk3rZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7ab45e74c89ce799fc1df381389fa7364cd31466
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
        git checkout 7ab45e74c89ce799fc1df381389fa7364cd31466
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152356.3cUGk3rZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> m68k-linux-ld: kernel/bpf/syscall.o:(.rodata+0x3a2): undefined reference to `bpf_ublk_prog_ops'
>> m68k-linux-ld: kernel/bpf/verifier.o:(.rodata+0x4d2): undefined reference to `bpf_ublk_verifier_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
