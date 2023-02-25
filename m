Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA6D30A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 03:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677295637; x=1708831637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iOWbgETYc8vO9h2T4IX7Mwu2SrlK81rC1smnDmiTcIY=;
  b=E3Vl+s+sgg4EOVsEdIHbtftuJg3ROAhhE66K35tqYIkuvwcRTHukcMM1
   np9nvkDOfNLytMF4Els3GifvgIRG7otW34SNsec9Kud3NY/YzRwdn0GEW
   H0DxrAQf79UsuLNNCugwHPXI4IwS8emc5X17XGDKvcWaoo4CSTaQTwFim
   fmpPw2PcBsx0bTT3IIwEPS6t2Klq95j2hSNBwlUwJuvg1Z8LVzXzprM8g
   UcppJM1ZwpyByA2CIrUXC29uvziCQClhHDKJg2qu3fMjWSZjxev6vVL0u
   neA/NYgU2hhOVg8b5/TKT6xfqrU8lh7qu3NFRrvjG8KXOm5FZROUez7f2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335060351"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="335060351"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 19:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="666358155"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="666358155"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Feb 2023 19:27:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVlDP-0002sZ-1F;
	Sat, 25 Feb 2023 03:27:15 +0000
Date: Sat, 25 Feb 2023 11:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-rpc-with-tls-upcall 11/18] xprtsock.c:undefined reference
 to `tls_handshake_cancel'
Message-ID: <202302251133.AppxFt0N-lkp@intel.com>
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
commit: 568a4556979ee8fc231f8f8b11372b5bec41b0e7 [11/18] SUNRPC: Add RPC-with-TLS support to xprtsock.c
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230225/202302251133.AppxFt0N-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=568a4556979ee8fc231f8f8b11372b5bec41b0e7
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 568a4556979ee8fc231f8f8b11372b5bec41b0e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251133.AppxFt0N-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: net/sunrpc/xprtsock.o: in function `xs_reset_transport':
>> xprtsock.c:(.text+0x1264): undefined reference to `tls_handshake_cancel'
   m68k-linux-ld: net/sunrpc/xprtsock.o: in function `xs_tls_connect':
>> xprtsock.c:(.text+0x267a): undefined reference to `tls_client_hello_anon'
>> m68k-linux-ld: xprtsock.c:(.text+0x26ca): undefined reference to `tls_client_hello_x509'
>> m68k-linux-ld: xprtsock.c:(.text+0x26ee): undefined reference to `tls_handshake_cancel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
