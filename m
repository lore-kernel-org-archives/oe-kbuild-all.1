Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436544;
	b=a+RA2cLVV/I96PLAMme3pSN1GErDH89K6FFw2+2uw5Em5LK7qAByF4BYZ509TX6W75fg
	 2l5eJskBVO0NoIjCS9/qStZtXI9Opim35qV8TF5wHVj7TyLUx8emep9km3GnLWw/s/Or9
	 kD3L6qwZWnB4iY5cB8D5FqXVtoXttTPAa+0+YxUC/22SdhVyXaXrTzxhy7F6lr3N20bnA
	 Jmx/oSC5Ds928IrkpWwBBO9584GLjHOSh9Zt1Pgck4jOGRGutUg6V0Jf6f12tyaE7wB58
	 GcCfAu4H5Brt/6ZzZ0HYSEqUW+cQ1F135oXjX0SZ8UCrLnb17K2OFxwLpdXVTzY0lxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436544;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bY8Pc3U7glbGskiCZ2uQRmwzLjkVPhUgIQG+XnK+4Vc=;
	b=vp3689d6s2HkCfxjqSU5nhfDFu/1BmgXY6A/BinkuYKh44Po8oqkS2n1e8npvukldhWy
	 97bBykKqy0YGo6aUQ9lCqSq+UNNLoBfPvp3yLkbxwQpQSQJVQJpVzUnucp0pvft4itzUR
	 NWgp3d7qYH2EBwkIAsweC3a8Jje9qI4WK1It5LNhMwY/DvU7gdMPtpeHKjKrJQAi0HqBM
	 S7BkDbPiEQpI/E1buoPBSube9urI7pi8qPVTaWOnp+kgH3P7PdTqR0aE8Y9cCRQnBv5Ex
	 C6ip5npIM3eUE7H49JYxS8PQj80pM7EM4Dvg5yi0A8963cN+XKKleQSSfcZOe06dSaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l+bYsS0x;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B30606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 08:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B30606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l+bYsS0x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793436543; x=1824972543;
  h=date:from:to:cc:subject:message-id;
  bh=P7CAaqmcY/E3zZU4iMKbFX/N7pxKWpo+3n54JOHC3u0=;
  b=l+bYsS0xGcqvPqy4qtpCgXZTxUcaiVOmNMS1hx5CZrqooqgTIA2JfvtL
   iNnZKEmLfonPrke9hHxRplxsJ7aSEvt2OasU1ZZqt49TiGDWFYx4GssHg
   sB5Rd7/u+kzTlM3tvLSU6gl+F9ynbib3TCDP4+yRDZJHdVLOVj7OYjSjS
   UC/+Ruoy9NQ8H9mZQLRWw29Y9bguv7DZuC/ftGI+QU6FdNM5IRy7lTZCX
   oE/7VsZYAECR0dgK6lSB5+thq99538zxZ5BtS1e7DGY5qgfj1vrl8oY4t
   RkqUkiCiZOG8X0tTH8YqSRDQ1JELilop7w27s1a/s5WYnEQZrlhSR3vNH
   Q==;
X-CSE-ConnectionGUID: ozXl2G/tTV60KcldOqt6Mw==
X-CSE-MsgGUID: IDnJNygYTM+qgDCyLNsznw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2284781"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2284781"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:49:03 -0700
X-CSE-ConnectionGUID: xQEOx3XQRT21U+O+vGIiTQ==
X-CSE-MsgGUID: A+31LsiCT9OPNcTtiX4d/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5653639"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2026 01:49:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN4lm-000000005w7-1nzT;
	Sat, 31 Oct 2026 08:48:58 +0000
Date: Sat, 31 Oct 2026 09:48:22 +0100
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:dense_ulong 61/80] include/linux/rcupdate.h:534:36:
 error: dereferencing pointer to incomplete type 'struct maple_enode'
Message-ID: <202610310913.bOSW5NEi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git dense_ulong
head:   15f16f9deca2a5bb8d438c9fee24947232c0d24a
commit: 1ee3a65d7aa8d04dc19b06a724597ef8dea05d55 [61/80] maple_tree: Add ENODE_NULL support
config: powerpc-randconfig-r2202-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310913.bOSW5NEi-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310913.bOSW5NEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310913.bOSW5NEi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:44,
                    from <command-line>:
   lib/maple_tree.c: In function 'cp_dst_to_slots':
>> include/linux/rcupdate.h:534:36: error: dereferencing pointer to incomplete type 'struct maple_enode'
    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                       ^~~~
   include/linux/compiler-context-analysis.h:218:2: note: in definition of macro 'context_unsafe'
     __VA_ARGS__;   \
     ^~~~~~~~~~~
   include/asm-generic/rwonce.h:61:2: note: in expansion of macro '__WRITE_ONCE'
     __WRITE_ONCE(x, val);      \
     ^~~~~~~~~~~~
   include/linux/rcupdate.h:1043:3: note: in expansion of macro 'WRITE_ONCE'
      WRITE_ONCE(p, RCU_INITIALIZER(v)); \
      ^~~~~~~~~~
   include/linux/rcupdate.h:1043:17: note: in expansion of macro 'RCU_INITIALIZER'
      WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                    ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4768:3: note: in expansion of macro 'RCU_INIT_POINTER'
      RCU_INIT_POINTER(cp->slot[d], enode);
      ^~~~~~~~~~~~~~~~


vim +534 include/linux/rcupdate.h

ca5ecddfa8fcbd Paul E. McKenney 2010-04-28  529  
462225ae47d717 Paul E. McKenney 2013-11-11  530  /**
462225ae47d717 Paul E. McKenney 2013-11-11  531   * RCU_INITIALIZER() - statically initialize an RCU-protected global variable
462225ae47d717 Paul E. McKenney 2013-11-11  532   * @v: The value to statically initialize with.
462225ae47d717 Paul E. McKenney 2013-11-11  533   */
462225ae47d717 Paul E. McKenney 2013-11-11 @534  #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
462225ae47d717 Paul E. McKenney 2013-11-11  535  

:::::: The code at line 534 was first introduced by commit
:::::: 462225ae47d7175f886281d8a91708550cd5178c rcu: Add an RCU_INITIALIZER for global RCU-protected pointers

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
