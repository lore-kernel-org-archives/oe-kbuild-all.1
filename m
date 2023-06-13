Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345C717C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 02:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686622828; x=1718158828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MVBfInuZvsdXkll65NcpsSrhnE+eslAZL4nYdV55/A4=;
  b=LWq6y53edXz6oJ/+fVRSgTO7yLmvKXOTV5Nujg+V17msTxcYWacyPUgW
   x8o/ZyocdJ4BPOGONobiuKCmNByKH87TffCKhlu/bvLQYcu0oq+0KFdNs
   sbrm6P7yMy1zicrfny5vfVfu0tVoKuTZ/uiohKkEsGNevv+l23d2ITexJ
   JYyd38NH8FaisyLtzJFH5Wi+Ijmup0NUOJP7SbkEhJMvCdcxXZhViMg3J
   V0iDN/6/HHYgMnCWe/a9xPQtXWYQ1IHakbMEARGmWuggsfVMVEAtkzJSw
   Hut4mXfQpZePm70BZZ/H5LEM6qGcHMIh04tiboLX+T/cB8gTzIGqVw8bV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347862028"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="347862028"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 19:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="741257172"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="741257172"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Jun 2023 19:20:26 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8tdx-0000vY-2j;
	Tue, 13 Jun 2023 02:20:25 +0000
Date: Tue, 13 Jun 2023 10:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 3/7] bpf: implement devtx hook points
Message-ID: <202306131045.iTEieU0y-lkp@intel.com>
References: <20230612172307.3923165-4-sdf@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612172307.3923165-4-sdf@google.com>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/bpf-rename-some-xdp-metadata-functions-into-dev-bound/20230613-012928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230612172307.3923165-4-sdf%40google.com
patch subject: [RFC bpf-next 3/7] bpf: implement devtx hook points
config: s390-randconfig-r015-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131045.iTEieU0y-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch bpf-next master
        git checkout bpf-next/master
        b4 shazam https://lore.kernel.org/r/20230612172307.3923165-4-sdf@google.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131045.iTEieU0y-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: net/core/dev.o: in function `unregister_netdevice_many_notify':
>> dev.c:(.text+0x1ef5e): undefined reference to `devtx_shutdown'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
