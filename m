Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5862F32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 22:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678487612; x=1710023612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pWtOuITaDOWC07TbLa4wJIHLUcCcsZty7UYh6lH03So=;
  b=amHs05H8QeE3VwoE7O43KryJ9ckiCX+cRsZzWi/PFcgEg3mdbZG+cE89
   B3LFCQxruYBeNt48fPhKPWBTWUobPamoCxNLlniJxMGVx0j3tnM1MkXXz
   RFTkwP/9xIB7j0STLtzKT4gEV489Hcsn+c+2VYOb2wpXFqOoCShai45gl
   1PFX+ikFQaItprnYoqJlpEOlnqhHLbKGEDYjQRykXpvmRSf6UBMYSBruO
   xPF1fwRFjZzr3ZCtOjo1tWrma/cExxsaAJGHJ+JPK+Ws0/FW4Qwk6Tqnv
   vuOo4yE28wvzdmO3tvjEWaXfphf3AxcPrcOdQ1Hyilhnnj2vfFsZqReCW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="399442697"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="399442697"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 14:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="923829347"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="923829347"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 14:33:30 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1palIo-00048T-0m;
	Fri, 10 Mar 2023 22:33:30 +0000
Date: Sat, 11 Mar 2023 06:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/pipe-list 30/30]
 crypto/algif_skcipher.c:197:10: error: 'struct proto_ops' has no member
 named 'sendpage'
Message-ID: <202303110620.m9RqsHYS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/pipe-list
head:   e76345d9b0b65f673fbee4ce5c3ef8450e89638e
commit: e76345d9b0b65f673fbee4ce5c3ef8450e89638e [30/30] sock: Remove ->sendpage*() in favour of sendmsg(MSG_SPLICE_PAGES)
config: mips-randconfig-r006-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110620.m9RqsHYS-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e76345d9b0b65f673fbee4ce5c3ef8450e89638e
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/pipe-list
        git checkout e76345d9b0b65f673fbee4ce5c3ef8450e89638e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash crypto/ net/unix/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110620.m9RqsHYS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/algif_skcipher.c:197:10: error: 'struct proto_ops' has no member named 'sendpage'
     197 |         .sendpage       =       af_alg_sendpage,
         |          ^~~~~~~~
>> crypto/algif_skcipher.c:197:33: error: initialization of 'int (*)(struct socket *, struct msghdr *, size_t,  int)' {aka 'int (*)(struct socket *, struct msghdr *, unsigned int,  int)'} from incompatible pointer type 'ssize_t (*)(struct socket *, struct page *, int,  size_t,  int)' {aka 'int (*)(struct socket *, struct page *, int,  unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     197 |         .sendpage       =       af_alg_sendpage,
         |                                 ^~~~~~~~~~~~~~~
   crypto/algif_skcipher.c:197:33: note: (near initialization for 'algif_skcipher_ops.recvmsg')
   crypto/algif_skcipher.c:198:33: warning: initialized field overwritten [-Woverride-init]
     198 |         .recvmsg        =       skcipher_recvmsg,
         |                                 ^~~~~~~~~~~~~~~~
   crypto/algif_skcipher.c:198:33: note: (near initialization for 'algif_skcipher_ops.recvmsg')
   crypto/algif_skcipher.c:288:10: error: 'struct proto_ops' has no member named 'sendpage'
     288 |         .sendpage       =       skcipher_sendpage_nokey,
         |          ^~~~~~~~
   crypto/algif_skcipher.c:288:33: error: initialization of 'int (*)(struct socket *, struct msghdr *, size_t,  int)' {aka 'int (*)(struct socket *, struct msghdr *, unsigned int,  int)'} from incompatible pointer type 'ssize_t (*)(struct socket *, struct page *, int,  size_t,  int)' {aka 'int (*)(struct socket *, struct page *, int,  unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     288 |         .sendpage       =       skcipher_sendpage_nokey,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/algif_skcipher.c:288:33: note: (near initialization for 'algif_skcipher_ops_nokey.recvmsg')
   crypto/algif_skcipher.c:289:33: warning: initialized field overwritten [-Woverride-init]
     289 |         .recvmsg        =       skcipher_recvmsg_nokey,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   crypto/algif_skcipher.c:289:33: note: (near initialization for 'algif_skcipher_ops_nokey.recvmsg')
   cc1: some warnings being treated as errors
--
>> net/unix/af_unix.c:855:10: error: 'const struct proto_ops' has no member named 'sendpage'
     855 |         .sendpage =     unix_stream_sendpage,
         |          ^~~~~~~~
>> net/unix/af_unix.c:855:25: error: initialization of 'ssize_t (*)(struct socket *, loff_t *, struct pipe_inode_info *, size_t,  unsigned int)' {aka 'int (*)(struct socket *, long long int *, struct pipe_inode_info *, unsigned int,  unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct socket *, struct page *, int,  size_t,  int)' {aka 'int (*)(struct socket *, struct page *, int,  unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     855 |         .sendpage =     unix_stream_sendpage,
         |                         ^~~~~~~~~~~~~~~~~~~~
   net/unix/af_unix.c:855:25: note: (near initialization for 'unix_stream_ops.splice_read')
   net/unix/af_unix.c:856:25: warning: initialized field overwritten [-Woverride-init]
     856 |         .splice_read =  unix_stream_splice_read,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   net/unix/af_unix.c:856:25: note: (near initialization for 'unix_stream_ops.splice_read')
   cc1: some warnings being treated as errors


vim +197 crypto/algif_skcipher.c

8ff590903d5fc7 Herbert Xu      2010-10-19  181  
8ff590903d5fc7 Herbert Xu      2010-10-19  182  static struct proto_ops algif_skcipher_ops = {
8ff590903d5fc7 Herbert Xu      2010-10-19  183  	.family		=	PF_ALG,
8ff590903d5fc7 Herbert Xu      2010-10-19  184  
8ff590903d5fc7 Herbert Xu      2010-10-19  185  	.connect	=	sock_no_connect,
8ff590903d5fc7 Herbert Xu      2010-10-19  186  	.socketpair	=	sock_no_socketpair,
8ff590903d5fc7 Herbert Xu      2010-10-19  187  	.getname	=	sock_no_getname,
8ff590903d5fc7 Herbert Xu      2010-10-19  188  	.ioctl		=	sock_no_ioctl,
8ff590903d5fc7 Herbert Xu      2010-10-19  189  	.listen		=	sock_no_listen,
8ff590903d5fc7 Herbert Xu      2010-10-19  190  	.shutdown	=	sock_no_shutdown,
8ff590903d5fc7 Herbert Xu      2010-10-19  191  	.mmap		=	sock_no_mmap,
8ff590903d5fc7 Herbert Xu      2010-10-19  192  	.bind		=	sock_no_bind,
8ff590903d5fc7 Herbert Xu      2010-10-19  193  	.accept		=	sock_no_accept,
8ff590903d5fc7 Herbert Xu      2010-10-19  194  
8ff590903d5fc7 Herbert Xu      2010-10-19  195  	.release	=	af_alg_release,
8ff590903d5fc7 Herbert Xu      2010-10-19  196  	.sendmsg	=	skcipher_sendmsg,
2d97591ef43d05 Stephan Mueller 2017-08-02 @197  	.sendpage	=	af_alg_sendpage,
8ff590903d5fc7 Herbert Xu      2010-10-19  198  	.recvmsg	=	skcipher_recvmsg,
a11e1d432b51f6 Linus Torvalds  2018-06-28  199  	.poll		=	af_alg_poll,
8ff590903d5fc7 Herbert Xu      2010-10-19  200  };
8ff590903d5fc7 Herbert Xu      2010-10-19  201  

:::::: The code at line 197 was first introduced by commit
:::::: 2d97591ef43d0587be22ad1b0d758d6df4999a0b crypto: af_alg - consolidation of duplicate code

:::::: TO: Stephan Mueller <smueller@chronox.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
