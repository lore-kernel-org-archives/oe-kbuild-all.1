Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899CAD47
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680810253; x=1712346253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oBdZYGCMiQx95Z/RE8m0CvQIGNwPxPFfu0VlvCQFBGk=;
  b=NToo0K4Z+dGbXxwOEiwlncDi4k+QDFLEGzG04H996aoZwCTY+eNuuoU1
   N575+L7n4BflbfSfXS6SiZ5K2AcDVG0ip/j49TrRBDqpP6YmwqEWYcZIK
   7IiPkEI6EGpGyPThFguYQhWJStCfvx2TaOhieMGm/IWAgpeZb/CX6oj/x
   h4oAu9olCH0eGqzxgrrS35WnZcjbjsh+kXPp5hFdppfIMTfETyotKh3kz
   O3TTckclUDki2vsTPUbB6lysvr2Qoqz9UNRYdU7zU+zjNBiaOpk0P8qvn
   WRy1QPbgU/52jnfaERwnJunKtkuFi4Xtxw95GaA6iNHyNj+FmTF4izAoo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322475028"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="322475028"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 12:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="811123718"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="811123718"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Apr 2023 12:44:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkVWh-000Rh8-1n;
	Thu, 06 Apr 2023 19:44:07 +0000
Date: Fri, 7 Apr 2023 03:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/5] net/smc: net/smc: allow smc to
 negotiate protocols on policies
Message-ID: <202304070326.mYVdiX9k-lkp@intel.com>
References: <1680795034-86384-3-git-send-email-alibuda@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1680795034-86384-3-git-send-email-alibuda@linux.alibaba.com>

Hi Wythe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Wythe/net-smc-move-smc_sock-related-structure-definition/20230406-233148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/1680795034-86384-3-git-send-email-alibuda%40linux.alibaba.com
patch subject: [RFC PATCH bpf-next 2/5] net/smc: net/smc: allow smc to negotiate protocols on policies
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230407/202304070326.mYVdiX9k-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b2126ac0b2b05c9b94b8f86f854178308577b2e7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review D-Wythe/net-smc-move-smc_sock-related-structure-definition/20230406-233148
        git checkout b2126ac0b2b05c9b94b8f86f854178308577b2e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070326.mYVdiX9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/smc/bpf_smc.c:33:33: warning: no previous prototype for 'smc_negotiator_ops_get_by_name' [-Wmissing-prototypes]
      33 | struct smc_sock_negotiator_ops *smc_negotiator_ops_get_by_name(const char *name)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/smc_negotiator_ops_get_by_name +33 net/smc/bpf_smc.c

    31	
    32	/* required smc_sock_negotiator_list_lock locked */
  > 33	struct smc_sock_negotiator_ops *smc_negotiator_ops_get_by_name(const char *name)
    34	{
    35		struct smc_sock_negotiator_ops *ops;
    36	
    37		list_for_each_entry_rcu(ops, &smc_sock_negotiator_list, list) {
    38			if (strcmp(ops->name, name) == 0)
    39				return ops;
    40		}
    41	
    42		return NULL;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
