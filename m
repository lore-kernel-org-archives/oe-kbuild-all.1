Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5767E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 01:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683163002; x=1714699002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xab2PDzcpB5itNRcD/PkuKz97ZwTOsty6nokOAx8nwA=;
  b=d5ntu2RrXrYjZxre37gxJLKQfk7Ckjq4u/5Ce7LvMu7S0V0gZMLNkBHm
   5CW7uOt2Vvoiq09kNw6vC1PvB6JyJbWJh9XCqBXXcrHjGrTnEXYdbRvWC
   Vwbg9xSAXTE+I6jcKaYJVCCSJGeW6KYKmfdnIIYmMJ6n6fLprUbbdCztw
   m2w4jMmE/dRrTkgI/kJx/Eft8AmPWuyskmSFOB/5ZGe30C1EyQ71TReVS
   tDPXn/PdMUQk3sCLadAW1oKun1Ln24msUyUMrY3NX8YPz6DfSk8FC2ZUu
   KSDgrRU6AjmgYEZWTV35PkRoiRM6AE4kGpn65IhxtWv2uqYap2JoBMqxQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="411971646"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="411971646"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 18:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="808483029"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="808483029"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 May 2023 18:16:40 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puNaJ-0002P2-0d;
	Thu, 04 May 2023 01:16:39 +0000
Date: Thu, 4 May 2023 09:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: Aditi Ghag <aditi.ghag@isovalent.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 bpf-next 04/10] udp: seq_file: Remove bpf_seq_afinfo
 from udp_iter_state
Message-ID: <202305040933.kmhjCyHM-lkp@intel.com>
References: <20230503225351.3700208-5-aditi.ghag@isovalent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503225351.3700208-5-aditi.ghag@isovalent.com>

Hi Aditi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Aditi-Ghag/bpf-tcp-Avoid-taking-fast-sock-lock-in-iterator/20230504-065508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230503225351.3700208-5-aditi.ghag%40isovalent.com
patch subject: [PATCH v7 bpf-next 04/10] udp: seq_file: Remove bpf_seq_afinfo from udp_iter_state
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230504/202305040933.kmhjCyHM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/abadc0049c37c3ab51bc0893c69a6a22019c46bd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aditi-Ghag/bpf-tcp-Avoid-taking-fast-sock-lock-in-iterator/20230504-065508
        git checkout abadc0049c37c3ab51bc0893c69a6a22019c46bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040933.kmhjCyHM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/udp.c:3001:36: warning: 'bpf_iter_udp_seq_ops' defined but not used [-Wunused-const-variable=]
    3001 | static const struct seq_operations bpf_iter_udp_seq_ops;
         |                                    ^~~~~~~~~~~~~~~~~~~~


vim +/bpf_iter_udp_seq_ops +3001 net/ipv4/udp.c

  3000	
> 3001	static const struct seq_operations bpf_iter_udp_seq_ops;
  3002	static struct udp_table *udp_get_table_seq(struct seq_file *seq,
  3003						   struct net *net)
  3004	{
  3005		const struct udp_seq_afinfo *afinfo;
  3006	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
