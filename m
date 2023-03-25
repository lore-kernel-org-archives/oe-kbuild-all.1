Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2A1389
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 02:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679712647; x=1711248647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3zS3aSvOZAiP4KYujSTqHqth8DjUD9bjRP9v3MOj3Bw=;
  b=GgHZl0o8i14eUS3DRdS7xv3U+p7B+l9CqiTZEj8cNn00N+cLEvuljq0o
   CAJBfLhVB5f2gE0eGieuxJWaXaMSIpuQpiqv3BQR6D27XRM9j5ZSA3hYD
   KzSb871LodVUqO5C+pEJH1Nj0kqEpFi48XCLvrZSWCMU/umj1QMOjnUbn
   GME6wcH4ItJvv9SwUyCxYlI20RQu8+Bj1iC6pFY/pFWsDwkxiag/uKI27
   V4Eop9BvckwCrd6eH50WePUXmJJy9pEM7qaGJof7nWF028eND8dfNdx2S
   aUjsML909b0tD9qQsCurXdCyD7XjpQ0PipM6+4dn8+slEnlhs6vLrMY4c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="341498261"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="341498261"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 19:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012492338"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="1012492338"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2023 19:50:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pftzP-000FtD-2t;
	Sat, 25 Mar 2023 02:50:43 +0000
Date: Sat, 25 Mar 2023 10:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 2/2] nvme: use blk-mq polling for uring commands
Message-ID: <202303251022.c5FPQHwt-lkp@intel.com>
References: <20230324212803.1837554-2-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324212803.1837554-2-kbusch@meta.com>

Hi Keith,

I love your patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[cannot apply to linus/master v6.3-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/nvme-use-blk-mq-polling-for-uring-commands/20230325-052914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230324212803.1837554-2-kbusch%40meta.com
patch subject: [PATCH 2/2] nvme: use blk-mq polling for uring commands
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230325/202303251022.c5FPQHwt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/62483898b54af99f656f5a16a65ff26940b817a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Keith-Busch/nvme-use-blk-mq-polling-for-uring-commands/20230325-052914
        git checkout 62483898b54af99f656f5a16a65ff26940b817a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251022.c5FPQHwt-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "blk_queue_exit" [drivers/nvme/host/nvme-core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
