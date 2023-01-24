Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490358839
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674574948; x=1706110948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jzNLut6RgoQgIztog/yyuwTtLyLBM173o7yKSUPhQ+U=;
  b=Gk3B1gYNgQ4Na5BNOQGosstbGHAfqZysKhzdsrRjeTQuGa11HGX2rvF0
   fn7sGBwOLWSbiN+F3mu1co+5mtA8zWvFvtVmbLagmNJ1P/4okbz+PQvCM
   dHrO+dzMb2i9rjMcGTwuk8FE1c3dljzzHSLGvRWDAyWjbYkBceGB1IFD2
   WRxA4nTSDtmh2a8AnT1m8eUDHOReUArlEcFtgJo4R60uw50cz+H9F5B7S
   /ovvIpsGYkCYcAVZPD4nxVLqc1mVl/vi2RxF4Brmvm2mg9wDtTOVRkJcK
   LLRWr2CkUtKJSX9XvIAkRtvYl07PHgNXsWc5N3QITYv3hIAKtFTkh8Zym
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412551862"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="412551862"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="786122940"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="786122940"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2023 07:42:05 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKLQy-0006Zk-2f;
	Tue, 24 Jan 2023 15:42:04 +0000
Date: Tue, 24 Jan 2023 23:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] btrfs: separate single stripe optimization into a
 dedicate branch
Message-ID: <202301242352.S4fATQpv-lkp@intel.com>
References: <4e4d6e0aab34ab40fd0ac69874141bb02a559f10.1674546545.git.wqu@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e4d6e0aab34ab40fd0ac69874141bb02a559f10.1674546545.git.wqu@suse.com>

Hi Qu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v6.2-rc5]
[also build test ERROR on linus/master]
[cannot apply to kdave/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-separate-single-stripe-optimization-into-a-dedicate-branch/20230124-160136
patch link:    https://lore.kernel.org/r/4e4d6e0aab34ab40fd0ac69874141bb02a559f10.1674546545.git.wqu%40suse.com
patch subject: [PATCH] btrfs: separate single stripe optimization into a dedicate branch
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301242352.S4fATQpv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c14a1dcb2468592c33a708a821aeb30ce4a16db
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Qu-Wenruo/btrfs-separate-single-stripe-optimization-into-a-dedicate-branch/20230124-160136
        git checkout 4c14a1dcb2468592c33a708a821aeb30ce4a16db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   m68k-linux-ld: fs/btrfs/volumes.o: in function `map_single_stripe':
>> volumes.c:(.text+0x3482): undefined reference to `__umoddi3'
>> m68k-linux-ld: volumes.c:(.text+0x34b2): undefined reference to `__udivdi3'
   m68k-linux-ld: volumes.c:(.text+0x35b2): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
