Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEA11DDCE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8xDxFdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698968408; x=1730504408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yR60kSmyvI+bxTdSJxrTL59ANf4gvpEZpvX/UfTdecM=;
  b=G8xDxFdC7wKoHgWGFiyZQ0A8Y/sRKig4tpEt+IUwewrTvOCzmgVE2Jtz
   So2Lkzs/Xx636KlXbr0IdY95O/vskkcZnTA27qForEHApyc60BHQTNfbW
   IGBso7vF9rWMEwxBw4kx7b0C2XmfHjjQrtOnHhUjzSGQFOyae8gbDnk2L
   gKDrLPZSaJDuMYe5fFcYV1NuxIXQiRDUQcEJBJ6s8Xqv/oiaSmIk6Y+d2
   xQ+A7J7OiJQ7CrbS3CyJiT8xNd+4qzdVDBO/JA8y1wqwwxY9IRThHBHwi
   ltYGYZhjr8T4k8YEuEorM4iGeH2FUpHLkBMKhsivMEkV5f1B80xMmGaow
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="7479808"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="7479808"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 16:40:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="765087919"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="765087919"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Nov 2023 16:40:05 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyhIA-00020s-2v;
	Thu, 02 Nov 2023 23:40:02 +0000
Date: Fri, 3 Nov 2023 07:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/ndo_peer2 4/6] include/linux/stddef.h:8:14: error: called
 object is not a function or function pointer
Message-ID: <202311030746.YllMeEVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/ndo_peer2
head:   4520680ca55ca7c62b1f520cd43641c93cb4a55a
commit: ff1a15530833e0813ac71476e30905bd5d486667 [4/6] bpf, netkit, veth: Add indirect call wrapper for ndo_get_peer_dev
config: x86_64-randconfig-012-20231103 (https://download.01.org/0day-ci/archive/20231103/202311030746.YllMeEVn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030746.YllMeEVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030746.YllMeEVn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/sock.h:62,
                    from include/linux/sock_diag.h:8,
                    from net/core/filter.c:27:
   net/core/filter.c: In function 'netdev_get_peer':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/indirect_call_wrapper.h:22:35: note: in definition of macro 'INDIRECT_CALL_2'
      22 |                 likely(f == f2) ? f2(__VA_ARGS__) :                     \
         |                                   ^~
   include/net/netkit.h:43:25: note: in expansion of macro 'NULL'
      43 | # define peer_netkit    NULL
         |                         ^~~~
   net/core/filter.c:2479:40: note: in expansion of macro 'peer_netkit'
    2479 |                                        peer_netkit, peer_veth, dev);
         |                                        ^~~~~~~~~~~
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/indirect_call_wrapper.h:18:35: note: in definition of macro 'INDIRECT_CALL_1'
      18 |                 likely(f == f1) ? f1(__VA_ARGS__) : f(__VA_ARGS__);     \
         |                                   ^~
   net/core/filter.c:2478:24: note: in expansion of macro 'INDIRECT_CALL_2'
    2478 |                 return INDIRECT_CALL_2(ops->ndo_get_peer_dev,
         |                        ^~~~~~~~~~~~~~~
   include/net/veth.h:12:25: note: in expansion of macro 'NULL'
      12 | #define peer_veth       NULL
         |                         ^~~~
   net/core/filter.c:2479:53: note: in expansion of macro 'peer_veth'
    2479 |                                        peer_netkit, peer_veth, dev);
         |                                                     ^~~~~~~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
