Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B53C3D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 19:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675883533; x=1707419533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bqXuGOZ6Xpzsd+HGdoEcySJiJF8uCTrJnI+KcUC62zM=;
  b=YQPZQMOA0b0lZmQYl80kK1kvVQQYTyG24y6S9+HoHX1CDZkWFLoa9pp7
   dkmiCDGN2/TTIIszrXfwjpPkFMdeQnd6vOYU9nppFqjmYJy91p8x3vi9y
   r83XJ0I1DRgQMWYPUUUDvLfL1kIH5tSwCTpBVoo2FLtDf/vP0H3aBa6rB
   opuOetMd3isiwzs0FZJcM6QRwQkxugfeGxB+j9myylvOcVzCKI+qk8zlf
   HtXBUcL56dMjqmQ309IYE++TE7X8se2jEO1568Ip6iV8jrgeKSqQqxz4H
   VZQ0UFofBD+5iRw4qHDS+xm/tgKneMwzuCN+XAS4Qy8Z7VzXLlPeQqCZm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="332021741"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="332021741"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 11:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="644977589"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="644977589"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 11:12:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPprW-0004b8-2X;
	Wed, 08 Feb 2023 19:12:10 +0000
Date: Thu, 9 Feb 2023 03:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC nf-next 3/3] bpf: minimal support for programs hooked into
 netfilter framework
Message-ID: <202302090245.nehZXsVh-lkp@intel.com>
References: <20230208160307.27534-4-fw@strlen.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208160307.27534-4-fw@strlen.de>

Hi Florian,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]
[also build test WARNING on linus/master v6.2-rc7 next-20230208]
[cannot apply to nf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/bpf-add-bpf_link-support-for-BPF_NETFILTER-programs/20230209-000601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230208160307.27534-4-fw%40strlen.de
patch subject: [RFC nf-next 3/3] bpf: minimal support for programs hooked into netfilter framework
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230209/202302090245.nehZXsVh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/594e7d0d1d1291101bd2250243e0be4e46e26985
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Florian-Westphal/bpf-add-bpf_link-support-for-BPF_NETFILTER-programs/20230209-000601
        git checkout 594e7d0d1d1291101bd2250243e0be4e46e26985
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/20230208160307.27534-4-fw@strlen.de

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_bpf_link.c:233:5: warning: no previous prototype for 'register_nf_hook_bpf' [-Wmissing-prototypes]
     233 | int register_nf_hook_bpf(void)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/register_nf_hook_bpf +233 net/netfilter/nf_bpf_link.c

   232	
 > 233	int register_nf_hook_bpf(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
