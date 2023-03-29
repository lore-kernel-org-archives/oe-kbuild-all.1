Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2131C32
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680097016; x=1711633016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/+830BIGyxkaS/X9JdvqrrRiNUxLdgMKrlJlssiTfWg=;
  b=imHSkRb/GA2HxHwmu9C/VCDgqEiYekGNLbjjqPpe5BnKwyJhd0t926tT
   MyKfgGYJT2gRI4FQxnYdczCaBcEqfgVeVCYsAqgKLrluO8bl7x4pvsAaE
   lzL9RoyeTKzPTlTzWojAXOP9ebPs1z5ZM7vuM4dPlU8dX4Mljzc7Pp5PI
   8ay6zXKvJBfeaZ1jw5UB4bv9avj0CgsQxmmQhoYVBm9eIs8dMJm2REvJe
   Ax54keh6iLknPRqw+QsccM53IT5jQ0fjhN8TjzjLVUa9a8KSohaBXwaCH
   bVrLGJ1v1naVbwAa0arpvXbZkmyOzXW7SfENrURfZ6gPFiP/Jv2ciUmgY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368648517"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="368648517"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 06:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="686829764"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="686829764"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2023 06:36:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phVyu-000Ja4-1E;
	Wed, 29 Mar 2023 13:36:52 +0000
Date: Wed, 29 Mar 2023 21:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Domenico Cerasuolo <cerasuolodomenico@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, peterz@infradead.org, surenb@google.com,
	brauner@kernel.org, chris@chrisdown.name, hannes@cmpxchg.org,
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Subject: Re: [PATCH v3 4/4] sched/psi: allow unprivileged polling of N*2s
 period
Message-ID: <202303292129.PLXZnmls-lkp@intel.com>
References: <20230329074842.16209-5-cerasuolodomenico@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329074842.16209-5-cerasuolodomenico@gmail.com>

Hi Domenico,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tj-cgroup/for-next vfs-idmapping/for-next linus/master v6.3-rc4 next-20230329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Domenico-Cerasuolo/sched-psi-rearrange-polling-code-in-preparation/20230329-155205
patch link:    https://lore.kernel.org/r/20230329074842.16209-5-cerasuolodomenico%40gmail.com
patch subject: [PATCH v3 4/4] sched/psi: allow unprivileged polling of N*2s period
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230329/202303292129.PLXZnmls-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6c9f1219e1ccea05926017b359e41bfff24e9bd9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Domenico-Cerasuolo/sched-psi-rearrange-polling-code-in-preparation/20230329-155205
        git checkout 6c9f1219e1ccea05926017b359e41bfff24e9bd9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303292129.PLXZnmls-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/psi.c: In function 'psi_irq_open':
>> kernel/sched/psi.c:1602:16: error: implicit declaration of function 'psi_open'; did you mean 'psi_io_open'? [-Werror=implicit-function-declaration]
    1602 |         return psi_open(file, psi_irq_show);
         |                ^~~~~~~~
         |                psi_io_open
   cc1: some warnings being treated as errors


vim +1602 kernel/sched/psi.c

52b1364ba0b105 Chengming Zhou 2022-08-26  1599  
52b1364ba0b105 Chengming Zhou 2022-08-26  1600  static int psi_irq_open(struct inode *inode, struct file *file)
52b1364ba0b105 Chengming Zhou 2022-08-26  1601  {
52b1364ba0b105 Chengming Zhou 2022-08-26 @1602  	return psi_open(file, psi_irq_show);
52b1364ba0b105 Chengming Zhou 2022-08-26  1603  }
52b1364ba0b105 Chengming Zhou 2022-08-26  1604  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
