Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2277ED2E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 04:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677301100; x=1708837100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ey/d9eHmB1ul3TB1XMVUNo3xCdnUtrFDoiBKwKqh4b4=;
  b=KnvSdBpB9ZOQuke+D5diMhkMybR9GJHgfeNgfQlkcDz3Kq93mho8fVw3
   pnb+c/f7Gco/pkX0ocmtmbl/Qv3y1LeZSNbDjy0BQ0XEoP+MQ8VOK41n0
   tdaUuOWZx7fOlCB8KJEYOAyl/vdcP1Jjtg4LEhAoPodUT1EC8lPXHVPq4
   eL8c+wJpLXBF4eW5BfkMKC4jXhHzQxKTiFC+IZg9X9jsHd0bIMqH4SSNr
   uI7LGSLJYre1Gtlrpew7OqTDdtWQ6jOyNKgv38h9xRwu1OVCtai7nW9LD
   WJYO+V7QJzKc92OGGhOYyTWUKoFm7iqlPrNGuDMqV/DhjacKWbxWKxw7W
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="321836507"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="321836507"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 20:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="703403643"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="703403643"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Feb 2023 20:58:18 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVmdV-0002w1-2s;
	Sat, 25 Feb 2023 04:58:17 +0000
Date: Sat, 25 Feb 2023 12:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-rpc-with-tls-upcall 18/18] nios2-linux-ld:
 net/sunrpc/svcsock.c:457: undefined reference to `tls_handshake_cancel'
Message-ID: <202302251200.X29Tj4LU-lkp@intel.com>
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
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230225/202302251200.X29Tj4LU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=5e1d0a1c4a326be5eefbcce8c08dfd8520a46d54
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 5e1d0a1c4a326be5eefbcce8c08dfd8520a46d54
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251200.X29Tj4LU-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: net/sunrpc/xprtsock.o: in function `xs_reset_transport':
   net/sunrpc/xprtsock.c:1256: undefined reference to `tls_handshake_cancel'
   net/sunrpc/xprtsock.c:1256:(.text+0x2bf0): relocation truncated to fit: R_NIOS2_CALL26 against `tls_handshake_cancel'
   nios2-linux-ld: net/sunrpc/svcsock.o: in function `svc_tcp_handshake':
   net/sunrpc/svcsock.c:447: undefined reference to `tls_server_hello_x509'
   net/sunrpc/svcsock.c:447:(.text+0x308): relocation truncated to fit: R_NIOS2_CALL26 against `tls_server_hello_x509'
>> nios2-linux-ld: net/sunrpc/svcsock.c:457: undefined reference to `tls_handshake_cancel'
   net/sunrpc/svcsock.c:457:(.text+0x36c): relocation truncated to fit: R_NIOS2_CALL26 against `tls_handshake_cancel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
