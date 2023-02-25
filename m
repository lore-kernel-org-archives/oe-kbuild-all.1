Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D2D318
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 05:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677301760; x=1708837760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NP4oRDsUCcVOVUkgLNn9V98nKXLycxQ3BKWmQ6ic0zs=;
  b=nusEJvbLBKhPPPFUOGeWnazcGJCpsgTuJWfoAeV4dMxWC7ZuPI69vO8J
   xdUohLJQsosI+7Lv20IvMgLWrpf0j6QoKv7Jg8oKmvYn4RajQLDG+uhV3
   Qe7+JyvqOkFimTwNfa40TpMXszzDdwjO0fAoRQa5D016m2kCLhrCDX+/o
   QB650XqPBGQNW+8NtdM8YrEzmmd2/rcgRCcST/9Hu0RVTXpZkdpH23FtD
   Ppk0aEnVbzxtaoOEQG70Ut0Txdt3UoEocdC+Q2bsU0nh/uDyriiQVfuyO
   6bm6AkRsDq4KZt9Cr28VCXRl+UlHsF3g//UGVDh13EbUu6Q+sag/gMA/Z
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361143551"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="361143551"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 21:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="741875203"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="741875203"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2023 21:09:18 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVmo9-0002wF-3B;
	Sat, 25 Feb 2023 05:09:17 +0000
Date: Sat, 25 Feb 2023 13:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-rpc-with-tls-upcall 18/18] svcsock.c:undefined reference
 to `tls_server_hello_x509'
Message-ID: <202302251323.rduzzPE3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   5e1d0a1c4a326be5eefbcce8c08dfd8520a46d54
commit: 5e1d0a1c4a326be5eefbcce8c08dfd8520a46d54 [18/18] SUNRPC: Support TLS handshake in the server-side TCP socket code
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230225/202302251323.rduzzPE3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=5e1d0a1c4a326be5eefbcce8c08dfd8520a46d54
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 5e1d0a1c4a326be5eefbcce8c08dfd8520a46d54
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251323.rduzzPE3-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: net/sunrpc/xprtsock.o: in function `xs_reset_transport':
   xprtsock.c:(.text+0x1264): undefined reference to `tls_handshake_cancel'
   m68k-linux-ld: net/sunrpc/xprtsock.o: in function `xs_tls_connect':
   xprtsock.c:(.text+0x267a): undefined reference to `tls_client_hello_anon'
   m68k-linux-ld: xprtsock.c:(.text+0x26ca): undefined reference to `tls_client_hello_x509'
   m68k-linux-ld: xprtsock.c:(.text+0x26ee): undefined reference to `tls_handshake_cancel'
   m68k-linux-ld: net/sunrpc/svcsock.o: in function `svc_tcp_handshake':
>> svcsock.c:(.text+0x4d0): undefined reference to `tls_server_hello_x509'
>> m68k-linux-ld: svcsock.c:(.text+0x4f4): undefined reference to `tls_handshake_cancel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
