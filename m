Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0791C39
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 07:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678434329; x=1709970329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hkKXwLcRiLiRVFZvph24bGQal1WVsUQ7fSTQrj7/y38=;
  b=Cwd4x+K2eICrPzMXfQLpmgNG6j8YNf+z9yNWvGQlczWE9dY9Nxq0bab8
   zExkG7Ifn+ys/oFiH+GTjVJd/VLrBC7Ty5O8/QqDRWOXqE065BNljHw+G
   IybsgRyeneNfD0qov3pXvKdnqBjbluA3GeJyLjG5jsQZL0SgTdFIG4AGd
   u6Jx06HvycQxRhU8TwaW4cTQxlVeemwH1to3Tty3KcAht57jsW2+nwa1M
   PW92oDU2dinynDRYt1mrnCCZWVbnLqRjvvg65KFwb6LI3e9trnNKv9Tog
   ar9DWKB/QVs2XgCovYKzrENcfMoTfIkiHF0x58xkh5nrc8/s95YVHLJx3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316324092"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="316324092"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 23:45:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627715523"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="627715523"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Mar 2023 23:45:08 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paXR5-0003d5-2b;
	Fri, 10 Mar 2023 07:45:07 +0000
Date: Fri, 10 Mar 2023 15:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:upcall-v7 12/19] loongarch64-linux-ld: xprtsock.c:undefined
 reference to `tls_client_hello_anon'
Message-ID: <202303101546.NYCKGVV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux upcall-v7
head:   caa52379f0046e974fd16585dd7ede624699d8e2
commit: 3a513f8aadf250af220bcc904a0d72f675545927 [12/19] SUNRPC: Add RPC-with-TLS support to xprtsock.c
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230310/202303101546.NYCKGVV2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=3a513f8aadf250af220bcc904a0d72f675545927
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel upcall-v7
        git checkout 3a513f8aadf250af220bcc904a0d72f675545927
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101546.NYCKGVV2-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: net/sunrpc/xprtsock.o: in function `xs_tls_handshake_sync':
   xprtsock.c:(.text+0x8d0): undefined reference to `tls_client_hello_x509'
>> loongarch64-linux-ld: xprtsock.c:(.text+0x958): undefined reference to `tls_client_hello_anon'
>> loongarch64-linux-ld: xprtsock.c:(.text+0x974): undefined reference to `tls_handshake_cancel'
   loongarch64-linux-ld: net/sunrpc/xprtsock.o: in function `.L103':
   xprtsock.c:(.text+0xb40): undefined reference to `tls_handshake_cancel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
