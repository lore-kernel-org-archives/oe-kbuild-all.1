Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660E7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 01:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683165462; x=1714701462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sCjFq9xGsRMOj2blUCThuzQFw1Kmredj40vlgxhLIw4=;
  b=QnQsXsjRPt7deR9KiWlAZNCzX+47/fmBCaMIBcNVg74vvnwjm6vnsgmN
   pRT2oBr3pkyEfAbPNBRc//wlRcKtusUtt62qqLgxgcK6bhusHwn4eQjdg
   z/Dt2kn8cXuBkeJuVKw9ZCkGcTN+lDtZnC8pQOoEzIR2WldRIHz8uoy7u
   eXhjxvkBV/uwESKSL0P80Jp4fyO/w0dp2Gy8I2btZt8dFt3AfJ5a3DMeW
   iAVxilOpGj8JsI5pGkmmbJmudHWox6AEQgs7bVm1bnUsF0L8SvZx5wccf
   8bBzP3lUvGNUrs3NNUI0l2tA8NmoVCtZuQegpj5UqcI1FhGg9y7XbW8YT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414278599"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="414278599"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 18:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="840930087"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="840930087"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 May 2023 18:57:40 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puOE0-0002QG-0X;
	Thu, 04 May 2023 01:57:40 +0000
Date: Thu, 4 May 2023 09:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 07/16] block: Add
 bdev_find_max_atomic_write_alignment()
Message-ID: <202305040930.EK4D9fbv-lkp@intel.com>
References: <20230503183821.1473305-8-john.g.garry@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503183821.1473305-8-john.g.garry@oracle.com>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on axboe-block/for-next mkp-scsi/for-next jejb-scsi/for-next v6.3]
[cannot apply to linus/master next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230503183821.1473305-8-john.g.garry%40oracle.com
patch subject: [PATCH RFC 07/16] block: Add bdev_find_max_atomic_write_alignment()
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230504/202305040930.EK4D9fbv-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/93e6523441b1b1797472491c3d29a0a1af3d313d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
        git checkout 93e6523441b1b1797472491c3d29a0a1af3d313d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040930.EK4D9fbv-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: block/bdev.o: in function `.L362':
>> bdev.c:(.text+0xe5c): undefined reference to `__moddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
