Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2144F1845
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679828620; x=1711364620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dJAeyyj8A8WTj1IWSI3mRYUleSc1uXX+Nf1+Q/iUgw0=;
  b=E1rI2zMGcsnDpWkWjHitCeMyR0ZpWbLPcjG58PwZOehj9bnXGJHNk9vT
   NesZuTGwVJlXRidAhs/vOmmR83M0TjP2acUwp+nOppDysXaruxxu5Zdar
   f64W5+wO4tM2BhK+ZwFInaG5OwqNmUU+TjaiPezIBDGDHIU+4hFZhyTsG
   E55sX6dzLFRRRznp51H7QwSDyl1x13+OHywSqx/y/YvGKUhWhnKeOxQbD
   Z15VyxC6lBp/0y2AJX50Kpx3W1dKjzp9oYIz19AGKj+KSxVNnIhWYUDyI
   pH/Wf7GcPgcy1aeD+yuqtzZnXiNWFxGPLkSPnxBrFosdUzH+B46gQNZY/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="320472383"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="320472383"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 04:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="857360641"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="857360641"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Mar 2023 04:03:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgO9x-000H59-2W;
	Sun, 26 Mar 2023 11:03:37 +0000
Date: Sun, 26 Mar 2023 19:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 03/13] bpf: Implement bpf namespace
Message-ID: <202303261856.qjuhF7F8-lkp@intel.com>
References: <20230326092208.13613-4-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326092208.13613-4-laoar.shao@gmail.com>

Hi Yafang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/fork-New-clone3-flag-for-BPF-namespace/20230326-172511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230326092208.13613-4-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 03/13] bpf: Implement bpf namespace
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230326/202303261856.qjuhF7F8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/97c1724462aa56ab051d35da4a23086e98466e40
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yafang-Shao/fork-New-clone3-flag-for-BPF-namespace/20230326-172511
        git checkout 97c1724462aa56ab051d35da4a23086e98466e40
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303261856.qjuhF7F8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched.h:10,
                    from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:77,
                    from kernel/bpf/bpf_namespace.c:3:
>> include/uapi/linux/sched.h:39:33: warning: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '17179869184' to '0' [-Woverflow]
      39 | #define CLONE_NEWBPF            0x400000000ULL /* New BPF namespace */
         |                                 ^~~~~~~~~~~~~~
   kernel/bpf/bpf_namespace.c:29:17: note: in expansion of macro 'CLONE_NEWBPF'
      29 |         .type = CLONE_NEWBPF,
         |                 ^~~~~~~~~~~~


vim +39 include/uapi/linux/sched.h

607ca46e97a1b6 David Howells     2012-10-13  35  
b612e5df4587c9 Christian Brauner 2019-10-14  36  /* Flags for the clone3() syscall. */
b612e5df4587c9 Christian Brauner 2019-10-14  37  #define CLONE_CLEAR_SIGHAND 0x100000000ULL /* Clear any signal handler and reset to SIG_DFL. */
ef2c41cf38a755 Christian Brauner 2020-02-05  38  #define CLONE_INTO_CGROUP 0x200000000ULL /* Clone into a specific cgroup given the right permissions. */
7d97a87979269a Yafang Shao       2023-03-26 @39  #define CLONE_NEWBPF		0x400000000ULL /* New BPF namespace */
b612e5df4587c9 Christian Brauner 2019-10-14  40  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
