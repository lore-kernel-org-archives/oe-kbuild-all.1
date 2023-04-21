Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAA5379
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 03:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682046735; x=1713582735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pZg/tYzMXw9RaxnprOqP7zPkfniR4uxBDi51pyU4BSI=;
  b=AM/VlBdNba6rt2b+end2XOnqTVsbXRNShLvtga2XXAZnQnWdG0SdYtFA
   t/tVQS07RA3VNPBckf2DmKAaSAchauhepfhB3pLEGw0m4/Wzf79iOf7vC
   5N2Cxjj47l65Ofd1/SJLYyo4LVH9PX5ts9MTfYFmj6C8mibrSbQjWkSuL
   H+/kfEfYPSLsibNEdhQy6JUELpaJHfyweBKfVmkpdDiDXtD8uMVoxkjKH
   hJGy54VzQGdMf3+LajfiwjlZZgXQoJN258tKhwtnH6iG3WpUJSHvZSMLW
   U+rcRYcREH067NxjRI6tsl+A2H7ilZRux1iQ756EbDAYYzn86yb72oVG9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="343394649"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="343394649"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 20:12:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="836021879"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="836021879"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2023 20:12:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pphBo-000gGW-2w;
	Fri, 21 Apr 2023 03:12:00 +0000
Date: Fri, 21 Apr 2023 11:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/2] SUNRPC: Support TLS handshake in the server-side
 TCP socket code
Message-ID: <202304211108.SRReSqWK-lkp@intel.com>
References: <168201338475.6370.13549486153072281084.stgit@91.116.238.104.host.secureserver.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168201338475.6370.13549486153072281084.stgit@91.116.238.104.host.secureserver.net>

Hi Chuck,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230419]
[cannot apply to trondmy-nfs/linux-next linus/master v6.3-rc7 v6.3-rc6 v6.3-rc5 v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/SUNRPC-Support-TLS-handshake-in-the-server-side-TCP-socket-code/20230421-020332
patch link:    https://lore.kernel.org/r/168201338475.6370.13549486153072281084.stgit%4091.116.238.104.host.secureserver.net
patch subject: [PATCH v1 1/2] SUNRPC: Support TLS handshake in the server-side TCP socket code
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230421/202304211108.SRReSqWK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/02d7016270cdd977f4557d8c70c4384ed68ef959
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chuck-Lever/SUNRPC-Support-TLS-handshake-in-the-server-side-TCP-socket-code/20230421-020332
        git checkout 02d7016270cdd977f4557d8c70c4384ed68ef959
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211108.SRReSqWK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sunrpc/svcsock.c:47:10: fatal error: net/handshake.h: No such file or directory
      47 | #include <net/handshake.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +47 net/sunrpc/svcsock.c

  > 47	#include <net/handshake.h>
    48	#include <linux/uaccess.h>
    49	#include <linux/highmem.h>
    50	#include <asm/ioctls.h>
    51	#include <linux/key.h>
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
